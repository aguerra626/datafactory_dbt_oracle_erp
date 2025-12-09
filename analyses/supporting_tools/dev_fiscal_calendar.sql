select cal.calendar_date,
       cal.next_date,
       cal.seq_num,
       cal.next_seq_num,
       case
          when cal.seq_num is null then
             cal.next_date -- If non-working day, then use next working day
          else
             cal.calendar_date
       end as "WORKING DATE",
       per.fiscal_month as "FISCAL MONTH",
       per.fiscal_year as "FISCAL YEAR",
       per.fiscal_quarter as "FISCAL QUARTER"
  from bom.bom_calendar_dates cal
  join (
   select to_date('30-DEC-2023') as start_date,
          to_date('31-DEC-2023') as end_date,
          'Jan24' as fiscal_month,
          2024 as fiscal_year,
          'Week 1' as fiscal_week,
          1 as fiscal_quarter
     from dual
   union all
   select start_date,
          end_date,
          entered_period_name as fiscal_month,
          period_year as fiscal_year,
          'Week ' || period_num as fiscal_week,
          quarter_num as fiscal_quarter
     from gl.gl_periods gp
    where period_set_name = 'BAE_FW'
      and start_date between '01-JAN-2023' and '01-JAN-2026'
) per
on cal.calendar_date between per.start_date and per.end_date
 where cal.calendar_code = 'NSS'
   and cal.calendar_date between '01-JAN-2023' and '01-JAN-2026'