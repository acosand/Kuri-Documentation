---
layout: reference
title: Robots
tags:
- cloud
- robot
---

# Robots
## /robots
### `GET /robots`
Fetch all robots within the user's profiles

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
page |  |  |  | query | integer |
limit |  |  |  | query | integer |
filter[uuid] |  |  |  | query | string |
filter[status] |  |  |  | query | string |
filter[serialNumber] |  |  |  | query | string |
order |  |  | order to sort result with in the format {column}:{ordering} | query | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully fetch all robots for a user's profile
401 | Invalid token



## /robots/{robotUUID}
### `GET /robots/{robotUUID}`
Fetch data from a specific robot

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUID | ✅  |  | uuid of robot to fetch status for | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Fetch a single robot's information
401 | Invalid token
404 | Robot not found (which could mean you have no access to this robot)



### `PATCH /robots/{robotUUID}`
Update properties of robot
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
timezone |  |  | time zone of robot (according to the [MomentJS specification](https://github.com/moment/moment-timezone/blob/develop/data/packed/latest.json)) | body | string |
status |  |  | a valid robot status | body | string | { enum: active,activating,inactive,lost,resetting }

#### Responses

Code | Description
------------ | ------------
200 | Robot time zone successfully updated
401 | Invalid token
404 | Robot not found (which could mean you have no access to this robot)


### `PUT /robots/{robotUUID}`
Register a newly created robot
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUID | ✅  |  | robot uuid to fetch robot info | path | string |
btPubKey | ✅ |  | Bluetooth encryption key for the robot | body | string |
hostname | ✅ |  |  | body | string |
serialNumber | ✅ |  |  | body | string |
dmiUUID |  |  |  | body | string |
wifiMAC |  |  |  | body | string |
bluetoothMAC |  |  |  | body | string |
infinionChipId |  |  |  | body | string |
cjProdSignature |  |  |  | body | string |
brProdSignature |  |  |  | body | string |
bnoChipId |  |  |  | body | string |
otaKey |  |  | Key for encrypting OTA key | body | string |
robotKey |  |  | Key for verifying robot signature | body | string |
tpmPublicEndorsementKey |  |  | Key for verifying TPM against Intel database | body | string |
updatedAt |  |  |  | body | string |
createdAt |  |  |  | body | string |
mfgBuild |  |  |  | body | string |
otaConfigId |  |  | config ID that robot installs through OTA | body | integer |
biosVersion |  |  |  | body | string |

#### Responses

Code | Description
------------ | ------------
200 | Robot and Bluetooth encryption public key entries are successfully created
400 | Bad request
401 | Invalid token



## /robots/ota-chain
### `GET /robots/ota-chain`
Get ota chain for a robot
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
robotUUID |  |  | robot uuid | query | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully fetched ota chain for the robot.


## /robots/{robotUUID}/moments
> (deprecated)

### `GET /robots/{robotUUID}/moments`
> (deprecated)

Fetch specific robot timeline
This endpoint is now deprecated, use GET /moments instead.      This endpoint currently returns moments from all robots that belong      to the profile of the user logged in (CLOUD-1927).      Use query parameter "filter[KEY]" to filter moments that are fetched.      The "momentTime" filter expects a time range in UTC.      For example to filter moments between 17:00:00-19:00:00 use      "filter[momentTime]=17:00:00-19:00:00"
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUID | ✅  |  | uuid of robot to fetch moments for. | path | string |
limit |  | 50 | Total number of records to return. | query | integer |
page |  | 1 | Specific page to fetch. | query | integer |

#### Responses

Code | Description
------------ | ------------
400 | The field name does not exist.
401 | Invalid token
404 | Not Found



## /robots/{robotUUID}/bluetooth-public-key
### `GET /robots/{robotUUID}/bluetooth-public-key`
Get public key for a robot
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
robotUUID | ✅  |  | robot uuid to fetch robot info | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully fetched public key for the robot.



## /robots/{robotUUID}/config
### `PUT /robots/{robotUUID}/config`
Assign a config to a robot
Returns empty
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUID | ✅  |  |  | path | string |
configId | ✅ |  |  | body | integer |

#### Responses

Code | Description
------------ | ------------
204 | Robot config updated successfully


## /robots/{robotUUID}/configs
### `GET /robots/{robotUUID}/configs`
Gets a list of robot configs that the robot has installed
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUID | ✅  |  |  | path | string |

#### Responses

Code | Description
------------ | ------------
200 |



## /robots/{robotUUID}/reset-history
### `GET /robots/{robotUUID}/reset-history`
Get reset history for a robot
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUID | ✅  |  | robot uuid to fetch robot reset history | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully retrieved robot reset history
400 | Invalid robot UUID (or you don't have access to this robot)
401 | Invalid token



## /robots/{robotUUID}/parameters
### `GET /robots/{robotUUID}/parameters`
Fetch all parameters of a robot
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUID | ✅  |  |  | path | string |

#### Responses

Code | Description
------------ | ------------
200 |
400 | Invalid robot uuid (or you don't have access to this robot)
401 | Invalid token



### `PATCH /robots/{robotUUID}/parameters`
Updates parameters of a robot
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
parameterUUID1 |  | parameterValue1 |  | body | string |
parameterUUID2 |  | parameterValue2 |  | body | string |

#### Responses

Code | Description
------------ | ------------
204 | Robot parameters updated successfully
400 | Invalid parameter UUIDs
400 | Invalid parameter values
400 | Invalid robot UUID
401 | Invalid token
403 | No access to update non-individual robot parameters



## /robots/{robotUUID}/schedules
### `GET /robots/{robotUUID}/schedules`
Get the schedule of a robot
start and stop times are timezoneless
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUID | ✅  |  | uuid of the robot | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Schedules for the robot retrieved
400 | Invalid robot UUID
401 | Invalid token



### `PUT /robots/{robotUUID}/schedules`
Update robot's schedule
start and stop times are timezoneless
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUID | ✅  |  |  | path | string |
schedule |  |  |  | body | array |

#### Responses

Code | Description
------------ | ------------
200 | Updated Schedules
400 | Invalid schedules in the payload
400 | Invalid start time for schedules
400 | Invalid stop time for schedules
400 | Invalid type for schedules
400 | Invalid day for schedules
400 | Invalid robot UUID
400 | Invalid enabled value in the payload
401 | Invalid token



## /robots/{robotUUID}/options
### `GET /robots/{robotUUID}/options`
Get valid options of robot

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUID | ✅  |  | uuid of robot to fetch options for | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Robot options fetched successfully
400 | Robot UUID not valid
401 | Invalid token
403 | No permission to robot



## /robots/{robotUUID}/session
### `PUT /robots/{robotUUID}/session`
Log the robot in.
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
timestamp | ✅ |  | unix timestamp | body | number |
signature | ✅ |  | signature | body | string |

#### Responses

Code | Description
------------ | ------------
201 | Robot Login
400 | Invalid unix timestamp.
400 | Invalid signature
400 | Timestamp out of range
401 | Unable to authenticate robot



## /robots/{robotUUID}/status
### `GET /robots/{robotUUID}/status`
Get status of robot

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
robotUUID | ✅  |  | uuid of robot to fetch status for | path | string |
domain |  |  | domain | query | string |
order |  |  | order to sort result with in the format {column}:{ordering} | query | string |
status |  |  | status | query | string |

#### Responses

Code | Description
------------ | ------------
200 | Robot status fetched successfully
400 | Status domain not valid
401 | Invalid token
404 | Status not found for robot/domain.



## /robots/{robotUUID}/user-access-authentication-public-key
### `GET /robots/{robotUUID}/user-access-authentication-public-key`
Get public key to allow the robot to verify the user's access is authenticated. Public-private key pair will be generated on demand if required.
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
robotUUID | ✅  |  | robot uuid to fetch robot info | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully fetched user access authentication public key for the robot.
400 | Robot UUID not valid.
401 | Invalid token
403 | No access to robot.
404 | No user access authentication public key generated for robot UUID.


## /robots/{robotUUID}/software-update
### `GET /robots/{robotUUID}/software-update`
Get software update information for a robot
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
Authorization |  |  |  | header | string |
robotUUID | ✅  |  | robot uuid to fetch robot info | path | string |
configId | ✅  |  | Robot configId | query | integer |

#### Responses

Code | Description
------------ | ------------
200 | Successfully fetched software info for the robot.


## /robots/{robotUUID}/reset
### `PUT /robots/{robotUUID}/reset`
Reset robot to inactive state
returns data: [{ status, robotUUID }]
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
resetType | ✅ |  | Reset type | body | string | { enum: reboot,softwareReset }
password |  |  | Password for user that does not have csrAdmin role | body | string | { minLength: 6 }
userEmail |  |  | Robot's associated user email when requested by csrAdmin role | body | string |

#### Responses

Code | Description
------------ | ------------
200 | Robot successfully reset
400 | Robot update failed.
404 | Robot UUID not found



## /robots/{robotUUID}/user-auth/signature
### `GET /robots/{robotUUID}/user-auth/signature`
Get the signature (signed using the user access authentication private key) for the input message string
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
robotUUID | ✅  |  | robot uuid to fetch robot info | path | string |
message | ✅  |  |  | query | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully signed the input string.
400 | Input message is required.
401 | Invalid token
404 | Robot not found.
404 | User access authentication private key not found for robot UUID.



## /robots/{robotUUID}/profiles/{profileUUID}
### `PUT /robots/{robotUUID}/profiles/{profileUUID}`
Associate a robot with a user profile
This endpoint replaces POST /robots. Note that timezone changes must be done with a call to PATCH /robots instead of this endpoint. The response from this endpoint is encrypted.
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
profileUUID | ✅  |  | uuid of profile robot will belong to | path | string |
robotUUID | ✅  |  | uuid of robot you are adding into the system | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Robot successfully saved
400 | Profile UUID must be a valid uuidv1.
400 | Robot is already activated
401 | Invalid token
404 | Robot UUID not found.



## /robots/all/configs
### `PUT /robots/all/configs`
Assign a config to a robot
returns empty response
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
configId | ✅ |  |  | body | integer |

#### Responses

Code | Description
------------ | ------------
204 | Robot configs updated
400 | Robot update failed.
401 | Invalid token
404 | Config UUID not found
