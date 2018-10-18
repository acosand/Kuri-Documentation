---
layout: reference
title: Files
tags:
- cloud
- robot
---

# Files
## /files
### `GET /files`
> 🔐 Admin only

Get all file to use with a config

#### Responses

Code | Description
------------ | ------------
200 | Files retrieved successfully
401 | Invalid token
403 | You do not have access to get files to use with the config




### `POST /files`
> 🔐 Admin only

Creates a file to use with a config

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
name | ✅ |  | name of file | body | string |
type | ✅ |  |  | body | string | { enum: script,gbz,baseImage,fathomImage,kernel,initrd }
encryptionKey | ✅ |  |  | body | string |
sha256 | ✅ |  |  | body | string |
s3Region | ✅ |  |  | body | string |
s3Bucket | ✅ |  |  | body | string |
s3Key | ✅ |  |  | body | string |

#### Responses

Code | Description
------------ | ------------
201 | File created successfully
400 | Missing required parameter
401 | Invalid token
403 | You do not have access to create a file to use with the config
