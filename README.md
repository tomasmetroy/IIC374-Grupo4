# IIC374-Grupo4

## SimpleCov

Para ver los porcentajes de coverage por archivo se debe ejecutar 
- bundle install
- rake test:all

## Flujo CI/CD

El testing y linters asociados al proyecto para la integración contínua se hicieron con GitHub Actions.En la carpeta .github/workflows hay dos archivos de configuración .yml que ejecutan ambos tasks para correr los tests y los linters. Estos se ejecutan cada vez que se crea un Pull Request hacia las branches main y develop.

Si se quisieran correr por separado en la aplicación, basta con ingresar
- rake test
- rake lint

## Video de explicación del juego

Se puede ver cómo jugar en el siguiente video: https://drive.google.com/file/d/1YEMUjmkDvYe16uY7y38qC9zq80sdChdP/view?usp=sharing

DEBE abrirse con un mail UC.
