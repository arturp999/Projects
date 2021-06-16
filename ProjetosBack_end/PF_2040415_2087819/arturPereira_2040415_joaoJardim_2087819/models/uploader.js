module.exports = (sequelize, type) => {
    const Uploader = sequelize.define('uploader', {
        email: type.STRING,
        password: type.STRING,
    }, {
        timestamps: false
    });
    return Uploader
}