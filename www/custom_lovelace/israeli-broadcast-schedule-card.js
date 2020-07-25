class israeliBroadcastScheduleCard extends HTMLElement {
    constructor() {
        super();
        this.attachShadow({ mode: 'open' });
    }

    set hass(hass) {

    }


    setConfig(config) {
        if (!config.channel) {
            throw new Error('Please define a channel');
        }

        const root = this.shadowRoot;
        if (root.lastChild) root.removeChild(root.lastChild);
        const card = document.createElement('ha-card');
        const style = document.createElement('style');
        const content = document.createElement('div');
        const title = document.createElement("div");
        title.className = "header";
        title.style = "font-family: var(--paper-font-headline_-_font-family); -webkit-font-smoothing: var(--paper-font-headline_-_-webkit-font-smoothing); font-size: var(--paper-font-headline_-_font-size); font-weight: var(--paper-font-headline_-_font-weight); letter-spacing: var(--paper-font-headline_-_letter-spacing); line-height: var(--paper-font-headline_-_line-height); line-height: 40px; color: var(--primary-text-color); padding: 4px 0 12px; display: flex; justify-content: space-between;";
        title.innerHTML = '<div class="name">' + config.title + '</div>';
        style.textContent = `
          ha-card {
            padding: 16px;
            text-align: right;
            direction: rtl;
          }
          ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
           }        
           li a {
            display: block;
            color: #000;
            text-align: right;
            padding: 2px 0;
            text-decoration: none;
           }
           .head {
            font-weight: bold;
           }
        `;
        content.innerHTML = "בטעינה...";

        card.appendChild(style);
        if (config.title) {
            card.appendChild(title);
        }
        card.appendChild(content);
        root.appendChild(card);

        this._httpGet("https://cors-anywhere.herokuapp.com/" + this._URL(config.channel),
            function () {
                if (this.readyState === 4 && this.status === 200) {
                    let result = document.createElement('div');
                    result.innerHTML = this.responseText;

                    if (config.max) {
                        let elementList = result.querySelectorAll("li");
                        for (let i = 0; i < elementList.length; i++) {
                            if (i > config.max) {
                                result.firstChild.removeChild(elementList[i]);
                            }
                        }
                    }

                    content.innerHTML = result.innerHTML;
                }

            });
    }

    _httpGet(theUrl, onreadystatechange) {
        let xmlHttp = new XMLHttpRequest();
        xmlHttp.open("GET", theUrl, true);
        xmlHttp.send(null);
        xmlHttp.onreadystatechange = onreadystatechange
    }


    _URL(channel) {
        let now = new Date();
        let start = new Date();
        start.setHours(0,0,0);
        let diff = Math.trunc((now.getTime() - start.getTime()) / 1000 / 60 / 30); // in half hours
        return `https://www.yes.co.il/content/YesChannelsHandler.ashx?action=GetDailyShowsByDayAndChannelCode&dayValue=0&dayPartByHalfHour=${diff}&channelCode=${channel}`;
    }

    getCardSize() {
        return 1;
    }
}

customElements.define('israeli-broadcast-schedule-card', israeliBroadcastScheduleCard);