-- ============================================================
-- Synthetic Study Data - 20 More Studies (IDs 1032-1051)
-- PostgreSQL Insert Script for RADx Data Hub
-- ============================================================

BEGIN;

-- ============================================================
-- STUDY 1032
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1032,
    'a1001032-b2c3-4567-abcd-100132000001',
    NULL, NULL, NULL, NULL,
    1,
    'admin-uuid-1032-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500001, 1032, 5, 'AFF-One', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500002, 1032, 2, 'Seroprevalence and Durability of Hybrid Immunity in Healthcare Workers Following Sequential Vaccination and Breakthrough Infection', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500003, 1032, 10, 'Dr. Angela Russo', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500004, 1032, 11, 'angela.russo@immunetrack.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500005, 1032, 14, 'Immune Surveillance Research Center, Commonwealth University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500006, 1032, 12, 'Joshua Wells', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500007, 1032, 13, 'joshua.wells@immunetrack.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500008, 1032, 67, 'R01-AI211234', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500009, 1032, 16, 'Dr. Leonard Cruz', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500010, 1032, 24, 'NIAID', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500011, 1032, 24, 'NHLBI', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500012, 1032, 100, 'RFA-AI-24-010', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500013, 1032, 6, '01/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500014, 1032, 7, '12/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500015, 1032, 82, 'Seroprevalence', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500016, 1032, 82, 'Immune Responses', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500017, 1032, 82, 'Vaccination Rate or Uptake', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500018, 1032, 20, 'Antibody or Adaptive Immune Response Testing', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500019, 1032, 20, 'Survey', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500020, 1032, 20, 'Real-World Data', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500021, 1032, 81, 'Essential Workers', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500022, 1032, 81, 'Adults', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500023, 1032, 21, 'seroprevalence', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500024, 1032, 21, 'hybrid immunity', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500025, 1032, 21, 'healthcare workers', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500026, 1032, 21, 'breakthrough infection', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500027, 1032, 21, 'antibody durability', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500028, 1032, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500029, 1032, 102, '1001 - 2000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500030, 1032, 35, 'Supported by NIAID and NHLBI under grant R01-AI211234.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500031, 1032, 3, 'This longitudinal cohort study tracks the durability and breadth of hybrid immunity — conferred by both vaccination and natural SARS-CoV-2 infection — in a cohort of healthcare workers across three hospital systems. Quarterly serological assessments measure neutralizing antibody titers against ancestral and variant spike proteins, while cellular immunity is assessed via interferon-gamma release assays. The study correlates immunological endpoints with vaccination history, number and timing of breakthrough infections, and demographic factors to define correlates of durable protection in a high-exposure occupational cohort.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500032, 1032, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500033, 1032, 18, '1500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500034, 1032, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500035, 1032, 9, 'Commonwealth University Hospital; City Memorial Medical Center; Regional Veterans Health System', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500036, 1032, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500037, 1032, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500038, 1032, 51, '04/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500039, 1032, 54, '10/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500040, 1032, 50, '9.5', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500041, 1032, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500042, 1032, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500043, 1032, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500044, 1032, 26, 'Immunological', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500045, 1032, 26, 'Questionnaire or Survey', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500046, 1032, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500047, 1032, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500048, 1032, 29, 'Germline', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500049, 1032, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500050, 1032, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500051, 1032, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500052, 1032, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500053, 1032, 57, 'COVID-19; breakthrough SARS-CoV-2 infection', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1033
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1033,
    'a1001033-c3d4-5678-bcde-100133000002',
    NULL, NULL, NULL, NULL,
    2,
    'admin-uuid-1033-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500054, 1033, 5, 'AFF-Two', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500055, 1033, 2, 'Real-Time Breath Analysis for Non-Invasive SARS-CoV-2 Detection in Emergency Department Triage Settings', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500056, 1033, 10, 'Dr. Nikolai Petrov', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500057, 1033, 11, 'nikolai.petrov@breathdx.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500058, 1033, 14, 'Breath Diagnostics Innovation Lab, Metropolis University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500059, 1033, 12, 'Yolanda Griffin', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500060, 1033, 13, 'yolanda.griffin@breathdx.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500061, 1033, 67, 'U01-EB041234', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500062, 1033, 16, 'Dr. Constance Lee', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500063, 1033, 24, 'NIBIB', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500064, 1033, 24, 'NHLBI', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500065, 1033, 100, 'RFA-EB-24-002', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500066, 1033, 6, '06/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500067, 1033, 7, '05/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500068, 1033, 82, 'Novel Biosensing or VOC', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500069, 1033, 82, 'Point-of-Care (POC) Testing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500070, 1033, 82, 'Screening Testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500071, 1033, 20, 'Breath Analysis or Airborne Detection Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500072, 1033, 20, 'Molecular Nucleic Acid or PCR Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500073, 1033, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500074, 1033, 81, 'Older Adults or Elderly', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500075, 1033, 21, 'breath analysis', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500076, 1033, 21, 'volatile organic compounds', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500077, 1033, 21, 'emergency department', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500078, 1033, 21, 'non-invasive', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500079, 1033, 21, 'triage screening', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500080, 1033, 22, 'Device Validation', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500081, 1033, 22, 'Cross-Sectional', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500082, 1033, 102, '1001 - 2000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500083, 1033, 35, 'Funded by NIBIB and NHLBI under grant U01-EB041234.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500084, 1033, 3, 'This device validation study evaluates real-time breath analysis using gas chromatography-ion mobility spectrometry for non-invasive SARS-CoV-2 detection during emergency department triage. Patients presenting with respiratory symptoms provide a 15-second breath sample into a portable analyzer that identifies COVID-19-associated volatile organic compound signatures within 3 minutes. Results are compared against RT-PCR reference testing. The study measures sensitivity, specificity, and negative predictive value at clinically relevant prevalence rates, with subgroup analysis by age, symptom duration, and vaccination status.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500085, 1033, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500086, 1033, 18, '1800', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500087, 1033, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500088, 1033, 9, 'Metropolis University Emergency Department; Riverside Regional ER; Southside Urgent Care Network (8 sites)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500089, 1033, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500090, 1033, 51, '05/20/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500091, 1033, 54, '11/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500092, 1033, 50, '2.8', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500093, 1033, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500094, 1033, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500095, 1033, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500096, 1033, 26, 'Chemosensor', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500097, 1033, 26, 'Biosensor', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500098, 1033, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500099, 1033, 46, 'Aggregate Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500100, 1033, 60, 'Publication required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500101, 1033, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500102, 1033, 70, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500103, 1033, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500104, 1033, 56, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500105, 1033, 57, 'COVID-19; respiratory illness', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1034
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1034,
    'a1001034-d4e5-6789-cdef-100134000003',
    NULL, NULL, NULL, NULL,
    3,
    'admin-uuid-1034-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500106, 1034, 5, 'AFF-Three', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500107, 1034, 2, 'Impact of COVID-19 on Maternal-Fetal Outcomes: Placental Genomics and Neonatal Immune Development', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500108, 1034, 10, 'Dr. Samantha Bright', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500109, 1034, 11, 'samantha.bright@perinatology.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500110, 1034, 14, 'Institute for Perinatology Research, Bayview University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500111, 1034, 12, 'Carlos Fuentes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500112, 1034, 13, 'carlos.fuentes@perinatology.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500113, 1034, 67, 'R01-HD156789', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500114, 1034, 16, 'Dr. Irene Walsh', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500115, 1034, 24, 'NICHD', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500116, 1034, 24, 'NIAID', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500117, 1034, 100, 'RFA-HD-23-030', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500118, 1034, 6, '07/15/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500119, 1034, 7, '07/14/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500120, 1034, 82, 'Immune Responses', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500121, 1034, 82, 'Comorbidities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500122, 1034, 82, 'Next Generation Sequencing (NGS)', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500123, 1034, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500124, 1034, 20, 'Disease Registry', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500125, 1034, 20, 'Real-World Data', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500126, 1034, 81, 'Pregnant or Nursing Women', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500127, 1034, 81, 'Children', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500128, 1034, 81, 'African Americans', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500129, 1034, 21, 'maternal-fetal', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500130, 1034, 21, 'placental genomics', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500131, 1034, 21, 'neonatal immunity', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500132, 1034, 21, 'vertical transmission', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500133, 1034, 21, 'pregnancy outcomes', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500134, 1034, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500135, 1034, 102, '501 - 1000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500136, 1034, 35, 'Supported by NICHD and NIAID under grant R01-HD156789.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500137, 1034, 3, 'This longitudinal cohort study investigates the impact of SARS-CoV-2 infection during pregnancy on placental gene expression, fetal development, and neonatal immune maturation. Pregnant individuals with confirmed COVID-19 and uninfected matched controls are followed from enrollment through 6 months postpartum. Placental tissue undergoes bulk and single-cell RNA sequencing to identify infection-driven transcriptional changes. Paired maternal and cord blood samples are analyzed for transplacental antibody transfer efficiency and neonatal immune cell composition. Neonatal follow-up includes developmental assessments and immune profiling at 1, 3, and 6 months.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500138, 1034, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500139, 1034, 18, '800', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500140, 1034, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500141, 1034, 9, 'Bayview University Maternal Health Center; Sunrise Women''s Hospital; Community Midwifery Collaborative', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500142, 1034, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500143, 1034, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500144, 1034, 42, 'GEO', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500145, 1034, 42, 'Sequence Read Archive (SRA)', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500146, 1034, 51, '06/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500147, 1034, 54, '12/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500148, 1034, 50, '195.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500149, 1034, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500150, 1034, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500151, 1034, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500152, 1034, 26, 'Clinical', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500153, 1034, 26, 'Immunological', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500154, 1034, 26, 'Individual Sequencing', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500155, 1034, 26, 'Biologic Specimens', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500156, 1034, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500157, 1034, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500158, 1034, 29, 'RNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500159, 1034, 29, 'Single Cell', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500160, 1034, 30, 'Whole Transcriptome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500161, 1034, 30, 'Whole Exome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500162, 1034, 30, 'Targeted Transcriptome', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500163, 1034, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500164, 1034, 43, 'RNA Seq derived Expression', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500165, 1034, 43, 'Association/Linkage Results', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500166, 1034, 44, 'Expression Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500167, 1034, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500168, 1034, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500169, 1034, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500170, 1034, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500171, 1034, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500172, 1034, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500173, 1034, 57, 'COVID-19; preterm birth; preeclampsia; neonatal immune development', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1035
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1035,
    'a1001035-e5f6-7890-defa-100135000004',
    NULL, NULL, NULL, NULL,
    4,
    'admin-uuid-1035-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500174, 1035, 5, 'AFF-Four', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500175, 1035, 2, 'COVID-19 Testing and Infection Outcomes Among People Living with HIV on Antiretroviral Therapy', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500176, 1035, 10, 'Dr. Oladapo Adeyemi', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500177, 1035, 11, 'oladapo.adeyemi@hivresearch.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500178, 1035, 14, 'HIV and Emerging Infections Research Institute', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500179, 1035, 12, 'Tracy Simmons', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500180, 1035, 13, 'tracy.simmons@hivresearch.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500181, 1035, 67, 'R01-AI223456', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500182, 1035, 16, 'Dr. Janet Solomon', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500183, 1035, 24, 'NIAID', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500184, 1035, 24, 'NIMHD', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500185, 1035, 100, 'RFA-AI-23-065', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500186, 1035, 6, '11/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500187, 1035, 7, '10/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500188, 1035, 82, 'Comorbidities', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500189, 1035, 82, 'Diagnostic Testing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500190, 1035, 82, 'Immune Responses', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500191, 1035, 82, 'Health Behaviors', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500192, 1035, 20, 'Molecular Nucleic Acid or PCR Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500193, 1035, 20, 'Antigen Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500194, 1035, 20, 'Disease Registry', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500195, 1035, 81, 'People Living with HIV/AIDS', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500196, 1035, 81, 'Sexual or Gender Minorities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500197, 1035, 81, 'African Americans', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500198, 1035, 81, 'Hispanics or Latinos', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500199, 1035, 21, 'HIV', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500200, 1035, 21, 'antiretroviral therapy', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500201, 1035, 21, 'coinfection', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500202, 1035, 21, 'immunosuppression', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500203, 1035, 21, 'COVID-19 outcomes', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500204, 1035, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500205, 1035, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500206, 1035, 102, '2001 - 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500207, 1035, 35, 'Funded by NIAID and NIMHD under grant R01-AI223456.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500208, 1035, 3, 'This longitudinal observational study examines SARS-CoV-2 testing patterns, infection incidence, and clinical outcomes among people living with HIV (PLWH) on stable antiretroviral therapy across a network of Ryan White-funded clinics. The study compares COVID-19 severity, hospitalization, and Long COVID prevalence between PLWH stratified by CD4 count and viral suppression status versus HIV-negative matched controls. Serial testing with rapid antigen and PCR assays enables real-time infection ascertainment. The study also evaluates whether specific antiretroviral regimens modulate COVID-19 susceptibility or severity.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500209, 1035, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500210, 1035, 18, '3200', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500211, 1035, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500212, 1035, 9, 'Metropolitan HIV Health Alliance (12 Ryan White clinics); Southern AIDS Service Network; Pacific Coast HIV Research Consortium', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500213, 1035, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500214, 1035, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500215, 1035, 51, '07/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500216, 1035, 54, '01/15/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500217, 1035, 50, '11.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500218, 1035, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500219, 1035, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500220, 1035, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500221, 1035, 26, 'Immunological', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500222, 1035, 26, 'Electronic Medical Records', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500223, 1035, 26, 'Behavioral', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500224, 1035, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500225, 1035, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500226, 1035, 29, 'RNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500227, 1035, 30, 'Targeted Exome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500228, 1035, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500229, 1035, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500230, 1035, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500231, 1035, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500232, 1035, 70, 'Collaboration required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500233, 1035, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500234, 1035, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500235, 1035, 57, 'COVID-19; HIV/AIDS; immunosuppression', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1036
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1036,
    'a1001036-f6a7-8901-efab-100136000005',
    NULL, NULL, NULL, NULL,
    5,
    'admin-uuid-1036-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500236, 1036, 5, 'Demo Affiliation 1', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500237, 1036, 2, 'Genotype-Phenotype Correlations in COVID-19 Severity: A Multi-Ancestry Genome-Wide Association Study', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500238, 1036, 10, 'Dr. Mei-Lin Zhou', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500239, 1036, 11, 'meilin.zhou@popgenomics.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500240, 1036, 14, 'Center for Population Genomics, Federal University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500241, 1036, 12, 'Andre Washington', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500242, 1036, 13, 'andre.washington@popgenomics.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500243, 1036, 67, 'U01-HG014567', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500244, 1036, 16, 'Dr. Monica Alvarez', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500245, 1036, 24, 'NHGRI', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500246, 1036, 24, 'NIMHD', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500247, 1036, 24, 'NIGMS', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500248, 1036, 100, 'RFA-HG-24-001', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500249, 1036, 6, '04/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500250, 1036, 7, '03/31/2028', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500251, 1036, 82, 'Variants', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500252, 1036, 82, 'Social Determinants of Health', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500253, 1036, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500254, 1036, 20, 'Disease Registry', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500255, 1036, 20, 'Real-World Data', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500256, 1036, 81, 'Racial or Ethnic Minorities', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500257, 1036, 81, 'African Americans', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500258, 1036, 81, 'Hispanics or Latinos', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500259, 1036, 81, 'Asians', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500260, 1036, 81, 'Native Hawaiians or Other Pacific Islanders', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500261, 1036, 21, 'GWAS', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500262, 1036, 21, 'multi-ancestry', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500263, 1036, 21, 'genotype-phenotype', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500264, 1036, 21, 'host genetics', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500265, 1036, 21, 'disease severity', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500266, 1036, 22, 'Case-Control', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500267, 1036, 102, '> 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500268, 1036, 35, 'Supported by NHGRI, NIMHD, and NIGMS under grant U01-HG014567.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500269, 1036, 3, 'This multi-ancestry genome-wide association study (GWAS) investigates host genetic determinants of COVID-19 severity across diverse ancestral backgrounds. Leveraging biobank specimens linked to electronic health records from five large health systems, the study genotypes >50,000 individuals with confirmed SARS-CoV-2 infection stratified by disease severity (asymptomatic, mild, hospitalized, ICU, fatal). The multi-ancestry design with proportional representation of African, Hispanic/Latino, Asian, and Pacific Islander populations addresses the critical underrepresentation of non-European ancestries in existing COVID-19 genetic studies. Fine-mapping, gene-based, and pathway analyses identify causal variants and biological mechanisms underlying severity disparities.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500270, 1036, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500271, 1036, 18, '52000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500272, 1036, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500273, 1036, 9, 'Federal University Biobank; National Diversity Genomics Consortium (5 health systems); Pacific Genomics Alliance', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500274, 1036, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500275, 1036, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500276, 1036, 42, 'dbSNP', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500277, 1036, 42, 'dbVar', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500278, 1036, 51, '08/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500279, 1036, 54, '02/28/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500280, 1036, 50, '800.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500281, 1036, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500282, 1036, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500283, 1036, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500284, 1036, 26, 'Genotyping', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500285, 1036, 26, 'Clinical', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500286, 1036, 26, 'Individual Genotype', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500287, 1036, 26, 'Individual Phenotype', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500288, 1036, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500289, 1036, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500290, 1036, 29, 'Germline', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500291, 1036, 30, 'Whole Genome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500292, 1036, 28, 'Array-derived Genotypes', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500293, 1036, 28, 'Genotype calls derived from Sequence', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500294, 1036, 28, 'CNV calls derived from Sequencing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500295, 1036, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500296, 1036, 27, 'Aggregate Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500297, 1036, 43, 'Association/Linkage Results', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500298, 1036, 44, 'SNP Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500299, 1036, 60, 'Publication required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500300, 1036, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500301, 1036, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500302, 1036, 70, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500303, 1036, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500304, 1036, 56, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500305, 1036, 56, 'Collaboration required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500306, 1036, 57, 'COVID-19; host genetic susceptibility', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1037
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1037,
    'a1001037-a7b8-9012-fabc-100137000006',
    NULL, NULL, NULL, NULL,
    1,
    'admin-uuid-1037-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500307, 1037, 5, 'AFF-One', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500308, 1037, 2, 'Multisystem Inflammatory Syndrome in Adults (MIS-A): Clinical Characterization, Risk Factors, and Cardiac Outcomes', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500309, 1037, 10, 'Dr. Benjamin Torres', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500310, 1037, 11, 'benjamin.torres@cardioimmune.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500311, 1037, 14, 'Cardioimmunology Research Program, Summit Medical University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500312, 1037, 12, 'Fiona Clarke', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500313, 1037, 13, 'fiona.clarke@cardioimmune.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500314, 1037, 67, 'R01-HL178901', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500315, 1037, 16, 'Dr. Gregory Dunn', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500316, 1037, 24, 'NHLBI', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500317, 1037, 24, 'NIAID', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500318, 1037, 100, 'RFA-HL-24-005', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500319, 1037, 6, '05/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500320, 1037, 7, '04/30/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500321, 1037, 82, 'Multisystem Inflammatory Syndrome (MIS)', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500322, 1037, 82, 'Immune Responses', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500323, 1037, 82, 'Comorbidities', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500324, 1037, 20, 'Disease Registry', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500325, 1037, 20, 'Biobank Samples', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500326, 1037, 20, 'Interview or Focus Group', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500327, 1037, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500328, 1037, 81, 'African Americans', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500329, 1037, 81, 'Hispanics or Latinos', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500330, 1037, 21, 'MIS-A', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500331, 1037, 21, 'multisystem inflammatory', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500332, 1037, 21, 'cardiac outcomes', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500333, 1037, 21, 'myocarditis', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500334, 1037, 21, 'hyperinflammation', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500335, 1037, 22, 'Case-Control', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500336, 1037, 22, 'Longitudinal Cohort', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500337, 1037, 102, '251 - 500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500338, 1037, 35, 'Funded by NHLBI and NIAID under grant R01-HL178901.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500339, 1037, 3, 'This case-control study with longitudinal cardiac follow-up characterizes multisystem inflammatory syndrome in adults (MIS-A) — a rare but severe post-infectious complication of SARS-CoV-2. Cases meeting CDC MIS-A criteria are enrolled from 15 tertiary care centers and compared with post-COVID controls without MIS-A. Comprehensive phenotyping includes cardiac MRI, echocardiography, endomyocardial biopsy when clinically indicated, and serial biomarker profiling (troponin, BNP, ferritin, IL-6). Longitudinal follow-up at 6 and 12 months assesses cardiac recovery, functional capacity, and quality of life.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500340, 1037, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500341, 1037, 18, '400', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500342, 1037, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500343, 1037, 9, 'Summit Medical University Cardiology; National MIS-A Registry Network (15 sites); Cardiac Imaging Core Lab', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500344, 1037, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500345, 1037, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500346, 1037, 42, 'ClinVar', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500347, 1037, 51, '06/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500348, 1037, 54, '12/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500349, 1037, 50, '28.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500350, 1037, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500351, 1037, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500352, 1037, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500353, 1037, 26, 'Immunological', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500354, 1037, 26, 'Imaging', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500355, 1037, 26, 'Biologic Specimens', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500356, 1037, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500357, 1037, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500358, 1037, 29, 'RNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500359, 1037, 29, 'Germline', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500360, 1037, 30, 'Whole Exome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500361, 1037, 28, 'Genotype calls derived from Sequence', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500362, 1037, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500363, 1037, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500364, 1037, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500365, 1037, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500366, 1037, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500367, 1037, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500368, 1037, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500369, 1037, 56, 'Collaboration required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500370, 1037, 57, 'COVID-19; MIS-A; myocarditis; hyperinflammatory syndrome', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1038
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1038,
    'a1001038-b8c9-0123-abcd-100138000007',
    NULL, NULL, NULL, NULL,
    2,
    'admin-uuid-1038-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500371, 1038, 5, 'AFF-Two', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500372, 1038, 2, 'COVID-19 Antibody Kinetics and Mucosal Immunity in Individuals with Intellectual and Developmental Disabilities', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500373, 1038, 10, 'Dr. Rebecca Hoffman', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500374, 1038, 11, 'rebecca.hoffman@disabilityhealth.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500375, 1038, 14, 'Center for Disability and Health Equity Research', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500376, 1038, 12, 'Anthony Sparks', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500377, 1038, 13, 'anthony.sparks@disabilityhealth.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500378, 1038, 67, 'R21-HD167890', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500379, 1038, 16, 'Dr. Paula Richardson', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500380, 1038, 24, 'NICHD', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500381, 1038, 24, 'NIAID', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500382, 1038, 24, 'NIMHD', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500383, 1038, 100, 'PA-23-175', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500384, 1038, 6, '09/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500385, 1038, 7, '08/31/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500386, 1038, 82, 'Immune Responses', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500387, 1038, 82, 'Serological or Antibody Testing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500388, 1038, 82, 'Health Behaviors', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500389, 1038, 20, 'Antibody or Adaptive Immune Response Testing', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500390, 1038, 20, 'Survey', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500391, 1038, 20, 'Interview or Focus Group', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500392, 1038, 81, 'Intellectual or Developmental Disabilities', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500393, 1038, 81, 'Adults', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500394, 1038, 81, 'Children', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500395, 1038, 21, 'intellectual disability', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500396, 1038, 21, 'antibody kinetics', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500397, 1038, 21, 'mucosal immunity', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500398, 1038, 21, 'developmental disability', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500399, 1038, 21, 'IgA', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500400, 1038, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500401, 1038, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500402, 1038, 102, '251 - 500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500403, 1038, 35, 'Supported by NICHD, NIAID, and NIMHD under grant R21-HD167890.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500404, 1038, 3, 'This longitudinal observational study examines SARS-CoV-2 antibody kinetics, mucosal IgA responses, and factors influencing vaccine immunogenicity in individuals with intellectual and developmental disabilities (IDD) residing in group homes and supported living settings. Participants undergo serial serum and salivary sampling at 0, 3, 6, and 12 months post-vaccination or post-infection. The study addresses a critical evidence gap, as individuals with IDD face elevated COVID-19 risk due to congregate living yet are systematically excluded from most immunological studies. Caregiver surveys and interviews assess barriers to vaccination and testing access.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500405, 1038, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500406, 1038, 18, '300', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500407, 1038, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500408, 1038, 9, 'Center for Disability and Health Equity; Regional Supported Living Alliance (8 group homes); Community First IDD Services', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500409, 1038, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500410, 1038, 51, '04/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500411, 1038, 54, '08/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500412, 1038, 50, '1.8', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500413, 1038, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500414, 1038, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500415, 1038, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500416, 1038, 26, 'Immunological', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500417, 1038, 26, 'Behavioral', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500418, 1038, 26, 'Questionnaire or Survey', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500419, 1038, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500420, 1038, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500421, 1038, 60, 'Not-for-profit Organization', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500422, 1038, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500423, 1038, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500424, 1038, 70, 'Not-for-profit use only', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500425, 1038, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500426, 1038, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500427, 1038, 57, 'COVID-19; intellectual disability; Down syndrome', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1039
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1039,
    'a1001039-c9d0-1234-bcde-100139000008',
    NULL, NULL, NULL, NULL,
    3,
    'admin-uuid-1039-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500428, 1039, 5, 'AFF-Three', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500429, 1039, 2, 'Mitochondrial DNA Heteroplasmy and Bioenergetic Dysfunction in Post-COVID Chronic Fatigue', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500430, 1039, 10, 'Dr. Irena Volkov', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500431, 1039, 11, 'irena.volkov@mitoresearch.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500432, 1039, 14, 'Mitochondrial Medicine Research Center, Lakeshore University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500433, 1039, 12, 'Ethan Blake', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500434, 1039, 13, 'ethan.blake@mitoresearch.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500435, 1039, 67, 'R01-NS045678', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500436, 1039, 16, 'Dr. Arthur Flemming', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500437, 1039, 24, 'NINDS', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500438, 1039, 24, 'NIGMS', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500439, 1039, 100, 'RFA-NS-23-010', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500440, 1039, 6, '12/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500441, 1039, 7, '11/30/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500442, 1039, 82, 'Long COVID', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500443, 1039, 82, 'Next Generation Sequencing (NGS)', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500444, 1039, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500445, 1039, 20, 'Molecular Nucleic Acid or PCR Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500446, 1039, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500447, 1039, 81, 'Women (non-pregnant)', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500448, 1039, 21, 'mitochondrial DNA', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500449, 1039, 21, 'heteroplasmy', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500450, 1039, 21, 'bioenergetics', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500451, 1039, 21, 'chronic fatigue', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500452, 1039, 21, 'post-COVID', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500453, 1039, 22, 'Case-Control', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500454, 1039, 102, '251 - 500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500455, 1039, 35, 'Funded by NINDS and NIGMS under grant R01-NS045678.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500456, 1039, 3, 'This case-control study investigates the role of mitochondrial DNA heteroplasmy and bioenergetic dysfunction in the pathogenesis of post-COVID chronic fatigue syndrome. Cases with debilitating fatigue persisting >6 months post-SARS-CoV-2 infection are compared with recovered controls and pre-pandemic healthy volunteers. Deep sequencing of mitochondrial genomes from peripheral blood mononuclear cells and skeletal muscle biopsies quantifies heteroplasmic variant burden. Functional assays measure mitochondrial respiratory chain complex activities, ATP production, and reactive oxygen species generation. The study tests whether COVID-19-induced mitochondrial damage underlies persistent fatigue.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500457, 1039, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500458, 1039, 18, '300', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500459, 1039, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500460, 1039, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500461, 1039, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500462, 1039, 42, 'GenBank', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500463, 1039, 51, '09/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500464, 1039, 54, '03/30/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500465, 1039, 50, '55.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500466, 1039, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500467, 1039, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500468, 1039, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500469, 1039, 26, 'Sequencing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500470, 1039, 26, 'Biologic Specimens', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500471, 1039, 26, 'Metabolomic', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500472, 1039, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500473, 1039, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500474, 1039, 29, 'Mitochondria', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500475, 1039, 29, 'Single Cell', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500476, 1039, 30, 'Whole Genome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500477, 1039, 30, 'Targeted Genome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500478, 1039, 28, 'CNV calls derived from Sequencing', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500479, 1039, 28, 'Somatic SNV (.MAF)', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500480, 1039, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500481, 1039, 43, 'Association/Linkage Results', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500482, 1039, 60, 'Collaboration required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500483, 1039, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500484, 1039, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500485, 1039, 70, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500486, 1039, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500487, 1039, 56, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500488, 1039, 57, 'COVID-19; Long COVID; chronic fatigue syndrome; mitochondrial dysfunction', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1040
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1040,
    'a1001040-d0e1-2345-cdef-100140000009',
    NULL, NULL, NULL, NULL,
    4,
    'admin-uuid-1040-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500489, 1040, 5, 'AFF-Four', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500490, 1040, 2, 'SNP Array-Based Pharmacogenomic Profiling to Optimize COVID-19 Treatment Responses Across Diverse Populations', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500491, 1040, 10, 'Dr. Hassan El-Amin', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500492, 1040, 11, 'hassan.elamin@pharmacogenomics.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500493, 1040, 14, 'Pharmacogenomics Institute, Western Reserve University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500494, 1040, 12, 'Keiko Yamamoto', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500495, 1040, 13, 'keiko.yamamoto@pharmacogenomics.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500496, 1040, 67, 'U01-GM056789', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500497, 1040, 16, 'Dr. Oliver Bennett', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500498, 1040, 24, 'NIGMS', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500499, 1040, 24, 'NCATS', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500500, 1040, 24, 'NIMHD', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500501, 1040, 100, 'RFA-GM-24-003', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500502, 1040, 6, '03/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500503, 1040, 7, '02/28/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500504, 1040, 82, 'Variants', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500505, 1040, 82, 'Artificial Intelligence or Machine Learning', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500506, 1040, 82, 'Social Determinants of Health', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500507, 1040, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500508, 1040, 20, 'Disease Registry', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500509, 1040, 20, 'Real-World Data', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500510, 1040, 81, 'Racial or Ethnic Minorities', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500511, 1040, 81, 'Adults', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500512, 1040, 81, 'Hispanics or Latinos', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500513, 1040, 81, 'African Americans', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500514, 1040, 21, 'pharmacogenomics', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500515, 1040, 21, 'SNP array', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500516, 1040, 21, 'treatment response', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500517, 1040, 21, 'precision medicine', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500518, 1040, 21, 'health equity', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500519, 1040, 22, 'Observational', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500520, 1040, 22, 'Case-Control', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500521, 1040, 102, '> 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500522, 1040, 35, 'Supported by NIGMS, NCATS, and NIMHD under grant U01-GM056789.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500523, 1040, 3, 'This observational pharmacogenomic study uses high-density SNP array genotyping to identify genetic variants associated with differential responses to COVID-19 therapeutics — including remdesivir, nirmatrelvir/ritonavir, and monoclonal antibodies — across diverse ancestral populations. Biobank DNA specimens from >10,000 treated COVID-19 patients are genotyped and linked to detailed clinical outcome data from electronic health records. Machine learning models integrate pharmacogenomic, clinical, and demographic variables to predict treatment response. The study specifically addresses the underrepresentation of minority populations in pharmacogenomic research to ensure equitable precision medicine implementation.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500524, 1040, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500525, 1040, 18, '12000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500526, 1040, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500527, 1040, 9, 'Western Reserve University Health System; Diversity in Pharmacogenomics Consortium (8 sites); National COVID Treatment Registry', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500528, 1040, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500529, 1040, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500530, 1040, 42, 'dbSNP', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500531, 1040, 42, 'ClinVar', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500532, 1040, 51, '07/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500533, 1040, 54, '01/30/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500534, 1040, 50, '350.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500535, 1040, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500536, 1040, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500537, 1040, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500538, 1040, 26, 'Genotyping', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500539, 1040, 26, 'Clinical', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500540, 1040, 26, 'Individual Genotype', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500541, 1040, 26, 'Electronic Medical Records', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500542, 1040, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500543, 1040, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500544, 1040, 29, 'Germline', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500545, 1040, 28, 'Array-derived Genotypes', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500546, 1040, 28, 'CNV calls from microarray', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500547, 1040, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500548, 1040, 43, 'Association/Linkage Results', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500549, 1040, 43, 'Array-derived Expression', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500550, 1040, 44, 'SNP Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500551, 1040, 44, 'Expression Array', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500552, 1040, 60, 'Publication required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500553, 1040, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500554, 1040, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500555, 1040, 70, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500556, 1040, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500557, 1040, 56, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500558, 1040, 56, 'Collaboration required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500559, 1040, 57, 'COVID-19; pharmacogenomic variation; drug metabolism', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1041
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1041,
    'a1001041-e1f2-3456-defa-100141000010',
    NULL, NULL, NULL, NULL,
    5,
    'admin-uuid-1041-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500560, 1041, 5, 'Demo Affiliation 1', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500561, 1041, 2, 'Contact Tracing Effectiveness and Network Analysis of SARS-CoV-2 Transmission in Tribal Nations', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500562, 1041, 10, 'Dr. Mary Begay', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500563, 1041, 11, 'mary.begay@tribalhealth.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500564, 1041, 14, 'Tribal Nations Health Research Collaborative', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500565, 1041, 12, 'Joseph Whitehorse', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500566, 1041, 13, 'joseph.whitehorse@tribalhealth.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500567, 1041, 67, 'OT2-MD020123', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500568, 1041, 16, 'Dr. Kathleen Yazzie', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500569, 1041, 24, 'NIMHD', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500570, 1041, 24, 'NIAID', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500571, 1041, 100, 'OTA-MD-23-005', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500572, 1041, 6, '06/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500573, 1041, 7, '05/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500574, 1041, 82, 'Contact Tracing', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500575, 1041, 82, 'Community Outreach Programs', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500576, 1041, 82, 'Testing Rate or Uptake', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500577, 1041, 82, 'Disease Surveillance', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500578, 1041, 20, 'Contact Tracing', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500579, 1041, 20, 'Antigen Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500580, 1041, 20, 'Survey', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500581, 1041, 20, 'Smartphone', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500582, 1041, 81, 'Racial or Ethnic Minorities', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500583, 1041, 81, 'Rural Communities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500584, 1041, 81, 'Underserved or Vulnerable Populations', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500585, 1041, 21, 'contact tracing', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500586, 1041, 21, 'tribal nations', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500587, 1041, 21, 'network analysis', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500588, 1041, 21, 'indigenous health', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500589, 1041, 21, 'transmission dynamics', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500590, 1041, 22, 'Mixed Methods', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500591, 1041, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500592, 1041, 102, '2001 - 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500593, 1041, 35, 'Supported by NIMHD and NIAID under grant OT2-MD020123.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500594, 1041, 3, 'This mixed methods observational study evaluates the effectiveness of culturally adapted digital and community-based contact tracing strategies in five Tribal Nations with varying geographic and demographic characteristics. Smartphone-based proximity detection is complemented by community health representative-led manual contact tracing. Social network analysis maps transmission chains and identifies superspreading events within and between households, ceremonial gatherings, and workplaces. Qualitative components explore cultural facilitators and barriers to contact tracing participation, trust in public health systems, and community-defined solutions for pandemic preparedness.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500595, 1041, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500596, 1041, 18, '4000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500597, 1041, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500598, 1041, 9, 'Navajo Nation Health Department; Choctaw Nation Health Services; Cherokee Nation Health System; Oglala Lakota Health Collaborative; Lummi Nation Health Center', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500599, 1041, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500600, 1041, 51, '05/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500601, 1041, 54, '11/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500602, 1041, 50, '4.2', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500603, 1041, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500604, 1041, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500605, 1041, 26, 'Social', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500606, 1041, 26, 'Behavioral', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500607, 1041, 26, 'Geospatial', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500608, 1041, 26, 'Questionnaire or Survey', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500609, 1041, 26, 'Mobile', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500610, 1041, 46, 'Aggregate Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500611, 1041, 46, 'Individual-level Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500612, 1041, 60, 'Not-for-profit Organization', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500613, 1041, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500614, 1041, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500615, 1041, 70, 'Not-for-profit use only', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500616, 1041, 70, 'Collaboration required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500617, 1041, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500618, 1041, 56, 'Not-for-profit Organization', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500619, 1041, 56, 'Collaboration required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500620, 1041, 57, 'COVID-19; health disparities in indigenous populations', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1042
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1042,
    'a1001042-f2a3-4567-efab-100142000011',
    NULL, NULL, NULL, NULL,
    1,
    'admin-uuid-1042-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500621, 1042, 5, 'AFF-One', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500622, 1042, 2, 'Methylation Array Profiling of Epigenetic Changes Associated with Severe COVID-19 and ICU Survivorship', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500623, 1042, 10, 'Dr. Lydia Christensen', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500624, 1042, 11, 'lydia.christensen@criticalcare.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500625, 1042, 14, 'Critical Care Genomics Program, Northern Plains University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500626, 1042, 12, 'Wade Preston', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500627, 1042, 13, 'wade.preston@criticalcare.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500628, 1042, 67, 'R01-HL189012', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500629, 1042, 16, 'Dr. Sharon Kimball', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500630, 1042, 24, 'NHLBI', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500631, 1042, 24, 'NHGRI', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500632, 1042, 100, 'RFA-HL-23-020', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500633, 1042, 6, '08/15/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500634, 1042, 7, '08/14/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500635, 1042, 82, 'Immune Responses', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500636, 1042, 82, 'Comorbidities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500637, 1042, 82, 'Long COVID', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500638, 1042, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500639, 1042, 20, 'Disease Registry', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500640, 1042, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500641, 1042, 81, 'Older Adults or Elderly', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500642, 1042, 21, 'methylation array', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500643, 1042, 21, 'epigenetics', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500644, 1042, 21, 'ICU survivorship', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500645, 1042, 21, 'critical illness', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500646, 1042, 21, 'epigenetic clock', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500647, 1042, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500648, 1042, 22, 'Case-Control', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500649, 1042, 102, '501 - 1000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500650, 1042, 35, 'Funded by NHLBI and NHGRI under grant R01-HL189012.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500651, 1042, 3, 'This longitudinal case-control study profiles genome-wide DNA methylation changes in ICU survivors of severe COVID-19 compared with non-ICU hospitalized COVID-19 patients and community controls. Blood samples collected during ICU stay, at hospital discharge, and at 3, 6, and 12 months post-discharge undergo Illumina methylation array profiling. The study examines whether severe COVID-19 induces accelerated epigenetic aging, persistent immune cell epigenetic reprogramming, and methylation signatures predictive of post-ICU functional decline. Epigenetic clock algorithms quantify biological age acceleration relative to chronological age.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500652, 1042, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500653, 1042, 18, '600', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500654, 1042, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500655, 1042, 9, 'Northern Plains University ICU Research Unit; Regional Critical Care Consortium (6 ICUs); Post-ICU Recovery Clinic Network', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500656, 1042, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500657, 1042, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500658, 1042, 42, 'GEO', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500659, 1042, 51, '08/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500660, 1042, 54, '02/15/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500661, 1042, 50, '120.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500662, 1042, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500663, 1042, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500664, 1042, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500665, 1042, 26, 'Clinical', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500666, 1042, 26, 'Individual Phenotype', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500667, 1042, 26, 'Biologic Specimens', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500668, 1042, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500669, 1042, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500670, 1042, 30, 'Epigenomic Marks', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500671, 1042, 28, 'Array-derived Genotypes', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500672, 1042, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500673, 1042, 43, 'Array-derived Methylation', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500674, 1042, 43, 'Association/Linkage Results', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500675, 1042, 44, 'Methylation Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500676, 1042, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500677, 1042, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500678, 1042, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500679, 1042, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500680, 1042, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500681, 1042, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500682, 1042, 57, 'COVID-19; ARDS; ICU survivorship; epigenetic aging', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1043
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1043,
    'a1001043-a3b4-5678-fabc-100143000012',
    NULL, NULL, NULL, NULL,
    2,
    'admin-uuid-1043-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500683, 1043, 5, 'AFF-Two', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500684, 1043, 2, 'Electrochemical and Colorimetric Lateral Flow Assay Development for Simultaneous COVID-19 and Influenza Detection', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500685, 1043, 10, 'Dr. Vikram Mehta', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500686, 1043, 11, 'vikram.mehta@biosensoreng.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500687, 1043, 14, 'Biosensor Engineering Lab, River City University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500688, 1043, 12, 'Cassandra Bloom', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500689, 1043, 13, 'cassandra.bloom@biosensoreng.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500690, 1043, 67, 'U18-EB043456', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500691, 1043, 16, 'Dr. Lawrence Kim', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500692, 1043, 24, 'NIBIB', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500693, 1043, 24, 'NIAID', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500694, 1043, 100, 'RFA-EB-23-008', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500695, 1043, 6, '02/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500696, 1043, 7, '01/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500697, 1043, 82, 'Medical Device or Tool Development', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500698, 1043, 82, 'Diagnostic Testing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500699, 1043, 82, 'Influenza', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500700, 1043, 82, 'Biosensor Technologies', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500701, 1043, 20, 'Electrochemical Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500702, 1043, 20, 'Antigen Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500703, 1043, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500704, 1043, 81, 'Children', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500705, 1043, 81, 'Essential Workers', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500706, 1043, 21, 'lateral flow assay', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500707, 1043, 21, 'electrochemical', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500708, 1043, 21, 'colorimetric', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500709, 1043, 21, 'multiplex', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500710, 1043, 21, 'influenza-COVID dual testing', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500711, 1043, 22, 'Device Verification', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500712, 1043, 22, 'Device Validation', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500713, 1043, 102, '1001 - 2000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500714, 1043, 35, 'Supported by NIBIB and NIAID under grant U18-EB043456.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500715, 1043, 3, 'This combined device verification and validation study develops and evaluates novel dual-target lateral flow assays incorporating electrochemical signal amplification for simultaneous detection of SARS-CoV-2 and Influenza A/B antigens from a single nasal swab. Phase 1 (verification) characterizes analytical performance using contrived panels with defined viral concentrations. Phase 2 (validation) conducts prospective clinical evaluation across urgent care sites, pediatric clinics, and occupational health settings during overlapping respiratory virus seasons. The study compares electrochemical readout performance with standard colorimetric visual interpretation and smartphone-assisted image analysis.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500716, 1043, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500717, 1043, 18, '1500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500718, 1043, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500719, 1043, 9, 'River City University Clinical Lab; Metro Urgent Care Alliance (12 sites); Pediatric Primary Care Research Network (8 sites)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500720, 1043, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500721, 1043, 51, '06/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500722, 1043, 54, '12/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500723, 1043, 50, '3.5', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500724, 1043, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500725, 1043, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500726, 1043, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500727, 1043, 26, 'Biosensor', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500728, 1043, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500729, 1043, 46, 'Aggregate Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500730, 1043, 60, 'Publication required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500731, 1043, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500732, 1043, 70, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500733, 1043, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500734, 1043, 56, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500735, 1043, 57, 'COVID-19; Influenza A/B; respiratory coinfection', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1044
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1044,
    'a1001044-b4c5-6789-abcd-100144000013',
    NULL, NULL, NULL, NULL,
    3,
    'admin-uuid-1044-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500736, 1044, 5, 'AFF-Three', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500737, 1044, 2, 'Digital Contact Tracing and Exposure Notification: Privacy, Adoption, and Public Health Impact Across Diverse Communities', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500738, 1044, 10, 'Dr. Alan Fitzpatrick', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500739, 1044, 11, 'alan.fitzpatrick@digitalph.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500740, 1044, 14, 'Digital Public Health Institute, Crescent University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500741, 1044, 12, 'Nadia Rosenberg', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500742, 1044, 13, 'nadia.rosenberg@digitalph.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500743, 1044, 67, 'R01-LM015678', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500744, 1044, 16, 'Dr. Tanya Gupta', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500745, 1044, 24, 'NLM', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500746, 1044, 24, 'NIMHD', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500747, 1044, 100, 'PA-23-200', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500748, 1044, 6, '10/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500749, 1044, 7, '09/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500750, 1044, 82, 'Digital Health Applications', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500751, 1044, 82, 'Pandemic Perceptions or Decision-Making', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500752, 1044, 82, 'Contact Tracing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500753, 1044, 20, 'Smartphone', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500754, 1044, 20, 'Survey', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500755, 1044, 20, 'Interview or Focus Group', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500756, 1044, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500757, 1044, 81, 'Racial or Ethnic Minorities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500758, 1044, 81, 'Lower Socioeconomic Status (SES) Populations', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500759, 1044, 21, 'digital contact tracing', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500760, 1044, 21, 'exposure notification', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500761, 1044, 21, 'privacy', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500762, 1044, 21, 'app adoption', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500763, 1044, 21, 'public trust', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500764, 1044, 22, 'Mixed Methods', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500765, 1044, 22, 'Cross-Sectional', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500766, 1044, 102, '2001 - 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500767, 1044, 35, 'Funded by NLM and NIMHD under grant R01-LM015678.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500768, 1044, 3, 'This mixed methods cross-sectional study evaluates the real-world adoption, sustained use, privacy perceptions, and public health impact of digital exposure notification applications across socioeconomically and racially diverse communities. Smartphone-delivered surveys and in-depth interviews assess adoption facilitators and barriers, privacy concerns, trust in technology platforms, and behavioral responses to exposure notifications. Population-level analysis links app adoption density with COVID-19 case trajectory data at the zip-code level to estimate the public health impact of digital contact tracing. The study provides evidence-based recommendations for equitable digital public health tool deployment.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500769, 1044, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500770, 1044, 18, '3500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500771, 1044, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500772, 1044, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500773, 1044, 51, '04/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500774, 1044, 54, '09/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500775, 1044, 50, '2.5', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500776, 1044, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500777, 1044, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500778, 1044, 26, 'Behavioral', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500779, 1044, 26, 'Social', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500780, 1044, 26, 'Questionnaire or Survey', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500781, 1044, 26, 'Mobile', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500782, 1044, 26, 'Geospatial', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500783, 1044, 46, 'Aggregate Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500784, 1044, 60, 'Not-for-profit Organization', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500785, 1044, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500786, 1044, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500787, 1044, 57, 'COVID-19; digital health equity', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1045
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1045,
    'a1001045-c5d6-7890-bcde-100145000014',
    NULL, NULL, NULL, NULL,
    4,
    'admin-uuid-1045-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500788, 1045, 5, 'AFF-Four', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500789, 1045, 2, 'Single-Cell Multi-Omics Atlas of Immune Dysregulation in Severe Pediatric COVID-19 and MIS-C', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500790, 1045, 10, 'Dr. Naomi Ishikawa', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500791, 1045, 11, 'naomi.ishikawa@pedimmune.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500792, 1045, 14, 'Pediatric Immunology Research Division, Eastern Medical University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500793, 1045, 12, 'Leo Castillo', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500794, 1045, 13, 'leo.castillo@pedimmune.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500795, 1045, 67, 'R01-AI234567', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500796, 1045, 16, 'Dr. Vincent Tran', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500797, 1045, 24, 'NIAID', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500798, 1045, 24, 'NICHD', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500799, 1045, 24, 'NHGRI', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500800, 1045, 100, 'RFA-AI-24-020', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500801, 1045, 6, '01/15/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500802, 1045, 7, '01/14/2028', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500803, 1045, 82, 'Multisystem Inflammatory Syndrome in Children (MIS-C)', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500804, 1045, 82, 'Immune Responses', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500805, 1045, 82, 'Next Generation Sequencing (NGS)', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500806, 1045, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500807, 1045, 20, 'Disease Registry', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500808, 1045, 81, 'Children', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500809, 1045, 81, 'Racial or Ethnic Minorities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500810, 1045, 81, 'Hispanics or Latinos', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500811, 1045, 21, 'single-cell', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500812, 1045, 21, 'multi-omics', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500813, 1045, 21, 'immune dysregulation', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500814, 1045, 21, 'pediatric', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500815, 1045, 21, 'CITE-seq', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500816, 1045, 22, 'Case-Control', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500817, 1045, 102, '251 - 500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500818, 1045, 35, 'Supported by NIAID, NICHD, and NHGRI under grant R01-AI234567.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500819, 1045, 3, 'This case-control study constructs a comprehensive single-cell multi-omics atlas of immune dysregulation in children with severe COVID-19 and MIS-C using CITE-seq (combined single-cell RNA sequencing and protein surface marker detection), single-cell ATAC-seq for chromatin accessibility, and T-cell/B-cell receptor repertoire sequencing. Peripheral blood samples from children with MIS-C, severe COVID-19, mild COVID-19, and healthy controls are profiled to define disease-specific immune cell states, clonal expansions, and regulatory circuit disruptions at single-cell resolution. The atlas serves as a community resource for understanding pediatric immune dysregulation.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500820, 1045, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500821, 1045, 18, '350', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500822, 1045, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500823, 1045, 9, 'Eastern Medical University Children''s Hospital; National Pediatric COVID Registry; Children''s Immunology Network (6 sites)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500824, 1045, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500825, 1045, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500826, 1045, 42, 'GEO', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500827, 1045, 42, 'Sequence Read Archive (SRA)', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500828, 1045, 51, '10/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500829, 1045, 54, '04/15/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500830, 1045, 50, '420.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500831, 1045, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500832, 1045, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500833, 1045, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500834, 1045, 26, 'Immunological', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500835, 1045, 26, 'Sequencing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500836, 1045, 26, 'Individual Sequencing', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500837, 1045, 26, 'Proteomic', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500838, 1045, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500839, 1045, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500840, 1045, 29, 'RNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500841, 1045, 29, 'Single Cell', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500842, 1045, 30, 'Whole Transcriptome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500843, 1045, 30, 'Whole Exome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500844, 1045, 30, 'Epigenomic Marks', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500845, 1045, 28, 'Genotype calls derived from Sequence', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500846, 1045, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500847, 1045, 43, 'RNA Seq derived Expression', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500848, 1045, 43, 'Association/Linkage Results', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500849, 1045, 43, 'Other', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500850, 1045, 44, 'Expression Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500851, 1045, 60, 'Collaboration required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500852, 1045, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500853, 1045, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500854, 1045, 70, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500855, 1045, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500856, 1045, 56, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500857, 1045, 56, 'Publication required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500858, 1045, 57, 'COVID-19; MIS-C; immune dysregulation; cytokine storm', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1046
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1046,
    'a1001046-d6e7-8901-cdef-100146000015',
    NULL, NULL, NULL, NULL,
    5,
    'admin-uuid-1046-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500859, 1046, 5, 'Demo Affiliation 1', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500860, 1046, 2, 'EUA-Authorized Home Test Accuracy Under Real-World Conditions: A Nationwide Prospective Assessment', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500861, 1046, 10, 'Dr. Carolyn Jacobs', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500862, 1046, 11, 'carolyn.jacobs@hometesting.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500863, 1046, 14, 'National Home Testing Evaluation Center', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500864, 1046, 12, 'Brian Whitfield', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500865, 1046, 13, 'brian.whitfield@hometesting.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500866, 1046, 67, 'U01-FD009012', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500867, 1046, 16, 'Dr. Amanda Sterling', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500868, 1046, 24, 'NIBIB', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500869, 1046, 24, 'NIH OD', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500870, 1046, 100, 'RFA-FD-24-001', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500871, 1046, 6, '11/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500872, 1046, 7, '10/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500873, 1046, 82, 'At-Home or Over-the-Counter (OTC) Self-Testing', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500874, 1046, 82, 'Screening Testing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500875, 1046, 82, 'Testing Rate or Uptake', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500876, 1046, 20, 'Antigen Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500877, 1046, 20, 'Smartphone', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500878, 1046, 20, 'Survey', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500879, 1046, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500880, 1046, 81, 'Older Adults or Elderly', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500881, 1046, 81, 'Rural Communities', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500882, 1046, 81, 'Lower Socioeconomic Status (SES) Populations', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500883, 1046, 21, 'home test', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500884, 1046, 21, 'EUA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500885, 1046, 21, 'real-world accuracy', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500886, 1046, 21, 'self-testing', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500887, 1046, 21, 'nationwide evaluation', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500888, 1046, 22, 'Cross-Sectional', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500889, 1046, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500890, 1046, 102, '> 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500891, 1046, 35, 'Funded by NIBIB and NIH OD under grant U01-FD009012.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500892, 1046, 3, 'This nationwide prospective study evaluates the real-world diagnostic accuracy of EUA-authorized home antigen tests when used by untrained individuals in their own homes without clinical supervision. Participants from all 50 states self-administer paired rapid antigen tests and mail-in PCR collection kits following symptom onset or known exposure. Smartphone-captured test result photographs undergo AI-assisted interpretation and are compared against self-reported visual reads and PCR results. The study quantifies the gap between manufacturer-reported performance and real-world accuracy, identifies user errors through instructional adherence surveys, and assesses performance disparities across age groups, geographic settings, and digital literacy levels.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500893, 1046, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500894, 1046, 18, '15000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500895, 1046, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500896, 1046, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500897, 1046, 51, '05/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500898, 1046, 54, '11/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500899, 1046, 50, '8.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500900, 1046, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500901, 1046, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500902, 1046, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500903, 1046, 26, 'Behavioral', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500904, 1046, 26, 'Questionnaire or Survey', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500905, 1046, 26, 'Mobile', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500906, 1046, 46, 'Aggregate Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500907, 1046, 46, 'Individual-level Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500908, 1046, 60, 'Publication required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500909, 1046, 60, 'Not-for-profit Organization', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500910, 1046, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500911, 1046, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500912, 1046, 57, 'COVID-19; home diagnostic testing', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1047
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1047,
    'a1001047-e7f8-9012-defa-100147000016',
    NULL, NULL, NULL, NULL,
    1,
    'admin-uuid-1047-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500913, 1047, 5, 'AFF-One', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500914, 1047, 2, 'Dialysis Patient COVID-19 Registry: Infection Outcomes, Vaccine Responses, and Antiviral Pharmacokinetics', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500915, 1047, 10, 'Dr. Grace Kim-Park', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500916, 1047, 11, 'grace.kimpark@nephrology.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500917, 1047, 14, 'Division of Nephrology, Capital Medical University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500918, 1047, 12, 'Russell Odom', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500919, 1047, 13, 'russell.odom@nephrology.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500920, 1047, 67, 'R01-DK078901', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500921, 1047, 16, 'Dr. Timothy Nash', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500922, 1047, 24, 'NIDDK', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500923, 1047, 24, 'NIAID', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500924, 1047, 100, 'RFA-DK-23-015', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500925, 1047, 6, '07/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500926, 1047, 7, '06/30/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500927, 1047, 82, 'Comorbidities', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500928, 1047, 82, 'Immune Responses', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500929, 1047, 82, 'Vaccination Rate or Uptake', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500930, 1047, 20, 'Disease Registry', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500931, 1047, 20, 'Molecular Nucleic Acid or PCR Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500932, 1047, 20, 'Antibody or Adaptive Immune Response Testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500933, 1047, 81, 'Dialysis Patients', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500934, 1047, 81, 'Adults', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500935, 1047, 81, 'Older Adults or Elderly', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500936, 1047, 81, 'African Americans', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500937, 1047, 21, 'dialysis', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500938, 1047, 21, 'end-stage renal disease', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500939, 1047, 21, 'vaccine response', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500940, 1047, 21, 'antiviral pharmacokinetics', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500941, 1047, 21, 'hemodialysis', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500942, 1047, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500943, 1047, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500944, 1047, 102, '1001 - 2000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500945, 1047, 35, 'Supported by NIDDK and NIAID under grant R01-DK078901.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500946, 1047, 3, 'This longitudinal observational study establishes a multi-center registry of COVID-19 infection outcomes, vaccine immunogenicity, and antiviral drug pharmacokinetics in patients receiving maintenance hemodialysis or peritoneal dialysis. The registry captures serial SARS-CoV-2 PCR results, post-vaccination and post-infection antibody levels, and clinical outcomes across 30 outpatient dialysis centers. A pharmacokinetic substudy measures nirmatrelvir and remdesivir drug levels in patients requiring dose adjustment due to renal impairment. The study addresses the disproportionate COVID-19 burden in the ESRD population and informs evidence-based treatment and vaccination guidelines for this immunocompromised group.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500947, 1047, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500948, 1047, 18, '1800', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500949, 1047, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500950, 1047, 9, 'Capital Medical University Dialysis Network (10 centers); National Renal Care Alliance (15 centers); Community Dialysis Cooperative (5 centers)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500951, 1047, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500952, 1047, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500953, 1047, 51, '06/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500954, 1047, 54, '01/01/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500955, 1047, 50, '14.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500956, 1047, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500957, 1047, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500958, 1047, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500959, 1047, 26, 'Immunological', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500960, 1047, 26, 'Electronic Medical Records', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500961, 1047, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500962, 1047, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500963, 1047, 29, 'RNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500964, 1047, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500965, 1047, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500966, 1047, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500967, 1047, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500968, 1047, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500969, 1047, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500970, 1047, 57, 'COVID-19; end-stage renal disease; hemodialysis; peritoneal dialysis', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1048
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1048,
    'a1001048-f8a9-0123-efab-100148000017',
    NULL, NULL, NULL, NULL,
    2,
    'admin-uuid-1048-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500971, 1048, 5, 'AFF-Two', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500972, 1048, 2, 'Gut Microbiome Disruption, Enteric SARS-CoV-2 Shedding, and Gastrointestinal Manifestations of COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500973, 1048, 10, 'Dr. Sophia Andersen', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500974, 1048, 11, 'sophia.andersen@gutresearch.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500975, 1048, 14, 'Gastrointestinal Microbiome Research Center, Harbor University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500976, 1048, 12, 'Derek Williamson', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500977, 1048, 13, 'derek.williamson@gutresearch.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500978, 1048, 67, 'R01-DK089012', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500979, 1048, 16, 'Dr. Nadine Parsons', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500980, 1048, 24, 'NIDDK', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500981, 1048, 24, 'NIAID', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500982, 1048, 24, 'NIEHS', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500983, 1048, 100, 'RFA-DK-24-002', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500984, 1048, 6, '04/15/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500985, 1048, 7, '04/14/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500986, 1048, 82, 'Disease Surveillance', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500987, 1048, 82, 'Long COVID', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500988, 1048, 82, 'Wastewater Surveillance', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500989, 1048, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500990, 1048, 20, 'Wastewater Sampling', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500991, 1048, 20, 'Survey', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500992, 1048, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500993, 1048, 81, 'Children', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500994, 1048, 81, 'Hispanics or Latinos', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500995, 1048, 21, 'gut microbiome', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500996, 1048, 21, 'enteric shedding', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500997, 1048, 21, 'gastrointestinal', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500998, 1048, 21, 'fecal virome', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (500999, 1048, 21, 'dysbiosis', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501000, 1048, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501001, 1048, 102, '501 - 1000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501002, 1048, 35, 'Funded by NIDDK, NIAID, and NIEHS under grant R01-DK089012.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501003, 1048, 3, 'This longitudinal cohort study investigates the relationship between gut microbiome disruption, duration of enteric SARS-CoV-2 shedding, and gastrointestinal manifestations during acute COVID-19 and Long COVID. Serial stool samples from acutely infected adults and children undergo shotgun metagenomic sequencing, fecal virome profiling, and SARS-CoV-2 quantification by RT-qPCR. Correlative wastewater surveillance data from study site catchment areas provide population-level context for individual enteric shedding patterns. The study examines whether specific microbiome configurations predispose to prolonged GI symptoms, persistent viral shedding, or post-infectious irritable bowel syndrome.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501004, 1048, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501005, 1048, 18, '750', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501006, 1048, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501007, 1048, 9, 'Harbor University GI Clinic; Pediatric Gastroenterology Network (4 sites); Community Health Center Alliance', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501008, 1048, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501009, 1048, 42, 'Sequence Read Archive (SRA)', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501010, 1048, 42, 'MGI', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501011, 1048, 51, '08/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501012, 1048, 54, '02/15/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501013, 1048, 50, '180.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501014, 1048, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501015, 1048, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501016, 1048, 26, 'Metagenomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501017, 1048, 26, 'Clinical', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501018, 1048, 26, 'Environmental', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501019, 1048, 26, 'Biologic Specimens', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501020, 1048, 26, 'Sequencing', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501021, 1048, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501022, 1048, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501023, 1048, 29, 'RNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501024, 1048, 29, 'Microbiome', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501025, 1048, 30, 'Whole Genome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501026, 1048, 30, '16S rRNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501027, 1048, 30, 'Whole Transcriptome', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501028, 1048, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501029, 1048, 43, 'RNA Seq derived Expression', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501030, 1048, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501031, 1048, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501032, 1048, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501033, 1048, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501034, 1048, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501035, 1048, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501036, 1048, 57, 'COVID-19; Long COVID; irritable bowel syndrome; gut dysbiosis', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1049
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1049,
    'a1001049-a9b0-1234-fabc-100149000018',
    NULL, NULL, NULL, NULL,
    3,
    'admin-uuid-1049-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501037, 1049, 5, 'AFF-Three', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501038, 1049, 2, 'Sanger Sequencing-Based Confirmation of SARS-CoV-2 Mutations in Resource-Limited Clinical Laboratories', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501039, 1049, 10, 'Dr. Frank Ogilvie', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501040, 1049, 11, 'frank.ogilvie@labcapacity.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501041, 1049, 14, 'Laboratory Capacity Building Program, Central Public Health Institute', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501042, 1049, 12, 'Jasmine Thornton', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501043, 1049, 13, 'jasmine.thornton@labcapacity.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501044, 1049, 67, 'R21-AI245678', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501045, 1049, 16, 'Dr. Cynthia Fox', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501046, 1049, 24, 'NIAID', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501047, 1049, 24, 'NLM', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501048, 1049, 100, 'PA-24-050', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501049, 1049, 6, '09/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501050, 1049, 7, '08/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501051, 1049, 82, 'Variants', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501052, 1049, 82, 'Virological Testing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501053, 1049, 82, 'Diagnostic Testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501054, 1049, 20, 'Molecular Nucleic Acid or PCR Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501055, 1049, 20, 'Biobank Samples', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501056, 1049, 81, 'N/A', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501057, 1049, 21, 'Sanger sequencing', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501058, 1049, 21, 'mutation confirmation', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501059, 1049, 21, 'resource-limited', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501060, 1049, 21, 'laboratory capacity', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501061, 1049, 21, 'variant surveillance', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501062, 1049, 22, 'Cross-Sectional', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501063, 1049, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501064, 1049, 102, '501 - 1000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501065, 1049, 35, 'Supported by NIAID and NLM under grant R21-AI245678.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501066, 1049, 3, 'This cross-sectional study evaluates the feasibility and accuracy of Sanger sequencing as a targeted, low-cost alternative to whole genome sequencing for confirming clinically significant SARS-CoV-2 spike protein mutations in resource-limited clinical laboratories. PCR-positive specimens undergo both Sanger and Illumina whole genome sequencing, with Sanger targeting the receptor binding domain, furin cleavage site, and other mutation hotspots. The study compares turnaround time, cost, accuracy, and interpretive complexity between platforms and develops standardized protocols and bioinformatics workflows optimized for laboratories lacking NGS infrastructure.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501067, 1049, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501068, 1049, 18, '600', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501069, 1049, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501070, 1049, 9, 'Central Public Health Institute Lab; Rural Hospital Laboratory Network (6 sites); State Public Health Labs (3 states)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501071, 1049, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501072, 1049, 42, 'GenBank', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501073, 1049, 42, 'Sequence Read Archive (SRA)', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501074, 1049, 51, '09/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501075, 1049, 54, '03/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501076, 1049, 50, '25.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501077, 1049, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501078, 1049, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501079, 1049, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501080, 1049, 26, 'Sequencing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501081, 1049, 29, 'RNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501082, 1049, 30, 'Sanger', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501083, 1049, 30, 'Whole Genome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501084, 1049, 30, 'Targeted Genome', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501085, 1049, 28, 'Genotype calls derived from Sequence', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501086, 1049, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501087, 1049, 60, 'Publication required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501088, 1049, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501089, 1049, 56, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501090, 1049, 57, 'COVID-19; SARS-CoV-2 spike protein mutations', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1050
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1050,
    'a1001050-b0c1-2345-abcd-100150000019',
    NULL, NULL, NULL, NULL,
    4,
    'admin-uuid-1050-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501091, 1050, 5, 'AFF-Four', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501092, 1050, 2, 'Wearable-Based Presymptomatic COVID-19 Detection Using Heart Rate Variability and Temperature Algorithms', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501093, 1050, 10, 'Dr. Patricia Hwang', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501094, 1050, 11, 'patricia.hwang@wearableai.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501095, 1050, 14, 'Wearable AI Health Lab, Pacific Technology University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501096, 1050, 12, 'Miles Underwood', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501097, 1050, 13, 'miles.underwood@wearableai.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501098, 1050, 67, 'U01-EB051234', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501099, 1050, 16, 'Dr. Gerald Okafor', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501100, 1050, 24, 'NIBIB', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501101, 1050, 24, 'NLM', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501102, 1050, 24, 'NIAID', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501103, 1050, 100, 'RFA-EB-24-005', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501104, 1050, 6, '01/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501105, 1050, 7, '12/31/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501106, 1050, 82, 'Biosensor Technologies', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501107, 1050, 82, 'Digital Health Applications', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501108, 1050, 82, 'Screening Testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501109, 1050, 82, 'Artificial Intelligence or Machine Learning', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501110, 1050, 20, 'Wearable', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501111, 1050, 20, 'Smartphone', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501112, 1050, 20, 'Antigen Testing Device', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501113, 1050, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501114, 1050, 81, 'Essential Workers', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501115, 1050, 81, 'School Communities', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501116, 1050, 21, 'wearable detection', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501117, 1050, 21, 'presymptomatic', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501118, 1050, 21, 'heart rate variability', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501119, 1050, 21, 'temperature monitoring', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501120, 1050, 21, 'AI algorithm', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501121, 1050, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501122, 1050, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501123, 1050, 102, '> 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501124, 1050, 35, 'Supported by NIBIB, NLM, and NIAID under grant U01-EB051234.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501125, 1050, 3, 'This large-scale longitudinal observational study deploys commercial wearable devices (smartwatches and continuous temperature monitors) to 10,000 participants in high-exposure occupational and educational settings for real-time presymptomatic COVID-19 detection. AI algorithms trained on heart rate variability, resting heart rate, skin temperature, and sleep pattern deviations generate infection probability scores. Participants perform confirmatory rapid antigen tests when algorithmic alerts are triggered. The study measures the lead time between wearable-detected physiological anomalies and symptom onset, and evaluates the positive predictive value of algorithmic alerts across seasons and respiratory virus types.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501126, 1050, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501127, 1050, 18, '10000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501128, 1050, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501129, 1050, 9, 'Pacific Technology University Campus; Metro Fire Department; National School Nurse Network (20 schools); Corporate Wellness Partners (5 companies)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501130, 1050, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501131, 1050, 51, '05/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501132, 1050, 54, '11/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501133, 1050, 50, '150.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501134, 1050, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501135, 1050, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501136, 1050, 26, 'Biosensor', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501137, 1050, 26, 'Temporal', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501138, 1050, 26, 'Mobile', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501139, 1050, 26, 'Clinical', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501140, 1050, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501141, 1050, 46, 'Aggregate Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501142, 1050, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501143, 1050, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501144, 1050, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501145, 1050, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501146, 1050, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501147, 1050, 57, 'COVID-19; presymptomatic detection; respiratory infection', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1051
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1051,
    'a1001051-c1d2-3456-bcde-100151000020',
    NULL, NULL, NULL, NULL,
    5,
    'admin-uuid-1051-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501148, 1051, 5, 'Demo Affiliation 1', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501149, 1051, 2, 'Coordinated Data Harmonization and Cross-Study Metadata Standardization for the RADx-UP Research Network', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501150, 1051, 10, 'Dr. Lawrence Griffiths', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501151, 1051, 11, 'lawrence.griffiths@radxcoord.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501152, 1051, 14, 'RADx-UP Data Coordination Center', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501153, 1051, 12, 'Wendy Nakamura', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501154, 1051, 13, 'wendy.nakamura@radxcoord.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501155, 1051, 67, 'OT2-OD040123', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501156, 1051, 16, 'Dr. Brenda Collins', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501157, 1051, 24, 'NIH OD', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501158, 1051, 24, 'NIH CC', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501159, 1051, 24, 'NLM', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501160, 1051, 24, 'NCATS', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501161, 1051, 100, 'OTA-OD-23-002', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501162, 1051, 6, '01/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501163, 1051, 7, '12/31/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501164, 1051, 82, 'Multimodal Surveillance', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501165, 1051, 82, 'Digital Health Applications', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501166, 1051, 20, 'Real-World Data', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501167, 1051, 20, 'Survey', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501168, 1051, 81, 'N/A', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501169, 1051, 21, 'data harmonization', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501170, 1051, 21, 'metadata standards', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501171, 1051, 21, 'cross-study', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501172, 1051, 21, 'FAIR principles', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501173, 1051, 21, 'interoperability', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501174, 1051, 22, 'Open Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501175, 1051, 102, 'Unknown', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501176, 1051, 35, 'Supported by NIH OD, NIH CC, NLM, and NCATS under grant OT2-OD040123.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501177, 1051, 3, 'This coordination center study provides centralized data harmonization, metadata standardization, and quality assurance services for the RADx Underserved Populations (RADx-UP) research network. The center develops and maintains common data elements, controlled vocabularies, and FAIR-compliant metadata schemas for cross-study data integration. Real-world data on variable mapping completeness, data quality metrics, and researcher satisfaction surveys inform iterative refinement of standards and tools. The study produces harmonized analysis-ready datasets, cross-network data dictionaries, and interoperability documentation enabling federated querying across RADx-UP studies.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501178, 1051, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501179, 1051, 18, '0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501180, 1051, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501181, 1051, 9, 'RADx-UP Data Coordination Center; RADx-UP Consortium Sites (85 studies); NIH RADx Program Office', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501182, 1051, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501183, 1051, 42, 'Other', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501184, 1051, 51, '03/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501185, 1051, 54, '07/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501186, 1051, 50, '1.2', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501187, 1051, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501188, 1051, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501189, 1051, 26, 'Supporting Documents', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501190, 1051, 26, 'Other', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501191, 1051, 46, 'Other', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501192, 1051, 60, 'Not-for-profit Organization', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501193, 1051, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501194, 1051, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501195, 1051, 70, 'Not-for-profit use only', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501196, 1051, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501197, 1051, 56, 'Not-for-profit Organization', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (501198, 1051, 57, 'COVID-19; data infrastructure; research coordination', 0, '2025-03-15 10:30:00', 5);

COMMIT;

-- Total study_property_value rows: 1198
