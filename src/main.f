      program sample1

      CHARACTER(len=16) :: cmd_option_name , value_name
      CHARACTER(len=512) :: inputdeck
      INTEGER :: num_of_args, i, io_status
      LOGICAL :: args_error_flag = .false.

      DOUBLE PRECISION :: a, b, c, d

      num_of_args = iargc()

      do i=1, num_of_args, 2
            call getarg(i,cmd_option_name)

            if( cmd_option_name .eq. "-i") then
                  call getarg(i+1,inputdeck)
                  write (*,*)  inputdeck
            else
                  args_error_flag = .true.
                  write (*,*) "ERROR: INVALID COMAND OPTION: " ,
     +            cmd_option_name
            endif
      enddo

      if ( args_error_flag .eqv. .true. ) then
            write (*,*) "CHECK YOUR COMAND OPTION"
            stop
      endif
        
      write (*,*) "Input file path : ", inputdeck


      open(1,file=trim(inputdeck),iostat=io_status, status='old')
      if (io_status /= 0) then
            write(*,*) 'File open error'
            stop
      end if


      do
            READ(1,*, IOSTAT=io) value_name
            if ( io < 0) then
                  WRITE(*,*) "Inputdeck file read end"
                  EXIT
            end if

            BACKSPACE (1)

            if ( value_name .eq. "a") then
                  READ(1,*) value_name,  a
                  WRITE(*,*) "a = ", a
            else if ( value_name .eq. "b") then
                  READ(1,*) value_name,  b
                  WRITE(*,*) "b = ", b
            else  if ( value_name .eq. "c") then
                  read(1,*) value_name,  c
                  write(*,*) "c = ", c
            else  if ( value_name .eq. "d") then
                  read(1,*) value_name, d
                  write(*,*) "d = ", d
            else
                  WRITE(*,*) "Inputdeck value read error"
                  stop
            endif
      end do

      CALL SYSTEM("rm -rf result")
      CALL SYSTEM("mkdir result")


      open(2,file="result/result.oneD")
      write(2,*)"#NumField: 1"
      write(2,*)"#LabelX: time, LabelY: a*sine(bx-c)+d"
      write(2,*) "#Field1: sine() , NumPoint:128"

      PI = 3.140592

      do t=1, 129, 1
            x = (4*PI * t )/128 -2*PI
            y = a*sin(b*x - c) +d
            write(2,'(F10.3, F10.3)') x, y
      enddo

      CLOSE(2)

      CLOSE(1)



      end program
