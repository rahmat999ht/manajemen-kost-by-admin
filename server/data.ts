import { MessageProps } from "./types";


export const message = ({ body, title, topic, sound,priority }: MessageProps) => ({
  notification: {
    title,
    body,
    sound,
  },
  android: {
    priority: priority ?? "high",
    // notification: {
    //   imageUrl: "",
    // },
  },
  topic,
});
