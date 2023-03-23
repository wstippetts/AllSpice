CREATE TABLE
    IF NOT EXISTS accounts(
        id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
        name varchar(255) COMMENT 'User Name',
        email varchar(255) COMMENT 'User Email',
        picture varchar(255) COMMENT 'User Picture'
    ) default charset utf8 COMMENT '';

-- SECTION Recipe

CREATE TABLE
    Recipe(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Recipe ID',
        title: VARCHAR(100) NOT NULL COMMENT 'Recipe Title',
        instructions: VARCHAR(1000) NOT NULL COMMENT 'instructions',
        img: VARCHAR(500) NOT NULL COMMENT 'image link',
        category: VARCHAR(100) NOT NULL COMMENT 'Food category',
        FOREIGN KEY(creatorId) REFERENCES accounts(id) ON DELETE CASCADE COMMENT 'Creator ID',
    ) default charset utf8 COMMENT '';

-- SECTION Ingredient

CREATE TABLE
    Ingredient(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Ingredient ID',
        title: VARCHAR(100) NOT NULL COMMENT 'Ingredient Title',
        quantity: VARCHAR(100) NOT NULL COMMENT 'Quantity',
        FOREIGN KEY(recipeId) REFERENCES Recipe(id) ON DELETE CASCADE COMMENT 'Recipe ID',
    ) default charset utf8 COMMENT '';

-- SECTION Favorite

CREATE TABLE
    Favorite(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Favorite ID',
        FOREIGN KEY(creatorId) REFERENCES accounts(id) ON DELETE CASCADE COMMENT 'Profile ID',
        FOREIGN KEY(recipeId) REFERENCES Recipe(id) ON DELETE CASCADE COMMENT 'Recipe ID',
    ) default charset utf8 COMMENT '';