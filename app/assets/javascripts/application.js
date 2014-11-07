var csrfToken = function csrfToken(){
  tag = document.querySelector("meta[name=csrf-token]")
  return tag.content
}

var ajaxUpdateStatusMessage = function ajaxUpdateStatusMessage(method, url, cb) {
  var xhr = new XMLHttpRequest()
  xhr.addEventListener("readystatechange", function(){
    if(xhr.readyState == 4) {
      var alert = document.querySelector(".alert-success")
      alert.innerHTML = xhr.responseText
      alert.classList.remove('hidden')
      cb()
    }
  })
  xhr.open(method, url)
  xhr.setRequestHeader("X-CSRF-Token", csrfToken())
  xhr.send()
}

var approveButtonHandler = function approveButtonHandler(event) {
  var post = this.parentElement.parentElement.parentElement
  var url = post.querySelector(".js-post-url").href + "/approve"
  ajaxUpdateStatusMessage("PUT", url, function(){
    post.querySelector(".btn-group").remove()
  })
}

var deleteButtonHandler = function deleteButtonHandler(event) {
  var post = this.parentElement.parentElement.parentElement
  var url = post.querySelector(".js-post-url").href
  ajaxUpdateStatusMessage("DELETE", url, function(){
    post.remove()
  })
}

window.addEventListener("load", function() {
  var approveButtons = document.querySelectorAll("button.js-approve-button")
  for(i = 0; i < approveButtons.length; i++) {
    approveButtons[i].addEventListener("click", approveButtonHandler)
  }

  var deleteButtons = document.querySelectorAll("button.js-delete-button")
  for(i = 0; i < deleteButtons.length; i++) {
    deleteButtons[i].addEventListener("click", deleteButtonHandler)
  }
})
