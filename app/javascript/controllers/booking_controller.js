import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking"
export default class extends Controller {
  connect() {
    console.log("Hello from the booking controller")
    localStorage.setItem = JSON.stringify({package_id: "161"});
    var package_id = localStorage.getItem(package_id);
  }
}


// localStorage.setItem("name", "Lorem Ipsum");
// document.getElementById('input').value = localStorage.getItem("name");
// var answer = loclStorage.key(1);\
