document.addEventListener('DOMContentLoaded', () => {
  const linksWithMethods = document.querySelectorAll('[data-method]')
  
  if(linksWithMethods.length > 0){
    linksWithMethods.forEach(link => {
      link.addEventListener('click', async (e) => {
        e.preventDefault()
        
        const method = e.target.dataset.method
        const href = e.target.href
        const response = await fetch(href, { method })
    
        if(response.redirected){
          location.replace(response.url)
        }
      })
    })
  }
})