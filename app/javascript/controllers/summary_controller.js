import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "name", "output", "fieldToReset" ];

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

  // Could replace this method with a turbo_stream 
  // in the def create end method in the rails controller when the save is successful
  resetInputs(event) {
    const { detail: { success } } = event;
    if (success) {
      this.fieldToResetTargets.forEach(target => target.innerHTML = "");
    }
  }
}