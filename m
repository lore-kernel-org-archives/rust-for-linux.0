Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B22E3AEA;
	Wed,  3 Dec 2025 22:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800865; cv=none; b=pjgDp6wfsR9Q4cvUk1uEaL2Z7Es+1TkBXlvQ2gRELIxZQR9GOEg65N8eNrU7O5JskF0Czv2ufKKVW8g7lvPfuK3dmRJkotdg+kcNnuQn9pBDIfB6g+swRymJHZ0S0eAv2/0+wLDNor3UBi76yNhNYrlSGlSh0uWSD95hJXB0bnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800865; c=relaxed/simple;
	bh=6AoK80zUJhrQ3fbZgad6VdXkWCk/JukGAqPmhDOpdmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=au+eAOzsrlGyT+uFafQ0/F5z6IXBEwuq2roLVKiSeIR6bMIQgnlYJxO7czW6gdIB84MOaNC8pe46GqIxTCiL9GkW2grIY8/WttjzNNQywo7PFsmNJ6ILVs/s36ZbYKIe8bNw8eclDCdXH6xzGDx34MeJbgbJkpJAvvnONpNV+wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpOpyTk1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpOpyTk1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC52C116B1;
	Wed,  3 Dec 2025 22:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764800864;
	bh=6AoK80zUJhrQ3fbZgad6VdXkWCk/JukGAqPmhDOpdmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dpOpyTk1dpBHVEPrey51Z3G/4xVbNzdP8SEOrD+Q3j6wU+fNn+l5K3VvdmPo4M5nn
	 +q+fKmLF4Z+TFJlV+yLa5hly7BYFr1WabB4+gzMHoPgd3o9jWPg/wWZgv7OOr7ToZK
	 A/GC2CYEF/hWYldqyd6KIkrJO7zCrVGcY7qPO3rW8j8fQDYFaSJdIVWgvr2Uw/CBU6
	 qC4yE16pPaTBnsvExyORwFuC8dg7zciSAEeU/sTsjwZ+7+JIguvSv/0bZdv5FhClRz
	 PMRPRr7N0Hk6E9zH77d1rmIMu784xQI9R2s0O8wos62w7E+82NtfxXmos5Zx1hPejM
	 ihkpDksGbUBjA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 03 Dec 2025 23:26:34 +0100
Subject: [PATCH 04/10] rust: xarray: add `XArrayState`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-xarray-entry-send-v1-4-9e5ffd5e3cf0@kernel.org>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3170; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=6AoK80zUJhrQ3fbZgad6VdXkWCk/JukGAqPmhDOpdmE=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpMLktFKvciv9Nl8Br57MpZsQcuCiW62bkACaG3
 r8Q99WMoC+JAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaTC5LQAKCRDhuBo+eShj
 d8A0D/9ykjfxH+r2py6dhev34wNp/GG5691VAzY2B3j5DHf1wtbrzfT04mQk926p1XtA5VwIRxN
 wigud3to1pMXXvKTJSXjiaXV1XdufDZGsmOtdC58Fracucgs8CbCpL7SHtG+tIEXjEt8alHAi7c
 xRL6gP9PTTcpqcFnrLOA+LaFQ7ZxFayeFhWN+WsV6kNnyLrll60jGSgbdAdxLM9nVQgXHPxwN6M
 NTBw4LGZ8VhJNsk+K2yIXJkAttxxCbZitkWgH/1r+C2SJTk1N3RHG1aQS0oiUeLwDTrBBYWA1Cf
 PLUYfY+VZh5dCmhDkceF13aVnqVdq3JUo8JocvPJaGgK6PIthrItKqlksAQRveeGRVaPhmDpdh3
 IDt8FZCPTaIhbvgJBRmkTbODUoF8P4Q3TVMe4k4uP1TA869rdmxrx2r0wqfRlMMGkEc1/KfmXla
 +tniPonhiu8B1d4l0c2J69xA4o1FdR4KmCwGbElJgwjXkjCxRNixFQ6+qpgryRyBb8sleZJm/xM
 MvWZ0IwnxXJDvgSJJQHwoFxnpHFF1TLjyAZ38V1pfvxpOa5Bo8OmBqd/ypwELyqYWjbMMHmX4Xp
 PWhQUiw9McVNvrbzI8YxORIJM4VLG73ty17LKhIqEjYSjcQDIgsthKBru3VaBVmWSuZokRwFLl/
 6CRksU53EuDhfKw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add `XArrayState` as internal state for XArray iteration and entry
operations. This struct wraps the C `xa_state` structure and holds a
reference to a `Guard` to ensure exclusive access to the XArray for the
lifetime of the state object.

The `XAS_RESTART` constant is also exposed through the bindings helper
to properly initialize the `xa_node` field.

The struct and its constructor are marked with `#[expect(dead_code)]` as
there are no users yet. We will remove this annotation in a later patch.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/xarray.rs           | 41 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 2e43c66635a2c..86bca946faff0 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -109,6 +109,7 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT = XA_PRESENT;
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC = XA_FLAGS_ALLOC;
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 = XA_FLAGS_ALLOC1;
 const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE = VM_MERGEABLE;
+const size_t RUST_CONST_HELPER_XAS_RESTART = (size_t)XAS_RESTART;
 
 #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
 #include "../../drivers/android/binder/rust_binder.h"
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index ede48b5e1dba3..f6e610b059625 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -8,7 +8,10 @@
     iter,
     marker::PhantomData,
     pin::Pin,
-    ptr::NonNull, //
+    ptr::{
+        null_mut,
+        NonNull, //
+    },
 };
 use kernel::{
     alloc,
@@ -319,6 +322,42 @@ pub fn store(
     }
 }
 
+/// Internal state for XArray iteration and entry operations.
+///
+/// # Invariants
+///
+/// - `state` is always a valid `bindings::xa_state`.
+#[expect(dead_code)]
+pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
+    /// Holds a reference to the lock guard to ensure the lock is not dropped
+    /// while `Self` is live.
+    _access: &'b Guard<'a, T>,
+    state: bindings::xa_state,
+}
+
+impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
+    #[expect(dead_code)]
+    fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
+        let ptr = access.xa.xa.get();
+        // INVARIANT: We initialize `self.state` to a valid value below.
+        Self {
+            _access: access,
+            state: bindings::xa_state {
+                xa: ptr,
+                xa_index: index,
+                xa_shift: 0,
+                xa_sibs: 0,
+                xa_offset: 0,
+                xa_pad: 0,
+                xa_node: bindings::XAS_RESTART as *mut bindings::xa_node,
+                xa_alloc: null_mut(),
+                xa_update: None,
+                xa_lru: null_mut(),
+            },
+        }
+    }
+}
+
 // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff `T` is `Send`.
 unsafe impl<T: ForeignOwnable + Send> Send for XArray<T> {}
 

-- 
2.51.2


