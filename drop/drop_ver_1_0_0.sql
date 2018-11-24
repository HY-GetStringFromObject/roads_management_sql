ALTER TABLE segment_limitation
	DROP FOREIGN KEY segment_limitation_limitation;

ALTER TABLE segment_limitation
	DROP FOREIGN KEY segment_limitation_segment;

ALTER TABLE segment
	DROP FOREIGN KEY segment_first_node;

ALTER TABLE segment
	DROP FOREIGN KEY segment_second_node;

DROP TABLE limitation;

DROP TABLE node;

DROP TABLE segment_limitation;

DROP TABLE segment;

DROP TABLE vehicle;
