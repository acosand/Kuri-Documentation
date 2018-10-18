---
layout: reference
title: Emails
tags:
- cloud
- user
---

# Emails
## /emails/blacklist
### `GET /emails/blacklist`
> 🔐 Admin only

Fetch emails from the email blacklist

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
page |  | 1 | page number to start on. | query | integer |
limit |  | 10 | number of records to return. | query | integer |
filter[email] |  |  | filter records by email address. | query | string |
filter[isBlacklisted] |  |  | filter records by blacklisted state. | query | boolean |

#### Responses

Code | Description
------------ | ------------
200 | Successfully fetch the list emails from the blacklist
400 | Page is invalid
401 | Invalid token
403 | You do not have permission to list the blacklist



## /emails/blacklist/{email}
### `DELETE /emails/blacklist/{email}`
> 🔐 Admin only

Removes an email from the blacklist by marking it as not to be blacklisted

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
email | ✅  |  | email to remove from the blacklist | path | string |

#### Responses

Code | Description
------------ | ------------
204 | Successfully removed from the blacklist
400 | Unable to remove email from blacklist
403 | You do not have permission to remove from the blacklist
404 | Email not found
