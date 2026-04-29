class PostEntity {
  final String? id;
  final String title;
  final DateTime? createdAt;
  final String Publisher;
  final String? publisherName;
  final String? publisherImage;
  final String type; // post or report
  final String content;
  final String? imageUrl;
  final int? likesCount;

  PostEntity({this.publisherName,this.publisherImage, this.id, required this.title,  this.createdAt, required this.Publisher, 
        required this.type, required this.content, this.imageUrl, this.likesCount });

  PostEntity copyWith({String? imageUrl, String? id, DateTime? createdAt}) {
    return PostEntity(
      id: id ?? this.id,
      title: title,
      createdAt: createdAt ?? this.createdAt,
      Publisher: Publisher,
      type: type,
      content: content,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}