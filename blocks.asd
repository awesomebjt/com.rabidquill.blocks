(asdf:defsystem "blocks"
  :components ((:file "package")
               (:file "main"))
  :depends-on (:trial
               :trial-glfw
               :trial-png))
