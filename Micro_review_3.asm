org 100h

.model small 

.stack 100h

.data

header DB "- Library Management System -",0Dh,0Ah,'$' 
       
NEWLINE    DB 10,13,"$"
      
menu1      DB 0Dh,0Ah,0Dh,0Ah,"1- Display Books in library.",0Dh,0Ah,'$'
menu2      DB "2- Add book.",0Dh,0Ah,'$'
menu3      DB "3- Remove book..",0Dh,0Ah,'$' 
menu4      DB "4- Exit.",0Dh,0Ah,'$'
menu5      DB "Please enter your choice: ",0Dh,0Ah,'$'

book_name  DB 0Dh,0Ah,0Dh,0Ah,"Please write the book name (max 17 character) and press Enter: ",'$'

book_type  DB 0Dh,0Ah,"Please write the book type (max 10 character) and press Enter: ",'$'

book_num   DB 0Dh,0Ah,0Dh,0Ah,"Please write the book number you want to remove and press Enter: ",'$'

book_list  DB 0Dh,0Ah,0Dh,0Ah,"The Book List",0Dh,0Ah,'$'
book_head  DB 0Dh,0Ah,"No.   Book Name           Book Type",'$'

space      DB "     ",'$'     
  
error_msg  DB 0Dh,0Ah,"The book number does not exist",0Dh,0Ah,'$'

full_msg   DB 0Dh,0Ah,"There is no place to add a new book, delete book first",0Dh,0Ah,'$'
           
book1_name DB "  The lost boy   ",'$'
book2_name DB "  Night          ",'$'
book3_name DB "  Shape of light ",'$'
book4_name DB "  Rebecca        ",'$'
book5_name DB "  The Brain      ",'$'
book6_name DB "  The lost boy   ",'$'
book7_name DB 17 dup('$')
book8_name DB 17 dup('$')
book9_name DB 17 dup('$')
bookA_name DB 17 dup('$')
bookB_name DB 17 dup('$')
bookC_name DB 17 dup('$')
bookD_name DB 17 dup('$')
bookE_name DB 17 dup('$')
bookF_name DB 17 dup('$')
book10_name DB 17 dup('$')
book11_name DB 17 dup('$')
book12_name DB 17 dup('$')
book13_name DB 17 dup('$')
book14_name DB 17 dup('$')
book15_name DB 17 dup('$')
book16_name DB 17 dup('$')
book17_name DB 17 dup('$')
book18_name DB 17 dup('$')
book19_name DB 17 dup('$')
book1A_name DB 17 dup('$')
book1B_name DB 17 dup('$')
book1C_name DB 17 dup('$')
book1D_name DB 17 dup('$')
book1E_name DB 17 dup('$')
book1F_name DB 17 dup('$')
book20_name DB 17 dup('$')
book21_name DB 17 dup('$')
book22_name DB 17 dup('$')
book23_name DB 17 dup('$')
book24_name DB 17 dup('$')
book25_name DB 17 dup('$')
book26_name DB 17 dup('$')
book27_name DB 17 dup('$')
book28_name DB 17 dup('$')
book29_name DB 17 dup('$')
book2A_name DB 17 dup('$')
book2B_name DB 17 dup('$')
book2C_name DB 17 dup('$')
book2D_name DB 17 dup('$')
book2E_name DB 17 dup('$')
book2F_name DB 17 dup('$')
book30_name DB 17 dup('$')

book1_type DB "  Story",'$'
book2_type DB "  Story",'$'
book3_type DB "  Art",'$'
book4_type DB "  Art",'$'
book5_type DB "  Science",'$'
book6_type DB "  Science",'$'
book7_type DB 12 dup('$')
book8_type DB 12 dup('$')
book9_type DB 12 dup('$')
bookA_type DB 12 dup('$')
bookB_type DB 12 dup('$')
bookC_type DB 12 dup('$')
bookD_type DB 12 dup('$')
bookE_type DB 12 dup('$')
bookF_type DB 12 dup('$')
book10_type DB 12 dup('$')
book11_type DB 12 dup('$')
book12_type DB 12 dup('$')
book13_type DB 12 dup('$')
book14_type DB 12 dup('$')
book15_type DB 12 dup('$')
book16_type DB 12 dup('$')
book17_type DB 12 dup('$')
book18_type DB 12 dup('$')
book19_type DB 12 dup('$')
book1A_type DB 12 dup('$')
book1B_type DB 12 dup('$')
book1C_type DB 12 dup('$')
book1D_type DB 12 dup('$')
book1E_type DB 12 dup('$')
book1F_type DB 12 dup('$')
book20_type DB 12 dup('$')
book21_type DB 12 dup('$')
book22_type DB 12 dup('$')
book23_type DB 12 dup('$')
book24_type DB 12 dup('$')
book25_type DB 12 dup('$')
book26_type DB 12 dup('$')
book27_type DB 12 dup('$')
book28_type DB 12 dup('$')
book29_type DB 12 dup('$')
book2A_type DB 12 dup('$')
book2B_type DB 12 dup('$')
book2C_type DB 12 dup('$')
book2D_type DB 12 dup('$')
book2E_type DB 12 dup('$')
book2F_type DB 12 dup('$')
book30_type DB 12 dup('$')



available_book DB 1, 2, 3, 4, 5 ,6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
area       DD 0
operation  DB 0

.code

begin:
      mov ax,@data
      mov ds,ax

      ; print message for the header
      MOV AH,09H
      LEA DX,header
      INT 21H
      MOV AH,09H
      LEA DX,NEWLINE
      INT 21H

;================================================ 

  start:
      
      ;code to choose one choice from the menu
      MOV AH,09H
      LEA DX, menu1
      INT 21H
      LEA DX, menu2
      INT 21H
      LEA DX, menu3
      INT 21H
      LEA DX, menu4
      INT 21H
      LEA DX, menu5
      INT 21H

get_choice:
      ; read the user choice
      mov ah, 1
      int 21h

      ; first choice
      cmp al, '1'
      je  FIRST_CHOICE
      
      ; second choice
      cmp al, '2'
      je  SECOND_CHOICE
      
      ; third choice
      cmp al, '3'
      je  THIRD_CHOICE

      ; forth choice
      cmp al, '4'
      je  FORTH_CHOICE
      
      ; loop back to get_choice until the user choose
      jmp get_choice
;================================================ 

FIRST_CHOICE:
      ; print raduis msg
      MOV AH,09H
      LEA DX, book_list
      INT 21H 
      LEA DX, book_head
      INT 21H

      lea si, available_book
      mov bl, 0
      
  print_book:
      inc bl  ; book counter
      
      mov al, [si]
      inc si
      cmp al, 0  ; go to next book
      je next_book
      cmp al, 1  ; go to book 1
      je book1
      cmp al, 2  ; go to book 2
      je book2
      cmp al, 3  ; go to book 3
      je book3
      cmp al, 4  ; go to book 4
      je book4
      cmp al, 5  ; go to book 5
      je book5
      cmp al, 6  ; go to book 6
      je book6
      cmp al, 7  ; go to book 7
      je book7
      cmp al, 8  ; go to book 8
      je book8
      cmp al, 9  ; go to book 9
      je book9
      cmp al, 0AH  ; go to book A
      je bookA
      cmp al, 0BH  ; go to book B
      je bookB
      cmp al, 0CH  ; go to book C
      je bookC
      cmp al, 0DH  ; go to book D
      je bookD
      cmp al, 0EH  ; go to book E
      je bookE
      cmp al, 0FH  ; go to book F
      je bookF
      cmp al, 10H  ; go to book 10
      je book10
      cmp al, 11  ; go to book 11
      je book11
      cmp al, 12  ; go to book 12
      je book12
      cmp al, 13  ; go to book 13
      je book13
      cmp al, 14  ; go to book 14
      je book14
      cmp al, 15  ; go to book 15
      je book15
      cmp al, 16  ; go to book 16
      je book16
      cmp al, 17  ; go to book 17
      je book17
      cmp al, 18  ; go to book 18
      je book18
      cmp al, 19  ; go to book 19
      je book19
      cmp al, 1AH  ; go to book 1A
      je book1A
      cmp al, 1BH  ; go to book 1B
      je book1B
      cmp al, 1CH  ; go to book 1C
      je book1C
      cmp al, 1DH  ; go to book 1D
      je book1D
      cmp al, 1EH  ; go to book 1E
      je book1E
      cmp al, 1FH  ; go to book 1F
      je book1F
      cmp al, 20H  ; go to book 20
      je book20
      cmp al, 21  ; go to book 21
      je book21
      cmp al, 22  ; go to book 22
      je book22
      cmp al, 23  ; go to book 23
      je book23
      cmp al, 24  ; go to book 24
      je book24
      cmp al, 25  ; go to book 25
      je book25
      cmp al, 26  ; go to book 26
      je book26
      cmp al, 27  ; go to book 27
      je book27
      cmp al, 28  ; go to book 28
      je book28
      cmp al, 29  ; go to book 29
      je book29
      cmp al, 2AH  ; go to book 2A
      je book2A
      cmp al, 2BH  ; go to book 2B
      je book2B
      cmp al, 2CH  ; go to book 2C
      je book2C
      cmp al, 2DH  ; go to book 2D
      je book2D
      cmp al, 2EH  ; go to book 2E
      je book2E
      cmp al, 2FH  ; go to book 2F
      je book2F
      cmp al, 30H  ; go to book 30
      je book30
      
    print_book_1:  
      ; print new line
      MOV AH,09H
      LEA DX, NEWLINE
      INT 21H    
      ; print book number
      MOV AH,02H
      MOV Dl, bl
      add Dl, 48
      INT 21H
      ; print space
      MOV AH,09H
      LEA DX, space
      INT 21H 
      ; print book_name
      MOV AH,09H
      ret 
      
    print_book_2:
      add dx,02h          ; to get rid of the space on the beginning or the buffer size
      INT 21H   
      ; print space
      MOV AH,09H
      LEA DX, space
      INT 21H 
      ; print book1_type
      MOV AH,09H
      ret
    
    print_book_3:
      add dx,02h          ; to get rid of the space on the beginning or the buffer size
      INT 21H
      ret       
    
    ; Display respective book 
      
    book1:
      CALL print_book_1 
      LEA DX, book1_name
      CALL print_book_2
      LEA DX, book1_type
      CALL print_book_3    
      jmp next_book   
      
    book2: 
      CALL print_book_1 
      LEA DX, book2_name
      CALL print_book_2
      LEA DX, book2_type
      CALL print_book_3    
      jmp next_book  
      
    book3: 
      CALL print_book_1 
      LEA DX, book3_name
      CALL print_book_2
      LEA DX, book3_type
      CALL print_book_3    
      jmp next_book  
      
    book4: 
      CALL print_book_1 
      LEA DX, book4_name
      CALL print_book_2
      LEA DX, book4_type
      CALL print_book_3    
      jmp next_book
      
    book5: 
      CALL print_book_1 
      LEA DX, book5_name
      CALL print_book_2
      LEA DX, book5_type
      CALL print_book_3    
      jmp next_book  
      
    book6: 
      CALL print_book_1 
      LEA DX, book6_name
      CALL print_book_2
      LEA DX, book6_type
      CALL print_book_3    
      jmp next_book   
      
    book7: 
      CALL print_book_1 
      LEA DX, book7_name
      CALL print_book_2
      LEA DX, book7_type
      CALL print_book_3    
      jmp next_book 
      
    book8: 
      CALL print_book_1 
      LEA DX, book8_name
      CALL print_book_2
      LEA DX, book8_type
      CALL print_book_3    
      jmp next_book 
      
    book9: 
      CALL print_book_1 
      LEA DX, book9_name
      CALL print_book_2
      LEA DX, book9_type
      CALL print_book_3    
      jmp next_book
    
    bookA: 
      CALL print_book_1 
      LEA DX, bookA_name
      CALL print_book_2
      LEA DX, bookA_type
      CALL print_book_3    
      jmp next_book
      
    bookB: 
      CALL print_book_1 
      LEA DX, bookB_name
      CALL print_book_2
      LEA DX, bookB_type
      CALL print_book_3    
      jmp next_book
      
    bookC: 
      CALL print_book_1 
      LEA DX, bookC_name
      CALL print_book_2
      LEA DX, bookC_type
      CALL print_book_3    
      jmp next_book
      
    bookD: 
      CALL print_book_1 
      LEA DX, bookD_name
      CALL print_book_2
      LEA DX, bookD_type
      CALL print_book_3    
      jmp next_book
      
    bookE: 
      CALL print_book_1 
      LEA DX, bookE_name
      CALL print_book_2
      LEA DX, bookE_type
      CALL print_book_3    
      jmp next_book
    
    bookF: 
      CALL print_book_1 
      LEA DX, bookF_name
      CALL print_book_2
      LEA DX, bookF_type
      CALL print_book_3    
      jmp next_book 
      
    book10: 
      CALL print_book_1 
      LEA DX, book10_name
      CALL print_book_2
      LEA DX, book10_type
      CALL print_book_3    
      jmp next_book
    
    book11:
      CALL print_book_1 
      LEA DX, book11_name
      CALL print_book_2
      LEA DX, book11_type
      CALL print_book_3    
      jmp next_book   
      
    book12: 
      CALL print_book_1 
      LEA DX, book12_name
      CALL print_book_2
      LEA DX, book12_type
      CALL print_book_3    
      jmp next_book  
      
    book13: 
      CALL print_book_1 
      LEA DX, book13_name
      CALL print_book_2
      LEA DX, book13_type
      CALL print_book_3    
      jmp next_book  
      
    book14: 
      CALL print_book_1 
      LEA DX, book14_name
      CALL print_book_2
      LEA DX, book14_type
      CALL print_book_3    
      jmp next_book
      
    book15: 
      CALL print_book_1 
      LEA DX, book15_name
      CALL print_book_2
      LEA DX, book15_type
      CALL print_book_3    
      jmp next_book  
      
    book16: 
      CALL print_book_1 
      LEA DX, book16_name
      CALL print_book_2
      LEA DX, book16_type
      CALL print_book_3    
      jmp next_book   
      
    book17: 
      CALL print_book_1 
      LEA DX, book17_name
      CALL print_book_2
      LEA DX, book17_type
      CALL print_book_3    
      jmp next_book 
      
    book18: 
      CALL print_book_1 
      LEA DX, book18_name
      CALL print_book_2
      LEA DX, book18_type
      CALL print_book_3    
      jmp next_book 
      
    book19: 
      CALL print_book_1 
      LEA DX, book19_name
      CALL print_book_2
      LEA DX, book19_type
      CALL print_book_3    
      jmp next_book
    
    book1A: 
      CALL print_book_1 
      LEA DX, book1A_name
      CALL print_book_2
      LEA DX, book1A_type
      CALL print_book_3    
      jmp next_book
      
    book1B: 
      CALL print_book_1 
      LEA DX, book1B_name
      CALL print_book_2
      LEA DX, book1B_type
      CALL print_book_3    
      jmp next_book
      
    book1C: 
      CALL print_book_1 
      LEA DX, book1C_name
      CALL print_book_2
      LEA DX, book1C_type
      CALL print_book_3    
      jmp next_book
      
    book1D: 
      CALL print_book_1 
      LEA DX, book1D_name
      CALL print_book_2
      LEA DX, book1D_type
      CALL print_book_3    
      jmp next_book
      
    book1E: 
      CALL print_book_1 
      LEA DX, book1E_name
      CALL print_book_2
      LEA DX, book1E_type
      CALL print_book_3    
      jmp next_book
    
    book1F: 
      CALL print_book_1 
      LEA DX, book1F_name
      CALL print_book_2
      LEA DX, book1F_type
      CALL print_book_3    
      jmp next_book 
      
    book20: 
      CALL print_book_1 
      LEA DX, book20_name
      CALL print_book_2
      LEA DX, book20_type
      CALL print_book_3    
      jmp next_book
    
    book21:
      CALL print_book_1 
      LEA DX, book21_name
      CALL print_book_2
      LEA DX, book21_type
      CALL print_book_3    
      jmp next_book   
      
    book22: 
      CALL print_book_1 
      LEA DX, book22_name
      CALL print_book_2
      LEA DX, book22_type
      CALL print_book_3    
      jmp next_book  
      
    book23: 
      CALL print_book_1 
      LEA DX, book23_name
      CALL print_book_2
      LEA DX, book23_type
      CALL print_book_3    
      jmp next_book  
      
    book24: 
      CALL print_book_1 
      LEA DX, book24_name
      CALL print_book_2
      LEA DX, book24_type
      CALL print_book_3    
      jmp next_book
      
    book25: 
      CALL print_book_1 
      LEA DX, book25_name
      CALL print_book_2
      LEA DX, book25_type
      CALL print_book_3    
      jmp next_book  
      
    book26: 
      CALL print_book_1 
      LEA DX, book26_name
      CALL print_book_2
      LEA DX, book26_type
      CALL print_book_3    
      jmp next_book   
      
    book27: 
      CALL print_book_1 
      LEA DX, book27_name
      CALL print_book_2
      LEA DX, book27_type
      CALL print_book_3    
      jmp next_book 
      
    book28: 
      CALL print_book_1 
      LEA DX, book28_name
      CALL print_book_2
      LEA DX, book28_type
      CALL print_book_3    
      jmp next_book 
      
    book29: 
      CALL print_book_1 
      LEA DX, book29_name
      CALL print_book_2
      LEA DX, book29_type
      CALL print_book_3    
      jmp next_book
    
    book2A: 
      CALL print_book_1 
      LEA DX, book2A_name
      CALL print_book_2
      LEA DX, book2A_type
      CALL print_book_3    
      jmp next_book
      
    book2B: 
      CALL print_book_1 
      LEA DX, book2B_name
      CALL print_book_2
      LEA DX, book2B_type
      CALL print_book_3    
      jmp next_book
      
    book2C: 
      CALL print_book_1 
      LEA DX, book2C_name
      CALL print_book_2
      LEA DX, book2C_type
      CALL print_book_3    
      jmp next_book
      
    book2D: 
      CALL print_book_1 
      LEA DX, book2D_name
      CALL print_book_2
      LEA DX, book2D_type
      CALL print_book_3    
      jmp next_book
      
    book2E: 
      CALL print_book_1 
      LEA DX, book2E_name
      CALL print_book_2
      LEA DX, book2E_type
      CALL print_book_3    
      jmp next_book
    
    book2F: 
      CALL print_book_1 
      LEA DX, book2F_name
      CALL print_book_2
      LEA DX, book2F_type
      CALL print_book_3    
      jmp next_book 
      
    book30: 
      CALL print_book_1 
      LEA DX, book30_name
      CALL print_book_2
      LEA DX, book30_type
      CALL print_book_3    
      jmp next_book
     
      
       
      
  next_book:
    cmp bl, 30H
    jg start
    jmp print_book 


;================================================ 
      
SECOND_CHOICE:
  
      lea si, available_book
      mov bl, 0
       
  add_book:
      ; check for empty place
      mov al, [si]
      inc si
      inc bl  ; book counter
      cmp bl, 30H
      jg full_place  ; there is no place to add a new book
      cmp al, 0  ; there is empty place
      je found_place
      jmp add_book
      
  found_place:
      dec si
      mov [si], bl  ; save the book num in the list
      mov al, bl  ; al now have the number of the empty place to add the book
      cmp al, 1  ; add book at place 1
      je add_book1
      cmp al, 2  ; add book at place 2
      je add_book2
      cmp al, 3  ; add book at place 3
      je add_book3
      cmp al, 4  ; add book at place 4
      je add_book4
      cmp al, 5  ; add book at place 5
      je add_book5
      cmp al, 6  ; add book at place 6
      je add_book6
      cmp al, 7  ; add book at place 7
      je add_book7
      cmp al, 8  ; add book at place 8
      je add_book8
      cmp al, 9  ; add book at place 9
      je add_book9
      cmp al, 0AH  ; add book at place 10
      je add_bookA
      cmp al, 0BH  ; add book at place 11
      je add_bookB
      cmp al, 0CH  ; add book at place 12
      je add_bookC
      cmp al, 0DH  ; add book at place 13
      je add_bookD
      cmp al, 0EH  ; add book at place 14
      je add_bookE
      cmp al, 0FH  ; add book at place 15
      je add_bookF
      cmp al, 10H  ; add book at place 16
      je add_book10 
      cmp al, 11  ; add book at place 17
      je add_book11
      cmp al, 12  ; add book at place 18
      je add_book12
      cmp al, 13  ; add book at place 19
      je add_book13
      cmp al, 14  ; add book at place 20
      je add_book14
      cmp al, 15  ; add book at place 21
      je add_book15
      cmp al, 16  ; add book at place 22
      je add_book16
      cmp al, 17  ; add book at place 23
      je add_book17
      cmp al, 18  ; add book at place 24
      je add_book18
      cmp al, 19  ; add book at place 25
      je add_book19
      cmp al, 1AH  ; add book at place 26
      je add_book1A
      cmp al, 1BH  ; add book at place 27
      je add_book1B
      cmp al, 1CH  ; add book at place 28
      je add_book1C
      cmp al, 1DH  ; add book at place 29
      je add_book1D
      cmp al, 1EH  ; add book at place 30
      je add_book1E
      cmp al, 1FH  ; add book at place 31
      je add_book1F
      cmp al, 20H  ; add book at place 32
      je add_book20
      cmp al, 21  ; add book at place 33
      je add_book21
      cmp al, 22  ; add book at place 34
      je add_book22
      cmp al, 23  ; add book at place 35
      je add_book23
      cmp al, 24  ; add book at place 36
      je add_book24
      cmp al, 25  ; add book at place 37
      je add_book25
      cmp al, 26  ; add book at place 38
      je add_book26
      cmp al, 27  ; add book at place 39
      je add_book27
      cmp al, 28  ; add book at place 40
      je add_book28
      cmp al, 29  ; add book at place 41
      je add_book29
      cmp al, 2AH  ; add book at place 42
      je add_book2A
      cmp al, 2BH  ; add book at place 43
      je add_book2B
      cmp al, 2CH  ; add book at place 44
      je add_book2C
      cmp al, 2DH  ; add book at place 45
      je add_book2D
      cmp al, 2EH  ; add book at place 46
      je add_book2E
      cmp al, 2FH  ; add book at place 47
      je add_book2F
      cmp al, 30H  ; add book at place 48
      je add_book30 
    
    add_book_1:
      ; print book_name msg
      MOV AH,09H
      LEA DX, book_name
      INT 21H
      ; Get the book name
      mov ah,0ah
      ret
    
    add_book_2:
      int 21h 
      mov si, dx   ; save the address for space padding
      
      ; print NEWLINE
      MOV AH,09H
      LEA DX, NEWLINE
      INT 21H
      
      ; print book_type msg
      MOV AH,09H
      LEA DX, book_type
      INT 21H       
      ; Get the book type
      mov ah,0ah
      ret 
    
    add_book_3:
      int 21h 
      mov di, dx   ; save the address for end string
      jmp space_pad
      ret
    
    ; add book in place 1
    add_book1:
      CALL add_book_1
      lea dx, book1_name
      CALL add_book_2
      lea dx, book1_type
      CALL add_book_3
      
    
    ; add book in place 2    
    add_book2:
      CALL add_book_1
      lea dx, book2_name
      CALL add_book_2
      lea dx, book2_type
      CALL add_book_3

    ; add book in place 3 
    add_book3:
      CALL add_book_1
      lea dx, book3_name
      CALL add_book_2
      lea dx, book3_type
      CALL add_book_3
      
    ; add book in place 4 
    add_book4:
      CALL add_book_1
      lea dx, book4_name
      CALL add_book_2
      lea dx, book4_type
      CALL add_book_3
      
    ; add book in place 5 
    add_book5:
      CALL add_book_1
      lea dx, book5_name
      CALL add_book_2
      lea dx, book5_type
      CALL add_book_3
      
    ; add book in place 6 
    add_book6:
      CALL add_book_1
      lea dx, book6_name
      CALL add_book_2
      lea dx, book6_type
      CALL add_book_3
      
    ; add book in place 7 
    add_book7:
      CALL add_book_1
      lea dx, book7_name
      CALL add_book_2
      lea dx, book7_type
      CALL add_book_3
      
    ; add book in place 8 
    add_book8:
      CALL add_book_1
      lea dx, book8_name
      CALL add_book_2
      lea dx, book8_type
      CALL add_book_3

    ; add book in place 9 
    add_book9:
      CALL add_book_1
      lea dx, book9_name
      CALL add_book_2
      lea dx, book9_type
      CALL add_book_3
    
    
    ; add book in place 10
    add_bookA:
      CALL add_book_1
      lea dx, bookA_name
      CALL add_book_2
      lea dx, bookA_type
      CALL add_book_3
      
    
    ; add book in place 11    
    add_bookB:
      CALL add_book_1
      lea dx, bookB_name
      CALL add_book_2
      lea dx, bookB_type
      CALL add_book_3

    ; add book in place 12 
    add_bookC:
      CALL add_book_1
      lea dx, bookC_name
      CALL add_book_2
      lea dx, bookC_type
      CALL add_book_3
      
    ; add book in place 13 
    add_bookD:
      CALL add_book_1
      lea dx, bookD_name
      CALL add_book_2
      lea dx, bookD_type
      CALL add_book_3
      
    ; add book in place 14 
    add_bookE:
      CALL add_book_1
      lea dx, bookE_name
      CALL add_book_2
      lea dx, bookE_type
      CALL add_book_3
      
    ; add book in place 15 
    add_bookF:
      CALL add_book_1
      lea dx, bookF_name
      CALL add_book_2
      lea dx, bookF_type
      CALL add_book_3 
      
    ; add book in place 16 
    add_book10:
      CALL add_book_1
      lea dx, book10_name
      CALL add_book_2
      lea dx, book10_type
      CALL add_book_3
                     
    ; add book in place 17
    add_book11:
      CALL add_book_1
      lea dx, book11_name
      CALL add_book_2
      lea dx, book11_type
      CALL add_book_3
      
    
    ; add book in place 18    
    add_book12:
      CALL add_book_1
      lea dx, book12_name
      CALL add_book_2
      lea dx, book12_type
      CALL add_book_3

    ; add book in place 19 
    add_book13:
      CALL add_book_1
      lea dx, book13_name
      CALL add_book_2
      lea dx, book13_type
      CALL add_book_3
      
    ; add book in place 20 
    add_book14:
      CALL add_book_1
      lea dx, book14_name
      CALL add_book_2
      lea dx, book14_type
      CALL add_book_3
      
    ; add book in place 21 
    add_book15:
      CALL add_book_1
      lea dx, book15_name
      CALL add_book_2
      lea dx, book15_type
      CALL add_book_3
      
    ; add book in place 22 
    add_book16:
      CALL add_book_1
      lea dx, book16_name
      CALL add_book_2
      lea dx, book16_type
      CALL add_book_3
      
    ; add book in place 23 
    add_book17:
      CALL add_book_1
      lea dx, book17_name
      CALL add_book_2
      lea dx, book17_type
      CALL add_book_3
      
    ; add book in place 24 
    add_book18:
      CALL add_book_1
      lea dx, book18_name
      CALL add_book_2
      lea dx, book18_type
      CALL add_book_3

    ; add book in place 25 
    add_book19:
      CALL add_book_1
      lea dx, book19_name
      CALL add_book_2
      lea dx, book19_type
      CALL add_book_3
    
    
    ; add book in place 26
    add_book1A:
      CALL add_book_1
      lea dx, book1A_name
      CALL add_book_2
      lea dx, book1A_type
      CALL add_book_3
      
    
    ; add book in place 27    
    add_book1B:
      CALL add_book_1
      lea dx, book1B_name
      CALL add_book_2
      lea dx, book1B_type
      CALL add_book_3

    ; add book in place 28 
    add_book1C:
      CALL add_book_1
      lea dx, book1C_name
      CALL add_book_2
      lea dx, book1C_type
      CALL add_book_3
      
    ; add book in place 29 
    add_book1D:
      CALL add_book_1
      lea dx, book1D_name
      CALL add_book_2
      lea dx, book1D_type
      CALL add_book_3
      
    ; add book in place 30 
    add_book1E:
      CALL add_book_1
      lea dx, book1E_name
      CALL add_book_2
      lea dx, book1E_type
      CALL add_book_3
      
    ; add book in place 31 
    add_book1F:
      CALL add_book_1
      lea dx, book1F_name
      CALL add_book_2
      lea dx, book1F_type
      CALL add_book_3 
      
    ; add book in place 32 
    add_book20:
      CALL add_book_1
      lea dx, book20_name
      CALL add_book_2
      lea dx, book20_type
      CALL add_book_3
                     
    ; add book in place 33
    add_book21:
      CALL add_book_1
      lea dx, book21_name
      CALL add_book_2
      lea dx, book21_type
      CALL add_book_3
      
    
    ; add book in place 34    
    add_book22:
      CALL add_book_1
      lea dx, book22_name
      CALL add_book_2
      lea dx, book22_type
      CALL add_book_3

    ; add book in place 35 
    add_book23:
      CALL add_book_1
      lea dx, book23_name
      CALL add_book_2
      lea dx, book23_type
      CALL add_book_3
      
    ; add book in place 36 
    add_book24:
      CALL add_book_1
      lea dx, book24_name
      CALL add_book_2
      lea dx, book24_type
      CALL add_book_3
      
    ; add book in place 37 
    add_book25:
      CALL add_book_1
      lea dx, book25_name
      CALL add_book_2
      lea dx, book25_type
      CALL add_book_3
      
    ; add book in place 38 
    add_book26:
      CALL add_book_1
      lea dx, book26_name
      CALL add_book_2
      lea dx, book26_type
      CALL add_book_3
      
    ; add book in place 39 
    add_book27:
      CALL add_book_1
      lea dx, book27_name
      CALL add_book_2
      lea dx, book27_type
      CALL add_book_3
      
    ; add book in place 40 
    add_book28:
      CALL add_book_1
      lea dx, book28_name
      CALL add_book_2
      lea dx, book28_type
      CALL add_book_3

    ; add book in place 41 
    add_book29:
      CALL add_book_1
      lea dx, book29_name
      CALL add_book_2
      lea dx, book29_type
      CALL add_book_3
    
    
    ; add book in place 42
    add_book2A:
      CALL add_book_1
      lea dx, book2A_name
      CALL add_book_2
      lea dx, book2A_type
      CALL add_book_3
      
    
    ; add book in place 43    
    add_book2B:
      CALL add_book_1
      lea dx, book2B_name
      CALL add_book_2
      lea dx, book2B_type
      CALL add_book_3

    ; add book in place 44 
    add_book2C:
      CALL add_book_1
      lea dx, book2C_name
      CALL add_book_2
      lea dx, book2C_type
      CALL add_book_3
      
    ; add book in place 45 
    add_book2D:
      CALL add_book_1
      lea dx, book2D_name
      CALL add_book_2
      lea dx, book2D_type
      CALL add_book_3
      
    ; add book in place 46 
    add_book2E:
      CALL add_book_1
      lea dx, book2E_name
      CALL add_book_2
      lea dx, book2E_type
      CALL add_book_3
      
    ; add book in place 47 
    add_book2F:
      CALL add_book_1
      lea dx, book2F_name
      CALL add_book_2
      lea dx, book2F_type
      CALL add_book_3 
      
    ; add book in place 48 
    add_book30:
      CALL add_book_1
      lea dx, book30_name
      CALL add_book_2
      lea dx, book30_type
      CALL add_book_3
    
                     
  ; when there is no space for new book  
  full_place:
      ; print full_msg
      mov ah,09h
      lea dx, full_msg
      int 21h
      jmp start
      
  ; fill the rest of the name with space for printing
  space_pad:
    mov ax, 0
    mov cx, 0
    mov al, [si+1]  ; get the length of the string
    add al, 2       ; for the buffer size  
    mov cl, 17
    sub cl, al      ; initilaize the counter
    add ax, si      
    mov si, ax      ; go to character after the last character
    space_loop:
      mov [si], 32  ; add space to the name
      inc si
    loop space_loop 
    mov [si], '$'
    
    ; add $ to the end of the book type string
    mov ax, 0
    mov cx, 0
    mov al, [di+1]  ; get the length of the string
    add al, 2       ; for the buffer size  
    add ax, di      
    mov di, ax      ; go to character after the last character
    mov [di], '$'   ; add $ to the end        
    
    jmp start 
;================================================ 
      
THIRD_CHOICE:
      ; print book_num msg
      mov ah,09h
      lea dx, book_num
      int 21h
      ; read the user choice
      mov ah, 1
      int 21h
      sub al, 48
       
      lea si, available_book
      mov bl, 0
      
      ; check for book
    check_book:
      cmp al, [si]
      je found_book
      inc si
      inc bl  ; book counter
      cmp bl, 30H
      jg wrong  ; there is no place to add a new book
      jmp check_book      
    
  found_book:
      mov [si], 0
      
      jmp start
  
  wrong:
      ; print error_msg
      mov ah,0ah
      lea dx, error_msg
      int 21h    
      
      jmp start
;================================================     
 
FORTH_CHOICE:

      mov ah,4Ch
      int 21h 