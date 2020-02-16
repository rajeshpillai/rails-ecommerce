User (username, password)

Category (name, description, parent_category_id)

Product (name, description, sku, type=>digital)

ProductCategory(product_id, category_id)

Tag (name)

Review (product_id, user_id, title, body)

ProductTags (product_id, tag_id)

Order (order_id, order_date, user_id,order_total)

OrderDetail(order_id, product_id, sku, unit_price, quantity, sub_total)

Transactions(order_id, tran_date, processor, amount)

