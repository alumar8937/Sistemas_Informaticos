#Configurar política de contraseñas.

    #Bloqueo de cuentas 
# Número máximo de intentos.
net accounts /lockoutthreshold:4
# Tiempo de espera en caso de bloqueo.
net accounts /lockoutduration:45
net accounts /lockoutwindow:45

# Número de contraseñas únicas. (Una nueva contraseña debe ser única entre las últimas 10)
net accounts /uniquepw:10
# Antiguedad máxima de la contraseña. (Días)
net accounts /maxpwage:120
# Tiempo mínimo entre cambio de contraseñas. (Días)
net accounts /minpwage:5
# Longitud mínima de la contraseña.
net accounts /minpwlen:8

# Mostrar configuración.
net accounts 

# Requisitos de complejidad.

secedit /export /cfg c:\secpol.cfg
(gc C:\secpol.cfg).replace("PasswordComplexity = 0", "PasswordComplexity = 1") | Out-File C:\secpol.cfg
secedit /configure /db c:\windows\security\local.sdb /cfg c:\secpol.cfg /areas SECURITYPOLICY
rm -force c:\secpol.cfg -confirm:$false
