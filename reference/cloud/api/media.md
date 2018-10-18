---
layout: reference
title: Media
tags:
- cloud
- moments
---

# Media
## /media/{mediaType}
### `POST /media/{mediaType}`
Save a media record in the db

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
mediaType | ✅  |  | media type | path | string |
s3Bucket | ✅ |  | S3 Bucket where media will be stored | body | string |
s3Key | ✅ |  | S3 Key of media | body | string |
s3Host | ✅ |  | S3 host where media is stored | body | string | { enum: s3-us-west-2.amazonaws.com }
userId | ✅ |  | id of the user this media belongs to | body | number |
robotId | ✅ |  | robot id used to take this media | body | number |
profileId | ✅ |  | profile id media belongs to | body | number |
momentType | ✅ |  | media moment type | body | string |
placeId | ✅ |  | place id of place media was taken | body | number |

#### Responses

Code | Description
------------ | ------------
201 | Successfully save a new media
400 | Moment Type is required
401 | Invalid token
403 | No permissions to post media content
404 | User ID does not exist



## /media/{mediaType}/{uuid}
### `GET /media/{mediaType}/{uuid}`
Fetch a specific type of media by uuid

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
uuid | ✅  |  | uuid of the media to fetch | path | string |
mediaType | ✅  |  | media type of the media to fetch | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully fetched specific media
400 | Invalid id
401 | Invalid token
403 | No Access to view media.
404 | Valid media type is required.



### `DELETE /media/{mediaType}/{uuid}`
Soft delete a specific media

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
uuid | ✅  |  | uuid of the media to delete | path | string |
mediaType | ✅  |  | media type of the media to delete | path | string |

#### Responses

Code | Description
------------ | ------------
204 | Successful soft delete
400 | Invalid Media UUID.
401 | Invalid token
403 | No permission to delete media.
404 | Media was not found.
