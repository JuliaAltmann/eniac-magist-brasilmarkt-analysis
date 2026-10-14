# eniac-magist-brasilmarkt-analysis
SQL-driven market entry analysis of Brasil for Eniac throught Magist, supported by Tableau visualizations and business recommendations.

## Project Overview

This project investigates whether Eniac, a company positioned in the premium technology segment, should enter the Brazilian market through Magist, an e-commerce logistics and marketplace service provider.

The analysis combines SQL queries, Tableau visualizations, and business research to evaluate Magist's product-category revenue, order trends, delivery performance, and compatibility with Enica's product portfolio.

The final objective is to determine whether Magist is a suitable partner for Enica's potential expansion into Brazil.

## Business Question

**Should Eniac enter the Brazilian market through Magist?**

## Project Objectives

- Analyze the share of technology products in Magist's overall revenue.

- Identify the technology product categories contributing most to revenue.

- Examine revenue trends over the available observation period.

- Compare Magist's product prices with Eniac's premium positioning.

- Consider delivery performance and operational risks.

- Develop a data-informed recommendation for market entry.

## Tools and Technologies

- **SQL** — data exploration, filtering, joins, aggregations, and business analysis.

- **Tableau** — dashboard development and data visualization.

- **Google Slides** — presentation of findings and business recommendations.

- **GitHub** — version control and portfolio documentation.

## Key Findings

### 1. Technology Products Represent a Relevant but Limited Share of Revenue

Technology products account for approximately **12.34% of Magist's total revenue**, representing around **€441,000** in the analyzed dataset.

This indicates that technology products contribute meaningfully to Magist's business, but they represent only part of its overall product mix.

### 2. Computer Accessories Are the Leading Technology Category

Approximately **50% of Magist's technology-product revenue** comes from the `computers_accessories` category.

This suggests that computer accessories are an important category to consider when evaluating product-market fit. However, category-level revenue alone does not establish demand for Eniac's specific premium products.

### 3. Technology Revenue Increased Before Declining

The time-series visualization shows an overall increase in technology-product revenue during much of the observation period, followed by a decline beginning around March 2018.

The decline is a relevant business signal, but the available chart does not establish its cause. Additional analysis would be required to distinguish temporary external disruptions from structural changes in demand or operations.

### 4. Magist's Price Levels Differ Significantly from Eniac's Positioning

The presentation compares average prices of approximately **€69 for Magist's technology products** with an average Eniac product price of approximately **€540**.

Eniac's products are therefore positioned at a substantially higher price level.

This difference raises questions about whether Magist's customer base, product mix, and commercial model are suitable for Eniac's premium portfolio. Further research into customer segments, purchasing power, and willingness to pay would be required.

### 5. Operational and Strategic Fit Remain Key Concerns

The final presentation identifies two concerns regarding Magist:

- Delivery performance may not meet the requirements of Eniac's target customers.

- Magist may not be the best fit for Eniac's premium technology products.

These concerns should be evaluated alongside the quantitative findings before selecting a market entry partner.

## Final Business Recommendation

**Recommendation: Explore the Brazilian market, but do not prioritize Magist as Eniac's entry partner. Evaluate Mercado Livre as an alternative.**

The analysis suggests that technology products already generate revenue through Magist. However, the relatively low average product prices compared with Eniac's portfolio raise concerns about product-market fit.

The presentation also identifies delivery performance as a potential operational constraint.

Mercado Livre is proposed as an alternative to investigate, not as a proven superior option. A final partner selection should be supported by comparable evidence on delivery performance, fees, customer demographics, premium-product demand, and expected profitability.

## Analytical Approach

1. **Data Exploration:** Review the available dataset and identify relevant tables and fields.

2. **SQL Analysis:** Query the data to investigate product categories, revenue, orders, and other relevant indicators.

3. **Performance Assessment:** Examine revenue composition, category contributions, and trends over time.

4. **Price Comparison:** Compare Magist's observed technology-product prices with Eniac's product positioning.

5. **Visualization:** Present the findings through Tableau dashboards and charts.

6. **Business Evaluation:** Combine the quantitative results with operational considerations to formulate a recommendation.

## Project Deliverables

### SQL Analysis

The SQL script contains the queries used to investigate Magist's technology-product revenue, category performance, and business indicators.

- [Open SQL Script](./MAGIST%20sql-queries%20datei%20analysis.sql)

### Tableau Analysis

The Tableau folder contains dashboard screenshots and the packaged workbook.

- [Tableau Analysis and Visualizations](./tableau/README.md)

- [Download Tableau Workbook (.twbx)](./tableau/eniac-magist-analysis.twbx)

### Business Presentation

The presentation summarizes the key findings, price comparison, operational concerns, and final market entry recommendation.

- [View Presentation (PDF)](./Presentation%20Analysis%20Magist.pdf)

- [View Google Slides Presentation]([YOUR_GOOGLE_SLIDES_URL](https://docs.google.com/presentation/d/1Ql4WPQs_ER1RDQyGQs8WEMHZGcJe4L3f4vPDTF8vhTA/edit?usp=sharing))

## Limitations

The analysis is based on the available dataset and the assumptions applied during the investigation.

The findings describe observed business and operational indicators; they do not independently establish total Brazilian market demand, customer willingness to pay for Enica's products, or the profitability of market entry.

The comparison between Magist's average technology-product prices and Eniac's average product price should be interpreted cautiously because the products, categories, and pricing structures may differ.

The observed revenue decline does not, by itself, prove a specific cause.

Mercado Livre is an alternative proposed for further investigation. Its suitability has not been established without a comparable assessment of commercial terms, customer segments, delivery performance, and expected profitability.

## Author

I am an aspiring Data Analyst developing practical skills in data analysis, SQL, Tableau, and data-driven business decision-making.

This project demonstrates my ability to investigate a business question, analyze data, create visualizations, and translate analytical findings into actionable business recommendations.

Skills demonstrated: SQL · Data Analysis · Tableau · Data Visualization · Business Analysis

Professional Profiles:

[GitHub Profile](https://github.com/JuliaAltmann)
