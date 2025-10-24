class Book {
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  const Book({
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
  });
}

// mock data
final List<Book> sampleBooks = [
  Book(
    title: 'Carmer and Grit – Part One: Rising Through the Sparks',
    author: 'Sarah Jean Horwitz',
    description:
        'Part One of “Carmer and Grit” introduces Felix Carmer III, a young tinkerer and apprentice magician who dreams of designing inventions that will change the world. '
        'But in the bustling steampunk city of Skemantis, innovation is a luxury few can afford, and Felix’s master expects results that dazzle the crowds, not devices that actually work. '
        'When a string of mysterious disappearances hits the city’s magical fairs, Carmer crosses paths with Grit, a sharp-tongued faerie with one broken wing and a relentless curiosity about the human world.\n\n'
        'Bound by necessity and a shared sense of rebellion, the two form an uneasy alliance to uncover the truth behind the vanishings. '
        'As they descend into the smoky underbelly of Skemantis — through clockwork carnivals, hidden laboratories, and faerie politics — they find themselves chasing more than a culprit. '
        'Every clue leads them deeper into a conspiracy that challenges the fragile balance between science and magic. '
        'For Felix, it’s a chance to prove his inventions can do more than entertain. For Grit, it’s a fight for her people’s freedom — and perhaps a way to reclaim her lost wings.\n\n'
        'Rising through sparks, steam, and shattered gears, “Rising Through the Sparks” begins a journey of friendship, discovery, and courage — a tale where heart and invention collide in a city that thrives on illusion.',
    imageUrl:
        'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1473880864i/30753993.jpg',
  ),
  Book(
    title: 'James and the Giant Peach',
    author: 'Roald Dahl',
    description:
        'At just four years old, James Henry Trotter experiences tragedy beyond his years when a runaway rhinoceros from the London Zoo devours his parents—leaving him orphaned and alone. '
        'Sent to live with his Aunt Spiker and Aunt Sponge, two cruel and heartless women who confine him to a cold attic with little more than bare floorboards and endless chores, James’s days become grim and solitary. '
        'Everything changes the day a mysterious old man presents James with a bag of enchanted green crystals. When the crystals spill beneath an ancient peach tree, a single peach blossoms into an enormous fruit the size of a house. '
        'Locked out of the marvel his aunts exploit for profit, James ventures through a tunnel into the giant peach’s pit—where he meets a band of talking insects: the jubilant Centipede, the weary Earthworm, the elegant Grasshopper, gentle Ladybug, brave Miss Spider, shimmering Glowworm, and quiet Silkworm.\n\n'
        'Together, James and his new companions launch the peach on a daring journey across oceans and skies. Seagulls lift them aloft, sharks give chase, and storm-cloud dwellers hurl thunder and color. '
        'All the while, James discovers his own courage, his true worth, and the meaning of family—not the one he was born into, but the one he chooses. '
        'When the peach finally lands on the spire of New York’s iconic Empire State Building, James stands tall: no longer a frightened, lonely boy, but a confident young explorer with friends at his side and a future that stretches far beyond the hills of his aunts’ garden.',
    imageUrl:
        'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1320412586i/6689.jpg',
  ),
  Book(
    title: 'Little Gods',
    author: 'Meng Jin',
    description:
        'On the night of June 4, 1989, in a Beijing maternity ward filled with uncertainty and fear, Su Lan gives birth to her daughter Liya — while the world outside erupts in tumult at Tiananmen Square. What follows is a layered journey across time, space and memory as Liya, now grown, returns to China after her mother’s sudden death to uncover the voids her mother left behind.\n\n'
        'Raised in the United States with only fragments of her origin, Liya pieces together Su Lan’s story through the voices of others — a neighbor in Shanghai, a former lover, a missing father, and letters that hint at secrets buried in the heart of a physicist who refused to be defined by history or by expectations. As Liya travels through Beijing, Shanghai and rural Zhejiang, the novel moves through the decades, weaving between past and present, science and myth, ambition and regret.\n\n'
        '“Little Gods” is as much a meditation on how time shapes us as it is a portrait of the women and men who carry the weight of an era. Su Lan’s brilliance in theoretical physics and her restless desire to bend the arrow of time reflect a deeper uncertainty: Can one escape the past when it is embedded in the body, in language, in an unfinished sentence? Liya’s quest becomes a reckoning with memory, identity and belonging — where missing pieces cannot always be recovered, but the act of seeking itself reshapes the future.',
    imageUrl:
        'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1568647683i/44890075.jpg',
  ),
  Book(
    title: 'A Clockwork Orange',
    author: 'Anthony Burgess',
    description:
        'In a dystopian near-future Britain ravaged by youth gangs and rampant “ultraviolence,” fifteen-year-old Alex leads his gang of droogs through nights of theft, beating and subversion. Their enjoyment of chaos is entwined with classical music and a violent slang known as Nadsat, bringing both horror and dark humour to their rampages. \n\n'
        'After a botched robbery and murder, Alex is captured and sent to prison, where he volunteers for the controversial Ludovico Technique—an experimental form of aversion therapy that strips him not only of his criminal impulses but also his ability to choose anything at all. When he is released back into society, the once-fearsome Alex finds himself powerless: rejected by friends, prey to the victims he once tormented, and confronted with the brutal irony of being “good” only because his freedom was taken away. \n\n'
        'Burgess’s narrative forces a confrontation with the nature of morality, the role of the state in enforcing conformity and the essential value of choice. Even as Alex’s story descends into violence and cruelty, it ultimately asks whether a man who cannot choose evil can truly be called good.',
    imageUrl:
        'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1549260060i/41817486.jpg',
  ),
];
