csrfToken = function csrfToken(){
  tag = document.querySelector("meta[name=csrf-token]")
  return tag.content
}

ajaxUpdateStatusMessage = function ajaxUpdateStatusMessage(method, url, cb) {
  xhr = new XMLHttpRequest()
  xhr.addEventListener("readystatechange", function(){
    if(xhr.readyState == 4) {
      alert = document.querySelector(".alert-success")
      alert.innerHTML = xhr.responseText
      alert.classList.remove('hidden')
      cb()
    }
  })
  xhr.open(method, url)
  xhr.setRequestHeader("X-CSRF-Token", csrfToken())
  xhr.send()
}

approveButtonHandler = function approveButtonHandler(event) {
  post = this.parentElement.parentElement.parentElement
  url = post.querySelector(".js-post-url").href + "/approve"
  that = this
  ajaxUpdateStatusMessage("PUT", url, function(){
    post.querySelector(".btn-group").remove()
  })
}

deleteButtonHandler = function deleteButtonHandler(event) {
  post = this.parentElement.parentElement.parentElement
  url = post.querySelector(".js-post-url").href
  ajaxUpdateStatusMessage("DELETE", url, function(){
    post.remove()
  })
}

window.addEventListener("load", function() {
  approveButtons = document.querySelectorAll("button.js-approve-button")
  for(i = 0; i < approveButtons.length; i++) {
    approveButtons[i].addEventListener("click", approveButtonHandler)
  }

  deleteButtons = document.querySelectorAll("button.js-delete-button")
  for(i = 0; i < deleteButtons.length; i++) {
    deleteButtons[i].addEventListener("click", deleteButtonHandler)
  }
})
;
