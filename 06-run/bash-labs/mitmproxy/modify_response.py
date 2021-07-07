def response(self, flow: mitmproxy.http.HTTPFlow):
    # 忽略非 360 搜索地址
    if flow.request.host != "www.so.com":
        return
 
    # 将响应中所有“搜索”替换为“请使用谷歌”
    text = flow.response.get_text()
    text = text.replace("搜索", "请使用谷歌")
    flow.response.set_text(text)