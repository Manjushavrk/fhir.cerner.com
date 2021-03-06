---
title: Practitioner | R4 API
---

# Practitioner

* TOC
{:toc}

## Overview

The Practitioner Resource provides information about a person formally involved in the care of a patient on behalf of a healthcare facility. Practitioners include but are not limited to physicians, nurses, pharmacists, therapists, technologists, and social workers.

The following fields are returned if valued:

* [Practitioner id](https://hl7.org/fhir/r4/resource-definitions.html#Resource.id){:target="_blank"}
* [Identifiers/Aliases such as NPI and DEA](https://hl7.org/fhir/r4/practitioner-definitions.html#Practitioner.identifier){:target="_blank"}
* [Active (true/false)](https://hl7.org/fhir/r4/practitioner-definitions.html#Practitioner.active){:target="_blank"}
* [Name](https://hl7.org/fhir/r4/practitioner-definitions.html#Practitioner.name){:target="_blank"}
* [Telecom Information (secure email and phone)](https://hl7.org/fhir/r4/practitioner-definitions.html#Practitioner.telecom){:target="_blank"}
* [Address](https://hl7.org/fhir/r4/practitioner-definitions.html#Practitioner.address){:target="_blank"}
* [Gender](https://hl7.org/fhir/r4/practitioner-definitions.html#Practitioner.gender){:target="_blank"}

## Terminology Bindings

<%= terminology_table(:practitioner, :r4) %>

## Search

Search for Practitioners that meet supplied query parameters:

    GET /Practitioner?:parameters

### Authorization Types

<%= authorization_types(practitioner: true, patient: false, system: true) %>

### Parameters

 Name        | Required?            | Type      | Description
-------------|----------------------|-----------|-------------------------------------------------------
 `_id`       | This or `identifier` | [`token`] | The logical resource id associated with the resource.
 `identifier`| This or `_id`        | [`token`] | A practitioner identifier/alias. Example: `http://hl7.org/fhir/sid/us-npi|4326587548`

 Notes:

* When provided, the `identifier` query parameter must include both a system and a code.

### Headers

<%= headers fhir_json: true %>

### Example

#### Request

    GET https://fhir-open.sandboxcerner.com/r4/0b8a0111-e8e6-4c26-a91c-5069cbc6b1ca/Practitioner?_id=1994021

#### Response

<%= headers status: 200 %>
<%= json(:r4_practitioner_bundle) %>

### Errors

The common [errors] and [OperationOutcomes] may be returned.

## Retrieve by id

List an individual Practitioner by its id:

    GET /Practitioner/:id

### Authorization Types

<%= authorization_types(practitioner: true, patient: false, system: true) %>

### Headers

<%= headers fhir_json: true %>

### Example

#### Request

    GET https://fhir-open.sandboxcerner.com/r4/0b8a0111-e8e6-4c26-a91c-5069cbc6b1ca/Practitioner/1994021

#### Response

<%= headers status: 200 %>
<%= json(:r4_practitioner_entry) %>

### Errors

The common [errors] and [OperationOutcomes] may be returned.

## Create

Create an individual Practitioner.

    POST /Practitioner

### Authorization Types

<%= authorization_types(practitioner: true, patient: false, system: true) %>

### Headers

<%= headers head: {Authorization: '&lt;OAuth2 Bearer Token&gt;', 'Content-Type': 'application/fhir+json'} %>

### Body Fields

<%= definition_table(:practitioner, :create, :r4) %>

### Example

#### Request

    POST https://fhir-ehr.sandboxcerner.com/r4/0b8a0111-e8e6-4c26-a91c-5069cbc6b1ca/Practitioner

#### Body

<%= json(:r4_practitioner_create) %>

#### Response

<%= headers status: 201 %>
<pre class="terminal">
Cache-Control: no-cache
Content-Length: 0
Content-Type: application/fhir+json
Date: Mon, 09 Dec 2019 18:57:39 GMT
Etag: W/"0"
Last-Modified: Mon, 09 Dec 2019 18:57:39 GMT
Location: https://fhir-ehr.sandboxcerner.com/r4/0b8a0111-e8e6-4c26-a91c-5069cbc6b1ca/Practitioner/7118008
Server-Response-Time: 724.624
Status: 201 Created
Vary: Origin
X-Request-Id: 9d3aecfa-c846-4ce2-825a-7ba2fce4813f
X-Runtime: 0.724450
</pre>

### Errors

The common [errors] and [OperationOutcomes] may be returned.

[`token`]: http://hl7.org/fhir/r4/search.html#token
[errors]: ../../#client-errors
[OperationOutcomes]: ../../#operation-outcomes
