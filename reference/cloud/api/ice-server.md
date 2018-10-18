---
layout: reference
title: Ice Server
tags:
- cloud
- webrtc
---

# Ice Server
## /ice-server
### `GET /ice-server`
Provide an ICE server address, username, and password.

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |

#### Responses

Code | Description
------------ | ------------
200 | Successfully get an ICE server address
401 | Invalid token
404 | No ice server is available now
