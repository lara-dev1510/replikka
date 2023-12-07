import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';

export default class extends Controller {
  static values = {
    slidesPerView: { type: Number, default: 3 },
    loop: { type: Boolean, default: false }
  }

  connect() {
    const swiper = new Swiper(this.element, {
      // slidesPerView: this.slidesPerViewValue,
      // spaceBetween: 1,
      // freeMode: true,
      loop: true,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  }
}
