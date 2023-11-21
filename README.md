# Consultas Ejercicio - Modulo Hospital

### 1. Obtener el nombre del empleado que trabaja en el piso con id 3.

```sql
SELECT e.nombreEmpleado FROM empleado e
JOIN piso p ON e.idEmpleado = p.idEmpleadoJefe
WHERE p.idPisoEdificio = 3;
```

### 2. Mostrar el nombre y la especialidad de los pisos principales.

```sql
SELECT e.nombreEspecialidad FROM especialidad e
JOIN pisoespecialidad p ON e.idEspecialidad = p.idEspecialidad
WHERE p.estado = "principal";
```

### 3. Obtener el nombre del complejo hospitalario al que pertenece el edificio con id 5.

```sql
SELECT c.nombreComplejo FROM complejohospitalario c
JOIN edificio e ON c.idComplejoHospitalario = e.idComplejoHospitalario
WHERE e.idEdificio = 5;
```

### 4. Mostrar el nombre y la cantidad de camas de las habitaciones en el piso con id 8.

```sql
SELECT p.nroPiso AS ubicacion_piso, SUM(h.camas) FROM piso p
JOIN habitacion h ON p.idPisoEdificio = h.idPisoEdificio
WHERE p.idPisoEdificio = 8;
```

### 5. Obtener el nombre del empleado que trabaja en el edificio con id 6.

```sql
SELECT e.nombreEmpleado FROM empleado e
JOIN piso p ON e.idEmpleado = p.idEmpleadoJefe
WHERE p.idEdificio = 6;
```

### 6. Mostrar el nombre de las especialidades en el piso principal del edificio con id 3.

```sql
SELECT ed.nombreEdificio, p.nroPiso AS ubicacion_piso, SUM(h.camas) AS camas FROM edificio ed
JOIN piso p ON ed.idEdificio = p.idEdificio
JOIN habitacion h ON p.idPisoEdificio = h.idPisoEdificio
JOIN pisoespecialidad pe ON p.idPisoEdificio = pe.idPisoEdificio
WHERE pe.estado = "principal" AND ed.idEdificio = 2;
```

### 7. Obtener el nombre y el cargo de los empleados que trabajan en el edificio con id 7.

```sql
SELECT e.nombreEmpleado, e.cargo FROM empleado e
JOIN piso p ON e.idEmpleado = p.idEmpleadoJefe
WHERE p.idEdificio = 7;
```

### 8. Mostrar el nombre y la ubicación de los pisos con más de 15 camas.

```sql
SELECT p.idPisoEdificio, p.nroPiso AS ubicacion_piso, SUM(h.camas) FROM habitacion h
JOIN piso p ON h.idPisoEdificio = p.idPisoEdificio
GROUP BY p.idPisoEdificio
HAVING SUM(h.camas) > 15;
```

### 9. Obtener el nombre del complejo hospitalario que tiene el mayor número de edificios.

```sql
SELECT c.nombreComplejo FROM complejohospitalario c
JOIN edificio e ON c.idComplejoHospitalario = e.idComplejoHospitalario
GROUP BY c.idComplejoHospitalario
ORDER BY COUNT(*) DESC
LIMIT 1;
```

### 10. Mostrar el nombre y la especialidad de los empleados que trabajan en el piso principal del edificio con id 1.

```sql
SELECT e.nombreEmpleado, e.cargo, es.nombreEspecialidad  FROM empleado e
JOIN piso p ON e.idEmpleado = p.idEmpleadoJefe
JOIN pisoespecialidad pe ON p.idPisoEdificio = pe.idPisoEdificio
JOIN especialidad es ON pe.idEspecialidad = es.idEspecialidad
WHERE p.idEdificio = 1;
```

### 11. Obtener el nombre y la ubicación de los pisos donde trabaja un "Fisioterapeuta".

```sql
SELECT ed.nombreEdificio, p.nroPiso AS ubicacion_piso FROM empleado e, piso p, edificio ed
WHERE e.idEmpleado = p.idEmpleadoJefe
AND p.idEdificio = ed.idEdificio
AND e.cargo = 'fisioterapeuta';
```

### 12. Mostrar el nombre y el cargo de los empleados que trabajan en más de un piso. 

```sql
SELECT e.nombreEmpleado, e.cargo FROM empleado e
WHERE (
	SELECT COUNT(*) FROM piso p
	WHERE p.idEmpleadoJefe = e.idEmpleado
) > 1;
```

### 13. Obtener el nombre y la cantidad de camas de las habitaciones en el piso principal del edificio con id 2.

```sql
SELECT ed.nombreEdificio, p.nroPiso AS ubicacion_piso, SUM(h.camas) AS camas FROM edificio ed
JOIN piso p ON ed.idEdificio = p.idEdificio
JOIN habitacion h ON p.idPisoEdificio = h.idPisoEdificio
JOIN pisoespecialidad pe ON p.idPisoEdificio = pe.idPisoEdificio
WHERE pe.estado = "principal" AND ed.idEdificio = 2;
```

### 14. Mostrar el nombre del complejo hospitalario que tiene al menos un edificio sin asignación de empleados.

```sql
SELECT DISTINCT ch.nombreComplejo FROM complejoHospitalario ch
JOIN edificio ed ON ch.idComplejoHospitalario = ed.idComplejoHospitalario
LEFT JOIN piso p ON ed.idEdificio = p.idEdificio
LEFT JOIN empleado e ON p.idEmpleadoJefe = e.idEmpleado
WHERE p.idEdificio IS NULL OR e.idEmpleado IS NULL;
```

## Modelo fisico

![](./modelo-fisico.png)

## Uso del Proyecto

Clona este repositorio en tu maquina local:

```BASH
git clone https://github.com/jstorra/hospital-sql.git
```

---

<p align="center">Developed by <a href="https://github.com/jstorra">@jstorra</a></p>