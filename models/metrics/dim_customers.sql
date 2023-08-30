version: 2

metrics:
  - name: revenue
    label: Revenue
    model: ref('orders')
    description: "The total revenue of our jaffle business"

<<<<<<< HEAD:models/metrics/dim_customers.sql
    type: sum
    sql: amount
=======
    calculation_method: sum
    expression: amount 
>>>>>>> 933bef9853ff959b7a1962ea26a297abefdda03e:models/marts/revenue.yml

    timestamp: order_date
    time_grains: [day, week, month, year]

    dimensions:
      - customer_status
      - had_credit_card_payment
      - had_coupon_payment
      - had_bank_transfer_payment
      - had_gift_card_payment

    filters:
      - field: status
        operator: '='
        value: "'completed'"
