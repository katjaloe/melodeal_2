import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    let type = this.element.dataset.flashType;
    let message = this.element.dataset.flashMessage;

    // Auto remove the flash messages
    setTimeout(() => {
      this.element.remove();
    }, 5000);

    // Create Tostr flash messages
    toastr[type](message);
  }
}
