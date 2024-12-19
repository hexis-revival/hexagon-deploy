DROP INDEX IF EXISTS posts_id_idx;
DROP INDEX IF EXISTS posts_user_id_idx;
DROP INDEX IF EXISTS posts_topic_id_idx;
DROP INDEX IF EXISTS posts_forum_id_idx;

DROP INDEX IF EXISTS topics_id_idx;
DROP INDEX IF EXISTS topics_forum_id_idx;

DROP INDEX IF EXISTS forum_id_idx;
DROP INDEX IF EXISTS forum_topics_forum_id_idx;

DROP TABLE IF EXISTS forum_posts;
DROP TABLE IF EXISTS forum_topics;
DROP TABLE IF EXISTS forums;