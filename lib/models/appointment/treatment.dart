class Treatment {
  var id;
  var treatment;
  var code;
  var price;
  var toothSections;
  var facilityId;
  var treatmentCategory;
  var subCategory;
  var createdAt;
  var updatedAt;

  Treatment(
      {this.id,
      this.treatment,
      this.code,
      this.price,
      this.toothSections,
      this.facilityId,
      this.treatmentCategory,
      this.subCategory,
      this.createdAt,
      this.updatedAt});

  factory Treatment.fromJson(Map<String, dynamic> parsedJson) {
    return Treatment(
      id: parsedJson['id'],
      treatment: parsedJson['treatment'],
      code: parsedJson['code'],
      price: parsedJson['price'],
      toothSections: parsedJson['tooth_sections'],
      facilityId: parsedJson['facility_id'],
      treatmentCategory: parsedJson['treatment_category'],
      subCategory: parsedJson['subcategory'],
      createdAt: parsedJson['created_at'],
      updatedAt: parsedJson['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['treatment'] = this.treatment;
    data['code'] = this.code;
    data['price'] = this.price;
    data['tooth_sections'] = this.toothSections;
    data['facility_id'] = this.facilityId;
    data['treatment_category'] = this.treatmentCategory;
    data['subcategory'] = this.subCategory;
    data['created_at'] = this.createdAt;
    return data;
  }
}
