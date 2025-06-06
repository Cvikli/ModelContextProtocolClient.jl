using ModelContextProtocolClients
collector = MCPClientCollector()
load_mcp_servers_config(collector, "test/mcp.json")

#%%
using ModelContextProtocolClients: list_clients
list_clients(collector)

#%%
tools[1]
#%%
tools[1]["inputSchema"]
#%%
tools = list_tools(collector, "puppeteer")
using ModelContextProtocolClients: print_tools
print_tools(tools)

#%%
response = call_tool(collector, "puppeteer", "puppeteer_navigate", Dict(
    "url" => "https://www.google.com",
    "allowDangerous" => true,
    "launchOptions" => Dict("headless" => false,
    "args" => ["--no-sandbox", "--disable-setuid-sandbox"])
))
println(response)

#%%
response = call_tool(collector, "context7-mcp", "resolve-library-id", Dict(
    "libraryName" => "mongodb"
))
println(response)

#%%
list_tools(collector, "context7-mcp")
#%%
response = call_tool(collector, "context7-mcp", "get_context", Dict())