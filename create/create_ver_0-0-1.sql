CREATE TABLE limitation (
	lim_id     int       NOT NULL auto_increment,
	max_weight double    NOT NULL,
	from_date  timestamp NULL,
	to_date    timestamp NULL,
	CONSTRAINT limitation_pk PRIMARY KEY (lim_id)
);

CREATE TABLE node (
	nod_id      int       NOT NULL auto_increment,
	length      double    NOT NULL,
	width       double    NOT NULL,
	modify_date timestamp NOT NULL,
	insert_date timestamp NOT NULL,
	CONSTRAINT node_pk PRIMARY KEY (nod_id)
);

CREATE TABLE segment_limitation (
	seg_lim_id  int       NOT NULL auto_increment,
	seg_seg_id  int       NOT NULL,
	lim_lim_id  int       NOT NULL,
	modify_date timestamp NOT NULL,
	insert_date timestamp NOT NULL,
	CONSTRAINT segment_limitation_pk PRIMARY KEY (seg_lim_id)
);

CREATE TABLE segment (
	seg_id      int          NOT NULL auto_increment,
	fir_node    int          NOT NULL,
	sec_node    int          NOT NULL,
	name        varchar(250) NOT NULL,
	length      double       NOT NULL,
	modify_date timestamp    NOT NULL,
	insert_date timestamp    NOT NULL,
	CONSTRAINT segment_pk PRIMARY KEY (seg_id)
);

CREATE TABLE vehicle (
	veh_id      int          NOT NULL auto_increment,
	weight      double       NOT NULL,
	plate       varchar(250) NOT NULL unique,
	modify_date timestamp    NOT NULL,
	insert_date timestamp    NOT NULL,
	CONSTRAINT vehicle_pk PRIMARY KEY (veh_id)
);

ALTER TABLE segment_limitation
	ADD CONSTRAINT segment_limitation_limitation FOREIGN KEY segment_limitation (lim_lim_id)
REFERENCES limitation (lim_id);

ALTER TABLE segment_limitation
	ADD CONSTRAINT segment_limitation_segment FOREIGN KEY segment_limitation (seg_seg_id)
REFERENCES segment (seg_id);

ALTER TABLE segment
	ADD CONSTRAINT segment_first_node FOREIGN KEY segment (fir_node)
REFERENCES node (nod_id);

ALTER TABLE segment
	ADD CONSTRAINT segment_second_node FOREIGN KEY segment (sec_node)
REFERENCES node (nod_id);