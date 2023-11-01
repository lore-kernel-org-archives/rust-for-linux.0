Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA54918E06
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ciKkrd4N"
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1869318A
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 11:02:57 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da040c021aeso12001276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Nov 2023 11:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698861776; x=1699466576; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ne8wQirTzVbrlGSbYvyMv1H5eqmeqAnY768DH+xgy+c=;
        b=ciKkrd4NOvPu4IN/xcE5MLQCYSmApZR+sYp8fyQKm9wDem9bF0zUsEhS+6SmHL5O04
         5DCDWtXaDoK6XweYiXGLegnQXvsDdwD7/euB/wPRc9q+UEvs3tQocjouUV1hzg2hjyKM
         GmIT+vkIyG4BZsNfKwOWIHKmXv4al8zwqO6mzZxwFgYVHMPerGqdYMppzZlZx1PXNchO
         QzPF9JTS2otUBNwdv2itom771fwjzftbt9TxTGn8enLhrOSK6OKI+dGFiN5TDX5ZICgl
         EyIRzroXaK49fHdDdJDyWajUwn4Oc8Ah0D9J5TjaFG2Pl+dPTvbtobwN9R186fvEWf5A
         Q+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698861776; x=1699466576;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ne8wQirTzVbrlGSbYvyMv1H5eqmeqAnY768DH+xgy+c=;
        b=d3agS7vJ9C9yfKYkxkVExrU+mUKgdLVA59kbKCPzBaXa5GbSfBgxfHh/J8lJiiR31M
         d9yJysKSVe+XGb+joljLlygPJT0d4vg3rnbesd6WFHwsmmNukC4KtO/n1hABB10BG9W8
         7G1H9P9YpQlKIiRSJKmQTJtCytBxHddnkmKy6dUqWvr9tE1SnZKVvLiwZzGx8O4OqRk0
         8lhiRHPI0lKGX3clkgRK6SgoRa0qFv+dVT3N+hNL4J5iQvh+R6jlASTS7XDZTdR3ab9I
         rbewZCe6ZaxPOoAPR2fwqjn7WV1gZLAZ9w8+CdkUzL8jB8Kh/6v92aLWb42kCcjAYjsi
         M6Ug==
X-Gm-Message-State: AOJu0Yz/qmprTSkTalxcB/KNLfUpcS6+MbhrrHH+p4h/XtK99sLRYYnf
	Oo0U/OWIvD7EQXfM5+y3qJUTvtv7AMDHoag=
X-Google-Smtp-Source: AGHT+IHDrYG7SbttPZTy5jEOCe1fj2u+Fgl9lCFsWfHv8cstFpWJViFLRHHzEYY3wgpWqvtqzagRFCnTbYNlDOA=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:e706:0:b0:d9a:36cd:482e with SMTP id
 e6-20020a25e706000000b00d9a36cd482emr313300ybh.13.1698861776263; Wed, 01 Nov
 2023 11:02:56 -0700 (PDT)
Date: Wed, 01 Nov 2023 18:01:46 +0000
In-Reply-To: <20231101-rust-binder-v1-0-08ba9197f637@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231101-rust-binder-v1-0-08ba9197f637@google.com>
X-Mailer: b4 0.13-dev-26615
Message-ID: <20231101-rust-binder-v1-16-08ba9197f637@google.com>
Subject: [PATCH RFC 16/20] rust_binder: add TF_UPDATE_TXN support
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Matt Gilbride <mattgilbride@google.com>, 
	Jeffrey Vander Stoep <jeffv@google.com>, Matthew Maurer <mmaurer@google.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When a process is frozen, incoming oneway transactions are held in a
queue until the process is unfrozen. If many oneway transactions are
sent, then the process could run out of space for them. This patch adds
a flag that avoids this by replacing previous oneway transactions in the
queue to avoid having transactions of the same type build up. This can
be useful when only the most recent transaction is necessary.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/defs.rs        |  8 +++++++-
 drivers/android/node.rs        | 19 +++++++++++++++++++
 drivers/android/transaction.rs | 26 ++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/android/defs.rs b/drivers/android/defs.rs
index 30659bd26bff..b1a54f85b365 100644
--- a/drivers/android/defs.rs
+++ b/drivers/android/defs.rs
@@ -58,7 +58,13 @@ macro_rules! pub_no_prefix {
 pub(crate) const FLAT_BINDER_FLAG_ACCEPTS_FDS: u32 = kernel::bindings::FLAT_BINDER_FLAG_ACCEPTS_FDS;
 pub(crate) const FLAT_BINDER_FLAG_TXN_SECURITY_CTX: u32 =
     kernel::bindings::FLAT_BINDER_FLAG_TXN_SECURITY_CTX;
-pub_no_prefix!(transaction_flags_, TF_ONE_WAY, TF_ACCEPT_FDS, TF_CLEAR_BUF);
+pub_no_prefix!(
+    transaction_flags_,
+    TF_ONE_WAY,
+    TF_ACCEPT_FDS,
+    TF_CLEAR_BUF,
+    TF_UPDATE_TXN
+);
 
 pub(crate) use bindings::{
     BINDER_TYPE_BINDER, BINDER_TYPE_FD, BINDER_TYPE_FDA, BINDER_TYPE_HANDLE, BINDER_TYPE_PTR,
diff --git a/drivers/android/node.rs b/drivers/android/node.rs
index 7ed494bf9f7c..2c056bd7582e 100644
--- a/drivers/android/node.rs
+++ b/drivers/android/node.rs
@@ -298,6 +298,25 @@ pub(crate) fn pending_oneway_finished(&self) {
             }
         }
     }
+
+    /// Finds an outdated transaction that the given transaction can replace.
+    ///
+    /// If one is found, it is removed from the list and returned.
+    pub(crate) fn take_outdated_transaction(
+        &self,
+        new: &Transaction,
+        guard: &mut Guard<'_, ProcessInner, SpinLockBackend>,
+    ) -> Option<DLArc<Transaction>> {
+        let inner = self.inner.access_mut(guard);
+        let mut cursor_opt = inner.oneway_todo.cursor_front();
+        while let Some(cursor) = cursor_opt {
+            if new.can_replace(&cursor.current()) {
+                return Some(cursor.remove());
+            }
+            cursor_opt = cursor.next();
+        }
+        None
+    }
 }
 
 impl DeliverToRead for Node {
diff --git a/drivers/android/transaction.rs b/drivers/android/transaction.rs
index 96f63684b1a3..7028c504ef8c 100644
--- a/drivers/android/transaction.rs
+++ b/drivers/android/transaction.rs
@@ -201,6 +201,9 @@ fn drop_outstanding_txn(&self) {
     ///
     /// Not used for replies.
     pub(crate) fn submit(self: DLArc<Self>) -> BinderResult {
+        // Defined before `process_inner` so that the destructor runs after releasing the lock.
+        let mut _t_outdated = None;
+
         let oneway = self.flags & TF_ONE_WAY != 0;
         let process = self.to.clone();
         let mut process_inner = process.inner.lock();
@@ -211,6 +214,10 @@ pub(crate) fn submit(self: DLArc<Self>) -> BinderResult {
             if let Some(target_node) = self.target_node.clone() {
                 if process_inner.is_frozen {
                     process_inner.async_recv = true;
+                    if self.flags & TF_UPDATE_TXN != 0 {
+                        _t_outdated =
+                            target_node.take_outdated_transaction(&self, &mut process_inner);
+                    }
                 }
                 match target_node.submit_oneway(self, &mut process_inner) {
                     Ok(()) => return Ok(()),
@@ -251,6 +258,25 @@ pub(crate) fn submit(self: DLArc<Self>) -> BinderResult {
         }
     }
 
+    /// Check whether one oneway transaction can supersede another.
+    pub(crate) fn can_replace(&self, old: &Transaction) -> bool {
+        if self.from.process.task.pid() != old.from.process.task.pid() {
+            return false;
+        }
+
+        if self.flags & old.flags & (TF_ONE_WAY | TF_UPDATE_TXN) != (TF_ONE_WAY | TF_UPDATE_TXN) {
+            return false;
+        }
+
+        let target_node_match = match (self.target_node.as_ref(), old.target_node.as_ref()) {
+            (None, None) => true,
+            (Some(tn1), Some(tn2)) => Arc::ptr_eq(tn1, tn2),
+            _ => false,
+        };
+
+        self.code == old.code && self.flags == old.flags && target_node_match
+    }
+
     fn prepare_file_list(&self) -> Result<TranslatedFds> {
         let mut alloc = self.allocation.lock().take().ok_or(ESRCH)?;
 

-- 
2.42.0.820.g83a721a137-goog

