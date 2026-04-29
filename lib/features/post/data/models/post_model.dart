import '../../domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel( {
     super.id,
     required super.title,
     super.createdAt,
    required super.Publisher,
    super.publisherName,
    super.publisherImage,
    required super.type,
    required super.content,
    super.imageUrl,
    super.likesCount,
  });

  factory PostModel.fromEntity(PostEntity entity) {
    return PostModel(
      id: entity.id,
      title: entity.title,
      createdAt: entity.createdAt,
      Publisher: entity.Publisher,
      type: entity.type,
      content: entity.content,
      imageUrl: entity.imageUrl,
      likesCount: entity.likesCount,
    );
  }

  // تحويل من JSON (قادم من Supabase أو SQLite) إلى Model
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title']?? '',
      createdAt: DateTime.parse(json['created_at']),
      Publisher: json['publisher_id'],
      publisherName: json['profiles']!= null?json['profiles']['full_name']:"zz",
      type: json['type'],
      content: json['content'],
      imageUrl: json['image_url'],
      likesCount: json['likes_count'] ?? 0,
    );
  }


 Map<String, dynamic> toJson({bool forSqlite = false}) {
  final map = {
    'content': content,
    'type': type,
    'publisher_id': Publisher,
    'title' : title,
  };
  
  // إذا لم يكن التخزين لـ SQLite، أضف رابط الصورة (مثلاً عند الرفع للسيرفر)
  if (!forSqlite) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      map['image_url'] = imageUrl!;
    }
  }

  return map;
}
}
