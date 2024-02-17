import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toast"
export default class extends Controller {
  static values = ["delay"];

  connect() {
    this.hasDelayValue ? (this.delay = this.delayValue) : (this.delay = 4000);

    this.element.classList.add(
      "translate-y-2",
      "opacity-0",
      "sm:translate-y-0",
      "sm:translate-x-2"
    );
    setTimeout(() => {
      this.element.classList.remove(
        "translate-y-2",
        "opacity-0",
        "sm:translate-y-0",
        "sm:translate-x-2"
      );
      this.element.classList.add(
        "transform",
        "ease-out",
        "transition",
        "duration-300",
        "translate-y-0",
        "opacity-100",
        "sm:translate-x-0"
      );
    }, 100);
    setTimeout(() => {
      this.remove();
    }, this.delay);
  }

  remove() {
    this.element.classList.remove(
      "transform",
      "ease-out",
      "transition",
      "duration-300",
      "translate-y-0",
      "opacity-100",
      "sm:translate-x-0"
    );
    this.element.classList.add("opacity-0");

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
