### RabbitMQ

I'm using `docker-machine` and `docker-compose` to make the environment setup more easily.

#### Docker image
You can simply start the docker machine (a ubuntu virtual machine) by using this command.

```sh
$ docker-machine start dev 
```

After the machine `dev` is up and running, you can get the environment settings by 

```sh
$ docker-machine env dev
```

you will get something like this:

```
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/jtqiu/.docker/machine/machines/dev"
export DOCKER_MACHINE_NAME="dev"
# Run this command to configure your shell: 
# eval "$(docker-machine env dev)"
```

#### Message Producer

`message-producer` is the message producer, it sends out a simple string as message:

```sh
$ gradle build
$ java -jar build/libs/queue-producer.jar "message...."
```

#### Message Consumer

`queue-consumer` is the message consumer, it will always running in the background, and receive messages. You can start as many as consumer processes you like by just `java -jar`

```sh
$ gradle build
$ java -jar build/libs/queue-consumer.jar
```

The message will be deliveried fairly to multiple workers(queue-consumer).