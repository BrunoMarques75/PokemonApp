create schema pokemon;

create table pokemonCharacter(
id_pokemonCharacter int not null unique auto_increment,
pokemonCharacter_name varchar(255) not null,
total int not null,
hp int not null,
attack int not null,
defense int not null,
spAtk int not null, 
spDef int not null,
speed int not null,
generation int not null,
legendary boolean not null,
primary key (id_pokemonCharacter)
);

create table pokemonType(
id_type int not null unique auto_increment,
type_desc varchar(255) not null,
primary key (id_type)
);

create table pokemonTypeLevel(
type_level int,
pokemonCharacter_id int,
type_id int,
foreign key (pokemonCharacter_id) references pokemonCharacter(id_pokemonCharacter),
foreign key (type_id) references pokemonType(id_type)
);



insert into pokemonCharacter(pokemonCharacter_name, total, hp, attack, defense, spAtk, spDef, speed, generation, legendary)
select distinct `Name`,`Total`,`HP`,`Attack`,`Defense`,`Sp. Atk`,`Sp. Def`,`Speed`,`Generation`,`Legendary`
from pokemon_import_data;

select * from pokemontype;
insert into pokemontype (type_desc)
select distinct `Type 1` from pokemon_import_data ;


select '1', pokemoncharacter.id_pokemonCharacter, pokemontype.id_type
from pokemon_import_data 
inner join pokemonCharacter on  (pokemon_import_data.id = pokemonCharacter.id_pokemonCharacter)
inner join pokemontype on (pokemontype.type_desc = pokemon_import_data.`Type 1`);