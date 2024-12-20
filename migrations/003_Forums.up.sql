CREATE TABLE IF NOT EXISTS forums
(
    id serial NOT NULL PRIMARY KEY,
    name varchar(32) NOT NULL,
    description varchar(255) NOT NULL DEFAULT '',
    created_at timestamptz NOT NULL DEFAULT now(),
    parent_id int REFERENCES forums (id) DEFAULT NULL,
    hidden boolean NOT NULL DEFAULT false
);

CREATE TABLE IF NOT EXISTS forum_topics
(
    id serial NOT NULL PRIMARY KEY,
    forum_id int NOT NULL REFERENCES forums (id),
    creator_id int NOT NULL REFERENCES users (id),
    title varchar(255) NOT NULL,
    status_text varchar(255) DEFAULT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    last_post_at timestamptz NOT NULL DEFAULT now(),
    locked_at timestamptz DEFAULT NULL,
    views int NOT NULL DEFAULT 0,
    announcement boolean NOT NULL DEFAULT false,
    hidden boolean NOT NULL DEFAULT false,
    pinned boolean NOT NULL DEFAULT false
);

CREATE TABLE IF NOT EXISTS forum_posts
(
    id bigserial NOT NULL PRIMARY KEY,
    topic_id int NOT NULL REFERENCES forum_topics (id),
    forum_id int NOT NULL REFERENCES forums (id),
    user_id int NOT NULL REFERENCES users (id),
    content text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    edit_time timestamptz NOT NULL DEFAULT now(),
    edit_count int NOT NULL DEFAULT 0,
    edit_locked boolean NOT NULL DEFAULT false,
    hidden boolean NOT NULL DEFAULT false,
    deleted boolean NOT NULL DEFAULT false
);

CREATE INDEX IF NOT EXISTS forum_id_idx ON forums (id);
CREATE INDEX IF NOT EXISTS forum_parent_id_hidden_idx ON forums (parent_id, hidden);

CREATE INDEX IF NOT EXISTS topics_id_idx ON forum_topics (id);
CREATE INDEX IF NOT EXISTS topics_forum_id_idx ON forum_topics (forum_id);

CREATE INDEX IF NOT EXISTS posts_id_idx ON forum_posts (id);
CREATE INDEX IF NOT EXISTS posts_user_id_idx ON forum_posts (user_id);
CREATE INDEX IF NOT EXISTS posts_topic_id_idx ON forum_posts (topic_id);
CREATE INDEX IF NOT EXISTS posts_forum_id_idx ON forum_posts (forum_id);