---
layout: reference
title: Robot Parameters
tags:
- cloud
- robot
---

# Robot Parameters
## /robot-parameters
### `GET /robot-parameters`
Gets all parameters that can be set for robots

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |

#### Responses

Code | Description
------------ | ------------
200 |
401 | Invalid token
403 | User does not have permission to get parameters



### `POST /robot-parameters`
> 🔐 Admin only

Creates a robot parameter

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
key | ✅ |  | Robot parameter key | body | string |
description |  |  | Robot parameter description | body | string |
type | ✅ |  | Robot parameter type | body | string | { enum: individual,group }
valueType | ✅ |  | Robot parameter value type | body | string | { enum: number,boolean,string }
defaultValue | ✅ |  |  | body | string |
isRobotSetting |  |  | Robot parameter that should be targeted to robots | body | boolean |

#### Responses

Code | Description
------------ | ------------
200 |
400 | Invalid robot parameter key
400 | Invalid robot parameter type
400 | Invalid robot parameter value type
400 | Invalid robot parameter default value
400 | Duplicate robot parameter key
400 | Invalid robot parameter isRobotSetting value
401 | Invalid token
403 | User does not have permission to create robot parameters
