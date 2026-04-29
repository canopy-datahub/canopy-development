-- ============================================================
-- Synthetic Study Data - 10 More Studies (IDs 1022-1031)
-- PostgreSQL Insert Script for RADx Data Hub
-- ============================================================

BEGIN;

-- ============================================================
-- STUDY 1022
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1022,
    'd2e3f4a5-b6c7-8901-abcd-abc123456001',
    NULL, NULL, NULL, NULL,
    1,
    'admin-uuid-1022-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400001, 1022, 5, 'AFF-One', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400002, 1022, 2, 'Cognitive and Neuroimaging Outcomes Following SARS-CoV-2 Infection in Older Adults with Pre-Existing Neurodegenerative Conditions', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400003, 1022, 10, 'Dr. Eleanor Voss', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400004, 1022, 11, 'eleanor.voss@neuroaging.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400005, 1022, 14, 'Center for Neuroscience and Aging, Grand Valley University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400006, 1022, 12, 'Patrick Dolan', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400007, 1022, 13, 'patrick.dolan@neuroaging.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400008, 1022, 67, 'R01-AG078901', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400009, 1022, 16, 'Dr. Frederick Lam', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400010, 1022, 24, 'NIA', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400011, 1022, 24, 'NINDS', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400012, 1022, 100, 'RFA-AG-23-015', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400013, 1022, 6, '04/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400014, 1022, 7, '03/31/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400015, 1022, 82, 'Long COVID', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400016, 1022, 82, 'Mental Health', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400017, 1022, 82, 'Comorbidities', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400018, 1022, 20, 'Interview or Focus Group', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400019, 1022, 20, 'Disease Registry', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400020, 1022, 81, 'Older Adults or Elderly', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400021, 1022, 81, 'Adults', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400022, 1022, 21, 'neuroimaging', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400023, 1022, 21, 'cognitive decline', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400024, 1022, 21, 'neurodegeneration', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400025, 1022, 21, 'brain fog', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400026, 1022, 21, 'older adults', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400027, 1022, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400028, 1022, 22, 'Case-Control', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400029, 1022, 102, '251 - 500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400030, 1022, 35, 'Supported by NIA and NINDS under grant R01-AG078901.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400031, 1022, 3, 'This longitudinal case-control study examines cognitive trajectories and structural brain changes in older adults with pre-existing neurodegenerative conditions (mild cognitive impairment, early Alzheimer''s disease, Parkinson''s disease) who contracted SARS-CoV-2 compared to matched uninfected controls. Serial neuropsychological assessments and multimodal MRI (volumetric, diffusion tensor, and resting-state fMRI) are performed at baseline, 6, 12, and 24 months. The study tests whether COVID-19 accelerates neurodegenerative progression and identifies neuroimaging biomarkers of post-infectious cognitive vulnerability.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400032, 1022, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400033, 1022, 18, '350', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400034, 1022, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400035, 1022, 9, 'Grand Valley University Memory Clinic; Midwest Neurological Associates; Parkview Senior Neuroscience Center', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400036, 1022, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400037, 1022, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400038, 1022, 51, '04/10/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400039, 1022, 54, '10/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400040, 1022, 50, '210.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400041, 1022, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400042, 1022, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400043, 1022, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400044, 1022, 26, 'Cognitive', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400045, 1022, 26, 'Imaging', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400046, 1022, 26, 'Individual Phenotype', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400047, 1022, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400048, 1022, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400049, 1022, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400050, 1022, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400051, 1022, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400052, 1022, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400053, 1022, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400054, 1022, 57, 'COVID-19; Alzheimer''s disease; Parkinson''s disease; mild cognitive impairment', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1023
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1023,
    'e3f4a5b6-c7d8-9012-bcde-bcd234567002',
    NULL, NULL, NULL, NULL,
    2,
    'admin-uuid-1023-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400055, 1023, 5, 'AFF-Two', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400056, 1023, 2, 'Physical Activity, Wearable-Derived Biomarkers, and COVID-19 Recovery Trajectories Among College Athletes', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400057, 1023, 10, 'Dr. Marcus Bennett', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400058, 1023, 11, 'marcus.bennett@sportmed.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400059, 1023, 14, 'Department of Sports Medicine, Atlantic University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400060, 1023, 12, 'Chloe Sanderson', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400061, 1023, 13, 'chloe.sanderson@sportmed.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400062, 1023, 67, 'R21-HL167890', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400063, 1023, 16, 'Dr. Miriam Silver', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400064, 1023, 24, 'NHLBI', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400065, 1023, 24, 'NIAMS', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400066, 1023, 100, 'PA-23-110', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400067, 1023, 6, '08/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400068, 1023, 7, '07/31/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400069, 1023, 82, 'Health Behaviors', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400070, 1023, 82, 'Biosensor Technologies', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400071, 1023, 82, 'Long COVID', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400072, 1023, 20, 'Wearable', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400073, 1023, 20, 'Survey', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400074, 1023, 20, 'Real-World Data', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400075, 1023, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400076, 1023, 81, 'School Communities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400077, 1023, 21, 'physical activity', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400078, 1023, 21, 'wearable biomarkers', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400079, 1023, 21, 'recovery trajectory', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400080, 1023, 21, 'college athletes', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400081, 1023, 21, 'return to play', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400082, 1023, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400083, 1023, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400084, 1023, 102, '501 - 1000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400085, 1023, 35, 'Funded by NHLBI and NIAMS under grant R21-HL167890.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400086, 1023, 3, 'This longitudinal observational study tracks physical activity patterns, cardiopulmonary fitness, and wearable-derived physiological biomarkers in college athletes recovering from SARS-CoV-2 infection across 30 NCAA Division I programs. Continuous wearable data (heart rate variability, resting heart rate, sleep quality, training load) are collected before, during, and after infection. Serial cardiopulmonary exercise testing and echocardiography provide clinical validation. The study develops data-driven return-to-play protocols and identifies wearable-based predictors of prolonged recovery or cardiac complications.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400087, 1023, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400088, 1023, 18, '650', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400089, 1023, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400090, 1023, 9, 'Atlantic University Sports Medicine; Pacific Coast Athletic Health Consortium; Great Plains University Athletics (30 NCAA programs)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400091, 1023, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400092, 1023, 51, '05/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400093, 1023, 54, '09/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400094, 1023, 50, '35.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400095, 1023, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400096, 1023, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400097, 1023, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400098, 1023, 26, 'Physical Activity', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400099, 1023, 26, 'Biosensor', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400100, 1023, 26, 'Temporal', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400101, 1023, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400102, 1023, 60, 'Publication required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400103, 1023, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400104, 1023, 70, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400105, 1023, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400106, 1023, 57, 'COVID-19; myocarditis; post-exertional malaise', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1024
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1024,
    'f4a5b6c7-d8e9-0123-cdef-cde345678003',
    NULL, NULL, NULL, NULL,
    3,
    'admin-uuid-1024-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400107, 1024, 5, 'AFF-Three', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400108, 1024, 2, 'Family History, Genetic Susceptibility, and Intergenerational Transmission Patterns of SARS-CoV-2 in Multi-Generational Households', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400109, 1024, 10, 'Dr. Rita Kapoor', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400110, 1024, 11, 'rita.kapoor@famgenomics.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400111, 1024, 14, 'Family Genomics Research Center, Heartland University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400112, 1024, 12, 'Samuel Greene', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400113, 1024, 13, 'samuel.greene@famgenomics.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400114, 1024, 67, 'R01-HG013456', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400115, 1024, 16, 'Dr. Carolyn Drake', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400116, 1024, 24, 'NHGRI', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400117, 1024, 24, 'NIA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400118, 1024, 24, 'NICHD', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400119, 1024, 100, 'RFA-HG-22-012', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400120, 1024, 6, '01/15/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400121, 1024, 7, '01/14/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400122, 1024, 82, 'Variants', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400123, 1024, 82, 'Immune Responses', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400124, 1024, 82, 'Screening Testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400125, 1024, 20, 'Molecular Nucleic Acid or PCR Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400126, 1024, 20, 'Antigen Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400127, 1024, 20, 'Survey', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400128, 1024, 81, 'Children', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400129, 1024, 81, 'Older Adults or Elderly', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400130, 1024, 81, 'Asians', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400131, 1024, 81, 'Native Hawaiians or Other Pacific Islanders', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400132, 1024, 21, 'family history', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400133, 1024, 21, 'genetic susceptibility', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400134, 1024, 21, 'household transmission', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400135, 1024, 21, 'intergenerational', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400136, 1024, 21, 'HLA typing', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400137, 1024, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400138, 1024, 102, '1001 - 2000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400139, 1024, 35, 'Supported by NHGRI, NIA, and NICHD under grant R01-HG013456.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400140, 1024, 3, 'This longitudinal household cohort study investigates the role of shared genetic backgrounds and family history of immune-mediated diseases in SARS-CoV-2 transmission dynamics within multi-generational households. Enrolled families spanning at least three generations undergo HLA typing, whole genome sequencing, and serial serological testing alongside active symptom surveillance with rapid antigen and PCR testing. The study examines whether specific HLA alleles, innate immune gene variants, or family-level immune phenotypes influence secondary attack rates and disease concordance across generations.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400141, 1024, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400142, 1024, 18, '1500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400143, 1024, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400144, 1024, 9, 'Heartland University Family Health Center; Multigenerational Health Alliance (8 community clinics); Pacific Islander Community Health Network', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400145, 1024, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400146, 1024, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400147, 1024, 42, 'Sequence Read Archive (SRA)', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400148, 1024, 42, 'dbSNP', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400149, 1024, 51, '06/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400150, 1024, 54, '12/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400151, 1024, 50, '145.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400152, 1024, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400153, 1024, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400154, 1024, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400155, 1024, 26, 'Family History', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400156, 1024, 26, 'Clinical', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400157, 1024, 26, 'Individual Genotype', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400158, 1024, 26, 'Immunological', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400159, 1024, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400160, 1024, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400161, 1024, 29, 'Germline', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400162, 1024, 30, 'Whole Genome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400163, 1024, 30, 'Targeted Exome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400164, 1024, 28, 'Genotype calls derived from Sequence', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400165, 1024, 28, 'Array-derived Genotypes', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400166, 1024, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400167, 1024, 43, 'Association/Linkage Results', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400168, 1024, 44, 'SNP Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400169, 1024, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400170, 1024, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400171, 1024, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400172, 1024, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400173, 1024, 70, 'Publication required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400174, 1024, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400175, 1024, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400176, 1024, 57, 'COVID-19; HLA-associated disease susceptibility', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1025
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1025,
    'a5b6c7d8-e9f0-1234-defa-def456789004',
    NULL, NULL, NULL, NULL,
    4,
    'admin-uuid-1025-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400177, 1025, 5, 'AFF-Four', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400178, 1025, 2, 'Rapid Diagnostic Test Performance Across SARS-CoV-2 Variants: A Multi-Platform Comparative Verification Study', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400179, 1025, 10, 'Dr. Ingrid Svensson', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400180, 1025, 11, 'ingrid.svensson@dxvalidation.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400181, 1025, 14, 'Diagnostic Validation Consortium', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400182, 1025, 12, 'Omar Al-Farsi', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400183, 1025, 13, 'omar.alfarsi@dxvalidation.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400184, 1025, 67, 'U01-FD008901', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400185, 1025, 16, 'Dr. Philip Crane', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400186, 1025, 24, 'NIBIB', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400187, 1025, 24, 'NCATS', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400188, 1025, 100, 'RFA-FD-23-007', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400189, 1025, 6, '05/15/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400190, 1025, 7, '05/14/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400191, 1025, 82, 'Rapid Diagnostic Test (RDT)', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400192, 1025, 82, 'Diagnostic Testing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400193, 1025, 82, 'Variants', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400194, 1025, 82, 'Serological or Antibody Testing', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400195, 1025, 20, 'Antigen Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400196, 1025, 20, 'Molecular Nucleic Acid or PCR Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400197, 1025, 20, 'Antibody or Adaptive Immune Response Testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400198, 1025, 20, 'Unspecified COVID Testing Device', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400199, 1025, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400200, 1025, 81, 'Essential Workers', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400201, 1025, 81, 'Pregnant or Nursing Women', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400202, 1025, 21, 'rapid diagnostic test', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400203, 1025, 21, 'variant performance', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400204, 1025, 21, 'multi-platform', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400205, 1025, 21, 'device verification', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400206, 1025, 21, 'sensitivity', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400207, 1025, 22, 'Device Verification', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400208, 1025, 22, 'Cross-Sectional', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400209, 1025, 102, '2001 - 5000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400210, 1025, 35, 'Funded by NIBIB and NCATS under grant U01-FD008901.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400211, 1025, 3, 'This multi-platform device verification study evaluates the diagnostic performance of 12 commercially available rapid diagnostic tests — spanning lateral flow antigen, isothermal nucleic acid amplification, and rapid serological platforms — against a panel of SARS-CoV-2 variant specimens including Omicron sublineages and recombinant variants. Fresh clinical specimens and contrived samples with known viral loads are tested in parallel across platforms. The study provides variant-stratified sensitivity and specificity estimates at clinically relevant viral load thresholds and assesses the impact of specimen type, collection technique, and user experience on test accuracy.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400212, 1025, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400213, 1025, 18, '4500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400214, 1025, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400215, 1025, 9, 'Diagnostic Validation Consortium Central Lab; Regional Clinical Testing Sites (25 locations); Mobile Specimen Collection Units (10 routes)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400216, 1025, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400217, 1025, 42, 'dbGaP', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400218, 1025, 51, '07/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400219, 1025, 54, '12/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400220, 1025, 50, '18.5', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400221, 1025, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400222, 1025, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400223, 1025, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400224, 1025, 26, 'Sequencing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400225, 1025, 26, 'Genotyping', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400226, 1025, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400227, 1025, 46, 'Aggregate Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400228, 1025, 29, 'RNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400229, 1025, 30, 'Whole Genome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400230, 1025, 30, 'Targeted Genome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400231, 1025, 28, 'Genotype calls derived from Sequence', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400232, 1025, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400233, 1025, 60, 'Publication required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400234, 1025, 60, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400235, 1025, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400236, 1025, 70, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400237, 1025, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400238, 1025, 56, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400239, 1025, 57, 'COVID-19; SARS-CoV-2 Omicron sublineages', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1026
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1026,
    'b6c7d8e9-f0a1-2345-efab-efa567890005',
    NULL, NULL, NULL, NULL,
    5,
    'admin-uuid-1026-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400240, 1026, 5, 'Demo Affiliation 1', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400241, 1026, 2, 'Complementary and Integrative Health Approaches for Managing Post-COVID Fatigue and Pain: A Randomized Pragmatic Trial', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400242, 1026, 10, 'Dr. Yuki Tanaka', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400243, 1026, 11, 'yuki.tanaka@integrativehealth.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400244, 1026, 14, 'National Institute for Integrative Health Research', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400245, 1026, 12, 'Diane Crawford', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400246, 1026, 13, 'diane.crawford@integrativehealth.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400247, 1026, 67, 'R01-AT012345', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400248, 1026, 16, 'Dr. Beverly Jordan', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400249, 1026, 24, 'NCCIH', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400250, 1026, 24, 'NINR', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400251, 1026, 100, 'RFA-AT-23-003', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400252, 1026, 6, '09/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400253, 1026, 7, '08/31/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400254, 1026, 82, 'Long COVID', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400255, 1026, 82, 'Health Behaviors', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400256, 1026, 82, 'Community Outreach Programs', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400257, 1026, 20, 'Survey', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400258, 1026, 20, 'Wearable', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400259, 1026, 20, 'Smartphone', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400260, 1026, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400261, 1026, 81, 'Rural Communities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400262, 1026, 81, 'Racial or Ethnic Minorities', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400263, 1026, 21, 'integrative health', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400264, 1026, 21, 'post-COVID fatigue', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400265, 1026, 21, 'chronic pain', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400266, 1026, 21, 'acupuncture', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400267, 1026, 21, 'mind-body therapy', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400268, 1026, 22, 'Interventional or Clinical Trial', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400269, 1026, 102, '251 - 500', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400270, 1026, 35, 'Supported by NCCIH and NINR under grant R01-AT012345.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400271, 1026, 3, 'This pragmatic randomized controlled trial evaluates complementary and integrative health approaches — including acupuncture, mindfulness-based stress reduction, and guided movement therapy — for managing persistent fatigue and musculoskeletal pain in adults with Long COVID. Participants are randomized to an 8-week integrative care protocol plus usual care versus usual care alone. Patient-reported outcomes, wearable-measured activity and sleep patterns, and inflammatory biomarkers are assessed at baseline, 4, 8, and 24 weeks. The trial recruits through community health centers in rural and minority-serving settings to ensure equitable access to integrative therapies.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400272, 1026, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400273, 1026, 18, '320', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400274, 1026, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400275, 1026, 9, 'National Institute for Integrative Health Research; Mountain View Community Health Center; Prairie Wellness Cooperative', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400276, 1026, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400277, 1026, 51, '08/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400278, 1026, 54, '02/28/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400279, 1026, 50, '4.5', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400280, 1026, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400281, 1026, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400282, 1026, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400283, 1026, 26, 'Behavioral', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400284, 1026, 26, 'Physical Activity', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400285, 1026, 26, 'Questionnaire or Survey', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400286, 1026, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400287, 1026, 96, 'https://clinicaltrials.gov/ct2/show/NCT06789012', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400288, 1026, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400289, 1026, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400290, 1026, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400291, 1026, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400292, 1026, 57, 'COVID-19; Long COVID; chronic fatigue; musculoskeletal pain', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1027
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1027,
    'c7d8e9f0-a1b2-3456-fabc-fab678901006',
    NULL, NULL, NULL, NULL,
    1,
    'admin-uuid-1027-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400293, 1027, 5, 'AFF-One', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400294, 1027, 2, 'Microscopy-Guided Spatial Transcriptomics of SARS-CoV-2 Tropism in Post-Mortem Lung and Brain Tissue', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400295, 1027, 10, 'Dr. Stefan Müller', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400296, 1027, 11, 'stefan.mueller@pathresearch.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400297, 1027, 14, 'Division of Molecular Pathology, Summit University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400298, 1027, 12, 'Grace Adebayo', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400299, 1027, 13, 'grace.adebayo@pathresearch.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400300, 1027, 67, 'R01-AI190123', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400301, 1027, 16, 'Dr. Diane Patterson', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400302, 1027, 24, 'NIAID', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400303, 1027, 24, 'NIGMS', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400304, 1027, 24, 'NCI', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400305, 1027, 100, 'RFA-AI-24-005', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400306, 1027, 6, '02/01/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400307, 1027, 7, '01/31/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400308, 1027, 82, 'Next Generation Sequencing (NGS)', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400309, 1027, 82, 'Variants', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400310, 1027, 82, 'Immune Responses', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400311, 1027, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400312, 1027, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400313, 1027, 81, 'Older Adults or Elderly', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400314, 1027, 21, 'spatial transcriptomics', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400315, 1027, 21, 'microscopy', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400316, 1027, 21, 'SARS-CoV-2 tropism', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400317, 1027, 21, 'post-mortem', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400318, 1027, 21, 'lung pathology', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400319, 1027, 22, 'Observational', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400320, 1027, 102, '1 - 250', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400321, 1027, 35, 'Funded by NIAID, NIGMS, and NCI under grant R01-AI190123.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400322, 1027, 3, 'This observational study applies microscopy-guided spatial transcriptomics to characterize SARS-CoV-2 cellular tropism and the host tissue response in post-mortem lung, brain, and olfactory bulb specimens from individuals who died with or of COVID-19. Fresh-frozen autopsy tissues undergo high-resolution fluorescence microscopy to identify regions of viral replication, followed by spatially resolved RNA sequencing to map gene expression at single-cell resolution within the tissue context. The study defines cell type-specific transcriptional programs activated by viral infection and identifies spatial patterns of immune cell infiltration, fibrosis, and tissue damage across COVID-19 disease phenotypes.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400323, 1027, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400324, 1027, 18, '120', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400325, 1027, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400326, 1027, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400327, 1027, 42, 'GEO', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400328, 1027, 42, 'Sequence Read Archive (SRA)', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400329, 1027, 42, 'Array Express', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400330, 1027, 51, '09/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400331, 1027, 54, '03/30/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400332, 1027, 50, '750.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400333, 1027, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400334, 1027, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400335, 1027, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400336, 1027, 26, 'Sequencing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400337, 1027, 26, 'Microscopy', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400338, 1027, 26, 'Imaging', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400339, 1027, 26, 'Biologic Specimens', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400340, 1027, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400341, 1027, 29, 'RNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400342, 1027, 29, 'Single Cell', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400343, 1027, 29, 'Tumor/Natural', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400344, 1027, 30, 'Whole Transcriptome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400345, 1027, 30, 'Targeted Transcriptome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400346, 1027, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400347, 1027, 43, 'RNA Seq derived Expression', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400348, 1027, 43, 'Other', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400349, 1027, 44, 'Expression Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400350, 1027, 60, 'Collaboration required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400351, 1027, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400352, 1027, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400353, 1027, 70, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400354, 1027, 70, 'Publication required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400355, 1027, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400356, 1027, 56, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400357, 1027, 57, 'COVID-19; ARDS; viral encephalitis; pulmonary fibrosis', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1028
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1028,
    'd8e9f0a1-b2c3-4567-abcd-abc789012007',
    NULL, NULL, NULL, NULL,
    2,
    'admin-uuid-1028-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400358, 1028, 5, 'AFF-Two', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400359, 1028, 2, 'Eye Health Surveillance and Ophthalmic Manifestations of SARS-CoV-2 in Pediatric and Adult Populations', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400360, 1028, 10, 'Dr. Amara Osei', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400361, 1028, 11, 'amara.osei@eyeresearch.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400362, 1028, 14, 'National Eye Health Research Consortium', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400363, 1028, 12, 'Victor Liang', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400364, 1028, 13, 'victor.liang@eyeresearch.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400365, 1028, 67, 'R21-EY034567', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400366, 1028, 16, 'Dr. Norman Fields', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400367, 1028, 24, 'NEI', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400368, 1028, 24, 'NICHD', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400369, 1028, 100, 'PA-22-250', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400370, 1028, 6, '07/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400371, 1028, 7, '06/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400372, 1028, 82, 'Disease Surveillance', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400373, 1028, 82, 'Comorbidities', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400374, 1028, 82, 'Screening Testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400375, 1028, 20, 'Disease Registry', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400376, 1028, 20, 'Real-World Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400377, 1028, 20, 'Interview or Focus Group', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400378, 1028, 81, 'Children', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400379, 1028, 81, 'Adults', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400380, 1028, 81, 'Hispanics or Latinos', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400381, 1028, 21, 'ophthalmic manifestations', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400382, 1028, 21, 'conjunctivitis', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400383, 1028, 21, 'eye health', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400384, 1028, 21, 'pediatric', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400385, 1028, 21, 'ocular COVID', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400386, 1028, 22, 'Cross-Sectional', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400387, 1028, 22, 'Observational', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400388, 1028, 102, '1001 - 2000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400389, 1028, 35, 'Supported by NEI and NICHD under grant R21-EY034567.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400390, 1028, 3, 'This cross-sectional observational study characterizes the spectrum and prevalence of ophthalmic manifestations associated with SARS-CoV-2 infection in both pediatric and adult populations. Leveraging electronic health records and ophthalmology disease registries from a large integrated health system, the study identifies patients with confirmed COVID-19 and concurrent or subsequent ocular diagnoses including conjunctivitis, uveitis, optic neuritis, and retinal vascular events. Prospective ophthalmic examinations are conducted on a subset of Long COVID patients reporting persistent visual symptoms. Interview-based assessments capture patient-reported visual function and quality of life.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400391, 1028, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400392, 1028, 18, '1800', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400393, 1028, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400394, 1028, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400395, 1028, 51, '04/20/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400396, 1028, 54, '08/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400397, 1028, 50, '6.3', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400398, 1028, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400399, 1028, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400400, 1028, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400401, 1028, 26, 'Electronic Medical Records', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400402, 1028, 26, 'Individual Phenotype', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400403, 1028, 26, 'Imaging', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400404, 1028, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400405, 1028, 46, 'Aggregate Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400406, 1028, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400407, 1028, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400408, 1028, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400409, 1028, 57, 'COVID-19; conjunctivitis; uveitis; optic neuritis', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1029
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1029,
    'e9f0a1b2-c3d4-5678-bcde-bcd890123008',
    NULL, NULL, NULL, NULL,
    3,
    'admin-uuid-1029-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400410, 1029, 5, 'AFF-Three', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400411, 1029, 2, 'Dental and Oral Health Impacts of SARS-CoV-2 Infection: Salivary Diagnostics, Oral Microbiome, and Periodontal Outcomes', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400412, 1029, 10, 'Dr. Anthony DiMarco', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400413, 1029, 11, 'anthony.dimarco@oralresearch.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400414, 1029, 14, 'School of Dental Medicine, Central University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400415, 1029, 12, 'Mei-Ling Huang', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400416, 1029, 13, 'meiling.huang@oralresearch.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400417, 1029, 67, 'R01-DE031234', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400418, 1029, 16, 'Dr. Ruth Nakamura', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400419, 1029, 24, 'NIDCR', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400420, 1029, 24, 'NIAID', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400421, 1029, 100, 'RFA-DE-23-002', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400422, 1029, 6, '03/15/2024', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400423, 1029, 7, '03/14/2027', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400424, 1029, 82, 'Novel Biosensing or VOC', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400425, 1029, 82, 'Diagnostic Testing', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400426, 1029, 82, 'Long COVID', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400427, 1029, 20, 'Chemosensory Testing Device', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400428, 1029, 20, 'Biobank Samples', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400429, 1029, 20, 'Survey', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400430, 1029, 81, 'Adults', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400431, 1029, 81, 'Immigrants', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400432, 1029, 81, 'Lower Socioeconomic Status (SES) Populations', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400433, 1029, 21, 'salivary diagnostics', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400434, 1029, 21, 'oral microbiome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400435, 1029, 21, 'periodontal disease', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400436, 1029, 21, 'oral COVID', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400437, 1029, 21, 'saliva testing', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400438, 1029, 22, 'Longitudinal Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400439, 1029, 22, 'Case-Control', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400440, 1029, 102, '501 - 1000', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400441, 1029, 35, 'Funded by NIDCR and NIAID under grant R01-DE031234.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400442, 1029, 3, 'This longitudinal case-control study investigates the impact of SARS-CoV-2 infection on oral health outcomes and evaluates saliva-based diagnostics as a non-invasive testing alternative. COVID-19 cases and matched controls undergo comprehensive periodontal examinations, salivary biomarker profiling (viral load, inflammatory cytokines, IgA), and oral microbiome characterization via 16S rRNA and shotgun metagenomic sequencing. Longitudinal follow-up assesses whether COVID-19 accelerates periodontal disease progression and alters the oral microbial ecosystem. The study also validates a novel salivary VOC biosensor for point-of-care COVID-19 screening in dental clinic settings.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400443, 1029, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400444, 1029, 18, '700', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400445, 1029, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400446, 1029, 9, 'Central University Dental Clinic; Community Oral Health Alliance (5 clinics); Immigrant Health Services Dental Program', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400447, 1029, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400448, 1029, 42, 'Sequence Read Archive (SRA)', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400449, 1029, 42, 'ENA', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400450, 1029, 51, '07/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400451, 1029, 54, '01/30/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400452, 1029, 50, '65.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400453, 1029, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400454, 1029, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400455, 1029, 26, 'Clinical', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400456, 1029, 26, 'Metagenomic', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400457, 1029, 26, 'Biologic Specimens', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400458, 1029, 26, 'Chemosensor', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400459, 1029, 46, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400460, 1029, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400461, 1029, 29, 'RNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400462, 1029, 29, 'Microbiome', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400463, 1029, 30, '16S rRNA', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400464, 1029, 30, 'Whole Genome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400465, 1029, 30, 'Sanger', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400466, 1029, 28, 'Other', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400467, 1029, 27, 'Individual-level Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400468, 1029, 43, 'RNA Seq derived Expression', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400469, 1029, 60, 'IRB approval required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400470, 1029, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400471, 1029, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400472, 1029, 70, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400473, 1029, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400474, 1029, 56, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400475, 1029, 56, 'Publication required', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400476, 1029, 57, 'COVID-19; periodontal disease; oral microbiome dysbiosis', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1030
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1030,
    'f0a1b2c3-d4e5-6789-cdef-cde901234009',
    NULL, NULL, NULL, NULL,
    4,
    'admin-uuid-1030-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400477, 1030, 5, 'AFF-Four', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400478, 1030, 2, 'Non-Human Primate Model of SARS-CoV-2 Reinfection: Genotypic and Phenotypic Determinants of Immune Escape', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400479, 1030, 10, 'Dr. Raymond Cole', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400480, 1030, 11, 'raymond.cole@primateresearch.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400481, 1030, 14, 'Primate Research Center, Southeastern University', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400482, 1030, 12, 'Elena Petrov', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400483, 1030, 13, 'elena.petrov@primateresearch.edu', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400484, 1030, 67, 'R01-AI200345', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400485, 1030, 16, 'Dr. Martha Wallace', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400486, 1030, 24, 'NIAID', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400487, 1030, 24, 'NIGMS', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400488, 1030, 100, 'RFA-AI-23-055', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400489, 1030, 6, '10/01/2023', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400490, 1030, 7, '09/30/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400491, 1030, 82, 'Immune Responses', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400492, 1030, 82, 'Variants', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400493, 1030, 82, 'Virological Testing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400494, 1030, 20, 'Biobank Samples', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400495, 1030, 20, 'Molecular Nucleic Acid or PCR Testing Device', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400496, 1030, 81, 'N/A', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400497, 1030, 21, 'non-human primate', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400498, 1030, 21, 'reinfection', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400499, 1030, 21, 'immune escape', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400500, 1030, 21, 'variant evolution', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400501, 1030, 21, 'animal model', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400502, 1030, 22, 'Interventional or Clinical Trial', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400503, 1030, 102, '1 - 250', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400504, 1030, 35, 'Supported by NIAID and NIGMS under grant R01-AI200345.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400505, 1030, 3, 'This controlled non-human primate study investigates genotypic and phenotypic determinants of SARS-CoV-2 immune escape during sequential reinfection with antigenically distinct variants. Rhesus macaques previously infected with ancestral SARS-CoV-2 are challenged with Omicron sublineages at defined intervals. Serial sampling of nasal, oropharyngeal, and bronchoalveolar specimens supports deep viral sequencing to track within-host viral evolution, while comprehensive immune profiling (neutralizing antibodies, T-cell responses, mucosal immunity) characterizes correlates of protection or susceptibility. The study provides a controlled model for understanding how prior immunity shapes reinfection dynamics.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400506, 1030, 69, 'true', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400507, 1030, 18, '48', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400508, 1030, 8, 'No', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400509, 1030, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400510, 1030, 42, 'Sequence Read Archive (SRA)', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400511, 1030, 42, 'GenBank', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400512, 1030, 42, 'Trace Archive', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400513, 1030, 51, '10/01/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400514, 1030, 54, '04/01/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400515, 1030, 50, '280.0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400516, 1030, 49, 'Non-Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400517, 1030, 47, 'Prospective Sample', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400518, 1030, 26, 'Genomic', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400519, 1030, 26, 'Immunological', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400520, 1030, 26, 'Sequencing', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400521, 1030, 26, 'Biologic Specimens', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400522, 1030, 46, 'Non-human Data', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400523, 1030, 29, 'DNA', 0, '2025-03-15 10:30:00', 5);  -- Sample Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400524, 1030, 29, 'RNA', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400525, 1030, 29, 'From Repository [free text]', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400526, 1030, 30, 'Whole Genome', 0, '2025-03-15 10:30:00', 5);  -- Sequencing
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400527, 1030, 30, 'Whole Exome', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400528, 1030, 30, 'Targeted Genome', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400529, 1030, 30, 'Epigenomic Marks', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400530, 1030, 28, 'Non-human data', 0, '2025-03-15 10:30:00', 5);  -- Genotypes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400531, 1030, 28, 'Genotype calls derived from Sequence', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400532, 1030, 27, 'Non-human Data', 0, '2025-03-15 10:30:00', 5);  -- Genomic Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400533, 1030, 43, 'Association/Linkage Results', 0, '2025-03-15 10:30:00', 5);  -- Genomic Analyses
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400534, 1030, 43, 'RNA Seq derived Expression', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400535, 1030, 44, 'SNP Array', 0, '2025-03-15 10:30:00', 5);  -- Genomic Array Data
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400536, 1030, 60, 'Collaboration required', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400537, 1030, 60, 'IRB approval required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400538, 1030, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400539, 1030, 56, 'Collaboration required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400540, 1030, 57, 'COVID-19; SARS-CoV-2 reinfection; immune escape', 0, '2025-03-15 10:30:00', 5);


-- ============================================================
-- STUDY 1031
-- ============================================================

INSERT INTO public.study (
    id, uuid, private_key_url, public_key_url, file_name, file_url,
    center_id, center_admin_uuid, status_id, created_at, created_by, modified_at, modified_by
) VALUES (
    1031,
    'a1b2c3d4-e5f6-7890-defa-def012345010',
    NULL, NULL, NULL, NULL,
    5,
    'admin-uuid-1031-0001-000000000001',
    27,
    '2025-03-15 10:30:00',
    5,
    NULL, NULL
);

INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400541, 1031, 5, 'Demo Affiliation 1', 0, '2025-03-15 10:30:00', 5);  -- Center
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400542, 1031, 2, 'Supporting Documents Repository and Standardized Protocol Library for RADx COVID-19 Testing Research Network', 0, '2025-03-15 10:30:00', 5);  -- Title
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400543, 1031, 10, 'Dr. Joan Whitaker', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400544, 1031, 11, 'joan.whitaker@radxnetwork.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400545, 1031, 14, 'RADx Coordination Center', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400546, 1031, 12, 'Terrence Marsh', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400547, 1031, 13, 'terrence.marsh@radxnetwork.org', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400548, 1031, 67, 'OT2-OD038901', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400549, 1031, 16, 'Dr. Harold Pierce', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400550, 1031, 24, 'NIH OD', 0, '2025-03-15 10:30:00', 5);  -- NIH Institutes
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400551, 1031, 24, 'NIH CC', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400552, 1031, 24, 'NLM', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400553, 1031, 100, 'OTA-OD-22-001', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400554, 1031, 6, '01/01/2022', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400555, 1031, 7, '12/31/2026', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400556, 1031, 82, 'Screening Testing', 0, '2025-03-15 10:30:00', 5);  -- Topics
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400557, 1031, 82, 'Medical Device or Tool Development', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400558, 1031, 82, 'Multimodal Surveillance', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400559, 1031, 20, 'Survey', 0, '2025-03-15 10:30:00', 5);  -- Collection Methods
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400560, 1031, 20, 'Real-World Data', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400561, 1031, 81, 'N/A', 0, '2025-03-15 10:30:00', 5);  -- Population Focus
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400562, 1031, 21, 'supporting documents', 0, '2025-03-15 10:30:00', 5);  -- Keywords
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400563, 1031, 21, 'standardized protocols', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400564, 1031, 21, 'data harmonization', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400565, 1031, 21, 'research coordination', 3, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400566, 1031, 21, 'metadata', 4, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400567, 1031, 22, 'Open Cohort', 0, '2025-03-15 10:30:00', 5);  -- Study Design
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400568, 1031, 102, 'Unknown', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400569, 1031, 35, 'Supported by NIH OD, NIH CC, and NLM under grant OT2-OD038901.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400570, 1031, 3, 'This coordinating center study maintains and curates a comprehensive repository of supporting documents, standardized protocols, data dictionaries, and harmonized metadata templates for the RADx COVID-19 testing research network. The repository encompasses informed consent templates, IRB protocol templates, specimen collection SOPs, device validation frameworks, data formatting guides, and cross-study variable mapping documentation. Real-world data on protocol adoption and survey-based assessments of researcher needs inform iterative improvements to the resource library. The study ensures data interoperability and methodological consistency across the distributed RADx research portfolio.', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400571, 1031, 69, 'false', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400572, 1031, 18, '0', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400573, 1031, 8, 'Yes', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400574, 1031, 9, 'RADx Coordination Center; RADx-rad Program Office; RADx-UP Consortium Hub; RADx-Tech Program Office', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400575, 1031, 42, 'RADx Data Hub', 0, '2025-03-15 10:30:00', 5);  -- Repositories
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400576, 1031, 42, 'Other', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400577, 1031, 51, '03/15/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400578, 1031, 54, '06/30/2025', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400579, 1031, 50, '0.8', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400580, 1031, 49, 'Human', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400581, 1031, 47, 'Existing (Legacy)', 0, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400582, 1031, 26, 'Supporting Documents', 0, '2025-03-15 10:30:00', 5);  -- Data Types
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400583, 1031, 26, 'Questionnaire or Survey', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400584, 1031, 26, 'Other', 2, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400585, 1031, 46, 'Other', 0, '2025-03-15 10:30:00', 5);  -- Phenotype
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400586, 1031, 60, 'Not-for-profit Organization', 0, '2025-03-15 10:30:00', 5);  -- General Research Use
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400587, 1031, 60, 'Publication required', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400588, 1031, 70, 'Health or Biomedical Purpose', 0, '2025-03-15 10:30:00', 5);  -- Health/Biomed
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400589, 1031, 70, 'Not-for-profit use only', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400590, 1031, 56, 'Disease-Specific for COVID-19', 0, '2025-03-15 10:30:00', 5);  -- Disease Research
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400591, 1031, 56, 'Not-for-profit Organization', 1, '2025-03-15 10:30:00', 5);
INSERT INTO public.study_property_value (id, study_id, entity_property_id, property_value, value_index, created_at, created_by)
VALUES (400592, 1031, 57, 'COVID-19; research infrastructure', 0, '2025-03-15 10:30:00', 5);

COMMIT;

-- Total study_property_value rows: 592
