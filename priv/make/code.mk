.PHONY: build repl check check-quiet clean

build:
	@rebar3 as prod compile

dev:
	@rebar3 as dev compile

repl:
	@$(LFE)

check:
	@rebar3 do clean,compile,lfe test -t unit

unit:
	@rebar3 do clean,compile,lfe test -t unit

system:
	@rebar3 do clean,compile,lfe test -t system

integration:
	@rebar3 do clean,compile,lfe test -t integration

check-all:
	@rebar3 do clean,compile,lfe test -t all

clean:
	@rebar3 as prod clean
	@rebar3 as dev clean
