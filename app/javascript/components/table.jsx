import React, { useState, useEffect } from "react"

export default function Table() {
  const [bottles, setBottles] = useState([])
  
  useEffect(() => {
    const scriptTag = document.getElementById(("bottles"))
    
    if (scriptTag) {
      const data = JSON.parse(scriptTag.textContent.trim());
      setBottles(data)
    }
  }, []);
  
  return (
   <p>bottles</p>
  )
}
