---
layout: reference
title: Filter
tags:
- cloud
- moments
---

# Filter
## /filter/{filterUUID}
> ⚠️ deprecated for [Filters](./filters.md)

### `GET /fiter/{filterUUID}`
> ❌ deprecated, use `GET /filters/{filterUUID}` instead

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
filterUUID | ✅  |  |  | path | string |

#### Responses

Code | Description
------------ | ------------
401 | Invalid token
404 | Filter not found



### `DELETE /filter/{filterUUID}`
> ❌ deprecated, use `DELETE /filters/{filterUUID}` instead

Delete filter by UUID

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
filterUUID | ✅  |  |  | path | string |

#### Responses

Code | Description
------------ | ------------
401 | Invalid token
404 | Filter not found



### `PUT /filter/{filterUUID}`
> ❌ deprecated, use `PUT /filters/{filterUUID}` instead

Update a filter

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
filterUUID | ✅  |  |  | path | string |
name |  |  | filter name | body | string |
filter |  |  | uri of filter | body | string |
notification |  |  | flag for receiving notifications | body | boolean |
position |  |  | filter ordering position | body | number |

#### Responses

Code | Description
------------ | ------------
400 | Position not valid
401 | Invalid token
404 | Filter not found
