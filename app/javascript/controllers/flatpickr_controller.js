import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "startDate" ]

  connect() {
    flatpickr(this.startDateTarget, { enableTime: true, defaultHour: 18, defaultMinute: 0, inline: true})
    // flatpickr(this.startTimeTarget, {})

  }
}
