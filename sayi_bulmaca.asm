   ORG $1000
START:
LOOP: 
    LEA SOL_SOL, A1
    MOVE.B #14, D0
    TRAP #15
   ; karşılama mesajını yazdır
    JSR FNC_NEW_LINE
    MOVE.L #0, (T_TRUE)
    MOVE.L #0, (T_FALSE_TRUE)
    LEA MESSAGE, A1       
    MOVE.B  #14, D0       
    TRAP    #15          
    JSR FNC_NEW_LINE
    ; kullanıcıdan 4 haneli bir tam sayı al
    MOVE.B  #4, D0
    TRAP    #15 
    

  
    LEA MESSAGE_PROMPT, A1 
    MOVE.B  #14, D0
    MOVE.B #3, D0
    MOVE.L D1,D2
  
    
 
    
   
    
    ; random sayı oluştur ve 
    ; 32 bit D1 yazmacına yüke
    ; 4 haneli bir determinist olmayan sayı üretilir
    MOVE.L (RANDOM_NUMBER) , D4
    CMP.L #0, D4
    BEQ RANDOM_NUMBER_CREATE
RANDOM_NEXT:
    
   
    
    ; yeni satır
    JSR FNC_NEW_LINE
 
    ; kullanıcgın girdiği 4 haneli rakamı parcalayalım
    ; d4 ilk hane
    ; d5 ikinci hane
    ; d6 ucuncu hane
    ; d7 dorduncu hane

  ; İlk hane (binler basamağı)
    MOVE.L  D2, D1        
    DIVS    #1000, D1  
    MOVE.W  D1, D4        ; D4 ilk hane (binler basamağı)
    ; İlk haneyi çıkartarak kalan kısmı hesapla
    MOVE.L  D2, D3        
    MOVE.L  D4, D1         
    MULS    #1000, D1     
    SUB.L   D1, D3       
    ; İkinci hane (yüzler basamağı)
    MOVE.L  D3, D5       
    DIVS    #100, D5       
    MOVE.W  D5, D5       
    ; İkinci haneyi çıkartarak kalan kısmı hesapla
    MOVE.L  D3, D1
    MOVE.L  D5, D3
    MULS    #100, D3
    SUB.L   D3, D1      
    ; Üçüncü hane (onlar basamağı)
    MOVE.L  D1, D6
    DIVS    #10, D6       
    MOVE.W  D6, D6       
    ; Dördüncü hane (birler basamağı)
    MOVE.L  D1, D7       
    MOVE.L  D6, D3
    MULS    #10, D3
    SUB.L   D3, D7      
    ; d4,d5,d6,d7 işlemlerden kalan
    ; işimize yaramayacak bitleri atiyoruz
    ANDI.L  #$0000000F, D4
    ANDI.L  #$0000000F, D5
    ANDI.L  #$0000000F, D6
    ANDI.L  #$0000000F, D7
    ; DEĞERLERİ BELLEĞE YÜKLE
    LEA     T1, A1
    MOVE.B  D4, (A1)
    
    LEA     T2, A1
    MOVE.B  D5, (A1)
    
    LEA     T3, A1
    MOVE.B  D6, (A1)
    
    LEA     T4, A1
    MOVE.B  D7, (A1)
    
   
    ; oluşturan rastgae 4 haneli rakamı parcalayalım
    ; rasgate sayının kendisi (orjinal) A4 de
    ; İlk hane (binler basamağı)
    MOVE.L  (RANDOM_NUMBER), D1        
    DIVS    #1000, D1  
    MOVE.W  D1, D4        ; D4 ilk hane (binler basamağı)
    ; İlk haneyi çıkartarak kalan kısmı hesapla
    MOVE.L  (RANDOM_NUMBER), D3        
    MOVE.L  D4, D1         
    MULS    #1000, D1     
    SUB.L   D1, D3       
    ; İkinci hane (yüzler basamağı)
    MOVE.L  D3, D5       
    DIVS    #100, D5       
    MOVE.W  D5, D5       
    ; İkinci haneyi çıkartarak kalan kısmı hesapla
    MOVE.L  D3, D1
    MOVE.L  D5, D3
    MULS    #100, D3
    SUB.L   D3, D1      
    ; Üçüncü hane (onlar basamağı)
    MOVE.L  D1, D6
    DIVS    #10, D6       
    MOVE.W  D6, D6       
    ; Dördüncü hane (birler basamağı)
    MOVE.L  D1, D7       
    MOVE.L  D6, D3
    MULS    #10, D3
    SUB.L   D3, D7      
    ; d4,d5,d6,d7 işlemlerden kalan
    ; işimize yaramayacak bitleri atiyoruz
    ANDI.L  #$0000000F, D4
    ANDI.L  #$0000000F, D5
    ANDI.L  #$0000000F, D6
    ANDI.L  #$0000000F, D7
    ; DEĞERLERİ BELLEĞE YÜKLE
    LEA     R1, A1
    MOVE.B  D4, (A1)
    LEA     R2, A1
    MOVE.B  D5, (A1)
    LEA     R3, A1
    MOVE.B  D6, (A1)
    LEA     R4, A1
    MOVE.B  D7, (A1)

    ; geliştirme aşamasında 
    ; test icin 
    ;MOVE.B  (T1), D1
    ;MOVE.B  #3, D0
    ;TRAP #15 
    ;MOVE.B  (T2), D1
    ;MOVE.B  #3, D0
    ;TRAP #15 
    ;MOVE.B  (T3), D1
    ;MOVE.B  #3, D0
    ;TRAP #15 
    ;MOVE.B  (T4), D1
    ;MOVE.B  #3, D0
    ;TRAP #15 
    ;JSR FNC_NEW_LINE
    ;MOVE.B  (R1), D1
    ;MOVE.B  #3, D0
    ;TRAP #15 
    ;MOVE.B  (R2), D1
    ;MOVE.B  #3, D0
    ;TRAP #15 
    ;MOVE.B  (R3), D1
    ;MOVE.B  #3, D0
    ;TRAP #15 
    ;MOVE.B  (R4), D1
    ;MOVE.B  #3, D0
    ;TRAP #15 
    ; geliştirme aşaması test ici bitis
    


    ; artık karşılaştıurmalara gecebiliriz
    
    ; yanlış basamaklar
;T1
    MOVE.B (T1), D1
    MOVE.B (R2), D2 
    CMP.B D1, D2
    BEQ FALSE_A_NEXT
F_A_NEXT:
    MOVE.B (T1), D1
    MOVE.B (R3), D2 
    CMP.B D1, D2
    BEQ FALSE_B_NEXT
F_B_NEXT:
    MOVE.B (T1), D1
    MOVE.B (R4), D2 
    CMP.B D1, D2
    BEQ FALSE_C_NEXT
F_C_NEXT:
    BRA T2_EQ
FALSE_C_NEXT:
    MOVE.L  #0, D1
    MOVE.L (T_FALSE_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_FALSE_TRUE)
    BRA T2_EQ
FALSE_B_NEXT:
    MOVE.L  #0, D1
    MOVE.L (T_FALSE_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_FALSE_TRUE)
    BRA T2_EQ
FALSE_A_NEXT:
    MOVE.L  #0, D1
    MOVE.L (T_FALSE_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_FALSE_TRUE)
    BRA T2_EQ
;T2
T2_EQ:
    MOVE.B (T2), D1
    MOVE.B (R1), D2 
    CMP.B D1, D2
    BEQ T2_FALSE_A_NEXT
T2_F_A_NEXT:
    MOVE.B (T2), D1
    MOVE.B (R3), D2 
    CMP.B D1, D2
    BEQ T2_FALSE_B_NEXT
T2_F_B_NEXT:
    MOVE.B (T2), D1
    MOVE.B (R4), D2 
    CMP.B D1, D2
    BEQ T2_FALSE_C_NEXT
    
T2_F_C_NEXT:
    BRA T3_EQ

T2_FALSE_C_NEXT:
    MOVE.L  #0, D1
    MOVE.L (T_FALSE_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_FALSE_TRUE)
    BRA T3_EQ  
T2_FALSE_B_NEXT:
    MOVE.L  #0, D1
    MOVE.L (T_FALSE_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_FALSE_TRUE)
    BRA T3_EQ
T2_FALSE_A_NEXT:
    MOVE.L  #0, D1
    MOVE.L (T_FALSE_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_FALSE_TRUE)
    BRA T3_EQ
 
;T3
T3_EQ:
    MOVE.B (T3), D1
    MOVE.B (R1), D2 
    CMP.B D1, D2
    BEQ T3_FALSE_A_NEXT
T3_F_A_NEXT:
    MOVE.B (T3), D1
    MOVE.B (R2), D2 
    CMP.B D1, D2
    BEQ T3_FALSE_B_NEXT
T3_F_B_NEXT:
    MOVE.B (T3), D1
    MOVE.B (R4), D2 
    CMP.B D1, D2
    BEQ T3_FALSE_C_NEXT
    
T3_F_C_NEXT:
    BRA T4_EQ

T3_FALSE_C_NEXT:
    MOVE.L  #0, D1
    MOVE.L (T_FALSE_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_FALSE_TRUE)
    BRA T4_EQ
T3_FALSE_B_NEXT:
    MOVE.L  #0, D1
    MOVE.L (T_FALSE_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_FALSE_TRUE)
    BRA T4_EQ
T3_FALSE_A_NEXT:
    MOVE.L  #0, D1
    MOVE.L (T_FALSE_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_FALSE_TRUE)
    BRA T4_EQ
 


;T4
T4_EQ:
  
    MOVE.B (T4), D1
    MOVE.B (R1), D2 
    CMP.B D1, D2
    BEQ T4_FALSE_A_NEXT
T4_F_A_NEXT:
    MOVE.B (T4), D1
    MOVE.B (R2), D2 
    CMP.B D1, D2
    BEQ T4_FALSE_B_NEXT
T4_F_B_NEXT:
    MOVE.B (T4), D1
    MOVE.B (R3), D2 
    CMP.B D1, D2
    BRA TRUE_EQ
    
T4_F_C_NEXT:
    BRA TRUE_EQ

T4_FALSE_C_NEXT:
    MOVE.L  #0, D1
    MOVE.L (T_FALSE_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_FALSE_TRUE)
    BRA TRUE_EQ  
T4_FALSE_B_NEXT:
    MOVE.L  #0, D1
    MOVE.L (T_FALSE_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_FALSE_TRUE)
    BRA T4_F_B_NEXT
T4_FALSE_A_NEXT:
    MOVE.L  #0, D1
    MOVE.L (T_FALSE_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_FALSE_TRUE)
    BRA TRUE_EQ
 



; doğru basamak eşitlik kontrolleri
TRUE_EQ:
    MOVE.B (T1), D1
    MOVE.B (R1), D2 
    CMP.B D1, D2
    BEQ A_PLUS_PLUS
A_NEXT:
    MOVE.B (T2), D1
    MOVE.B (R2), D2 
    CMP.B D1, D2
    BEQ B_PLUS_PLUS
B_NEXT:
    MOVE.B (T3), D1
    MOVE.B (R3), D2 
    CMP.B D1, D2
    BEQ C_PLUS_PLUS
C_NEXT:
    MOVE.B (T4), D1
    MOVE.B (R4), D2 
    CMP.B D1, D2
    BEQ D_PLUS_PLUS
D_NEXT:
    JSR FNC_NEW_LINE
    LEA FALSE_TRUE_MSG, A1
    MOVE.B #14, D0
    TRAP #15
    MOVE.L (T_FALSE_TRUE), D1
    MOVE.B #3, D0
    TRAP   #15


    JSR FNC_NEW_LINE
    LEA TRUE_MSG, A1
    MOVE.B #14, D0
    TRAP #15
    MOVE.L (T_TRUE), D1
    MOVE.B #3, D0
    TRAP   #15
    MOVE.L (T_TRUE), A0
    CMP.L #4, A0
    BEQ FINISH
    JSR FNC_NEW_LINE
    LEA SOL_SOL, A1
    MOVE.B #14, D0
    TRAP #15
    LEA SOL_SOL, A1
    MOVE.B #14, D0
    TRAP #15

    BRA LOOP
FINISH:
    JSR FNC_NEW_LINE
    LEA FINIS_MSG, A1
    MOVE.B #14, D0
    TRAP #15
    
   
    SIMHALT
D_PLUS_PLUS:
    MOVE.L  #0, D1
    MOVE.L (T_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_TRUE)
    BRA D_NEXT
C_PLUS_PLUS:
    MOVE.L  #0, D1
    MOVE.L (T_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_TRUE)
    BRA C_NEXT
B_PLUS_PLUS:
    MOVE.L  #0, D1
    MOVE.L (T_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_TRUE)
    BRA B_NEXT
    
A_PLUS_PLUS:
    MOVE.L  #0, D1
    MOVE.L (T_TRUE), D1
    ADDQ.B #1, D1  
    MOVE.L D1, (T_TRUE)
    BRA A_NEXT
  
    
    
FNC_NEW_LINE:
    LEA NEW_LINE_DATA,  A1
    MOVE.B #14, D0
    TRAP #15
    RTS
    
    
    
RANDOM_NUMBER_CREATE:
    MOVE    #1111, D5   ; D5 yazmacına MIN_RANGE değerini yükle
    MOVE    #9999, D6   ; D6 yazmacına MAX_RANGE değerini yükle
    SUB     D5,D6           
    MOVE    D6,D7
    ADDI     #1,D6
    MULU    #$FFFF,D7
    LEA     SEED,A1
    MOVE.B  #8,d0
    TRAP    #15
    ADD    (A1),D1
    MULU  #$FFFF,D1
    EOR.L     #$F321F23A,D1
    MOVE    D1,(A1)
    AND.L   D7,D1   
    DIVU    D6,D1         
    SWAP    D1                     
    ANDI.L  #$0000FFFF, D1  
    MOVE.L D1, (RANDOM_NUMBER)
    BRA RANDOM_NEXT
  

                
T1 DC.B 1
T2 DC.B 1
T3 DC.B 1
T4 DC.B 1

R1 DC.B 1
R2 DC.B 1
R3 DC.B 1
R4 DC.B 1
T_TRUE DC.L 0
T_FALSE_TRUE DC.L 0
EQ_STR DC.B 'esit', 0
SEED  DC.W    1
NEW_LINE EQU 10
NEW_LINE_DATA DC.B 13, NEW_LINE, 0
RANDOM_MSG DC.B 'rastgele uretilen sayi=',   0
MESSAGE_PROMPT DC.B 'Tahmin Edilen 4 Haneli  sayı =',0
MESSAGE DC.B 'Tahmin için 4 Basamaklı Sayıyı Giriniz', NEW_LINE, 0
TRUE_MSG DC.B 'Dogru Basamakta Olan Sayı Adeti= ', 0
FALSE_TRUE_MSG DC.B 'Yanlis Basamakta Olan Sayı Adeti= ', 0
FALSE_MSG DC.B 'Yanlis = ', 0
RANDOM_NUMBER DC.L 0
FINIS_MSG DC.B 'Tebrikler 4 basmakda dogu tahmin ettiniz! program sonlandirildi tekrar oynamak icin yeniden baslatin!', 0
SOL_SOL  DC.B '-------------------------------------------------------------------------------------', 0
    END START




