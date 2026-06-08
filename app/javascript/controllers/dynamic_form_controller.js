import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "template", "message", "container", "row" ]//, "destroy" ]

    connect() {
        add()
    }

    add() {
        const html = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime().toString())
        this.containerTarget.insertAdjacentHTML("beforeend", html)
        this.messageTarget.classList.add("hidden")
    }

    remove(e) {
        e.preventDefault()

        if (this.rowTargets.length > 1 ){
            const row = event.target.closest("[data-dynamic-form-target='row']")
            // const destroy = row.querySelector("[data-dynamic-form-target='destroy']")
            // e.target.closest("[data-dynamic-form-target='fields-for.fields']").style = "display: none;"
            // if(row.hasAttribute("data-persisted")) {
            //     destroy.value = "1"
            //     row.hidden = true
            // } else {
                row.remove()
            // }
        } else {
            this.messageTarget.classList.remove("hidden")
        }
        console.log("rowTargets:")
        console.log(this.rowTargets)

    }
}
