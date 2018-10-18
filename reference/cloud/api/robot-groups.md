---
layout: reference
title: Robot Groups
tags:
- cloud
- robot
---

# Robot Groups
## /robot-groups
### `GET /robot-groups`
> 🔐 Admin only

Gets all robot group

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
limit |  | 10 | Total number of robot groups to return | query | integer |
page |  | 1 | Specific page to fetch | query | integer |
order |  |  | order to sort robot groups with in the format {column}:{ordering} | query | string |
filter[name] |  |  | filter robot groups by name | query | string |
filter[uuid] |  |  | filter robot groups by uuid | query | string |
filter[type] |  |  | filter robot groups by type | query | string |

#### Responses

Code | Description
------------ | ------------
200 |
401 | Invalid token
403 | User does not have permission to get list of robot groups



### `POST /robot-groups`
> 🔐 Admin only

Creates a robot group

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
name | ✅ |  | Robot group name | body | string |
description |  |  | Robot group description | body | string |
type | ✅ |  | Robot group type | body | string | { enum: ota }

#### Responses

Code | Description
------------ | ------------
201 | Robot group created successfully
400 | Robot group name is required
400 | Invalid robot group description
401 | Invalid token
403 | User does not have permission to create a robot group



## /robot-groups/{groupUUID}
### `GET /robot-groups/{groupUUID}`
> 🔐 Admin only

Gets a robot group

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |

#### Responses

Code | Description
------------ | ------------
200 |
401 | Invalid token
403 | User does not have permission to get a robot group
404 | Robot group not found



### `DELETE /robot-groups/{groupUUID}`
> 🔐 Admin only

Deletes a robot group

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |

#### Responses

Code | Description
------------ | ------------
204 | Robot group deleted successfully
401 | Invalid token
403 | User does not have permission to delete a robot group
404 | Robot group not found



### `PATCH /robot-groups/{groupUUID}`
> 🔐 Admin only

Updates a robot group

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
name |  |  | Robot group name | body | string |
description |  |  | Robot group description | body | string |

#### Responses

Code | Description
------------ | ------------
200 | Robot group updated successfully
400 | Invalid robot group name
400 | Invalid robot group description
401 | Invalid token
403 | User does not have permission to update a robot group
404 | Robot group not found



## /robot-groups/{groupUUID}/config
### `PUT /robot-groups/{groupUUID}/config`
> 🔐 Admin only

Assign a config to robots of a robot group

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
configId | ✅ |  |  | body | integer |

#### Responses

Code | Description
------------ | ------------
204 | Robot configs updated successfully
400 | Invalid config ID
400 | Robot config not found
400 | No robots found in robot group
403 | User does not have permission to update robot group config
404 | Robot group not found


## /robot-groups/{groupUUID}/configs
### `GET /robot-groups/{groupUUID}/configs`
> 🔐 Admin only

Gets the config that the robots of a robot group is using

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |

#### Responses

Code | Description
------------ | ------------
200 |
401 | Invalid token
403 | User does not have permission to get configs of a robot group.
404 | Robot group not found



## /robot-groups/{groupUUID}/parameters
### `GET /robot-groups/{groupUUID}/parameters`
> 🔐 Admin only

Returns parameters of a robot group

#### Responses

Code | Description
------------ | ------------
200 |
400 | Invalid robot group UUID
401 | Invalid token
403 | User does not have permission to get robot group parameters



### `PATCH /robot-groups/{groupUUID}/parameters`
> 🔐 Admin only

Updates parameters of a robot group

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
parameterUUID1 |  | parameterValue1 |  | body | string |
parameterUUID2 |  | parameterValue2 |  | body | string |

#### Responses

Code | Description
------------ | ------------
204 | Robot group parameters updated successfully
400 | Invalid parameter UUIDs
400 | Invalid parameter values
400 | Invalid robot group UUID
401 | Invalid token
403 | No access to update non-group robot parameters
403 | User does not have permission to update a robot group parameter



## /robot-groups/{groupUUID}/robots
### `DELETE /robot-groups/{groupUUID}/robots`
> 🔐 Admin only

Removes robots from a robot group

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUIDs | ✅ |  |  | body | array |

#### Responses

Code | Description
------------ | ------------
204 | Robot successfully removed from robot group
400 | Invalid robot UUIDs
401 | Invalid token
403 | User does not have permission to remove a robot from a robot group
404 | Robot group not found
404 | Robot not found in group



### `PATCH /robot-groups/{groupUUID}/robots`
> 🔐 Admin only

Adds robots to a robot group

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUIDs | ✅ |  |  | body | array |

#### Responses

Code | Description
------------ | ------------
201 | Robots successfully added to robot group
400 | Robots are already associated to robot group
400 | Invalid robot UUIDs
401 | Invalid token
403 | User does not have permission to add robots to a robot group
404 | Robot group not found
404 | Robots not found
