# Modulo Hospital

## Enunciado

Se desea construir una base de datos que almacene todos los  datos de una mega-clínica de la ciudad. Se debe manejar los datos de habitaciones por piso, cada piso maneja varias especialidades, pero tiene una especialidad principal. La estructura de la clínica maneja varios edificios en el complejo hospitalario. De los pisos se quiere guardar, un código de piso, nombre de la enfermera jefe a cargo, y el edificio en que está. De las habitaciones se desea guardar, el código, la cantidad de camas y el Piso al que pertenece.

## Consultas

1. Obtener el nombre del empleado que trabaja en el piso con id 3.

    ```SQL
    SELECT e.nombreEmpleado FROM empleado e
    JOIN piso p ON e.idEmpleado = p.idEmpleadoJefe
    WHERE p.idPisoEdificio = 3;
    ```

2. Mostrar el nombre y la especialidad de los pisos principales.

    ```SQL
    SELECT e.nombreEspecialidad FROM especialidad e
    JOIN pisoespecialidad p ON e.idEspecialidad = p.idEspecialidad
    WHERE p.estado = "principal";
    ```

3. Obtener el nombre del complejo hospitalario al que pertenece el edificio con id 5.

    ```SQL
    SELECT c.nombreComplejo FROM complejohospitalario c
    JOIN edificio e ON c.idComplejoHospitalario = e.idComplejoHospitalario
    WHERE e.idEdificio = 5;
    ```

4. Mostrar la ubicacion y la cantidad de camas de las habitaciones en el piso con id 8.

    ```SQL
    SELECT p.nroPiso AS ubicacion_piso, SUM(h.camas) FROM piso p
    JOIN habitacion h ON p.idPisoEdificio = h.idPisoEdificio
    WHERE p.idPisoEdificio = 8;
    ```

5. Obtener el nombre del empleado que trabaja en el edificio con id 6.

    ```SQL
    SELECT e.nombreEmpleado FROM empleado e
    JOIN piso p ON e.idEmpleado = p.idEmpleadoJefe
    JOIN edificio ed ON p.idEdificio = ed.idEdificio
    WHERE ed.idEdificio = 6;
    ```

6. Mostrar el nombre de las especialidades en el piso principal del edificio con id 3.

    ```SQL
    SELECT e.nombreEspecialidad FROM especialidad e
    JOIN pisoespecialidad pe ON e.idEspecialidad = pe.idEspecialidad
    JOIN piso p ON pe.idPisoEdificio = p.idPisoEdificio
    JOIN edificio ed ON p.idEdificio = ed.idEdificio
    WHERE pe.estado = "principal" AND ed.idEdificio = 3;
    ```

7. Obtener el nombre y el cargo de los empleados que trabajan en el edificio con id 7.

    ```SQL
    SELECT e.nombreEmpleado, e.cargo FROM empleado e
    JOIN piso p ON e.idEmpleado = p.idEmpleadoJefe
    JOIN edificio ed ON p.idEdificio = ed.idEdificio
    WHERE ed.idEdificio = 7;
    ```

8. Mostrar el nombre y la ubicación de los pisos con más de 15 camas.

    ```SQL
    SELECT p.idPisoEdificio, p.nroPiso AS ubicacion_piso, SUM(h.camas) FROM habitacion h
    JOIN piso p ON h.idPisoEdificio = p.idPisoEdificio
    GROUP BY p.idPisoEdificio
    HAVING SUM(h.camas) > 15;
    ```

9. Obtener el nombre del complejo hospitalario que tiene el mayor número de edificios.

    ```SQL
    SELECT c.nombreComplejo FROM complejohospitalario c
    JOIN edificio e ON c.idComplejoHospitalario = e.idComplejoHospitalario
    GROUP BY c.idComplejoHospitalario
    ORDER BY COUNT(*) DESC
    LIMIT 1;
    ```

10. Mostrar el nombre y el cargo de los empleados que trabajan en el piso principal del edificio con id 1.

    ```SQL
    SELECT e.nombreEmpleado, e.cargo, es.nombreEspecialidad  FROM empleado e
    JOIN piso p ON e.idEmpleado = p.idEmpleadoJefe
    JOIN pisoespecialidad pe ON p.idPisoEdificio = pe.idPisoEdificio
    JOIN especialidad es ON pe.idEspecialidad = es.idEspecialidad
    JOIN edificio ed ON p.idEdificio = ed.idEdificio
    WHERE ed.idEdificio = 1;
    ```

11. Obtener el nombre y la ubicación de los pisos donde trabaja un "Jefe".

    ```SQL
    
    ```

12. Mostrar el nombre y el cargo de los empleados que trabajan en más de un piso.

    ```SQL
    
    ```

13. Obtener el nombre y la cantidad de camas de las habitaciones en el piso principal del edificio con id 2.

    ```SQL
    
    ```

14. Mostrar el nombre del complejo hospitalario que tiene al menos un edificio sin asignación de empleados.

    ```SQL
    
    ```

## Uso del Proyecto

Clona este repositorio en tu maquina local:

```BASH
git clone https://github.com/jstorra/hospital-sql.git
```

---

<p align="center">Developed by <a href="https://github.com/jstorra">@jstorra</a></p>