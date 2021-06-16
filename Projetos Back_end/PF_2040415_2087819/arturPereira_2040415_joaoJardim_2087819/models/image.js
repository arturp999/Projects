module.exports = (sequelize, type) => {
    const images = sequelize.define('image', {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: type.INTEGER
        },
        img_original_name: {
            type: type.STRING
        },
        img_location: {
            type: type.STRING
        },
        img_filename: {
            type: type.STRING
        },
        user_img_id: {
            type: type.INTEGER,
            allowNull: false,
            onDelete: 'CASCADE',
            onUpdate: 'CASCADE',
            references: {
                model: 'uploaders',
                key: 'id'
            }
        }
    }, {
        timestamps: false
    });
    return images
}