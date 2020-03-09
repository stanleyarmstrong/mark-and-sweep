#lang typed/racket
 
 
;; represents an expression
(define-type ExprC (U Real Symbol String LamC AppC IfC SetC))
(struct LamC ([params : (Listof Symbol)]
              [body : ExprC]) #:transparent)
(struct AppC ([fun : ExprC]
              [args : (Listof ExprC)]) #:transparent)
(struct IfC ([test : ExprC]
             [thn : ExprC]
             [els : ExprC]) #:transparent)
(struct SetC ([var : Symbol]
              [newval : ExprC]))
(define-type PrimV (U '+ '- '* '/))
 
;; represents a value
(define-type Value (U Real Boolean String CloV PrimV
                      ArrayV))
(struct CloV ([params : (Listof Symbol)]
              [body : ExprC]
              [env : Env]))
(struct ArrayV ([addr : Address] [length : Natural])
  #:transparent)
 
;; represents an Environment
(define-type Env (HashTable Symbol Address))
 
;; represents an address
(define-type Address Natural)
 
;; represents a store
(define-type Store (Mutable-HashTable Address Value))