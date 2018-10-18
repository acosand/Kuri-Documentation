---
layout: reference
title: Configurations
tags:
- cloud
- robot
---

# Configurations
## /configs
### `GET /configs`
Get all files to use with a config

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |

#### Responses

Code | Description
------------ | ------------
200 | Files retrieved successfully
401 | Invalid token



### `POST /configs`
> 🔐 Admin only

Creates a file to use with a config

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
name | ✅ |  | Dev-facing version number, e.g. 0.77 | body | string |
displayName |  |  | User-facing name of config. Will default to same as 'name' if not set. | body | string |
priority |  |  |  | body | string | { enum: normal,critical }
files | ✅ |  |  | body | array |
releaseNotes |  |  |  | body | string |
s3Region |  |  |  | body | string |
s3Bucket |  |  |  | body | string |
s3Key |  |  |  | body | string |
official |  |  |  | body | boolean |

#### Responses

Code | Description
------------ | ------------
201 | Config created successfully
400 | Files parameter is required
401 | Invalid token
403 | You do not have access to create robot configs



## /configs/{configId}/location
### `PUT /configs/{configId}/location`
> 🔐 Admin only

Upload an s3 location for a config

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
configId | ✅  |  |  | path | integer |
s3Region | ✅ |  |  | body | string |
s3Bucket | ✅ |  |  | body | string |
s3Key | ✅ |  |  | body | string |

#### Responses

Code | Description
------------ | ------------
204 | Config location updated successfully
401 | Invalid token
403 | You do not have access to upload an s3 location to the robot config



## /configs/{configId}/signature
### `PUT /configs/{configId}/signature`
Upload a signature for a config

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
configId | ✅  |  |  | path | integer |
signature | ✅ |  |  | body | string |

#### Responses

Code | Description
------------ | ------------
204 | Config signature updated successfully
401 | Invalid token
403 | You do not have access to upload a signature to the robot config
