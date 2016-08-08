use std::thread;
use std::io::{Read, Write, BufReader, BufRead};
use std::net::{TcpListener, TcpStream};

fn main() { 
    let listener = TcpListener::bind("127.0.0.1:8080").unwrap();

    for stream in listener.incoming() {
        match stream {
            Ok(stream) => {
                thread::spawn(move || {
                    handle_request(stream);
                });
            }
            Err(_) => {
                println!("Error");
            }
        }
    }
}

fn handle_request(stream: TcpStream) {
    let mut reader = BufReader::new(stream);
    send_response(reader.into_inner());
}

fn send_response(mut stream: TcpStream) {
    let response = "HTTP/1.1 200 OK\n\n<html><body>Hello, World!</body></html>";
    stream.write_all(response.as_bytes()).unwrap();
}

