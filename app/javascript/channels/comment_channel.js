import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p class="item_comment"> ${data.user_nickname} : ${data.content.comment}</p>`;
    const comments = document.getElementById('comments');
    const newMessage = document.getElementById('comment_comment');
    comments.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
