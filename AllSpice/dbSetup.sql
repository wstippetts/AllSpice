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
    Recipes(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Recipe ID',
        title: VARCHAR(100) NOT NULL COMMENT 'Recipe Title',
        instructions: VARCHAR(1000) NOT NULL COMMENT 'instructions',
        img: VARCHAR(500) NOT NULL COMMENT 'image link',
        category: VARCHAR(100) NOT NULL COMMENT 'Food category',
        creatorId: VARCHAR(100) NOT NULL COMMENT 'Creator ID',
        FOREIGN KEY(creatorId) REFERENCES accounts(id) ON DELETE CASCADE COMMENT 'Creator ID'
    ) default charset utf8 COMMENT '';

-- SECTION Ingredient

CREATE TABLE
    Ingredients(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Ingredient ID',
        name: VARCHAR(100) NOT NULL COMMENT 'Ingredient Title',
        quantity: VARCHAR(100) NOT NULL COMMENT 'Quantity',
        creatorId: VARCHAR (100) NOT NULL COMMENT 'Creator ID',
        recipeId: VARCHAR(100) NOT NULL COMMENT 'RecipeId',
        FOREIGN KEY(creatorId) REFERENCES accounts(id) ON DELETE CASCADE COMMENT 'Profile ID',
        FOREIGN KEY(recipeId) REFERENCES Recipe(id) ON DELETE CASCADE COMMENT 'Recipe ID'
    ) default charset utf8 COMMENT '';

-- SECTION Favorite

CREATE TABLE
    Favorites(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Favorite ID',
        recipeId INT NOT NULL COMMENT 'Recipe ID',
        accountId VARCHAR(150) NOT NULL COMMENT 'Profile ID',
        FOREIGN KEY(creatorId) REFERENCES accounts(id) ON DELETE CASCADE COMMENT 'Profile ID',
        FOREIGN KEY(recipeId) REFERENCES Recipe(id) ON DELETE CASCADE COMMENT 'Recipe ID'
    ) default charset utf8 COMMENT '';