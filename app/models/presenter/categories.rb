class Presenter::Categories
  CATEGORIES = {
    "Veterinarian" => ["Companion", "Exotic", "Livestock", "Aquatic", "Birds", "Equine", "Poultry", "Reptile"],
    "Lawyers" => ["Criminal", "Business", "Debt", "Patents", "Estate", "Injury", "Healthcare"],
    "Radiology" => ["Open MRI", "MRI", "PET", "Gamma Knife", "X-Ray", "CT", "US"],
    "Dentists" => ["General", "Crowns", "Extractions", "Orthodontics", "Osseous Surgery", "Dentures", "Cosmetic"],
    "Medical Tourism" => ["Surgery", "Oncology", "Cardiovascular", "Transplant", "Orthopedics", "Cosmetic", "Sports Med", "Neuro", "Open Heart", "Dental", "Weight loss"],
    "Rehabilitation" => ["Addiction", "Therapy", "Weight loss", "Surgery", "Psychiatric", "Juvenile"],
    "Other Medical" => ["Acupuncture", "Chiropractic", "Midwifery", "Hearing", "Nursing", "Pain Mgmt", "Respiratory", "Reflexology", "Therapy", "Prosthetics", "Speech"],
    "Professional Development" => ["Music", "Dance", "Ballet", "Sports", "Voice", "Theatre", "Acting", "Equestrian", "Art", "Computer"],
    "Other Professionals" => ["Architect", "Forensic Accountant", "International Accountant", "Venture Capitalist", "Private investigator"],
    "Homeowner Services" => ["Landscaping", "Inspection", "Electrical", "A/C & Heating", "Remodeling", "Painting", "Irrigation", "Tree Service", "Security"],
    "Marine" => ["Engineer","Architect", "Small Engine", "Large Engine", "Haul & Store", "Hull Repair", "Boat Builder"],
    "Specialty Services" => ["Insurance", "Escrow", "Video ", "Hunter", "Trapper", "House Mover"],
    "Physicians" => [
      '11 Audiologists',
      '12 Allergist',
      '13 Andrologists',
      '14 Anesthesiologists',
      '15 Cardiologist',
      '16 Dentist',
      '17 Dermatologists',
      '18 Endocrinologists',
      '19 Epidemiologists',
      '20 Family Practician',
      '21 Gastroenterologists',
      '22 Gynecologists',
      '23 Hematologists',
      '24 Hepatologists',
      '25 Immunologists',
      '26 Infectious Disease ',
      '27 Specialists',
      '28 Internal Medicine ',
      '29 Specialists',
      '30 Internists',
      '31 Medical Geneticist',
      '32 Microbiologists',
      '33 Neonatologist',
      '34 Nephrologist',
      '35 Neurologist',
      '36 Neurosurgeons',
      '37 Obstetrician',
      '38 Oncologist',
      '39 Ophthalmologist',
      '40 Orthopedic Surgeons',
      '41 ENT specialists',
      '42 Perinatologist',
      '43 Paleopathologist',
      '44 Parasitologist',
      '46 Pathologists',
      '47 Pediatricians',
      '48 Physiologists',
      '49 Physiatrist',
      '50 Plastic Surgeon',
      '51 Podiatrists',
      '52 Psychiatrists',
      '53 Pulmonologist',
      '54 Radiologists',
      '55 Rheumatologsists',
      '56 Surgeons',
      '57 Urologists',
      '58 Emergency Doctors',
      '59 Veterinarian'
    ],
    "Sport Training" => ["Football", "Baseball", "Soccer", "Basketball", "Tennis", "Gymnastics", " Climbing", "Rodeo", "Equestrian", "Sailing", "Swim", "Golf"]
  }

  def categories
    CATEGORIES.keys
  end

  def specialties(category = nil)
    if category
      CATEGORIES[category]
    else
      CATEGORIES.first.last
    end
  end
end
