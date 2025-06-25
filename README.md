# 🛒 Zepto Inventory & Pricing Analysis (SQL Project)

This project involves analyzing the inventory and pricing dataset of **Zepto**, a rapidly expanding 10-minute grocery delivery service in India. The dataset includes over **3,000+ SKUs (Stock Keeping Units)** across categories like **Fruits & Vegetables, Dairy, Beverages, Packaged Foods**, and more.

Using **PostgreSQL**, we performed data cleaning, exploration, and multiple business intelligence queries to derive actionable insights about product pricing, stock levels, and category-wise trends.

---

## 📦 Dataset Overview

- **Total SKUs**: 3,104  
- **Columns**: `sku_id`, `category`, `name`, `mrp`, `discountPercent`, `availableQuantity`, `discountedSellPrice`, `weightInGms`, `outOfStock`, `quantity`

---

## 🧹 Data Cleaning & Exploration

- ✅ **Null Check**: No null values found across critical columns.
- 🔄 **Zero Price Removal**: Removed 21 SKUs with `mrp` or `discountedSellPrice` equal to 0.
- 💱 **Unit Conversion**: Prices converted from *paise* to *rupees*.
- 🏷️ **Unique Categories**: 11  
- 📉 **Stock Status**:
  - In Stock: 2,612
  - Out of Stock: 471 (≈15.16%)
- 🔁 **Duplicate Product Names**: 112 names mapped to multiple SKUs.

---

## 📊 Business Analysis Queries & Insights

### 🔟 Top 10 Best Discounted Products
- Products with up to **60%+ discounts** across personal care and packaged items.

### 🚫 High MRP & Out-of-Stock Products
- 59 products with `MRP > ₹300` were unavailable.
- Highest observed MRP: ₹999.

### 💰 Estimated Revenue by Category

| Category            | Revenue (₹) |
|---------------------|-------------|
| Packaged Foods      | 1,14,230    |
| Beverages           | 91,890      |
| Fruits & Vegetables | 85,140      |
| Dairy               | 77,500      |
| Personal Care       | 61,380      |

### 🧾 Premium Products with Low Discounts
- 48 products with `MRP > ₹500` and `<10%` discount, typically premium goods.

### 📉 Top 5 Categories by Avg. Discount

| Category          | Avg. Discount (%) |
|-------------------|-------------------|
| Personal Care     | 26.4              |
| Beverages         | 23.1              |
| Snacks            | 21.7              |
| Cleaning Supplies | 20.9              |
| Dairy             | 18.3              |

### ⚖️ Best Value Products (₹ per gram)
- Price efficiency calculated for products above 100g.
- Best value product: ₹0.07/g (e.g. rice, sugar, detergent).

### 🏷️ Product Weight Category

| Weight Category | Count |
|------------------|-------|
| Low (<1kg)       | 1,876 |
| Medium (1–5kg)   | 845   |
| Bulk (>5kg)      | 215   |

### 🏋️ Total Inventory Weight by Category

| Category            | Total Weight (kg) |
|---------------------|-------------------|
| Packaged Foods      | 7,140             |
| Fruits & Vegetables | 5,410             |
| Dairy               | 3,860             |
| Beverages           | 2,970             |
| Personal Care       | 2,115             |

---

## 🛠 Tech Stack

- **Database**: PostgreSQL 16
- **Tools**: Git, GitHub, Git Bash
- **Language**: SQL (PostgreSQL dialect)

