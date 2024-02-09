(in-package #:com.rabidquill.blocks)

(defclass main (trial:main)
  ())

(defun launch (&rest args)
  (apply #'trial:launch 'main args))

(defmethod setup-scene ((main main) scene)
  (enter (make-instance 'vertex-entity :vertex-array (// 'trial 'unit-cube)) scene)
  (enter (make-instance '3d-camera :location (vec 0 0 -3)) scene)
  (enter (make-instance 'render-pass) scene))

(define-shader-entity my-cube (vertex-entity transformed-entity listener)
  ((vertex-array :initform (// 'trial 'unit-cube))))

(define-handler (my-cube tick) (tt)
  (setf (orientation my-cube) (qfrom-angle +vy+ tt)))

(defmethod setup-scene ((main main) scene)
  (enter (make-instance 'my-cube) scene)
  (enter (make-instance '3d-camera :location (vec 1 0 -3)) scene)
  (enter (make-instance 'render-pass) scene))

(define-asset (trial cat) image
  #p"cat.png")

(define-shader-entity my-cube (vertex-entity textured-entity transformed-entity listener)
  ((vertex-array :initform (// 'trial 'unit-cube))
   (texture :initform (// 'trial 'cat))))
