(defsystem :queue-test
  :name "queue-test"
  :version "0.1.0"
  :author "Shubhamkar B. Ayare (shubhamayare@yahoo.co.in)"
  :license "MIT"
  :description "Test suite for queue."
  :serial t  
  :depends-on ("queue" "prove")
  :components ((:file "queue-test")))
