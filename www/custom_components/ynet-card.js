class ynetCard extends HTMLElement {
    constructor() {
        super();
        this.attachShadow({ mode: 'open' });
    }

    set hass(hass) {

    }

    setConfig(config) {
        const english = config.language && config.language.toLocaleLowerCase() === "english";

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
            text-align: ${english ? "left" : "right"};
            direction: ${english ? "ltr" : "rtl"};
          }
          table {
            background-color: var(--paper-card-background-color);
          }
          A.tickerTextA:hover {
                color: #000!important;;
            }
         #aTicker {
             position: relative!important;;
           }
           #bTicker {
             display: none!important;;
           }
        `;
        content.innerHTML = english ? "Loading..." : "בטעינה...";

        card.appendChild(style);
        if (config.title) {
            card.appendChild(title);
        }
        card.appendChild(content);
        root.appendChild(card);

        let url = "https://www.ynet.co.il/Ext/Comp/Ticker/JS_Ticker_Data/0,13760,L-184,00.html";
        let enUrl = "https://www.ynetnews.com/Ext/Comp/Ticker/JS_Ticker_Data/0,13760,L-3089,00.html";
        this._httpGet("https://ashery.me/lovelace-cards/index.php?url=" + encodeURIComponent(english ? enUrl : url),
            function () {
                if (this.readyState === 4 && this.status === 200) {
                    let result = document.createElement('div');
                    result.innerHTML = this.responseText.replace("onMouseOver='Tck_stopRoll()' onMouseOut='Tck_startRoll()'", "");

                    if (config.max) {
                        let elementList = result.querySelectorAll("tr");
                        if (elementList.length > config.max * 3) {
                            for (let i = elementList.length-1; i >= 0; i--) {
                                if ((config.max * 3) -1 <= i) {
                                    elementList[i].parentNode.removeChild(elementList[i]);
                                }
                            }
                        }
                    }

                    for (let i = 0; i < result.querySelectorAll("a").length; i++) {
                        result.querySelectorAll("a")[i].removeAttribute("href")
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

    getCardSize() {
        return 1;
    }
}

customElements.define('ynet-card', ynetCard);