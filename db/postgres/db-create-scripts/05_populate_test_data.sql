-- Create study
INSERT INTO study (
    id,
    uuid,
    status_id,
    private_key_url,
    public_key_url,
    file_name,
    file_url,
    center_admin_uuid,
    center_id,
    created_at,
    created_by,
    modified_at,
    modified_by
) VALUES
(1,
 '550e8400-e29b-41d4-a716-446655440000',  -- uuid
 27,                                        -- status_id (Approved)
 'https://example.com/private/study1.key',  -- private_key_url
 'https://example.com/public/study1.pub',   -- public_key_url
 'RADx UP study 1',                    -- file_name
 'https://example.com/files/study1.json',   -- file_url
 'admin-uuid-1',                            -- center_admin_uuid
 1,                                         -- center_id (RADx-UP)
 CURRENT_TIMESTAMP,                         -- created_at
 9999,                                      -- created_by
 CURRENT_TIMESTAMP,                         -- modified_at
 9999                                       -- modified_by
),
(2,
 '550e8400-e29b-41d4-a716-446655440001',  -- uuid
  27,                                        -- status_id (Approved)
 'https://example.com/private/study2.key',  -- private_key_url
 'https://example.com/public/study2.pub',   -- public_key_url
 'RADx-rad study 1',                    -- file_name
 'https://example.com/files/study2.json',   -- file_url
 'admin-uuid-2',                            -- center_admin_uuid
 2,                                         -- center_id (RADx-rad)
 CURRENT_TIMESTAMP,                         -- created_at
 9999,                                      -- created_by
 CURRENT_TIMESTAMP,                         -- modified_at
 9999                                       -- modified_by
);

-- Create Institution
INSERT INTO institution (
    id, name, status_id, institution_type_id, is_for_profit, ror_id,
    country_id, state_id, province_region, created_by
) VALUES
-- Record 1: Stanford University
(
  1,                              -- id
  'Stanford University',          -- name
  23,                             -- status_id
  10,                             -- institution_type_id (e.g., University)
  false,                          -- is_for_profit
  'https://ror.org/00f54p054',    -- ror_id
  1,                              -- country_id (e.g., USA)
  5,                              -- state_id (e.g., California)
  NULL,                           -- province_region
  1                               -- created_by
),
-- Record 2: Harvard Medical School
(
  2,                              -- id
  'Harvard Medical School',       -- name
  23,                             -- status_id
  10,                             -- institution_type_id
  false,                          -- is_for_profit
  'https://ror.org/03vek6s52',    -- ror_id
  1,                              -- country_id
  22,                             -- state_id (e.g., Massachusetts)
  NULL,                           -- province_region
  1                               -- created_by
),
-- Record 3: NIH
(
  3,                              -- id
  'NIH',                          -- name
  23,                             -- status_id
  5,                              -- institution_type_id (e.g., Government agency)
  false,                          -- is_for_profit
  'https://ror.org/01cwqze88',    -- ror_id
  1,                              -- country_id
  21,                             -- state_id (e.g., Maryland)
  NULL,                           -- province_region
  1                               -- created_by
),
-- Record 4: Mayo Clinic
(
  4,                              -- id
  'Mayo Clinic',                  -- name
  23,                             -- status_id
  8,                              -- institution_type_id (e.g., Healthcare organization)
  false,                          -- is_for_profit
  'https://ror.org/03cpe8v73',    -- ror_id
  1,                              -- country_id
  24,                             -- state_id (e.g., Minnesota)
  NULL,                           -- province_region
  1                               -- created_by
);

-- Create users
INSERT INTO users (
  id,
  uuid,
  first_name,
  middle_initial,
  last_name,
  email_address,
  orcid_id,
  job_title,
  institution_id,
  researcher_level_id,
  status_id,
  internal_user,
  accept_terms,
  last_dua_date,
  last_login_at,
  sftp_path,
  created_at,
  modified_at,
  center_id
)
VALUES
-- Record 1
(
  1,                                          -- id
  '123e4567-e89b-12d3-a456-426614174000',     -- uuid
  'Alice',                                    -- first_name
  'M',                                        -- middle_initial
  'Smith',                                    -- last_name
  'alice.smith@example.edu',                  -- email_address
  '0000-0001-2345-6789',                      -- orcid_id
  'Associate Professor',                      -- job_title
  1,                                          -- institution_id
  5,                                          -- researcher_level_id
  1,                                          -- status_id
  true,                                       -- internal_user
  true,                                       -- accept_terms
  '2024-06-01',                               -- last_dua_date
  '2025-07-07 09:15:00',                      -- last_login_at
  NULL,                                       -- sftp_path
  CURRENT_TIMESTAMP,                          -- created_at
  NULL,                                       -- modified_at
  1                                           -- center_id
),
-- Record 2
(
  2,                                          -- id
  '223e4567-e89b-12d3-a456-426614174001',     -- uuid
  'Bob',                                      -- first_name
  NULL,                                       -- middle_initial
  'Johnson',                                  -- last_name
  'bob.johnson@example.edu',                  -- email_address
  NULL,                                       -- orcid_id
  'Postdoctoral Fellow',                      -- job_title
  2,                                          -- institution_id
  3,                                          -- researcher_level_id
  1,                                          -- status_id
  false,                                      -- internal_user
  true,                                       -- accept_terms
  NULL,                                       -- last_dua_date
  NULL,                                       -- last_login_at
  NULL,                                       -- sftp_path
  CURRENT_TIMESTAMP,                          -- created_at
  NULL,                                       -- modified_at
  1                                           -- center_id
);


-- Create data submissions
INSERT INTO data_submission (id, study_id, submitter_user_id, description, step_id, is_validated, status_id, date_submitted, date_approved, created_at, created_by) VALUES
(1, 1, 1, 'Initial submission', 5, true, 10, CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE - INTERVAL '25 days', CURRENT_TIMESTAMP, 9999),
(2, 2, 2, 'Initial submission', 5, true, 10, CURRENT_DATE - INTERVAL '20 days', CURRENT_DATE - INTERVAL '15 days', CURRENT_TIMESTAMP, 9999);

-- Create files stored in S3
INSERT INTO s3_file (
  id,
  file_name,
  file_type_id,
  file_path
) VALUES
-- Study 1 - Version 1
(1,  'dataset1.csv',   3, 'uploads/dataset1.csv'),   -- Main dataset
(2,  'dict1.csv',      3, 'uploads/dict1.csv'),      -- Dictionary
(3,  'meta1.json',     2, 'uploads/meta1.json'),     -- Metadata

-- Study 2 - Version 1
(4,  'dataset2.csv',   3, 'uploads/dataset2.csv'),   -- Main dataset
(5,  'dict2.csv',      3, 'uploads/dict2.csv'),      -- Dictionary
(6,  'meta2.json',     2, 'uploads/meta2.json'),     -- Metadata

-- Study 1 - Version 2
(7,  'dataset1.csv',   3, 'uploads/dataset1.csv'),   -- Updated dataset
(8,  'dict1.csv',      3, 'uploads/dict1.csv'),      -- Updated dictionary
(9,  'meta1.json',     2, 'uploads/meta1.json');     -- Updated metadata

-- Create data files with different versions
INSERT INTO data_file (
    id,
    submission_id,
    source_file_name,
    normalized_file_name,
    version_no,
    is_current_version,
    original_data_file_id,
    file_category_id,
    file_size,
    pii_phi,
    status_id,
    S3_file_id,
    approval_date,
    created_at,
    created_by,
    dictionary_file_id,
    metadata_file_id
) VALUES

-- Study 1: Initial version
(
  1,                      -- id
  1,                      -- submission_id
  'dataset1.csv',         -- source_file_name
  'dataset1_v1.csv',      -- normalized_file_name
  '1',                    -- version_no
  false,                  -- is_current_version
  1,                      -- original_data_file_id (points to itself)
  3,                      -- file_category_id (main dataset)
  1024,                   -- file_size (in bytes)
  false,                  -- pii_phi
  10,                     -- status_id
  1,                      -- S3_file_id
  CURRENT_DATE - INTERVAL '25 days',  -- approval_date
  CURRENT_TIMESTAMP,      -- created_at
  9999,                   -- created_by
  5,                      -- dictionary_file_id (dict1.csv)
  6                       -- metadata_file_id (meta1.json)
),

(
  5,                      -- id
  1,                      -- submission_id
  'dict1.csv',            -- source_file_name
  'dict1_v1.csv',         -- normalized_file_name
  '1',                    -- version_no
  false,                  -- is_current_version
  5,                      -- original_data_file_id (points to itself)
  3,                      -- file_category_id (dictionary)
  512,                    -- file_size
  false,                  -- pii_phi
  10,                     -- status_id
  2,                      -- S3_file_id
  CURRENT_DATE - INTERVAL '25 days',  -- approval_date
  CURRENT_TIMESTAMP,      -- created_at
  9999,                   -- created_by
  null,                   -- dictionary_file_id
  null                    -- metadata_file_id
),

(
  6,                      -- id
  1,                      -- submission_id
  'meta1.json',           -- source_file_name
  'meta1_v1.json',        -- normalized_file_name
  '1',                    -- version_no
  false,                  -- is_current_version
  6,                      -- original_data_file_id
  2,                      -- file_category_id (metadata)
  768,                    -- file_size
  false,                  -- pii_phi
  10,                     -- status_id
  3,                      -- S3_file_id
  CURRENT_DATE - INTERVAL '25 days',  -- approval_date
  CURRENT_TIMESTAMP,      -- created_at
  9999,                   -- created_by
  null,                   -- dictionary_file_id
  null                    -- metadata_file_id
),

-- Study 2: Initial version
(
  7,                      -- id
  2,                      -- submission_id
  'dataset2.csv',         -- source_file_name
  'dataset2_v1.csv',      -- normalized_file_name
  '1',                    -- version_no
  true,                   -- is_current_version
  7,                      -- original_data_file_id (points to itself)
  3,                      -- file_category_id (main dataset)
  2048,                   -- file_size
  false,                  -- pii_phi
  10,                     -- status_id
  4,                      -- S3_file_id
  CURRENT_DATE - INTERVAL '15 days',  -- approval_date
  CURRENT_TIMESTAMP,      -- created_at
  9999,                   -- created_by
  11,                     -- dictionary_file_id (dict2.csv)
  12                      -- metadata_file_id (meta2.json)
),

(
  11,                     -- id
  2,                      -- submission_id
  'dict2.csv',            -- source_file_name
  'dict2_v1.csv',         -- normalized_file_name
  '1',                    -- version_no
  true,                   -- is_current_version
  11,                     -- original_data_file_id
  3,                      -- file_category_id (dictionary)
  1024,                   -- file_size
  false,                  -- pii_phi
  10,                     -- status_id
  5,                      -- S3_file_id
  CURRENT_DATE - INTERVAL '15 days',  -- approval_date
  CURRENT_TIMESTAMP,      -- created_at
  9999,                   -- created_by
  null,                   -- dictionary_file_id
  null                    -- metadata_file_id
),

(
  12,                     -- id
  2,                      -- submission_id
  'meta2.json',           -- source_file_name
  'meta2_v1.json',        -- normalized_file_name
  '1',                    -- version_no
  true,                   -- is_current_version
  12,                     -- original_data_file_id
  2,                      -- file_category_id (metadata)
  1536,                   -- file_size
  false,                  -- pii_phi
  10,                     -- status_id
  6,                      -- S3_file_id
  CURRENT_DATE - INTERVAL '15 days',  -- approval_date
  CURRENT_TIMESTAMP,      -- created_at
  9999,                   -- created_by
  null,                   -- dictionary_file_id
  null                    -- metadata_file_id
),

-- Study 1: Version 2 update
(
  13,                     -- id
  1,                      -- submission_id
  'dataset1.csv',         -- source_file_name
  'dataset1_v2.csv',      -- normalized_file_name
  '2',                    -- version_no
  true,                   -- is_current_version
  1,                      -- original_data_file_id (points to v1)
  3,                      -- file_category_id (main dataset)
  1536,                   -- file_size
  false,                  -- pii_phi
  10,                     -- status_id
  7,                      -- S3_file_id
  CURRENT_DATE - INTERVAL '20 days',  -- approval_date
  CURRENT_TIMESTAMP,      -- created_at
  9999,                   -- created_by
  14,                     -- dictionary_file_id (dict1 v2)
  15                      -- metadata_file_id (meta1 v2)
),

(
  14,                     -- id
  1,                      -- submission_id
  'dict1.csv',            -- source_file_name
  'dict1_v2.csv',         -- normalized_file_name
  '2',                    -- version_no
  true,                   -- is_current_version
  5,                      -- original_data_file_id (v1 of dict1)
  3,                      -- file_category_id (dictionary)
  768,                    -- file_size
  false,                  -- pii_phi
  10,                     -- status_id
  8,                      -- S3_file_id
  CURRENT_DATE - INTERVAL '20 days',  -- approval_date
  CURRENT_TIMESTAMP,      -- created_at
  9999,                   -- created_by
  null,                   -- dictionary_file_id
  null                    -- metadata_file_id
),

(
  15,                     -- id
  1,                      -- submission_id
  'meta1.json',           -- source_file_name
  'meta1_v2.json',        -- normalized_file_name
  '2',                    -- version_no
  true,                   -- is_current_version
  6,                      -- original_data_file_id (v1 of meta1)
  2,                      -- file_category_id (metadata)
  1024,                   -- file_size
  false,                  -- pii_phi
  10,                     -- status_id
  9,                      -- S3_file_id
  CURRENT_DATE - INTERVAL '20 days',  -- approval_date
  CURRENT_TIMESTAMP,      -- created_at
  9999,                   -- created_by
  null,                   -- dictionary_file_id
  null                    -- metadata_file_id
);

-- Create study document
INSERT INTO study_document (
    id,
    study_id,
    document_name,
    document_type_id,  -- This references lkup_data_file_category.id
    document_size,
    s3_file_id,
    display_order
) VALUES
-- Study 1 Documents
(1, 1, 'Study Protocol', 3, 4096, 1, 1),           -- Protocol (category_id: 4)
(2, 1, 'Consent Form', 4, 2048, 2, 2),             -- Consent Form (category_id: 5)
(3, 1, 'Study Documentation', 2, 3072, 3, 3),      -- Documentation (category_id: 6)
-- Study 2 Documents
(4, 2, 'Study Protocol', 3, 5120, 6, 1),           -- Protocol (category_id: 4)
(5, 2, 'Consent Form', 4, 3072, 7, 2),             -- Consent Form (category_id: 5)
(6, 2, 'Study Documentation', 2, 4096, 8, 3);      -- Documentation (category_id: 6)

------------------------- Properties related ----------------------------------
-- Create study property values for two studies
INSERT INTO study_property_value (
  id,
  study_id,
  entity_property_id,
  property_value
) VALUES
-- Study 1 properties
(1, 1, 22, 'Clinical Trial'),
(2, 1, 81, 'Adults'),
(3, 1, 24, 'NCATS'),
(4, 1, 205, 'A comprehensive study of COVID-19 testing in adult populations'),
(5, 1, 2, 'COVID-19 Vaccine Trial Phase 3'),
(6, 1, 76, 'Yes'),
(13, 1, 5, 'RADx-UP'),

-- Study 2 properties
(7, 2, 22, 'Observational'),
(8, 2, 81, 'Children'),
(9, 2, 24, 'NCI'),
(10, 1, 205, 'Latinos are among the most heavily impacted communities by the COVID-19 pandemic in the US, with more than 3 times higher infection rate than non-Hispanic whites. To address this disparity, this team of investigators and community partners established a multi-pronged approach that leveraged the skill set of trusted bilingual/bicultural peer navigators (or promotoras) to address social determinants of health (SDOH) that create barriers to testing (such as lack of insurance, immigration status, stigmatization or loss of job/ income), and to expand access to free COVID-19 testing in community settings.'),
(11, 2, 2, 'A Community-Led Approach to Enhance COVID-19 Testing Among Vulnerable Latinos'),
(12, 2, 76, 'Yes'),
(14, 2, 5, 'RADx-rad');


----------------------------------- News and Events related --------------------------------

-- Create news entries
INSERT INTO news (id, title, slug, type_id, description, start_date, expiration_date, created_at) VALUES
-- General News
(1, 'Unlock the Power of the RADx Data Hub with Curated YouTube Playlists', 'youtube-playlist',
 2, -- type_id for general news
 'Are you ready to harness the full potential of the RADx Data Hub? The RADx Data Hub Partners curated multiple YouTube playlists to guide users through this powerful platform.',
 CURRENT_DATE - INTERVAL '5 days',
 CURRENT_DATE + INTERVAL '250 days',
 CURRENT_TIMESTAMP),

(2, 'NIH RADx Data Hub announces major functionality and design upgrades', 'major-upgrades',
 2, -- type_id for general news
 'The National Institutes of Health (NIH) Rapid Acceleration of Diagnostics Data Hub (RADx® Data Hub) announces today major functionality and design upgrades to its cloud-enabled platform. These upgrades will provide researchers more dynamic access to explore data from over 150 studies from RADx-rad, RADx-UP, RADx Tech, and RADx DHT programs. Researchers will also be gaining access to an even more robust analytics platform with tools such as Jupyter notebooks, R, Python, and SAS Viya.',
 CURRENT_DATE - INTERVAL '10 days',
 CURRENT_DATE + INTERVAL '200 days',
 CURRENT_TIMESTAMP),

-- Funding Opportunities
(3, 'Notice of Funding Opportunity (NOFO): NIH Research Software Engineer (RSE) Award (R50 Clinical Trials Not Allowed)', 'radx-funding-2024',
 1, -- type_id for funding opportunities
 'The purpose of this Notice of Funding Opportunity (NOFO) (RFA-OD-24-011) is to support the ability of exceptional Research Software Engineers (RSEs) to contribute their skills in the development and dissemination of NIH-funded biomedical, clinical, behavioral or health related research software, tools, and algorithms as well as to the training of prospective users of these tools.',
 CURRENT_DATE - INTERVAL '2 days',
 CURRENT_DATE + INTERVAL '28 days',
 CURRENT_TIMESTAMP),

(4, 'Notice of Funding Opportunity (NOFO): Building Sustainable Software Tools for Open Science (R03 Clinical Trial Not Allowed)', 'covid-research-grants',
 1, -- type_id for funding opportunities
 'The purpose of this Notice of funding opportunity (NOFO) (RFA-OD-24-010) is to enhance the sustainability and impact of research software tools by enabling the use of best practices and design principles in software development and by leveraging continuing advances in computing.',
 CURRENT_DATE - INTERVAL '15 days',
 CURRENT_DATE + INTERVAL '15 days',
 CURRENT_TIMESTAMP);

-- Create News links
INSERT INTO news_link (id, news_id, link_label, link_url, display_order) VALUES
(1, 3, 'View More', 'https://grants.nih.gov/grants/guide/rfa-files/RFA-OD-24-011.html', 1),
(2, 4, 'View More', 'https://grants.nih.gov/grants/guide/rfa-files/RFA-OD-24-010.html', 2);


-- Create events
INSERT INTO events (id, title, slug, description, event_type_id, registration_url, event_date, expiration_date, created_at) VALUES
-- Future events
(1, 'Join Us for Office Hours on July 8! ', 'radx-office-hourse',
 'Annual conference for RADx researchers...',
 3, -- general event
 'https://docs.google.com/document/d/1GzPM6R6CWd10sp0Pdl3RfRw-RIkla4iDbdcKcQJDTlA/edit?tab=t.0#heading=h.1s48q99qxb5x',
 CURRENT_DATE + INTERVAL '30 days',
 CURRENT_DATE + INTERVAL '310 days',
 CURRENT_TIMESTAMP),


(2, 'Center Monthly Meeting', 'center-monthly-meeting',
 'Monthly center coordination meeting...',
 2, -- center meeting
 null,
 CURRENT_DATE + INTERVAL '15 days',
 CURRENT_DATE + INTERVAL '160 days',
 CURRENT_TIMESTAMP),

(3, 'Increasing the Value of RADx Data with Metadata', 'metadata-webinar',
 'The RADx Data Hub represents one of the largest collections of NIH COVID data available to researchers and allows researchers to explore, access, and analyze COVID-related data developed through NIH RADx program initiatives.',
 1, -- webinar
 null,
 CURRENT_DATE + INTERVAL '20 days',
 CURRENT_DATE + INTERVAL '210 days',
 CURRENT_TIMESTAMP),

-- Past events
(5, 'Previous Conference', 'previous-conference',
 'Last year''s conference...',
 3, -- general event
 'https://example.com/previous-conference',
 CURRENT_DATE - INTERVAL '30 days',
 CURRENT_DATE - INTERVAL '29 days',
 CURRENT_TIMESTAMP);

-- Create event links
INSERT INTO event_link (id, event_id, link_label, link_url, display_order) VALUES
(1, 1, 'Join Us for Office Hours on July 8! ', 'https://docs.google.com/document/d/1GzPM6R6CWd10sp0Pdl3RfRw-RIkla4iDbdcKcQJDTlA/edit?tab=t.0#heading=h.1s48q99qxb5x', 1),
(2, 3, 'View Slide', 'https://drive.google.com/file/d/1wP1qs-bwGjnRd-7cPLxEmf5i-tQ_vypF/view', 2);

-- Create a test user for local development
INSERT INTO users (
  id,
  uuid,
  first_name,
  middle_initial,
  last_name,
  email_address,
  orcid_id,
  job_title,
  institution_id,
  researcher_level_id,
  status_id,
  internal_user,
  accept_terms,
  last_dua_date,
  last_login_at,
  sftp_path,
  created_at,
  modified_at,
  center_id
)
VALUES
(
  3,                                          -- id
  null,     -- uuid
  'Test',                                    -- first_name
  null,                                        -- middle_initial
  'Test',                                    -- last_name
  'test@test.com',                  -- email_address
  null,                      -- orcid_id
  'Software Developer',                      -- job_title
  1,                                          -- institution_id
  5,                                          -- researcher_level_id
  1,                                          -- status_id
  true,                                       -- internal_user
  true,                                       -- accept_terms
  null,                               -- last_dua_date
  CURRENT_TIMESTAMP,                      -- last_login_at
  'local-yan',                                       -- sftp_path
  CURRENT_TIMESTAMP,                          -- created_at
  NULL,                                       -- modified_at
  1                                           -- center_id
);

INSERT INTO user_role (id, user_id, role_id) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 3, 3),
(4, 3, 4),
(5, 3, 5),
(6, 3, 6);

-- Fix all sequences automatically
DO $$
DECLARE
r RECORD;
    max_id INTEGER;
    seq_name TEXT;
BEGIN
    RAISE NOTICE 'Starting sequence reset...';

FOR r IN
SELECT c.table_name, c.column_name
FROM information_schema.columns c
WHERE c.table_schema = 'public'
  AND c.column_default LIKE 'nextval%'
ORDER BY c.table_name
    LOOP
        seq_name := pg_get_serial_sequence('public.' || r.table_name, r.column_name);

IF seq_name IS NOT NULL THEN
BEGIN
EXECUTE format('SELECT COALESCE(MAX(%I), 0) FROM %I', r.column_name, r.table_name) INTO max_id;
EXECUTE format('SELECT setval(%L, GREATEST(%s, 1))', seq_name, max_id);
RAISE NOTICE 'Table: % | Column: % | Sequence: % | Reset to: %',
                    r.table_name, r.column_name, seq_name, max_id;
EXCEPTION WHEN OTHERS THEN
                RAISE NOTICE 'ERROR on table %.%: %', r.table_name, r.column_name, SQLERRM;
END;
END IF;
END LOOP;

    RAISE NOTICE 'Sequence reset complete!';
END $$;
