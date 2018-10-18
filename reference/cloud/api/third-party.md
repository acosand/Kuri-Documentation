---
layout: reference
title: Third Party
tags:
- cloud
- integration
---

# Third Party
## /third-party/info
### `GET /third-party/info`
Gets information about user third party information
IFTTT integration information returns a single boolean "isConnected" that indicates if user is connected to IFTTT

#### Responses

Code | Description
------------ | ------------
200 | Successful



## /third-party/ifttt/v1/actions/animation
### `POST /third-party/ifttt/v1/actions/animation`
Notifies robot that an animation action has been triggered
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
actionFields | ✅ |  |  | body |  |

#### Responses

Code | Description
------------ | ------------
200 |
401 | Invalid IFTTT access token



## /third-party/ifttt/v1/actions/animation/fields/action/options
### `POST /third-party/ifttt/v1/actions/animation/fields/action/options`
Retrieves a list of actions a robot can perform

#### Responses

Code | Description
------------ | ------------
200 |
401 | Invalid IFTTT access token



## /third-party/ifttt/v1/actions/dock
### `POST /third-party/ifttt/v1/actions/dock`
Notifies robot that a move to charger action has been triggered

#### Responses

Code | Description
------------ | ------------
200 |
401 | Invalid IFTTT access token



## /third-party/ifttt/v1/actions/move/fields/action/options
### `POST /third-party/ifttt/v1/actions/move/fields/action/options`
Retrieves a list of actions a robot can perform

#### Responses

Code | Description
------------ | ------------
200 |
401 | Invalid IFTTT access token



## /third-party/ifttt/v1/actions/move
### `POST /third-party/ifttt/v1/actions/move`
Notifies robot that a move action has been triggered
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
actionFields | ✅ |  |  | body |  |

#### Responses

Code | Description
------------ | ------------
200 |
400 | Invalid place name
400 | Invalid action ID
401 | Invalid IFTTT access token



## /third-party/ifttt/v1/authorizations
### `POST /third-party/ifttt/v1/authorizations`
Creates an IFTTT authorization with a unique authorization code
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
clientId | ✅ |  | IFTTT client ID | body | string |

#### Responses

Code | Description
------------ | ------------
200 | Successful



## /third-party/ifttt/v1/actions/move/fields/place/options
### `POST /third-party/ifttt/v1/actions/move/fields/place/options`
Retrieves a list of places a robot is mapped to

#### Responses

Code | Description
------------ | ------------
200 |
401 | Invalid IFTTT access token



## /third-party/ifttt/v1/test/setup
### `POST /third-party/ifttt/v1/test/setup`
Provide test data for IFTTT to perform automated tests

#### Responses

Code | Description
------------ | ------------
200 | Successful



## /third-party/ifttt/v1/status
### `GET /third-party/ifttt/v1/status`
Health check for service availability

#### Responses

Code | Description
------------ | ------------
200 | Successful


## /third-party/ifttt/v1/triggers/voice_command
### `POST /third-party/ifttt/v1/triggers/voice_command`
Retrieves a list of voice command trigger events matching request trigger fields
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
trigger_identity | ✅ |  | IFTTT trigger identity | body | string |
triggerFields |  |  |  | body |  |
ifttt_source |  |  |  | body |  |
limit |  | 50 | Maximum number of trigger events to return | body | integer |

#### Responses

Code | Description
------------ | ------------
200 |
401 | Invalid IFTTT access token



## /third-party/ifttt/v1/triggers/voice_command/trigger_identity/{triggerIdentity}
### `DELETE /third-party/ifttt/v1/triggers/voice_command/trigger_identity/{triggerIdentity}`
Delete the IFTTT voice command trigger with the specified trigger identity

#### Responses

Code | Description
------------ | ------------
200 | Successful



## /third-party/ifttt/v1/tokens
### `POST /third-party/ifttt/v1/tokens`
Creates an IFTTT access token given an authorization code
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
grant_type | ✅ |  |  | body | string | { enum: authorization_code }
code | ✅ |  | IFTTT authorization code | body | string |
client_id | ✅ |  | IFTTT client ID | body | string |
client_secret | ✅ |  | IFTTT client secret | body | string |

#### Responses

Code | Description
------------ | ------------
200 | Successful


### `DELETE /third-party/ifttt/v1/tokens`
Deletes user IFTTT tokens and authorization codes

#### Responses

Code | Description
------------ | ------------
200 | Successful



## /third-party/ifttt/v1/user/info
### `GET /third-party/ifttt/v1/user/info`
Retrieves user information

#### Responses

Code | Description
------------ | ------------
200 |
401 | Invalid IFTTT access token
