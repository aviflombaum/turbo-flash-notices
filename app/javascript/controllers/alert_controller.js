import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="alert"
export default class extends Controller {
  connect() {}

  remove() {
    this.element.addEventListener(
      "animationend",
      () => {
        this.element.remove();
      },
      { once: true }
    );

    this.element.classList.add("transition", "ease-in", "duration-100", "opacity-0");
  }
}
