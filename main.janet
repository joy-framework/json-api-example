(use joy)

# Routes
(route :get "/" :home)
(defn home [request]
  {:hello "world"})

# App
(def app (app json-api))

# Server
(defn main [& args]
  (server app (env :port)))
