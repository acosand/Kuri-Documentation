---
layout: reference
title: Filters
tags:
- cloud
- moments
---

# Filters
## /filters
### `GET /filters`
Fetch all moment filters

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
limit |  | 10 | number of records to return. | query | integer |
page |  | 1 | page number to start on. | query | integer |

#### Responses

Code | Description
------------ | ------------
400 | Limit is invalid
401 | Invalid token



### `POST /filters`
Creates a moment filter (channel).

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
name | ✅ |  | filter name | body | string |
filter | ✅ |  | uri of filter | body | string |
notification |  |  | flag for receiving notifications | body | boolean |

#### Responses

Code | Description
------------ | ------------
201 | Filter created successfully
400 | Filter name is required
401 | Invalid token



### `GET /filters/{filterUUID}`
Fetch moment filter by UUID
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



### `DELETE /filters/{filterUUID}`
Delete moment filter by UUID
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



### `PUT /filters/{filterUUID}`
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
