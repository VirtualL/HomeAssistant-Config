class StateAttributeElement extends HTMLElement {
  set hass(hass) {
    const entityId = this.config.entity;
    const prefix_string = this.config.prefix || ''
    const suffix_string = this.config.suffix || ''
    const show_empty = this.config.show_empty
    const attr = this.config.attribute
    const sub_attribute = this.config.sub_attribute || ''
    this.state = hass.states[entityId].attributes[attr]
    if (this.config.sub_attribute) {
      this.state = hass.states[entityId].attributes[attr][sub_attribute]
    }
    const card = document.createElement('state-attribute-element');
    if (this.state) {
      if (this.state.length != 0 || show_empty === true) {
        this.innerHTML = `${prefix_string}${this.state}${suffix_string}`
      }
    }
    else {
      this.innerHTML = 'Attribute: ' + attr + ' does not exist in entity: ' + entityId + '.'
    }
  }
  setConfig(config) {
    this.config = JSON.parse(JSON.stringify(config));
    if (!this.config.show_empty) {
      this.config.show_empty = false;
    }
  }

  getCardSize() {
    return 1;
  }
}
customElements.define('state-attribute-element', StateAttributeElement);
