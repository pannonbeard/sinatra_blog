document.addEventListener('DOMContentLoaded', () => {
  document.querySelector('[data-method]').addEventListener('click', async (e) => {
    e.preventDefault()
    
    const method = e.target.dataset.method
    const href = e.target.href
    const response = await fetch(href, { method })

    if(response.redirected){
      location.replace(response.url)
    }
  })
})