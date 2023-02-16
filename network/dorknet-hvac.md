



# MELcloud



```bash
# TODO - more fields of interest:
# - Device.OperationMode
# - Device.DemandPercentage
# - Device.WifiSignalStrength


# Device.CurrentEnergyMode  
3               # cooling
7               # fan

# Device.Power
false           # off
true            # on

```












## auth


POST https://app.melcloud.com/Mitsubishi.Wifi.Client/Login/ClientLogin

```json
{
    "Email":"kevin.bouck@gmail.com",
    "Password":"!@Nodlehed9me",
    "Language":0,
    "AppVersion":"1.25.0.1",
    "Persist":true,
    "CaptchaResponse":null
}
```

reponse:

```json
{
    "ErrorId": null,
    "ErrorMessage": null,
    "LoginStatus": 0,
    "UserId": 0,
    "RandomKey": null,
    "AppVersionAnnouncement": null,
    "LoginData": {
        "ContextKey": "4753D93276C946CA87A390139FA6F8",
        "Client": 417892,
        "Terms": 1284,
        "AL": 1,
        "ML": 0,
        "CMI": true,
        "IsStaff": false,
        "CUTF": false,
        "CAA": false,
        "ReceiveCountryNotifications": false,
        "ReceiveAllNotifications": false,
        "CACA": false,
        "CAGA": false,
        "MaximumDevices": 10,
        "ShowDiagnostics": false,
        "Language": 0,
        "Country": 159,
        "RealClient": 0,
        "Name": "Kevin Bouck",
        "UseFahrenheit": false,
        "Duration": 525600,
        "Expiry": "2023-06-20T13:43:13.503",
        "CMSC": false,
        "PartnerApplicationVersion": null,
        "EmailSettingsReminderShown": true,
        "EmailUnitErrors": 1,
        "EmailCommsErrors": 1,
        "ChartSeriesHidden": 1,
        "DeletePending": false,
        "IsImpersonated": false,
        "LanguageCode": "en",
        "CountryName": "Netherlands",
        "CurrencySymbol": "€",
        "SupportEmailAddress": "KlantenserviceAlklima@alklima.nl",
        "DateSeperator": "/",
        "TimeSeperator": ":",
        "AtwLogoFile": "ecodan_logo.png",
        "DECCReport": false,
        "CSVReport1min": false,
        "HidePresetPanel": false,
        "EmailSettingsReminderRequired": false,
        "TermsText": null,
        "MapView": false,
        "MapZoom": 18,
        "MapLongitude": 4.859961464046023,
        "MapLatitude": 52.36017370410218
    },
    "ListPendingInvite": [],
    "ListOwnershipChangeRequest": [],
    "ListPendingAnnouncement": [],
    "LoginMinutes": 0,
    "LoginAttempts": 0
}
```

## list

GET https://app.melcloud.com/Mitsubishi.Wifi.Client/Support/List?language=0
X-MitsContextKey: 4753D93276C946CA87A390139FA6F8

## list devices

GET https://app.melcloud.com/Mitsubishi.Wifi.Client/User/ListDevices
X-MitsContextKey: 4753D93276C946CA87A390139FA6F8

response:

- array
- response[0].Structure.Areas[0].Devices[0]
  - DeviceID
  - DeviceName
  - Device.RoomTemperature
  - Device.SetTemperature
  - Device.DemandPercentage
  - Device.Power (true/false for on/off)
  - Device.CurrentEnergyConsumed (seems like a counter? Wh? 371400, so 371kWh?)
    - Bedroom: 371400 ?? 
    - Office: 57500 ??
    - 
    - 
  - Device.CurrentEnergyMode (3)
  - Device.DemandPercentage (last said 100 while off)
- response[0].Structure.Devices[0]
  - DeviceName



```json
[{
    "ID": 383271,
    "Name": "Home",
    "AddressLine1": "Rhijnvis Feithstraat 29-3",
    "AddressLine2": null,
    "City": "Amsterdam",
    "Postcode": "1054TV",
    "Latitude": 52.3601345,
    "Longitude": 4.859793,
    "District": null,
    "FPDefined": false,
    "FPEnabled": false,
    "FPMinTemperature": 14,
    "FPMaxTemperature": 16,
    "HMDefined": false,
    "HMEnabled": false,
    "HMStartDate": null,
    "HMEndDate": null,
    "BuildingType": 2,
    "PropertyType": 2,
    "DateBuilt": null,
    "HasGasSupply": true,
    "LocationLookupDate": "2022-03-29T13:45:15.347",
    "Country": 159,
    "TimeZoneContinent": 3,
    "TimeZoneCity": 59,
    "TimeZone": 119,
    "Location": 6740,
    "CoolingDisabled": false,
    "Expanded": true,
    "Structure": {
        "Floors": [],
        "Areas": [{
            "ID": 124094,
            "Name": "Bedroom",
            "BuildingId": 383271,
            "FloorId": null,
            "AccessLevel": 4,
            "DirectAccess": false,
            "EndDate": "2500-01-01T00:00:00",
            "MinTemperature": 0,
            "MaxTemperature": 40,
            "Expanded": true,
            "Devices": [{
                "DeviceID": 37481268,
                "DeviceName": "Bedroom",
                "BuildingID": 383271,
                "BuildingName": null,
                "FloorID": null,
                "FloorName": null,
                "AreaID": 124094,
                "AreaName": null,
                "ImageID": -6,
                "InstallationDate": null,
                "LastServiceDate": null,
                "Presets": [],
                "OwnerID": 417892,
                "OwnerName": null,
                "OwnerEmail": null,
                "AccessLevel": 4,
                "DirectAccess": false,
                "EndDate": "2500-01-01T00:00:00",
                "Zone1Name": null,
                "Zone2Name": null,
                "MinTemperature": 0,
                "MaxTemperature": 40,
                "HideVaneControls": false,
                "HideDryModeControl": false,
                "HideRoomTemperature": false,
                "HideSupplyTemperature": false,
                "HideOutdoorTemperature": false,
                "BuildingCountry": null,
                "OwnerCountry": null,
                "AdaptorType": 3,
                "LinkedDevice": null,
                "Type": 0,
                "MacAddress": "2c:9f:fb:c5:af:d9",
                "SerialNumber": "2126116164",
                "Device": {
                    "PCycleActual": 0,
                    "ErrorMessages": "",
                    "DeviceType": 0,
                    "CanCool": true,
                    "CanHeat": true,
                    "CanDry": true,
                    "HasAutomaticFanSpeed": true,
                    "AirDirectionFunction": true,
                    "SwingFunction": true,
                    "NumberOfFanSpeeds": 5,
                    "UseTemperatureA": true,
                    "TemperatureIncrementOverride": 0,
                    "TemperatureIncrement": 0.5,
                    "MinTempCoolDry": 16.0,
                    "MaxTempCoolDry": 31.0,
                    "MinTempHeat": 10.0,
                    "MaxTempHeat": 31.0,
                    "MinTempAutomatic": 16.0,
                    "MaxTempAutomatic": 31.0,
                    "LegacyDevice": false,
                    "UnitSupportsStandbyMode": true,
                    "IsSplitSystem": true,
                    "ModelIsAirCurtain": false,
                    "ModelSupportsFanSpeed": true,
                    "ModelSupportsAuto": true,
                    "ModelSupportsHeat": true,
                    "ModelSupportsDry": true,
                    "ModelSupportsVaneVertical": true,
                    "ModelSupportsVaneHorizontal": true,
                    "ModelSupportsWideVane": false,
                    "ModelDisableEnergyReport": false,
                    "ModelSupportsStandbyMode": true,
                    "ModelSupportsEnergyReporting": false,
                    "ProhibitSetTemperature": false,
                    "ProhibitOperationMode": false,
                    "ProhibitPower": false,
                    "Power": false,
                    "RoomTemperature": 22.5,
                    "SetTemperature": 18.0,
                    "ActualFanSpeed": 0,
                    "FanSpeed": 0,
                    "AutomaticFanSpeed": true,
                    "VaneVerticalDirection": 0,
                    "VaneVerticalSwing": false,
                    "VaneHorizontalDirection": 3,
                    "VaneHorizontalSwing": false,
                    "OperationMode": 3,
                    "EffectiveFlags": 0,
                    "LastEffectiveFlags": 0,
                    "InStandbyMode": false,
                    "DemandPercentage": 100,
                    "ConfiguredDemandPercentage": null,
                    "HasDemandSideControl": false,
                    "DefaultCoolingSetTemperature": 21.0,
                    "DefaultHeatingSetTemperature": 23.0,
                    "RoomTemperatureLabel": 0,
                    "HeatingEnergyConsumedRate1": 0,
                    "HeatingEnergyConsumedRate2": 0,
                    "CoolingEnergyConsumedRate1": 0,
                    "CoolingEnergyConsumedRate2": 0,
                    "AutoEnergyConsumedRate1": 0,
                    "AutoEnergyConsumedRate2": 0,
                    "DryEnergyConsumedRate1": 0,
                    "DryEnergyConsumedRate2": 0,
                    "FanEnergyConsumedRate1": 0,
                    "FanEnergyConsumedRate2": 0,
                    "OtherEnergyConsumedRate1": 0,
                    "OtherEnergyConsumedRate2": 0,
                    "HasEnergyConsumedMeter": true,
                    "CurrentEnergyConsumed": 371400,
                    "CurrentEnergyMode": 3,
                    "CoolingDisabled": false,
                    "EnergyCorrectionModel": null,
                    "EnergyCorrectionActive": false,
                    "MinPcycle": 1,
                    "MaxPcycle": 1,
                    "EffectivePCycle": 1,
                    "MaxOutdoorUnits": 255,
                    "MaxIndoorUnits": 255,
                    "MaxTemperatureControlUnits": 0,
                    "ModelCode": "0130",
                    "DeviceID": 37481268,
                    "MacAddress": "2c:9f:fb:c5:af:d9",
                    "SerialNumber": "2126116164",
                    "TimeZoneID": 119,
                    "DiagnosticMode": 0,
                    "DiagnosticEndDate": null,
                    "ExpectedCommand": 1,
                    "Owner": 417892,
                    "DetectedCountry": null,
                    "AdaptorType": 3,
                    "FirmwareDeployment": null,
                    "FirmwareUpdateAborted": false,
                    "LinkedDevice": null,
                    "WifiSignalStrength": -56,
                    "WifiAdapterStatus": "NORMAL",
                    "Position": "Unknown",
                    "PCycle": 10,
                    "PCycleConfigured": null,
                    "RecordNumMax": 0,
                    "LastTimeStamp": "2022-06-20T15:33:00",
                    "ErrorCode": 8000,
                    "HasError": false,
                    "LastReset": "2022-04-04T20:38:38.017",
                    "FlashWrites": 2,
                    "Scene": null,
                    "SSLExpirationDate": "2037-12-31T00:00:00",
                    "SPTimeout": 1,
                    "Passcode": null,
                    "ServerCommunicationDisabled": false,
                    "ConsecutiveUploadErrors": 0,
                    "DoNotRespondAfter": null,
                    "OwnerRoleAccessLevel": 1,
                    "OwnerCountry": 159,
                    "HideEnergyReport": false,
                    "ExceptionHash": null,
                    "ExceptionDate": null,
                    "ExceptionCount": null,
                    "Rate1StartTime": null,
                    "Rate2StartTime": null,
                    "ProtocolVersion": 0,
                    "UnitVersion": 0,
                    "FirmwareAppVersion": 35000,
                    "FirmwareWebVersion": 0,
                    "FirmwareWlanVersion": 0,
                    "MqttFlags": 9,
                    "HasErrorMessages": false,
                    "HasZone2": false,
                    "Offline": true,
                    "SupportsHourlyEnergyReport": true,
                    "Units": []
                },
                "DiagnosticMode": 0,
                "DiagnosticEndDate": null,
                "Location": 6740,
                "DetectedCountry": null,
                "Registrations": 13,
                "LocalIPAddress": null,
                "TimeZone": 119,
                "RegistReason": "CONFIG",
                "ExpectedCommand": 1,
                "RegistRetry": 0,
                "DateCreated": "2022-04-04T13:21:02.426Z",
                "FirmwareDeployment": null,
                "FirmwareUpdateAborted": false,
                "Permissions": {
                    "CanSetOperationMode": true,
                    "CanSetFanSpeed": true,
                    "CanSetVaneDirection": true,
                    "CanSetPower": true,
                    "CanSetTemperatureIncrementOverride": true,
                    "CanDisableLocalController": true,
                    "CanSetDemandSideControl": false
                }
            }]
        }],
        "Devices": [{
            "DeviceID": 37036822,
            "DeviceName": "Office",
            "BuildingID": 383271,
            "BuildingName": null,
            "FloorID": null,
            "FloorName": null,
            "AreaID": null,
            "AreaName": null,
            "ImageID": -7,
            "InstallationDate": "2021-07-31T00:00:00",
            "LastServiceDate": "2021-07-31T00:00:00",
            "Presets": [{
                "SetTemperature": 18.0,
                "Power": true,
                "OperationMode": 3,
                "VaneHorizontal": 3,
                "VaneVertical": 5,
                "FanSpeed": 0,
                "ID": 272343,
                "Client": 417892,
                "DeviceLocation": 37036822,
                "Number": 1,
                "Configuration": "<settings><st>18</st><pw>true</pw><om>3</om><vd>5</vd><hd>3</hd><fs>0</fs></settings>",
                "NumberDescription": "Cool 18"
            }, {
                "SetTemperature": 20.0,
                "Power": true,
                "OperationMode": 3,
                "VaneHorizontal": 3,
                "VaneVertical": 5,
                "FanSpeed": 0,
                "ID": 280521,
                "Client": 417892,
                "DeviceLocation": 37036822,
                "Number": 2,
                "Configuration": "<settings><st>20</st><pw>true</pw><om>3</om><vd>5</vd><hd>3</hd><fs>0</fs></settings>",
                "NumberDescription": "Cool 20"
            }],
            "OwnerID": 417892,
            "OwnerName": null,
            "OwnerEmail": null,
            "AccessLevel": 4,
            "DirectAccess": false,
            "EndDate": "2500-01-01T00:00:00",
            "Zone1Name": null,
            "Zone2Name": null,
            "MinTemperature": 0,
            "MaxTemperature": 40,
            "HideVaneControls": false,
            "HideDryModeControl": false,
            "HideRoomTemperature": false,
            "HideSupplyTemperature": false,
            "HideOutdoorTemperature": false,
            "BuildingCountry": null,
            "OwnerCountry": null,
            "AdaptorType": 3,
            "LinkedDevice": null,
            "Type": 0,
            "MacAddress": "2c:9f:fb:82:c5:1e",
            "SerialNumber": "2050808064",
            "Device": {
                "PCycleActual": 0,
                "ErrorMessages": "",
                "DeviceType": 0,
                "CanCool": true,
                "CanHeat": true,
                "CanDry": true,
                "HasAutomaticFanSpeed": true,
                "AirDirectionFunction": true,
                "SwingFunction": true,
                "NumberOfFanSpeeds": 5,
                "UseTemperatureA": true,
                "TemperatureIncrementOverride": 0,
                "TemperatureIncrement": 0.5,
                "MinTempCoolDry": 16.0,
                "MaxTempCoolDry": 31.0,
                "MinTempHeat": 10.0,
                "MaxTempHeat": 31.0,
                "MinTempAutomatic": 16.0,
                "MaxTempAutomatic": 31.0,
                "LegacyDevice": false,
                "UnitSupportsStandbyMode": true,
                "IsSplitSystem": true,
                "ModelIsAirCurtain": false,
                "ModelSupportsFanSpeed": true,
                "ModelSupportsAuto": true,
                "ModelSupportsHeat": true,
                "ModelSupportsDry": true,
                "ModelSupportsVaneVertical": true,
                "ModelSupportsVaneHorizontal": true,
                "ModelSupportsWideVane": false,
                "ModelDisableEnergyReport": false,
                "ModelSupportsStandbyMode": true,
                "ModelSupportsEnergyReporting": false,
                "ProhibitSetTemperature": false,
                "ProhibitOperationMode": false,
                "ProhibitPower": false,
                "Power": false,
                "RoomTemperature": 22.0,
                "SetTemperature": 18.0,
                "ActualFanSpeed": 0,
                "FanSpeed": 0,
                "AutomaticFanSpeed": true,
                "VaneVerticalDirection": 5,
                "VaneVerticalSwing": false,
                "VaneHorizontalDirection": 3,
                "VaneHorizontalSwing": false,
                "OperationMode": 3,
                "EffectiveFlags": 0,
                "LastEffectiveFlags": 0,
                "InStandbyMode": false,
                "DemandPercentage": 100,
                "ConfiguredDemandPercentage": null,
                "HasDemandSideControl": false,
                "DefaultCoolingSetTemperature": 21.0,
                "DefaultHeatingSetTemperature": 23.0,
                "RoomTemperatureLabel": 0,
                "HeatingEnergyConsumedRate1": 0,
                "HeatingEnergyConsumedRate2": 0,
                "CoolingEnergyConsumedRate1": 0,
                "CoolingEnergyConsumedRate2": 0,
                "AutoEnergyConsumedRate1": 0,
                "AutoEnergyConsumedRate2": 0,
                "DryEnergyConsumedRate1": 0,
                "DryEnergyConsumedRate2": 0,
                "FanEnergyConsumedRate1": 0,
                "FanEnergyConsumedRate2": 0,
                "OtherEnergyConsumedRate1": 0,
                "OtherEnergyConsumedRate2": 0,
                "HasEnergyConsumedMeter": true,
                "CurrentEnergyConsumed": 57500,
                "CurrentEnergyMode": 3,
                "CoolingDisabled": false,
                "EnergyCorrectionModel": null,
                "EnergyCorrectionActive": false,
                "MinPcycle": 1,
                "MaxPcycle": 1,
                "EffectivePCycle": 1,
                "MaxOutdoorUnits": 255,
                "MaxIndoorUnits": 255,
                "MaxTemperatureControlUnits": 0,
                "ModelCode": "0130",
                "DeviceID": 37036822,
                "MacAddress": "2c:9f:fb:82:c5:1e",
                "SerialNumber": "2050808064",
                "TimeZoneID": 119,
                "DiagnosticMode": 0,
                "DiagnosticEndDate": null,
                "ExpectedCommand": 1,
                "Owner": 417892,
                "DetectedCountry": null,
                "AdaptorType": 3,
                "FirmwareDeployment": null,
                "FirmwareUpdateAborted": false,
                "LinkedDevice": null,
                "WifiSignalStrength": -42,
                "WifiAdapterStatus": "NORMAL",
                "Position": "Unknown",
                "PCycle": 10,
                "PCycleConfigured": null,
                "RecordNumMax": 0,
                "LastTimeStamp": "2022-06-20T15:40:00",
                "ErrorCode": 8000,
                "HasError": false,
                "LastReset": "2022-03-31T18:00:39.674",
                "FlashWrites": 2,
                "Scene": null,
                "SSLExpirationDate": "2037-12-31T00:00:00",
                "SPTimeout": 1,
                "Passcode": null,
                "ServerCommunicationDisabled": false,
                "ConsecutiveUploadErrors": 0,
                "DoNotRespondAfter": null,
                "OwnerRoleAccessLevel": 1,
                "OwnerCountry": 159,
                "HideEnergyReport": false,
                "ExceptionHash": null,
                "ExceptionDate": null,
                "ExceptionCount": null,
                "Rate1StartTime": null,
                "Rate2StartTime": null,
                "ProtocolVersion": 0,
                "UnitVersion": 0,
                "FirmwareAppVersion": 35000,
                "FirmwareWebVersion": 0,
                "FirmwareWlanVersion": 0,
                "MqttFlags": 9,
                "HasErrorMessages": false,
                "HasZone2": false,
                "Offline": true,
                "SupportsHourlyEnergyReport": true,
                "Units": []
            },
            "DiagnosticMode": 0,
            "DiagnosticEndDate": null,
            "Location": 6740,
            "DetectedCountry": null,
            "Registrations": 12,
            "LocalIPAddress": null,
            "TimeZone": 119,
            "RegistReason": "CONFIG",
            "ExpectedCommand": 1,
            "RegistRetry": 0,
            "DateCreated": "2022-03-29T13:35:08.041Z",
            "FirmwareDeployment": null,
            "FirmwareUpdateAborted": false,
            "Permissions": {
                "CanSetOperationMode": true,
                "CanSetFanSpeed": true,
                "CanSetVaneDirection": true,
                "CanSetPower": true,
                "CanSetTemperatureIncrementOverride": true,
                "CanDisableLocalController": true,
                "CanSetDemandSideControl": false
            }
        }],
        "Clients": []
    },
    "AccessLevel": 4,
    "DirectAccess": true,
    "MinTemperature": 0,
    "MaxTemperature": 40,
    "Owner": null,
    "EndDate": "2500-01-01T00:00:00",
    "iDateBuilt": null,
    "QuantizedCoordinates": {
        "Latitude": 52.35,
        "Longitude": 4.85
    }
}]
```

## scene list

POST https://app.melcloud.com/Mitsubishi.Wifi.Client/Scene/List
X-MitsContextKey: 4753D93276C946CA87A390139FA6F8

request:
```json
{}
```

response:
```json
{
    "Data": [
        {
            "ImageID": -1000,
            "ID": 81906,
            "Name": "Daily Heating",
            "Devices": [
                37036822
            ]
        },
        {
            "ImageID": -1002,
            "ID": 81542,
            "Name": "Max Cool",
            "Devices": [
                37036822
            ]
        }
    ],
    "GlobalErrors": null,
    "AttributeErrors": null,
    "Success": true
}
```

