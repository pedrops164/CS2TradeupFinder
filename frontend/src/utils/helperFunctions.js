
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

export const rarityOptions = [
    ["consumer_bg", "Consumer Grade"],
    ["industrial_bg", "Industrial Grade"],
    ["milspec_bg", "Mil-Spec"],
    ["restricted_bg", "Restricted"],
    ["classified_bg", "Classified"],
    ["covert_bg", "Covert"]
  ];

export const getRarityDisplay = (rarityKey) => {
    const found = rarityOptions.find(option => option[0] === rarityKey);
    return found ? found[1] : rarityKey;
};

export const getRarityColor = (rarityKey) => {
    switch (rarityKey) {
        case "consumer_bg":
            return "#A3B6C7";
        case "industrial_bg":
            return "#436E9F";
        case "milspec_bg":
            return "#4967FC";
        case "restricted_bg":
            return "#743ED7";
        case "classified_bg":
            return "#D72DEA";
        case "covert_bg":
            return "#EE4C4B";
        default:
            return "black";
    }
}