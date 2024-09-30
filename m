Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B3D17332B
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739454; cv=none; b=qNERam7FLCZjKYO+Xya0GJir04mD05Ugb7bEY0qKgcJJww8NvdBsQyXEOM6zgBFjrdEMM3s7QB7uJLyhke+9pLBDlhJD+MHApY4U1VWxnQg10pwakLWjKfMm4wl9fTSde3p/0mIBTJCvqvoEx+caFH2taEWWi500oLGrykXZneU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739454; c=relaxed/simple;
	bh=XdGhRvdpX3rHMzT1KDBHaekasIuyBXDDnYIO6TCMHxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hqcPy19TYAW2wc1YrXgdHdh0rijsA+VGJGzl3ibo6k2A+wdhbGfPobwXDhFMj7a/yyA0z5c/8lsx6bNnwfF6RENLpSELy+YcDvQiWxl9Z3klBy8vTkZyxbjcg3DBlyUE5sz3e4P/nREcGoJNEdYQ7auQJqoRkTEKZa1s8wqch5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y6sTt2jC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y6sTt2jC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727739451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DdC7V+RGCNsUxoQc10gW35F78meSMQbe3+j1HDfYD9I=;
	b=Y6sTt2jCOFseMDHKwHGAaf71aI7qYIbOu8XtQry7PgeSOMpiiqzWnQK6Qh4xSoPlMWtr3G
	ylMbWc/XmZdUZNabBjsGFl+6ypU54Bflmij1YcK7k86kamnrbbPIopbquNy6DVEttPwglU
	f7g3uDOk2OsogYPTX2DuMW//X49vKXg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-164-3RGTdnYgNwGDm4k27PGtmQ-1; Mon,
 30 Sep 2024 19:37:25 -0400
X-MC-Unique: 3RGTdnYgNwGDm4k27PGtmQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 51A4619626D0;
	Mon, 30 Sep 2024 23:37:18 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF92A3003DEC;
	Mon, 30 Sep 2024 23:37:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>,
	Danilo Krummrich <dakr@kernel.org>,
	mcanal@igalia.com,
	airlied@redhat.com,
	zhiw@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@redhat.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 01/35] WIP: rust/drm: Add fourcc bindings
Date: Mon, 30 Sep 2024 19:09:44 -0400
Message-ID: <20240930233257.1189730-2-lyude@redhat.com>
In-Reply-To: <20240930233257.1189730-1-lyude@redhat.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This adds some very basic rust bindings for fourcc. We only have a single
format code added for the moment, but this is enough to get a driver
registered.

TODO:
* Write up something to automatically generate constants from the fourcc
  headers

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/fourcc.rs       | 127 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 3 files changed, 129 insertions(+)
 create mode 100644 rust/kernel/drm/fourcc.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index b2e05f8c2ee7d..04898f70ef1b8 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -9,6 +9,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
diff --git a/rust/kernel/drm/fourcc.rs b/rust/kernel/drm/fourcc.rs
new file mode 100644
index 0000000000000..b80eba99aa7e4
--- /dev/null
+++ b/rust/kernel/drm/fourcc.rs
@@ -0,0 +1,127 @@
+use bindings;
+use core::{ops::*, slice, ptr};
+
+const fn fourcc_code(a: u8, b: u8, c: u8, d: u8) -> u32 {
+    (a as u32) | (b as u32) << 8 | (c as u32) << 16 | (d as u32) << 24
+}
+
+// TODO: Figure out a more automated way of importing this
+pub const XRGB888: u32 = fourcc_code(b'X', b'R', b'2', b'4');
+
+#[derive(Copy, Clone)]
+#[repr(C)]
+pub struct FormatList<const COUNT: usize> {
+    list: [u32; COUNT],
+    _sentinel: u32,
+}
+
+impl<const COUNT: usize> FormatList<COUNT> {
+    /// Create a new [`FormatList`]
+    pub const fn new(list: [u32; COUNT]) -> Self {
+        Self {
+            list,
+            _sentinel: 0
+        }
+    }
+
+    /// Returns the number of entries in the list, including the sentinel.
+    ///
+    /// This is generally only useful for passing [`FormatList`] to C bindings.
+    pub const fn raw_len(&self) -> usize {
+        COUNT + 1
+    }
+}
+
+impl<const COUNT: usize> Deref for FormatList<COUNT> {
+    type Target = [u32; COUNT];
+
+    fn deref(&self) -> &Self::Target {
+        &self.list
+    }
+}
+
+impl<const COUNT: usize> DerefMut for FormatList<COUNT> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.list
+    }
+}
+
+#[derive(Copy, Clone)]
+#[repr(C)]
+pub struct ModifierList<const COUNT: usize> {
+    list: [u64; COUNT],
+    _sentinel: u64
+}
+
+impl<const COUNT: usize> ModifierList<COUNT> {
+    /// Create a new [`ModifierList`]
+    pub const fn new(list: [u64; COUNT]) -> Self {
+        Self {
+            list,
+            _sentinel: 0
+        }
+    }
+}
+
+impl<const COUNT: usize> Deref for ModifierList<COUNT> {
+    type Target = [u64; COUNT];
+
+    fn deref(&self) -> &Self::Target {
+        &self.list
+    }
+}
+
+impl<const COUNT: usize> DerefMut for ModifierList<COUNT> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.list
+    }
+}
+
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct FormatInfo {
+    inner: bindings::drm_format_info,
+}
+
+impl FormatInfo {
+    // SAFETY: `ptr` must point to a valid instance of a `bindings::drm_format_info`
+    pub(super) unsafe fn from_raw<'a>(ptr: *const bindings::drm_format_info) -> &'a Self {
+        // SAFETY: Our data layout is identical
+        unsafe { &*ptr.cast() }
+    }
+
+    /// The number of color planes (1 to 3)
+    pub const fn num_planes(&self) -> u8 {
+        self.inner.num_planes
+    }
+
+    /// Does the format embed an alpha component?
+    pub const fn has_alpha(&self) -> bool {
+        self.inner.has_alpha
+    }
+
+    /// The total number of components (color planes + alpha channel, if there is one)
+    pub const fn num_components(&self) -> u8 {
+        self.num_planes() + self.has_alpha() as u8
+    }
+
+    /// Number of bytes per block (per plane), where blocks are defined as a rectangle of pixels
+    /// which are stored next to each other in a byte aligned memory region.
+    pub fn char_per_block(&self) -> &[u8] {
+        // SAFETY: The union we access here is just for descriptive purposes on the C side, both
+        // members are identical in data layout
+        unsafe { &self.inner.__bindgen_anon_1.char_per_block[..self.num_components() as _] }
+    }
+}
+
+impl AsRef<bindings::drm_format_info> for FormatInfo {
+    fn as_ref(&self) -> &bindings::drm_format_info {
+        &self.inner
+    }
+}
+
+impl From<bindings::drm_format_info> for FormatInfo {
+    fn from(value: bindings::drm_format_info) -> Self {
+        Self { inner: value }
+    }
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index c44760a1332fa..2c12dbd181997 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -5,5 +5,6 @@
 pub mod device;
 pub mod drv;
 pub mod file;
+pub mod fourcc;
 pub mod gem;
 pub mod ioctl;
-- 
2.46.1

