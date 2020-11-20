(use joy)


# Routes
(route :get "/" :home)


(defn home [request]
  {:hello "world"})


# Middleware
(defn json-responses [handler]
  (fn [request]
    (let [body (handler request)]
      (application/json body))))


(def app (-> (handler)
             (extra-methods)
             (query-string)
             (json-body-parser)
             (json-responses)
             (logger)))


# Server
(defn main [& args]
  (server app (env :port)))
