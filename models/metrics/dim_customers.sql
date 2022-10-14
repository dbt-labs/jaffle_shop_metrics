version: 2

metrics:
  - name: revenue
    label: Revenue
    model: ref('orders')
    description: "The total revenue of our jaffle business"

    type: sum
    sql: amount

    timestamp: order_date
    time_grains: [day, week, month, year]

    dimensions:
      - customer_status
      - has_coupon_payment
      - has_bank_transfer_payment
      - has_credit_card_payment
      - has_gift_card_payment

    filters:
      - field: status
        operator: '='
        value: "'completed'"