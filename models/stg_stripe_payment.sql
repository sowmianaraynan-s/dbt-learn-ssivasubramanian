
    select 

    orderid as order_id,
    sum(amount/100) as amount

    from raw.stripe.payment

    where status = 'success'

    group  by 1