#!/usr/bin/env python
# -*- coding: UTF-8 -*-
def request(flow):
    if flow.request.pretty_host == 'api.github.com':
        flow.request.host = '127.0.0.1'
        flow.request.port = 8085