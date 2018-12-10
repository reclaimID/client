#!./tests/libs/bats/bin/bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

@test "start/stop reclaim with demo" {
    run ./reclaim -y -d start
    assert_success
    run ./reclaim -y -d stop
    assert_success
}

