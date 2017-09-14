DECLARE
        file1 utl_file.file_type;
        p1_max number;
        p2_max number;
        p3_max number;
        p4_max number;
        orderidutil number;
BEGIN
        select max(order_seq_id) into p1_max from OM_ORDER_HEADER partition(P_000000000001000001);
        select max(order_seq_id) into p2_max from OM_ORDER_HEADER partition(P_000000000002000001);
        select max(order_seq_id) into p3_max from OM_ORDER_HEADER partition(P_000000000003000001);
        select max(order_seq_id) into p4_max from OM_ORDER_HEADER partition(P_000000000004000001);

        IF (P4_MAX > 0) THEN
        orderidutil := 75 + ((( P4_MAX - 4000000 ) / 1000000 ) * 100 );
        ELSIF (P3_MAX > 0) THEN
        orderidutil := 50 + ((( P3_MAX - 3000000 ) / 1000000 ) * 100 );
        ELSIF (P2_MAX > 0) THEN
        orderidutil := 25 + ((( P2_MAX - 2000000 ) / 1000000 ) * 100 );
        ELSE
        orderidutil := ( P1_MAX / 1000000 ) * 100;
        END IF;

        file1:= utl_file.fopen('ODOENGINE','odoengine_capacity.values','a');
        utl_file.put_line(file1,'orderidpctused='||round(orderidutil,2));
        utl_file.fclose(file1);
END;
/
exit;