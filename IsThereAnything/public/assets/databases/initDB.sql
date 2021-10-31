-- Primary table
create table if not exists Product (
    idProduct integer primary key autoincrement,
    nameProd varchar not null unique,
    unit varchar,
    lifetime integer
);

create table if not exists Stock (
    idStock integer primary key autoincrement,
    nameStock varchar not null unique
);

create table if not exists Recipe (
    idRecipe integer primary key autoincrement,
    nameRecipe varchar not null unique,
    instruction varchar,
    recipeType varchar not null,
    foreign key(recipeType) references RecipeType(recipeType)
);

create table if not exists ShoppingList (
    idShoppingList integer primary key autoincrement,
    nameShoppingList varchar unique not null,
    idStock integer not null,
    foreign key (idStock) references Stock(idStock)
);

-- Enum table
create table if not exists RecipeType (
    recipeType varchar primary key
);

create table if not exists Category (
    idCategory integer primary key autoincrement,
    nameCateg varchar not null unique
);

-- Association table
create table if not exists Use (
    idRecipe integer not null,
    idProduct integer not null,
    quantity float not null,
    primary key (idRecipe, idProduct),
    foreign key (idRecipe) references Recipe(idRecipe),
    foreign key (idProduct) references Product(idProduct)
);

create table if not exists Contain (
    idProduct integer not null,
    idStock integer not null,
    expDate date default null,
    idCategory integer default null,
    quantity float not null,
    primary key (idProduct, idStock, expDate),
    foreign key (idProduct) references Product(idProduct),
    foreign key (idStock) references Stock(idStock),
    foreign key (idCategory) references Category(idCategory)
);

create table if not exists Item (
    idProduct integer not null,
    idShoppingList integer not null,
    quantity float not null,
    picked boolean not null default 0,
    primary key (idProduct, idShoppingList),
    foreign key (idProduct) references Product(idProduct),
    foreign key (idShoppingList) references ShoppingList(idShoppingList)
);

-- Fill table
-- RecipeType
insert into RecipeType (recipeType) values
    ('ENTREE'),
    ('PLAT'),
    ('DESSERT'),
    ('SNACK'),
    ('BOISSON');

-- Default Categories
insert into Category (nameCateg) values
    ('Fruit & Légume'),
    ('Viande'),
    ('Poisson'),
    ('Féculent'),
    ('Produit ménager'),
    ('Condiment'),
    ('Produit laitier');

-- Default product
insert into Product (nameProd, unit, lifetime) values
    ("Sucre", 'g', null),
    ("Sel", 'g', null),
    ("Miel", 'g', null),
    ("Vinaigre", 'cl', null),
    ("Huile d'olive", 'cl', 730),
    ("Farine", 'g', 365),
    ("Cornichon", 'g', 365),
    ("Lentille", 'g', null),
    ("Chocolat", 'g', 365),
    ("Banane", null, 7),
    ("Avocat", null, 5),
    ("Melon", null, 5),
    ("Mirabelle", 'g', 7),
    ("Nectarine", null, 5),
    ("Pêche", null, 5),
    ("Poire", null, 14),
    ("Prune", null, 5),
    ("Abricot", null, 7),
    ("Papaye", null, 7),
    ("Tomate", null, 14),
    ("Orange", null, 14),
    ("Mandarine", null, 14),
    ("Pamplemousse", null, 14),
    ("Pomme", null, 20),
    ("Kiwi", null, 14),
    ("Mangue", null, 7),
    ("Asperge", 'g', 7),
    ("Brocoli", 'g', 4),
    ("Champignon", 'g', 7),
    ("Endive", 'g', 5),
    ("Epinard", 'g', 5),
    ("Haricot vert", 'g', 6),
    ("Salade verte", 'g', 6),
    ("Aubergine", null, 8),
    ("Chou fleur", null, 8),
    ("Concombre", null, 8),
    ("Poivron", null, 8),
    ("Courgette", null, 8),
    ("Radis", null, 8),
    ("Céleri", null, 14),
    ("Poireau", null, 14),
    ("Betterave", 'g', 21),
    ("Chou", null, 21),
    ("Oignon", null, 21),
    ("Carotte", null, 90),
    ("Oeuf", null, 30),
    ("Beurre", 'g', null),
    ("Lait", 'L', 45),
    ("Emmental", 'g', null),
    ("Comté", 'g', null),
    ("Chèvre", 'g', null),
    ("Camembert", 'g', null),
    ("Coulommiers", 'g', null),
    ("Roquefort", 'g', null),
    ("Saint-Nectaire", 'g', null),
    ("Cantal", 'g', null),
    ("Fourme d'Ambert", 'g', null),
    ("Beaufort", 'g', null),
    ("Bleu d'Auvergne", 'g', null),
    ("Reblochon", 'g', null),
    ("Tomme de Savoie", 'g', null),
    ("Brie", 'g', null);
