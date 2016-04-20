.PHONY: build repl check check-quiet clean

build:
	@rebar3 as prod compile

dev:
	@rebar3 as dev compile

repl:
	@$(LFE)

check:
	@rebar3 as prod lfe test

unit:
	@rebar3 as prod lfe test -t unit

system:
	@rebar3 as prod lfe test -t system

integration:
	@rebar3 as prod lfe test -t integration

check-all:
	@rebar3 as prod lfe test -t all

clean:
	@rebar3 as prod clean
	@rebar3 as dev clean
