import './App.css';
import { useState, useEffect } from 'react'
import Card from './components/Card';
import CreateForm from './components/CreateForm';

function App() {
  const [therapists, setTherapists] = useState([])
  const [counties, setCounties] = useState([])

  useEffect(()=> {
  //Gets counties and therapists
    fetch('http://localhost:9292/therapists')
    .then(res => res.json())
    .then( data => setTherapists(data))
    
    fetch('http://localhost:9292/counties')
    .then(res => res.json())
    .then(data => setCounties(data))
  },[])

  //Creates a Therapist
  const postTherapist = (therapist) => {
    fetch('http://localhost:9292/therapists',{
      method:'POST',
      headers:{
        'Content-Type':'application/json',
      },
      body: JSON.stringify(therapist)
    })
    .then(res => res.json())
    .then(newTherapist => {
      setTherapists([newTherapist,...therapists])
    })
  }
//patches therapist
  const patchTherapist = (therapist) => {
    fetch(`http://localhost:9292/therapists/${therapist.id}`,{
      method:'PATCH',
      headers:{
        'Content-Type':'application/json'
      },
      body: JSON.stringify({...therapist, active: false})
    })
    .then(res => res.json())
    .then(data => {
      setTherapists(therapists.map(st => {
        if(therapists.id === data.id){
          return data
        } else {
          return therapists
        }
      }))
    })
  } 
//Deletes therapist
  const handleDelete = (id) => {
    fetch(`http://localhost:9292/therapists/${id}`,{
      method:'DELETE',
      headers:{'Content-Type':'application/json'}
    })
    .then(res => res.json())
    .then(() => {
      setTherapists(therapists.filter(therapists => therapists.id !== id))
    })
  }
  return (
    <div className="App">
      <div>
      <CreateForm postTherapist={postTherapist} counties={counties}/>
      {therapists.map(th => <Card therapist={th} patchTherapist={patchTherapist} handleDelete={handleDelete} key={`${therapists.id}`}/>)}
      </div> 
    </div> 
  );
}
export default App;