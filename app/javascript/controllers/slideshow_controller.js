// Lib
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "slide" ];
  static values = { index: { type: Number, default: 0 } };
  static classes = [ "hidden" ];

  // Custom methods
  showCurrentSlide() {
    this.slideTargets.forEach((element, index) => {
      index !== this.indexValue ? element.classList.add(this.hiddenClass) : element.classList.remove(this.hiddenClass);
    });
  }

  next() {
    this.indexValue = (this.indexValue + 1)  % 4;
  }

  previous() {
    this.indexValue = (this.indexValue - 1 + 4)  % 4;
  }

  connect() {
    console.log("connect");
  }

  indexValueChanged() {
    this.showCurrentSlide();
  }
}