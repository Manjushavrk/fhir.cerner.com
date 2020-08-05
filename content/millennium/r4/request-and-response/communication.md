---
title: Communication | R4 API
---

# Communication

* TOC
{:toc}

## Overview

The Communication resource is a conveyance of information from one entity, a sender, to another entity, a receiver. The information includes encoded data and optionally a related Patient and a related Encounter.

The following fields are returned if valued:

* [Communication Id](https://hl7.org/FHIR/communication-definitions.html#Communication.identifier)
* [Status (Completed)](https://hl7.org/FHIR/communication-definitions.html#Communication.status)
* [Category](https://hl7.org/FHIR/communication-definitions.html#Communication.category)
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

## Extensions

### Custom Extensions

All URLs for custom extensions are defined as `https://fhir-ehr.cerner.com/r4/StructureDefinition/{id}`

ID             | Value\[x] Type      | Description
---------------|---------------------|----------------------------------------------------------------------------------
`reply-to`     | [`Reference`]       | Used to direct where replies to the communications should be sent. Must be a Reference(Group)
`email-status` | [`CodeableConcept`] | Status of the electronic communication (in-progress, completed, received)

## Search

Search for Communications that meet supplied query parameters:

    GET /Communication?:parameters

_Implementation Notes_

* The Content of a communication will be returned through the Binary Resource. A reference to the payload will be provided in the Payload section.
* Only 1000 elements max will be returned based in the date range.

### Authorization Types

<%= authorization_types(practitioner: true, patient: false, system: true) %>

### Parameters

 Name         | Required?                                       | Type          | Description
--------------|-------------------------------------------------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------
 `_id`        | This or `category` or `recipient` or `received` | [`token`]     | The logical resource id associated with the resource. Example: `C-1123_0`
 `category`   | This or `_id` or `recipient` or `received`      | [`token`]     | A token for a [`CodeableConcept`] that points to the CodeableConcept used for Communiation.category. Example: `category=reminder` or `category=notification`
 `recipient`  | This or `_id` or `category`  or `received`      | [`reference`] | The recipient of the Communication. Example: `recipient=Practitioner/3456783` or `recipient:Group=8765556`
 `recieved`   | This or `_id` or `category`  or `recipient`     | [`date`]      | Date range into which the communication falls. Example: `recieved=le2017-02-01T10:30:00Z` or `received=ge2020-03-16T21:31:35.458Z&received=le2020-07-16T21:31:35.457Z"`

 Notes:

 * The `recipient` parameter must represent a Practitioner or a Group and may use the `:Group` modifier.
 * The `recieved` parameter must use the `ge` and/or `le` prefixes.

### Headers

<%= headers fhir_json: true %>

### Example

#### Request

    GET https://fhir-open.sandboxcerner.com/r4/0b8a0111-e8e6-4c26-a91c-5069cbc6b1ca/Communication?_id=C-1123_0

#### Response

<%= headers status: 200 %>
<%= json(:r4_communication_bundle) %>
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
<%= json(:r4_communication_entry) %>
<%= disclaimer %>

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

<%= json(:r4_communication_create) %>

#### Response

<%= headers status: 201 %>
 <!-- The location header: (https://fhir-ehr.sandboxcerner.com/r4/0b8a0111-e8e6-4c26-a91c-5069cbc6b1ca/Communication/C-123_0) may not be returned, discussion is ongoing. --->
<pre class="terminal">
Cache-Control: no-cache
Content-Length: 0
Content-Type: application/json
Date: Tue, 04 Aug 2020 17:59:03 GMT
Etag: W/"0"
Last-Modified: Tue, 04 Aug 2020 17:59:03 GMT
Server-Response-Time: 22.810143
Status: 201 Created
Vary: Origin
X-Request-Id: b89310ef-51ef-4b76-b92e-d070496c999c
X-Runtime: 0.022706
</pre>

The `ETag` response header indicates the current `If-Match` version to use on subsequent updates.

<%= disclaimer %>

### Errors

The common [errors] and [OperationOutcomes] may be returned.

[`reference`]: https://hl7.org/fhir/R4/search.html#reference
[`token`]: https://hl7.org/fhir/R4/search.html#token
[`date`]: http://hl7.org/fhir/R4/search.html#date
[`CodeableConcept`]: http://hl7.org/fhir/R4/datatypes.html#codeableconcept
[errors]: ../../#client-errors
[OperationOutcomes]: https://hl7.org/fhir/R4/operationoutcome.html
