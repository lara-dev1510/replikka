import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';

export default class extends Controller {
  connect() {
    const swiper = new Swiper(this.element, {
      slidesPerView: 3,
      spaceBetween: 10,
      freeMode: true,
      pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      });
      console.log(swiper);
  }
}

// const swiper = new Swiper(this.element, {
//   effect: "cards",
//   grabCursor: true,
//   loop: true
// });
