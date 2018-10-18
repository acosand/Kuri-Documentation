---
layout: reference
title: Users
tags:
- cloud
- user
---

# Users
## /users
### `GET /users`
Fetch users, restricted to csrAdmin only

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
page |  | 1 | page number to start on. | query | integer |
limit |  | 10 | number of records to return. | query | integer |
order |  |  | order to sort result with in the format {column}:{ordering} | query | string |
filter[email] |  |  | filter records by email address. | query | string |
filter[uuid] |  |  |  | query | string |
filter[firstName] |  |  | filter records by first name | query | string |
filter[lastName] |  |  | filter records by last name | query | string |
filter[status] |  |  | filter records by user status | query | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully fetch a list of users in the system.
400 | Page is invalid.
401 | Invalid token
403 | No Access.
404 | Not Found



### `POST /users`
Creates a user record.

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
email | ✅ |  | email address of new user | body | string |
password | ✅ |  | password of new user | body | string | { minLength: 6 }
firstName |  |  | first name of new user | body | string |
lastName |  |  | last name of new user | body | string |
fullName |  |  | full name of new user | body | string |
tosAgreedToAt |  |  | The date the Terms of Service were agreed to. DEPRECATED: By calling this endpoint, you are agreeing to the TOS. | body | string |
marketingOptIn |  |  | marketing opt-in flag | body | boolean |
twoFactorAuth |  |  |  | body |  |

#### Responses

Code | Description
------------ | ------------
200 | Successfully create a user
400 | Email is required.



## /users/{uuid}
### `GET /users/{uuid}`
Fetch user data by uuid
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
uuid | ✅  |  | uuid of user to fetch info for | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully retrieve user info



### `DELETE /users/{uuid}`
Set an existing user profile and associated references to deleted

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
uuid | ✅  |  | uuid of user to delete | path | string |
password |  |  | account's password | body | string |

#### Responses

Code | Description
------------ | ------------
200 | Successful



### `PATCH /users/{uuid}`
Update specific user by uuid

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
uuid | ✅  |  | uuid of user to update | path | string |
fullName |  |  | full name used for updating. | body | string |
firstName |  |  | new first name value used for updating | body | string |
lastName |  |  | new last name value used for updating | body | string |
email |  |  | new email value used for updating | body | string |
currentPassword |  |  | current password, required when changing password | body | string | { minLength: 6 }
password |  |  | new password used for updating | body | string | { minLength: 6 }
status |  |  | new account status state (requires admin privilege to update) | body | string |
admin |  |  | new account admin privilege state (requires admin privilege to update) | body | boolean |
tosAgreedToAt |  |  | the date the Terms of Service were agreed to. DEPRECATED: By calling this endpoint, you are agreeing to the TOS. | body | string |
tosAgreed |  |  | set to true if the TOS have been agreed to | body | boolean |
twoFactorAuth |  |  |  | body |  |

#### Responses

Code | Description
------------ | ------------
200 | Successfully update a specific user
400 | Invalid user UUID.
401 | Invalid token
403 | You do not have access to update another user.
403 | Admin user does not have permission to update another user's password.
404 | This user does not exist.



## /users/{uuid}/pending-two-factor-auth
### `POST /users/{uuid}/pending-two-factor-auth`
Modify mobile number for two-factor auth
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
uuid | ✅  |  | UUID of user to change two-factor auth | path | string |
mobileNumber | ✅ |  | authentication mobile number | body | string | { pattern: /^([0-9]{3})\W*([0-9]{3})\W*([0-9]{4})$/ }
mobileCountryCode | ✅ |  | authentication mobile country code | body | integer |

#### Responses

Code | Description
------------ | ------------
201 | Successfully generate a 2FA session and token



## /users/sessions
### `POST /users/sessions`
Log the user in.
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
email | ✅ |  | account's email | body | string |
password | ✅ |  | account's password | body | string |

#### Responses

Code | Description
------------ | ------------
201 | Successfully remove two factor authentication
400 | Password is required.
400 | Email address is required.
401 | Bad email and password combination.



## /users/sessions/verify
### `POST /users/sessions/verify`
Verify a user login using a two factor authentication code.

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
code | ✅ |  | two factor authentication code | body | string |
sessionUUID |  |  | DEPRECATED - UUID of session to verify | body | string |

#### Responses

Code | Description
------------ | ------------
201 | Successfully log in
400 | Code is required.
401 | Invalid token



## /users/sessions/{uuid}
### `DELETE /users/sessions/{uuid}`
Invalidates a user session.  Logout
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
uuid | ✅  |  | uuid of session to delete | path | string |

#### Responses

Code | Description
------------ | ------------
204 | Successfully Logged out
400 | Session Id does not exist.



## /users/sessions/{sessionUUID}/refresh
### `PUT /users/sessions/{sessionUUID}/refresh`
Refresh users JWT token
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
sessionUUID | ✅  |  | uuid of session to refresh | path | string |
appVersion |  |  | App version string | body | string | { pattern: /(^\d+).(\d+).(\d+)$/ }
buildNumber |  |  | App build number | body | integer | { minimum: 1 }
deviceToken |  |  | Device token | body | string |
platform |  |  | Supported platforms are currently iOS and android | body | string | { enum: ios,android }

#### Responses

Code | Description
------------ | ------------
200 | Successfully log in
404 | User account not found.  JWT cannot be refreshed.
404 | User sessionUUID not found.  JWT cannot be refreshed.



## /users/diagnostic-reports
### `POST /users/diagnostic-reports`
Fetch S3 details for uploading diagnostic report and create database record
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |

#### Responses

Code | Description
------------ | ------------
201 | Successfully retrieve diagnostic report location



## /users/{userUUID}/diagnostic-reports
### `GET /users/{userUUID}/diagnostic-reports`
Fetch S3 details for diagnostic reports uploaded by a user
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
userUUID | ✅  |  | uuid of user to get diagnostic report locations for | path | string |
order |  |  | order to sort result with in the format {column}:{ordering} | query | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully retrieve diagnostic reports



## /users/{uuid}/roles
### `PUT /users/{uuid}/roles`
Set a specific user's roles, restricted to csrAdmin use only
Note that this endpoint will replace a user's roles with those supplied in the payload.
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
uuid | ✅  |  | uuid of user to update | path | string |
roles |  |  |  | body | array |

#### Responses

Code | Description
------------ | ------------
200 | Successfully update a specific user's roles
400 | Invalid user UUID
401 | Invalid token
403 | You do not have access to update another user
404 | This user does not exist
404 | This role does not exist.



## /users/recover-password
### `POST /users/recover-password`
Initialize the recover password flow.

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
email | ✅ |  | email of account to recover password for | body | string |

#### Responses

Code | Description
------------ | ------------
201 | Successfully start the password recovery flow
400 | Valid email address is required.



## /users/recover-password/verify/{token}
### `GET /users/recover-password/verify/{token}`
Recover Password, verify email'd token.

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
token | ✅  |  | email'd token which starts the recover password steps. | path | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully check the email'd token for password recovery
400 | Token must be valid string



## /users/recover-password/reset-password
### `POST /users/recover-password/reset-password`
Recover Password, reset the password.

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
token | ✅ |  | token used for recovering password | body | string |
password | ✅ |  | new password | body | string |

#### Responses

Code | Description
------------ | ------------
201 | Successfully reset the password. Final Step.
400 | Token is required.



## /users/two-factor-auth
### `DELETE /users/two-factor-auth`
Removes two factor authentication (2FA) from user account.
Can be called with 2FA verification JWT token. Requires that 2FA is not verified yet, or if it has been verified, must supply a 2FA code and session UUID.
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
code | ✅ |  | two factor authentication code | body | string |
sessionUUID |  |  | DEPRECATED - UUID of session to verify | body | string |

#### Responses

Code | Description
------------ | ------------
200 | Successfully remove two factor authentication
204 | Successfully removed two factor authentication
400 | Code is not valid. Please use the resend code button to request a new one.
401 | Invalid token



## /users/two-factor-auth/code
### `GET /users/two-factor-auth/code`
Resend code for 2FA
#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
phoneNumber |  |  | Phone number to send code to, must be already added as 2Fa or 2Fa pending. If excluded          and both 2FA verified and 2FA pending exist then defaults to 2FA verified | query | string |

#### Responses

Code | Description
------------ | ------------
204 | Successfully sent a 2FA code request
400 | Error returned from two factor authentication provider
401 | Invalid token



## /users/{uuid}/two-factor-auth
### `DELETE /users/{uuid}/two-factor-auth`
Removes two factor authentication (2FA) from another user account. restricted to csrAdmin only

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |
uuid | ✅  |  | uuid of user to delete 2FA for | path | string |

#### Responses

Code | Description
------------ | ------------
204 | Successfully removed two factor authentication
401 | Invalid token
403 | You do not have permission to disable two factor auth for another user.
404 | User UUID not found.



## /users/verify-email
### `POST /users/verify-email`
Initialize the verify email flow.

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
authorization | ✅  |  |  | header | Bearer Token |

#### Responses

Code | Description
------------ | ------------
201 | Successfully start the verify email flow
400 | Cannot verify email for inactive user.
401 | Invalid token



## /users/verify-email/{email}
### `GET /users/verify-email/{email}`
Verify user email address.

#### Parameters

Parameter | Required | Example Value | Description | Parameter Type | Data Type | Schema
------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------
email | ✅  |  | Email verification | path | string |
token | ✅  |  | Email verification token | query | string |

#### Responses

Code | Description
------------ | ------------
200 | Verify an email account
400 | The token is expired.
