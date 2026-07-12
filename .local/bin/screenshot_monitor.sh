#!/bin/sh
grabit --fullscreen=$(mmsg get focusing-client | jq -r '.monitor')
