package com.scalatra24.app

import org.scalatra._

class Scalatra24Servlet extends Scalatra24Stack {

  get("/") {
    <html>
      <body>
        <h1>Hello, world!</h1>
        Say <a href="hello-scalate">hello to Scalate</a>.
      </body>
    </html>
  }

}
