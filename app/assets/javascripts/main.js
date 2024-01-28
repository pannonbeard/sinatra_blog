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

  let password = document.getElementById("password"), 
  confirm_password = document.getElementById("confirm_password");

  console.log(password)
  console.log(confirm_password)

  function validatePassword(){
    if(password.value != confirm_password.value) {
      confirm_password.setCustomValidity("Passwords Don't Match");
    } else {
      confirm_password.setCustomValidity('');
    }
  }

  if(password && confirm_password){
    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
  }
})