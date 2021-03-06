ALTER TABLE `oc_attribute_group_description` CHANGE `name` `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `oc_attribute_description` CHANGE `name` `name` VARCHAR(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `oc_information_description` CHANGE `title` `title` VARCHAR(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `oc_manufacturer_description` CHANGE `name` `name` VARCHAR(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `oc_manufacturer_description` CHANGE `site_address` `site_address` VARCHAR(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `oc_manufacturer_description` CHANGE `address` `address` VARCHAR(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `oc_news_description` CHANGE `title` `title` VARCHAR(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `oc_newsblog_article_description` CHANGE `name` `name` VARCHAR(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `oc_newsblog_article_description` CHANGE `venue` `venue` VARCHAR(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
