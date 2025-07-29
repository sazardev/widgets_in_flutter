Map<String, String> imageSourceCodes = {
  // Image codes
  'Image-Asset': '''
Image.asset(
  'assets/images/sample.png',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)''',

  'Image-Network': '''
Image.network(
  'https://picsum.photos/200/200',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  },
  errorBuilder: (context, error, stackTrace) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.grey[300],
      child: Icon(Icons.error, size: 50),
    );
  },
)''',

  'Image-Memory': '''
// From Uint8List bytes
Image.memory(
  bytes, // Uint8List
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)''',

  'Image-File': '''
// From File
Image.file(
  File('path/to/image.jpg'),
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)''',

  // CircleAvatar codes
  'CircleAvatar-Basic': '''
CircleAvatar(
  radius: 50,
  backgroundColor: Colors.blue,
  child: Text(
    'AB',
    style: TextStyle(
      fontSize: 24,
      color: Colors.white,
    ),
  ),
)''',

  'CircleAvatar-Image': '''
CircleAvatar(
  radius: 50,
  backgroundImage: NetworkImage('https://picsum.photos/100/100'),
  child: Text('Loading...'),
)''',

  'CircleAvatar-Asset': '''
CircleAvatar(
  radius: 50,
  backgroundImage: AssetImage('assets/images/profile.jpg'),
)''',

  // Icon codes
  'Icon-Basic': '''
Icon(
  Icons.favorite,
  color: Colors.red,
  size: 30,
)''',

  'Icon-Custom': '''
Icon(
  Icons.star,
  color: Colors.amber,
  size: 40,
  semanticLabel: 'Star icon',
)''',

  'Icon-Material': '''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.home, color: Colors.blue, size: 30),
    Icon(Icons.favorite, color: Colors.red, size: 30),
    Icon(Icons.star, color: Colors.amber, size: 30),
    Icon(Icons.settings, color: Colors.grey, size: 30),
    Icon(Icons.person, color: Colors.green, size: 30),
  ],
)''',

  // ImageIcon codes
  'ImageIcon-Basic': '''
ImageIcon(
  AssetImage('assets/icons/custom_icon.png'),
  color: Colors.blue,
  size: 30,
)''',

  // FadeInImage codes
  'FadeInImage-Network': '''
FadeInImage.networkImage(
  placeholder: 'assets/images/loading.gif',
  image: 'https://picsum.photos/200/200',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
  fadeInDuration: Duration(milliseconds: 500),
  fadeOutDuration: Duration(milliseconds: 300),
)''',

  'FadeInImage-Memory': '''
FadeInImage.memoryNetwork(
  placeholder: placeholderBytes, // Uint8List
  image: 'https://picsum.photos/200/200',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)''',

  // CachedNetworkImage (requires cached_network_image package)
  'CachedNetworkImage-Basic': '''
// Add to pubspec.yaml: cached_network_image: ^3.2.0

CachedNetworkImage(
  imageUrl: 'https://picsum.photos/200/200',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
)''',

  // Container with background image
  'Container-BackgroundImage': '''
Container(
  width: 200,
  height: 200,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: NetworkImage('https://picsum.photos/200/200'),
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Center(
    child: Text(
      'Text over image',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)''',

  // Stack with positioned images
  'Stack-Images': '''
Stack(
  children: [
    Container(
      width: 200,
      height: 200,
      child: Image.network(
        'https://picsum.photos/200/200',
        fit: BoxFit.cover,
      ),
    ),
    Positioned(
      top: 10,
      right: 10,
      child: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage('https://picsum.photos/40/40'),
      ),
    ),
    Positioned(
      bottom: 10,
      left: 10,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          'Image caption',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ],
)''',

  // ClipRRect with image
  'ClipRRect-Image': '''
ClipRRect(
  borderRadius: BorderRadius.circular(15),
  child: Image.network(
    'https://picsum.photos/200/200',
    width: 200,
    height: 200,
    fit: BoxFit.cover,
  ),
)''',

  // ClipOval with image
  'ClipOval-Image': '''
ClipOval(
  child: Image.network(
    'https://picsum.photos/200/200',
    width: 200,
    height: 200,
    fit: BoxFit.cover,
  ),
)''',

  // Hero animation with image
  'Hero-Image': '''
// On first screen:
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
    );
  },
  child: Hero(
    tag: 'imageHero',
    child: Image.network(
      'https://picsum.photos/200/200',
      width: 100,
      height: 100,
    ),
  ),
)

// On second screen:
Hero(
  tag: 'imageHero',
  child: Image.network(
    'https://picsum.photos/200/200',
    width: 300,
    height: 300,
  ),
)''',

  // GridView with images
  'GridView-Images': '''
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 4,
    mainAxisSpacing: 4,
  ),
  itemCount: 10,
  itemBuilder: (context, index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        'https://picsum.photos/200/200?random=\$index',
        fit: BoxFit.cover,
      ),
    );
  },
)''',

  // PhotoView (requires photo_view package)
  'PhotoView-Basic': '''
// Add to pubspec.yaml: photo_view: ^0.14.0

PhotoView(
  imageProvider: NetworkImageProvider('https://picsum.photos/800/600'),
  minScale: PhotoViewComputedScale.contained * 0.8,
  maxScale: PhotoViewComputedScale.covered * 2,
  enableRotation: true,
  backgroundDecoration: BoxDecoration(
    color: Colors.black,
  ),
)''',

  // Image with custom decoration
  'Image-Decorated': '''
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Image.network(
      'https://picsum.photos/200/200',
      width: 200,
      height: 200,
      fit: BoxFit.cover,
    ),
  ),
)''',
};
