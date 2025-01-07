Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE101EF0AE;
	Tue,  7 Jan 2025 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252779; cv=none; b=ANXugC2oybPsjuE4oArLBgZfnucp5sJPIuKyXlvo6IDf3y52MLbyuWnMG8F5AXuJp0UcR0q7XPpj2lkeOytYq3A04pzHdfsVokIzeGGkbuFtNZ4GKR/8JzMre0AgQxMplhCjn9DdxTYLFjzvqOukYnCx1Wl3ts65+xr5+pYTaD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252779; c=relaxed/simple;
	bh=5+3kkM0afM2218cpbg7nmt7lnTUe90jHnGmb0wDZ2ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QTYmjjMy/PBKmBfX9vU7MHD4EzPW0QGGm1xQdTXK7lkjNee3avCKrukw8OlykTI/mMT27Bk+XrM7CLNWmzhR9hC2/+WUl21rnOTAazeeoFKhlfNjon9K/xay6/tpPs2px7uPmzuTDPmsBt7+dbtTvCAMzh1aAN8z6j1/CcA74/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQNqu2WS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQNqu2WS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D99C4CEDD;
	Tue,  7 Jan 2025 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736252778;
	bh=5+3kkM0afM2218cpbg7nmt7lnTUe90jHnGmb0wDZ2ng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fQNqu2WS5Z3V9nvlxcD88e4PVXMTCjQyUfs4N63uEIKnLHNxSD54Ci5/9z+mZ9Sq3
	 ruI/XyGRUqAzGqOl4b/JugdRh8+VNi1e6YO3pVvXIVR9uNCbWFrjmUX0swXWoa8Evy
	 5pJfmV/Hdd0XQFPNPH5gWANr1HwKgVhLbt4zjTYp9+50JxeazMB5sNK84jL2IE8zov
	 wY1YPy5aMCwLgQiBZYbt7VfdEgHrYuW/+WZNpGXmSZNXnLAojPcowsxRo2jSsXzz1U
	 DWR2P//LRVmbn6e1yagxnE2SV7UPdW8POJBxUiiWhgEAwOji5jxc1np0lEXfYcn4P7
	 uvwrv36uTf4/g==
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
Subject: [PATCH v2 2/2] rust: devres: remove action in `Devres::drop`
Date: Tue,  7 Jan 2025 13:25:11 +0100
Message-ID: <20250107122609.8135-2-dakr@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107122609.8135-1-dakr@kernel.org>
References: <20250107122609.8135-1-dakr@kernel.org>
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
v2:
  - remove unnecessary call to revoke
  - change argument of remove_action() from `&Self` to `&Arc<Self>`
---
 rust/kernel/devres.rs | 47 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 9c9dd39584eb..942376f6f3af 100644
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
@@ -124,6 +129,32 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
         Ok(inner)
     }
 
+    fn as_ptr(&self) -> *const Self {
+        self as _
+    }
+
+    fn remove_action(this: &Arc<Self>) {
+        // SAFETY:
+        // - `self.inner.dev` is a valid `Device`,
+        // - the `action` and `data` pointers are the exact same ones as given to devm_add_action()
+        //   previously,
+        // - `self` is always valid, even if the action has been released already.
+        let ret = unsafe {
+            bindings::devm_remove_action_nowarn(
+                this.dev.as_raw(),
+                Some(this.callback),
+                this.as_ptr() as _,
+            )
+        };
+
+        if ret == 0 {
+            // SAFETY: We leaked an `Arc` reference to devm_add_action() in `DevresInner::new`; if
+            // devm_remove_action_nowarn() was successful we can (and have to) claim back ownership
+            // of this reference.
+            let _ = unsafe { Arc::from_raw(this.as_ptr()) };
+        }
+    }
+
     #[allow(clippy::missing_safety_doc)]
     unsafe extern "C" fn devres_callback(ptr: *mut kernel::ffi::c_void) {
         let ptr = ptr as *mut DevresInner<T>;
@@ -165,14 +196,6 @@ fn deref(&self) -> &Self::Target {
 
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
+        DevresInner::remove_action(&self.0);
     }
 }
-- 
2.47.1

