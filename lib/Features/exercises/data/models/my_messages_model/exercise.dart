
import '../../../domain/entities/exercise_entity.dart';

typedef AllExercisesList = List<ExerciseEntity>?;

class Exercise extends ExerciseEntity {
  const Exercise({
    super.id,
    super.catIdFk,
    super.title,
    super.tamrenFor,
    super.magmo3at,
    super.tkrar,
    super.restInSec,
    super.instructions,
    super.catName,
    super.mainImage,
    super.allImages,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json["id"]?.toString(),
        catIdFk: json["cat_id_fk"]?.toString(),
        title: json["title"],
        tamrenFor: json["tamren_for"],
        magmo3at: json["magmo3at"]?.toString(),
        tkrar: json["tkrar"]?.toString(),
        restInSec: json["rest_in_sec"]?.toString(),
        instructions: json["instructions"],
        catName: json["cat_name"],
        mainImage: json["main_image"],
        allImages: json["all_images"] != null 
            ? List<String>.from(json["all_images"].map((x) => x.toString()))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_id_fk": catIdFk,
        "title": title,
        "tamren_for": tamrenFor,
        "magmo3at": magmo3at,
        "tkrar": tkrar,
        "rest_in_sec": restInSec,
        "instructions": instructions,
        "cat_name": catName,
        "main_image": mainImage,
        "all_images": allImages,
      };
}
