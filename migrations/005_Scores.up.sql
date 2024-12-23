CREATE TYPE score_grade AS ENUM (
    'F',
    'D',
    'C',
    'B',
    'A',
    'S',
    'SH',
    'X',
    'XH'
);

CREATE TABLE scores (
    id bigserial NOT NULL PRIMARY KEY,
    beatmap_id int NOT NULL REFERENCES beatmaps (id),
    user_id int NOT NULL REFERENCES users (id),
    checksum character(32) NOT NULL,
    status smallint NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    client_version int NOT NULL,
    total_score bigint NOT NULL,
    max_combo int NOT NULL,
    accuracy real NOT NULL CHECK (accuracy >= 0 AND accuracy <= 1),
    full_combo boolean NOT NULL,
    passed boolean NOT NULL,
    grade score_grade NOT NULL,
    count_300 int NOT NULL,
    count_100 int NOT NULL,
    count_50 int NOT NULL,
    count_geki int NOT NULL,
    count_katu int NOT NULL,
    count_good int NOT NULL,
    count_miss int NOT NULL,
    ar_offset smallint NOT NULL,
    od_offset smallint NOT NULL,
    cs_offset smallint NOT NULL,
    hp_offset smallint NOT NULL,
    ps_offset smallint NOT NULL,
    mod_hidden boolean NOT NULL,
    mod_nofail boolean NOT NULL,
    visible boolean NOT NULL DEFAULT true,
    pinned boolean NOT NULL DEFAULT false
);

CREATE INDEX idx_scores_beatmap_status ON scores (beatmap_id, status);
CREATE INDEX idx_scores_user ON scores (user_id, status);
CREATE INDEX idx_beatmap_status ON scores (status);