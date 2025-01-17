////////////////////////////////////////////////////////////////////////////////////////////////////

ValueSet:    VaccineCVX
Id:          vaccine-cvx
Title:       "Vaccine: CVX"
Description: "This value set includes all [CVX](https://www2a.cdc.gov/vaccines/iis/iisstandards/vaccines.asp?rpt=cvx) codes, which identify vaccine products."

* include codes from system http://hl7.org/fhir/sid/cvx

// Ideally we would use this value set because it only includes active CVX codes, but the value set
// expansion is out of date. For now we will stick with all CVX codes so validation works.
// * include codes from valueset http://phinvads.cdc.gov/fhir/ValueSet/2.16.840.1.114222.4.11.934

////////////////////////////////////////////////////////////////////////////////////////////////////

ValueSet:    VaccineGTIN
Id:          vaccine-gtin
Title:       "Vaccine: GTIN"
Description: "This value set includes all [GTIN](https://www.gs1.org/gtin) codes, rather than just the vaccine-related GTINs. This is because there is not a way to filter GTINs to a specific category of product. For more information about GTINs see the [Vaccination profile group information page](vaccination.html)."

* include codes from system https://www.gs1.org/gtin

////////////////////////////////////////////////////////////////////////////////////////////////////

ValueSet:    VaccineSNOMED
Id:          vaccine-snomed
Title:       "Vaccine: SNOMED CT"
Description: "This value set includes codes identifying vaccine products from SNOMED Clinical Terms®,
specifically descendants of [`787859002` (\"Vaccine product\")](http://browser.ihtsdotools.org/?perspective=full&conceptId1=787859002).

**Descendants of this code from *any* edition of SNOMED CT MAY be used in elements bound to this value set.** All
SNOMED codes regardless of edition share the same canonical URI (`http://snomed.info/sct`), which
means that from a conformance perspective, this value set does not differentiate between [SNOMED CT editions].

However, successfully validating resources with elements bound to this value set requires
a terminology server that supports the SNOMED edition used by the implementer.

The terminology server used for publishing this Implementation Guide (`tx.fhir.org`)
supports the following [SNOMED CT editions] as of publishing:

- International
- Australia
- Canada

The relevant codes from these SNOMED CT editions are included in the value set expansion below.

**Note that this value set expansion  may be out of date, and may not include COVID-19-related
codes.** Implementers SHALL defer to [the canonical list of COVID-19-related SNOMED International codes][snomed-covid],
or the national edition equivalent, for COVID-related vaccines when it does not match the codes listed below.

Note that some of the SNOMED-CT codes that are part of this value set expansion,
[including the COVID-19-related SNOMED codes](https://confluence.ihtsdotools.org/display/snomed/SNOMED+CT+COVID-19+Related+Content), may be used under the a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/) as part of [the SNOMED Global Patient Set](https://gps.snomed.org). Please refer to [https://gps.snomed.org](https://gps.snomed.org) to determine which specific SNOMED codes may be used under this license.

[SNOMED CT editions]: https://confluence.ihtsdotools.org/display/DOCEXTPG/4.4.2+Edition+URI+Examples
[snomed-covid]: https://confluence.ihtsdotools.org/display/snomed/SNOMED+CT+COVID-19+Related+Content"

* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"

* include codes from system SCT where concept descendent-of #787859002

// Int'l editions identified at https://confluence.ihtsdotools.org/display/DOCEXTPG/4.4.2+Edition+URI+Examples

// Canadian SNOMED
// https://browser.ihtsdotools.org/?perspective=full&conceptId1=28531000087107&edition=MAIN/SNOMEDCT-CA/2021-03-31&release=&languages=en,fr
* include codes from system SCT|http://snomed.info/sct/20611000087101/version/20210331 where concept descendent-of #787859002

// Australian SNOMED
* include codes from system SCT|http://snomed.info/sct/32506021000036107/version/20210630 where concept descendent-of #787859002


// UK SNOMED is not currently supported by tx.fhir.org: http://tx.fhir.org/r4/
// https://termbrowser.nhs.uk/?perspective=full&conceptId1=39330711000001103&edition=uk-edition&release=v20210512&server=https://termbrowser.nhs.uk/sct-browser-api/snomed&langRefset=999001261000000100,999000691000001104


////////////////////////////////////////////////////////////////////////////////////////////////////

ValueSet:    VaccineICD11
Id:          vaccine-icd-11
Title:       "Vaccine: ICD-11"
Description: "This value set includes the subset of [ICD-11](https://icd.who.int/en) that identify vaccine types.

Note that the COVID-related ICD-11 vaccine codes are not in the `09/2020` version of ICD-11. They
can be found on the [maintenance platform](https://icd.who.int/dev11/l-m/en), and include:

* `XM1NL1`: COVID-19 vaccine, inactivated virus
* `XM5DF6`: COVID-19 vaccine, live attenuated virus
* `XM9QW8`: COVID-19 vaccine, non-replicating viral vector
* `XM0CX4`: COVID-19 vaccine, replicating viral vector
* `XM5JC5`: COVID-19 vaccine, virus protein subunit
* `XM1J92`: COVID-19 vaccine, virus like particle (VLP)
* `XM6AT1`: COVID-19 vaccine, DNA based
* `XM0GQ8`: COVID-19 vaccine, RNA based

Implementers should consider the [ICD-11 maintenance platform](https://icd.who.int/dev11/l-m/en)
the canonical source of ICD-11 codes for COVID-19 vaccines.

Note that this value set should contain the same codes as the [WHO Vaccine List value set](https://who-int.github.io/svc/ValueSet-who-svc-vaccines.html),
and may be replaced with the WHO value set once that is published."

* ^copyright = "More information can be found here: https://icd.who.int/en/docs/icd11-license.pdf.
Contact licensing@who.int to obtain further information."

// HL7 Terminology Authority page for ICD-11
// https://confluence.hl7.org/pages/viewpage.action?pageId=97481986

// XM3KV2 Bacterial vaccines
* include codes from system ICD11 where concept is-a #XM3KV2

// XM61M7 Viral vaccines
* include codes from system ICD11 where concept is-a #XM61M7

// XM4W25 Combination vaccines
* include codes from system ICD11 where concept is-a #XM4W25

// XM7C66 Bacterial and viral vaccines, combined
* include codes from system ICD11 where concept is-a #XM7C66


////////////////////////////////////////////////////////////////////////////////////////////////////

ValueSet:    VaccineATC
Id:          vaccine-atc
Title:       "Vaccine: ATC/DDD"
Description: "This value set includes the subset of [ATC](http://www.whocc.no/atc_ddd_index/?code=J07) that identify vaccine targets.

Note that an ATC code for COVID-19 vaccines (`J07BX03`) [has been created](https://www.who.int/medicines/publications/druginformation/issues/WHO_DI_34_4_ATC-DDD_ClassificationTemp.pdf) and will be added to the next published version of ATC/DDD slated for January 2022."
// Antatomic, Therapeutic and Chemical Classification (ATC)
// https://confluence.hl7.org/pages/viewpage.action?pageId=104584082

* ^copyright = "This artifact includes content from Anatomical Therapeutic Chemical (ATC) classification system. ATC codes are copyright World Health Organization (WHO) Collaborating Centre for Drug Statistics Methodology. Terms & Conditions in https://www.whocc.no/use_of_atc_ddd/"

* include codes from system http://www.whocc.no/atc where concept is-a #J07

////////////////////////////////////////////////////////////////////////////////////////////////////

ValueSet:    QualitativeLabResultsLOINC
Id:          qualitative-lab-results-loinc
Title:       "Qualitative lab results - LOINC"
Description: "This value set includes codes from LOINC answer lists with roughly equivalent meanings to the codes in this [value set of COVID-19-related SNOMED CT codes](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1114.10/expansion)."

* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"

// This value set is not used directly by any profiles, but is included in other value sets.
// It exists as a separate value set to keep the FSH for the other value sets DRY.

// Include codes from LOINC answer lists

// http://loinc.org/vs/LL1055-4 // Detected|Not det|Equiv|Inconcl|Spec unsat for eval
* LNC#LA11882-0 "Detected"
* LNC#LA11883-8 "Not detected"
* LNC#LA11885-3 "Equivocal"
* LNC#LA9663-1 "Inconclusive"
* LNC#LA13548-5 "Specimen unsatisfactory for evaluation"

// http://loinc.org/vs/LL2206-2 // Neg|Borderline|Pos|Strong Pos
* LNC#LA6577-6 "Negative"
* LNC#LA4259-3 "Borderline"
* LNC#LA6576-8 "Positive"
* LNC#LA18996-1 "Strong positive"


////////////////////////////////////////////////////////////////////////////////////////////////////

ValueSet:    LabResultFindingsSNOMED
Id:          lab-result-findings-snomed
Title:       "Lab result findings - SNOMED CT"
Description: "This value set includes SNOMED CT codes for identifying laboratory test results."

* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"

// This value set has to be created separately from LabResultFindings. If the line below is
// included directly within LabResultFindings, the following error occurs:
//
//     ERROR: ValueSet.where(id = 'lab-result-findings'): Error from server: Unable to find
//     value set "http://hl7.org/fhir/uv/shc-vaccination/ValueSet/qualitative-lab-results-loinc"

// Include all clinical finding codes
* include codes from system SCT where concept is-a #404684003 // Clinical finding (finding)
// Note that expansion does not work for #441742003 (Evaluation finding (finding)), which would be preferable

////////////////////////////////////////////////////////////////////////////////////////////////////

ValueSet:    LabResultFindings
Id:          lab-result-findings
Title:       "Lab result findings"
Description: "This value set includes SNOMED CT and LOINC codes for identifying laboratory test results.

Note that we plan to change this value set to include only children of `441742003` (\"Evaluation finding (finding)\")
instead of `404684003` (\"Clinical finding (finding)\"), but currently value set expansion is
not working with this code in the IG Publisher."

* include codes from valueset lab-result-findings-snomed
* include codes from valueset qualitative-lab-results-loinc

////////////////////////////////////////////////////////////////////////////////////////////////////

ValueSet:    QualitativeLabResultFindings
Id:          qualitative-lab-result-findings
Title:       "Qualitative lab result findings"
Description: "This value set includes codes for identifying laboratory test results. It includes SNOMED CT codes from a [value set of COVID-19-related SNOMED CT codes](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1114.10/expansion), as well as codes from LOINC answer lists with roughly equivalent meanings. While the source value set is COVID-19-related, these codes should apply to all infectious disease-related qualitative laboratory results."

* include codes from valueset covid-lab-test-results-snomed-vsac

* include codes from valueset qualitative-lab-results-loinc

////////////////////////////////////////////////////////////////////////////////////////////////////

ValueSet:    CompletedObservationStatus
Id:          completed-observation-status
Title:       "Completed observation status"
Description: "Contains a subset of <http://hl7.org/fhir/ValueSet/observation-status> for completed/amended observations."

* ObsStatus#final
* ObsStatus#amended
* ObsStatus#corrected

////////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: IdentityAssuranceLevelCodeSystem
Id: identity-assurance-level-code-system
Title: "Identity Assurance Level Code System"
Description: "Code representing identity assurance level, based on NIST 800-63-3"
* ^url =  "https://smarthealth.cards/ial"
* ^copyright = "Copyright Computational Health Informatics Program, Boston Children's Hospital, Boston, MA as part of the [SMART Health Cards Framework](https://smarthealth.cards/ial). Licensed under CC-BY 4.0 (<https://creativecommons.org/licenses/by/4.0/>)."
* #IAL1 "Name and birth date were self-asserted."
* #IAL1.2 "An unspecified ID was used to verify name and birth date."
* #IAL1.4 "A US state-issued photo ID or nationally-issued photo ID was used to verify name and birth date."
* #IAL2 "Either remote or in-person identity proofing is required. IAL2 requires identifying attributes to have been verified in person or remotely using, at a minimum, the procedures given in NIST Special Publication 800-63A."
* #IAL3 "In-person identity proofing is required. Identifying attributes must be verified by an authorized CSP representative through examination of physical documentation as described in NIST Special Publication 800-63A."


ValueSet:    IdentityAssuranceLevel
Id:          identity-assurance-level
Title:       "Identity Assurance Level"
Description: "Relevant identity assurance level codes, based on NIST 800-63-3. See <https://smarthealth.cards/ial> for details."
* include codes from system IAL
* exclude IAL#IAL1


////////////////////////////////////////////////////////////////////////////////////////////////////


ValueSet:    SpecimenCollectionSupervisionStatus
Id:          specimen-collection-supervision-status
Title:       "Specimen Collection Supervision Status"
Description: "Relevant codes representing specimen collection supervision status"
* SCT#1208526009 "Specimen collection by subject unsupervised by healthcare professional (finding)"
* SCT#1208525008 "Virtual supervision by healthcare professional of specimen collection by subject (finding)"
* SCT#1208524007 "In-person supervision by healthcare professional of specimen collection by subject (finding)"
* SCT#1208523001 "Specimen collection by healthcare professional (finding)"
