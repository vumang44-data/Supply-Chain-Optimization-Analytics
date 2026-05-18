CREATE DATABASE supply_chain_analytics;
USE supply_chain_analytics;
CREATE TABLE supply_chain_data (
    product_type VARCHAR(50),
    sku VARCHAR(50),
    price FLOAT,
    availability INT,
    products_sold INT,
    revenue_generated FLOAT,
    customer_demographics VARCHAR(50),
    stock_levels INT,
    lead_times INT,
    order_quantities INT,
    shipping_times INT,
    shipping_carriers VARCHAR(50),
    shipping_costs FLOAT,
    supplier_name VARCHAR(100),
    location VARCHAR(100),
    lead_time INT,
    production_volumes INT,
    manufacturing_lead_time INT,
    manufacturing_costs FLOAT,
    inspection_results VARCHAR(50),
    defect_rates FLOAT,
    transportation_modes VARCHAR(50),
    routes VARCHAR(50),
    costs FLOAT,
    estimated_profit FLOAT,
    profit_margin_pct FLOAT,
    inventory_turnover FLOAT,
    supply_chain_efficiency FLOAT,
    supplier_risk VARCHAR(50),
    inventory_status VARCHAR(50),
    cost_per_unit_sold FLOAT
);
SELECT COUNT(*) FROM supply_chain;
USE supply_chain_analytics;
SHOW TABLES;
USE supply_chain_analytics;
SHOW TABLES;
SELECT COUNT(*) FROM supply_chain;
SELECT * FROM supply_chain;
/* Most Prifitable product */
SELECT
    product_type,
    ROUND(SUM(estimated_profit),2) AS total_profit
FROM supply_chain
GROUP BY product_type
ORDER BY total_profit DESC;
-- Why skincare is most profitable --
-- Sales Volume by product
SELECT
    product_type,
    SUM(products_sold) AS total_products_sold
FROM supply_chain
GROUP BY product_type
ORDER BY total_products_sold DESC;
-- here also skincare is highest product_sold--

SELECT
    product_type,
    ROUND(AVG(price),2) AS avg_price
FROM supply_chain
GROUP BY product_type
ORDER BY avg_price DESC;
-- here cosmetics has avg.price higher than skincare --

SELECT
    product_type,
    ROUND(AVG(manufacturing_costs),2) AS avg_manufacturing_cost
FROM supply_chain
GROUP BY product_type
ORDER BY avg_manufacturing_cost ASC;
-- here cosmetics avg_manufacturing price is higher --

SELECT
    product_type,
    ROUND(AVG(defect_rates),2) AS avg_defect_rate
FROM supply_chain
GROUP BY product_type
ORDER BY avg_defect_rate ASC;

-- Cosmetics has highest avg_defect_rate--

-- Business Insights --
-- Skincare products generated the highest profitability due to
-- stronger sales volume and better operational efficiency.
-- Although cosmetics achieved premium pricing, higher manufacturing.
-- costs and defect rates reduced overall profitability margins.





/* Supplier Risk Analysis */
SELECT
    supplier_name,
    ROUND(AVG(defect_rates),2) AS avg_defect_rate
FROM supply_chain
GROUP BY supplier_name
ORDER BY avg_defect_rate DESC;

-- Supplier 5 has highest avg_defect_rate.

SELECT
    supplier_name,
    ROUND(AVG(manufacturing_costs),2) AS avg_manufacturing_cost
FROM supply_chain
GROUP BY supplier_name
ORDER BY avg_manufacturing_cost DESC;
-- Supplier 4 has highest avg_manufacturing_cost

SELECT
    supplier_name,
    ROUND(AVG(lead_time),2) AS avg_lead_time
FROM supply_chain
GROUP BY supplier_name
ORDER BY avg_lead_time DESC;
-- Supplier 3 has highest avg_lead_time

SELECT
    supplier_name,
    ROUND(AVG(supply_chain_efficiency),2) AS avg_efficiency
FROM supply_chain
GROUP BY supplier_name
ORDER BY avg_efficiency ASC;
-- supplier 4 had lowest avg_operational_efficiency.

SELECT
    supplier_name,
    ROUND(AVG(production_volumes),2) AS avg_production_volume
FROM supply_chain
GROUP BY supplier_name
ORDER BY avg_production_volume DESC;
-- Suplier 2 has highest avg_production_volume.

-- Business Insight:
-- Operational risks are distributed across multiple suppliers.
-- Supplier5 showed elevated defect rates indicating quality risks,
-- Supplier4 demonstrated high manufacturing costs and low efficiency,
-- Supplier3 exhibited extended lead times causing potential delays,
-- while Supplier2 handled the highest production volume,
-- indicating scalability and operational capacity pressures.




/* Transportation Cost */
SELECT
    transportation_modes,
    ROUND(AVG(shipping_costs),2) AS avg_shipping_cost
FROM supply_chain
GROUP BY transportation_modes
ORDER BY avg_shipping_cost DESC;
-- Air show highest avg_shipping_cost

SELECT
    transportation_modes,
    ROUND(AVG(shipping_times),2) AS avg_shipping_time
FROM supply_chain
GROUP BY transportation_modes
ORDER BY avg_shipping_time ASC;
-- Road show lowest avg_shipping_time

SELECT
    transportation_modes,
    ROUND(AVG(supply_chain_efficiency),2) AS avg_efficiency
FROM supply_chain
GROUP BY transportation_modes
ORDER BY avg_efficiency DESC;
-- Sea has highest avg_efficiency

-- Transportation Analysis Insight:
-- Air transportation generated the highest shipping costs
-- without corresponding improvements in delivery speed
-- or operational efficiency. Road transportation showed
-- the fastest delivery performance 
-- while sea transportation achieved the highest operational efficiency, 
-- indicating opportunities for transportation strategy optimization.



/* Inventory Risk Analysis */
SELECT
    inventory_status,
    COUNT(*) AS total_products
FROM supply_chain
GROUP BY inventory_status;
-- Sufficient Stock is 73, Low stock is 26

SELECT
    product_type,
    inventory_status,
    SUM(products_sold) AS total_products_sold
FROM supply_chain
GROUP BY product_type, inventory_status
ORDER BY total_products_sold DESC;
-- skincare is highest total_product_stock in inventory_status sufficient Stock.

SELECT
    product_type,
    ROUND(AVG(inventory_turnover),2) AS avg_inventory_turnover
FROM supply_chain
GROUP BY product_type
ORDER BY avg_inventory_turnover DESC;
-- skincare has highest avg_inventory_turnover.

-- Inventory Analysis Insight:
-- Skincare products demonstrated the highest inventory turnover
-- while maintaining sufficient stock availability, indicating
-- effective inventory planning and strong alignment between
-- customer demand and replenishment operations.


/* Route Performance Analysis */
SELECT
    routes,
    ROUND(AVG(shipping_times),2) AS avg_shipping_time
FROM supply_chain
GROUP BY routes
ORDER BY avg_shipping_time DESC;
-- Route A is taking highest avg_shipping_time

SELECT
    routes,
    ROUND(AVG(shipping_costs),2) AS avg_shipping_cost
FROM supply_chain
GROUP BY routes
ORDER BY avg_shipping_cost DESC;
-- Route C has highest shipping_cost

SELECT
    routes,
    ROUND(AVG(supply_chain_efficiency),2) AS avg_efficiency
FROM supply_chain
GROUP BY routes
ORDER BY avg_efficiency DESC;
-- Route C has highest avg_efficiency

-- Route Performance Analysis Insight:
-- Route A demonstrated the highest shipping time,
-- indicating potential logistics bottlenecks and slower
-- delivery responsiveness. Route C generated the highest
-- shipping costs but also achieved the highest operational
-- efficiency, suggesting that higher transportation expenses
-- may be justified by improved logistics performance

