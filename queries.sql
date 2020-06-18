/*insert operation
user inputs a username and a user id is automatically generated*/
insert into my_user(user_name) values(username);

/* delete operation
user chooses which wishlist from the GUI*/
delete from wishlist where wishlist_id = listId ;

/*update operation
user types in a name and it will update after clicking button*/
update wishlist set wishlist_name = _ where wishlist_id = listId;

/*select operation
user chooses minimum sell price and we will filter the current selected wishlist*/
select * from item 
where item.sell_price > 1000 
and item.item_id in 
(select item_id from wishlist_item
where wishlist_item.list_id = 1 
AND item.item_id = wishlist_item.item_id);

/*projection operation
user chooses which columns to hide from item view 
(our code replaces the * with the columns that the user wants) */
select * from item;

/*join query
we diplay the item details of the items in the wishlist*/
SELECT * 
FROM item 
JOIN wishlist_item 
ON item.item_id = wishlist_item.item_id 
JOIN wishlist ON wishlist.wishlist_id = 1
AND wishlist.wishlist_id = wishlist_item.list_id;

/*aggregation query
we count the total number of items in the current selected wishlist*/
SELECT COUNT(*) FROM item 
JOIN wishlist_item ON item.item_id = wishlist_item.item_id 
AND wishlist_item.list_id = 1;

/*nested aggregation with group-by
from the selected wishlist, we group by the materials needed
and sum the total materials needed to make everything in the wishlist*/
select  mi.item_name, sum(quantity)from item i
join craftable_item c on c.item_id = i.item_id
join diy_recipe_uses_item u on u.diy_id = c.diy_id
join item mi on u.item_id = mi.item_id
join wishlist_item on i.item_id = wishlist_item.item_id
AND wishlist_item.list_id = 1
GROUP BY (mi.item_name);

/*division query
selects the items that are in ALL the wishlists*/
SELECT DISTINCT i.item_id AS item_id 
from item i
WHERE NOT EXISTS 
	(select * FROM wishlist w
	 WHERE w.user_id = 1 AND NOT EXISTS (SELECT wi.item_id FROM wishlist_item wi
     WHERE w.wishlist_id = wi.list_id AND wi.item_id = i.item_id));
