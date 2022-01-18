// Libs
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("[Stimulus] successfully connected to the search_controller.js");
  }

  searchKit() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.element.requestSubmit();
    }, 500)
  }
}
