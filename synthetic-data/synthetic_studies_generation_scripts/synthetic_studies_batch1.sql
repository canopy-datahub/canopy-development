-- ============================================================
-- Synthetic Study Data - 10 Additional Studies (IDs 1002-1011)
-- PostgreSQL Insert Script for RADx Data Hub
-- ============================================================
ROLLBACK;
BEGIN;

-- ============================================================
-- STUDY 1002
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1002,
    'b2c3d4e5-f6a7-8901-bcde-f12345678901',
    NULL, NULL, NULL, NULL,
    1,
    'admin-uuid-1002-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200001, 1002, 5, 'AFF-One', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200002, 1002, 2, 'Longitudinal Assessment of Post-Acute Sequelae of SARS-CoV-2 (Long COVID) and Mental Health Outcomes in Urban Populations', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200003, 1002, 10, 'Dr. Robert Williams', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200004, 1002, 11, 'robert.williams@metrohealth.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200005, 1002, 14, 'Metro Health University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200006, 1002, 12, 'Linda Foster', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200007, 1002, 13, 'linda.foster@metrohealth.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200008, 1002, 67, 'R01-MH129456', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200009, 1002, 16, 'Dr. Angela Martinez', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200010, 1002, 24, 'NIMH', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200011, 1002, 24, 'NIAID', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200012, 1002, 100, 'RFA-MH-23-100', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200013, 1002, 6, '01/15/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200014, 1002, 7, '12/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200015, 1002, 82, 'Long COVID', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200016, 1002, 82, 'Mental Health', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200017, 1002, 82, 'Health Behaviors', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200018, 1002, 20, 'Survey', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200019, 1002, 20, 'Interview or Focus Group', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200020, 1002, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200021, 1002, 81, 'Lower Socioeconomic Status (SES) Populations', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200022, 1002, 21, 'Long COVID', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200023, 1002, 21, 'mental health', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200024, 1002, 21, 'depression', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200025, 1002, 21, 'anxiety', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200026, 1002, 21, 'post-acute sequelae', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200027, 1002, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200028, 1002, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200029, 1002, 102, '> 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200030, 1002, 35, 'This study was supported by NIMH and NIAID through grant R01-MH129456. The content is solely the responsibility of the authors.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200031, 1002, 3, 'This longitudinal cohort study follows adults diagnosed with COVID-19 across three urban medical centers to characterize the trajectory of post-acute sequelae (Long COVID) with a focus on neuropsychiatric outcomes. Participants complete serial assessments of cognitive function, mood, fatigue, and quality of life over 36 months. Clinical, behavioral, and questionnaire data are collected to identify risk factors for persistent symptoms and evaluate the relationship between acute illness severity and long-term mental health outcomes.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200032, 1002, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200033, 1002, 18, '6200', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200034, 1002, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200035, 1002, 9, 'Metro Health University Hospital; Downtown Community Clinic; Eastside Medical Center', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200036, 1002, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200037, 1002, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200038, 1002, 51, '04/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200039, 1002, 54, '11/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200040, 1002, 50, '8.3', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200041, 1002, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200042, 1002, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200043, 1002, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200044, 1002, 26, 'Behavioral', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200045, 1002, 26, 'Psychological', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200046, 1002, 26, 'Questionnaire or Survey', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200047, 1002, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200048, 1002, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200049, 1002, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200050, 1002, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200051, 1002, 57, 'Long COVID; Post-acute sequelae of SARS-CoV-2', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1003
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1003,
    'c3d4e5f6-a7b8-9012-cdef-123456789012',
    NULL, NULL, NULL, NULL,
    2,
    'admin-uuid-1003-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200052, 1003, 5, 'AFF-Two', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200053, 1003, 2, 'Validation of Next-Generation Rapid Antigen Tests for SARS-CoV-2 Variant Detection in Community Pharmacy Settings', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200054, 1003, 10, 'Dr. Susan Lee', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200055, 1003, 11, 'susan.lee@pharmaresearch.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200056, 1003, 14, 'National Pharmacy Research Institute', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200057, 1003, 12, 'Kevin Nguyen', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200058, 1003, 13, 'kevin.nguyen@pharmaresearch.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200059, 1003, 67, 'U01-FD007823', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200060, 1003, 16, 'Dr. Michael Harris', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200061, 1003, 24, 'NIBIB', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200062, 1003, 24, 'NCATS', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200063, 1003, 100, 'RFA-FD-22-005', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200064, 1003, 6, '03/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200065, 1003, 7, '02/28/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200066, 1003, 82, 'Diagnostic Testing', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200067, 1003, 82, 'Rapid Diagnostic Test (RDT)', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200068, 1003, 82, 'At-Home or Over-the-Counter (OTC) Self-Testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200069, 1003, 82, 'Variants', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200070, 1003, 20, 'Antigen Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200071, 1003, 20, 'Molecular Nucleic Acid or PCR Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200072, 1003, 81, 'Racial or Ethnic Minorities', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200073, 1003, 81, 'Hispanics or Latinos', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200074, 1003, 81, 'Essential Workers', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200075, 1003, 21, 'rapid antigen test', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200076, 1003, 21, 'variant detection', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200077, 1003, 21, 'community pharmacy', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200078, 1003, 21, 'device validation', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200079, 1003, 21, 'SARS-CoV-2', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200080, 1003, 22, 'Device Validation', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200081, 1003, 22, 'Cross-Sectional', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200082, 1003, 102, '2001 - 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200083, 1003, 35, 'Supported by NIBIB and NCATS under grant U01-FD007823.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200084, 1003, 3, 'This device validation study evaluates the diagnostic performance of three next-generation rapid antigen tests for SARS-CoV-2 detection, including their ability to identify emerging variants of concern. Conducted across 45 community pharmacies in diverse metropolitan areas, the study compares rapid test sensitivity and specificity against RT-PCR and whole genome sequencing reference standards. The study prioritizes enrollment from underrepresented populations to ensure equitable evaluation of test performance across demographic groups.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200085, 1003, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200086, 1003, 18, '3800', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200087, 1003, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200088, 1003, 9, 'PharmaCare Network (12 sites); HealthFirst Pharmacies (18 sites); Community Rx Alliance (15 sites)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200089, 1003, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200090, 1003, 51, '05/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200091, 1003, 54, '08/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200092, 1003, 50, '4.7', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200093, 1003, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200094, 1003, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200095, 1003, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200096, 1003, 26, 'Genomic', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200097, 1003, 26, 'Sequencing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200098, 1003, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200099, 1003, 29, 'RNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200100, 1003, 30, 'Whole Genome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200101, 1003, 30, 'Targeted Genome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200102, 1003, 60, 'Publication required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200103, 1003, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200104, 1003, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200105, 1003, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200106, 1003, 57, 'COVID-19; SARS-CoV-2 variants of concern', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1004
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1004,
    'd4e5f6a7-b8c9-0123-defa-234567890123',
    NULL, NULL, NULL, NULL,
    4,
    'admin-uuid-1004-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200107, 1004, 5, 'AFF-Four', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200108, 1004, 2, 'Case-Control Analysis of Immune Response Biomarkers and Seroprevalence Among First Responders During COVID-19 Surges', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200109, 1004, 10, 'Dr. James O''Brien', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200110, 1004, 11, 'james.obrien@stateuniv.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200111, 1004, 14, 'State University College of Public Health', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200112, 1004, 12, 'Rachel Kim', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200113, 1004, 13, 'rachel.kim@stateuniv.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200114, 1004, 67, 'R21-AI167890', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200115, 1004, 16, 'Dr. Patricia Gonzalez', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200116, 1004, 24, 'NIAID', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200117, 1004, 24, 'NIMHD', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200118, 1004, 100, 'PA-22-184', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200119, 1004, 6, '09/01/2022', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200120, 1004, 7, '08/31/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200121, 1004, 82, 'Immune Responses', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200122, 1004, 82, 'Seroprevalence', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200123, 1004, 82, 'Serological or Antibody Testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200124, 1004, 20, 'Antibody or Adaptive Immune Response Testing', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200125, 1004, 20, 'Biobank Samples', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200126, 1004, 81, 'Essential Workers', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200127, 1004, 81, 'African Americans', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200128, 1004, 81, 'Hispanics or Latinos', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200129, 1004, 21, 'seroprevalence', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200130, 1004, 21, 'immune response', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200131, 1004, 21, 'first responders', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200132, 1004, 21, 'biomarkers', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200133, 1004, 21, 'antibody testing', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200134, 1004, 22, 'Case-Control', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200135, 1004, 102, '501 - 1000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200136, 1004, 35, 'Funded by NIAID and NIMHD under grant R21-AI167890.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200137, 1004, 3, 'This case-control study investigates humoral and cellular immune response biomarkers among first responders (firefighters, EMTs, and law enforcement) who experienced repeated SARS-CoV-2 exposures during pandemic surges. Cases with confirmed reinfection are matched to controls with single infection episodes. Serological specimens from a biobank are analyzed for neutralizing antibody titers, T-cell responses, and cytokine profiles to identify immunological correlates of protection and susceptibility to reinfection.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200138, 1004, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200139, 1004, 18, '750', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200140, 1004, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200141, 1004, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200142, 1004, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200143, 1004, 51, '06/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200144, 1004, 54, '10/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200145, 1004, 50, '15.2', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200146, 1004, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200147, 1004, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200148, 1004, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200149, 1004, 26, 'Immunological', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200150, 1004, 26, 'Biologic Specimens', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200151, 1004, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200152, 1004, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200153, 1004, 29, 'Germline', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200154, 1004, 30, 'Whole Exome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200155, 1004, 28, 'Genotype calls derived from Sequence', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200156, 1004, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200157, 1004, 60, 'Collaboration required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200158, 1004, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200159, 1004, 70, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200160, 1004, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200161, 1004, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200162, 1004, 57, 'COVID-19; SARS-CoV-2 reinfection', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1005
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1005,
    'e5f6a7b8-c9d0-1234-efab-345678901234',
    NULL, NULL, NULL, NULL,
    5,
    'admin-uuid-1005-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200163, 1005, 5, 'Demo Affiliation 1', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200164, 1005, 2, 'Cross-Sectional Survey of Vaccine Hesitancy, Health Behaviors, and COVID-19 Testing Uptake in Rural Appalachian Communities', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200165, 1005, 10, 'Dr. Emily Carter', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200166, 1005, 11, 'emily.carter@appalachianhealth.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200167, 1005, 14, 'Appalachian Health Sciences University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200168, 1005, 12, 'Tom Brennan', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200169, 1005, 13, 'tom.brennan@appalachianhealth.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200170, 1005, 67, 'OT2-HD112345', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200171, 1005, 16, 'Dr. David Cho', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200172, 1005, 24, 'NICHD', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200173, 1005, 24, 'NINR', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200174, 1005, 100, 'OTA-21-015', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200175, 1005, 6, '06/15/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200176, 1005, 7, '06/14/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200177, 1005, 82, 'Vaccination Rate or Uptake', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200178, 1005, 82, 'Testing Rate or Uptake', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200179, 1005, 82, 'Health Behaviors', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200180, 1005, 82, 'Community Outreach Programs', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200181, 1005, 20, 'Survey', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200182, 1005, 20, 'Smartphone', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200183, 1005, 81, 'Rural Communities', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200184, 1005, 81, 'Lower Socioeconomic Status (SES) Populations', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200185, 1005, 81, 'Older Adults or Elderly', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200186, 1005, 21, 'vaccine hesitancy', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200187, 1005, 21, 'rural health', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200188, 1005, 21, 'Appalachia', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200189, 1005, 21, 'testing uptake', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200190, 1005, 21, 'health disparities', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200191, 1005, 22, 'Cross-Sectional', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200192, 1005, 22, 'Mixed Methods', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200193, 1005, 102, '1001 - 2000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200194, 1005, 35, 'Supported by NICHD and NINR under grant OT2-HD112345.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200195, 1005, 3, 'This cross-sectional mixed methods study examines vaccine hesitancy, health behaviors, and COVID-19 testing uptake among residents of rural Appalachian communities. A smartphone-based survey platform is deployed alongside community health worker outreach to collect data on attitudes toward vaccination, barriers to testing access, health literacy, and trusted information sources. Qualitative interviews supplement survey data to contextualize behavioral patterns within the social and economic realities of rural life.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200196, 1005, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200197, 1005, 18, '1500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200198, 1005, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200199, 1005, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200200, 1005, 51, '03/20/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200201, 1005, 54, '07/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200202, 1005, 50, '2.1', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200203, 1005, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200204, 1005, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200205, 1005, 26, 'Behavioral', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200206, 1005, 26, 'Questionnaire or Survey', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200207, 1005, 26, 'Social', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200208, 1005, 26, 'Geospatial', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200209, 1005, 46, 'Aggregate Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200210, 1005, 60, 'Not-for-profit Organization', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200211, 1005, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200212, 1005, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200213, 1005, 57, 'COVID-19; vaccine hesitancy', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1006
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1006,
    'f6a7b8c9-d0e1-2345-fabc-456789012345',
    NULL, NULL, NULL, NULL,
    3,
    'admin-uuid-1006-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200214, 1006, 5, 'AFF-Three', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200215, 1006, 2, 'Randomized Controlled Trial of a Digital Health Intervention for COVID-19 Self-Management and Remote Monitoring', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200216, 1006, 10, 'Dr. Anil Patel', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200217, 1006, 11, 'anil.patel@techmed.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200218, 1006, 14, 'TechMed University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200219, 1006, 12, 'Sarah Mitchell', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200220, 1006, 13, 'sarah.mitchell@techmed.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200221, 1006, 67, 'U01-HL160234', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200222, 1006, 16, 'Dr. Karen White', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200223, 1006, 24, 'NHLBI', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200224, 1006, 24, 'NLM', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200225, 1006, 100, 'RFA-HL-23-008', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200226, 1006, 6, '11/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200227, 1006, 7, '10/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200228, 1006, 82, 'Digital Health Applications', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200229, 1006, 82, 'Disease Surveillance', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200230, 1006, 82, 'Biosensor Technologies', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200231, 1006, 20, 'Wearable', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200232, 1006, 20, 'Smartphone', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200233, 1006, 20, 'Survey', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200234, 1006, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200235, 1006, 81, 'Asians', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200236, 1006, 81, 'Native Hawaiians or Other Pacific Islanders', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200237, 1006, 21, 'digital health', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200238, 1006, 21, 'remote monitoring', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200239, 1006, 21, 'wearable', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200240, 1006, 21, 'self-management', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200241, 1006, 21, 'telehealth', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200242, 1006, 22, 'Interventional or Clinical Trial', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200243, 1006, 102, '251 - 500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200244, 1006, 35, 'Funded by NHLBI and NLM under grant U01-HL160234.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200245, 1006, 3, 'This randomized controlled trial evaluates a digital health intervention combining wearable biosensors, a smartphone application, and telehealth consultations for COVID-19 self-management among adults with mild-to-moderate symptoms. The intervention arm receives real-time symptom monitoring with AI-driven alerts and clinician follow-up, while the control arm receives standard care instructions. Primary outcomes include time to symptom resolution, emergency department utilization, and patient-reported experience. Wearable-derived physiological data (heart rate, SpO2, temperature, activity) are continuously collected.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200246, 1006, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200247, 1006, 18, '400', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200248, 1006, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200249, 1006, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200250, 1006, 42, 'ClinVar', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200251, 1006, 51, '07/10/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200252, 1006, 54, '01/15/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200253, 1006, 50, '45.8', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200254, 1006, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200255, 1006, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200256, 1006, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200257, 1006, 26, 'Biosensor', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200258, 1006, 26, 'Mobile', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200259, 1006, 26, 'Temporal', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200260, 1006, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200261, 1006, 96, 'https://clinicaltrials.gov/ct2/show/NCT05678901', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200262, 1006, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200263, 1006, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200264, 1006, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200265, 1006, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200266, 1006, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200267, 1006, 57, 'COVID-19; respiratory illness', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1007
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1007,
    'a7b8c9d0-e1f2-3456-abcd-567890123456',
    NULL, NULL, NULL, NULL,
    1,
    'admin-uuid-1007-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200268, 1007, 5, 'AFF-One', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200269, 1007, 2, 'Wastewater-Based Epidemiological Surveillance of SARS-CoV-2 Variants Across Municipal Water Systems', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200270, 1007, 10, 'Dr. Helen Zhang', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200271, 1007, 11, 'helen.zhang@envhealth.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200272, 1007, 14, 'Environmental Health Research Institute', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200273, 1007, 12, 'Marcus Johnson', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200274, 1007, 13, 'marcus.johnson@envhealth.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200275, 1007, 67, 'R01-ES034567', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200276, 1007, 16, 'Dr. Thomas Reed', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200277, 1007, 24, 'NIEHS', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200278, 1007, 24, 'NIGMS', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200279, 1007, 100, 'RFA-ES-22-010', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200280, 1007, 6, '02/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200281, 1007, 7, '01/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200282, 1007, 82, 'Wastewater Surveillance', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200283, 1007, 82, 'Multimodal Surveillance', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200284, 1007, 82, 'Variants', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200285, 1007, 82, 'Next Generation Sequencing (NGS)', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200286, 1007, 20, 'Wastewater Sampling', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200287, 1007, 20, 'Disease Registry', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200288, 1007, 81, 'N/A', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200289, 1007, 21, 'wastewater surveillance', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200290, 1007, 21, 'environmental monitoring', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200291, 1007, 21, 'genomic sequencing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200292, 1007, 21, 'variant tracking', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200293, 1007, 21, 'epidemiology', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200294, 1007, 22, 'Time-Series', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200295, 1007, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200296, 1007, 102, 'No Participants', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200297, 1007, 35, 'Supported by NIEHS and NIGMS under grant R01-ES034567.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200298, 1007, 3, 'This time-series observational study implements wastewater-based surveillance for SARS-CoV-2 across 30 municipal water treatment facilities serving diverse urban and suburban communities. Twice-weekly composite samples undergo RT-qPCR quantification and whole genome sequencing to track viral load trends and variant prevalence. Wastewater genomic data are integrated with clinical case reports and hospitalization data from regional disease registries to evaluate wastewater surveillance as an early warning system for community transmission surges.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200299, 1007, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200300, 1007, 18, '0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200301, 1007, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200302, 1007, 9, 'Metro Water Authority (10 facilities); Regional Wastewater Consortium (12 facilities); Southern Municipal Water District (8 facilities)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200303, 1007, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200304, 1007, 42, 'Sequence Read Archive (SRA)', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200305, 1007, 42, 'GenBank', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200306, 1007, 51, '04/20/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200307, 1007, 54, '09/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200308, 1007, 50, '120.5', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200309, 1007, 49, 'Non-Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200310, 1007, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200311, 1007, 26, 'Environmental', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200312, 1007, 26, 'Sequencing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200313, 1007, 26, 'Metagenomic', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200314, 1007, 26, 'Temporal', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200315, 1007, 29, 'RNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200316, 1007, 29, 'Microbiome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200317, 1007, 30, 'Whole Genome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200318, 1007, 30, '16S rRNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200319, 1007, 30, 'Whole Transcriptome', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200320, 1007, 43, 'RNA Seq derived Expression', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200321, 1007, 60, 'Publication required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200322, 1007, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200323, 1007, 57, 'COVID-19; SARS-CoV-2 environmental detection', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1008
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1008,
    'b8c9d0e1-f2a3-4567-bcde-678901234567',
    NULL, NULL, NULL, NULL,
    2,
    'admin-uuid-1008-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200324, 1008, 5, 'AFF-Two', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200325, 1008, 2, 'COVID-19 Transmission Dynamics, Testing Strategies, and Mitigation Measures in K-12 School Settings', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200326, 1008, 10, 'Dr. Nicole Rivera', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200327, 1008, 11, 'nicole.rivera@pedsresearch.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200328, 1008, 14, 'Pediatric Public Health Research Center', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200329, 1008, 12, 'Derek Chang', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200330, 1008, 13, 'derek.chang@pedsresearch.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200331, 1008, 67, 'R01-HD145678', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200332, 1008, 16, 'Dr. Lisa Yamamoto', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200333, 1008, 24, 'NICHD', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200334, 1008, 24, 'NIAID', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200335, 1008, 100, 'RFA-HD-23-020', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200336, 1008, 6, '08/15/2022', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200337, 1008, 7, '07/31/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200338, 1008, 82, 'COVID in School Settings', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200339, 1008, 82, 'Screening Testing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200340, 1008, 82, 'Testing Rate or Uptake', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200341, 1008, 82, 'Contact Tracing', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200342, 1008, 20, 'Antigen Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200343, 1008, 20, 'Contact Tracing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200344, 1008, 20, 'Survey', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200345, 1008, 20, 'Real-World Data', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200346, 1008, 81, 'Children', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200347, 1008, 81, 'School Communities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200348, 1008, 21, 'school testing', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200349, 1008, 21, 'K-12', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200350, 1008, 21, 'transmission dynamics', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200351, 1008, 21, 'mitigation', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200352, 1008, 21, 'pediatric COVID', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200353, 1008, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200354, 1008, 22, 'Open Cohort', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200355, 1008, 102, '> 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200356, 1008, 35, 'Funded by NICHD and NIAID under grant R01-HD145678.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200357, 1008, 3, 'This longitudinal open cohort study examines SARS-CoV-2 transmission dynamics and the effectiveness of testing-based mitigation strategies across 85 K-12 schools in three school districts. Weekly rapid antigen screening, symptomatic testing, and contact tracing data are collected alongside school-level data on ventilation, masking policies, and absenteeism. The study evaluates the impact of different testing frequencies and isolation protocols on in-school transmission rates, school days lost, and community case counts. Real-world data from school health records supplement prospective testing data.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200358, 1008, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200359, 1008, 18, '12000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200360, 1008, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200361, 1008, 9, 'Lincoln County Schools (30 sites); Metro Unified School District (35 sites); Valley Independent Schools (20 sites)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200362, 1008, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200363, 1008, 51, '05/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200364, 1008, 54, '08/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200365, 1008, 50, '6.9', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200366, 1008, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200367, 1008, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200368, 1008, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200369, 1008, 26, 'Behavioral', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200370, 1008, 26, 'Social', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200371, 1008, 26, 'Questionnaire or Survey', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200372, 1008, 46, 'Aggregate Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200373, 1008, 46, 'Individual-level Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200374, 1008, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200375, 1008, 60, 'Not-for-profit Organization', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200376, 1008, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200377, 1008, 70, 'Not-for-profit use only', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200378, 1008, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200379, 1008, 56, 'Not-for-profit Organization', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200380, 1008, 57, 'COVID-19; respiratory illness in children', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1009
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1009,
    'c9d0e1f2-a3b4-5678-cdef-789012345678',
    NULL, NULL, NULL, NULL,
    4,
    'admin-uuid-1009-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200381, 1009, 5, 'AFF-Four', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200382, 1009, 2, 'Development and Field Evaluation of Electrochemical Biosensors for Multiplexed Respiratory Pathogen Detection', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200383, 1009, 10, 'Dr. Carlos Mendez', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200384, 1009, 11, 'carlos.mendez@bioenglab.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200385, 1009, 14, 'Bioengineering Research Laboratory, Pacific University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200386, 1009, 12, 'Priya Sharma', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200387, 1009, 13, 'priya.sharma@bioenglab.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200388, 1009, 67, 'U18-EB032456', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200389, 1009, 16, 'Dr. Janet Cooper', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200390, 1009, 24, 'NIBIB', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200391, 1009, 24, 'NIDCR', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200392, 1009, 100, 'RFA-EB-23-001', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200393, 1009, 6, '04/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200394, 1009, 7, '03/31/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200395, 1009, 82, 'Biosensor Technologies', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200396, 1009, 82, 'Novel Biosensing or VOC', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200397, 1009, 82, 'Medical Device or Tool Development', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200398, 1009, 82, 'Point-of-Care (POC) Testing', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200399, 1009, 20, 'Electrochemical Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200400, 1009, 20, 'Breath Analysis or Airborne Detection Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200401, 1009, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200402, 1009, 81, 'Pregnant or Nursing Women', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200403, 1009, 21, 'biosensor', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200404, 1009, 21, 'electrochemical', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200405, 1009, 21, 'multiplexed detection', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200406, 1009, 21, 'respiratory pathogen', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200407, 1009, 21, 'point-of-care', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200408, 1009, 22, 'Device Verification', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200409, 1009, 22, 'Interventional or Clinical Trial', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200410, 1009, 102, '251 - 500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200411, 1009, 35, 'Supported by NIBIB and NIDCR under grant U18-EB032456.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200412, 1009, 3, 'This study develops and evaluates novel electrochemical biosensors capable of simultaneous detection of SARS-CoV-2, Influenza A/B, and RSV from a single nasal swab or breath sample. Phase 1 focuses on analytical validation in controlled laboratory settings. Phase 2 conducts prospective clinical evaluation at urgent care clinics and prenatal care facilities, comparing biosensor performance to standard RT-PCR panels. The study also evaluates a breath-based volatile organic compound detection module as a non-invasive screening adjunct.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200413, 1009, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200414, 1009, 18, '350', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200415, 1009, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200416, 1009, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200417, 1009, 42, 'GEO', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200418, 1009, 51, '08/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200419, 1009, 54, '02/28/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200420, 1009, 50, '3.2', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200421, 1009, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200422, 1009, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200423, 1009, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200424, 1009, 26, 'Biosensor', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200425, 1009, 26, 'Chemosensor', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200426, 1009, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200427, 1009, 29, 'RNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200428, 1009, 29, 'Other', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200429, 1009, 30, 'Targeted Transcriptome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200430, 1009, 96, 'https://clinicaltrials.gov/ct2/show/NCT06234567', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200431, 1009, 60, 'Collaboration required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200432, 1009, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200433, 1009, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200434, 1009, 70, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200435, 1009, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200436, 1009, 56, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200437, 1009, 57, 'COVID-19; Influenza; RSV', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1010
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1010,
    'd0e1f2a3-b4c5-6789-defa-890123456789',
    NULL, NULL, NULL, NULL,
    5,
    'admin-uuid-1010-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200438, 1010, 5, 'Demo Affiliation 1', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200439, 1010, 2, 'Social Determinants of Health and COVID-19 Comorbidity Burden Among Homeless and Incarcerated Populations', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200440, 1010, 10, 'Dr. Fatima Al-Rashid', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200441, 1010, 11, 'fatima.alrashid@publichealth.gov', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200442, 1010, 14, 'National Center for Health Equity Research', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200443, 1010, 12, 'Brian Torres', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200444, 1010, 13, 'brian.torres@publichealth.gov', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200445, 1010, 67, 'R01-MD018901', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200446, 1010, 16, 'Dr. William Park', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200447, 1010, 24, 'NIMHD', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200448, 1010, 24, 'NIDA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200449, 1010, 100, 'RFA-MD-22-007', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200450, 1010, 6, '10/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200451, 1010, 7, '09/30/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200452, 1010, 82, 'Social Determinants of Health', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200453, 1010, 82, 'Comorbidities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200454, 1010, 82, 'Substance Use', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200455, 1010, 82, 'COVID Testing Deserts', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200456, 1010, 20, 'Interview or Focus Group', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200457, 1010, 20, 'Disease Registry', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200458, 1010, 20, 'Real-World Data', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200459, 1010, 81, 'Homeless or Unhoused Populations', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200460, 1010, 81, 'Incarcerated or Institutionalized Populations', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200461, 1010, 81, 'Underserved or Vulnerable Populations', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200462, 1010, 81, 'Sexual or Gender Minorities', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200463, 1010, 21, 'social determinants', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200464, 1010, 21, 'homelessness', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200465, 1010, 21, 'incarceration', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200466, 1010, 21, 'comorbidities', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200467, 1010, 21, 'health equity', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200468, 1010, 22, 'Mixed Methods', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200469, 1010, 22, 'Cross-Sectional', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200470, 1010, 102, '501 - 1000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200471, 1010, 35, 'Funded by NIMHD and NIDA under grant R01-MD018901.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200472, 1010, 3, 'This mixed methods cross-sectional study examines how social determinants of health — including housing instability, incarceration history, substance use, and access to care — shape COVID-19 comorbidity burden and testing access among marginalized populations. Quantitative data from disease registries and electronic medical records are combined with in-depth qualitative interviews to build a comprehensive picture of health disparities. The study operates in partnership with community organizations serving homeless shelters, transitional housing, and correctional health systems in five cities.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200473, 1010, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200474, 1010, 18, '800', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200475, 1010, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200476, 1010, 9, 'City Hope Shelter Network; Regional Correctional Health Services; Community Bridge Alliance; Harbor House Transitional Housing; Metro Safe Haven', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200477, 1010, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200478, 1010, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200479, 1010, 51, '06/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200480, 1010, 54, '12/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200481, 1010, 50, '5.4', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200482, 1010, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200483, 1010, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200484, 1010, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200485, 1010, 26, 'Electronic Medical Records', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200486, 1010, 26, 'Social', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200487, 1010, 26, 'Behavioral', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200488, 1010, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200489, 1010, 46, 'Aggregate Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200490, 1010, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200491, 1010, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200492, 1010, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200493, 1010, 70, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200494, 1010, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200495, 1010, 56, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200496, 1010, 57, 'COVID-19; substance use disorder; chronic comorbidities', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1011
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1011,
    'e1f2a3b4-c5d6-7890-efab-901234567890',
    NULL, NULL, NULL, NULL,
    3,
    'admin-uuid-1011-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200497, 1011, 5, 'AFF-Three', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200498, 1011, 2, 'Genomic Characterization and Clinical Correlation of SARS-CoV-2 Variants Using Targeted and Whole Genome Sequencing', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200499, 1011, 10, 'Dr. David Nakamura', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200500, 1011, 11, 'david.nakamura@genomics.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200501, 1011, 14, 'Institute for Genomic Medicine, Coastal University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200502, 1011, 12, 'Amy Liu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200503, 1011, 13, 'amy.liu@genomics.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200504, 1011, 67, 'U01-HG012789', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200505, 1011, 16, 'Dr. Rebecca Stone', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200506, 1011, 24, 'NHGRI', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200507, 1011, 24, 'NCI', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200508, 1011, 100, 'RFA-HG-23-005', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200509, 1011, 6, '07/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200510, 1011, 7, '06/30/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200511, 1011, 82, 'Variants', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200512, 1011, 82, 'Next Generation Sequencing (NGS)', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200513, 1011, 82, 'Virological Testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200514, 1011, 20, 'Molecular Nucleic Acid or PCR Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200515, 1011, 20, 'Biobank Samples', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200516, 1011, 81, 'Immigrants', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200517, 1011, 81, 'Racial or Ethnic Minorities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200518, 1011, 21, 'genomic sequencing', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200519, 1011, 21, 'SARS-CoV-2 variants', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200520, 1011, 21, 'clinical genomics', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200521, 1011, 21, 'phylogenetics', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200522, 1011, 21, 'variant characterization', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200523, 1011, 22, 'Clinical Genetic Testing', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200524, 1011, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200525, 1011, 102, '1001 - 2000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200526, 1011, 35, 'Supported by NHGRI and NCI under grant U01-HG012789.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200527, 1011, 3, 'This observational study applies targeted and whole genome sequencing to characterize SARS-CoV-2 genomic diversity and its clinical correlates among immigrant and minority populations in a large metropolitan area. Residual diagnostic specimens from PCR-positive individuals are subjected to tiled amplicon sequencing and bioinformatic analysis for lineage assignment, mutation profiling, and phylogenetic reconstruction. Clinical outcomes, vaccination status, and demographic data are linked to genomic findings to assess whether specific viral lineages are associated with differential disease severity across population subgroups.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200528, 1011, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200529, 1011, 18, '1800', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200530, 1011, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200531, 1011, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200532, 1011, 42, 'Sequence Read Archive (SRA)', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200533, 1011, 42, 'GenBank', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200534, 1011, 42, 'dbGaP', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200535, 1011, 51, '09/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200536, 1011, 54, '03/15/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200537, 1011, 50, '250.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200538, 1011, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200539, 1011, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200540, 1011, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200541, 1011, 26, 'Clinical', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200542, 1011, 26, 'Sequencing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200543, 1011, 26, 'Individual Genotype', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200544, 1011, 26, 'Individual Sequencing', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200545, 1011, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200546, 1011, 29, 'RNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200547, 1011, 29, 'DNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200548, 1011, 29, 'Single Cell', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200549, 1011, 30, 'Whole Genome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200550, 1011, 30, 'Targeted Genome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200551, 1011, 30, 'Targeted Transcriptome', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200552, 1011, 28, 'Genotype calls derived from Sequence', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200553, 1011, 28, 'CNV calls derived from Sequencing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200554, 1011, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200555, 1011, 43, 'Association/Linkage Results', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200556, 1011, 43, 'RNA Seq derived Expression', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200557, 1011, 44, 'Expression Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200558, 1011, 44, 'SNP Array', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200559, 1011, 60, 'Publication required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200560, 1011, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200561, 1011, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200562, 1011, 70, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200563, 1011, 70, 'Collaboration required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200564, 1011, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200565, 1011, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200566, 1011, 56, 'Publication required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (200567, 1011, 57, 'COVID-19; SARS-CoV-2 genomic variants', 0, '2025-03-15 10:30:00', 5);

COMMIT;

-- Total study_property_value rows: 567
