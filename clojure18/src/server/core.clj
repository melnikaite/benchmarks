(ns server.core)

(defn -main
  "This should be pretty simple."
  [])

(require '[ring.adapter.jetty :as jetty])

(jetty/run-jetty
 (fn [req]
  {:status 200, :headers {"Content-Type" "text/plain"}
   :body "Hello World\n"})
  {:host "127.0.0.1", :port 1337, :join? false})
 (println "Server running at http://127.0.0.1:1337/")
