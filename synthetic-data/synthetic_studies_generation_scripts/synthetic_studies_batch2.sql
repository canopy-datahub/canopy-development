-- ============================================================
-- Synthetic Study Data - 10 More Studies (IDs 1012-1021)
-- PostgreSQL Insert Script for RADx Data Hub
-- ============================================================
ROLLBACK ;
BEGIN;

-- ============================================================
-- STUDY 1012
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1012,
    'f2a3b4c5-d6e7-8901-abcd-012345678abc',
    NULL, NULL, NULL, NULL,
    4,
    'admin-uuid-1012-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300001, 1012, 5, 'AFF-Four', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300002, 1012, 2, 'AI-Driven Prediction of COVID-19 Clinical Deterioration Using Multimodal Electronic Health Record Data', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300003, 1012, 10, 'Dr. Wei Liu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300004, 1012, 11, 'wei.liu@datascience.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300005, 1012, 14, 'Institute for Data Science in Medicine, Northern University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300006, 1012, 12, 'Olivia Grant', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300007, 1012, 13, 'olivia.grant@datascience.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300008, 1012, 67, 'R01-LM014567', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300009, 1012, 16, 'Dr. Stephanie Brooks', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300010, 1012, 24, 'NLM', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300011, 1012, 24, 'NIDDK', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300012, 1012, 100, 'RFA-LM-23-002', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300013, 1012, 6, '05/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300014, 1012, 7, '04/30/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300015, 1012, 82, 'Artificial Intelligence or Machine Learning', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300016, 1012, 82, 'Comorbidities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300017, 1012, 82, 'Digital Health Applications', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300018, 1012, 20, 'Real-World Data', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300019, 1012, 20, 'Disease Registry', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300020, 1012, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300021, 1012, 81, 'Older Adults or Elderly', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300022, 1012, 81, 'Dialysis Patients', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300023, 1012, 21, 'machine learning', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300024, 1012, 21, 'clinical deterioration', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300025, 1012, 21, 'electronic health records', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300026, 1012, 21, 'prediction model', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300027, 1012, 21, 'comorbidity', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300028, 1012, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300029, 1012, 102, '> 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300030, 1012, 35, 'Supported by NLM and NIDDK under grant R01-LM014567.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300031, 1012, 3, 'This longitudinal cohort study develops and validates machine learning models for predicting clinical deterioration among hospitalized COVID-19 patients using multimodal electronic health record data. The study leverages retrospective EHR data from a large health system encompassing laboratory values, vital signs, imaging reports, medication orders, and comorbidity profiles. Special attention is given to high-risk subpopulations including elderly patients and those with end-stage renal disease on dialysis. Models are evaluated for fairness across demographic subgroups and validated in an external health system.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300032, 1012, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300033, 1012, 18, '25000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300034, 1012, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300035, 1012, 9, 'Northern University Health System; Lakeside Regional Medical Center', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300036, 1012, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300037, 1012, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300038, 1012, 51, '04/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300039, 1012, 54, '10/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300040, 1012, 50, '85.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300041, 1012, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300042, 1012, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300043, 1012, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300044, 1012, 26, 'Electronic Medical Records', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300045, 1012, 26, 'Temporal', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300046, 1012, 26, 'Imaging', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300047, 1012, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300048, 1012, 46, 'Aggregate Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300049, 1012, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300050, 1012, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300051, 1012, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300052, 1012, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300053, 1012, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300054, 1012, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300055, 1012, 57, 'COVID-19; chronic kidney disease; diabetes mellitus', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1013
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1013,
    'a3b4c5d6-e7f8-9012-bcde-123456789bcd',
    NULL, NULL, NULL, NULL,
    1,
    'admin-uuid-1013-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300056, 1013, 5, 'AFF-One', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300057, 1013, 2, 'Multisystem Inflammatory Syndrome in Children (MIS-C): Genomic Risk Factors and Longitudinal Immune Profiling', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300058, 1013, 10, 'Dr. Katherine Moore', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300059, 1013, 11, 'katherine.moore@childrenmed.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300060, 1013, 14, 'National Children''s Medical Research Center', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300061, 1013, 12, 'Daniel Reyes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300062, 1013, 13, 'daniel.reyes@childrenmed.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300063, 1013, 67, 'R01-AI178901', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300064, 1013, 16, 'Dr. George Franklin', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300065, 1013, 24, 'NIAID', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300066, 1013, 24, 'NICHD', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300067, 1013, 24, 'NHGRI', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300068, 1013, 100, 'RFA-AI-23-040', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300069, 1013, 6, '09/15/2022', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300070, 1013, 7, '08/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300071, 1013, 82, 'Multisystem Inflammatory Syndrome in Children (MIS-C)', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300072, 1013, 82, 'Immune Responses', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300073, 1013, 82, 'Next Generation Sequencing (NGS)', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300074, 1013, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300075, 1013, 20, 'Disease Registry', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300076, 1013, 81, 'Children', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300077, 1013, 81, 'African Americans', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300078, 1013, 81, 'Hispanics or Latinos', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300079, 1013, 21, 'MIS-C', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300080, 1013, 21, 'pediatric', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300081, 1013, 21, 'immune profiling', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300082, 1013, 21, 'genomic risk', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300083, 1013, 21, 'inflammatory syndrome', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300084, 1013, 22, 'Case-Control', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300085, 1013, 22, 'Longitudinal Cohort', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300086, 1013, 102, '251 - 500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300087, 1013, 35, 'Funded by NIAID, NICHD, and NHGRI under grant R01-AI178901.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300088, 1013, 3, 'This case-control study with longitudinal follow-up investigates host genomic risk factors and immune trajectory associated with Multisystem Inflammatory Syndrome in Children (MIS-C) following SARS-CoV-2 infection. Cases with confirmed MIS-C are matched to COVID-19-positive pediatric controls without MIS-C. Whole exome sequencing identifies rare variants in immune pathway genes, while serial blood samples undergo deep immunophenotyping including single-cell RNA sequencing and cytokine profiling. The study prioritizes enrollment of African American and Hispanic children, who are disproportionately affected by MIS-C.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300089, 1013, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300090, 1013, 18, '400', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300091, 1013, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300092, 1013, 9, 'National Children''s Medical Research Center; Southwest Pediatric Hospital; Coastal Children''s Health Network', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300093, 1013, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300094, 1013, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300095, 1013, 42, 'Sequence Read Archive (SRA)', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300096, 1013, 51, '05/20/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300097, 1013, 54, '11/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300098, 1013, 50, '180.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300099, 1013, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300100, 1013, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300101, 1013, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300102, 1013, 26, 'Immunological', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300103, 1013, 26, 'Clinical', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300104, 1013, 26, 'Individual Sequencing', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300105, 1013, 26, 'Individual Phenotype', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300106, 1013, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300107, 1013, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300108, 1013, 29, 'RNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300109, 1013, 29, 'Single Cell', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300110, 1013, 29, 'Germline', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300111, 1013, 30, 'Whole Exome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300112, 1013, 30, 'Whole Transcriptome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300113, 1013, 28, 'Genotype calls derived from Sequence', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300114, 1013, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300115, 1013, 43, 'Array-derived Expression', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300116, 1013, 43, 'Association/Linkage Results', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300117, 1013, 44, 'Expression Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300118, 1013, 60, 'Collaboration required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300119, 1013, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300120, 1013, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300121, 1013, 70, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300122, 1013, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300123, 1013, 56, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300124, 1013, 56, 'Publication required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300125, 1013, 57, 'MIS-C; SARS-CoV-2 post-infectious inflammatory syndrome', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1014
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1014,
    'b4c5d6e7-f8a9-0123-cdef-234567890cde',
    NULL, NULL, NULL, NULL,
    2,
    'admin-uuid-1014-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300126, 1014, 5, 'AFF-Two', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300127, 1014, 2, 'Mobile COVID-19 Testing Units: Access, Uptake, and Impact on Health Disparities in Testing Desert Communities', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300128, 1014, 10, 'Dr. Tamara Jackson', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300129, 1014, 11, 'tamara.jackson@equityhealth.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300130, 1014, 14, 'Center for Health Equity and Access', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300131, 1014, 12, 'Nathan Volkov', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300132, 1014, 13, 'nathan.volkov@equityhealth.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300133, 1014, 67, 'OT2-MD019234', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300134, 1014, 16, 'Dr. Veronica Ruiz', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300135, 1014, 24, 'NIMHD', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300136, 1014, 24, 'NINR', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300137, 1014, 100, 'OTA-MD-22-003', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300138, 1014, 6, '01/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300139, 1014, 7, '12/31/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300140, 1014, 82, 'Mobile Unit Testing', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300141, 1014, 82, 'COVID Testing Deserts', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300142, 1014, 82, 'Community Outreach Programs', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300143, 1014, 82, 'Social Determinants of Health', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300144, 1014, 82, 'Testing Rate or Uptake', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300145, 1014, 20, 'Antigen Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300146, 1014, 20, 'Survey', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300147, 1014, 20, 'Smartphone', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300148, 1014, 81, 'Underserved or Vulnerable Populations', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300149, 1014, 81, 'Rural Communities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300150, 1014, 81, 'Immigrants', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300151, 1014, 81, 'Lower Socioeconomic Status (SES) Populations', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300152, 1014, 21, 'mobile testing', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300153, 1014, 21, 'testing deserts', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300154, 1014, 21, 'health disparities', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300155, 1014, 21, 'access to care', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300156, 1014, 21, 'community health', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300157, 1014, 22, 'Mixed Methods', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300158, 1014, 22, 'Cross-Sectional', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300159, 1014, 102, '2001 - 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300160, 1014, 35, 'Supported by NIMHD and NINR under grant OT2-MD019234.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300161, 1014, 3, 'This mixed methods study evaluates the deployment of mobile COVID-19 testing units in communities identified as testing deserts — areas with limited geographic or temporal access to diagnostic testing. Mobile units operate in rural townships, immigrant neighborhoods, and low-income urban areas across six states. Quantitative data on testing volume, positivity rates, and demographic reach are combined with smartphone-delivered surveys on barriers to testing and qualitative community interviews. The study assesses whether mobile testing reduces disparities in time-to-diagnosis and COVID-19 outcomes.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300162, 1014, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300163, 1014, 18, '4200', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300164, 1014, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300165, 1014, 9, 'Rural Health Outreach Cooperative; Urban Bridge Health; Border Community Health Alliance; Mountain Valley Mobile Clinics', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300166, 1014, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300167, 1014, 51, '06/10/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300168, 1014, 54, '10/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300169, 1014, 50, '3.8', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300170, 1014, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300171, 1014, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300172, 1014, 26, 'Behavioral', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300173, 1014, 26, 'Questionnaire or Survey', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300174, 1014, 26, 'Social', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300175, 1014, 26, 'Geospatial', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300176, 1014, 26, 'Mobile', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300177, 1014, 46, 'Aggregate Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300178, 1014, 60, 'Not-for-profit Organization', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300179, 1014, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300180, 1014, 70, 'Not-for-profit use only', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300181, 1014, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300182, 1014, 56, 'Not-for-profit Organization', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300183, 1014, 57, 'COVID-19; testing access disparities', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1015
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1015,
    'c5d6e7f8-a9b0-1234-defa-345678901def',
    NULL, NULL, NULL, NULL,
    3,
    'admin-uuid-1015-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300184, 1015, 5, 'AFF-Three', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300185, 1015, 2, 'Epigenomic and Metagenomic Profiling of the Respiratory Microbiome in SARS-CoV-2 Infected and Recovered Patients', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300186, 1015, 10, 'Dr. Jonathan Whitfield', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300187, 1015, 11, 'jonathan.whitfield@microbiome.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300188, 1015, 14, 'Microbiome Sciences Institute, Lakeshore University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300189, 1015, 12, 'Hannah Cho', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300190, 1015, 13, 'hannah.cho@microbiome.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300191, 1015, 67, 'R01-AI189012', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300192, 1015, 16, 'Dr. Robert Stein', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300193, 1015, 24, 'NIAID', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300194, 1015, 24, 'NIEHS', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300195, 1015, 100, 'PA-23-156', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300196, 1015, 6, '03/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300197, 1015, 7, '02/28/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300198, 1015, 82, 'Immune Responses', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300199, 1015, 82, 'Long COVID', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300200, 1015, 82, 'Next Generation Sequencing (NGS)', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300201, 1015, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300202, 1015, 20, 'Molecular Nucleic Acid or PCR Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300203, 1015, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300204, 1015, 81, 'People Living with HIV/AIDS', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300205, 1015, 21, 'microbiome', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300206, 1015, 21, 'epigenomics', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300207, 1015, 21, 'metagenomics', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300208, 1015, 21, 'respiratory', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300209, 1015, 21, 'SARS-CoV-2 recovery', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300210, 1015, 22, 'Observational', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300211, 1015, 22, 'Case-Control', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300212, 1015, 102, '501 - 1000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300213, 1015, 35, 'Funded by NIAID and NIEHS under grant R01-AI189012.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300214, 1015, 3, 'This observational case-control study profiles the respiratory microbiome and host epigenomic landscape in three cohorts: acutely infected COVID-19 patients, individuals with persistent Long COVID symptoms, and fully recovered controls. Nasopharyngeal and bronchoalveolar lavage samples undergo shotgun metagenomic sequencing and bisulfite sequencing to characterize microbial community structure, viral co-infections, and DNA methylation changes in airway epithelial cells. The study investigates whether microbiome dysbiosis and epigenetic reprogramming contribute to Long COVID pathogenesis, with particular attention to immunocompromised individuals living with HIV.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300215, 1015, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300216, 1015, 18, '600', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300217, 1015, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300218, 1015, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300219, 1015, 42, 'Sequence Read Archive (SRA)', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300220, 1015, 42, 'GEO', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300221, 1015, 51, '07/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300222, 1015, 54, '01/15/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300223, 1015, 50, '320.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300224, 1015, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300225, 1015, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300226, 1015, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300227, 1015, 26, 'Metagenomic', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300228, 1015, 26, 'Sequencing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300229, 1015, 26, 'Biologic Specimens', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300230, 1015, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300231, 1015, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300232, 1015, 29, 'RNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300233, 1015, 29, 'Microbiome', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300234, 1015, 30, 'Whole Genome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300235, 1015, 30, 'Epigenomic Marks', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300236, 1015, 30, 'Whole Transcriptome', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300237, 1015, 28, 'CNV calls derived from Sequencing', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300238, 1015, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300239, 1015, 43, 'Array-derived Methylation', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300240, 1015, 43, 'RNA Seq derived Expression', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300241, 1015, 44, 'Methylation Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300242, 1015, 44, 'Expression Array', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300243, 1015, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300244, 1015, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300245, 1015, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300246, 1015, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300247, 1015, 70, 'Collaboration required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300248, 1015, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300249, 1015, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300250, 1015, 57, 'COVID-19; Long COVID; HIV co-infection; respiratory microbiome dysbiosis', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1016
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1016,
    'd6e7f8a9-b0c1-2345-efab-456789012efa',
    NULL, NULL, NULL, NULL,
    5,
    'admin-uuid-1016-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300251, 1016, 5, 'Demo Affiliation 1', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300252, 1016, 2, 'Pandemic Perceptions, Misinformation Exposure, and Decision-Making Among Pregnant and Nursing Women During COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300253, 1016, 10, 'Dr. Christine Okafor', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300254, 1016, 11, 'christine.okafor@maternalhealth.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300255, 1016, 14, 'Maternal and Child Health Research Institute', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300256, 1016, 12, 'Alex Rivera', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300257, 1016, 13, 'alex.rivera@maternalhealth.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300258, 1016, 67, 'R21-HD134567', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300259, 1016, 16, 'Dr. Nancy Kim', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300260, 1016, 24, 'NICHD', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300261, 1016, 24, 'NIMH', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300262, 1016, 100, 'PA-22-200', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300263, 1016, 6, '08/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300264, 1016, 7, '07/31/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300265, 1016, 82, 'Pandemic Perceptions or Decision-Making', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300266, 1016, 82, 'Vaccination Rate or Uptake', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300267, 1016, 82, 'Mental Health', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300268, 1016, 20, 'Survey', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300269, 1016, 20, 'Interview or Focus Group', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300270, 1016, 20, 'Smartphone', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300271, 1016, 81, 'Pregnant or Nursing Women', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300272, 1016, 81, 'Racial or Ethnic Minorities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300273, 1016, 81, 'Native Hawaiians or Other Pacific Islanders', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300274, 1016, 21, 'pandemic perceptions', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300275, 1016, 21, 'misinformation', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300276, 1016, 21, 'maternal health', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300277, 1016, 21, 'vaccine decision-making', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300278, 1016, 21, 'pregnant women', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300279, 1016, 22, 'Cross-Sectional', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300280, 1016, 22, 'Mixed Methods', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300281, 1016, 102, '1001 - 2000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300282, 1016, 35, 'Supported by NICHD and NIMH under grant R21-HD134567.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300283, 1016, 3, 'This cross-sectional mixed methods study examines how pandemic-related perceptions, exposure to misinformation, and trust in healthcare institutions influence health decision-making — particularly regarding vaccination and testing — among pregnant and nursing women. Participants complete smartphone-delivered surveys assessing information sources, perceived risk, vaccine attitudes, and mental health. A subset participates in semi-structured interviews exploring lived experiences navigating pregnancy during COVID-19 surges. The study oversamples racial and ethnic minority women and Pacific Islander communities to capture diverse perspectives.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300284, 1016, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300285, 1016, 18, '1200', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300286, 1016, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300287, 1016, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300288, 1016, 51, '03/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300289, 1016, 54, '07/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300290, 1016, 50, '1.5', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300291, 1016, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300292, 1016, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300293, 1016, 26, 'Behavioral', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300294, 1016, 26, 'Psychological', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300295, 1016, 26, 'Questionnaire or Survey', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300296, 1016, 26, 'Social', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300297, 1016, 46, 'Aggregate Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300298, 1016, 46, 'Individual-level Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300299, 1016, 60, 'Not-for-profit Organization', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300300, 1016, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300301, 1016, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300302, 1016, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300303, 1016, 57, 'COVID-19; vaccine hesitancy; perinatal mental health', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1017
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1017,
    'e7f8a9b0-c1d2-3456-fabc-567890123fab',
    NULL, NULL, NULL, NULL,
    4,
    'admin-uuid-1017-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300304, 1017, 5, 'AFF-Four', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300305, 1017, 2, 'Chemosensory Testing and Olfactory Biomarkers for Early Detection of SARS-CoV-2 Infection in Congregate Living Facilities', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300306, 1017, 10, 'Dr. Martin Kruger', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300307, 1017, 11, 'martin.kruger@sensorlab.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300308, 1017, 14, 'Sensory Neuroscience Laboratory, Eastern University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300309, 1017, 12, 'Isabella Torres', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300310, 1017, 13, 'isabella.torres@sensorlab.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300311, 1017, 67, 'U01-DC019345', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300312, 1017, 16, 'Dr. Howard Chen', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300313, 1017, 24, 'NIDCD', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300314, 1017, 24, 'NIA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300315, 1017, 100, 'RFA-DC-23-001', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300316, 1017, 6, '11/15/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300317, 1017, 7, '11/14/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300318, 1017, 82, 'At-Home or Over-the-Counter (OTC) Self-Testing', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300319, 1017, 82, 'Screening Testing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300320, 1017, 82, 'Biosensor Technologies', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300321, 1017, 20, 'Chemosensory Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300322, 1017, 20, 'Antigen Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300323, 1017, 20, 'Wearable', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300324, 1017, 81, 'Older Adults or Elderly', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300325, 1017, 81, 'Incarcerated or Institutionalized Populations', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300326, 1017, 21, 'chemosensory', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300327, 1017, 21, 'olfactory', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300328, 1017, 21, 'early detection', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300329, 1017, 21, 'congregate living', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300330, 1017, 21, 'screening', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300331, 1017, 22, 'Device Validation', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300332, 1017, 22, 'Longitudinal Cohort', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300333, 1017, 102, '501 - 1000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300334, 1017, 35, 'Funded by NIDCD and NIA under grant U01-DC019345.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300335, 1017, 3, 'This longitudinal device validation study evaluates chemosensory testing — specifically digital olfactory assessments — as a rapid screening tool for early SARS-CoV-2 detection in congregate living facilities including nursing homes and correctional institutions. Participants complete daily digital smell tests via a handheld chemosensory device, with automated alerts triggering confirmatory rapid antigen testing when olfactory decline is detected. The study compares the lead time of chemosensory screening versus symptom-based screening and assesses feasibility and acceptability in elderly and incarcerated populations.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300336, 1017, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300337, 1017, 18, '800', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300338, 1017, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300339, 1017, 9, 'Sunrise Senior Living Network (6 facilities); State Department of Corrections (4 facilities); Veterans Care Home Alliance (3 facilities)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300340, 1017, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300341, 1017, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300342, 1017, 51, '08/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300343, 1017, 54, '02/15/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300344, 1017, 50, '7.2', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300345, 1017, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300346, 1017, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300347, 1017, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300348, 1017, 26, 'Biosensor', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300349, 1017, 26, 'Chemosensor', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300350, 1017, 26, 'Temporal', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300351, 1017, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300352, 1017, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300353, 1017, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300354, 1017, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300355, 1017, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300356, 1017, 57, 'COVID-19; anosmia; olfactory dysfunction', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1018
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1018,
    'f8a9b0c1-d2e3-4567-abcd-678901234abc',
    NULL, NULL, NULL, NULL,
    1,
    'admin-uuid-1018-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300357, 1018, 5, 'AFF-One', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300358, 1018, 2, 'Proteomic and Metabolomic Signatures of Severe COVID-19 in Patients with Substance Use Disorders', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300359, 1018, 10, 'Dr. Laura Hernandez', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300360, 1018, 11, 'laura.hernandez@addiction.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300361, 1018, 14, 'Center for Addiction and Infectious Disease Research', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300362, 1018, 12, 'Ryan Patel', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300363, 1018, 13, 'ryan.patel@addiction.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300364, 1018, 67, 'R01-DA056789', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300365, 1018, 16, 'Dr. Eugene Park', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300366, 1018, 24, 'NIDA', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300367, 1018, 24, 'NIAAA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300368, 1018, 24, 'NIGMS', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300369, 1018, 100, 'RFA-DA-23-015', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300370, 1018, 6, '12/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300371, 1018, 7, '11/30/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300372, 1018, 82, 'Substance Use', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300373, 1018, 82, 'Comorbidities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300374, 1018, 82, 'Immune Responses', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300375, 1018, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300376, 1018, 20, 'Disease Registry', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300377, 1018, 20, 'Real-World Data', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300378, 1018, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300379, 1018, 81, 'Homeless or Unhoused Populations', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300380, 1018, 81, 'Sexual or Gender Minorities', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300381, 1018, 21, 'proteomics', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300382, 1018, 21, 'metabolomics', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300383, 1018, 21, 'substance use', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300384, 1018, 21, 'severe COVID-19', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300385, 1018, 21, 'opioid use disorder', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300386, 1018, 22, 'Case-Control', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300387, 1018, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300388, 1018, 102, '251 - 500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300389, 1018, 35, 'Funded by NIDA, NIAAA, and NIGMS under grant R01-DA056789.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300390, 1018, 3, 'This case-control observational study characterizes proteomic and metabolomic signatures associated with severe COVID-19 outcomes among patients with substance use disorders, including opioid use disorder and alcohol use disorder. Biobank serum and plasma specimens from hospitalized patients are analyzed using mass spectrometry-based proteomics and untargeted metabolomics. Cases with severe outcomes (ICU admission, mechanical ventilation, death) are compared to matched controls with mild-moderate disease. The study investigates whether substance use-related metabolic and inflammatory perturbations predispose to COVID-19 severity.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300391, 1018, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300392, 1018, 18, '300', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300393, 1018, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300394, 1018, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300395, 1018, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300396, 1018, 42, 'GEO', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300397, 1018, 51, '09/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300398, 1018, 54, '03/01/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300399, 1018, 50, '52.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300400, 1018, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300401, 1018, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300402, 1018, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300403, 1018, 26, 'Proteomic', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300404, 1018, 26, 'Metabolomic', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300405, 1018, 26, 'Biologic Specimens', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300406, 1018, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300407, 1018, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300408, 1018, 29, 'Germline', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300409, 1018, 29, 'Tumor/Natural', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300410, 1018, 30, 'Targeted Exome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300411, 1018, 30, 'Sanger', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300412, 1018, 28, 'Array-derived Genotypes', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300413, 1018, 28, 'CNV calls from microarray', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300414, 1018, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300415, 1018, 43, 'Array-derived Expression', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300416, 1018, 43, 'Other', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300417, 1018, 44, 'SNP Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300418, 1018, 44, 'Other', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300419, 1018, 60, 'Collaboration required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300420, 1018, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300421, 1018, 70, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300422, 1018, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300423, 1018, 56, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300424, 1018, 57, 'COVID-19; opioid use disorder; alcohol use disorder', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1019
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1019,
    'a9b0c1d2-e3f4-5678-bcde-789012345bcd',
    NULL, NULL, NULL, NULL,
    2,
    'admin-uuid-1019-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300425, 1019, 5, 'AFF-Two', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300426, 1019, 2, 'Multimodal Surveillance Integration: Combining Influenza and COVID-19 Sentinel Networks for Respiratory Pathogen Forecasting', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300427, 1019, 10, 'Dr. Sarah Lindström', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300428, 1019, 11, 'sarah.lindstrom@cdcpartner.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300429, 1019, 14, 'Public Health Surveillance Collaborative', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300430, 1019, 12, 'Michael Wu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300431, 1019, 13, 'michael.wu@cdcpartner.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300432, 1019, 67, 'U01-IP001234', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300433, 1019, 16, 'Dr. Alicia Henderson', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300434, 1019, 24, 'NIAID', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300435, 1019, 24, 'NIH OD', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300436, 1019, 100, 'RFA-IP-22-008', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300437, 1019, 6, '10/01/2022', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300438, 1019, 7, '09/30/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300439, 1019, 82, 'Multimodal Surveillance', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300440, 1019, 82, 'Influenza', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300441, 1019, 82, 'Disease Surveillance', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300442, 1019, 82, 'Wastewater Surveillance', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300443, 1019, 20, 'Molecular Nucleic Acid or PCR Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300444, 1019, 20, 'Wastewater Sampling', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300445, 1019, 20, 'Disease Registry', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300446, 1019, 20, 'Real-World Data', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300447, 1019, 81, 'N/A', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300448, 1019, 21, 'surveillance integration', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300449, 1019, 21, 'influenza', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300450, 1019, 21, 'respiratory pathogen', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300451, 1019, 21, 'forecasting', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300452, 1019, 21, 'sentinel network', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300453, 1019, 22, 'Time-Series', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300454, 1019, 22, 'Open Cohort', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300455, 1019, 102, 'No Participants', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300456, 1019, 35, 'Supported by NIAID and NIH OD under grant U01-IP001234.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300457, 1019, 3, 'This time-series study integrates data from existing influenza sentinel surveillance networks with COVID-19 testing and wastewater monitoring systems to develop a unified respiratory pathogen forecasting platform. Clinical specimens from sentinel sites undergo multiplex PCR for simultaneous detection of SARS-CoV-2, Influenza A/B, and RSV, while paired wastewater samples from corresponding catchment areas provide population-level viral load estimates. Machine learning ensemble models combine clinical, wastewater, meteorological, and mobility data streams to forecast respiratory disease burden at county-level resolution across 20 states.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300458, 1019, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300459, 1019, 18, '0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300460, 1019, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300461, 1019, 9, 'Eastern Sentinel Network (45 sites); Western Respiratory Surveillance Consortium (38 sites); Southern Influenza Monitoring Alliance (30 sites)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300462, 1019, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300463, 1019, 42, 'Sequence Read Archive (SRA)', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300464, 1019, 42, 'GenBank', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300465, 1019, 51, '04/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300466, 1019, 54, '09/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300467, 1019, 50, '95.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300468, 1019, 49, 'Non-Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300469, 1019, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300470, 1019, 26, 'Environmental', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300471, 1019, 26, 'Sequencing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300472, 1019, 26, 'Temporal', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300473, 1019, 26, 'Geospatial', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300474, 1019, 29, 'RNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300475, 1019, 30, 'Whole Genome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300476, 1019, 30, 'Targeted Genome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300477, 1019, 30, '16S rRNA', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300478, 1019, 60, 'Publication required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300479, 1019, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300480, 1019, 57, 'COVID-19; Influenza A/B; RSV; respiratory pathogens', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1020
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1020,
    'b0c1d2e3-f4a5-6789-cdef-890123456cde',
    NULL, NULL, NULL, NULL,
    3,
    'admin-uuid-1020-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300481, 1020, 5, 'AFF-Three', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300482, 1020, 2, 'COVID-19 Hotspot Identification Using Geospatial Analytics and At-Home Self-Testing Data From Underserved Urban Corridors', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300483, 1020, 10, 'Dr. Michael Abrams', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300484, 1020, 11, 'michael.abrams@urbanhealth.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300485, 1020, 14, 'Urban Health Analytics Center, Riverside University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300486, 1020, 12, 'Julie Tanaka', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300487, 1020, 13, 'julie.tanaka@urbanhealth.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300488, 1020, 67, 'R01-ES045678', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300489, 1020, 16, 'Dr. Catherine Bell', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300490, 1020, 24, 'NIEHS', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300491, 1020, 24, 'NIMHD', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300492, 1020, 24, 'NIBIB', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300493, 1020, 100, 'RFA-ES-23-004', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300494, 1020, 6, '02/15/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300495, 1020, 7, '02/14/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300496, 1020, 82, 'COVID Hotspots', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300497, 1020, 82, 'At-Home or Over-the-Counter (OTC) Self-Testing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300498, 1020, 82, 'Geospatial Analysis', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300499, 1020, 82, 'Digital Health Applications', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300500, 1020, 20, 'Antigen Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300501, 1020, 20, 'Smartphone', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300502, 1020, 20, 'Contact Tracing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300503, 1020, 81, 'Underserved or Vulnerable Populations', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300504, 1020, 81, 'Hispanics or Latinos', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300505, 1020, 81, 'Essential Workers', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300506, 1020, 81, 'Lower Socioeconomic Status (SES) Populations', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300507, 1020, 21, 'hotspot detection', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300508, 1020, 21, 'geospatial', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300509, 1020, 21, 'self-testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300510, 1020, 21, 'urban health', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300511, 1020, 21, 'real-time surveillance', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300512, 1020, 22, 'Observational', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300513, 1020, 22, 'Time-Series', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300514, 1020, 102, '2001 - 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300515, 1020, 35, 'Funded by NIEHS, NIMHD, and NIBIB under grant R01-ES045678.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300516, 1020, 3, 'This observational time-series study leverages at-home rapid antigen self-test results reported through a smartphone application to identify and track COVID-19 hotspots in underserved urban corridors. Geocoded self-test results are analyzed using spatial clustering algorithms to detect emerging hotspots at neighborhood-block resolution. Supplementary contact tracing data and census-level socioeconomic indicators are integrated to characterize hotspot risk factors. The study evaluates whether real-time geospatial analytics from self-testing data can direct targeted public health interventions to communities with the highest transmission burden.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300517, 1020, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300518, 1020, 18, '3500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300519, 1020, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300520, 1020, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300521, 1020, 51, '05/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300522, 1020, 54, '10/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300523, 1020, 50, '8.9', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300524, 1020, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300525, 1020, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300526, 1020, 26, 'Geospatial', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300527, 1020, 26, 'Mobile', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300528, 1020, 26, 'Behavioral', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300529, 1020, 26, 'Temporal', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300530, 1020, 46, 'Aggregate Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300531, 1020, 60, 'Not-for-profit Organization', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300532, 1020, 60, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300533, 1020, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300534, 1020, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300535, 1020, 57, 'COVID-19; health disparities; urban transmission', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1021
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1021,
    'c1d2e3f4-a5b6-7890-defa-901234567def',
    NULL, NULL, NULL, NULL,
    5,
    'admin-uuid-1021-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300536, 1021, 5, 'Demo Affiliation 1', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300537, 1021, 2, 'Somatic Variant Analysis and Tumor Microenvironment Characterization in Cancer Patients with Concurrent SARS-CoV-2 Infection', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300538, 1021, 10, 'Dr. Priya Ramanathan', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300539, 1021, 11, 'priya.ramanathan@oncogenomics.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300540, 1021, 14, 'Oncogenomics Research Center, Capital University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300541, 1021, 12, 'Liam O''Connor', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300542, 1021, 13, 'liam.oconnor@oncogenomics.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300543, 1021, 67, 'R01-CA267890', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300544, 1021, 16, 'Dr. Sandra Hayes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300545, 1021, 24, 'NCI', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300546, 1021, 24, 'NIAMS', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300547, 1021, 100, 'RFA-CA-23-010', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300548, 1021, 6, '06/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300549, 1021, 7, '05/31/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300550, 1021, 82, 'Immune Responses', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300551, 1021, 82, 'Variants', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300552, 1021, 82, 'Comorbidities', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300553, 1021, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300554, 1021, 20, 'Molecular Nucleic Acid or PCR Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300555, 1021, 20, 'Antibody or Adaptive Immune Response Testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300556, 1021, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300557, 1021, 81, 'Asians', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300558, 1021, 81, 'Intellectual or Developmental Disabilities', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300559, 1021, 21, 'somatic variants', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300560, 1021, 21, 'tumor microenvironment', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300561, 1021, 21, 'cancer', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300562, 1021, 21, 'COVID-19 comorbidity', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300563, 1021, 21, 'immunosuppression', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300564, 1021, 22, 'Clinical Genetic Testing', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300565, 1021, 22, 'Case-Control', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300566, 1021, 102, '1 - 250', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300567, 1021, 35, 'Supported by NCI and NIAMS under grant R01-CA267890.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300568, 1021, 3, 'This case-control study with clinical genetic testing characterizes somatic variant profiles and tumor microenvironment alterations in cancer patients who developed SARS-CoV-2 infection during active oncologic treatment. Tumor and matched normal specimens undergo whole genome sequencing, somatic variant calling, and spatial transcriptomics to assess whether COVID-19 modulates the tumor immune landscape. The study compares mutation burden, neoantigen presentation, and immune infiltration patterns between cancer patients with and without concurrent COVID-19. Particular attention is given to immunosuppressed patients and those with autoimmune conditions.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300569, 1021, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300570, 1021, 18, '200', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300571, 1021, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300572, 1021, 9, 'Capital University Cancer Center; Regional Oncology Consortium; Pacific Rim Cancer Research Network', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300573, 1021, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300574, 1021, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300575, 1021, 42, 'ClinVar', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300576, 1021, 42, 'dbVar', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300577, 1021, 51, '10/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300578, 1021, 54, '04/15/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300579, 1021, 50, '500.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300580, 1021, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300581, 1021, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300582, 1021, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300583, 1021, 26, 'Sequencing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300584, 1021, 26, 'Clinical', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300585, 1021, 26, 'Individual Genotype', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300586, 1021, 26, 'Individual Sequencing', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300587, 1021, 26, 'Imaging', 5, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300588, 1021, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300589, 1021, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300590, 1021, 29, 'RNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300591, 1021, 29, 'Tumor/Natural', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300592, 1021, 29, 'Single Cell', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300593, 1021, 29, 'Mitochondria', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300594, 1021, 30, 'Whole Genome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300595, 1021, 30, 'Whole Exome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300596, 1021, 30, 'Targeted Exome', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300597, 1021, 30, 'Targeted Transcriptome', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300598, 1021, 28, 'Somatic SNV (.MAF)', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300599, 1021, 28, 'Array CGH CNVs', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300600, 1021, 28, 'Genotype calls derived from Sequence', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300601, 1021, 28, 'CNV calls derived from Sequencing', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300602, 1021, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300603, 1021, 27, 'Aggregate Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300604, 1021, 43, 'Association/Linkage Results', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300605, 1021, 43, 'Array-derived Expression', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300606, 1021, 43, 'Array-derived Methylation', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300607, 1021, 43, 'RNA Seq derived Expression', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300608, 1021, 43, 'Other', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300609, 1021, 44, 'SNP Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300610, 1021, 44, 'Expression Array', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300611, 1021, 44, 'Methylation Array', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300612, 1021, 44, 'Other', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300613, 1021, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300614, 1021, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300615, 1021, 60, 'Publication required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300616, 1021, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300617, 1021, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300618, 1021, 70, 'Collaboration required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300619, 1021, 70, 'Publication required', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300620, 1021, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300621, 1021, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300622, 1021, 56, 'Collaboration required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300623, 1021, 56, 'Publication required', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (300624, 1021, 57, 'COVID-19; cancer; immunosuppression; autoimmune disease', 0, '2025-03-15 10:30:00', 5);

COMMIT;

-- Total study_property_value rows: 624
