# para deshabilitar el sophos:
# entrar en modo recovery (presionando el boton de encendido mas de 10 segundos)
# abrir una terminal, e ingresar: crsutil disable 

# luego iniciar normalmente y correr: (ingresar la contraseña las 2 veces)

systemextensionsctl uninstall 2H5GFH3774 com.sophos.endpoint.networkextension
systemextensionsctl uninstall 2H5GFH3774 com.sophos.endpoint.scanextension

# para obtener el teamId (2H5GFH3774)
# systemextensionsctl list | grep sophos
