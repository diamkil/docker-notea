# docker-notea-stack

## This is my image combining Notea and MinIO into one single image. I saw lots of people on reddit and on Notea’s GitHub that had to install MinIO simply to use Notea and didn’t need it for anything else. This image solves the problem entirely! Simply use the commands below to run Notea Stack.

Original Projects:
1. Notea: https://github.com/QingWei-Li/notea
2. MinIO: https://github.com/minio/minio

### Docker Run
```bash
docker run -d \
    --name=Notea \
    -p 3000:3000 \
    -p 9000:9000 \ #Optional, only if you want to be able to access MinIO's interface
    -e PASSWORD=(notea web password) \
    -e STORE_USER=(minio username) \
    -e STORE_PASSWORD=(minio password) \
    -v /path/to/storage:/data \
    diamkil/notea:latest
```

### Docker-Compose
```yaml
version: '3.3'
services:
    notea:
        container_name: Notea
        ports:
            - '3000:3000'
            - '9000:9000' #Optional, only if you want to be able to access MinIO's interface
        environment:
            - PASSWORD=(notea web password)
            - STORE_USER=(minio username)
            - STORE_PASSWORD=(minio password)
        volumes:
            - '/path/to/storage:/data'
        image: 'diamkil/notea:latest'
```

Maybe some might get confused but to clarify: You choose all the values for the environment variables. Port 9000 gives access to the MinIO webUI but it’s not really needed to have the port, although if your main use for MinIO is Notea and you end up needing it somewhere else you can always open the port and use it with other services
