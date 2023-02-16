


# authorization

API base: api.sonos.com

GET  /login/v3/oauth
POST /login/v3/oauth/access
POST /login/v3/oauth/access


OAuth 2.0


## create authorization code
- create client credentials on sonos developer website
  - key name: media_control_key
  - key: 0df27199-02c0-40d3-9f68-deec433a4e55
  - secret: 73a4331b-a92a-4f43-9f06-7a607b812fdd 
  - base64: MGRmMjcxOTktMDJjMC00MGQzLTlmNjgtZGVlYzQzM2E0ZTU1OjczYTQzMzFiLWE5MmEtNGY0My05ZjA2LTdhNjA3YjgxMmZkZA==
  - redirect url: https://eotpjp2hkd2pm9x.m.pipedream.net


```
GET https://api.sonos.com/login/v3/oauth?
client_id={YOURCLIENTCREDENTIALKEY}
&response_type=code
&state={TESTSTATE}
&scope=playback-control-all
&redirect_uri=https%3A%2F%2Facme.example.com%2Flogin%2Ftestclient%2Fauthorized.html
```


- scope (playback-control-all)




## create token

https://api.sonos.com/login/v3/oauth?client_id=0df27199-02c0-40d3-9f68-deec433a4e55&response_type=code&state=testState&scope=playback-control-all&redirect_uri=https%3A%2F%2Facme.example.com%2Flogin%2Ftestclient%2Fauthorized.html

https://api.sonos.com/login/v3/oauth?client_id=0df27199-02c0-40d3-9f68-deec433a4e55&response_type=code&state=testState&scope=playback-control-all&redirect_uri=https://eotpjp2hkd2pm9x.m.pipedream.net/

https%3A%2F%2Facme.example.com%2Flogin%2Ftestclient%2Fauthorized.html

https://eotpjp2hkd2pm9x.m.pipedream.net/?state=testState&code=yarIndtW




## my tokens

code: 9wT9O6sf 
access_token: KQtsOFbza5zhGUhPyr8hCZGkQM1q
refresh_token: EXsYs54OmisGAoBBZGI3atG6W5ScivlG






```bash	
curl -X POST -H "Content-Type: application/x-www-form-urlencoded;charset=utf-8" \
-H "Authorization: Basic {YourBase64EncodedClientId:SecretGoesHere}" \
"https://api.sonos.com/login/v3/oauth/access" \
-d "grant_type=authorization_code&code=93713fe8-33aa-460c-97bd-320d7ae8679f&redirect_uri=https%3A%2F%2FACME.example.com%2Flogin%2Ftestclient%2Fauthorized.html"

{
  "access_token": "d7cdf58d-d43c-412c-8887-6d7f95b6557e",
  "token_type": "Bearer",
  "expires_in": 86400,
  "refresh_token": "585fb433-359c-4419-ac53-946106e5bbab",
  "scope": "playback-control-all"
}
```

send access_token to sonos in every api call

```http
POST /api/v1/groups/RINCON_00012345678001400:0/playback:1/play HTTP/1.1
Host: api.ws.sonos.com/control/v1
Content-Type: application/json
Authorization: Bearer <access_token>
```

## refresh token

This api call seems to use the params passed in the query string, yet requires it to be a POST, and yet seems to ignore the data passed in the body ?! An empty body still generates a new token so long as the query string params are valid

```
POST https://api.sonos.com/login/v3/oauth/access?grant_type=refresh_token&refresh_token={...}
Authorization: Basic base64(client_id:secret)
```


```http
curl -X POST -H "Content-Type: application/x-www-form-urlencoded;charset=utf-8" \
-H "Authorization: Basic {YourBase64EncodedClientId:SecretGoesHere}" \
"https://api.sonos.com/login/v3/oauth/access" \
-d "grant_type=refresh_token&refresh_token=585fb433-359c-4419-ac53-946106e5bbab"

{
  "access_token": "f474be5c-fcb5-4626-aa9b-42d12192c660",
  "token_type": "Bearer",
  "expires_in": 86400,
  "refresh_token": "585fb433-359c-4419-ac53-946106e5bbab",
  "scope": "playback-control-all"
}

```


# discover


household id: Sonos_WNW43bDVBmpn6NaeiEYKiWRw8I.ldIo9thIJZVfNMUFqy67
group id: RINCON_38420B71AF8401400:252623888


players:
- RINCON_38420B71AF8401400 
- websocket: wss://192.168.1.185:1443/websocket/api

devices:
- RINCON_38420B71AF8401400
- RINCON_38420B71B1E601400


```http
GET /control/api/v1/households HTTP/1.1
Content-Type: application/json
Authorization: Bearer <Access-Token>
Host: api.ws.sonos.com

"households": [
    {
      "id": "Sonos_HHID-4321"
    },
    {
      "id": "Sonos_HHID-1234"
    }
  ]
}
```


# control
```
api.ws.sonos.com/control/api/v1

POST /groups/{groupId}/groupVolume/mute              # muted (true/false)
POST /groups/{groupId}/groupVolume                   # volume (0..100)
POST /groups/{groupId}/groupVolume/relative          # volumeDelta (-100..100)


POST /groups/{groupId}/playback/play
POST /groups/{groupId}/playback/pause
POST /groups/{groupId}/playback/skipToNextTrack
POST /groups/{groupId}/playback/skipToPreviousTrack

```

## volume
- group volume
- player volume
- group mute
- player mute

setVolume
setRelativeVolume
setMute


subscribe



