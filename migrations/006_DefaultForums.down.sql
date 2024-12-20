DELETE FROM forums WHERE name in ('Español', 'Français', 'Deutsch', 'Finnish', 'Italiano', 'Nederlands', 'Skandinavien', 'Polski', 'Português', 'Русский', '中文', '日本語', '한국어', 'Other', 'Resolved', 'Unresolved');
DELETE FROM forums WHERE name in ('Announcements', 'Development', 'Suggestions', 'Bug Reports', 'General Discussion', 'Off-Topic', 'Introductions', 'Language Specific', 'Mapping Discussion', 'Ranked Beatmaps', 'Pending Beatmaps');
DELETE FROM forums WHERE name in ('Hexis', 'General', 'Beatmaps');
ALTER SEQUENCE forums_id_seq RESTART WITH 1;