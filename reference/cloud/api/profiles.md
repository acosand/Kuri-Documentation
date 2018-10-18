---
layout: reference
title: Profiles
tags:
- cloud
- user
---

# Profiles
## /profiles
### `GET /profiles`
Fetch all profiles

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |

#### Responses

Code | Description
------------ | ------------
200 | Successful
403 | You do not have permission to list profiles




## /profiles/{profileUUID}/robots
### `GET /profiles/{profileUUID}/robots`
Fetch robots from specific profile

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
profileUUID | ✅  |  | uuid of profile to fetch robots from | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully fetched robots in profile
400 | Profile UUID is invalid
401 | Invalid token
403 | No permission to list profile robots
404 | Profile does not exist
