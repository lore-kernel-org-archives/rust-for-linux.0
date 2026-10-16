Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D034C9DEA
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159880; cv=none; b=rO5SuPicz9sHKXvJIHdHfr5rktJ4jD4KKtXnFrZ3IYuX5KGonEsjyLKZczoCKxBbE0vg08tfz1e0Ek0kw3UbQ6RufdVkaU4wOGIYCQCKXCyu1yBl5jEYEBlKe2MCAhIHc/gIRtGvRXd0gg3y/wdIkhIwhjlz9jKZEJdv7E1XdY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159880; c=relaxed/simple;
	bh=t2qv/JvBYfp9aO9VsSG2FWkpMhPMjgq1wcl4f+gAVD0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WJGjSVBcpbLVkcm3EDUUMQn2zzy1a2VLx7f4VTs2TjC2aemLmVuJ0IhZMb6WmZNBryJ+8nPiKVBQQpSJhuA/2tT7hxJi3+HxKZLtt9lNf+n+CI0kpuoiRDj1HG7hE5xvYUSJ3tjq7lY4tiO3fMP3nnZlLbnRXKrTJ7CQu6JIH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n95Om4K2; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n95Om4K2"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1721559b4so67155455e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 07:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792159871; x=1792764671; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZOVjgcegE9pR3H45A2U8XvzlrYrOHwTIqT89Z+cyhI=;
        b=n95Om4K2qA5VbuP3p4udii/oMFgitSHv4fB7sDhfHCKdzO91Kbwqx+US+zAtdv57Fa
         PAsTJmAw2OgJCAuCQlrSFojQAoWR+tO6HtB3EqoOEO8Ls1Sm4nSAKr8m7WiZMmKJCliN
         6BIgiBTcUAzdX9ym+WIpCMTG7YB4Z1HK+hxLfjki0V1yPXRYosXYJHUskI0u2ziOxAHS
         TdG9hIjGqQTyJyvumvX+7tb8ixvTa0+X+z7cpm0QFREBmN8u1hzV9vBuF1vfoAZJxoX7
         PSmdPJjZ+82sE6SjoOThqd342nZO9lRDIUho1TKDcgRVcndieEiP83ucZ4vPqtTvfuIZ
         xLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159871; x=1792764671;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZOVjgcegE9pR3H45A2U8XvzlrYrOHwTIqT89Z+cyhI=;
        b=LIt5GXRRyHHf6AJJXOOnD99pMhtacnfdqoBPoeaixqLXTFFBetjALY+ZVhULtoULBW
         dKlLsLmxQq5/gh5NLaItVfqxs7q+3UswfI8X5L35qzpzgb226hdNrLJz8SPVsd+Wic6P
         4xYZvUJznp7i/5C+TciPoSnsVoEJ9uoHYvD+5es9kDoESCuE7BG6Gf3wDldTpAkK6jpg
         YozHTyLQEySvd5dHSmUh2cOBuurvFnk1eXWNGAcAEG8N1UywzeEgMoEHmGJd+dQKhRfV
         QwSf4y9E5Zt2803Y9QKse4TbVvG8ETJX8zzdOPeiL8PkPb+5qBfAjLZhQcVfSguxim3q
         uyGw==
X-Forwarded-Encrypted: i=1; AKwUvByen6OpV8TOsoO2lo5w8URGlMSvGyv1wkkUTBxVSx0tTzZYbOiuJlMNZMbgckRKd2aAWHZfG/F1Y2VtnXxTWA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK99C9OCcEP/RyJkW8PJz7GKOcH5TWasd3GhId6yycmZygmx4wN
	pjqwa4PPd6mOG54UKHZKTdWCmSNEyzQNtQHfM6/0bEORBnTQWNkI3gH7mgHea8DYwvpbfwRd/eZ
	DF7r2kq+Oy8PbuaaNiA==
X-Received: from wrph11.prod.google.com ([2002:adf:f4cb:0:b0:48d:ffe9:c5e3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:6445:10b0:4a1:d05d:2af7 with SMTP id 5b1f17b1804b1-4a1d05d2de7mr26351165e9.10.1792159871212;
 Fri, 16 Oct 2026 07:11:11 -0700 (PDT)
Date: Fri, 16 Oct 2026 14:11:04 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHcw0moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NT3aTMvJTUIt2C/Jwc3eLUnDTd8vyibN0kc3MzA2NTCxMjc0sloN6 CotS0zAqwudGxtbUAVCatIWcAAAA=
X-Change-Id: 20261015-binder-poll-self-work-b77603584279
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5769; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=t2qv/JvBYfp9aO9VsSG2FWkpMhPMjgq1wcl4f+gAVD0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq0jB58ksl2JspQUh9CslM675ivM2LFDyhTLB9L
 MDaezNA+HaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatIweQAKCRAEWL7uWMY5
 RmRfEAC6Zlcb2rbLl1vMyR3+he1eo3dGdF5z4ywTLgoZbjGwEu505G/IUN9slRHRRvoJOLnW2bm
 uMoUpiB2wrCxcHNYFVCRT0VuIOZo+zqbgNPmFwMALJl+GOsnmERP97lhLwtAlCqWPQcqLfnRl/p
 LS50sH/mpRDKsqtoCsNH99Hppzlpt4l1EXQ37YP8pnM+CJ5GC+kJW1NmcIcYVl0H058JJCa29OV
 h7tDW/LsMHgs39mCGVNewtGWfcee6kOCSwTtb75aQtwyGmceNwmA595FHdpJ3uFhYHQyrODXdZu
 MBA/gCLwXzeVPjhiKy3JBeNjSb3gZq+VvYiF7p9hVbpWPy/CZFMU1foJqYeQddvhJZbj5EDYkkp
 9BMJNWwOadggYtPu/DHgcrsHzzesVb6yXnyIsgBz381ByWYMl7FRVU3jeKUCFgGttskb2Fj9pZI
 09iYTA+nsPSWX3J7/Qh9Bt2BhZ4qmxbMLdiDJc6qC7pdP5NpVom/qUuRe2YiABYMcmW1CCh4iE3
 gE0MgtR28DVbYVNFAAtSVOxmn0wBUODavgd1VOQ4WvLIqEk+OfLlSeGlhIkHWrpzR3y/xg9RZX9
 NWLf1GxxVuGUL75emes6J8zGsjMotSnsFp8Mprvyha/mIcZS1WZm33yFYZ9nomv2JBI+JMJ3GS/ CSIBbfptHDPEWIA==
X-Mailer: b4 0.14.3
Message-ID: <20261016-binder-poll-self-work-v1-1-c29c87d99abb@google.com>
Subject: [PATCH] rust_binder: wake epoll on self-work queued to poll thread
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org, 
	Poil Zero <poilandgginchi@gmail.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When a thread pushes work to its own todo list, InnerThread::push_work()
returns PushWorkRes::OkNotifyPoll if the thread uses epoll, but four
call sites in thread.rs discard this return value. As a result, a
non-blocking BC_* write that enqueues work onto the calling thread's
todo list without also reading will not wake epoll. Check the return
value and call self.process.notify_poll(false) when
PushWorkRes::OkNotifyPoll is returned.

This is similar to commit 97830f3c3088 ("binder: signal epoll threads of
self-work"), but in C Binder pending thread work also prevented
subsequent process work from waking epoll, causing a permanent hang,
which is not the case in Rust Binder. This means that in practice, it
merely delays notifications rather than completely failing to send them.

Cc: stable@kernel.org
Fixes: dbb17c9ea756 ("rust_binder: move (e)poll wait queue to Process")
Reported-by: Poil Zero <poilandgginchi@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/thread.rs | 48 ++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index bcb2038b7550..177e90a1e5a3 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -345,13 +345,13 @@ fn push_reply_work(&mut self, code: u32) -> PushWorkRes {
         }
     }
 
-    fn push_return_work(&mut self, reply: u32) {
+    fn push_return_work(&mut self, reply: u32) -> PushWorkRes {
         if let Ok(work) = ListArc::try_from_arc(self.return_work.clone()) {
             work.set_error_code(reply);
-            // Not notifying: Reply to current thread.
-            let _ = self.push_work(work);
+            self.push_work(work)
         } else {
             pr_warn!("Thread return work is already in use.");
+            PushWorkRes::Ok
         }
     }
 
@@ -694,8 +694,12 @@ pub(crate) fn push_work_inner(
     pub(crate) fn push_work_if_looper(&self, work: DLArc<dyn DeliverToRead>) -> BinderResult {
         let mut inner = self.inner.lock();
         if inner.is_looper() && !inner.is_dead {
-            // Not notifying: Reply to current thread.
-            let _ = inner.push_work(work);
+            // Not notifying work_condvar: Reply to current thread.
+            let res = inner.push_work(work);
+            drop(inner);
+            if matches!(res, PushWorkRes::OkNotifyPoll) {
+                self.process.notify_poll(false);
+            }
             Ok(())
         } else {
             drop(inner);
@@ -708,7 +712,11 @@ pub(crate) fn push_work_deferred(&self, work: DLArc<dyn DeliverToRead>) {
     }
 
     pub(crate) fn push_return_work(&self, reply: u32) {
-        self.inner.lock().push_return_work(reply);
+        // Not notifying work_condvar: Reply to current thread.
+        let res = self.inner.lock().push_return_work(reply);
+        if matches!(res, PushWorkRes::OkNotifyPoll) {
+            self.process.notify_poll(false);
+        }
     }
 
     pub(crate) fn pop_work_even_if_deferred(&self) -> Option<DLArc<dyn DeliverToRead>> {
@@ -1444,14 +1452,15 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
             let process = orig.from.process.clone();
             let allow_fds = orig.flags.contains(TransactionFlag::AcceptFds);
             let reply = Transaction::new_reply(self, process, info, allow_fds)?;
-            {
-                let mut inner = self.inner.lock();
-                if info.flags.contains(TransactionFlag::DeferComplete) {
-                    // The flag is set. Perform a deferred push so that `read` can wait for the
-                    // next incoming transaction without a userspace roundtrip.
-                    inner.push_work_deferred(completion);
-                } else {
-                    let _ = inner.push_work(completion);
+            if info.flags.contains(TransactionFlag::DeferComplete) {
+                // The flag is set. Perform a deferred push so that `read` can wait for the
+                // next incoming transaction without a userspace roundtrip.
+                self.inner.lock().push_work_deferred(completion);
+            } else {
+                // Not notifying work_condvar: Reply to current thread.
+                let res = self.inner.lock().push_work(completion);
+                if matches!(res, PushWorkRes::OkNotifyPoll) {
+                    self.process.notify_poll(false);
                 }
             }
             orig.from.deliver_reply(Ok(reply), &orig, None);
@@ -1489,10 +1498,15 @@ fn oneway_transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> Bin
         let list_completion =
             DTRWrap::arc_try_new(DeliverCode::new(code, self.process.task.pid()))?;
         let completion = list_completion.clone_arc();
-        // Not notifying: Reply to current thread.
-        let _ = self.inner.lock().push_work(list_completion);
+        // Not notifying work_condvar: Reply to current thread.
+        let res = self.inner.lock().push_work(list_completion);
         match transaction.submit(info) {
-            Ok(()) => Ok(()),
+            Ok(()) => {
+                if matches!(res, PushWorkRes::OkNotifyPoll) {
+                    self.process.notify_poll(false);
+                }
+                Ok(())
+            }
             Err(err) => {
                 completion.skip();
                 Err(err)

---
base-commit: 3de5aa458dede472a253266d02902bd95af8e849
change-id: 20261015-binder-poll-self-work-b77603584279

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

