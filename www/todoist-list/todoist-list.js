class TodoistList extends HTMLElement {
  set hass(hass) {
    if (!this.content) {
      const card = document.createElement('ha-card');
      card.header = this.config.title;
      this.content = document.createElement('div');
      this.content.style.padding = '0 16px 16px';
      card.appendChild(this.content);
      this.appendChild(card);
    }

    const entityId = this.config.entity;
    const state = hass.states[entityId];
    const withCommas = hass.states[entityId].attributes.all_tasks;
    
    var splitted = withCommas.toString().split(",");
    var i = 0;
    
    const stateStr = state ? state.state : 'unavailable';

    this.content.innerHTML = `
      <ul>
      `;
      for(i=0; i<splitted.length;i++){
        this.content.innerHTML += `
        <li>${splitted[i]}</li>
    `;
    }
    this.content.innerHTML += `
      </ul>
    `;
  }

  setConfig(config) {
    if (!config.entity) {
      throw new Error('You need to define an entity');
    }
    this.config = config;
  }

  // The height of your card. Home Assistant uses this to automatically
  // distribute all cards over the available columns.
  getCardSize() {
    return 3;
  }
}

customElements.define('todoist-list', TodoistList);