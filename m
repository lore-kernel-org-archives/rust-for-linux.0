Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA3845D5FA
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Sep 2026 11:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435382; cv=none; b=HArvGZDoCbDM0U9/cAz1xpjJyuUSOBJH1V3D54eDxgzGzGdO4kvTsGxsMDo/FhDCrFcsUZf8YjHI08PeWdpmf3stv8uqPwjoarAvw36BDcPlau7JvPr1f0uSwhli5un0XtzaZzntTQC8SozXCUqv1y6wEixL1Uw3p4I+ibjUuow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435382; c=relaxed/simple;
	bh=UFsZXVipqlvfpx450PhI4oHqd1cKHwae0vZq/h7tgvg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Wq5mpsnlvkV0zymTDiQuk/Cv1PRqa29VgNWHZXDQ+xUKKGHR3Nntg6v2C3y65MgEw6hqwMu1MtIcWqK2I6BgYGF7qopt5f/fFhbpowk3/zEgsHEu6WDlmfN+cQdzsR0jg1jE7Dh6cqji+To+/1VUsOKwgZAdzFep4G9eLqf1D3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XQgRczGI; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XQgRczGI"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f6d70223dso1597423f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Sep 2026 04:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788435373; x=1789040173; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZ4bhp8LPRdPf3uVYkffJK0IPibPFHXYOnRk0Sytprk=;
        b=XQgRczGIwNPAwsso9w8BMMnffq4kRt3V5+TFKRdaE3AYw1o7Wu9HU6Mbmq1bEDe2EZ
         rkMPLGHy08wlCB+HUndOOMw3USyFxgEcqT8gKOlbLLcHHgV+r0BbaXtHtGfl9cuWGAO9
         cnSrV8gxdK/slx5bCWYFaezmAs3cwlhSH83VC1QjDAG1RcVqGzAQvlCHKIT+Gyq3hTUt
         AzWEhR0UkKkOngy1hbn7k/7PPZ8Ht/1CcrRvMhcR/lPGlUSdCGynYMsjgA5/XnYuQqjr
         kMmu01SC9Ue7myOfGCRduLDygvsa7nTbWipnhdYn27cMC+bYTegl5wKlfiwBDkrbJb27
         IZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435373; x=1789040173;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZ4bhp8LPRdPf3uVYkffJK0IPibPFHXYOnRk0Sytprk=;
        b=aQDEYPA0k6l0Uqku+Y7YPbq1j6h+MtVMsDYqcfYdZwGJ3dWIVGzBpEUO2JrZlgYqiH
         eUzGEYR/uaX1j6fgMiGOsEAiJDRwOkJqt1OPmgpritx0Z7cayZNiJM2mPiH24WPGzeoQ
         PxiFpr5uC2GfmhsRVaXHBXu43c+vN9VG0QkYbvhgCl/gNT4tJSPq+9vYUytsLpcPq+RX
         mThyDgr9Uchk4zU2yTWXT0rML9uwD2brL1VfBFR9Sjh1UZHfRS+4iebAyWkF/K5pMRFq
         aFyhcwuCji7owd49sdM5Qx38mGWBVPocnW4FnzDTZlIUab6/D7V/PNgUqV7x504vcH4J
         7WUA==
X-Forwarded-Encrypted: i=1; AKwUvBzGc8hwaIcJyBugL+aqSpNtalOAm8wZ42/6F0UHgxUbDDfcAZcbkxnQSaEiKRarGYgwC6Z8ScmDuXhibKbljQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nHe8hF/P17fBwGLJSa8zrx+buP62aPczbwmmOKYEGK7IrDgITg
	aIQaKc1TrLtnBzjAW2bVfN32R1eYGEUKetPQqxMpzdduaoA0zKTv9fY9KugIkGEfI250oPggPZ7
	+Q/6Gl7xQmmaAgWBfeQ==
X-Received: from wmoo1.prod.google.com ([2002:a05:600d:101:b0:499:dd7e:7848])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e0a:b0:49c:f518:252d with SMTP id 5b1f17b1804b1-49cf5182689mr18521135e9.14.1788435372573;
 Thu, 03 Sep 2026 04:36:12 -0700 (PDT)
Date: Thu, 03 Sep 2026 11:36:03 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKJbmWoC/x3MQQqDQAxG4atI1gamExTaq5QuRvOr2YwlIyKId
 3dw+S3eO6nADYU+zUmO3YqtueLVNjQuKc9g02qKIfbhHYQHywrnbXEkZRy2cV4VrNKJ6ChDiol q/XdMdjzn7++6btxVjC5pAAAA
X-Change-Id: 20260903-binder-thread-exit-node-d3533dc3ba2a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4861; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=UFsZXVipqlvfpx450PhI4oHqd1cKHwae0vZq/h7tgvg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqmVumOdC5zbeu0NqQvVL+RXhOyXWae9RJ43i6/
 Iqk9k938RaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaplbpgAKCRAEWL7uWMY5
 RiQVD/9ofPBPixot/tPTNbLyXvza5QF9N/ks8lPVTsS141zvuZXnBPa5Q8XL7WQDVyy76fRneGh
 7laXZr21OuKXg8dF3SvGwpVYNZ5TWXdvOizYBF9rkyWSkOzN/nC8qZW8YFrVfaf2H4hiG3kZE7S
 4LlJKky7m+hw1kfnkmT4ibTioYXkzHbW5lvnchiRmDt5/QnM0Mgu7Im1K+QqMGcnOqxToCcaMr5
 CheJH9PfqUcKVz/sv/mH2WzOXJLKGHXWpTHGf3ehlN95JNm5HATFhx7IAbdLmuAAgqMQxLMOfTq
 WKCEkQ1N+4ZDrVKPvRx9fmAi85LDzsnBtMwg69Y6UpxEKQECv8RWQxVB7iaR7EWmAICixiJ2AM2
 d08PRX1DoNFy8VwGOxm7202wUsgDUdj8CuZiUiLoPdx2coszmIXwgiqYP2IHbx5UtJXWfc95E4I
 GzySEli/OsbZPlhmf7vquHVD9mRcdSv5/Eek44brrq/RFIpjt8iPAXQ2gFLp88Kil3qxg6HlagT
 4yH1En69qGeBF6flhkVKEXMadjBuJGc7OPbPXLqQuyP3RqLAOioj3CyH2Gq3YVNABBgT6ZMQZBN
 roRb1id4HE8VCDjY7KN15FZCPZ9Ft/XR52AhJRgPAfjIfz6JVObLxWLoYi1HlmFp747BPG4GOjU BZYxjlQX2HKvEbg==
X-Mailer: b4 0.14.3
Message-ID: <20260903-binder-thread-exit-node-v1-1-be09ff14f6a4@google.com>
Subject: [PATCH] rust_binder: reschedule node refcount update on thread exit
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When a thread exits via BINDER_THREAD_EXIT, its pending work items are
cancelled. If a thread exits while holding a pending node refcount
increment (e.g. pushed as deferred work to that thread), the refcount
increment was previously dropped because Node::cancel() and
NodeWrapper::cancel() were no-ops.

Dropping the refcount update leaves the node's delivery state and count
state desynchronized, and userspace will not receive the notification,
which can cause the node to never be freed from the process's nodes tree
when all external references are dropped.

Fix this by implementing DeliverToRead::cancel() for Node and NodeWrapper
to move the pending refcount update to the process's work queue on thread
exit so another thread can deliver it to userspace.

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/node.rs         | 20 +++++++++++++++++---
 drivers/android/binder/node/wrapper.rs | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 0a82af14cda3..8dc3e3f2b834 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -51,9 +51,9 @@
 ///   about to drop the weak reference, then the strong increment could be processed after the
 ///   other thread has already exited, which would be too late.
 ///
-/// Note that trying to create a `ListArc` to the node can succeed even if `has_normal_push` is
+/// Note that trying to create a `ListArc` to the node can succeed even if `has_pushed_node` is
 /// set. This is because another thread might just have popped the node from a todo list, but not
-/// yet called `do_work`. However, if `has_normal_push` is false, then creating a `ListArc` should
+/// yet called `do_work`. However, if `has_pushed_node` is false, then creating a `ListArc` should
 /// always succeed.
 ///
 /// Like the other fields in `NodeInner`, the delivery state is protected by the process lock.
@@ -738,7 +738,21 @@ fn do_work(
         self.do_work_locked(writer, owner_inner)
     }
 
-    fn cancel(self: DArc<Self>) {}
+    fn cancel(self: DArc<Self>) {
+        let _drop_outside_lock;
+        let mut owner_inner = self.owner.inner.lock();
+
+        // We only do something on BINDER_THREAD_EXIT, not process exit.
+        if owner_inner.is_dead {
+            return;
+        }
+
+        // If BINDER_THREAD_EXIT is invoked on a thread with a pending node refcount update, we
+        // should move ourselves to ensure the refcount update is still delivered.
+        if let Some(node) = ListArc::try_from_arc_borrow(self.as_arc_borrow()) {
+            _drop_outside_lock = owner_inner.push_work(&self.owner, node);
+        }
+    }
 
     fn should_sync_wakeup(&self) -> bool {
         false
diff --git a/drivers/android/binder/node/wrapper.rs b/drivers/android/binder/node/wrapper.rs
index 6e4ca01c941a..886626ca0d42 100644
--- a/drivers/android/binder/node/wrapper.rs
+++ b/drivers/android/binder/node/wrapper.rs
@@ -57,7 +57,39 @@ fn do_work(
         node.do_work_locked(writer, owner_inner)
     }
 
-    fn cancel(self: DArc<Self>) {}
+    fn cancel(self: DArc<Self>) {
+        let _drop_outside_lock;
+        let node = &self.node;
+        let mut owner_inner = node.owner.inner.lock();
+
+        // We only do something on BINDER_THREAD_EXIT, not process exit.
+        if owner_inner.is_dead {
+            return;
+        }
+
+        // We transfer the responsibility of the node refcount update to the scheduled Node because
+        // NodeWrapper has no way to re-create the ListArc.
+        let inner = node.inner.access_mut(&mut owner_inner);
+
+        let ds = &mut inner.delivery_state;
+        assert!(ds.has_pushed_wrapper);
+        assert!(ds.has_strong_zero2one);
+        ds.has_pushed_wrapper = false;
+
+        // We are changing the state to one where the Node is the strong zero2one update instead of
+        // the wrapper.
+        ds.has_weak_zero2one = false;
+
+        if !ds.has_pushed_node {
+            if let Some(node2) = ListArc::try_from_arc_borrow(node.as_arc_borrow()) {
+                ds.has_pushed_node = true;
+                _drop_outside_lock = owner_inner.push_work(&node.owner, node2);
+            } else {
+                // This can't actually happen.
+                ds.has_strong_zero2one = false;
+            }
+        }
+    }
 
     fn should_sync_wakeup(&self) -> bool {
         false

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260903-binder-thread-exit-node-d3533dc3ba2a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

