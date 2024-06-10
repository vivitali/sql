# Assignment 1: Design a Logical Model

## Question 1

Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

## Question 2

We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.

## Question 3

The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._

Bonus: Are there privacy implications to this, why or why not?

```
Architecture 1 - Overwrite Changes:

For this architecture we can add 1-1 connection and just rewrite address for customer table will have following columns: AddressID (PK), CustomerID (FK), Street, City, State, ZipCode, Country. The address information is updated in place, overwriting the previous address. This approach is simpler and its easier. Obviously, part of address is a PII and has to be securely encrypted.


Architecture 2 - Retain Changes:

For this architecture we can add 1-1 connection and just rewrite address for customer table will have following columns:  Columns: AddressID (PK), CustomerID (FK), Street, City, State, ZipCode, Country, StartDate, EndDate, IsCurrent (Boolean)
Each change in address creates a new record with a date range indicating the period for which the address was valid. This approach retains historical data and allows tracking of address changes over time. we also have to encrypt PII data, same as in architecture 1 approach but here each client can have many historical items and all of them must be secured.

```

## Question 4

Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?

```
key differences:
 - Normalization and Complexity:
 The AdventureWorks schema is highly normalized and includes a significant number of tables to manage specific aspects of data (e.g., Product, ProductCategory, ProductDescription, ProductModel)
My Bookstore ERDis less normalized. E.g, the Book table in the bookstore ERD includes attributes like Title, Author, ISBN, Price, and StockQuantity all within one table, which simplifies the schema but can lead to redundancy

- data granularity and tracking
AdventureWorks tracks detailed information related to sales and production, including tables for SalesOrderDetail, SalesOrderHeader, SalesTerritory, ProductInventory, and WorkOrder. This level of detail allows to track  all transactions and inventory management.
My ERD use fewer tables sales tracking. In my case sales details are captured in a single Sales table linked to Orders and Books, but without separate tables for sales territories or detailed inventory tracking.

As a result I'd add few tables to increase normalization.
- Create a separate Author table to store author details and link it to the Book table through a foreign key.
- Add ProductCategory table to categorize books and link it to the Book table

Also we can separate Sales table in to 2 tables:SalesOrder, SalesOrderDetail to improve sales transactions management
```

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:

- Submission Due Date: `June 1, 2024`
- The branch name for your repo should be: `model-design`
- What to submit for this assignment:
  - This markdown (design_a_logical_model.md) should be populated.
  - Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
- What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
  - Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:

- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-3-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
