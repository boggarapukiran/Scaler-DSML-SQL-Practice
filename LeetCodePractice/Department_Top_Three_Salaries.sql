# Write your MySQL query statement below
with final as 
        (
        select 
        d.name as Department,
        e.name Employee,
        salary,
        dense_rank() over(partition by d.id order by (salary) desc) as sal_rank
        from
        employee e
        join department d
        on e.departmentId = d.id
        )
    select
    Department,
    Employee,
    Salary
    from
    final
    where sal_rank <=3
