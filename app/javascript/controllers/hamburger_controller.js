import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["menu"]

    connect() {
        // ドキュメントクリック時にメニューを閉じる
        document.addEventListener("click", this.closeMenuOnOutsideClick.bind(this))
    }

    disconnect() {
        document.removeEventListener("click", this.closeMenuOnOutsideClick.bind(this))
    }

    toggle(event) {
        event.stopPropagation()
        const menu = document.getElementById("customDropdownMenu")
        menu.classList.toggle("show")
    }

    closeMenuOnOutsideClick(event) {
        const menu = document.getElementById("customDropdownMenu")
        const button = document.getElementById("hamburgerMenuButton")

        if (!menu.contains(event.target) && !button.contains(event.target)) {
            menu.classList.remove("show")
        }
    }
}