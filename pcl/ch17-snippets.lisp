(defclass bank-account ()
  ((customer-name
    :initarg :customer-name
    :initform (error "Must supply customer name")
    :accessor customer-name
    :documentation "Customer's name.")
   (balance
    :initarg :balance
    :initform 0
    :reader balance
    :documentation "Current account balance")
   (account-type
   :reader account-type
   :documentation "Type of account, on of :gold, :silver or :bronze.")))

(defmethod initialize-instance :after ((account bank-account) &key)
  (let ((balance (slot-value account 'balance)))
    (setf (slot-value account 'account-type)
   (cond
     ((>= balance 100000) :gold)
     ((>= balance 50000) :silver)
     (t :bronze)))))

(defmethod initialize-instance :after ((account bank-account)
           &key opening-bonus-percentage)
 
  (let ((balance (slot-value account 'balance)))
    (setf (slot-value account 'account-type)
   (cond
     ((>= balance 100000) :gold)
     ((>= balance 50000) :silver)
     (t :bronze))))
 
  (when opening-bonus-percentage
    (incf (slot-value account 'balance)
   (* (slot-value account 'balance) (/ opening-bonus-percentage 100)))))

(defparameter *minimum-balance* 20)

(defgeneric assess-low-balance-penalty (account))

(defmethod assess-low-balance-penalty ((account bank-account))
  (with-slots (bal balance) account
    (when (< bal *minimum-balance*)
      (decf bal (* bal 0.01)))))

(defclass foo ()
  ((a :initarg :a :initform "A" :accessor a)
   (b :initarg :b :initform "B" :accessor b)))

(defclass bar (foo)
  ((a :initform (error "Must supply a value for a"))
   (b :initarg :the-b :accessor the-b :allocation :class)))