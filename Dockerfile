# Dockerfile
# Usa una imagen base oficial de Python. Elige una versión específica para consistencia.
FROM python:3.12-slim

# Copia uv desde su imagen oficial
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de definición del proyecto primero para aprovechar el cache de Docker
COPY pyproject.toml .

# Instala las dependencias definidas en pyproject.toml usando uv
RUN uv sync --no-cache

# Copia el resto del código de la aplicación al directorio de trabajo
COPY . .

# Expón el puerto en el que Gunicorn servirá la aplicación
# Gunicorn por defecto usa 8000, así que usaremos ese.
EXPOSE 8000

# Comando para ejecutar la aplicación usando Gunicorn cuando el contenedor inicie
# 'app.app:app' significa: del archivo app.py dentro del paquete app, usa la instancia 'app' de Flask.
# 'workers=4' es un ejemplo, ajusta según sea necesario.
# 'bind 0.0.0.0:8000' hace que Gunicorn escuche en todas las interfaces de red en el puerto 8000.
CMD ["/app/.venv/bin/gunicorn", "--workers=4", "--bind=0.0.0.0:8000", "app.app:app"]