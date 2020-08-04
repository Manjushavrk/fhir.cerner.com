---
title: Communication | R4 API
---

# Communication

* TOC
{:toc}

## Overview

The Communication resource is a conveyance of information from one entity, a sender, to another entity, a receiver. The information includes encoded data and optionally a related Patient and/or a related Encounter.

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

## Extensions

### Custom Extensions

All URLs for custom extensions are defined as `https://fhir-ehr.cerner.com/r4/StructureDefinition/{id}`

ID             | Value\[x] Type    | Description
---------------|-------------------|----------------------------------------------------------------------------------
`reply-to`     | [`Reference`]     | Used to direct where replies to the communications should be sent. Must be a Reference(Group)
`email-status` | [`Code`]          | Status of the electronic communication (Pending, Opened, Deleted)


## Search

Search for Communications that meet supplied query parameters:

    GET /Communication?:parameters

_Implementation Notes_

* The Content of a communication will be returned through the Binary Resource. A refernece to the payload will be provided in the Payload seciton.
* All Coding Querys are also Messages. A search for the category of Messages will return Coding Queries as part of the response bundle. A search for the category of Coding Queries will return items that have both the category of Coding Query and Message.

### Authorization Types

<%= authorization_types(practitioner: true, patient: false, system: true) %>

### Parameters

 Name         | Required? | Type          | Description
--------------|-----------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------
 `_id`        | This or `category` or `recipient` | [`token`]     | The logical resource id associated with the resource. Example: `C-1123_0`
 `category`   | This or `_id` or `recipient` | [`token`] | A token for a [`CodeableConcept`] that points to the Codeable concept used for Communiation.category. 
 `recipient`  | This or `_id` or `category` | [`reference`] | The recipient of the Communication. Must represent a Practitioner or a Group. May use the `:Practitioner` modifier or the `:Group` modifier. Example: `recipient=Practitioner/3456783` or `recipient:Group=8765556`
 `recieved`   | No | [`date`] | The date/time when the Communication was recieved by the recipient. Must use the `ge` and/or `le` prefixes. Example: `recieved=le2017-02-01T10:30:00Z`

 Note: The below example includes non-normative data. Querying sandbox using the given URLs may not return valid data.

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

### Errors

The common [errors] and [OperationOutcomes] may be returned.


[`reference`]: https://hl7.org/fhir/R4/search.html#reference
[`token`]: https://hl7.org/fhir/R4/search.html#token
[`date`]: http://hl7.org/fhir/R4/search.html#date
[`code`]: http://hl7.org/fhir/R4/datatypes.html#code
[`CodeableConcept`]: http://hl7.org/fhir/R4/datatypes.html#codeableconcept
[errors]: ../../#client-errors
[OperationOutcomes]: https://hl7.org/fhir/R4/operationoutcome.html
