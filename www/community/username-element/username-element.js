class UsernameElement extends HTMLElement {
  set hass(hass) {this.innerHTML = hass.user.name;}
  getCardSize() {return 1;}
  setConfig(config) {}
}
customElements.define('username-element', UsernameElement);