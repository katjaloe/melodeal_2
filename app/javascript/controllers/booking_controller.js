import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking"
export default class extends Controller {
  static targets = ["input"]

  pushButton({params}){
    this.inputTarget.value = params.package
  }
}
