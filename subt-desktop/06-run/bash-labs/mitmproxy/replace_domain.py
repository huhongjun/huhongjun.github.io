
def request(self, flow: mitmproxy.http.HTTPFlow):
    # 忽略非百度搜索地址
    if flow.request.host != "www.baidu.com" or not flow.request.path.startswith("/s"):
        return
 
    # 确认请求参数中有搜索词
    if "wd" not in flow.request.query.keys():
        ctx.log.warn("can not get search word from %s" % flow.request.pretty_url)
        return
 
    # 输出原始的搜索词
    ctx.log.info("catch search word: %s" % flow.request.query.get("wd"))
    # 替换搜索词为“360搜索”
    flow.request.query.set_all("wd", ["360搜索"])