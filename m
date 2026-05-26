Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1553D8101
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788647; cv=none; b=H8CicFQ0KGyXEjccOKUc/kGC+1hyH+6KDrEncFEXReZ7UDE6kPb7wXetz1QQoT8H0FYtDDqm55c1+GfVhXIBSaQmMVO0u5TU1nC3ZizNbbjlbMdNX6n/5FsfK6Ed6QuZbuhbeV8bDDRY611MqqMVTcTgWF9wZevmWTbInHB3mms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788647; c=relaxed/simple;
	bh=xSBymoxFsw8QxwUqEJx9/I737cxoIr9CI0TAp+DKvLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FuDPTUSTiQNsMWyUm/BWbm2pLP/U3lCcz8Df6ZuaIYRI7oYk+qEddHv6aJpzzRsSYNAx9roIus/RvhB11JZ/FFS5uq78bbhTzhjGdSxammCbjFpaGS5Ll/bEvOLvJAjRu/orkK/sRXIJ5NbZbQU7zhRuTN7Hfe5d8Z3kDOM9X5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EU4FtfMw; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EU4FtfMw"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3695bf7d082so9319652a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779788645; x=1780393445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=givk+B9IBegvbSx5HWlHHmcrLx0wxGpQj5mKDfbiDXI=;
        b=EU4FtfMwqOm6tApiegisDnSRVSR+z1tobmwGVU2Of7vIh9hdlXUSlVpW0TV+1lZ2mb
         dS0NqwDP6UtVqbiHxCKBZXyhXpVpz4AunkVe8UY3XI+XPAcxsQjTEDZDTFJIVFyuHKKG
         nfgwHnQx+joDiqPba2g764W3gUqXk1RI6UwBMsGw2dW3KJNxxVR2bDiMra3V/OcAyyCq
         CkIMtbH8MWpkOhwEXf1t1aFD3mEB/z18QD84dFCA4+MHll0DJ+BBVUgUxE5yng58XKLq
         yDlN/eQ3oYASco6HHbzuZMzk9kwJhKubfZtUUDFz5s217q0hz1chx6NbXzH1lJx18uxL
         6Ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788645; x=1780393445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=givk+B9IBegvbSx5HWlHHmcrLx0wxGpQj5mKDfbiDXI=;
        b=F/ROCxc3c9eH7zJDHA2jTXH9vnI2eEq6tGjbEuhOdv1XtUTOUA6TK9btJdlV6wdg0t
         dk3KdaSxzIBQ2zwN4AraxUGdbjISfZX69isQXewGQHDe27yMH4Dj7lRgAn0hWkVCyuLh
         Az6jg9lHv+yJIQ1qwqewlDGw6Zc0rei5SJ3sHCfeQijZUjR0wMFWCZSLhMQgdpyLH3s0
         FFklBm+K2oGMr7Y2x/H+RY0i3qZwE2QuPpEaUyGXyqj4gqa1MCFW35lalti5FURuejCI
         u1yCIUZo+JfTuNFzOxINHVrQG11yIqqERNybPzPbPRXTvQj7iLjYg5enkten1aPQyNCl
         +J5w==
X-Forwarded-Encrypted: i=1; AFNElJ8SJO2S0BJYDtP3OaV3eCugrNC07ciZ1tED7+9G4r6EhZWm8plAC9MDIkoWPSmUHqLF4mJwdu8CYoI/ID3zDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP0we29jtsxwf1jRsW267WOUV5O7t8oG6cv+rUEyA5Z/mFeXMW
	bWahf3TrfVTNTjh939ovhZ2lJWTJqMGGnVdNl3iV1TfGul8xXihmB3fqIvtezbQhNcw=
X-Gm-Gg: Acq92OFsndgY7TA731zn9cf9L3UDT4iGKHki3txam14rpGycn8TGbkTYcb4KBh2X2lc
	ShbOre3VKO8xmbdPJbSEidRFLSlDM+TlJ8zXlcprTtsyJlrQWWtrn8P0xibRNDDFJnvNFmUBu2t
	+Ndia1MGYh2kt2AOuZba+jbOMsxc1JPX2fpJOWAF7qzHbaQpX2MY2k0aDdd52hbHg18IvgTVV/c
	ErpLK91GhLMbN7QO+JyC4RATuD/rBogeTSX9lcu+SLIC+Hq89Vslz1PyribI3wlCWu53aUyPROR
	em0HkU0mZ715NuRfnpNiBPfwGMp7MamGGSUoSOWg7EhAumcFP7Gj1OlOzVBaLM9kEzHivXqfdrB
	6jgiUt7SlNKe4ZL+IrrlbhZu5WpqU5eKABoSxEtHgjON0FHQb7dV/e8l7Mo31CfJzD4kvr8/QAY
	cS1uQyx1MBF+HrRDLG5i3mAtmE3LhKKcVkWxb4FWcYM8KaH+jZp9n50c0Wlo/2gAriJTfSsAPv+
	EbLy7xCgubg
X-Received: by 2002:a17:90b:3505:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-36a671ddedcmr17296613a91.0.1779788645132;
        Tue, 26 May 2026 02:44:05 -0700 (PDT)
Received: from Zenbook-Duo.domain.name ([2401:4900:884c:3eef:84d1:476b:9262:5d0c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6d810692sm5301016a91.9.2026.05.26.02.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:44:04 -0700 (PDT)
From: Aary Milind Kinge <kingeaary@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Not-Buddy <kingeaary@gmail.com>
Subject: [PATCH] rust: devres: use compile-time type_name for debug info
Date: Tue, 26 May 2026 15:13:29 +0530
Message-ID: <20260526094329.533943-1-kingeaary@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Not-Buddy <kingeaary@gmail.com>

The devres_set_node_dbginfo function previously used a hardcoded
c"Devres<T>" string for all device resource nodes because
core::any::type_name was not stabilized as a const fn. This made
debugging device resources difficult as all nodes shared the same name.

Enable the `const_type_name` unstable feature in the `kernel` crate
and replace the hardcoded placeholder with the actual generic type
name at compile time.

To satisfy the C-API's requirement for a null-terminated string, the
bytes are copied into a locally evaluated const array buffer, appended
with a null byte, and promoted to static read-only memory by reference
before being passed to devres_set_node_dbginfo.

Signed-off-by: Aary Milind Kinge <kingeaary@gmail.com>
---
 rust/kernel/devres.rs | 41 ++++++++++++++++++++++++++++++++++++++---
 rust/kernel/lib.rs    |  1 +
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 9e5f93aed20c..989e9d9a78c4 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -185,6 +185,42 @@ pub(super) unsafe fn devres_node_remove(
 }
 
 impl<T: Send> Devres<T> {
+    // 1. Get the standard Rust string at compile time
+    const TYPE_NAME: &'static str = core::any::type_name::<T>();
+
+    // 2. Store the actual bytes in a const array (a VALUE, not a reference)
+    const TYPE_NAME_BUF: [u8; 128] = {
+        let bytes = Self::TYPE_NAME.as_bytes();
+        let mut buf = [0u8; 128];
+        let mut i = 0;
+
+        while i < bytes.len() && i < 127 {
+            buf[i] = bytes[i];
+            i += 1;
+        }
+        buf[i] = 0; // The null terminator
+        buf
+    };
+
+    // 3. Take a reference to the array (which promotes it to static memory)
+    const TYPE_NAME_CSTR: &'static crate::str::CStr = {
+        let static_buf: &'static [u8; 128] = &Self::TYPE_NAME_BUF;
+
+        // Find the length up to the null byte
+        let mut len = 0;
+        while len < 128 && static_buf[len] != 0 {
+            len += 1;
+        }
+
+        // SAFETY: `static_buf` is promoted to static memory, and we verified the null byte.
+        unsafe {
+            crate::str::CStr::from_bytes_with_nul_unchecked(core::slice::from_raw_parts(
+                static_buf.as_ptr(),
+                len + 1,
+            ))
+        }
+    };
+
     /// Creates a new [`Devres`] instance of the given `data`.
     ///
     /// The `data` encapsulated within the returned `Devres` instance' `data` will be
@@ -209,9 +245,8 @@ pub fn new<E>(dev: &Device<Bound>, data: impl PinInit<T, E>) -> Result<Self>
                     unsafe {
                         base::devres_set_node_dbginfo(
                             node,
-                            // TODO: Use `core::any::type_name::<T>()` once it is a `const fn`,
-                            // such that we can convert the `&str` to a `&CStr` at compile-time.
-                            c"Devres<T>".as_char_ptr(),
+                            // Injects the statically promoted C-string pointer
+                            Self::TYPE_NAME_CSTR.as_char_ptr(),
                             core::mem::size_of::<Revocable<T>>(),
                         )
                     };
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b72b2fbe046d..d49fd6edd85f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -21,6 +21,7 @@
 //
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
+#![feature(const_type_name)]
 #![feature(derive_coerce_pointee)]
 //
 // To be determined.
-- 
2.51.0

