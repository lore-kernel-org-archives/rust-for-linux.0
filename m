Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86A1F9F74;
	Fri,  3 Jan 2025 16:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922696; cv=none; b=n4naVBlcSYpOuFFzf4pgCR365e9JmGY/kNU1S/GjJuPX0p5VXIfbMFJBhn+24qkiw51DmDNhp1mLMg/eCnFXZxSFKbMwkRMRf0XchjyXQ6gaLFMaW4Iy/BUGaPaZc8SKpl7YzbY8ZVnS01WkNybyxBzzoDZ7LNph5A9wFlSy870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922696; c=relaxed/simple;
	bh=srkz3r0XEYO2fT29bRJoGoc3IDmz2pZBHsSU8+Dzu/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLZzMkgrdwtu+bwszEthO2ovhnmU94zjBEIHNnL8CwjIWJ6gjMPVF95deJ+oGhoSSQVAyqE6IAQH5aKADTHscIqlrAPEHbHmUl7UQ6JHESfyZjT71TT6jQLCZ4PLITU5Tv5QaVXk9g38bFKynp+aDu95pRfLMTwWnTBcH3B5lBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TpxhQtLa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpxhQtLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2493C4CECE;
	Fri,  3 Jan 2025 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735922695;
	bh=srkz3r0XEYO2fT29bRJoGoc3IDmz2pZBHsSU8+Dzu/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TpxhQtLaxHHB1tsIRTiIGsUPKJSJ6u3wZiv/iZlk2rykM3yK2TMp3ja/gdPmm/uXN
	 EXPzTlqN30jiIH49/95Sn7cuM18mZzRs3FtFBcYWsfIyn4NdfMOCU4XG6LkY7T97oa
	 o1LrBaFymy9Zw5+ayYCxqXI7M9KiBqbLxLoi0AHYY699vtbL94EB/WZsbZZ3aXqkvR
	 DtH1xka3nYmgbLOfvCezWa7jzzJFxnoKttRtA8p1GDC00r6ISJqWDXEDwgekrMEZHh
	 GAexqVHkgwOtV0iwGk1eIzysEM686YfsUcc6NvTrLY3bslwnwSQDcxCuD0NV/SlHSm
	 b1CB8SR/h7YJQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] rust: devres: remove action in `Devres::drop`
Date: Fri,  3 Jan 2025 17:44:31 +0100
Message-ID: <20250103164436.96449-2-dakr@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103164436.96449-1-dakr@kernel.org>
References: <20250103164436.96449-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far `DevresInner` is kept alive, even if `Devres` is dropped until
the devres callback is executed to avoid a WARN() when the action has
been released already.

With the introduction of devm_remove_action_nowarn() we can remove the
action in `Devres::drop`, handle the case where the action has been
released already and hence also free `DevresInner`.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/devres.rs | 56 +++++++++++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 9c9dd39584eb..7d3daac92109 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -10,15 +10,19 @@
     bindings,
     device::Device,
     error::{Error, Result},
+    ffi::c_void,
     prelude::*,
     revocable::Revocable,
     sync::Arc,
+    types::ARef,
 };
 
 use core::ops::Deref;
 
 #[pin_data]
 struct DevresInner<T> {
+    dev: ARef<Device>,
+    callback: unsafe extern "C" fn(*mut c_void),
     #[pin]
     data: Revocable<T>,
 }
@@ -98,6 +102,8 @@ impl<T> DevresInner<T> {
     fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
         let inner = Arc::pin_init(
             pin_init!( DevresInner {
+                dev: dev.into(),
+                callback: Self::devres_callback,
                 data <- Revocable::new(data),
             }),
             flags,
@@ -109,9 +115,8 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
 
         // SAFETY: `devm_add_action` guarantees to call `Self::devres_callback` once `dev` is
         // detached.
-        let ret = unsafe {
-            bindings::devm_add_action(dev.as_raw(), Some(Self::devres_callback), data as _)
-        };
+        let ret =
+            unsafe { bindings::devm_add_action(dev.as_raw(), Some(inner.callback), data as _) };
 
         if ret != 0 {
             // SAFETY: We just created another reference to `inner` in order to pass it to
@@ -124,6 +129,41 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
         Ok(inner)
     }
 
+    fn as_ptr(&self) -> *const Self {
+        self as _
+    }
+
+    fn remove_action(&self) {
+        // SAFETY:
+        // - `self.inner.dev` is a valid `Device`,
+        // - the `action` and `data` pointers are the exact same ones as given to devm_add_action()
+        //   previously,
+        // - `self` is always valid, even if the action has been released already.
+        let ret = unsafe {
+            bindings::devm_remove_action_nowarn(
+                self.dev.as_raw(),
+                Some(self.callback),
+                self.as_ptr() as _,
+            )
+        };
+
+        if ret != 0 {
+            // The devres action has been released already - nothing to do.
+            return;
+        }
+
+        // SAFETY: We leaked an `Arc` reference to devm_add_action() in `DevresInner::new`; if
+        // devm_remove_action_nowarn() was successful we can (and have to) claim back ownership of
+        // this reference.
+        let _ = unsafe { Arc::from_raw(self.as_ptr()) };
+
+        // Revoke the data, such that it gets dropped and the actual resource is freed.
+        //
+        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
+        // anymore, hence it is safe not to wait for the grace period to finish.
+        unsafe { self.data.revoke_nosync() };
+    }
+
     #[allow(clippy::missing_safety_doc)]
     unsafe extern "C" fn devres_callback(ptr: *mut kernel::ffi::c_void) {
         let ptr = ptr as *mut DevresInner<T>;
@@ -165,14 +205,6 @@ fn deref(&self) -> &Self::Target {
 
 impl<T> Drop for Devres<T> {
     fn drop(&mut self) {
-        // Revoke the data, such that it gets dropped already and the actual resource is freed.
-        //
-        // `DevresInner` has to stay alive until the devres callback has been called. This is
-        // necessary since we don't know when `Devres` is dropped and calling
-        // `devm_remove_action()` instead could race with `devres_release_all()`.
-        //
-        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
-        // anymore, hence it is safe not to wait for the grace period to finish.
-        unsafe { self.revoke_nosync() };
+        self.0.remove_action();
     }
 }
-- 
2.47.1

