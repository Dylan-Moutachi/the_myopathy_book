import React from 'react';
import Navbar from './components/Navbar'

function App() {
  return (
    <>
      <Navbar/>
      <h1 className="text-2xl font-bold text-center my-4">Hello friend!</h1>
      <div className="mx-25">
        <p>If you found this website, it means that you are looking for answers about muscle disease questions.</p>
        <p>
          That's great! We will heartfully work on writing articles about different pathologies, share latest news about research.
          We want to build a forum there too! So that you can share your questions or experiences each other.
        </p>
        <p className="mb-4">This website is still in progress. Hope it will be satisfying for you!</p>
        <p>Dylan Moutachi</p>
      </div>
    </>
  )
}

export default App
