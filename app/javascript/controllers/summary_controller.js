import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "name", "output" ];

  connect() {
    console.log("[Stimulus] successfully connected to the summary_controller.js");
  }

  nameTargetConnected() {
      console.log("[Stimulus] Name target connected summary_controller.js");
    }

  outputTargetConnected() {
      console.log("[Stimulus] Output target connected summary_controller.js");
    }

  printName() {
    this.outputTarget.textContent = this.nameTarget.value;
  }
}