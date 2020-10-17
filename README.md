
# Rappi Clone Flutter + Firebase
Este repositorio es una muestra de cómo construir una aplicación en Flutter desde cero a producción.

## Empezar a contribuir

Estamos trabajando con `flavors`  considerar ubicar el archivo de configuración de firebase para la receta con el que trabajas
**Android**
```sh
android/app/src/dev/google-services.json
android/app/src/prod/google-services.json
```

**iOS**

![enter image description here](https://miro.medium.com/max/1400/1*2QT0g0XVi72daZz3tYJdmw.gif)

Usamos APIs de Google Maps, es necesario [generar api key](https://cloud.google.com/docs/authentication/api-keys)
El cual debe ser modificado en `lib/provider_setup.dart`

**Iniciar por línea de comando**
dev
`flutter run --flavor dev`
prod
`flutter run --flavor dev`

**Iniciar con vscode**
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Dev",
      "request": "launch",
      "type": "dart",
      "args": ["--flavor", "dev"]
    },
    {
      "name": "Prod",
      "request": "launch",
      "type": "dart",
      "args": ["--flavor", "prod"]
    }
  ]
}
```
