import {useState} from 'react'
import '../App.css'

function CreateCard({postTherapist, counties}){
    const [cardData, setCardData] = useState({
        name: '',
        years_of_experince: '',
        gender: '',
        phone: '',
        county_id:'',
        active: true
    })
    const handleChange = (e) => {
        setCardData({...cardData, [e.target.name]:e.target.value})
    }

    const handleSubmit = (e) => {
        e.preventDefault()
        postTherapist(cardData)
    } 
    return(
        <div className='therapist_form'>
            <h1 className='title'>Therapist Database</h1>
            <form onSubmit={handleSubmit}>
                <label>
                Name:
                <input type="text" name="name" value={cardData.name} onChange={handleChange}/>
                </label>
                <label>
                Years of 
                experience:
                <input type="number" name="years_of_experience" value={cardData.years_of_experience} onChange={handleChange}/>
                </label>
                <label>
                Gender:
                <input type="text" name="gender" value={cardData.gender} onChange={handleChange}/>
                </label>
                <label>
                Phone number:
                <input type="text" name="phone" value={cardData.phone} onChange={handleChange}/>
                </label>
                <label>
                County:
                <select name="county_id" onChange={handleChange}>
                    <option>Select A County</option>
                    {counties.map(c => <option value={c.id}>{c.county_name}</option>)}
                </select>
                </label>
                <input className='submit_btn' type="submit" value="Submit" />
            </form>
        </div>
        
    )
}

export default CreateCard