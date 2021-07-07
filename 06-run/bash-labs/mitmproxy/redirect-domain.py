from mitmproxy import http
from mitmproxy import ctx

class Redirect:
    redirect_rules = {
        "api.domain.com": "api-preprod.domain.com"
    }

    def load(self, loader):
        ctx.options.http2 = False # HTTP2 won't let you change the url

    def request(self, flow: http.HTTPFlow) -> None:
        for init_domain, new_domain in self.redirect_rules.items():
            if (init_domain in flow.request.pretty_url):
                flow.request.url = flow.request.pretty_url.replace(init_domain, new_domain)

addons = [Redirect()]