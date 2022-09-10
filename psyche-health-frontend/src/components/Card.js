import '../App.css'

function Card({therapist, patchTherapist, handleDelete}){
      return(
        <div className='container'>
          <div className='therapist_card'>
            <h3>Name: {therapist.therapist_name}</h3>
            <p>Years_of_experience: {therapist.years_of_experience}</p>
            <p>Gender: {therapist.gender}</p>
            <p>Phone Number: {therapist.phone}</p>
            <p>County: {therapist.county.county_name}</p>
            {therapist.active? <button onClick={()=> patchTherapist(therapist)}>Deactivate Therapist</button> : <p>Therapist is no longer active</p>}
            <button onClick={() => handleDelete(therapist.id)}>Delete Therapist</button>
          </div>
        </div>
        )
      }
    
    export default Card;