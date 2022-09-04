<!-- This file is automatically generated by script/update-examples-->

<div class="alert alert-success" markdown="1">**Note:** This example is extracted from [`example-bundle-immunization-covid`](Bundle-example-bundle-immunization-covid.html). See [here](https://github.com/HL7/fhir-shc-vaccination-ig/tree/master/input/examples) for more information.
</div>

```
{
  "resourceType": "Immunization",
  "meta": {
    "security": [
      {
        "system": "https://smarthealth.cards/ial",
        "code": "IAL1.2"
      }
    ]
  },
  "status": "completed",
  "vaccineCode": {
    "coding": [
      {
        "system": "http://hl7.org/fhir/sid/cvx",
        "code": "207"
      }
    ]
  },
  "patient": {
    "reference": "resource:0"
  },
  "occurrenceDateTime": "2021-01-29",
  "performer": [
    {
      "actor": {
        "display": "ABC General Hospital"
      }
    }
  ],
  "lotNumber": "0000007"
}
```