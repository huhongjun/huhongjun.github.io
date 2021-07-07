from mitmproxy import http
from mitmproxy import ctx

class Counter:
    def __init__(self):
        self.num = 0

    """log counter """
    def request(self, flow: http.HTTPFlow):
        self.num = self.num + 1
        ctx.log.info("We've seen %d flows" % self.num)
        
        """Send a reply from the proxy without sending any data to the remote server."""
        if flow.request.pretty_url == "http://example.com/path":
            flow.response = http.HTTPResponse.make(
                200,  # (optional) status code
                b"Hello World! mitm make the response",  # (optional) content
                {"Content-Type": "text/html"}  # (optional) headers
            )

    def load(self, loader):
        loader.add_option(
            name = "addheader",
            typespec = bool,
            default = False,
            help = "Add a count header to responses",
        )
    def response(self, flow):
        if ctx.options.addheader:
            self.num = self.num + 1
            flow.response.headers["count"] = str(self.num)

addons = [
    Counter()
]
