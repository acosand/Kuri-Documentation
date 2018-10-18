---
layout: reference
title: Devices
tags:
- cloud
- mobile app
---

# Devices
## /devices
### `POST /devices`
Register a new device for push notifications

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
deviceToken | ✅ | e78d3350a4a111e7bb444bda2a724e53 | the device token should contain only valid hex characters | body | string |
platform | ✅ | iOS | the supported platforms are currently iOS and android | body | string | { enum: iOS,android }

#### Responses

Code | Description
------------ | ------------
200 | Device successfully registered
400 | The platform is invalid
400 | The device token is invalid



## /devices/{deviceToken}
### `DELETE /devices/{deviceToken}`
Unregister a device for push notifications

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
deviceToken | ✅  |  | the device token should contain only valid hex characters | path | string |

#### Responses

Code | Description
------------ | ------------
204 | Soft delete success
400 | Invalid token
