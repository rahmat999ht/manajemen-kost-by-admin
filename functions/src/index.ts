import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();
const fcm = admin.messaging();

exports.checkHealth = functions.https.onCall(async (data) => {
  return "the functions is online" + data;
});

exports.sendNotification = functions.https.onCall(async (data) => {
  const title = data.title;
  const body = data.body;
  const image = data.image;
  const token = data.token;

  try {
    const payload = {
      token: token,
      notification: {
        title: title,
        body: body,
        image: image,
      },
      body: body,
    };
    return fcm.send(payload).then((res) => {
      return {success: true, response: "Success send message" + res};
    }).catch((e) => {
      return {error: e};
    });
  } catch (e) {
    throw new functions.https.HttpsError("invalid-argument", "error" + e);
  }
});
