Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E022F1E51D
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Jun 2025 15:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751211493; cv=none; b=W8Wtl9Cd5XErJBW1Yh0b2D8BKQSk7P+QIWd5TP8Gb0BPgVeGkw/4frgkgD9tX74U+puVdicAvUxzsjpBt1QBH/Cq6E5UgAbCKekgVhce8oLDkN9xSQ0pRQDYZdY0h16P/vB2zo2iTwErUWlhD7LdkU67PDPGKcRBrsFsKr8/85c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751211493; c=relaxed/simple;
	bh=irUPTlS0/NWtgLLK+FiDb0DkltPA9zyPBDyAIy/e0yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jATotF8bdFPBSE9avNjN6DAvDROT28kcxbT7aYF4W6eysS0VSjgWZqZt13KBcmH/WCOo6295Lqzmn95yDC/aSDtOo3yHgqcCX8q5rwMevUzwmVvh5StPNzUnzNDJ9gJzAbc1E99Z2xKwsh/46GCOgzFI/I4nvZRyohvUJKH7L6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcokncIV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcokncIV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91771C4CEEB;
	Sun, 29 Jun 2025 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751211492;
	bh=irUPTlS0/NWtgLLK+FiDb0DkltPA9zyPBDyAIy/e0yQ=;
	h=From:To:Cc:Subject:Date:From;
	b=dcokncIV/YPkA0m+7Bwp2Vi5gCxmxRwI/iyVW+7H0p3gw/ZpyGt75bZUgj6KXsoyi
	 dCF1KWbvh8ktk80BeKQmTk+0ioNU6QPHCTgc6qEwoqITBSdJEp88p/PcYYI4ZQ1LjQ
	 vvFZ4gDk2LlDtSsPRSdPAP2CRefem4M3fNhmUdzg9nKlPWXc0rWorkKWbNvr79gkCK
	 hVpooeP1rLsfqrpRSvnmlYli38MtNbf1VDRlulc4j27YVVCHti7VdM7hukl1HgxOZP
	 xebAX0B6NP2cu0lZdkokZLnLM4ougWAvmLoGQel9hPiz4QYOJPOC92++jASMIXLnhb
	 +kA9j2qV7IvxA==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	alyssa@rosenzweig.io,
	lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] rust: drm: device: drop_in_place() the drm::Device in release()
Date: Sun, 29 Jun 2025 17:37:42 +0200
Message-ID: <20250629153747.72536-1-dakr@kernel.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drm::Device::new() we allocate with __drm_dev_alloc() and return an
ARef<drm::Device>.

When the reference count of the drm::Device falls to zero, the C code
automatically calls drm_dev_release(), which eventually frees the memory
allocated in drm::Device::new().

However, due to that, drm::Device::drop() is never called. As a result
the destructor of the user's private data, i.e. drm::Device::data is
never called. Hence, fix this by calling drop_in_place() from the DRM
device's release callback.

Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 624d7a4c83ea..14c1aa402951 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -66,7 +66,7 @@ impl<T: drm::Driver> Device<T> {
         open: Some(drm::File::<T::File>::open_callback),
         postclose: Some(drm::File::<T::File>::postclose_callback),
         unload: None,
-        release: None,
+        release: Some(Self::release),
         master_set: None,
         master_drop: None,
         debugfs_init: None,
@@ -162,6 +162,16 @@ pub unsafe fn as_ref<'a>(ptr: *const bindings::drm_device) -> &'a Self {
         // SAFETY: `ptr` is valid by the safety requirements of this function.
         unsafe { &*ptr.cast() }
     }
+
+    extern "C" fn release(ptr: *mut bindings::drm_device) {
+        // SAFETY: `ptr` is a valid pointer to a `struct drm_device` and embedded in `Self`.
+        let this = unsafe { Self::from_drm_device(ptr) };
+
+        // SAFETY:
+        // - When `release` runs it is guaranteed that there is no further access to `this`.
+        // - `this` is valid for dropping.
+        unsafe { core::ptr::drop_in_place(this) };
+    }
 }
 
 impl<T: drm::Driver> Deref for Device<T> {

base-commit: 615cc4223fcbe1e0e6f68b8494b26bb6c08d917a
-- 
2.50.0

