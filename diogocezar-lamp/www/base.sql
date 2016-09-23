CREATE TABLE user (
	id INTEGER NOT NULL AUTO_INCREMENT,
	name VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL,
	PRIMARY KEY (id)
)DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE `user`;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO `user` (`id`, `name`, `email`) VALUES (1, 'Diogo Cezar', 'diogo@diogocezar.com');
INSERT INTO `user` (`id`, `name`, `email`) VALUES (2, 'John Doo', 'jdoo@gmail.com');
INSERT INTO `user` (`id`, `name`, `email`) VALUES (3, 'Mario Sergio', 'batistamariosergio@gmail.com');