#!/bin/bash
curl -X POST -H 'Authorization: Bearer YOUR_LONG_LIVED_ACCESS_TOKEN' \
       -H "Content-Type: application/json" \
       -d '{"state": "recording"}' \
       https://YOURDOMAIN.COM/api/states/camera.cctv1_snapshot
