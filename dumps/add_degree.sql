ALTER TABLE `oc_customer` ADD `degree` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `eng_workplace`, ADD `eng_degree` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `degree`;