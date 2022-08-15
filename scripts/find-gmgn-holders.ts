import holders from "./gmgn-holder-info.json"

for (const holder of holders) {
    console.log("\"" + holder.owner.address + "\",");
}