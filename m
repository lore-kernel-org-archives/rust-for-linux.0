Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1773941735C;
	Fri,  3 Jul 2026 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092566; cv=none; b=YZHqBzF3He7HUeqmpC4/Y/YZ55JfPy/zRUTMq6vyCB8+5KQYlNW9PqYjCNfrRhLRyPHbRvAHdd7ieQX+sahyBmMxz7hvE6GqKqdhegScVSTB1P3oAjxvh5XdCPuW/dbib5NfESTvhNqnJ9Jk+9wMpC0RdnH4TridtemzOm2XtHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092566; c=relaxed/simple;
	bh=gDy1xUtpnN3CJR11tR1CYZk1CojcI7CgRZfqoEvJaY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lRG9jtBCe2q1de7P72MiyL5ODYey0qf1HJrVE7y7T9PnJl27SVSdlDP/GXrh+S1TB3JWqvpwn3+YRxNbbLyU0vcZOcOthrUWGZtzM36tEFXmGdkzCFustQsqcly9IG4DyKqiFvzIEUPZKowhB2SP5Rein4wWGhBG6vMHz3CeB0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaXSnLPq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaXSnLPq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEDA4C2BCB9;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783092565;
	bh=gDy1xUtpnN3CJR11tR1CYZk1CojcI7CgRZfqoEvJaY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CaXSnLPqG4J36GfVPhT0PCR1UHJ+qQaYeepBt1rznwmthKnrqRl0oHG18+bBaEirf
	 Cro5/HfY6Poy+AGZUfMAt58YBbarAN/0LQcPCN+5k705BkypRVysM6qW3fVyVM9Vhr
	 faBIlZwJXsQKOfG5ax08rGbfWQIrwvYJB0kyGrjh5OuS+dGHknZwcLAopeTFEL0Pl3
	 EzhMwRg4xriF4Up0wvDJ+75aYRPg1ZBu6/8L+GiKZp3Uoz1CsEkgpyK5Vn1oNi6Fbq
	 bAM5Ceksr/9XkAjuX9VS2RW+hHb5g1A1FxGTTQJ6L4yrKxwZr8ZQno0mlpIpiJpq70
	 pIZtQwSgZTTdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9CBC44502;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Fri, 03 Jul 2026 15:29:28 +0000
Subject: [PATCH 7/7] rust_binder: Implement the
 BINDER_DEBUG_DEAD_TRANSACTION logging mask to trace in-flight
 cancellations during teardown
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rust_binder_debug_mask-v1-7-9bdf12b5325c@google.com>
References: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com>
In-Reply-To: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Jahnavi MN <jahnavimn@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783092563; l=4740;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=cZ5Gq3UUFmklkL9ONpnQ9DYqlGgROrO2oyaIaFpTyWM=;
 b=nYZFLCuzdDzrqp5yO8rsDLVoelnyEoApAGvqB0atDyEWol2zqv6MHBWrBtpgpQkXr9gauxbZl
 m4AjiJwvkHxCNBQAjmyR1VDmRA3xRi52pu2e2MLKof7aUz58axHOKLt
X-Developer-Key: i=jahnavimn@google.com; a=ed25519;
 pk=9aLfw3FepTOJwTS7jRXm7pDH87eBeZMXBPrqwU0//RE=
X-Endpoint-Received: by B4 Relay for jahnavimn@google.com/20260702 with
 auth_id=849
X-Original-From: Jahnavi MN <jahnavimn@google.com>
Reply-To: jahnavimn@google.com

From: Jahnavi MN <jahnavimn@google.com>

This adds dynamic debug logs for:
- Releasing active transactions during thread stack unwinding.
- Discarded transaction error codes when a thread exits.
- Undelivered transaction acknowledgments (TRANSACTION_COMPLETE)
  upon thread exit.
- Undelivered process death and freeze notifications when processes
  exit or die.
- Undelivered transactions canceled due to target process death.

Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/freeze.rs           |  8 +++++++-
 drivers/android/binder/node.rs             |  8 +++++++-
 drivers/android/binder/rust_binder_main.rs |  9 ++++++++-
 drivers/android/binder/thread.rs           | 18 +++++++++++++++++-
 drivers/android/binder/transaction.rs      |  6 ++++++
 5 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index d0559ed308ef..b60fbad0f2f3 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -140,7 +140,13 @@ fn do_work(
         }
     }
 
-    fn cancel(self: DArc<Self>) {}
+    fn cancel(self: DArc<Self>) {
+        binder_debug!(
+            crate::debug::BINDER_DEBUG_DEAD_TRANSACTION,
+            "undelivered freeze notification, {:016x}",
+            self.cookie.0
+        );
+    }
 
     fn should_sync_wakeup(&self) -> bool {
         false
diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index d71f55739772..1d6d623072df 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -1120,7 +1120,13 @@ fn do_work(
         Ok(cmd != BR_DEAD_BINDER)
     }
 
-    fn cancel(self: DArc<Self>) {}
+    fn cancel(self: DArc<Self>) {
+        binder_debug!(
+            crate::debug::BINDER_DEBUG_DEAD_TRANSACTION,
+            "undelivered death notification, {:016x}",
+            self.cookie
+        );
+    }
 
     fn should_sync_wakeup(&self) -> bool {
         false
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index bf15021524a4..8b8992411cd7 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -262,7 +262,14 @@ fn do_work(
         Ok(true)
     }
 
-    fn cancel(self: DArc<Self>) {}
+    fn cancel(self: DArc<Self>) {
+        if !self.skip.load(Relaxed) {
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_DEAD_TRANSACTION,
+                "undelivered TRANSACTION_COMPLETE"
+            );
+        }
+    }
 
     fn should_sync_wakeup(&self) -> bool {
         false
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 1656e0c70fef..43bc146505cc 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1150,6 +1150,13 @@ fn unwind_transaction_stack(self: &Arc<Self>) {
             let mut inner = thread.inner.lock();
             inner.pop_transaction_to_reply(thread.as_ref())
         } {
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_DEAD_TRANSACTION,
+                "release process {} transaction {} in, still active",
+                self.process.task.pid(),
+                transaction.debug_id
+            );
+
             let reply = Err(BR_DEAD_REPLY);
             if !transaction.from.deliver_single_reply(reply, &transaction) {
                 break;
@@ -1728,7 +1735,16 @@ fn do_work(
         Ok(true)
     }
 
-    fn cancel(self: DArc<Self>) {}
+    fn cancel(self: DArc<Self>) {
+        let code = self.error_code.load(Relaxed);
+        if code != BR_OK {
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_DEAD_TRANSACTION,
+                "undelivered TRANSACTION_ERROR: {}",
+                code
+            );
+        }
+    }
 
     fn should_sync_wakeup(&self) -> bool {
         false
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index f8756c5dfba4..3cb0cb9694de 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -485,6 +485,12 @@ fn cancel(self: DArc<Self>) {
         if self.target_node.is_some() && self.flags & TF_ONE_WAY == 0 {
             let reply = Err(BR_DEAD_REPLY);
             self.from.deliver_reply(reply, &self);
+        } else {
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_DEAD_TRANSACTION,
+                "undelivered transaction {}, process died",
+                self.debug_id
+            );
         }
 
         self.drop_outstanding_txn();

-- 
2.55.0.rc0.799.gd6f94ed593-goog


