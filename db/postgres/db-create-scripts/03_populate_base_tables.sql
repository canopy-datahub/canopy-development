--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.2

-- Started on 2025-06-24 07:49:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4989 (class 0 OID 16517)
-- Dependencies: 238
-- Data for Name: lkup_entity_type; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_entity_type VALUES (1, 'study', NULL);
INSERT INTO public.lkup_entity_type VALUES (3, 'document', NULL);
INSERT INTO public.lkup_entity_type VALUES (4, 'image', NULL);
INSERT INTO public.lkup_entity_type VALUES (2, 'variable', NULL);
INSERT INTO public.lkup_entity_type VALUES (5, 'datafile', NULL);


--
-- TOC entry 4981 (class 0 OID 16475)
-- Dependencies: 230
-- Data for Name: lkup_property_codelist; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_property_codelist VALUES (2, 'RADX_Data_Program', 'study_dcc');
INSERT INTO public.lkup_property_codelist VALUES (3, 'Collection_Method', 'study_source');
INSERT INTO public.lkup_property_codelist VALUES (4, 'Repositories', 'data_access_points');
INSERT INTO public.lkup_property_codelist VALUES (5, 'Genomic_Analyses_Types', 'data_analyses');
INSERT INTO public.lkup_property_codelist VALUES (6, 'Genomic_Data_Types', 'data_genomic');
INSERT INTO public.lkup_property_codelist VALUES (7, 'Genotypes', 'data_genotype');
INSERT INTO public.lkup_property_codelist VALUES (8, 'Sample_Types', 'data_sample_types');
INSERT INTO public.lkup_property_codelist VALUES (9, 'Sequencing_Data_Types', 'data_sequencing');
INSERT INTO public.lkup_property_codelist VALUES (10, 'Phenotype_Data_Types', 'data_phenotype');
INSERT INTO public.lkup_property_codelist VALUES (11, 'Sample_Collection_Type', 'data_sample_collection');
INSERT INTO public.lkup_property_codelist VALUES (12, 'Species', 'data_species');
INSERT INTO public.lkup_property_codelist VALUES (13, 'Submission_Method', 'data_submission_method');
INSERT INTO public.lkup_property_codelist VALUES (15, 'Yes_No', 'YesNo');
INSERT INTO public.lkup_property_codelist VALUES (17, 'Study_Design', 'types');
INSERT INTO public.lkup_property_codelist VALUES (18, 'NIH_Institute', 'institutes_supporting_study');
INSERT INTO public.lkup_property_codelist VALUES (19, 'Data_Type', 'data_general_types');
INSERT INTO public.lkup_property_codelist VALUES (23, 'Access_Type', 'access_type');
INSERT INTO public.lkup_property_codelist VALUES (24, 'Genomic_Array_Data_Types', 'data_array_data');
INSERT INTO public.lkup_property_codelist VALUES (25, 'Study_Status', 'study_status');
INSERT INTO public.lkup_property_codelist VALUES (21, 'General_Research_Use', 'general_research_group');
INSERT INTO public.lkup_property_codelist VALUES (22, 'HealthBiomed_Research_Use', 'health_biomed_group');
INSERT INTO public.lkup_property_codelist VALUES (20, 'Disease_Research_Use', 'disease_specific_group');
INSERT INTO public.lkup_property_codelist VALUES (14, 'True_False', 'True_False');
INSERT INTO public.lkup_property_codelist VALUES (1, 'Study_Status', 'submission_status');
INSERT INTO public.lkup_property_codelist VALUES (26, 'Data_Access_Type', 'data_access_type');
INSERT INTO public.lkup_property_codelist VALUES (16, 'Study_Topics', 'study_domain');
INSERT INTO public.lkup_property_codelist VALUES (27, 'Estimated_Participant_Range', 'estimated participant range');
INSERT INTO public.lkup_property_codelist VALUES (28, 'Study_Focus_Population', 'study_population_focus');


--
-- TOC entry 4995 (class 0 OID 16544)
-- Dependencies: 244
-- Data for Name: lkup_property_source; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_property_source VALUES (1, 'dbGaP/RADx MTA', NULL);
INSERT INTO public.lkup_property_source VALUES (2, 'RADx Hub Online Submission', NULL);
INSERT INTO public.lkup_property_source VALUES (3, 'Database Administrator', NULL);
INSERT INTO public.lkup_property_source VALUES (4, 'Other', 'unknown');


--
-- TOC entry 4993 (class 0 OID 16535)
-- Dependencies: 242
-- Data for Name: lkup_property_type; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_property_type VALUES (1, 'text', NULL);
INSERT INTO public.lkup_property_type VALUES (2, 'numeric', NULL);
INSERT INTO public.lkup_property_type VALUES (3, 'codelisted', NULL);
INSERT INTO public.lkup_property_type VALUES (4, 'date', NULL);
INSERT INTO public.lkup_property_type VALUES (5, 'boolean', NULL);
INSERT INTO public.lkup_property_type VALUES (6, 'composite', NULL);
INSERT INTO public.lkup_property_type VALUES (7, 'aggregate', NULL);
INSERT INTO public.lkup_property_type VALUES (8, 'date_range', NULL);
INSERT INTO public.lkup_property_type VALUES (9, 'hyperlink', NULL);


--
-- TOC entry 4999 (class 0 OID 16623)
-- Dependencies: 252
-- Data for Name: entity_property; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.entity_property VALUES (1, 'phs', NULL, 1, 1, 2, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (2, 'title', NULL, 1, 1, 1, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (6, 'studystartdate', NULL, 1, 4, 2, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (7, 'studyenddate', NULL, 1, 4, 2, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (5, 'dcc', NULL, 1, 3, 2, false, false, 2, false);
INSERT INTO public.entity_property VALUES (20, 'source', NULL, 1, 3, 2, false, true, 3, false);
INSERT INTO public.entity_property VALUES (3, 'description', NULL, 1, 1, 1, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (9, 'multi_center_sites', NULL, 1, 1, 1, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (10, 'pi_name', NULL, 1, 1, 1, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (18, 'estimated_participants', NULL, 1, 2, 1, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (36, 'aggregate_appropriate_for_general_use', NULL, 1, 5, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (38, 'consent_to_add_aggregate', NULL, 1, 5, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (39, 'consent_to_add_individual', NULL, 1, 5, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (42, 'data_access_points', NULL, 1, 3, 1, false, true, 4, true);
INSERT INTO public.entity_property VALUES (43, 'data_analyses', NULL, 1, 3, 1, false, true, 5, true);
INSERT INTO public.entity_property VALUES (45, 'data_from_repository_name', NULL, 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (46, 'data_phenotype', NULL, 1, 3, 1, false, true, 10, true);
INSERT INTO public.entity_property VALUES (47, 'data_sample_collection', NULL, 1, 3, 1, false, true, 11, true);
INSERT INTO public.entity_property VALUES (48, 'data_sharing_info', NULL, 1, 5, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (50, 'data_storage_size', NULL, 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (51, 'data_submission_date', NULL, 1, 4, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (52, 'data_submission_method', NULL, 1, 3, 1, false, false, 13, true);
INSERT INTO public.entity_property VALUES (53, 'data_submission_timeline_details', NULL, 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (54, 'data_target_delivery_date', NULL, 1, 4, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (55, 'data_target_release_date', NULL, 1, 4, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (61, 'geno_seq_platform_info', NULL, 1, 6, 1, false, true, NULL, true);
INSERT INTO public.entity_property VALUES (62, 'geno_seq_platform_url', NULL, 1, 1, 1, false, true, NULL, true);
INSERT INTO public.entity_property VALUES (63, 'geno_seq_platform_probes', NULL, 1, 1, 1, false, true, NULL, true);
INSERT INTO public.entity_property VALUES (64, 'geno_seq_platform_vendor', NULL, 1, 1, 1, false, true, NULL, true);
INSERT INTO public.entity_property VALUES (65, 'geno_seq_platform_description', NULL, 1, 1, 1, false, true, NULL, true);
INSERT INTO public.entity_property VALUES (66, 'geno_seq_platform_name_version', NULL, 1, 1, 1, false, true, NULL, true);
INSERT INTO public.entity_property VALUES (68, 'has_era_account', NULL, 1, 5, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (69, 'has_ic', NULL, 1, 5, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (71, 'individual_appropriate_for_general_use', NULL, 1, 5, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (72, 'other_group_description', NULL, 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (26, 'data_general_types', NULL, 1, 3, 1, false, true, 19, false);
INSERT INTO public.entity_property VALUES (44, 'data_array_data', NULL, 1, 3, 1, false, true, 24, true);
INSERT INTO public.entity_property VALUES (24, 'institutes_supporting_study', NULL, 1, 3, 1, false, true, 18, false);
INSERT INTO public.entity_property VALUES (22, 'types', NULL, 1, 3, 1, false, true, 17, false);
INSERT INTO public.entity_property VALUES (35, 'acknowledgement_statement', NULL, 1, 1, 1, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (67, 'grant_number', NULL, 1, 1, 1, false, true, NULL, false);
INSERT INTO public.entity_property VALUES (60, 'general_research_group', NULL, 1, 3, 1, false, true, 21, false);
INSERT INTO public.entity_property VALUES (70, 'health_biomed_group', NULL, 1, 3, 1, false, true, 22, false);
INSERT INTO public.entity_property VALUES (78, 'release_date', 'Date when study data was first made publicly available through RADx Data Hub', 1, 4, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (57, 'disease_specific_related_conditions', NULL, 1, 1, 1, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (49, 'data_species', NULL, 1, 3, 1, false, true, 12, false);
INSERT INTO public.entity_property VALUES (83, 'types_other_specify', 'Other type of study design, specify:', 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (91, 'data_analyses_other_specify', 'Other type of genomic analyses, specify:', 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (17, 'officer_sign_date', NULL, 1, 4, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (25, 'needs_institutional_certifications', NULL, 1, 5, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (11, 'pi_email', NULL, 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (12, 'pi_assistant_name', NULL, 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (13, 'pi_assistant_email', NULL, 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (15, 'pi_sign_date', NULL, 1, 4, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (16, 'po_name', NULL, 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (27, 'data_genomic', NULL, 1, 3, 1, false, true, 6, true);
INSERT INTO public.entity_property VALUES (28, 'data_genotype', NULL, 1, 3, 1, false, true, 7, true);
INSERT INTO public.entity_property VALUES (29, 'data_sample_types', NULL, 1, 3, 1, false, true, 8, true);
INSERT INTO public.entity_property VALUES (30, 'data_sequencing', NULL, 1, 3, 1, false, true, 9, true);
INSERT INTO public.entity_property VALUES (56, 'disease_specific_group', NULL, 1, 3, 1, false, true, 20, false);
INSERT INTO public.entity_property VALUES (58, 'eua', NULL, 1, 1, 4, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (76, 'has_data_files', 'Indicates whether the study has data files available for request', 1, 3, 3, false, false, 15, false);
INSERT INTO public.entity_property VALUES (77, 'actual_study_size', 'Size of the study (all data files) submitted to RADx Data Hub', 1, 2, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (80, 'study_version', 'The version number associated with the RADx Hub Online Submission ', 1, 2, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (59, 'expected_data_format', NULL, 1, 1, 4, false, true, NULL, true);
INSERT INTO public.entity_property VALUES (73, 'project_number', NULL, 1, 1, 4, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (40, 'controlled_access', NULL, 1, 5, 3, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (41, 'controlled_access_data', NULL, 1, 5, 3, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (79, 'updated_at', 'Date when the study was last updated in the RADx Hub Online Submission', 1, 4, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (32, 'data_policy_accepted', NULL, 1, 5, 3, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (33, 'reject_comments', NULL, 1, 1, 3, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (34, 'study_approved_date', NULL, 1, 4, 3, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (31, 'user_agreement_accepted', NULL, 1, 5, 3, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (37, 'awardee', NULL, 1, 1, 4, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (19, 'public_access_data', NULL, 1, 5, 3, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (23, 'unrestricted_access', NULL, 1, 5, 3, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (85, 'data_general_types_other_specify', 'Other general data types expected to be submitted for the study, specify', 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (86, 'data_genomic_other_specify', 'Other genomic data types expected to be submitted for the study, specify:', 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (87, 'data_phenotype_other_specify', 'Other Phenotype data types expected to be submitted for the study, specify:', 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (88, 'data_sample_types_other_specify', 'Other sample types expected to be submitted for the study, specify:', 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (89, 'data_genotype_other_specify', 'Other genotype data types expected to be submitted for the study, specify:', 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (90, 'data_sequencing_other_specify', 'Other sequencing data types expected to be submitted for the study, specify:', 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (92, 'data_array_data_other_specify', 'Other type of genomic array data, specify:', 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (84, 'source_other_specify', 'Other methods used to collect the data, or the type of data source that the data is derived from', 1, 1, 2, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (21, 'subject', NULL, 1, 1, 2, false, true, NULL, false);
INSERT INTO public.entity_property VALUES (74, 'study_DOI', 'The Digital Object Identifier (DOI) assigned to the study', 1, 1, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (100, 'FOA_number', 'Funding Opportunity Announcement (FOA) Number ', 1, 1, 2, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (101, 'FOA_URL', 'Funding Opportunity Announcement (FOA) URL', 1, 1, 2, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (95, 'study_website_URL', 'Study Website URL', 1, 1, 2, false, true, NULL, false);
INSERT INTO public.entity_property VALUES (97, 'publication_URL', 'Primary Publication URL', 1, 1, 2, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (82, 'topics', 'Select the topics covered by the study', 1, 3, 2, false, true, 16, false);
INSERT INTO public.entity_property VALUES (98, 'access_type', NULL, 1, 3, 1, false, false, 23, true);
INSERT INTO public.entity_property VALUES (99, 'data_access_type', NULL, 1, 3, 1, false, true, 26, true);
INSERT INTO public.entity_property VALUES (102, 'estimated_participant_range', NULL, 1, 3, 2, false, false, 27, false);
INSERT INTO public.entity_property VALUES (14, 'pi_institution', NULL, 1, 1, 1, false, false, NULL, true);
INSERT INTO public.entity_property VALUES (93, 'data_access_points_other', 'Other data access point, list all', 1, 1, 1, false, true, NULL, true);
INSERT INTO public.entity_property VALUES (94, 'topics_other_specify', 'Other study topics, specify', 1, 1, 2, false, true, NULL, true);
INSERT INTO public.entity_property VALUES (96, 'CT_URL', 'ClinicalTrials.gov URL', 1, 1, 2, false, true, NULL, false);
INSERT INTO public.entity_property VALUES (81, 'study_population_focus', NULL, 1, 3, 2, false, true, 28, false);
INSERT INTO public.entity_property VALUES (4, 'RAPIDS_link', NULL, 1, 1, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (75, 'study_citation', 'Citation for citing the use of the study from RADx Data Hub. Principal Investigator (Publication Year). Study Name (Version) [Resource Type]. Publisher. Identifier', 1, 1, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (103, 'data_use_limitations', 'Data use limitations based on the Consent Group Category (i.e., General Research Use, Health/Medical/Biomedical, Disease-Specific, or Other)', 1, 1, 2, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (8, 'is_multi_center', NULL, 1, 3, 1, false, false, 15, false);
INSERT INTO public.entity_property VALUES (200, 'variable_name', NULL, 2, 1, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (201, 'variable_label', NULL, 2, 1, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (204, 'variable_category', NULL, 2, 1, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (205, 'variable_description', NULL, 2, 1, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (206, 'variable_keywords', NULL, 2, 1, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (207, 'variable_term', NULL, 2, 1, 3, false, true, NULL, false);
INSERT INTO public.entity_property VALUES (208, 'variable_unit', NULL, 2, 1, 3, false, true, NULL, false);
INSERT INTO public.entity_property VALUES (209, 'variable_cardinality', NULL, 2, 1, 3, false, true, NULL, false);
INSERT INTO public.entity_property VALUES (210, 'variable_provenance', NULL, 2, 1, 3, false, true, NULL, false);
INSERT INTO public.entity_property VALUES (211, 'variable_notes', NULL, 2, 1, 3, false, true, NULL, false);
INSERT INTO public.entity_property VALUES (212, 'variable_mapping', NULL, 2, 1, 3, false, true, NULL, false);
INSERT INTO public.entity_property VALUES (202, 'Section', NULL, 2, 1, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (203, 'Datatype', NULL, 2, 1, 3, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (214, 'Study Name', NULL, 2, 1, 1, false, false, NULL, false);
INSERT INTO public.entity_property VALUES (104, 'study_variables', NULL, 1, 1, 3, false, true, NULL, NULL);


--
-- TOC entry 5001 (class 0 OID 16654)
-- Dependencies: 254
-- Data for Name: entity_property_display_setting; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.entity_property_display_setting VALUES (89, 4, 'study_overview', 'Representative', 'RAPIDS Link', 10, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (3, 2, 'study_search', 'Title', 'Study Name', 10, false, 10, NULL, NULL, true);
INSERT INTO public.entity_property_display_setting VALUES (50, 78, 'study_overview', 'Representative', 'Release Date', 40, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (90, 103, 'study_overview', 'Detail', 'Consent/Data Use Limitations', 320, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (2, 1, 'study_search', 'Representative', 'dbGaP Study Accession', 20, false, NULL, NULL, NULL, true);
INSERT INTO public.entity_property_display_setting VALUES (11, 10, 'study_search', 'Detail', 'Principal Investigator', 220, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (104, 200, 'variable_overview', 'Title', 'Name', 10, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (105, 201, 'variable_overview', 'Representative', 'Label', 10, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (106, 202, 'variable_overview', 'Representative', 'Section', 20, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (107, 203, 'variable_overview', 'Representative', 'Data Type', 30, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (108, 204, 'variable_overview', 'Representative', 'RADx Variable Category', 40, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (109, 205, 'variable_overview', 'Representative', 'Description', 50, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (110, 206, 'variable_overview', 'Representative', 'Keywords', 60, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (111, 207, 'variable_overview', 'Representative', 'Term', 70, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (112, 212, 'variable_overview', 'Representative', 'From', 80, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (13, 102, 'study_search', 'Detail', 'Sample Size Range', 30, true, 30, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (29, 2, 'study_overview', 'Title', 'Study Name', 10, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (1, 82, 'study_search', 'Representative', 'Study Domain', 50, true, 35, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (16, 22, 'study_search', 'Representative', 'Study Design', 60, true, 40, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (14, 20, 'study_search', 'Representative', 'Data Collection Method', 70, true, 50, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (17, 24, 'study_search', 'Representative', 'NIH Institute / Center', 80, true, 60, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (6, 5, 'study_search', 'Representative', 'RADx Data Program', 90, true, 70, NULL, NULL, true);
INSERT INTO public.entity_property_display_setting VALUES (22, 76, 'study_search', 'Representative', 'Has Data Files', 100, true, 80, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (43, 24, 'study_overview', 'Representative', 'NIH Institute/Center', 20, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (32, 5, 'study_overview', 'Representative', 'RADx Data Program', 30, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (42, 22, 'study_overview', 'Detail', 'Study Design', 160, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (41, 21, 'study_overview', 'Detail', 'Keywords', 150, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (49, 77, 'study_overview', 'Title', 'Study Size (MB)', 30, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (59, 75, 'study_overview', 'Detail', 'Citation', 125, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (61, 95, 'study_overview', 'Detail', 'Study Website URL', 240, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (4, 3, 'study_search', 'Detail', 'Study Description', 100, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (28, 1, 'study_overview', 'Representative', 'dbGaP Study Accession', 5, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (58, 74, 'study_overview', 'Representative', 'DOI', 40, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (51, 79, 'study_overview', 'Representative', 'Updated Date', 50, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (37, 10, 'study_overview', 'Representative', 'Principal Investigator', 60, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (117, 202, 'variable_search', 'Representative', 'Section/Group', 10, true, 10, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (118, 203, 'variable_search', 'Representative', 'Data Type', 20, true, 20, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (119, 214, 'variable_search', 'Detail', 'Study Name', 10, true, 5, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (96, 104, 'study_search', 'Detail', 'Study Variables', NULL, true, 90, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (39, 18, 'study_overview', 'Detail', 'Sample Size', 230, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (80, 18, 'study_search', 'Representative', 'Sample Size', 40, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (30, 3, 'study_overview', 'Representative', 'Study Description', 50, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (48, 76, 'study_overview', 'Representative', 'Has Data Files', 70, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (62, 96, 'study_overview', 'Detail', 'ClinicalTrials.gov URL', 250, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (52, 80, 'study_overview', 'Detail', 'Version Number', 60, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (35, 8, 'study_overview', 'Detail', 'Multi-Center Study', 170, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (10, 9, 'study_search', 'Detail', 'Study Sites', 175, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (36, 9, 'study_overview', 'Detail', 'Study Sites', 175, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (40, 20, 'study_overview', 'Detail', 'Data Collection Method', 140, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (18, 26, 'study_search', 'Detail', 'Data Types', 150, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (63, 97, 'study_overview', 'Detail', 'Publication URL', 260, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (73, 100, 'study_overview', 'Detail', 'Funding Opportunity Announcement (FOA) Number', 300, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (15, 21, 'study_search', 'Detail', 'Keywords', 160, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (60, 82, 'study_overview', 'Detail', 'Study Domain', 100, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (77, 100, 'study_search', 'Detail', 'Funding Opportunity Announcement (FOA) Number', 300, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (33, 6, 'study_overview', 'Detail', 'Study Start Date', 200, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (34, 7, 'study_overview', 'Detail', 'Study End Date', 210, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (20, 49, 'study_search', 'Detail', 'Species', 220, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (46, 49, 'study_overview', 'Detail', 'Species', 220, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (45, 35, 'study_overview', 'Detail', 'Acknowledgement Statement', 290, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (54, 67, 'study_overview', 'Detail', 'NIH Grant or Contract Number(s)', 310, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (83, 67, 'study_search', 'Detail', 'NIH Grant or Contract Number(s)', 310, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (85, 74, 'study_search', 'Detail', 'DOI', 340, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (86, 81, 'study_overview', 'Detail', 'Study Population Focus', 240, false, NULL, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (87, 81, 'study_search', 'Representative', 'Study Population Focus', 30, true, 20, NULL, NULL, false);
INSERT INTO public.entity_property_display_setting VALUES (44, 26, 'study_overview', 'Detail', 'Data Types', 190, false, NULL, NULL, NULL, false);


--
-- TOC entry 4983 (class 0 OID 16484)
-- Dependencies: 232
-- Data for Name: lkup_property_codelist_value; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_property_codelist_value VALUES (335, 3, 'Survey', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (336, 3, 'Interview or Focus Group', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (337, 3, 'Wearable', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (338, 3, 'Smartphone', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (339, 3, 'Contact Tracing', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (340, 3, 'Antigen Testing Device', 60);
INSERT INTO public.lkup_property_codelist_value VALUES (344, 3, 'Chemosensory Testing Device', 100);
INSERT INTO public.lkup_property_codelist_value VALUES (345, 3, 'Electrochemical Testing Device', 110);
INSERT INTO public.lkup_property_codelist_value VALUES (346, 3, 'Unspecified COVID Testing Device', 120);
INSERT INTO public.lkup_property_codelist_value VALUES (347, 3, 'Wastewater Sampling', 130);
INSERT INTO public.lkup_property_codelist_value VALUES (348, 3, 'Disease Registry', 140);
INSERT INTO public.lkup_property_codelist_value VALUES (349, 3, 'Biobank Samples', 150);
INSERT INTO public.lkup_property_codelist_value VALUES (350, 3, 'Real-World Data', 160);
INSERT INTO public.lkup_property_codelist_value VALUES (351, 18, 'NIH CC', 260);
INSERT INTO public.lkup_property_codelist_value VALUES (341, 3, 'Molecular Nucleic Acid or PCR Testing Device', 70);
INSERT INTO public.lkup_property_codelist_value VALUES (343, 3, 'Breath Analysis or Airborne Detection Device', 90);
INSERT INTO public.lkup_property_codelist_value VALUES (342, 3, 'Antibody or Adaptive Immune Response Testing', 80);
INSERT INTO public.lkup_property_codelist_value VALUES (361, 19, 'Temporal', 290);
INSERT INTO public.lkup_property_codelist_value VALUES (356, 19, 'Chemosensor', 16);
INSERT INTO public.lkup_property_codelist_value VALUES (357, 19, 'Geospatial', 85);
INSERT INTO public.lkup_property_codelist_value VALUES (358, 19, 'Microscopy', 152);
INSERT INTO public.lkup_property_codelist_value VALUES (359, 19, 'Mobile', 154);
INSERT INTO public.lkup_property_codelist_value VALUES (360, 19, 'Sequencing', 195);
INSERT INTO public.lkup_property_codelist_value VALUES (362, 22, 'Health or Biomedical Purpose', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (355, 19, 'Biologic Specimens', 14);
INSERT INTO public.lkup_property_codelist_value VALUES (354, 19, 'Biosensor', 12);
INSERT INTO public.lkup_property_codelist_value VALUES (169, 23, 'Unrestricted', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (170, 23, 'Controlled', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (171, 26, 'Controlled Access Data', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (172, 26, 'Public Access Data', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (1, 15, 'Yes', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (352, 28, 'N/A', 180);
INSERT INTO public.lkup_property_codelist_value VALUES (29, 19, 'Environmental', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (309, 16, 'At-Home or Over-the-Counter (OTC) Self-Testing', 290);
INSERT INTO public.lkup_property_codelist_value VALUES (310, 16, 'Serological or Antibody Testing', 300);
INSERT INTO public.lkup_property_codelist_value VALUES (314, 16, 'Testing Rate or Uptake', 340);
INSERT INTO public.lkup_property_codelist_value VALUES (315, 16, 'Vaccination Rate or Uptake', 350);
INSERT INTO public.lkup_property_codelist_value VALUES (179, 27, '> 5000', 60);
INSERT INTO public.lkup_property_codelist_value VALUES (180, 27, 'No Participants', 70);
INSERT INTO public.lkup_property_codelist_value VALUES (133, 7, 'CNV calls from microarray', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (134, 7, 'Genotype calls derived from Sequence', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (135, 7, 'Non-human data', 60);
INSERT INTO public.lkup_property_codelist_value VALUES (141, 9, 'Targeted Exome', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (136, 7, 'Somatic SNV (.MAF)', 70);
INSERT INTO public.lkup_property_codelist_value VALUES (137, 7, 'Other', 80);
INSERT INTO public.lkup_property_codelist_value VALUES (138, 9, '16S rRNA', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (139, 9, 'Epigenomic Marks', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (140, 9, 'Sanger', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (25, 19, 'Behavioral', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (26, 19, 'Clinical', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (27, 19, 'Cognitive', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (28, 19, 'Electronic Medical Records', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (30, 19, 'Family History', 60);
INSERT INTO public.lkup_property_codelist_value VALUES (31, 19, 'Genomic', 70);
INSERT INTO public.lkup_property_codelist_value VALUES (32, 19, 'Genotyping', 80);
INSERT INTO public.lkup_property_codelist_value VALUES (142, 9, 'Targeted Genome', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (143, 9, 'Targeted Transcriptome', 60);
INSERT INTO public.lkup_property_codelist_value VALUES (144, 9, 'Whole Exome', 70);
INSERT INTO public.lkup_property_codelist_value VALUES (145, 9, 'Whole Genome', 80);
INSERT INTO public.lkup_property_codelist_value VALUES (146, 9, 'Whole Transcriptome', 90);
INSERT INTO public.lkup_property_codelist_value VALUES (147, 9, 'Other', 100);
INSERT INTO public.lkup_property_codelist_value VALUES (148, 5, 'Array-derived Expression', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (149, 5, 'Array-derived Methylation', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (150, 5, 'Association/Linkage Results', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (151, 5, 'RNA Seq derived Expression', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (152, 5, 'Other', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (153, 24, 'Expression Array', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (154, 24, 'Methylation Array', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (155, 24, 'SNP Array', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (156, 24, 'Other', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (308, 16, 'Screening Testing', 280);
INSERT INTO public.lkup_property_codelist_value VALUES (311, 16, 'Seroprevalence', 310);
INSERT INTO public.lkup_property_codelist_value VALUES (312, 16, 'Social Determinants of Health', 320);
INSERT INTO public.lkup_property_codelist_value VALUES (313, 16, 'Substance Use', 330);
INSERT INTO public.lkup_property_codelist_value VALUES (316, 16, 'Variants', 360);
INSERT INTO public.lkup_property_codelist_value VALUES (317, 16, 'Virological Testing', 370);
INSERT INTO public.lkup_property_codelist_value VALUES (318, 16, 'Wastewater Surveillance', 380);
INSERT INTO public.lkup_property_codelist_value VALUES (319, 17, 'Case-Control', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (80, 13, 'date', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (81, 13, 'timeline', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (174, 27, '1 - 250', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (175, 27, '251 - 500', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (176, 27, '501 - 1000', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (177, 27, '1001 - 2000', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (178, 27, '2001 - 5000', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (181, 27, 'Unknown', 80);
INSERT INTO public.lkup_property_codelist_value VALUES (320, 17, 'Clinical Genetic Testing', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (96, 20, 'Not-for-profit Organization', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (97, 20, 'Disease-Specific for COVID-19', 60);
INSERT INTO public.lkup_property_codelist_value VALUES (86, 21, 'Not-for-profit Organization', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (53, 12, 'Human', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (54, 12, 'Non-Human', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (281, 16, 'Artificial Intelligence or Machine Learning', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (282, 16, 'Biosensor Technologies', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (296, 16, 'Medical Device or Tool Development', 160);
INSERT INTO public.lkup_property_codelist_value VALUES (304, 16, 'Novel Biosensing or VOC', 240);
INSERT INTO public.lkup_property_codelist_value VALUES (305, 16, 'Pandemic Perceptions or Decision-Making', 250);
INSERT INTO public.lkup_property_codelist_value VALUES (267, 28, 'Lower Socioeconomic Status (SES) Populations', 150);
INSERT INTO public.lkup_property_codelist_value VALUES (2, 15, 'No', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (3, 14, 'TRUE', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (4, 14, 'FALSE', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (5, 2, 'RADx DHT', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (6, 2, 'RADx-rad', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (7, 2, 'RADx Tech', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (8, 2, 'RADx-UP', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (284, 16, 'Community Outreach Programs', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (285, 16, 'Comorbidities', 60);
INSERT INTO public.lkup_property_codelist_value VALUES (286, 16, 'COVID Hotspots', 70);
INSERT INTO public.lkup_property_codelist_value VALUES (287, 16, 'COVID in School Settings', 80);
INSERT INTO public.lkup_property_codelist_value VALUES (288, 16, 'COVID Testing Deserts', 85);
INSERT INTO public.lkup_property_codelist_value VALUES (289, 16, 'Diagnostic Testing', 90);
INSERT INTO public.lkup_property_codelist_value VALUES (290, 16, 'Digital Health Applications', 100);
INSERT INTO public.lkup_property_codelist_value VALUES (291, 16, 'Disease Surveillance', 110);
INSERT INTO public.lkup_property_codelist_value VALUES (292, 16, 'Health Behaviors', 120);
INSERT INTO public.lkup_property_codelist_value VALUES (293, 16, 'Immune Responses', 130);
INSERT INTO public.lkup_property_codelist_value VALUES (294, 16, 'Influenza', 140);
INSERT INTO public.lkup_property_codelist_value VALUES (295, 16, 'Long COVID', 150);
INSERT INTO public.lkup_property_codelist_value VALUES (297, 16, 'Mental Health', 170);
INSERT INTO public.lkup_property_codelist_value VALUES (298, 16, 'Mobile Unit Testing', 180);
INSERT INTO public.lkup_property_codelist_value VALUES (300, 16, 'Multimodal Surveillance', 200);
INSERT INTO public.lkup_property_codelist_value VALUES (301, 16, 'Multisystem Inflammatory Syndrome (MIS)', 210);
INSERT INTO public.lkup_property_codelist_value VALUES (302, 16, 'Multisystem Inflammatory Syndrome in Children (MIS-C)', 220);
INSERT INTO public.lkup_property_codelist_value VALUES (303, 16, 'Next Generation Sequencing (NGS)', 230);
INSERT INTO public.lkup_property_codelist_value VALUES (306, 16, 'Point-of-Care (POC) Testing', 260);
INSERT INTO public.lkup_property_codelist_value VALUES (307, 16, 'Rapid Diagnostic Test (RDT)', 270);
INSERT INTO public.lkup_property_codelist_value VALUES (55, 18, 'NCATS', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (56, 18, 'NCCIH', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (57, 18, 'NCI', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (58, 18, 'NDA', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (59, 18, 'NEI', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (60, 18, 'NHGRI', 60);
INSERT INTO public.lkup_property_codelist_value VALUES (61, 18, 'NHLBI', 70);
INSERT INTO public.lkup_property_codelist_value VALUES (62, 18, 'NIA', 80);
INSERT INTO public.lkup_property_codelist_value VALUES (63, 18, 'NIAAA', 90);
INSERT INTO public.lkup_property_codelist_value VALUES (64, 18, 'NIAID', 100);
INSERT INTO public.lkup_property_codelist_value VALUES (65, 18, 'NIAMS', 110);
INSERT INTO public.lkup_property_codelist_value VALUES (66, 18, 'NIBIB', 120);
INSERT INTO public.lkup_property_codelist_value VALUES (67, 18, 'NICHD', 130);
INSERT INTO public.lkup_property_codelist_value VALUES (68, 18, 'NIDA', 140);
INSERT INTO public.lkup_property_codelist_value VALUES (69, 18, 'NIDCD', 150);
INSERT INTO public.lkup_property_codelist_value VALUES (70, 18, 'NIDCR', 160);
INSERT INTO public.lkup_property_codelist_value VALUES (71, 18, 'NIDDK', 170);
INSERT INTO public.lkup_property_codelist_value VALUES (72, 18, 'NIEHS', 180);
INSERT INTO public.lkup_property_codelist_value VALUES (73, 18, 'NIGMS', 190);
INSERT INTO public.lkup_property_codelist_value VALUES (74, 18, 'NIH OD', 200);
INSERT INTO public.lkup_property_codelist_value VALUES (75, 18, 'NIMH', 210);
INSERT INTO public.lkup_property_codelist_value VALUES (76, 18, 'NIMHD', 220);
INSERT INTO public.lkup_property_codelist_value VALUES (77, 18, 'NINDS', 230);
INSERT INTO public.lkup_property_codelist_value VALUES (78, 18, 'NINR', 240);
INSERT INTO public.lkup_property_codelist_value VALUES (79, 18, 'NLM', 250);
INSERT INTO public.lkup_property_codelist_value VALUES (83, 21, 'IRB approval required', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (84, 21, 'Publication required', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (85, 21, 'Collaboration required', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (88, 22, 'IRB approval required', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (89, 22, 'Publication required', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (90, 22, 'Collaboration required', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (91, 22, 'Not-for-profit use only', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (93, 20, 'IRB approval required', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (94, 20, 'Publication required', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (95, 20, 'Collaboration required', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (98, 4, 'RADx Data Hub', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (99, 4, 'Sequence Read Archive (SRA)', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (100, 4, 'Array Express', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (101, 4, 'ClinVar', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (102, 4, 'dbGaP', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (103, 4, 'dbVar', 60);
INSERT INTO public.lkup_property_codelist_value VALUES (104, 4, 'dbSNP', 70);
INSERT INTO public.lkup_property_codelist_value VALUES (105, 4, 'ENA', 80);
INSERT INTO public.lkup_property_codelist_value VALUES (106, 4, 'GenBank', 90);
INSERT INTO public.lkup_property_codelist_value VALUES (107, 4, 'GEO', 100);
INSERT INTO public.lkup_property_codelist_value VALUES (108, 4, 'MGI', 110);
INSERT INTO public.lkup_property_codelist_value VALUES (109, 4, 'Trace Archive', 120);
INSERT INTO public.lkup_property_codelist_value VALUES (110, 4, 'Other', 130);
INSERT INTO public.lkup_property_codelist_value VALUES (111, 11, 'Prospective Sample', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (113, 6, 'Aggregate Data', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (114, 6, 'Individual-level Data', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (115, 6, 'Non-human Data', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (116, 6, 'Other', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (117, 10, 'Aggregate Data', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (118, 10, 'Individual-level Data', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (119, 10, 'Non-human Data', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (120, 10, 'Other', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (121, 8, 'DNA', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (122, 8, 'Germline', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (123, 8, 'Mitochondria', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (124, 8, 'Single Cell', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (125, 8, 'From Repository [free text]', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (126, 8, 'Microbiome', 60);
INSERT INTO public.lkup_property_codelist_value VALUES (127, 8, 'RNA', 70);
INSERT INTO public.lkup_property_codelist_value VALUES (128, 8, 'Tumor/Natural', 80);
INSERT INTO public.lkup_property_codelist_value VALUES (129, 8, 'Other', 90);
INSERT INTO public.lkup_property_codelist_value VALUES (130, 7, 'Array CGH CNVs', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (131, 7, 'Array-derived Genotypes', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (132, 7, 'CNV calls derived from Sequencing', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (268, 28, 'Older Adults or Elderly', 160);
INSERT INTO public.lkup_property_codelist_value VALUES (269, 28, 'Adults', 170);
INSERT INTO public.lkup_property_codelist_value VALUES (33, 19, 'Imaging', 90);
INSERT INTO public.lkup_property_codelist_value VALUES (34, 19, 'Immunological', 100);
INSERT INTO public.lkup_property_codelist_value VALUES (35, 19, 'Individual Genotype', 110);
INSERT INTO public.lkup_property_codelist_value VALUES (36, 19, 'Individual Phenotype', 120);
INSERT INTO public.lkup_property_codelist_value VALUES (37, 19, 'Individual Sequencing', 130);
INSERT INTO public.lkup_property_codelist_value VALUES (38, 19, 'Metabolomic', 140);
INSERT INTO public.lkup_property_codelist_value VALUES (321, 17, 'Cross-Sectional', 30);
INSERT INTO public.lkup_property_codelist_value VALUES (326, 17, 'Longitudinal Cohort', 80);
INSERT INTO public.lkup_property_codelist_value VALUES (329, 17, 'Mixed Methods', 110);
INSERT INTO public.lkup_property_codelist_value VALUES (330, 17, 'Observational', 120);
INSERT INTO public.lkup_property_codelist_value VALUES (331, 17, 'Open Cohort', 130);
INSERT INTO public.lkup_property_codelist_value VALUES (333, 17, 'Time-Series', 150);
INSERT INTO public.lkup_property_codelist_value VALUES (249, 28, 'Immigrants', 15);
INSERT INTO public.lkup_property_codelist_value VALUES (255, 28, 'Children', 70);
INSERT INTO public.lkup_property_codelist_value VALUES (257, 28, 'Essential Workers', 77);
INSERT INTO public.lkup_property_codelist_value VALUES (263, 28, 'Dialysis Patients', 120);
INSERT INTO public.lkup_property_codelist_value VALUES (265, 28, 'Rural Communities', 140);
INSERT INTO public.lkup_property_codelist_value VALUES (39, 19, 'Metagenomic', 150);
INSERT INTO public.lkup_property_codelist_value VALUES (40, 19, 'Physical Activity', 160);
INSERT INTO public.lkup_property_codelist_value VALUES (41, 19, 'Proteomic', 170);
INSERT INTO public.lkup_property_codelist_value VALUES (42, 19, 'Psychological', 180);
INSERT INTO public.lkup_property_codelist_value VALUES (44, 19, 'Social', 200);
INSERT INTO public.lkup_property_codelist_value VALUES (45, 19, 'Supporting Documents', 210);
INSERT INTO public.lkup_property_codelist_value VALUES (112, 11, 'Existing (Legacy)', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (43, 19, 'Questionnaire or Survey', 190);
INSERT INTO public.lkup_property_codelist_value VALUES (46, 19, 'Other', 999);
INSERT INTO public.lkup_property_codelist_value VALUES (322, 17, 'Device Validation', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (323, 17, 'Device Verification', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (325, 17, 'Interventional or Clinical Trial', 70);
INSERT INTO public.lkup_property_codelist_value VALUES (248, 28, 'Racial or Ethnic Minorities', 10);
INSERT INTO public.lkup_property_codelist_value VALUES (250, 28, 'African Americans', 20);
INSERT INTO public.lkup_property_codelist_value VALUES (252, 28, 'Hispanics or Latinos', 40);
INSERT INTO public.lkup_property_codelist_value VALUES (253, 28, 'Native Hawaiians or Other Pacific Islanders', 50);
INSERT INTO public.lkup_property_codelist_value VALUES (254, 28, 'Asians', 60);
INSERT INTO public.lkup_property_codelist_value VALUES (256, 28, 'School Communities', 75);
INSERT INTO public.lkup_property_codelist_value VALUES (258, 28, 'Pregnant or Nursing Women', 80);
INSERT INTO public.lkup_property_codelist_value VALUES (259, 28, 'Intellectual or Developmental Disabilities', 90);
INSERT INTO public.lkup_property_codelist_value VALUES (260, 28, 'Homeless or Unhoused Populations', 100);
INSERT INTO public.lkup_property_codelist_value VALUES (261, 28, 'Incarcerated or Institutionalized Populations', 110);
INSERT INTO public.lkup_property_codelist_value VALUES (262, 28, 'People Living with HIV/AIDS', 115);
INSERT INTO public.lkup_property_codelist_value VALUES (264, 28, 'Sexual or Gender Minorities', 130);
INSERT INTO public.lkup_property_codelist_value VALUES (266, 28, 'Underserved or Vulnerable Populations', 145);


--
-- TOC entry 5011 (class 0 OID 17087)
-- Dependencies: 295
-- Data for Name: entity_property_mta_mapping; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.entity_property_mta_mapping VALUES (98, 44, 'SNP Array', 24, 155, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (99, 44, 'Other_Specify_3', 24, 156, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (101, 46, 'Aggregate Data', 10, 117, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (102, 46, 'Individuallevel Data', 10, 118, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (103, 46, 'NAno human data', 10, 119, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (104, 46, 'OtherPheno', 10, 120, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (105, 47, 'Prospective Sample', 11, 111, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (106, 47, 'Exisiting (Legacy)', 11, 112, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (1, 2, 'Study name', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (16, 98, 'unrestricted radio', 23, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (14, 99, 'Public Access Data', 26, 172, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (100, 45, 'Repository Name', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (15, 22, 'Study types eg collection longitudinal casecontrol case set control set parentoffspring trios cohort', 17, NULL, 'comma-separated');
INSERT INTO public.entity_property_mta_mapping VALUES (17, 24, 'NIH InstitutesCenters supporting the study', 18, NULL, 'comma-separated');
INSERT INTO public.entity_property_mta_mapping VALUES (111, 51, 'Date6_af_date', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (107, 48, 'NHGRI Genomic Data Sharing  Submission Information', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (110, 50, 'Number of bytes of data to be deposited', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (112, 52, 'Data submission radio', 13, 80, 'generation');
INSERT INTO public.entity_property_mta_mapping VALUES (113, 53, 'batch submission description', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (114, 52, 'Data submission radio', 13, 81, 'publication');
INSERT INTO public.entity_property_mta_mapping VALUES (115, 54, 'delivery date', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (116, 55, 'release date', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (2, 3, 'Original description', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (3, 8, 'Multisite radio', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (4, 9, 'Multicenter list', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (6, 11, 'PI email', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (7, 12, 'PI assistantsubmitter name', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (8, 13, 'PI assistantsubmitter email', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (9, 14, 'PI institution and branch', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (10, 15, 'Date1_af_date', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (11, 16, 'NIH Program Officer', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (12, 17, 'Date2_af_date', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (13, 18, 'Estimated number of study participants', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (18, 25, 'Institutional Certifications', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (108, 49, 'Human Data', 12, 53, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (109, 49, 'NonHuman Data', 12, 54, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (117, 56, 'DS Collab', 20, 95, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (118, 56, 'DS IRB', 20, 93, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (19, 26, 'Behavioral', 19, 25, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (20, 26, 'Clinical', 19, 26, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (21, 26, 'Coginitive', 19, 27, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (22, 26, 'Electronic Medical Records', 19, 28, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (24, 26, 'Family History', 19, 30, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (40, 26, 'Other (specify)', 19, 46, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (23, 26, 'Enviornmental (Physical)', 19, 29, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (25, 26, 'Genomic', 19, 31, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (26, 26, 'Genotyping', 19, 32, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (27, 26, 'Imaging', 19, 33, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (28, 26, 'Immunological', 19, 34, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (29, 26, 'IG', 19, 35, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (30, 26, 'IP', 19, 36, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (31, 26, 'IS', 19, 37, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (32, 26, 'Metabolomic', 19, 38, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (33, 26, 'Metagenomic', 19, 39, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (34, 26, 'Physical Activity', 19, 40, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (35, 26, 'Proteomic', 19, 41, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (36, 26, 'Psychological Variables', 19, 42, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (37, 26, 'Questionnaires/Surveys', 19, 43, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (38, 26, 'Social Variables', 19, 44, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (39, 26, 'Supporting Documents', 19, 45, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (41, 27, 'Genomic Aggregate Data', 6, 113, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (42, 27, 'Genomic Individuallevel Data', 6, 114, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (43, 27, 'Genomic NAno human data', 6, 115, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (44, 27, 'OtherGeno', 6, 116, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (45, 28, 'Array CGH CNVs', 7, 130, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (46, 28, 'Array-derived Genotypes', 7, 131, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (47, 28, 'CNV calls derived from', 7, 132, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (48, 28, 'CNV calls from', 7, 133, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (49, 28, 'Genotype calls derived from Sequence', 7, 134, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (50, 28, 'Genotype Non-Human Data', 7, 135, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (51, 28, 'Somatic SNV MAF', 7, 136, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (52, 28, 'Other_Specify_5', 7, 137, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (53, 29, 'DNA', 8, 121, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (77, 99, 'Controlled Access Data', 26, 171, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (72, 35, 'Acknowledgement Statement', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (73, 36, 'aggregate level radio', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (74, 38, 'aggregate collect radio', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (75, 39, 'individual collection radio', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (5, 10, 'PI name', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (54, 29, 'Germline', 8, 122, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (55, 29, 'Mitochondria', 8, 123, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (56, 29, 'Single Cell', 8, 124, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (57, 29, 'From Repository', 8, 125, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (58, 29, 'Microbiome', 8, 126, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (59, 29, 'RNA', 8, 127, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (60, 29, 'TumorNatural', 8, 128, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (61, 29, 'Other_Specify_2', 8, 129, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (62, 30, '16S rRNA', 9, 138, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (63, 30, 'Epigenomic Marks', 9, 139, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (64, 30, 'Sanger', 9, 140, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (65, 30, 'Targeted Exome', 9, 141, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (66, 30, 'Targeted Genome', 9, 142, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (67, 30, 'Targeted Transcriptome', 9, 143, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (68, 30, 'Whole Exome', 9, 144, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (69, 30, 'Whole Genome', 9, 145, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (70, 30, 'Whole Transcriptome', 9, 146, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (71, 30, 'Other_Specify_6', 9, 147, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (80, 42, 'Array Express', 4, 100, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (81, 42, 'ClinVar', 4, 101, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (82, 42, 'dbGaP', 4, 102, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (83, 42, 'dbVar', 4, 103, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (84, 42, 'dbSNP', 4, 104, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (85, 42, 'ENA', 4, 105, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (86, 42, 'GenBank', 4, 106, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (87, 42, 'GEO', 4, 107, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (88, 42, 'MGI', 4, 108, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (89, 42, 'Trace Archive', 4, 109, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (90, 42, 'Other list all', 4, 110, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (91, 43, 'Array derived Expression', 5, 148, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (92, 43, 'Array derived Methylatio', 5, 149, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (93, 43, 'AssociationLinkage Results', 5, 150, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (94, 43, 'RNA Seq derived', 5, 151, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (95, 43, 'Other_specify_4', 5, 152, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (96, 44, 'Expression Array', 24, 153, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (97, 44, 'Methylation Array', 24, 154, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (119, 56, 'DS NPU', 20, 96, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (120, 56, 'DS PUB', 20, 94, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (123, 60, 'GRU Collab', 21, 85, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (124, 60, 'GRU IRB', 21, 83, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (125, 60, 'GRU NPU', 21, 86, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (126, 60, 'GRU PUB', 21, 84, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (140, 70, 'HMB IRB', 22, 88, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (141, 70, 'HMB PUB', 22, 89, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (143, 70, 'HMB Collab', 22, 90, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (145, 70, 'HMB NPU', 22, 91, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (146, 83, 'Study types eg collection longitudinal casecontrol case set control set parentoffspring trios cohort', NULL, NULL, 'comma-separated');
INSERT INTO public.entity_property_mta_mapping VALUES (121, 56, 'DS Related Conditions', 20, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (122, 57, 'Use of data includes disease XX and related conditions describe and include examples', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (127, 62, 'URL 1', NULL, NULL, 'value_index 0');
INSERT INTO public.entity_property_mta_mapping VALUES (128, 63, 'Probe count 1', NULL, NULL, 'value_index 0');
INSERT INTO public.entity_property_mta_mapping VALUES (129, 64, 'Vendor 1', NULL, NULL, 'value_index 0');
INSERT INTO public.entity_property_mta_mapping VALUES (130, 65, 'Description 1', NULL, NULL, 'value_index 0');
INSERT INTO public.entity_property_mta_mapping VALUES (131, 66, 'Name and version 1', NULL, NULL, 'value_index 0');
INSERT INTO public.entity_property_mta_mapping VALUES (132, 62, 'URL 3', NULL, NULL, 'value_index 1');
INSERT INTO public.entity_property_mta_mapping VALUES (133, 63, 'Probe count 3', NULL, NULL, 'value_index 1');
INSERT INTO public.entity_property_mta_mapping VALUES (134, 64, 'Vendor 3', NULL, NULL, 'value_index 1');
INSERT INTO public.entity_property_mta_mapping VALUES (135, 65, 'Description 3', NULL, NULL, 'value_index 1');
INSERT INTO public.entity_property_mta_mapping VALUES (136, 66, 'Name and version 3', NULL, NULL, 'value_index 1');
INSERT INTO public.entity_property_mta_mapping VALUES (137, 67, 'NIH Grant or Contract Number', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (138, 68, 'eRA radio', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (139, 69, 'IC radio', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (142, 71, 'individual level radio', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (144, 72, 'Other describe', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (147, 85, 'General other', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (148, 86, 'Genomic Other', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (149, 87, 'Phenotype Other', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (150, 88, 'Sample type other', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (151, 89, 'Genotype other', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (152, 90, 'Sequencing other', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (153, 91, 'Analyses Other', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (154, 92, 'Array Data Other', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (155, 93, '1', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (156, 93, '2', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (157, 93, '3', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (158, 93, '4', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (159, 93, '5', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (160, 93, '6', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (161, 93, '7', NULL, NULL, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (78, 42, 'Sequence Read Archive SRA', 4, 98, NULL);
INSERT INTO public.entity_property_mta_mapping VALUES (79, 42, 'Trusted Partner eg Bionimbus GDC', 4, 99, NULL);


--
-- TOC entry 4973 (class 0 OID 16430)
-- Dependencies: 222
-- Data for Name: lkup_country; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_country VALUES (1, 'United States', 1);
INSERT INTO public.lkup_country VALUES (2, 'American Samoa', 2);
INSERT INTO public.lkup_country VALUES (3, 'Guam', 3);
INSERT INTO public.lkup_country VALUES (4, 'Northern Mariana Islands', 4);
INSERT INTO public.lkup_country VALUES (5, 'Puerto Rico', 5);
INSERT INTO public.lkup_country VALUES (6, 'U.S. Virgin Islands', 6);
INSERT INTO public.lkup_country VALUES (7, 'Afghanistan', 7);
INSERT INTO public.lkup_country VALUES (8, 'Albania', 8);
INSERT INTO public.lkup_country VALUES (9, 'Algeria', 9);
INSERT INTO public.lkup_country VALUES (10, 'Andorra', 10);
INSERT INTO public.lkup_country VALUES (11, 'Angola', 11);
INSERT INTO public.lkup_country VALUES (12, 'Antigua and Barbuda', 12);
INSERT INTO public.lkup_country VALUES (13, 'Argentina', 13);
INSERT INTO public.lkup_country VALUES (14, 'Armenia', 14);
INSERT INTO public.lkup_country VALUES (15, 'Australia', 15);
INSERT INTO public.lkup_country VALUES (16, 'Austria', 16);
INSERT INTO public.lkup_country VALUES (17, 'Azerbaijan', 17);
INSERT INTO public.lkup_country VALUES (18, 'Bahamas', 18);
INSERT INTO public.lkup_country VALUES (19, 'Bahrain', 19);
INSERT INTO public.lkup_country VALUES (20, 'Bangladesh', 20);
INSERT INTO public.lkup_country VALUES (21, 'Barbados', 21);
INSERT INTO public.lkup_country VALUES (22, 'Belarus', 22);
INSERT INTO public.lkup_country VALUES (23, 'Belgium', 23);
INSERT INTO public.lkup_country VALUES (24, 'Belize', 24);
INSERT INTO public.lkup_country VALUES (25, 'Benin', 25);
INSERT INTO public.lkup_country VALUES (26, 'Bhutan', 26);
INSERT INTO public.lkup_country VALUES (27, 'Bolivia', 27);
INSERT INTO public.lkup_country VALUES (28, 'Bosnia and Herzegovina', 28);
INSERT INTO public.lkup_country VALUES (29, 'Botswana', 29);
INSERT INTO public.lkup_country VALUES (30, 'Brazil', 30);
INSERT INTO public.lkup_country VALUES (31, 'Brunei', 31);
INSERT INTO public.lkup_country VALUES (32, 'Bulgaria', 32);
INSERT INTO public.lkup_country VALUES (33, 'Burkina Faso', 33);
INSERT INTO public.lkup_country VALUES (34, 'Burma', 34);
INSERT INTO public.lkup_country VALUES (35, 'Burundi', 35);
INSERT INTO public.lkup_country VALUES (36, 'Cabo Verde', 36);
INSERT INTO public.lkup_country VALUES (37, 'Cambodia', 37);
INSERT INTO public.lkup_country VALUES (38, 'Cameroon', 38);
INSERT INTO public.lkup_country VALUES (39, 'Canada', 39);
INSERT INTO public.lkup_country VALUES (40, 'Central African Republic', 40);
INSERT INTO public.lkup_country VALUES (41, 'Chad', 41);
INSERT INTO public.lkup_country VALUES (42, 'Chile', 42);
INSERT INTO public.lkup_country VALUES (43, 'China', 43);
INSERT INTO public.lkup_country VALUES (44, 'Colombia', 44);
INSERT INTO public.lkup_country VALUES (45, 'Comoros', 45);
INSERT INTO public.lkup_country VALUES (46, 'Congo (Brazzaville)', 46);
INSERT INTO public.lkup_country VALUES (47, 'Congo (Kinshasa)', 47);
INSERT INTO public.lkup_country VALUES (48, 'Costa Rica', 48);
INSERT INTO public.lkup_country VALUES (49, 'Côte d''Ivoire', 49);
INSERT INTO public.lkup_country VALUES (50, 'Croatia', 50);
INSERT INTO public.lkup_country VALUES (51, 'Cuba', 51);
INSERT INTO public.lkup_country VALUES (52, 'Cyprus', 52);
INSERT INTO public.lkup_country VALUES (53, 'Czech Republic', 53);
INSERT INTO public.lkup_country VALUES (54, 'Denmark', 54);
INSERT INTO public.lkup_country VALUES (55, 'Djibouti', 55);
INSERT INTO public.lkup_country VALUES (56, 'Dominica', 56);
INSERT INTO public.lkup_country VALUES (57, 'Dominican Republic', 57);
INSERT INTO public.lkup_country VALUES (58, 'Ecuador', 58);
INSERT INTO public.lkup_country VALUES (59, 'Egypt', 59);
INSERT INTO public.lkup_country VALUES (60, 'El Salvador', 60);
INSERT INTO public.lkup_country VALUES (61, 'Equatorial Guinea', 61);
INSERT INTO public.lkup_country VALUES (62, 'Eritrea', 62);
INSERT INTO public.lkup_country VALUES (63, 'Estonia', 63);
INSERT INTO public.lkup_country VALUES (64, 'Ethiopia', 64);
INSERT INTO public.lkup_country VALUES (65, 'Fiji', 65);
INSERT INTO public.lkup_country VALUES (66, 'Finland', 66);
INSERT INTO public.lkup_country VALUES (67, 'France', 67);
INSERT INTO public.lkup_country VALUES (68, 'Gabon', 68);
INSERT INTO public.lkup_country VALUES (69, 'Gambia', 69);
INSERT INTO public.lkup_country VALUES (70, 'Georgia', 70);
INSERT INTO public.lkup_country VALUES (71, 'Germany', 71);
INSERT INTO public.lkup_country VALUES (72, 'Ghana', 72);
INSERT INTO public.lkup_country VALUES (73, 'Greece', 73);
INSERT INTO public.lkup_country VALUES (74, 'Grenada', 74);
INSERT INTO public.lkup_country VALUES (75, 'Guatemala', 75);
INSERT INTO public.lkup_country VALUES (76, 'Guinea', 76);
INSERT INTO public.lkup_country VALUES (77, 'Guinea-Bissau', 77);
INSERT INTO public.lkup_country VALUES (78, 'Guyana', 78);
INSERT INTO public.lkup_country VALUES (79, 'Haiti', 79);
INSERT INTO public.lkup_country VALUES (80, 'Holy See', 80);
INSERT INTO public.lkup_country VALUES (81, 'Honduras', 81);
INSERT INTO public.lkup_country VALUES (82, 'Hungary', 82);
INSERT INTO public.lkup_country VALUES (83, 'Iceland', 83);
INSERT INTO public.lkup_country VALUES (84, 'India', 84);
INSERT INTO public.lkup_country VALUES (85, 'Indonesia', 85);
INSERT INTO public.lkup_country VALUES (86, 'Iran', 86);
INSERT INTO public.lkup_country VALUES (87, 'Iraq', 87);
INSERT INTO public.lkup_country VALUES (88, 'Ireland', 88);
INSERT INTO public.lkup_country VALUES (89, 'Israel', 89);
INSERT INTO public.lkup_country VALUES (90, 'Italy', 90);
INSERT INTO public.lkup_country VALUES (91, 'Jamaica', 91);
INSERT INTO public.lkup_country VALUES (92, 'Japan', 92);
INSERT INTO public.lkup_country VALUES (93, 'Jordan', 93);
INSERT INTO public.lkup_country VALUES (94, 'Kazakhstan', 94);
INSERT INTO public.lkup_country VALUES (95, 'Kenya', 95);
INSERT INTO public.lkup_country VALUES (96, 'Kiribati', 96);
INSERT INTO public.lkup_country VALUES (97, 'Korea, North', 97);
INSERT INTO public.lkup_country VALUES (98, 'Korea, South', 98);
INSERT INTO public.lkup_country VALUES (99, 'Kosovo', 99);
INSERT INTO public.lkup_country VALUES (100, 'Kuwait', 100);
INSERT INTO public.lkup_country VALUES (101, 'Kyrgyzstan', 101);
INSERT INTO public.lkup_country VALUES (102, 'Laos', 102);
INSERT INTO public.lkup_country VALUES (103, 'Latvia', 103);
INSERT INTO public.lkup_country VALUES (104, 'Lebanon', 104);
INSERT INTO public.lkup_country VALUES (105, 'Lesotho', 105);
INSERT INTO public.lkup_country VALUES (106, 'Liberia', 106);
INSERT INTO public.lkup_country VALUES (107, 'Libya', 107);
INSERT INTO public.lkup_country VALUES (108, 'Liechtenstein', 108);
INSERT INTO public.lkup_country VALUES (109, 'Lithuania', 109);
INSERT INTO public.lkup_country VALUES (110, 'Luxembourg', 110);
INSERT INTO public.lkup_country VALUES (111, 'Macedonia', 111);
INSERT INTO public.lkup_country VALUES (112, 'Madagascar', 112);
INSERT INTO public.lkup_country VALUES (113, 'Malawi', 113);
INSERT INTO public.lkup_country VALUES (114, 'Malaysia', 114);
INSERT INTO public.lkup_country VALUES (115, 'Maldives', 115);
INSERT INTO public.lkup_country VALUES (116, 'Mali', 116);
INSERT INTO public.lkup_country VALUES (117, 'Malta', 117);
INSERT INTO public.lkup_country VALUES (118, 'Marshall Islands', 118);
INSERT INTO public.lkup_country VALUES (119, 'Mauritania', 119);
INSERT INTO public.lkup_country VALUES (120, 'Mauritius', 120);
INSERT INTO public.lkup_country VALUES (121, 'Mexico', 121);
INSERT INTO public.lkup_country VALUES (122, 'Micronesia', 122);
INSERT INTO public.lkup_country VALUES (123, 'Moldova', 123);
INSERT INTO public.lkup_country VALUES (124, 'Monaco', 124);
INSERT INTO public.lkup_country VALUES (125, 'Mongolia', 125);
INSERT INTO public.lkup_country VALUES (126, 'Montenegro', 126);
INSERT INTO public.lkup_country VALUES (127, 'Morocco', 127);
INSERT INTO public.lkup_country VALUES (128, 'Mozambique', 128);
INSERT INTO public.lkup_country VALUES (129, 'Namibia', 129);
INSERT INTO public.lkup_country VALUES (130, 'Nauru', 130);
INSERT INTO public.lkup_country VALUES (131, 'Nepal', 131);
INSERT INTO public.lkup_country VALUES (132, 'Netherlands', 132);
INSERT INTO public.lkup_country VALUES (133, 'New Zealand', 133);
INSERT INTO public.lkup_country VALUES (134, 'Nicaragua', 134);
INSERT INTO public.lkup_country VALUES (135, 'Niger', 135);
INSERT INTO public.lkup_country VALUES (136, 'Nigeria', 136);
INSERT INTO public.lkup_country VALUES (137, 'Norway', 137);
INSERT INTO public.lkup_country VALUES (138, 'Oman', 138);
INSERT INTO public.lkup_country VALUES (139, 'Pakistan', 139);
INSERT INTO public.lkup_country VALUES (140, 'Palau', 140);
INSERT INTO public.lkup_country VALUES (141, 'Panama', 141);
INSERT INTO public.lkup_country VALUES (142, 'Papua New Guinea', 142);
INSERT INTO public.lkup_country VALUES (143, 'Paraguay', 143);
INSERT INTO public.lkup_country VALUES (144, 'Peru', 144);
INSERT INTO public.lkup_country VALUES (145, 'Philippines', 145);
INSERT INTO public.lkup_country VALUES (146, 'Poland', 146);
INSERT INTO public.lkup_country VALUES (147, 'Portugal', 147);
INSERT INTO public.lkup_country VALUES (148, 'Qatar', 148);
INSERT INTO public.lkup_country VALUES (149, 'Romania', 149);
INSERT INTO public.lkup_country VALUES (150, 'Russia', 150);
INSERT INTO public.lkup_country VALUES (151, 'Rwanda', 151);
INSERT INTO public.lkup_country VALUES (152, 'Saint Kitts and Nevis', 152);
INSERT INTO public.lkup_country VALUES (153, 'Saint Lucia', 153);
INSERT INTO public.lkup_country VALUES (154, 'Saint Vincent and the Grenadines', 154);
INSERT INTO public.lkup_country VALUES (155, 'Samoa', 155);
INSERT INTO public.lkup_country VALUES (156, 'San Marino', 156);
INSERT INTO public.lkup_country VALUES (157, 'Sao Tome and Principe', 157);
INSERT INTO public.lkup_country VALUES (158, 'Saudi Arabia', 158);
INSERT INTO public.lkup_country VALUES (159, 'Senegal', 159);
INSERT INTO public.lkup_country VALUES (160, 'Serbia', 160);
INSERT INTO public.lkup_country VALUES (161, 'Seychelles', 161);
INSERT INTO public.lkup_country VALUES (162, 'Sierra Leone', 162);
INSERT INTO public.lkup_country VALUES (163, 'Singapore', 163);
INSERT INTO public.lkup_country VALUES (164, 'Slovakia', 164);
INSERT INTO public.lkup_country VALUES (165, 'Slovenia', 165);
INSERT INTO public.lkup_country VALUES (166, 'Solomon Islands', 166);
INSERT INTO public.lkup_country VALUES (167, 'Somalia', 167);
INSERT INTO public.lkup_country VALUES (168, 'South Africa', 168);
INSERT INTO public.lkup_country VALUES (169, 'South Sudan', 169);
INSERT INTO public.lkup_country VALUES (170, 'Spain', 170);
INSERT INTO public.lkup_country VALUES (171, 'Sri Lanka', 171);
INSERT INTO public.lkup_country VALUES (172, 'Sudan', 172);
INSERT INTO public.lkup_country VALUES (173, 'Suriname', 173);
INSERT INTO public.lkup_country VALUES (174, 'Swaziland', 174);
INSERT INTO public.lkup_country VALUES (175, 'Sweden', 175);
INSERT INTO public.lkup_country VALUES (176, 'Switzerland', 176);
INSERT INTO public.lkup_country VALUES (177, 'Syria', 177);
INSERT INTO public.lkup_country VALUES (178, 'Tajikistan', 178);
INSERT INTO public.lkup_country VALUES (179, 'Tanzania', 179);
INSERT INTO public.lkup_country VALUES (180, 'Thailand', 180);
INSERT INTO public.lkup_country VALUES (181, 'Timor-Leste', 181);
INSERT INTO public.lkup_country VALUES (182, 'Togo', 182);
INSERT INTO public.lkup_country VALUES (183, 'Tonga', 183);
INSERT INTO public.lkup_country VALUES (184, 'Trinidad and Tobago', 184);
INSERT INTO public.lkup_country VALUES (185, 'Tunisia', 185);
INSERT INTO public.lkup_country VALUES (186, 'Turkey', 186);
INSERT INTO public.lkup_country VALUES (187, 'Turkmenistan', 187);
INSERT INTO public.lkup_country VALUES (188, 'Tuvalu', 188);
INSERT INTO public.lkup_country VALUES (189, 'Uganda', 189);
INSERT INTO public.lkup_country VALUES (190, 'Ukraine', 190);
INSERT INTO public.lkup_country VALUES (191, 'United Arab Emirates', 191);
INSERT INTO public.lkup_country VALUES (192, 'United Kingdom', 192);
INSERT INTO public.lkup_country VALUES (193, 'Uruguay', 193);
INSERT INTO public.lkup_country VALUES (194, 'Uzbekistan', 194);
INSERT INTO public.lkup_country VALUES (195, 'Vanuatu', 195);
INSERT INTO public.lkup_country VALUES (196, 'Venezuela', 196);
INSERT INTO public.lkup_country VALUES (197, 'Vietnam', 197);
INSERT INTO public.lkup_country VALUES (198, 'Yemen', 198);
INSERT INTO public.lkup_country VALUES (199, 'Zambia', 199);
INSERT INTO public.lkup_country VALUES (200, 'Zimbabwe', 200);


--
-- TOC entry 4985 (class 0 OID 16498)
-- Dependencies: 234
-- Data for Name: lkup_data_file_category; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_data_file_category VALUES (4, 'Image Data', NULL, 'data', 40);
INSERT INTO public.lkup_data_file_category VALUES (5, 'Sequence Data', NULL, 'data', 50);
INSERT INTO public.lkup_data_file_category VALUES (11, 'Eligibility Criteria', 'A file containing a description of elgibility criteria under which the data was collected', 'document', 100);
INSERT INTO public.lkup_data_file_category VALUES (13, 'Study Protocol', 'A file containing a study protocol under which the data was collected', 'document', 120);
INSERT INTO public.lkup_data_file_category VALUES (14, 'Study Documentation', 'A file containing human readable documentation for the data', 'document', 130);
INSERT INTO public.lkup_data_file_category VALUES (10, 'Uncategorized', NULL, 'other', 999);
INSERT INTO public.lkup_data_file_category VALUES (2, 'Tabular Data - Non-harmonized', NULL, 'data', 20);
INSERT INTO public.lkup_data_file_category VALUES (3, 'Tabular Data - Harmonized', NULL, 'data', 30);
INSERT INTO public.lkup_data_file_category VALUES (6, 'File Metadata - Non-harmonized', NULL, 'metadata', 60);
INSERT INTO public.lkup_data_file_category VALUES (7, 'File Metadata - Harmonized', NULL, 'metadata', 70);
INSERT INTO public.lkup_data_file_category VALUES (8, 'File Data Dictionary - Non-harmonized', NULL, 'dictionary', 80);
INSERT INTO public.lkup_data_file_category VALUES (9, 'File Data Dictionary - Harmonized', NULL, 'dictionary', 90);
INSERT INTO public.lkup_data_file_category VALUES (12, 'README', 'A file containing a readme for the data', 'document', 110);


--
-- TOC entry 4987 (class 0 OID 16507)
-- Dependencies: 236
-- Data for Name: lkup_dcc; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_dcc VALUES (1, 'RADx-UP', NULL);
INSERT INTO public.lkup_dcc VALUES (2, 'RADx Tech', NULL);
INSERT INTO public.lkup_dcc VALUES (3, 'RADx DHT', NULL);
INSERT INTO public.lkup_dcc VALUES (4, 'RADx-rad', NULL);


--
-- TOC entry 5013 (class 0 OID 17111)
-- Dependencies: 297
-- Data for Name: lkup_event_type; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_event_type VALUES (1, 'webinar');
INSERT INTO public.lkup_event_type VALUES (2, 'dcc meeting');
INSERT INTO public.lkup_event_type VALUES (3, 'general event');


--
-- TOC entry 4991 (class 0 OID 16526)
-- Dependencies: 240
-- Data for Name: lkup_file_type; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_file_type VALUES (1, 'application/vnd.ms-excel', NULL);
INSERT INTO public.lkup_file_type VALUES (2, 'application/json', NULL);
INSERT INTO public.lkup_file_type VALUES (3, 'text/csv', NULL);
INSERT INTO public.lkup_file_type VALUES (4, 'text/plain', NULL);
INSERT INTO public.lkup_file_type VALUES (5, 'application/zip', NULL);
INSERT INTO public.lkup_file_type VALUES (6, 'image/png', NULL);
INSERT INTO public.lkup_file_type VALUES (7, 'image/jpeg', NULL);
INSERT INTO public.lkup_file_type VALUES (8, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', NULL);
INSERT INTO public.lkup_file_type VALUES (9, 'other', NULL);


--
-- TOC entry 4975 (class 0 OID 16437)
-- Dependencies: 224
-- Data for Name: lkup_institution_type; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_institution_type VALUES (1, 'Academic Institution', 10);
INSERT INTO public.lkup_institution_type VALUES (2, 'Biotech/Pharma', 20);
INSERT INTO public.lkup_institution_type VALUES (3, 'Commercial Company', 30);
INSERT INTO public.lkup_institution_type VALUES (4, 'Foundation or Advocacy Group', 40);
INSERT INTO public.lkup_institution_type VALUES (5, 'Government Agency (NIH)', 50);
INSERT INTO public.lkup_institution_type VALUES (6, 'Government Agency (Non-NIH)', 60);
INSERT INTO public.lkup_institution_type VALUES (7, 'Government Agency (Non-USA)', 70);
INSERT INTO public.lkup_institution_type VALUES (8, 'Hospital and Healthcare', 80);
INSERT INTO public.lkup_institution_type VALUES (9, 'Research Institute', 90);
INSERT INTO public.lkup_institution_type VALUES (10, 'Other', 100);


--
-- TOC entry 5017 (class 0 OID 17259)
-- Dependencies: 309
-- Data for Name: lkup_metrics_report_type; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_metrics_report_type VALUES (1, 'hub_content', NULL);
INSERT INTO public.lkup_metrics_report_type VALUES (2, 'harmonization', NULL);


--
-- TOC entry 5015 (class 0 OID 17120)
-- Dependencies: 299
-- Data for Name: lkup_news_type; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_news_type VALUES (1, 'funding opportunities');
INSERT INTO public.lkup_news_type VALUES (2, 'general news');


--
-- TOC entry 5023 (class 0 OID 46679)
-- Dependencies: 415
-- Data for Name: lkup_referrer; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_referrer VALUES (1, 'Social media (LinkedIn, Twitter, etc.)', 'please specify what account', NULL, 10);
INSERT INTO public.lkup_referrer VALUES (2, 'Conference or event', 'please specify what event', NULL, 20);
INSERT INTO public.lkup_referrer VALUES (3, 'Personal Contact (Colleague, mentor, RADx Data Hub User Advisory Board member, etc.)', 'please specify who', NULL, 30);
INSERT INTO public.lkup_referrer VALUES (4, 'NIH website or materials', 'please specify what website/material', NULL, 40);
INSERT INTO public.lkup_referrer VALUES (5, 'Newsletter or email', 'please specify what newsletter/email list', NULL, 50);
INSERT INTO public.lkup_referrer VALUES (6, 'Other', 'please specify', NULL, 60);


--
-- TOC entry 5005 (class 0 OID 16750)
-- Dependencies: 262
-- Data for Name: lkup_researcher_level; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_researcher_level VALUES (1, 'Undergraduate', NULL);
INSERT INTO public.lkup_researcher_level VALUES (2, 'Graduate/Doctorate', NULL);
INSERT INTO public.lkup_researcher_level VALUES (3, 'Postdoctoral/Residency', NULL);
INSERT INTO public.lkup_researcher_level VALUES (4, 'Early Career', NULL);
INSERT INTO public.lkup_researcher_level VALUES (5, 'Established Investigator', NULL);


--
-- TOC entry 5019 (class 0 OID 17296)
-- Dependencies: 315
-- Data for Name: lkup_resolution_type; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_resolution_type VALUES (1, 'Issue Resolved', NULL, 10);
INSERT INTO public.lkup_resolution_type VALUES (2, 'User Error', NULL, 20);
INSERT INTO public.lkup_resolution_type VALUES (3, 'Backlog Item', NULL, 30);


--
-- TOC entry 5003 (class 0 OID 16743)
-- Dependencies: 260
-- Data for Name: lkup_role; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_role VALUES (1, 'Data Submitter', 'Data Submitter');
INSERT INTO public.lkup_role VALUES (2, 'Officer', 'Officer');
INSERT INTO public.lkup_role VALUES (3, 'Data Curator', 'Curator');
INSERT INTO public.lkup_role VALUES (5, 'Application Administrator', 'Application Administrator');
INSERT INTO public.lkup_role VALUES (4, 'Support Team', 'Support Team');
INSERT INTO public.lkup_role VALUES (6, 'Uploader', 'User can upload files to portal');


--
-- TOC entry 4977 (class 0 OID 16444)
-- Dependencies: 226
-- Data for Name: lkup_state; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_state VALUES (1, 'Alabama', 'AL', 10);
INSERT INTO public.lkup_state VALUES (2, 'Alaska', 'AK', 20);
INSERT INTO public.lkup_state VALUES (3, 'Arizona', 'AZ', 30);
INSERT INTO public.lkup_state VALUES (4, 'Arkansas', 'AR', 40);
INSERT INTO public.lkup_state VALUES (5, 'California', 'CA', 50);
INSERT INTO public.lkup_state VALUES (6, 'Colorado', 'CO', 60);
INSERT INTO public.lkup_state VALUES (7, 'Connecticut', 'CT', 70);
INSERT INTO public.lkup_state VALUES (8, 'Delaware', 'DE', 80);
INSERT INTO public.lkup_state VALUES (9, 'District of Columbia', 'DC', 90);
INSERT INTO public.lkup_state VALUES (10, 'Florida', 'FL', 100);
INSERT INTO public.lkup_state VALUES (11, 'Georgia', 'GA', 110);
INSERT INTO public.lkup_state VALUES (12, 'Hawaii', 'HI', 120);
INSERT INTO public.lkup_state VALUES (13, 'Idaho', 'ID', 130);
INSERT INTO public.lkup_state VALUES (14, 'Illinois', 'IL', 140);
INSERT INTO public.lkup_state VALUES (15, 'Indiana', 'IN', 150);
INSERT INTO public.lkup_state VALUES (16, 'Iowa', 'IA', 160);
INSERT INTO public.lkup_state VALUES (17, 'Kansas', 'KS', 170);
INSERT INTO public.lkup_state VALUES (18, 'Kentucky', 'KY', 180);
INSERT INTO public.lkup_state VALUES (19, 'Louisiana', 'LA', 190);
INSERT INTO public.lkup_state VALUES (20, 'Maine', 'ME', 200);
INSERT INTO public.lkup_state VALUES (21, 'Maryland', 'MD', 210);
INSERT INTO public.lkup_state VALUES (22, 'Massachusetts', 'MA', 220);
INSERT INTO public.lkup_state VALUES (23, 'Michigan', 'MI', 230);
INSERT INTO public.lkup_state VALUES (24, 'Minnesota', 'MN', 240);
INSERT INTO public.lkup_state VALUES (25, 'Mississippi', 'MS', 250);
INSERT INTO public.lkup_state VALUES (26, 'Missouri', 'MO', 260);
INSERT INTO public.lkup_state VALUES (27, 'Montana', 'MT', 270);
INSERT INTO public.lkup_state VALUES (28, 'Nebraska', 'NE', 280);
INSERT INTO public.lkup_state VALUES (29, 'Nevada', 'NV', 290);
INSERT INTO public.lkup_state VALUES (30, 'New Hampshire', 'NH', 300);
INSERT INTO public.lkup_state VALUES (31, 'New Jersey', 'NJ', 310);
INSERT INTO public.lkup_state VALUES (32, 'New Mexico', 'NM', 320);
INSERT INTO public.lkup_state VALUES (33, 'New York', 'NY', 330);
INSERT INTO public.lkup_state VALUES (34, 'North Carolina', 'NC', 340);
INSERT INTO public.lkup_state VALUES (35, 'North Dakota', 'ND', 350);
INSERT INTO public.lkup_state VALUES (36, 'Ohio', 'OH', 360);
INSERT INTO public.lkup_state VALUES (37, 'Oklahoma', 'OK', 370);
INSERT INTO public.lkup_state VALUES (38, 'Oregon', 'OR', 380);
INSERT INTO public.lkup_state VALUES (39, 'Pennsylvania', 'PA', 390);
INSERT INTO public.lkup_state VALUES (40, 'Rhode Island', 'RI', 400);
INSERT INTO public.lkup_state VALUES (41, 'South Carolina', 'SC', 410);
INSERT INTO public.lkup_state VALUES (42, 'South Dakota', 'SD', 420);
INSERT INTO public.lkup_state VALUES (43, 'Tennessee', 'TN', 430);
INSERT INTO public.lkup_state VALUES (44, 'Texas', 'TX', 440);
INSERT INTO public.lkup_state VALUES (45, 'Utah', 'UT', 450);
INSERT INTO public.lkup_state VALUES (46, 'Vermont', 'VT', 460);
INSERT INTO public.lkup_state VALUES (47, 'Virginia', 'VA', 470);
INSERT INTO public.lkup_state VALUES (48, 'Washington', 'WA', 480);
INSERT INTO public.lkup_state VALUES (49, 'West Virginia', 'WV', 490);
INSERT INTO public.lkup_state VALUES (50, 'Wisconsin', 'WI', 500);
INSERT INTO public.lkup_state VALUES (51, 'Wyoming', 'WY', 510);
INSERT INTO public.lkup_state VALUES (52, 'American Samoa', 'AS', 520);
INSERT INTO public.lkup_state VALUES (53, 'Guam', 'GU', 530);
INSERT INTO public.lkup_state VALUES (54, 'Northern Mariana Islands', 'MP', 540);
INSERT INTO public.lkup_state VALUES (55, 'Puerto Rico', 'PR', 550);
INSERT INTO public.lkup_state VALUES (56, 'Virgin Islands', 'VI', 560);


--
-- TOC entry 4979 (class 0 OID 16466)
-- Dependencies: 228
-- Data for Name: lkup_status; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_status VALUES (1, 'active', 'general', 10, NULL);
INSERT INTO public.lkup_status VALUES (2, 'inactive', 'general', 20, NULL);
INSERT INTO public.lkup_status VALUES (4, 'initiated', 'support_request', 100, NULL);
INSERT INTO public.lkup_status VALUES (6, 'in_progress', 'support_request', 120, NULL);
INSERT INTO public.lkup_status VALUES (8, 'closed', 'support_request', 140, NULL);
INSERT INTO public.lkup_status VALUES (9, 'draft', 'file', 10, NULL);
INSERT INTO public.lkup_status VALUES (10, 'approved', 'file', 40, NULL);
INSERT INTO public.lkup_status VALUES (11, 'rejected', 'file', 50, NULL);
INSERT INTO public.lkup_status VALUES (12, 'pending approval', 'file', 20, NULL);
INSERT INTO public.lkup_status VALUES (13, 'approved - pending confirmation', 'file', 30, NULL);
INSERT INTO public.lkup_status VALUES (15, 'submitted', 'data_submission', 70, NULL);
INSERT INTO public.lkup_status VALUES (14, 'in_progress', 'data_submission', 60, NULL);
INSERT INTO public.lkup_status VALUES (18, 'completed', 'data_submission', 100, NULL);
INSERT INTO public.lkup_status VALUES (23, 'active', 'institution', 20, NULL);
INSERT INTO public.lkup_status VALUES (24, 'inactive', 'institution', 30, NULL);
INSERT INTO public.lkup_status VALUES (22, 'pending', 'institution', 10, NULL);
INSERT INTO public.lkup_status VALUES (25, 'Pending DCC Input', 'study', 10, NULL);
INSERT INTO public.lkup_status VALUES (26, 'In Review', 'study', 20, NULL);
INSERT INTO public.lkup_status VALUES (27, 'Approved', 'study', 30, NULL);
INSERT INTO public.lkup_status VALUES (19, 'submitted', 'workbench_request', 10, NULL);
INSERT INTO public.lkup_status VALUES (20, 'approved', 'workbench_request', 20, NULL);
INSERT INTO public.lkup_status VALUES (21, 'rejected', 'workbench_request', 30, NULL);


--
-- TOC entry 4997 (class 0 OID 16553)
-- Dependencies: 246
-- Data for Name: lkup_submission_step; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_submission_step VALUES (1, 'Upload Files');
INSERT INTO public.lkup_submission_step VALUES (2, 'Bundle Files');
INSERT INTO public.lkup_submission_step VALUES (3, 'Validate Files');
INSERT INTO public.lkup_submission_step VALUES (4, 'Review and Submit');
INSERT INTO public.lkup_submission_step VALUES (5, 'Submitted');


--
-- TOC entry 5021 (class 0 OID 17303)
-- Dependencies: 317
-- Data for Name: lkup_support_request_type; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_support_request_type VALUES (1, 'General Feedback', NULL, 10);
INSERT INTO public.lkup_support_request_type VALUES (2, 'Technical', NULL, 20);
INSERT INTO public.lkup_support_request_type VALUES (3, 'Feature Request', NULL, 30);
INSERT INTO public.lkup_support_request_type VALUES (4, 'Workbench Support', NULL, 40);
INSERT INTO public.lkup_support_request_type VALUES (5, 'Engagement', NULL, 50);


--
-- TOC entry 5025 (class 0 OID 58938)
-- Dependencies: 428
-- Data for Name: lkup_variable_category; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_variable_category VALUES (1, 'RADx Core Variable', NULL, 'tier 1 variable');
INSERT INTO public.lkup_variable_category VALUES (4, 'RADx DHT Common Variable', 3, 'tier 2 variable');
INSERT INTO public.lkup_variable_category VALUES (6, 'RADx Study Level Variable', NULL, 'tier 3 variable');
INSERT INTO public.lkup_variable_category VALUES (3, 'RADx Tech Common Variable', 2, 'tier 2 variable');
INSERT INTO public.lkup_variable_category VALUES (2, 'RADx-UP Common Variable', 1, 'tier 2 variable');
INSERT INTO public.lkup_variable_category VALUES (5, 'RADx-rad Common Variable', 4, 'tier 2 variable');


--
-- TOC entry 5024 (class 0 OID 46715)
-- Dependencies: 419
-- Data for Name: lkup_variable_datatype; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_variable_datatype VALUES (1, 'Integer', NULL);
INSERT INTO public.lkup_variable_datatype VALUES (2, 'String', NULL);
INSERT INTO public.lkup_variable_datatype VALUES (3, 'Decimal', NULL);


--
-- TOC entry 5009 (class 0 OID 16999)
-- Dependencies: 287
-- Data for Name: lkup_variable_type; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_variable_type VALUES (1, 'text', NULL);
INSERT INTO public.lkup_variable_type VALUES (2, 'numeric', NULL);
INSERT INTO public.lkup_variable_type VALUES (3, 'codelisted', NULL);


--
-- TOC entry 5007 (class 0 OID 16875)
-- Dependencies: 277
-- Data for Name: lkup_workbench_interest; Type: TABLE DATA; Schema: public; Owner: radx_admin
--

INSERT INTO public.lkup_workbench_interest VALUES (2, 'Nice to have', NULL);
INSERT INTO public.lkup_workbench_interest VALUES (3, 'Required for research', NULL);
INSERT INTO public.lkup_workbench_interest VALUES (4, 'Other', NULL);
INSERT INTO public.lkup_workbench_interest VALUES (1, 'Evaluating its usefulness', NULL);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 253
-- Name: entity_property_display_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.entity_property_display_setting_id_seq', 90, true);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 251
-- Name: entity_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.entity_property_id_seq', 102, true);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 294
-- Name: entity_property_mta_mapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.entity_property_mta_mapping_id_seq', 1, false);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 221
-- Name: lkup_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_country_id_seq', 1, false);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 233
-- Name: lkup_data_file_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_data_file_category_id_seq', 14, true);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 235
-- Name: lkup_dcc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_dcc_id_seq', 4, true);


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 237
-- Name: lkup_entity_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_entity_type_id_seq', 6, true);


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 296
-- Name: lkup_event_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_event_type_id_seq', 3, true);


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 239
-- Name: lkup_file_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_file_type_id_seq', 9, true);


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 223
-- Name: lkup_institution_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_institution_type_id_seq', 10, true);


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 308
-- Name: lkup_metrics_report_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_metrics_report_type_id_seq', 2, true);


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 298
-- Name: lkup_news_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_news_type_id_seq', 2, true);


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 229
-- Name: lkup_property_codelist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_property_codelist_id_seq', 1, false);


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 231
-- Name: lkup_property_codelist_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_property_codelist_value_id_seq', 362, true);


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 243
-- Name: lkup_property_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_property_source_id_seq', 3, true);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 241
-- Name: lkup_property_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_property_type_id_seq', 9, true);


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 414
-- Name: lkup_referrer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_referrer_id_seq', 1, false);


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 261
-- Name: lkup_researcher_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_researcher_level_id_seq', 5, true);


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 314
-- Name: lkup_resolution_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_resolution_type_id_seq', 3, true);


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 259
-- Name: lkup_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_role_id_seq', 5, true);


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 225
-- Name: lkup_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_state_id_seq', 1, false);


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 227
-- Name: lkup_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_status_id_seq', 19, true);


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 245
-- Name: lkup_submission_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_submission_step_id_seq', 1, false);


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 316
-- Name: lkup_support_request_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_support_request_type_id_seq', 5, true);


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 286
-- Name: lkup_variable_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_variable_type_id_seq', 3, true);


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 276
-- Name: lkup_workbench_interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: radx_admin
--

SELECT pg_catalog.setval('public.lkup_workbench_interest_id_seq', 4, true);


-- Completed on 2025-06-24 07:49:44

--
-- PostgreSQL database dump complete
--

