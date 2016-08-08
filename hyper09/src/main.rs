#[macro_use]
extern crate hyper;

use hyper::server::{Server, Request, Response};

fn hello(req: Request, res: Response) {
    res.send(b"Hello World!").unwrap();
}

fn main() {
    Server::http("0.0.0.0:8080").unwrap().handle(hello).unwrap();
}
