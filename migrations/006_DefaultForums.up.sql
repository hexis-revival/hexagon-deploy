INSERT INTO forums (name, description) VALUES
  ('Hexis', ''),
  ('General', ''),
  ('Beatmaps', '');

WITH hexis_forum AS (SELECT id FROM forums WHERE name = 'Hexis'),
     general_forum AS (SELECT id FROM forums WHERE name = 'General'),
     beatmaps_forum AS (SELECT id FROM forums WHERE name = 'Beatmaps')
INSERT INTO forums (name, description, parent_id) VALUES
  ('Announcements', 'Announcements related to Hexis.', (SELECT id FROM hexis_forum)),
  ('Development', 'Hexis development.', (SELECT id FROM hexis_forum)),
  ('Suggestions', 'Suggest what you would like to see in Hexis.', (SELECT id FROM hexis_forum)),
  ('Bug Reports', 'Please report any bugs here.', (SELECT id FROM hexis_forum)),
  ('General Discussion', 'Feel free to talk about anything and everything related to Hexis in this board.', (SELECT id FROM general_forum)),
  ('Off-Topic', 'Talk about anything that comes to mind.', (SELECT id FROM general_forum)),
  ('Introductions', 'Welcome to the Hexis Community! Please feel free to introduce yourself!', (SELECT id FROM general_forum)),
  ('Language Specific', 'Connect with players who speak your language.', (SELECT id FROM general_forum)),
  ('Mapping Discussion', 'Share the art of mapping with others.', (SELECT id FROM beatmaps_forum)),
  ('Ranked Beatmaps', 'New ranked beatmaps will show up in here.', (SELECT id FROM beatmaps_forum)),
  ('Pending Beatmaps', 'Beatmaps that are pending approval.', (SELECT id FROM beatmaps_forum));

WITH bug_reports_forum AS (SELECT id FROM forums WHERE name = 'Bug Reports'),
     language_forum AS (SELECT id FROM forums WHERE name = 'Language Specific')
INSERT INTO forums (name, parent_id) VALUES
  ('Español', (SELECT id FROM language_forum)),
  ('Français', (SELECT id FROM language_forum)),
  ('Deutsch', (SELECT id FROM language_forum)),
  ('Finnish', (SELECT id FROM language_forum)),
  ('Italiano', (SELECT id FROM language_forum)),
  ('Nederlands', (SELECT id FROM language_forum)),
  ('Skandinavien', (SELECT id FROM language_forum)),
  ('Polski', (SELECT id FROM language_forum)),
  ('Português', (SELECT id FROM language_forum)),
  ('Русский', (SELECT id FROM language_forum)),
  ('中文', (SELECT id FROM language_forum)),
  ('日本語', (SELECT id FROM language_forum)),
  ('한국어', (SELECT id FROM language_forum)),
  ('Other', (SELECT id FROM language_forum)),
  ('Resolved', (SELECT id FROM bug_reports_forum)),
  ('Unresolved', (SELECT id FROM bug_reports_forum));