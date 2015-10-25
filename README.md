# ltool

[![][ltool-logo]][ltool-logo-large]

[ltool-logo]: resources/images/ltool-x250-grey.png
[ltool-logo-large]: resources/images/ltool-x1500-grey.png

*An experiment in a modular build tool for LFE*

##### Contents

* [Introduction](#introduction-)
* [Dependencies](#dependencies-)
* [Installation](#installation-)
* [Usage](#usage-)


## Introduction [&#x219F;](#contents)

Add content to me here!


## Dependencies [&#x219F;](#contents)

This project assumes that you have
[rebar3](https://github.com/rebar/rebar3) installed somwhere in your ``$PATH``.


## Installation [&#x219F;](#contents)

Just add it to your ``rebar.config`` deps:

```erlang
  {deps, [
    ...
    {ltool, ".*",
      {git, "git@github.com:lfe-rebar3/ltool.git", "master"}}
      ]}.
```

And then do the usual:

```bash
    $ rebar3 compile
```


## Usage [&#x219F;](#contents)

Add content to me here!
