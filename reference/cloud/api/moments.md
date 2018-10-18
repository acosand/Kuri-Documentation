---
layout: reference
title: Moments
tags:
- cloud
- moments
---

# Moments
## /moments
### `GET /moments`
Fetch timeline

Use query parameter "filter[KEY]" to filter moments that are fetched. For example to filter moments between 17:00:00-19:00:00 local time use "filter[localTime]=17:00:00-19:00:00"

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
limit |  | 50 | Total number of records to return | query | integer |
page |  | 1 | Specific page to fetch | query | integer |

#### Responses

Code | Description
------------ | ------------
200 | Successfully retrieves moments
400 | The field name does not exist
401 | Invalid token
403 | No permission to view robot's activity
404 | Not Found



### `DELETE /moments`
Soft delete a batch of moments and their related media

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
momentUUIDs | ✅ |  |  | body | array |

#### Responses

Code | Description
------------ | ------------
204 | Soft delete success
400 | At least one of the moments has already been deleted
400 | At least one of the moment UUIDs is not valid
400 | You can not delete that many moments in one batch
400 | Invalid moment UUID array
401 | Invalid token
403 | You can not delete at least one of these moments
404 | At least one of the moments does not exist



## /moments/{momentUUID}
### `DELETE /moments/{momentUUID}`
Soft delete a specific moment and related media

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
momentUUID | ✅  |  | uuid of the specific moment to delete. | path | string |

#### Responses

Code | Description
------------ | ------------
204 | Soft delete success
400 | Moment has already been deleted
401 | Invalid token
403 | You can not delete this moment
404 | Moment does not exist



## /moments/{momentUUID}/share
### `PUT /moments/{momentUUID}/share`
Increment moment shareCount by one

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
momentUUID | ✅  |  | uuid of shared moment | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Moment share request recorded
400 | Invalid moment UUID
401 | Invalid token
403 | You cannot mark this moment as shared
404 | Moment UUID not found
404 | User UUID not found



## /moments/{momentUUID}/feedback
### `PUT /moments/{momentUUID}/feedback`
Upsert feedback for a specific moment

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
momentUUID | ✅  |  | uuid of moment to update | path | string |
feedback | ✅ |  | value to assign to moment's feedback | body | number | { enum: 1,0,-1 }

#### Responses

Code | Description
------------ | ------------
200 | Feedback updated or saved
400 | Invalid Moment UUID
400 | Moment is already expired
401 | Invalid token
403 | You cannot provide feedback on this moment
404 | User UUID not found



## /moments/{momentUUID}/seen
### `PUT /moments/{momentUUID}/seen`
Increment moment viewCounter by one

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
momentUUID | ✅  |  | uuid of moment to update | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Moment updated
400 | Invalid Moment UUID
401 | Invalid token
403 | You cannot mark this moment as seen
404 | Moment UUID not found



## /moments/smart
### `GET /moments/smart`
Fetch moments for smart feed

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
limit | ✅  |  | Total number of records to return | query | number |
startUUID |  |  | UUID of first smart feed moment to be fetched. | query | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully retrieves smart feed associated to a user
400 | The field name does not exist
401 | Invalid token
403 | No permission to view robot's activity
404 | Not Found
