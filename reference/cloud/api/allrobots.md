---
layout: reference
title: All Robots
tags:
- cloud
---

# All Robots
## /allrobots
### `GET /allrobots`
> 🔐 Admin only

Fetch a list of all robots

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
page |  | 1 |  | query | integer |
limit |  | 10 |  | query | integer |
filter[robot] |  |  |  | query | string |

#### Responses

Code | Description
------------ | ------------
200 | Successful
401 | Invalid token
403 | No permission to admin endpoint
