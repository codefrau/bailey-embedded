window.onload = () => {
    console.log("Extracting billbailey.zip...");
    const base64Data = sqImageData.textContent.trim();
    const buffer = Uint8Array.from(atob(base64Data), c => c.charCodeAt(0));
    console.log(`Storing billbailey.zip (${buffer.length} bytes)...`);
    Squeak.filePut("billbailey.zip", buffer, () => {
        console.log("Running Bill Bailey...");
        sqMessage.style.display = "none";
        SqueakJS.runSqueak("billbailey.zip", sqCanvas, {
            appName: "Bill Bailey",
            fixedWidth: 1024,
            fixedHeight: 768,
            spinner: sqSpinner,
        });
    });
};
