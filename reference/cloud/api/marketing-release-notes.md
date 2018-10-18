---
layout: reference
title: Marketing Release Notes
tags:
- cloud
- mobile app
---

# Marketing Release Notes
## /marketing-release-notes
### `GET /marketing-release-notes`
Fetch all marketing release notes for a user

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
limit |  | 5 | number of records to return. | query | integer |
page |  | 1 | page number to start on. | query | integer |
appBuildNumber |  |  | app build number | query | integer |
robotConfigId |  |  | robot config ID | query | integer |
appVersion |  |  | app version | query | string |

#### Responses

Code | Description
------------ | ------------
400 | Invalid robot config ID.
400 | Invalid limit.
400 | Invalid page.
400 | Invalid app build number.
401 | Invalid token



## /marketing-release-notes/user
### `PATCH /marketing-release-notes/user`
Update whether or not a user has read a set of release notes
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
uuid | ✅ |  | Release note UUID | body | string |
hasBeenViewed | ✅ |  | Has the release note been viewed by the user? | body | boolean |

#### Responses

Code | Description
------------ | ------------
204 | User release note viewed status updates successfully
