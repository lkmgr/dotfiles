#!/usr/bin/env bash

pgrep -x mako >/dev/null && makoctl mode -a darkmode
