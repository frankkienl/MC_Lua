h = http.get("http://frankkie.nl/mclua/pm/pm.lua")
f = fs.open("pm", "w")
f.write(h.readAll())
f.close()