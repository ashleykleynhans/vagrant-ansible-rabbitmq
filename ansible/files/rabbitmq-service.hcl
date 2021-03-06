services {
  id = "api"
  name = "rabbitmq"
  port = 15672
  check {
    args = ["/usr/lib/nagios/plugins/check_tcp", "-p", "15672"]
    interval = "3s"
  }
  tags = ["api"]
}

services {
  id = "amqp"
  name = "rabbitmq"
  port = 5672
  check {
    args = ["/usr/lib/nagios/plugins/check_tcp", "-p", "5672"]
    interval = "3s"
  }
  tags = ["amqp"]
}

services {
  id = "comms"
  name = "rabbitmq"
  port = 25672
  check {
    args = ["/usr/lib/nagios/plugins/check_tcp", "-p", "25672"]
    interval = "3s"
  }
  tags = ["comms"]
}

services {
  id = "epmd"
  name = "rabbitmq"
  port = 4369
  check {
    args = ["/usr/lib/nagios/plugins/check_tcp", "-p", "4369"]
    interval = "3s"
  }
  tags = ["epmd"]
}