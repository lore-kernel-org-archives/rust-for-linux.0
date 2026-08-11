Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA24E35F60A
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 20:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786481797; cv=none; b=WvfZhfngoHbuEuijaiTEYpKcGwe28q88uL/JvSkkLKX6ZjqEY++YqCAwhyB2ODN2Fn6DoNxN13Ln8O0SaDkvdAm2GqPF93S0kmQahLSq0HqzofW3w8Czitl7vpbf94LqEOTwk6p7/2U+WsZW3rl3K+GvpoQJRzOQzU0aiTs60lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786481797; c=relaxed/simple;
	bh=UxpQuPDZMVfmmIAjlwIEb72bJkHC0Qq3qHhMpOV+BSM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=l18Afidov6fldkxrUsyECSLURCJlUrG7nqfbPzxxQJIzy7sN3I+5keWz/IA0rjyTlYBzup/cbqJtz5aTSRgCferctFIq94E5+vq+hSMyxcAQap7IWSehXcRteC50JYg3HusyJ2+a7mu/hGtXCt+oEpfWLexkL4J2lg29LI4l0Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kah5jY3r; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kah5jY3r"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4814718d124so133813f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 13:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786481793; x=1787086593; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gQou73Hn7MTIx8JHpEHvr0Wb6XXHr+BxrzHwBrXtBbs=;
        b=Kah5jY3rgTfwf3RHlV51Q5MiE2l4t48D5vLSIyUDesDVhCl40ISm5GcmgyvRWC1E7r
         YXacqs56KqaRnuSa1pRNXsnBxO6xlQADkbV8AMIiq6BhPtEAyQDLhj89aK1HvZGbxqXg
         m6XP/r8N6/RvYEWNRyUhHR26ueDtsfyR2k/mpL8KNOewyck61Jux7jsSrJ//oEy0J+MF
         FIUyhz9xebJefXYoaUiw+Wser/3zeex14AGm2+NzzfaRkhOBl1cKlf7rV/HpraxLGqYc
         ac6YPk5tDNTaF+yc4JhnBhvXAOtcMiYv0KfKNfSnayzu1oduNSUWoVMVdx5F2zFnyU1V
         Y89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786481793; x=1787086593;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQou73Hn7MTIx8JHpEHvr0Wb6XXHr+BxrzHwBrXtBbs=;
        b=omElS3ZFYnDkAdnaGJ0G5iP2yJuwytStSSrMOj50N9p7mao4exqidRbx241nsHusgh
         +l2Bc4ADUUUSup3xKZuzH6/KP3A7JBNtcKWmoDBmX8VTuSIMZWlfaImlbRN7F6E8tMdh
         +R0MuyrPhrg5T9HPWJwLGA9JqZANhvGifiWL2pvQjVozxQ9Oe7E/cXtL81EUt/KAK8M1
         1Y4goXQ02WY5kVykIaIdsClSlSq24sOPEkld3MVjxpMBMq3bQZBA1BeX1GVkuiC/5Mrv
         a3T9V8DownShoVt5Xo8S5bvqBC6/ZipvGwl6OMfXjQONQiARA5tlXyoeh4SEZR8oOgzJ
         SE+A==
X-Forwarded-Encrypted: i=1; AHgh+RqXIHTsG1o6zumC1o9cesOkJKe2Z61dYj4AEpfHGw7Mz0c1ggQjcoC4SX0GibI80pa747Z+vENGu0DVvz0HmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgLJfY6PZXAywY9wNLbH6R693GVed8AWOtjtRCOIyfmCbRNsve
	pDznbS/csDo6HBtdjWuRGtKF3pXjv/WfHb6tPxby70DNzEn4NHBC119VCiEVzHeGxZsm4jf/GBH
	GhazaVKkTJL2jTkL9Iw==
X-Received: from wmpx22.prod.google.com ([2002:a05:600c:1896:b0:493:b4d4:96bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3586:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4997c116f31mr411015e9.7.1786481792527;
 Tue, 11 Aug 2026 13:56:32 -0700 (PDT)
Date: Tue, 11 Aug 2026 20:56:25 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHiMe2oC/2WMywrDIBBFfyXMuhYdqUm7yn+ULkTHREhj0CAtI
 f9eEyj0sTyXe84CiaKnBJdqgUjZJx/GAvJQgen12BHztjAgR8VrcWKWHEVmwn0aaCbmhCV91k5
 I3UCRpkjOP/bg9Va492kO8bn3s9jWd0r9prJgghniJBsruTWq7ULoBjqWB2ytjB8+4p+PxVdG1 dpxQm3wy1/X9QXbLckc7QAAAA==
X-Change-Id: 20260715-defer-complete-f1dea9af13a8
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=12270; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=UxpQuPDZMVfmmIAjlwIEb72bJkHC0Qq3qHhMpOV+BSM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqe4x7eHTyiAILLKOZ5f/DYT9K+2algOBaiAFdu
 DZsQk9IqqmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCanuMewAKCRAEWL7uWMY5
 RgFmD/950GafjJWoe4vj/TnhlLQbRA3jAjoJ2PZG953k2R6vFmhMY+KE1bK/26hIS9ejzTMPOYW
 jOQURqy2j3O9Th4HMdEU/flMcm3u7Wnha5Q25qe/aB4mtsZE3c1jAt9w4fk6+1EkHAItcWFeUNI
 UwMActs4SfRplMy1EwFyrHhipxuMc7p7KFx2+rYaQnshqNzQILWCA3iNAoypHxFSeKgG8U96oHm
 noX3wEIqLtmUbrd7Je2FzMdqS9pbgyxQnZzTVFegoYu9D5xkywUq3+xOX+1S5WCVDrDhbPb1AA5
 yi4VU4+KdgOdTolNAYBn7+q5ch34JkKYtOZOzvf8BSl0DzaflnnyzUKH+3SaiGEdprsLMv3Dam0
 DPxgfNAj6M0tj06NLkiAoxROhV4y/t8UHky6Yf7PFLa2lc1+Obj1Aum35/JFXe6o1qVwyrzpVCf
 jAcoirjPZTXk4O9WfU/GSRFzfXSGt0gAm8HSkFp3dDchN5nNZYAdNRQNXAgfxeE3BEV3O+E7uuv
 mO50Y8i/tbqTMQpNcKUzvcD3jIO+23LNlGjAEbqJMHphYJQLtzqekXgNQzUhgAbvRZL1tQMz3Pl
 Ei3hpGxm+bEQojx/zGKaNUL3FCTt6Be0gQ+EsvA7gsySdv+n3hHpAY5r3StCP7CjfVRBFhpvF9g 6RnT0ulYG17gfug==
X-Mailer: b4 0.14.3
Message-ID: <20260811-defer-complete-v3-1-832193c92885@google.com>
Subject: [PATCH v3] rust_binder: add TF_DEFER_COMPLETE flag for avoiding
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
Changes in v3:
- Rebase on char-misc-next.
- Fix thread_has_deferred_work computation
- Integrate with new impl_flags! macro
- Use if/else for push_work() / push_work_deferred()
- Link to v2: https://lore.kernel.org/r/20260722-defer-complete-v2-1-6c67af0e2ac2@google.com

Changes in v2:
- Return deferred thread work instead of the process global work if
  there is work in the process global list.
- Link to v1: https://lore.kernel.org/r/20260716-defer-complete-v1-1-ce0e38d30dc6@google.com
---
 drivers/android/binder/defs.rs        |  3 +-
 drivers/android/binder/process.rs     |  8 +++++
 drivers/android/binder/thread.rs      | 56 +++++++++++++++++++++++++++++------
 drivers/android/binder/transaction.rs |  1 +
 include/uapi/linux/android/binder.h   |  1 +
 5 files changed, 59 insertions(+), 10 deletions(-)

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
index 18a14aa8a835..8b08b8b37ecb 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -584,9 +584,21 @@ fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn Deliv
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
@@ -594,18 +606,26 @@ fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRe
                 drop(inner);
                 return Ok(self.process.get_work());
             }
+
+            // Note that if the thread list is empty, then the call to `pop_work()` has changed
+            // `process_work_list` back to `false` even if we set it to `true` above.
+            thread_has_deferred_work = !inner.work_list.is_empty();
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
@@ -621,14 +641,18 @@ fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRe
             inner.looper_flags &= !(LooperFlag::Waiting | LooperFlag::WaitingProc);
 
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
@@ -686,6 +710,12 @@ pub(crate) fn push_return_work(&self, reply: u32) {
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
@@ -1410,8 +1440,16 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
             let process = orig.from.process.clone();
             let allow_fds = orig.flags.contains(TransactionFlag::AcceptFds);
             let reply = Transaction::new_reply(self, process, info, allow_fds)?;
-            // Not notifying: Reply to current thread.
-            let _ = self.inner.lock().push_work(completion);
+            {
+                let mut inner = self.inner.lock();
+                if info.flags.contains(TransactionFlag::DeferComplete) {
+                    // The flag is set. Perform a deferred push so that `read` can wait for the
+                    // next incoming transaction without a userspace roundtrip.
+                    inner.push_work_deferred(completion);
+                } else {
+                    let _ = inner.push_work(completion);
+                }
+            }
             orig.from.deliver_reply(Ok(reply), &orig, None);
             Ok(())
         })()
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 245f1556b5db..f2877ce05f72 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -39,6 +39,7 @@ pub enum TransactionFlag {
         AcceptFds = TF_ACCEPT_FDS,
         ClearBuf = TF_CLEAR_BUF,
         UpdateTxn = TF_UPDATE_TXN,
+        DeferComplete = TF_DEFER_COMPLETE,
     }
 );
 
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
base-commit: 70200b99a36e1c1474d6ef9b7fd24e0026d1a7df
change-id: 20260715-defer-complete-f1dea9af13a8

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

