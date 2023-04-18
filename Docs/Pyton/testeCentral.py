import socket
import select
import time
HOST = 'localhost'
PORT = 9091


def main():
    # instantiate a socket object
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    print('socket instantiated')

    # bind the socket
    sock.bind((HOST, PORT))
    print('socket binded')

    # start the socket listening
    sock.listen()
    print('socket now listening')

    # accept the socket response from the client, and get the connection object
    conn, addr = sock.accept()      # Note: execution waits here until the client calls sock.connect()
    print('socket accepted, got connection object')

    myCounter = 0
    while True:
        print('sending..' + str(myCounter))
        pkt = b'\x02\x18\x62\x35\x64\xfa\x6f\xca\x80\xf3\x63\x35\x80\xf3\x63\x35\x80\xa2\xf7\x35\x80\xf3\x63\x35\x80\xf3\xf3\x80\x35\x63\x03';
        conn.sendall(pkt)
        myCounter += 1
        time.sleep(3)
    # end while
# end function

if __name__ == '__main__':
    main()