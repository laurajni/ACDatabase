-- drop table item_series;

CREATE TABLE item_series (
item_series_id INTEGER,
series_name CHAR(10) NOT NULL UNIQUE,
PRIMARY KEY (item_series_id)
);

CREATE TABLE item (
item_id INTEGER,
item_name CHAR(15) NOT NULL UNIQUE,
obtains CHAR(30),
item_size CHAR(3),
item_series_id INTEGER,
sell_price INTEGER,
PRIMARY KEY (item_id),
FOREIGN KEY (item_series_id) REFERENCES item_series(item_series_id)
 ON DELETE SET NULL
);

CREATE TABLE color (
color_id INTEGER,
color CHAR(10),
PRIMARY KEY (color_id)
);

CREATE TABLE furniture (
furniture_id INTEGER,
item_category CHAR(3),
-- (WPP)wallpaper, (FLR)flooring, (RUG)rug, (WIT)wall_item, (FIT)floor_item
PRIMARY KEY (furniture_id),
FOREIGN KEY (furniture_id) REFERENCES item(item_id)
 ON DELETE CASCADE
);

CREATE TABLE item_color (
item_id INTEGER,
color_id INTEGER,
PRIMARY KEY (item_id, color_id),
FOREIGN KEY (item_id) REFERENCES furniture(furniture_id)
 ON DELETE CASCADE,
FOREIGN KEY (color_id) REFERENCES color(color_id)
 ON DELETE CASCADE
);

CREATE TABLE critter (
critter_id INTEGER,
critter_name CHAR(20) NOT NULL UNIQUE,
showup_time CHAR(10),
showup_place CHAR(20),
critter_type CHAR(1),
PRIMARY KEY (critter_id),
FOREIGN KEY (critter_id) REFERENCES item(item_id)
 ON DELETE CASCADE
);

CREATE TABLE critter_time (
critter_id INTEGER,
hemisphere CHAR(1),
month CHAR(3),
PRIMARY KEY (critter_id, hemisphere, month),
FOREIGN KEY (critter_id) REFERENCES critter (critter_id)
ON DELETE CASCADE
);

CREATE TABLE clothing (
clothing_id INTEGER,
clothing_type CHAR(3),
PRIMARY KEY (clothing_id),
FOREIGN KEY (clothing_id) REFERENCES item(item_id)
 ON DELETE CASCADE
);

CREATE TABLE npc (
npc_id INTEGER,
npc_name CHAR(10) NOT NULL UNIQUE,
gender CHAR(1),
species CHAR(10),
PRIMARY KEY (npc_id)
);

CREATE TABLE buyable_item (
item_id INTEGER,
buy_price INTEGER,
npc_id INTEGER,
PRIMARY KEY (item_id),
FOREIGN KEY (item_id) REFERENCES item(item_id)
 ON DELETE CASCADE,
FOREIGN KEY (npc_id) REFERENCES npc(npc_id)
);

CREATE TABLE sp_event (
event_id INTEGER,
event_name CHAR(20),
 event_description CHAR(100),
PRIMARY KEY (event_id)
);

CREATE TABLE diy_recipe (
diy_id INTEGER,
item_id INTEGER,
diy_name CHAR(20) NOT NULL UNIQUE,
season CHAR(1) DEFAULT '1',
event_id INTEGER,
PRIMARY KEY (diy_id),
FOREIGN KEY (item_id) REFERENCES item(item_id)
 ON DELETE CASCADE,
FOREIGN KEY (event_id) REFERENCES sp_event(event_id)
);

CREATE TABLE craftable_item (
item_id INTEGER,
diy_id INTEGER,
PRIMARY KEY (item_id),
FOREIGN KEY (item_id) REFERENCES item(item_id)
 ON DELETE CASCADE,
FOREIGN KEY (diy_id) REFERENCES diy_recipe(diy_id)
 ON DELETE CASCADE
);



CREATE TABLE diy_recipe_uses_item (
diy_id INTEGER,
item_id INTEGER,
quantity INTEGER,
PRIMARY KEY (diy_id,item_id),
FOREIGN KEY (diy_id) REFERENCES diy_recipe(diy_id),
FOREIGN KEY (item_id) REFERENCES item(item_id)
);



CREATE TABLE villager (
villager_id INTEGER,
personality CHAR(10),
birthday DATE,
PRIMARY KEY (villager_id),
FOREIGN KEY (villager_id) REFERENCES npc(npc_id)
 ON DELETE CASCADE
);

CREATE TABLE seller (
seller_id INTEGER,
seller_time DATE,
PRIMARY KEY (seller_id),
FOREIGN KEY (seller_id) REFERENCES npc(npc_id)
 ON DELETE CASCADE
);

CREATE TABLE special_npc (
npc_id INTEGER,
task CHAR(100),
event_id INTEGER,
PRIMARY KEY (npc_id),
FOREIGN KEY (npc_id) REFERENCES npc(npc_id)
 ON DELETE CASCADE,
FOREIGN KEY (event_id) REFERENCES sp_event(event_id)
);



CREATE TABLE event_time(
event_id INTEGER,
hemisphere CHAR(1),
start_date DATE,
end_date DATE,
PRIMARY KEY (event_id, hemisphere),
FOREIGN KEY (event_id) REFERENCES sp_event(event_id)
ON DELETE CASCADE
);

CREATE TABLE event_drop_recipe (
event_id INTEGER,
diy_id INTEGER,
PRIMARY KEY (event_id,diy_id),
FOREIGN KEY (event_id) REFERENCES sp_event(event_id),
FOREIGN KEY (diy_id) REFERENCES diy_recipe(diy_id)
);

CREATE TABLE npc_gift (
npc_id INTEGER,
diy_id INTEGER,
note CHAR(50),
PRIMARY KEY (npc_id,diy_id),
FOREIGN KEY (npc_id) REFERENCES npc(npc_id),
FOREIGN KEY (diy_id) REFERENCES diy_recipe(diy_id)
);

CREATE TABLE my_user (
user_id INTEGER AUTO_INCREMENT,
user_name CHAR(20),
PRIMARY KEY (user_id)
);

CREATE TABLE wishlist (
wishlist_id INTEGER,
wishlist_name CHAR(20),
user_id INTEGER,
PRIMARY KEY (wishlist_id),
FOREIGN KEY (user_id) REFERENCES my_user(user_id)
 ON DELETE CASCADE
);

CREATE TABLE wishlist_item (
list_id INTEGER,
item_id INTEGER,
PRIMARY KEY (list_id,item_id),
FOREIGN KEY (list_id) REFERENCES wishlist(wishlist_id)
 ON DELETE CASCADE,
FOREIGN KEY (item_id) REFERENCES item(item_id)
);