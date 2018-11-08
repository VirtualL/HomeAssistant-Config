"""
Simple whois component for homeassistant that fetches ip returned from http://extreme-ip-lookup.com/json/
"""
from datetime import timedelta
from homeassistant.helpers.entity import Entity
import requests

__version__ = '0.0.1'

ATTR_BUSINESSNAME = 'businessName'
ATTR_BUSINESSWEBSITE = 'businessWebsite'
ATTR_CITY = 'city'
ATTR_CONTINENT = 'continent'
ATTR_COUNTRY = 'country'
ATTR_COUNTRYCODE = 'countryCode'
ATTR_IPNAME = 'ipName'
ATTR_IPTYPE = 'ipType'
ATTR_ISP = 'isp'
ATTR_LAT = 'lat'
ATTR_LON = 'lon'
ATTR_ORG = 'org'
ATTR_REGION = 'region'

SCAN_INTERVAL = timedelta(days=3)

BASE_URL = 'https://extreme-ip-lookup.com/json/'

def setup_platform(hass, config, add_devices, discovery_info=None):
    add_devices([LookupSensor()])

class LookupSensor(Entity):
    def __init__(self):
        self._state = None
        self.update()

    def update(self):
        geo = requests.get(BASE_URL, timeout=5).json()
        self._state = geo['query']
        self._businessName = geo['businessName']
        self._businessWebsite = geo['businessWebsite']
        self._city = geo['city']
        self._continent = geo['continent']
        self._country = geo['country']
        self._countryCode = geo['countryCode']
        self._ipName = geo['ipName']
        self._ipType = geo['ipType']
        self._isp = geo['isp']
        self._lat = geo['lat']
        self._lon = geo['lon']
        self._org = geo['org']
        self._region = geo['region']

    @property
    def name(self):
        return 'geoip'

    @property
    def state(self):
        return self._state

    @property
    def icon(self):
        return 'mdi:earth'

    @property
    def device_state_attributes(self):
        return {
            ATTR_BUSINESSNAME: self._businessName,
            ATTR_BUSINESSWEBSITE: self._businessWebsite,
            ATTR_CITY: self._city,
            ATTR_CONTINENT: self._continent,
            ATTR_COUNTRY: self._country,
            ATTR_COUNTRYCODE: self._countryCode,
            ATTR_IPNAME: self._ipName,
            ATTR_IPTYPE: self._ipType,
            ATTR_ISP: self._isp,
            ATTR_LAT: self._lat,
            ATTR_LON: self._lon,
            ATTR_ORG: self._org,
            ATTR_REGION: self._region
}