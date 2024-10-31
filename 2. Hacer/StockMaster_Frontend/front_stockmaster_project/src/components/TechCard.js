const TechCard = ({ tech, image, text, link }) => {
  return (
    <div className='tech-card'>
      <img className='tech-image' src={image} alt={tech} />
      <h3 className='tech-title'>{tech}</h3>
      <p className='tech-text'>{text}</p>
      <a className='tech-button' href={link}>
        Ver la API
      </a>
    </div>
  );
};

export default TechCard;
