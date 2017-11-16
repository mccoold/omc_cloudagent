DECLARE
        file1 utl_file.file_type;
        orderidutil number;
BEGIN
        select (max(order_seq_id)/4000000)*100 into ordermgmt.orderidutil from OM_ORDER_HEADER;

        file1:= utl_file.fopen('ODOENGINE','odoengine_capacity.values','a');
utl_file.put_line(file1,'orderidpctused='||round(orderidutil,2));
        utl_file.fclose(file1);
END;
/
exit;
