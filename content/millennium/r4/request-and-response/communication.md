---
title: Communication | R4 API
---

# Communication

* TOC
{:toc}

## Overview

The Communication resource ....

The following fields are returned if valued:

* [Communication Id](https://hl7.org/FHIR/communication-definitions.html#Communication.identifier)
* [In Response To](https://hl7.org/FHIR/communication-definitions.html#Communication.inResponseTo)
* [Status (Completed)](https://hl7.org/FHIR/communication-definitions.html#Communication.status)
* [Communication (Category Message, Reminder, Coding Query)](https://hl7.org/FHIR/communication-definitions.html#Communication.category)
* [Priority](https://hl7.org/FHIR/communication-definitions.html#Communication.priority)
* [Subject](https://hl7.org/FHIR/communication-definitions.html#Communication.subject)
* [Topic](https://hl7.org/FHIR/communication-definitions.html#Communication.topic)
* [Encounter](https://hl7.org/FHIR/communication-definitions.html#Communication.encounter)
* [Recieved](https://hl7.org/FHIR/communication-definitions.html#Communication.received)
* [Recipient](https://hl7.org/FHIR/communication-definitions.html#Communication.recipient)
* [Sent](https://hl7.org/FHIR/communication-definitions.html#Communication.sent)
* [Sender](https://hl7.org/FHIR/communication-definitions.html#Communication.sender)
* [Payload](https://hl7.org/FHIR/communication-definitions.html#Communication.payload)

## Terminology Bindings

<%= terminology_table(:communication, :r4) %>

## Search

Search for Communications that meet supplied query parameters:

    GET /Communication?:parameters

### Authorization Types

<%= authorization_types(practitioner: true, patient: false, system: true) %>

### Parameters

 Name         | Required? | Type          | Description
--------------|-----------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------
 `_id`        | This or `todo` | [`token`]     | The logical resource id associated with the resource. Example: `C-1123_0`

### Headers

<%= headers fhir_json: true %>

### Example

#### Request

    GET https://fhir-open.sandboxcerner.com/r4/0b8a0111-e8e6-4c26-a91c-5069cbc6b1ca/Communication?_id=C-1123_0

#### Response

<%= headers status: 200 %>


<%= disclaimer %>

### Errors

The common [errors] and [OperationOutcomes] may be returned.

## Retrieve by id

List an individual Communication by its id:

    GET /Communication/:id

### Authorization Types

<%= authorization_types(practitioner: true, patient: false, system: true) %>

### Headers

<%= headers fhir_json: true %>

### Example

#### Request

    GET https://fhir-open.sandboxcerner.com/r4/0b8a0111-e8e6-4c26-a91c-5069cbc6b1ca/Communication/C-1123_0

#### Response

<%= headers status: 200 %>


<%= disclaimer %>

### Errors

The common [errors] and [OperationOutcomes] may be returned.

## Create

Create a new Communication.

    POST /Communication

_Implementation Notes_

* Only the body fields mentioned below are supported. Unsupported fields will be ignored.
* Modifier fields should not be provided, and will cause the transaction to fail.

### Authorization Types

<%= authorization_types(practitioner: true, patient: false, system: true) %>

### Headers

<%= headers head: {Authorization: '&lt;OAuth2 Bearer Token>', Accept: 'application/fhir+json', 'Content-Type': 'application/fhir+json'} %>

### Body Fields

<%= definition_table(:communication, :create, :r4) %>

### Example

#### Request

    POST https://fhir-ehr.sandboxcerner.com/r4/0b8a0111-e8e6-4c26-a91c-5069cbc6b1ca/Communication

#### Body



#### Response

<%= headers status: 201 %>
<pre class="terminal">
Cache-Control: no-cache
Content-Length: 0
Content-Type: text/html
Date: Tue, 31 Mar 2020 15:37:25 GMT
Etag: W/"881057"
Location: https://fhir-ehr.sandboxcerner.com/r4/0b8a0111-e8e6-4c26-a91c-5069cbc6b1ca/Communication/C-1123_0
Last-Modified: Tue, 31 Mar 2020 15:37:25 GMT
Server-Response-Time: 296.405243
Status: 201 Created
Vary: Origin
X-Request-Id: 11111111111111111111111111111111
X-Runtime: 2.011826
</pre>

The `ETag` response header indicates the current `If-Match` version to use on subsequent updates.

<%= disclaimer %>

### Errors

The common [errors] and [OperationOutcomes] may be returned.

[`reference`]: https://hl7.org/fhir/r4/search.html#reference
[`token`]: https://hl7.org/fhir/R4/search.html#token
[errors]: ../../#client-errors
[OperationOutcomes]: https://hl7.org/fhir/R4/operationoutcome.html