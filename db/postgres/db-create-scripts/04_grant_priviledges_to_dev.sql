-- 1. Grant USAGE on the schema. This allows the user to access objects in the schema:
GRANT USAGE ON SCHEMA public TO app_user_dev;

-- 2. Grant SELECT, INSERT, UPDATE, DELETE on all tables in the schema:
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO app_user_dev;

-- 4. Grant USAGE and SELECT on all sequences in the schema:
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO app_user_dev;

-- 5. Set up default privileges for the user:
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_user_dev;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON SEQUENCES TO app_user_dev;

-- -- Specifically grant on the tables used in the view
-- GRANT SELECT ON public.view_study TO app_user_dev;
-- GRANT SELECT ON public.view_current_hub_content TO app_user_dev;