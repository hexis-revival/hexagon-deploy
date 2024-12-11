CREATE TABLE beatmapsets (
    id serial NOT NULL PRIMARY KEY,
    title character varying(255) NOT NULL,
    artist character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    creator_id integer NOT NULL REFERENCES users (id),
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    last_updated timestamp without time zone NOT NULL DEFAULT now(),
    approved_at timestamp without time zone NOT NULL DEFAULT now(),
    approved_by integer NOT NULL REFERENCES users (id),
    status smallint NOT NULL DEFAULT -3,
    description text NOT NULL DEFAULT '',
    has_video boolean NOT NULL DEFAULT false,
    availability_status smallint NOT NULL DEFAULT 0,
    availability_info text NOT NULL DEFAULT ''
);

CREATE TABLE beatmaps (
    id serial NOT NULL PRIMARY KEY,
    set_id integer NOT NULL REFERENCES beatmapsets (id),
    checksum character(32) NOT NULL,
    version character varying(255) NOT NULL,
    filename character varying(512) NOT NULL,
    creator_id integer NOT NULL REFERENCES users (id),
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    last_updated timestamp without time zone NOT NULL DEFAULT now(),
    status smallint NOT NULL DEFAULT -3,
    total_length integer NOT NULL DEFAULT 0,
    drain_length integer NOT NULL DEFAULT 0,
    total_circles integer NOT NULL DEFAULT 0,
    total_sliders integer NOT NULL DEFAULT 0,
    total_spinners integer NOT NULL DEFAULT 0,
    total_holds integer NOT NULL DEFAULT 0,
    max_combo integer NOT NULL DEFAULT 0,
    median_bpm real NOT NULL DEFAULT 0,
    highest_bpm real NOT NULL DEFAULT 0,
    lowest_bpm real NOT NULL DEFAULT 0,
    cs real NOT NULL DEFAULT 0,
    hp real NOT NULL DEFAULT 0,
    od real NOT NULL DEFAULT 0,
    ar real NOT NULL DEFAULT 0,
    sr real NOT NULL DEFAULT 0
);

CREATE INDEX idx_beatmaps_id ON beatmaps(id);
CREATE INDEX idx_beatmaps_set_id ON beatmaps(set_id);
CREATE INDEX idx_beatmaps_checksum ON beatmaps(checksum);
