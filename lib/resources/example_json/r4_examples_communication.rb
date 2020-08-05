module Cerner
  module Resources

    R4_COMMUNICATION_ENTRY ||= {
      "resourceType": "Communication",
      "id": "C-1123_0",
      "meta": {
          "versionId": "0",
          "lastUpdated": "2020-07-16T21:31:35.457Z"
      },
      "text": {
          "status": "generated",
          "div": "&lt;div xmlns=\"http://www.w3.org/1999/xhtml\">&lt;p>&lt;b>Communication&lt;/b>&lt;/p>&lt;/div>"
      },
      "extension": [
        {
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://hl7.org/fhir/task-status",
                "code": "completed",
                "display": "Completed"
              }
            ],
            "text": "Completed"
          },
          "url": "https://fhir-ehr.cerner.com/r4/StructureDefinition/email-status"
        }
      ],
      "status": "completed",
      "category": [
        {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/communication-category",
              "code": "notification",
              "display": "Notification"
            }
          ],
          "text": "Notification"
        }
      ],
      "priority": "urgent",
      "subject": {
        "reference": "Patient/12505984",
        "display": "JOHNSON, MARIE"
      },
      "topic": {
        "text": "CDI Query"
      },
      "encounter": {
        "reference": "Encounter/97739401"
      },
      "sent": "2020-07-16T21:31:35.457Z",
      "received": "2020-07-16T21:31:35.457Z",
      "recipient": [
        {
          "reference": "Practitioner/12093978",
          "display": "Stone, RN, Sally Cerner"
        },
        {
          "reference": "Group/1568",
          "display": "HEALTHE Receiver Group"
        }
      ],
      "sender": {
        "reference": "Practitioner/11875977",
        "display": "Stratford, Angela Cerner"
      },
      "payload": [
        {
          "contentReference": {
            "reference": "Binary/XR-196103187"
          }
        }
      ]
    }

    R4_COMMUNICATION_BUNDLE ||= {
      "resourceType": "Bundle",
      "id": "e989e20d-5cfc-4b11-ab43-95ba1a684063",
      "type": "searchset",
      "link": [
        {
          "relation": "self",
          "url": "https://fhir-open.stagingcerner.com/r4/9ce2bac1-f00e-43d9-ab88-89e1d4c52e1a/Communication?_id=C-1123_0"
        }
      ],
      "entry": [
        {
          "fullUrl": "https://fhir-open.stagingcerner.com/r4/9ce2bac1-f00e-43d9-ab88-89e1d4c52e1a/Communication/C-1123_0",
          "resource": R4_COMMUNICATION_ENTRY
        }
      ]
    }

    R4_COMMUNICATION_CREATE ||= {
      "resourceType": "Communication",
      "status": "completed",
      "category": [{ 	
          "coding": [{
              "system": "http://terminology.hl7.org/CodeSystem/communication-category",
              "code": "reminder",
              "display": "Reminder"
          }],
          "text": "Reminder"
      }],
      "priority": "urgent",
      "subject": { 
          "reference": "Patient/234455"
      },
      "topic": {
          "coding": [{
              "system": "http://example.com",
              "code": "code"
          }],
          "text": "CDS Query"
      },
      "encounter": { 
          "reference": "Encounter/87648476" 
      }, 
      "recipient": [
          {  
              "reference": "Practitioner/746484674"
          },
          {
              "reference": "Practitioner/6345478364"
          }
      ],
      "sender": {
          "reference": "Practitioner/3464537365"
      },
      "payload": [{ 
          "contentAttachment": { 
              "contentType": "text/plain",
              "data": "Y29tbXVuaWNhaXRvbkA="
          }
      }],
      "extension": [
          {
              "url": "https://fhir-ehr.cerner.com/r4/StructureDefinition/reply-to",
              "valueReference": {
                  "reference": "Group/888444"
              }
          }
      ]
  }  
  end
end
