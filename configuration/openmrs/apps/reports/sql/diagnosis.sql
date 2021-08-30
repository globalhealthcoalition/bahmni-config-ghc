select  patient_identifier.identifier as 'Patient Identifier',
  YEAR(now())-year(person.birthdate) as Age,
  person.gender as Gender,
  diagnosis_concept_view.concept_short_name as Diagnosis,
  obs.obs_datetime as 'Diagnosis Date'
from obs
  inner join patient_identifier on obs.person_id = patient_identifier.patient_id
  inner join person  on obs.person_id = person.person_id
  inner join diagnosis_concept_view  on obs.value_coded = diagnosis_concept_view.concept_id
and obs.obs_datetime BETWEEN '#startDate#' and '#endDate#';
