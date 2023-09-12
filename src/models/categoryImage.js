// import _sequelize from 'sequelize';

// const { Model } = _sequelize;

// export default class CategoryImages extends Model {
//     static init(sequelize, DataTypes) {
//         super.init({
//             id: {
//                 autoIncrement: true,
//                 type: DataTypes.INTEGER,
//                 allowNull: false,
//                 primaryKey: true
//             },
//             url: {
//                 type: DataTypes.STRING(255),
//                 allowNull: false
//             }
//         }, {
//             sequelize,
//             tableName: 'CategoryImages',
//             timestamps: true,
//             indexes: [
//                 {
//                     name: "PRIMARY",
//                     unique: true,
//                     using: "BTREE",
//                     fields: [
//                         { name: "id" },
//                     ]
//                 }
//             ]
//         });
//         return CategoryImages;
//     }
// }