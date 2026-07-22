Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1305E33ADA7
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 21:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754573; cv=none; b=K9y/VF2KH5owYeoVnbLYqioCSMA439XtgARGpC5K4dnLEQMPlSO8KkVjnUmtyTeiSQG9of9WMTo41SMqJb5S4ejBBcDnIzd2Jw07U2VF7UFjtspnCn/2/aEJWnLJ4Kdnlxf8O5iu2mPiOYuOymiLr3r+sAJmnOijdyOa7zrnl5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754573; c=relaxed/simple;
	bh=t5RwgUTaH5M9kRWyGURkC8HeC0l9B/s9piR2QGnoAy4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dTaSg0soTBScoYxWxHTLbxbe1gALQKnyUT5k74094ltB5BihQPVSY+ExgUgtHExoGHWP55GemmDelt4kqrBadiWUXBqf21WWIGIBZ5glPpcLl8FU3K2FFMZUgmdHQSTAN7eacw4u922Lwjq+1HWBheUCfBJ4VC929PfAG6XpiSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I0RVAVEU; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I0RVAVEU"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4956c1655c3so6971915e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 14:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784754570; x=1785359370; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNQEV2stmZS3ZSr7vZKBKxIMqHGZ/9vvFA0yE3lwS2k=;
        b=I0RVAVEUZLzdTBNxFysoe5yb3XjEwvLXRBWe8qDmjHAkcozhjKNrWKUwOqXcDTbQAO
         GeFkGxmTuokkMEXglYVqdhn38syyq7di7+AqcUN+ZaKZl7u77lIY03xgtSmfH91mQ9Y6
         Q9dG+xxCib3OnFLB8d7DEJetQ2pqMa5kr9tMjAn+IdHRiUuNT7HCQFdxSZqsMgHXm9cM
         fT+kgzXVEHSnNApbl0M8X0pHYc6qDT2ZIK7y9Mtj+ci8k0nIYvk/HVgS9IHUbMyG2XPb
         zebkUqNRAScO+90LXg0SdhhkyH54t200HnJ72bTOlUbHOU3TVnwYhmU4Fs/YfwqQkL0r
         o8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754570; x=1785359370;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNQEV2stmZS3ZSr7vZKBKxIMqHGZ/9vvFA0yE3lwS2k=;
        b=A1XsnNGWzQ2el2lWIsv4lwbcLkyKCKaVp0AL5rb6FgkJ+YiN9hsPRprM86nCtFpbWV
         ZmbeIbKW0ur87kzvyufpW2uHXEzfGRBIZcQow+MZk3lJfwrgyCi6Z0mVurEJ9coABFj7
         0qxF7fY+oSdKxSuAFKuwRsy84yVHlLCYaR/vTDBPVCN6GoJZdduma4atIJk+82L0FBf3
         ty1Y4SWi6gAdN3CKuwUpogSP/HqmLbeDuICHsoxjU0J6ZW11LUGdKh/pJuh5N4wUvjDD
         t78Q9xY+QO9um1EOvGVxx7Ta8Y+WlxFmQ+Bgh/+DJrxxSXAivsBRz97VtKbx4iXKiSya
         ibiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqSzMP8dd+g2ntW43d5as89hCgPVz16323BbfSJmO0lWgrnTfybI+/mNmJ4XNxDPctou36JplGog17aEe6ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC7W3JBPfLkYZ3hgqAsllnZA2Bx+/3/U/4OqMTk3rETwueil6o
	2R5gGnhsjxlOpCl199RoN2XX/5N3P4LNH66nfYAZ99+DiGhW1py7JnnlKEoGJ2gVSCfDa8Xy4Wc
	NqrPhZFKsZtzWjfX7IQ==
X-Received: from wmbjj16.prod.google.com ([2002:a05:600c:6a10:b0:495:5422:15f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:cb83:0:b0:495:6b55:f938 with SMTP id 5b1f17b1804b1-49573cc6d02mr2294815e9.10.1784754569961;
 Wed, 22 Jul 2026 14:09:29 -0700 (PDT)
Date: Wed, 22 Jul 2026 21:09:22 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIExYWoC/13MQQqDMBCF4avIrJuSidTarrxHcRGSFw1YI4lIi
 +TuTYVuuvyHed9OCdEj0b3aKWLzyYe5hDpVZEY9DxDeliYlVSOvfBEWDlGY8FwmrBCOLfRNO65 1S2W0RDj/OsBHX3r0aQ3xffgbf68/qvmnNhYsDCTq1tbSmqYbQhgmnMsH9TnnD5ohQh2tAAAA
X-Change-Id: 20260715-defer-complete-f1dea9af13a8
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11530; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=t5RwgUTaH5M9kRWyGURkC8HeC0l9B/s9piR2QGnoAy4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqYTGE4zFUf7aPm0FHBsO7mI8c+9XLvGapkpu9r
 4dWP571irOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCamExhAAKCRAEWL7uWMY5
 RrFDEACc+Ju1ZctpRLjgT1APtZckSMKu30tezbOzA1ioFm5MkQlW01nqz5tcOMI3t/pFdp+dEGl
 S8vDWwatVBaIyy618jI0Q3zW5qcu1OE+65QFkltezs7VBLqMa+2xHsdR65MfO92aD1kqqawQujC
 txI886x2400sbwL+pvAdUjfMRron21KB+FcnC+pYHM+O+SDxH064Oua/pTiW/ITDPz77gjVqpVI
 X5OHkuTRaMpQa/9HxyzhsQxia3FGDB/jeQEn0rhod4MGqxZjgPL1YIaHuv8RSwfVDSC776qvElg
 8u6BxMDCT99speKd5LJ7pMo+q+bcBn7VYn5JQkjurgNNFeoqEV/QtBxwoYhxv3+B6XwRz54CX+w
 UBaQq/qvxJF7wApvKUsjaLRSHLpVov4PSME+iWG0ZpCkazMMWfDh2In3SlT3ARHK7lj9cgVQOmP
 G8MJKqoUjcXGSf7D5X0Lkk7B4ZLHf6JrzOCJ24Mpp7KUhOyrJEIAfn1CtjL/nsZEs/ekCv9+aP1
 WZSnbhpzr0Y+Qz9lOPRmNCmCuZCHeOn5k47603/XQ55gphDqJHLzZ9F7fWcsgLo8d4hlzClPJU1
 3agNNgUgXuA9UUnly9iTZRg4Lm3HSTS5sE+H8AKcEYgxbU+LIU9r0PMwKgYKX53KEUeMJl/WK7C plCa9HD4HgMbejw==
X-Mailer: b4 0.14.3
Message-ID: <20260722-defer-complete-v2-1-6c67af0e2ac2@google.com>
Subject: [PATCH v2] rust_binder: add TF_DEFER_COMPLETE flag for avoiding
 userspace roundtrip
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Todd Kjos <tkjos@android.com>, 
	Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Outgoing transactions are able to send a message and wait for its reply
in a single ioctl. Why not avoid a userspace roundtrip by applying the
same logic for replying to incoming messages and waiting for the next
incoming message?

Generally, when you send a reply using BC_REPLY, the kernel sends
BR_TRANSACTION_COMPLETE as a reply to BC_REPLY right away. The
BR_TRANSACTION_COMPLETE command indicates that it's safe for userspace
to free any resources associated with this message (such as embedded fds
or Binder nodes). However, the BR_TRANSACTION_COMPLETE message is
problematic because after BC_REPLY is issued, there will be a pending
message for userspace. The kernel will refuse to sleep for incoming
messages in this scenario.

The way this is handled for outgoing transaction is through a mechanism
known as deferred delivery of BR_TRANSACTION_COMPLETE. The idea is that
when you send an outgoing transaction, then we do not return to
userspace right away if BR_TRANSACTION_COMPLETE is the only pending
message. This patch adds a new flag called TF_DEFER_COMPLETE that lets
userspace opt-in to the same deferred delivery mechanism for
BR_TRANSACTION_COMPLETE when using BC_REPLY.

Given this new uapi, we can adjust sendReply in userspace libbinder
so that it writes the BC_REPLY command into mOut but does not flush the
buffer to the kernel. Then, userspace simply continues running until it
returns all the way out to the top-level joinThreadPool() loop, which
calls into the kernel to get the next incoming transaction. At this
point, mOut is flushed, sending the reply. The same ioctl then proceeds
to sleep for an incoming message.

Userspace only actually specifies TF_DEFER_COMPLETE when the Parcel does
not contain fds or refcounts on binder objects. This is because
otherwise said fd or binder node will not be freed until the binder
thread receives another incoming transaction, which could be a long
time. In the case of fds, this is especially important because delaying
fclose() can result in processes hanging because they read from a pipe
that isn't being closed due to fclose() not getting called. Note that
even if TF_DEFER_COMPLETE is not specified for this transaction, it can
still be useful to defer the BC_REPLY command, as it can still avoid a
userspace roundtrip when a new incoming transaction is available right
away.

Observing the cuttlefish logs while booting with this change shows that
there were 4297 opportunities for this optimization to kick in (that is,
boot invoked BC_REPLY 4297 times). Out of those, 3441 binder ioctls sent
and received a transaction in the same ioctl. This indicates that we
successfully eliminated a syscall on the server side for 80% of incoming
transactions. Generally, this means that a server is now able to handle
incoming messages using one syscall per incoming message (for each
incoming transaction, the syscall handles one BC_FREE_BUFFER and
BC_REPLY command, and then waits for the next incoming transaction).

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Return deferred thread work instead of the process global work if
  there is work in the process global list.
- Link to v1: https://lore.kernel.org/r/20260716-defer-complete-v1-1-ce0e38d30dc6@google.com
---
 drivers/android/binder/defs.rs      |  3 +-
 drivers/android/binder/process.rs   |  8 ++++++
 drivers/android/binder/thread.rs    | 55 +++++++++++++++++++++++++++++++------
 include/uapi/linux/android/binder.h |  1 +
 4 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/drivers/android/binder/defs.rs b/drivers/android/binder/defs.rs
index 8ac9bdd7a499..cc4becd6e168 100644
--- a/drivers/android/binder/defs.rs
+++ b/drivers/android/binder/defs.rs
@@ -77,7 +77,8 @@ macro_rules! pub_no_prefix {
     TF_ONE_WAY,
     TF_ACCEPT_FDS,
     TF_CLEAR_BUF,
-    TF_UPDATE_TXN
+    TF_UPDATE_TXN,
+    TF_DEFER_COMPLETE,
 );
 
 pub(crate) use uapi::{
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 1778628d8acd..4f23a7cf7352 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -686,8 +686,16 @@ pub(crate) fn get_work(&self) -> Option<DLArc<dyn DeliverToRead>> {
     pub(crate) fn get_work_or_register<'a>(
         &'a self,
         thread: &'a Arc<Thread>,
+        thread_has_deferred_work: bool,
     ) -> GetWorkOrRegister<'a> {
         let mut inner = self.inner.lock();
+
+        if thread_has_deferred_work && !inner.work.is_empty() {
+            if let Some(work) = thread.pop_work_even_if_deferred() {
+                return GetWorkOrRegister::Work(work);
+            }
+        }
+
         // Try to get work from the process queue.
         if let Some(work) = inner.work.pop_front() {
             return GetWorkOrRegister::Work(work);
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index a51821dde0ad..c4d67b9ef39b 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -572,9 +572,21 @@ fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn Deliv
     // mangled symbol names.
     #[export_name = "rust_binder_wait"]
     fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRead>>> {
+        let thread_has_deferred_work;
+
         // Try to get work from the thread's work queue, using only a local lock.
         {
             let mut inner = self.inner.lock();
+
+            // The process_work_list boolean is used to make us go to sleep even if there is work
+            // in the thread todo-list, but it doesn't apply to the process todo-list. Furthermore,
+            // work in the thread todo-list must still be delivered before the process list.
+            //
+            // Thus, in some scenarios we must return the thread work now even if we were requested
+            // to wait. Adjust `process_work_list` to `true` accordingly.
+            inner.process_work_list |= inner.looper_need_return;
+            inner.process_work_list |= !wait;
+
             if let Some(work) = inner.pop_work() {
                 return Ok(Some(work));
             }
@@ -582,18 +594,26 @@ fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRe
                 drop(inner);
                 return Ok(self.process.get_work());
             }
+
+            // Note that if the thread list is empty, then the call to `pop_work()` has changed
+            // `process_work_list` back to `false` even if we set it to `true` above.
+            thread_has_deferred_work = inner.process_work_list;
         }
 
         // If the caller doesn't want to wait, try to grab work from the process queue.
         //
         // We know nothing will have been queued directly to the thread queue because it is not in
-        // a transaction and it is not in the process' ready list.
+        // a transaction and it is not in the process' ready list. We also know the thread list has
+        // no deferred work due to the `inner.process_work_list |= !wait` call above.
         if !wait {
             return self.process.get_work().ok_or(EAGAIN).map(Some);
         }
 
         // Get work from the process queue. If none is available, atomically register as ready.
-        let reg = match self.process.get_work_or_register(self) {
+        let reg = match self
+            .process
+            .get_work_or_register(self, thread_has_deferred_work)
+        {
             GetWorkOrRegister::Work(work) => return Ok(Some(work)),
             GetWorkOrRegister::Register(reg) => reg,
         };
@@ -609,14 +629,18 @@ fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRe
             inner.looper_flags &= !(LOOPER_WAITING | LOOPER_WAITING_PROC);
 
             if signal_pending || inner.looper_need_return {
-                // We need to return now. We need to pull the thread off the list of ready threads
-                // (by dropping `reg`), then check the state again after it's off the list to
-                // ensure that something was not queued in the meantime. If something has been
-                // queued, we just return it (instead of the error).
+                // We need to return now.
+                //
+                // We need to pull the thread off the list of ready threads (by dropping `reg`),
+                // then check the state again after it's off the list to ensure that something was
+                // not queued in the meantime. If something has been queued (or if there is
+                // deferred work), we just return it (instead of the error).
                 drop(inner);
                 drop(reg);
 
-                let res = match self.inner.lock().pop_work() {
+                inner = self.inner.lock();
+                inner.process_work_list = true;
+                let res = match inner.pop_work() {
                     Some(work) => Ok(Some(work)),
                     None if signal_pending => Err(EINTR),
                     None => Ok(None),
@@ -674,6 +698,12 @@ pub(crate) fn push_return_work(&self, reply: u32) {
         self.inner.lock().push_return_work(reply);
     }
 
+    pub(crate) fn pop_work_even_if_deferred(&self) -> Option<DLArc<dyn DeliverToRead>> {
+        let mut thread_inner = self.inner.lock();
+        thread_inner.process_work_list = true;
+        thread_inner.pop_work()
+    }
+
     fn translate_object(
         &self,
         obj_index: usize,
@@ -1398,8 +1428,15 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
             let process = orig.from.process.clone();
             let allow_fds = orig.flags & TF_ACCEPT_FDS != 0;
             let reply = Transaction::new_reply(self, process, info, allow_fds)?;
-            // Not notifying: Reply to current thread.
-            let _ = self.inner.lock().push_work(completion);
+            {
+                // This performs a deferred push so that `read` can wait for the next incoming
+                // transaction without a userspace roundtrip.
+                let mut inner = self.inner.lock();
+                inner.push_work_deferred(completion);
+                // However, if `TF_DEFER_COMPLETE` is not set, then set `process_work_list` to make
+                // the push non-deferred. This forces a userspace roundtrip.
+                inner.process_work_list |= info.flags & TF_DEFER_COMPLETE == 0;
+            }
             orig.from.deliver_reply(Ok(reply), &orig, None);
             Ok(())
         })()
diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/android/binder.h
index 701cad36de43..96e5b0184a1b 100644
--- a/include/uapi/linux/android/binder.h
+++ b/include/uapi/linux/android/binder.h
@@ -296,6 +296,7 @@ enum transaction_flags {
 	TF_ACCEPT_FDS	= 0x10,	/* allow replies with file descriptors */
 	TF_CLEAR_BUF	= 0x20,	/* clear buffer on txn complete */
 	TF_UPDATE_TXN	= 0x40,	/* update the outdated pending async txn */
+	TF_DEFER_COMPLETE = 0x80,	/* defer transaction complete to userspace */
 };
 
 struct binder_transaction_data {

---
base-commit: 2cedf2272f1bb42471e646868ac572cc5752bd91
change-id: 20260715-defer-complete-f1dea9af13a8

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

