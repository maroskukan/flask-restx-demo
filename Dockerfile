FROM python:3.9.5-alpine as builder

LABEL org.opencontainers.image.title="Sample Flask RestX" \             
      org.opencontainers.image.description="Sample Flask RestX" \ 
      org.opencontainers.image.authors="@maroskukan"

# Install build tools, libraries, and utilities
RUN apk add --no-cache build-base                                                 

# Install dependencies
COPY requirements.txt /tmp/
RUN pip install --user --upgrade pip && \
    pip install --user --no-cache-dir -r /tmp/requirements.txt

COPY src/ /project

FROM python:3.9.5-alpine
COPY --from=builder /root/.local /root/.local
COPY --from=builder /project /project

# Expose port
EXPOSE 5000

WORKDIR /project
ENTRYPOINT ["python","app.py"]