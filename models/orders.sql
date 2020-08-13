with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payment as (

    select * from {{ ref('stg_stripe_payment') }}

)

select

orders.customer_id,
orders.order_id,
orders.order_date,
orders.status as order_status,
payment.amount

from

orders

left join customers using (customer_id)

left join payment using (order_id)