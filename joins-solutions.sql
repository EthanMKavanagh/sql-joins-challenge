-- 1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses"
ON "customers"."id" = "addresses"."customer_id";

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders"
JOIN "line_items"
ON "orders"."id" = "line_items"."order_id"
JOIN "products"
ON "line_items"."product_id" = "products"."id";

-- 3. Which warehouses have cheetos?
SELECT * FROM "warehouse"
JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products"
ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."id" = 5;

-- 4. Which warehouses have diet pepsi?
SELECT * FROM "warehouse"
JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products"
ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."id" = 6;

-- 5. Get the number of orders for each customer. 
--    NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."last_name", COUNT("orders"."id")
FROM "orders"
JOIN "addresses"
ON "orders"."address_id" = "addresses"."id"
JOIN "customers"
ON "addresses"."customer_id" = "customers"."id"
GROUP BY "customers"."last_name";

-- 6. How many customers do we have?
SELECT COUNT(*) FROM "customers";

-- 7. How many products do we carry?
SELECT COUNT(*) FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product"."on_hand") FROM "warehouse_product"
WHERE "product_id" = 6;

--STRETCH GOALS
-- 9. How much was the total cost for each order?
-- SOMETHING CLOSER TO THIS, STILL NOT CORRECT THOUGH
-- SELECT "orders"."id", COUNT("line_items"."quantity"),SUM("products"."unit_price") FROM "orders"
-- JOIN "line_items"
-- ON "orders"."id" = "line_items"."order_id"
-- JOIN "products"
-- ON "line_items"."product_id" = "products"."unit_price"
-- GROUP BY "orders"."id";

-- 10. How much has each customer spent in total?


-- 11. How much has each customer spent in total? 
--     Customers who have spent $0 should still show up in the table. 
--     It should say 0, not NULL (research coalesce).

