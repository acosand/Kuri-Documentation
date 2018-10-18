---
layout: reference
title: App
tags:
- cloud
- mobile app
---

# App
## /app/version
### `GET /app/version`
Get information about app version to discover if an update is necessary

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
platform | ✅  |  | Platform of the app | query | string |
buildNumber |  |  | Build number of the app | query | number |
version |  |  | Version of the app (if buildNumber is available version value will be ignored) | query | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully get information about app version



## /app/{appVersion}/compatibility
### `GET /app/{appVersion}/compatibility`
Check app and robot compatibility.

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
appVersion | ✅  |  | Version of the app | path | string |
platform |  | ios |  | query | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully get the compatibility of app version robot api
400 | Invalid app version
401 | Invalid token
404 | Robot UUID not found
