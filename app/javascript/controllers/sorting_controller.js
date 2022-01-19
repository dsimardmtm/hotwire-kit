import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["direction", "sort"];

  connect() {
    console.log("[Stimulus] successfully connected to the sorting_controller.js");
  }
  
  saveSort(event) {
    const url = new URL(event.detail.url);
    const newDirection = url.searchParams.get('direction');
    const newSortColumn = url.searchParams.get('sort');
    this.directionTarget.value = newDirection;
    this.sortTarget.value = newSortColumn;
  }
}