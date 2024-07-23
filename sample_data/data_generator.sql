CREATE OR REPLACE FUNCTION public.generate_sample_flights(num_flights integer)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE
    i INT;
    route RECORD;
    random_dept TIMESTAMP;
    random_arr TIMESTAMP;
BEGIN
    FOR i IN 1..num_flights LOOP
        -- Select a random route with non-null airlineid, sourceairportid, and destinationairportid
        SELECT * INTO route
        FROM public.route
        WHERE airlineid IS NOT NULL AND sourceairportid IS NOT NULL AND destinationairportid IS NOT NULL
        ORDER BY random()
        LIMIT 1;

        -- Generate random departure and arrival times
        random_dept := NOW() + (random() * (interval '7 days'));
        random_arr := random_dept + (interval '2 hours' + (random() * interval '6 hours'));

        -- Insert the flight
        INSERT INTO public.flight (airlineid, sourceairportid, destinationairportid, departure, arrival, equipment)
        VALUES (route.airlineid, route.sourceairportid, route.destinationairportid, random_dept, random_arr, route.equipment);
    END LOOP;
END;
$function$
;
