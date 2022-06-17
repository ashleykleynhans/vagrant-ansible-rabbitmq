services {
  id = "rabbitmq-api"
  name = "haproxy"
  port = 15672
  check {
    args = ["/usr/lib/nagios/plugins/check_tcp", "-p", "15672"]
    interval = "3s"
  }
  tags = ["rabbitmq-api"]
}

services {
  id = "rabbitmq-amqp"
  name = "haproxy"
  port = 5672
  check {
    args = ["/usr/lib/nagios/plugins/check_tcp", "-p", "5672"]
    interval = "3s"
  }
  tags = ["rabbitmq-amqp"]
}

services {
  id = "rabbitmq-comms"
  name = "haproxy"
  port = 25672
  check {
    args = ["/usr/lib/nagios/plugins/check_tcp", "-p", "25672"]
    interval = "3s"
  }
  tags = ["rabbitmq-comms"]
}

services {
  id = "rabbitmq-epmd"
  name = "haproxy"
  port = 4369
  check {
    args = ["/usr/lib/nagios/plugins/check_tcp", "-p", "4369"]
    interval = "3s"
  }
  tags = ["rabbitmq-epmd"]
}