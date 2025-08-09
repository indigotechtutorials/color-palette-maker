import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';
import { post } from "@rails/request.js"

// Connects to data-controller="sortable"
export default class extends Controller {
  static values = { url: String }
  connect() {
    this.sortable = Sortable.create(this.element, {
      handle: ".handle",
      onEnd: async (e) => {
        let colorPositionUrl = e.item.getAttribute("data-url")
        await post(colorPositionUrl, {
          body: {
            position: (e.newIndex + 1)
          }
        })
      },
    })
  }
}
