---
layout: reference
title: Locations
tags:
- cloud
- map
---

# Locations
## /locations
### `POST /locations`
Creates a location record.

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
name | ✅ |  | location name | body | string |
profileUUID | ✅ |  | profile uuid location belongs to | body | string |
address |  |  |  | body |  |

#### Responses

Code | Description
------------ | ------------
201 | Location created successfully
400 | Valid profile UUID is required
401 | Invalid token
404 | Specified profile does not exist.



## /locations/{uuid}
### `PATCH /locations/{uuid}`
Updates a location record.

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
uuid | ✅  |  | uuid of location to update | path | string |
name |  |  | location name | body | string |
address |  |  |  | body |  |

#### Responses

Code | Description
------------ | ------------
200 | Location updated successfully
400 | Location UUID is invalid
401 | Invalid token
404 | Location does not exist



## /locations/{locationUUID}/zones
### `POST /locations/{locationUUID}/zones`
Creates a zone record

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
locationUUID | ✅  |  |  | path | string |
name | ✅ |  |  | body | string |

#### Responses

Code | Description
------------ | ------------
200 | Successful



## /locations/{locationUUID}/zones/{zoneUUID}
### `GET /locations/{locationUUID}/zones/{zoneUUID}`
Gets a zone record

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
locationUUID | ✅  |  |  | path | string |
zoneUUID | ✅  |  |  | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Successful



## /locations/{locationUUID}/zones/{zoneUUID}/places
### `POST /locations/{locationUUID}/zones/{zoneUUID}/places`
Creates a place record

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
locationUUID | ✅  |  |  | path | string |
zoneUUID | ✅  |  |  | path | string |
name | ✅ |  |  | body | string |
image |  |  |  | body | string |
pose |  |  |  | body | number | { minimum: -180 }{ maximum: 180 }
headPose |  |  |  | body | number | { minimum: -180 }{ maximum: 180 }

#### Responses

Code | Description
------------ | ------------
200 | Successful



## /locations/{locationUUID}/zones/{zoneUUID}/places/{placeUUID}
### `GET /locations/{locationUUID}/zones/{zoneUUID}/places/{placeUUID}`
Gets a place record

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
locationUUID | ✅  |  |  | path | string |
zoneUUID | ✅  |  |  | path | string |
placeUUID | ✅  |  |  | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Successful
