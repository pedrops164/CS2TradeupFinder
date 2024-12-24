
export const getSkinCondition = (floatValue) => {
    if (floatValue < 0 || floatValue > 1) {
        throw new Error("Float value must be between 0 and 1");
    }

    if (floatValue < 0.07) {
        return "Factory New";
    } else if (floatValue < 0.15) {
        return "Minimal Wear";
    } else if (floatValue < 0.38) {
        return "Field-Tested";
    } else if (floatValue < 0.45) {
        return "Well-Worn";
    } else {
        return "Battle-Scarred";
    }
};