#!./tests/libs/bats/bin/bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

@test "start/stop reclaim with demo" {
    run ./reclaim -y -d start
    assert_success
    run ./reclaim -y -d stop
    assert_success
}

@test "start/stop reclaim without demo" {
    run ./reclaim -y start
    assert_success
    run ./reclaim -y stop
    assert_success
}

@test "reclaim generates certificates" {
    run ./reclaim -y start
    assert_success
    [ -f gns/gns_ca_cert.pem ]
    run ./reclaim -y stop
    assert_success
}

@test "client saves configuration into .tmp" {
    run ./reclaim -y -d start
    assert_success

    [ -f .tmp/composefile ]
    [ $(cat .tmp/composefile) = "config/docker-compose_demo.yml" ]
    [ -f .tmp/jwt_secret ]
    [ $(cat .tmp/jwt_secret) != "secret" ]
    [ -f .tmp/psw_secret ]
    [ $(cat .tmp/psw_secret) != "secret" ]

    run ./reclaim -y -d stop
    assert_success
}

@test "reclaim purges data but NOT volumes" {
    run ./reclaim -y start
    assert_success
    [ -d .tmp ]
    run ./reclaim -n purge
    assert_success
    run docker volume inspect reclaim-reclaim 1> /dev/null
    assert_success
    run docker volume inspect reclaim-gnunet 1> /dev/null
    assert_success
}

@test "reclaim purges data AND volumes" {
    run ./reclaim -y start
    assert_success
    [ -d .tmp ]
    run ./reclaim -y purge
    assert_success
    run docker volume inspect reclaim-reclaim 1> /dev/null
    assert_failure
    run docker volume inspect reclaim-gnunet 1> /dev/null
    assert_failure
}

@test "client fully functional" {
    skip
    run ./reclaim -y -d start
    assert_success
    [ $(docker ps | wc -l) -eq 5 ]
    a=$(curl -I -X GET -s -H 'Host: demo.reclaim.local' http://127.0.0.1:80/login | head -1 | cut -d ' ' -f 1,2 | grep '200 OK')
    run echo "test"
    echo "$a"
    run ./reclaim -y stop
    assert_success
}


