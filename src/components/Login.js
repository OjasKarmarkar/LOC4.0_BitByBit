import React, { useState } from 'react'
import { app } from '../firebase/Firebase'
import { getAuth, signInWithEmailAndPassword, createUserWithEmailAndPassword, signin } from 'firebase/auth'

function Login() {

  const handleAuth = (type) => {
    const auth = getAuth()
    if (type === "signUp") {
      createUserWithEmailAndPassword(auth, email, password).then(
        (response) => (console.log(response))
      )
    }
  }

  const [email, setEmail] = useState()
  const [password, setPassword] = useState()

  return (
    <div>
      <form action="submit">
        <input type="text" placeholder='email' />
        <input type="password" placeholder='password' />
        <input type="submit" value="submit"/>
      </form>
    </div>
  )
}

export default Login