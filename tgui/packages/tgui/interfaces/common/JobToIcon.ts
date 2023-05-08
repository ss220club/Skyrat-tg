/** Icon map of jobs to their fontawesome5 (free) counterpart. */
export const JOB2ICON = {
  'AI': 'eye',
  'Assistant': 'toolbox',
  'Atmospheric Technician': 'fan',
  'Bartender': 'cocktail',
  'Botanist': 'seedling',
  'Captain': 'crown',
  'Cargo Technician': 'box',
  'CentCom Commander': 'star',
  'CentCom Head Intern': 'pen-fancy',
  'CentCom Intern': 'pen-alt',
  'CentCom Official': 'medal',
  'Chaplain': 'cross',
  'Chef': 'utensils',
  'Chemist': 'prescription-bottle',
  'Chief Engineer': 'user-astronaut',
  'Chief Medical Officer': 'user-md',
  'Coroner': 'skull',
  'Clown': 'face-grin-tears',
  'Cook': 'utensils',
  'Curator': 'book',
  'Cyborg': 'robot',
  'Detective': 'user-secret',
  'Geneticist': 'dna',
  'Head of Personnel': 'dog',
  'Head of Security': 'user-shield',
  'Janitor': 'soap',
  'Lawyer': 'gavel',
  'Medical Doctor': 'staff-snake',
  'Mime': 'comment-slash',
  'Paramedic': 'truck-medical',
  'Personal AI': 'mobile-alt',
  'Prisoner': 'lock',
  'Psychologist': 'brain',
  'Quartermaster': 'sack-dollar',
  'Research Director': 'user-graduate',
  'Roboticist': 'battery-half',
  'Scientist': 'flask',
  'Security Officer (Cargo)': 'shield-halved',
  'Security Officer (Engineering)': 'shield-halved',
  'Security Officer (Medical)': 'shield-halved',
  'Security Officer (Science)': 'shield-halved',
  'Security Officer': 'shield-halved',
  'Shaft Miner': 'digging',
  'Station Engineer': 'gears',
  'Syndicate Operative': 'dragon',
  'Virologist': 'virus',
  'Warden': 'handcuffs',
  // SKYRAT EDIT START - Skyrat-exclusive jobs have icons too
  'Barber': 'scissors',
  'Blueshield': 'shield-dog',
  'Bouncer': 'shield-heart',
  'Corrections Officer': 'hands-bound',
  'Customs Agent': 'shield-heart',
  'Engineering Guard': 'shield-heart',
  'Nanotrasen Consultant': 'clipboard-check',
  'Orderly': 'shield-heart',
  'Science Guard': 'shield-heart',
  'Security Medic': 'heart-pulse',
  // SKYRAT EDIT END
} as const;

export type AvailableJob = keyof typeof JOB2ICON;
