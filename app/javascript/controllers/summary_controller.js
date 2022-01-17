import { Controller } from "stimulus";

export default class extends Controller {
  // static targets = ["output" ];
  // static targets = [ "name", "output" ];

  connect() {
    console.log("[Stimulus] successfully connected to the summary_controller.js");
  }

  // printName() {
  //   this.outputTarget.textContent = this.nameTarget.value;
  // }
}