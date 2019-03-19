# Home Assistant-Configuration VirtualL
Hello, This is my [Home Assistant](https://home-assistant.io/) configuration.
I have installed HA on a PC Server with [UNRAID](https://unraid.net/) (OS letting you configure your system using any combination of applications, storage devices, and hardware, using docker containers, Plugins and Virtual machines)
I am currently running HA on [Docker](https://www.docker.com) [Container](https://hub.docker.com/r/homeassistant/home-assistant) -Which is currently is the most recommended way in my opinion.

*(All the config will work as well with [Raspberry Pi 3 B+](https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/), on [Hassbian](https://www.home-assistant.io/docs/installation/hassbian/installation/)  OR [PROXMOX](https://www.proxmox.com/en/downloads) OS with [Ubuntu Server 18.10](https://www.ubuntu.com/download/server) as Virtual Machine)- Except from custom scripts which I added an example that is suitable for these systems*

I regularly update my configuration files.
If you like anything here, Be sure to star my repo! Or consider making a donation

## Information
|  [![Paypal](https://img.shields.io/badge/Donate-Paypal-3b7bbf.svg?logo=paypal&longCache=true&style=for-the-badge)](https://www.paypal.me/VirtualL123) [![buymeacoffee](https://img.shields.io/badge/Donate-Buy--Me--a--Coffee-F7D606.svg?logo=coffeescript&longCache=true&style=for-the-badge)](https://www.buymeacoffee.com/VirtualL) | [![LastCommit](https://img.shields.io/github/last-commit/VirtualL/HomeAssistant-Config.svg?style=for-the-badge)](https://github.com/VirtualL/HomeAssistant-Config/commits/master)|
|:---:|:---:|
| Running Perfectly at [Home Assistant](.HA_VERSION) 0.89.2, iOS 12.1.4, MacOS Mojave 10.14.3 with Browsers: Chrome and Safari Latest (And probably in later versions)| This shows how up to date this repo is |
| [![GitHub stars](https://img.shields.io/github/stars/VirtualL/HomeAssistant-Config.svg?style=for-the-badge)](https://github.com/VirtualL/HomeAssistant-Config/stargazers) | [![GitHub issues](https://img.shields.io/github/issues/VirtualL/HomeAssistant-Config.svg?style=for-the-badge)](https://github.com/VirtualL/HomeAssistant-Config/issues) |
| Please :star: this repo if you find it useful as these people have. | This is like my TODO list, feel free to open issues if you see something unclear or you have bugs |
|[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg?style=for-the-badge)](http://unlicense.org/)| [![contributions welcome](https://img.shields.io/badge/contributions-welcome-blue.svg?style=for-the-badge)](https://github.com/VirtualL/HomeAssistant-Config/pulls) |
| This tells you can use anything you like from this repo for your project. | If you have any ideas, they're always welcome.  Either submit an issue or a PR or send me a message! |


## Software and Devices
Using Ubiquiti [EdgeRouter-X-SFP](https://www.ui.com/edgemax/edgerouter-x-sfp/) and DDNS, Which is routed through [Cloudflare](https://www.cloudflare.com/) for faster access with CDN, Cache, Analytics, Avoid DDoS attacks and of course more security :)
On my Server - [NGINX](https://nginx.org/en/) to act as a proxy for Home Assistant, and others platforms in my System.
and a [Let's Encrypt](https://letsencrypt.org/) to make the connections encrypted via SSL.
### Voice Assistants:
The 3 Most Major Voice Assistant is working here!

**Siri**- Working  Without flaws with the [Built-in HomeKit Component](https://www.home-assistant.io/components/homekit/) The only one (for now) that **support Hebrew!** Another alternative to install Homekit is [Homebridge ](https://github.com/nfarina/homebridge)

**Alexa**- The fun part, first I try to use the [Home Assistant Cloud](https://www.home-assistant.io/components/cloud/) But, it was doing a lot of problems,
So I made an [Alexa Skill](https://developer.amazon.com/alexa-skills-kit) using [Haaska v3](https://github.com/mike-grant/haaska/)  , Amazon developer accuont, [AWS Lambda](https://aws.amazon.com/lambda/) and of course the [HA API](https://www.home-assistant.io/components/api/)  so now everyting working excellent, and without the [monthly payment](https://www.nabucasa.com/config/).

**Google Assistant**-  Working with the [HA Google Assistant component](https://www.home-assistant.io/components/google_assistant/#first-time-setup) setup is similar but easier then alexa, also and without monthly payment.

### Devices:
All this devices are working perfectly at my Home-Automation System.
before you start, make sure the device you want to buy have a [Component](https://www.home-assistant.io/components/) OR buit-in API support to integrate into Home-Assistant with [RESTful](https://www.home-assistant.io/components/#search/restful)/[Command line](https://www.home-assistant.io/components/#search/command%20line)/[IFTTT](https://www.home-assistant.io/components/ifttt)/[MQTT](https://www.home-assistant.io/components/#search/MQTT)

[Ubiquiti Access Point AP-AC-LR](https://www.ui.com/unifi/unifi-ap-ac-lr/)

With [Unifi Controller Container](https://hub.docker.com/r/linuxserver/unifi/) for better Wi-Fi Connectivity,reliability,security and [presence-detection](https://www.home-assistant.io/components/device_tracker.unifi_direct/)

<img src=extras/pictures/Ubiquiti_ap_ac_lr.png width="150">

[Xiaomi Smart Home Multifunctional Gateway Alarm System](https://www.gearbest.com/alarm-systems/pp_345588.html)

<img src=extras/pictures/XiaomiSmartHomeKitMijia.jpg width="150">


Products connected to Gateway:

4X [Aqara Smart Wireless Switch](https://www.gearbest.com/access-control/pp_626695.html?wid=1433363) [(link2)](https://www.gearbest.com/smart-light-bulb/pp_257679.html?wid=1433363)

[Xiaomi Temperature and Humidity Sensor](https://www.gearbest.com/living-appliances/pp_344665.html?wid=1433363)

3X [Xiaomi Smart Door and Windows Sensor](https://www.gearbest.com/smart-light-bulb/pp_257677.html?wid=1433363)

[Xiaomi Smart IR Human Body Sensor](https://www.gearbest.com/smart-light-bulb/pp_257678.html?wid=1433363)

2X[Aqara Smart Light Switch Wireless](https://www.gearbest.com/alarm-systems/pp_610095.html?wid=1433363) 

<img src=extras/pictures/XiaomiAqaraWallSwitchZigbee.jpg width="150">

### Other products:
#### Climate:
[Sensibo Sky](https://sensibo.com/products/sensibo-sky) - Highly recommended!

<img src=extras/pictures/SensiboSky.png width=“150” height="150">

#### Power Switches:

[Xiaomi Wifi Remote Control Outlet Power Strip](https://www.gearbest.com/electronics-gadgets/pp_310701.html?wid=1433363) 

<img src=extras/pictures/XiaomiMiSmartPowerStripWiFi.jpg width="150">

[Sonoff Basic](https://www.itead.cc/smart-home/sonoff-wifi-wireless-switch.html) * 

<img src=extras/pictures/SonoffBasic.jpg width="150">

[Sonoff POW](https://www.itead.cc/smart-home/sonoff-pow.html) * 

<img src=extras/pictures/SonoffPOW.jpg width="150">

[Blitzwolf BW-SHP2](https://www.blitzwolf.com/Wifi-Smart-Socket-EU-p-244.html) * 

<img src=extras/pictures/BW-SHP2.jpg width="150">

#### Lights:

[Wall Switch-Sonoff Touch EU (without RF)](https://www.itead.cc/smart-home/sonoff-touch.html)/[Sonoff T1 EU](https://www.itead.cc/sonoff-t1-eu.html) * 

<img src=extras/pictures/SonoffTouchEU.jpg width="150">

[Xiaomi Philips Smart Bulb](https://www.gearbest.com/smart-lighting/pp_644095.html?wid=1433363) 

<img src="extras/pictures/XiaomiPhilipsSmartBulb.jpg" width="150">

[Xiaomi Mijia MJTD01YL Smart LED Desk Lamp](https://www.gearbest.com/table-lamps/pp_363779.html?wid=1433363) 

<img src=extras/pictures/XiaomiMijiaDeskLamp.jpg width="150">

[Xiaomi Yeelight E27 YLDP02YL RGBW Bulb](https://www.gearbest.com/smart-lighting/pp_361555.html?wid=1433363) 

<img src=extras/pictures/XiaomiE27RGBWBulb.jpg width="150">

[Xiaomi Yeelight  E27 White Bulb](https://www.gearbest.com/smart-light-bulb/pp_278478.html?wid=1527929) 

<img src=extras/pictures/XiaomiE27WhiteBulb.jpg width="150">

*[The new models](https://www.gearbest.com/led-lights-flashlights-new/pp_009360019298.html?wid=1433363) are slightly better.

[Sonoff Basic](https://www.itead.cc/smart-home/sonoff-wifi-wireless-switch.html) * - inside the light fixture :)

#### Voice Control:
Siri-via iPhone , Apple Watch, iPad and MacOS 

<img src=extras/pictures/apple-siri.png width="150">

Alexa-via [Echo Dot](https://www.amazon.com/Amazon-Echo-Dot-Portable-Bluetooth-Speaker-with-Alexa-Black/dp/B01DFKC2SO) 

<img src=extras/pictures/EchoDot.jpg width="150">

Google Assistant- Via [Google Home Mini](https://store.google.com/us/product/google_home_mini?hl=en-US) 

<img src=extras/pictures/Google_home_mini.png width="150"> 

#### General Control (TV,Air-Conditioner,Satellite Box and any IR device):
[Apple iPad](https://www.apple.com/ipad/) -To control everyting on fly, [remotely acsess to HomeKit](https://support.apple.com/en-us/HT207057) , and more! 

iOS Devices for controll all the Smart Home with the [HA officel App](https://itunes.apple.com/us/app/home-assistant-companion/id1099568401?mt=8)-With a much more varied and changeable [Notifications](https://www.home-assistant.io/docs/ecosystem/ios/) than the rest! (more info at the Pictures)

[Apple TV (4th generation)](https://www.apple.com/shop/buy-tv/apple-tv/apple-tv-32gb)-To Control Home assistant with Siri and HomeKit outside the local network 

<img src=extras/pictures/AppleTv4gen.jpg width="150">

[Broadlink RM Pro IR + RF Remote Controller](https://www.gearbest.com/smart-home-controls/pp_255607.html?wid=1433363) -Control TV,AC or anything have IR / RF receiver.

<img src=extras/pictures/BroadlinkRMPro.png width="180" height="150">

Boiler Controll: [Sonoff POW](https://www.itead.cc/smart-home/sonoff-pow.html) *


Android TV BOX-[Partner TV](https://sites.google.com/view/droid-tv/pay-tv-provider/partner-tv) -Great For on Screen Notifactions Via [Notifications for Android TV](https://play.google.com/store/apps/details?id=de.cyberdream.androidtv.notifications.google) 

<img src=extras/pictures/PartnerTVAndroidTV.jpg width="150">

[BlueIris](http://blueirissoftware.com/)-The best video surveillance software with endless possibilities.

And of course some cameras that support [ONVIF](https://www.home-assistant.io/components/camera.onvif/) Protocol 

**ALL THE SONOFF and the Blitzwolf Devices Are been Changed to a Custom Frimware With [TASMOTA](https://github.com/arendst/Sonoff-Tasmota) to enable MQTT support for better integration at HA.*

*All Devices are Working at 220-240V Europe electrical power.(Israel) (most of then are 120-240V )*

*Was using Asus [RT-AC66U](https://www.asus.com/us/Networking/RTAC66U/) Router with custom firmware [Asuswrt-Merlin](https://asuswrt.lostrealm.ca/) and [DNS-O-Matic](https://dnsomatic.com) - Worked Really good!

**Localization-All my Project has been localized to Hebrew  -But all the Code are Readable in English and Most of the Hebrew Staff Made on the Customize.yaml (names, units, etc...) - so feel free to get ideas from my Project :)**


### Screenshots: 
(will be updated with Lovelace UI soon)

#### The Main Page:
<img src=extras/pictures/Screenshot00.jpg width="1700">

<img src=extras/pictures/Screenshot01.jpg width="1700">

#### Server and Devices Status :
<img src=extras/pictures/Screenshot02.jpg width="1700"> 

#### Main Page with "Dark_theme":
<img src=extras/pictures/Screenshot03.jpg width="1700"> 

#### FloorPlan (First sketch):
<img src=extras/pictures/Screenshot04.jpg width="1700"> 



### What will come next (To Do List):
* ~~Improve abilities in FloorPlane include some Animations~~ done
* ~~Improve response time in cameras~~ - done - Onvif protocol and better Computer
* ~~More CustomUI Changes~~ :) - added more colors and hline for better separation
* ~~Greater use of IR Controller~~
* APA102 Ledstrip Smart Connected to HA
* ~~UI implementation with the new and amazing [Lovelace](https://www.home-assistant.io/lovelace/)~~
* ~~Improve Security aspect All around.~~ -added 2AF, BanIP, authenticator and more...

**Make Sure you cross through the automations and scripts there are special things there!**

# Questions?

The best way to get help with Home Assistant platform is the [Home Assistant Forum](https://community.home-assistant.io/) or [בית חכם  D.I.Y Home Automation Facebook Group](https://www.facebook.com/groups/801414950005336/). If you have a specific question about my configuration send me a Private Message on the HA forum, my username over there is [VirtualL](https://community.home-assistant.io/u/VirtualL/).  If you have found something incorrect, please submit an issue here on Github and ill get it fixed.
