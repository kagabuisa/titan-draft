SELECT ab.name, 
       Date_format(ab.posting_date, "%d-%m-%y") AS Date, 
       Date_format(ab.creation, "%d-%m-%y")     AS CreatedOn,
       Date_format(ab.creation, '%H:%i:%s')     AS CreatedTime,
       ab.transfer_type TransferType,
       aa.item_code, 
       aa.t_warehouse, 
       aa.s_warehouse, 
       aa.qty                              AS "Qty-Ordered", 
       aa.basic_rate, 
       ab.docstatus,
       ab.owner
FROM   `tabStock Entry Detail` aa 
       LEFT JOIN `tabStock Entry` ab 
         ON aa.parent = ab.name 
    LEFT JOIN tabItem`tab ab
on ab.item_code=   aa.item_code 
WHERE  ab.docstatus = 0 
       AND ( ab.transfer_type NOT LIKE "%warehouse%" 
              and ab.transfer_type NOT LIKE "DDR%" ) 
       #AND Date_format(ab.creation,'%H:%i:%s') >= "00:00:00"
       #AND Date_format(ab.creation,'%H:%i:%s') <= "07:00:00"
       #AND ab.creation >= (CURRENT_DATE)
       
ORDER  BY ab.posting_date DESC 
#LIMIT  1000 