import { Controller } from "@hotwired/stimulus";
import { get } from "@rails/request.js";

export default class extends Controller {
  static values = {
    url: String,
  };

  connect() {
    console.log("[Stimulus] successfully connected to the select_controller.js");
  }

  change(event) {
    const params = new URLSearchParams();
    params.append("target", event.target.dataset.id);
    params.append("selected_value", event.target.selectedOptions[0].text);

    get(`${this.urlValue}?${params}`, {
      responseKind: "turbo-stream"
    });
  }
}