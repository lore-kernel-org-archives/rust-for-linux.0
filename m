Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB871DBB3A;
	Thu, 16 Jan 2025 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737032769; cv=pass; b=i7MI4UgBmw159ahoyBwdYgQbtVNrrA6M0cD5NC8x2VHbFzeY9z1Iz3QdtzCrZr2gnJKNrWMGVemDwCtSK29OFfEDbMK2kerz7lwVCclZHjG6nspJHJAQo9x5S43BFwnfS3Jv2CP3hctDZ6knadqk+141rfxzMxwem+E+kQZEMSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737032769; c=relaxed/simple;
	bh=PSU/A3EW/CGdM9iFGZ5hiABQAZI/f3/Re6CzRih2/ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uv/DgjnRUtTaXYsS5sE6Y9hKBdJ34Gxgkm7F8ob9XHwgZTZ+XgUIXi7ZlEES6hplNEiFLnRg0UXvpm7/E4mdlbAjQjb0RILAKbdb8EyZqHaB9JrxDUaxnfIOQHgB8uJsRRToZ6JhCnNvikcmwQ1QSI1r9BJEn6tO5O5i7Q/nOO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=UmXR/wqm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="UmXR/wqm"
ARC-Seal: i=1; a=rsa-sha256; t=1737032711; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DC1pxCwrixFOo2bPPVbHaoFL109Ngq5UA9tU0nZ3r248V7gINGylAfWgcVQTmBZmTGSv9HoxXPqDfD6K3TwHnKmxXQLwAPAXuIFPiNJfchgRU75gmYSSICVO/mYJuhI9t4tdgQSuZP00Mqp6HbJq6BHVVUU/JAgjmK8dhouRCWY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737032711; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tIv/wFu5hcAqXTHXWRB0ajm+LYWHFrBqdBacTD2Yu5A=; 
	b=ExVWwch7nzMMj1b02ww0TwOjcu7z+W/2PRbWx7882R8+85c0lHY5sfnQG4ne0qb68V5MfpTh8rEc0I8A6KdN7d3vUz8ycVwXzo6ast1ZCIo+av2QRBjN7Mz+M9DZNTnUikWdL+4gDBb6ohmJyrMFfitAc7XsG9ytr0NIvNurRy0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737032711;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tIv/wFu5hcAqXTHXWRB0ajm+LYWHFrBqdBacTD2Yu5A=;
	b=UmXR/wqmNbtGWELytcEdcJzK/YYZ/Gy7N15oAvAkVjIlwxlEZ6Fy6h7ANId6CIUc
	MtvgOnLgfR4GfupiuACPCEaMum3CoVvYexh1lOjWiDFA2MStgKSFbi0bm2a4Bq+XyiL
	UV5NV4oQLEFezoGu9jNQ8zzqapkAsL84goDBsT1s=
Received: by mx.zohomail.com with SMTPS id 1737032710144449.185524274169;
	Thu, 16 Jan 2025 05:05:10 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.mco,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	boris.brezillon@collabora.com,
	robh@kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v5 1/3] rust: io: add resource abstraction
Date: Thu, 16 Jan 2025 09:56:24 -0300
Message-ID: <20250116125632.65017-2-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250116125632.65017-1-daniel.almeida@collabora.com>
References: <20250116125632.65017-1-daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

In preparation for ioremap support, add a Rust abstraction for struct
resource.

A future commit will introduce the Rust API to ioremap a resource from a
platform device. The current abstraction, therefore, adds only the
minimum API needed to get that done.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/io.c               |  7 +++++
 rust/kernel/io.rs               |  2 ++
 rust/kernel/io/resource.rs      | 53 +++++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 rust/kernel/io/resource.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index e9fdceb568b8..f9c2eedb5b9b 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -16,6 +16,7 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/ioport.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
 #include <linux/mdio.h>
diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index 4c2401ccd720..3cb47bd01942 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/io.h>
+#include <linux/ioport.h>
 
 void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
 {
@@ -99,3 +100,9 @@ void rust_helper_writeq_relaxed(u64 value, volatile void __iomem *addr)
 	writeq_relaxed(value, addr);
 }
 #endif
+
+resource_size_t rust_helper_resource_size(struct resource *res)
+{
+	return resource_size(res);
+}
+
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index d4a73e52e3ee..566d8b177e01 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -7,6 +7,8 @@
 use crate::error::{code::EINVAL, Result};
 use crate::{bindings, build_assert};
 
+pub mod resource;
+
 /// Raw representation of an MMIO region.
 ///
 /// By itself, the existence of an instance of this structure does not provide any guarantees that
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
new file mode 100644
index 000000000000..ca92f9af613b
--- /dev/null
+++ b/rust/kernel/io/resource.rs
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstraction for system resources.
+//!
+//! C header: [`include/linux/ioport.h`](srctree/include/linux/ioport.h)
+
+use crate::str::CStr;
+use crate::types::Opaque;
+
+/// A resource abstraction.
+///
+/// # Invariants
+///
+/// `Resource` is a transparent wrapper around a valid `bindings::resource`.
+#[repr(transparent)]
+pub struct Resource(Opaque<bindings::resource>);
+
+impl Resource {
+    /// Creates a reference to a [`Resource`] from a valid pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that for the duration of 'a, the pointer will
+    /// point at a valid `bindings::resource`
+    ///
+    /// The caller must also ensure that the `Resource` is only accessed via the
+    /// returned reference for the duration of 'a.
+    pub(crate) unsafe fn from_ptr<'a>(ptr: *mut bindings::resource) -> &'a Self {
+        // SAFETY: Self is a transparent wrapper around `Opaque<bindings::resource>`.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Returns the size of the resource.
+    pub fn size(&self) -> bindings::resource_size_t {
+        let inner = self.0.get();
+        // SAFETY: safe as per the invariants of `Resource`
+        unsafe { bindings::resource_size(inner) }
+    }
+
+    /// Returns the start address of the resource.
+    pub fn start(&self) -> u64 {
+        let inner = self.0.get();
+        // SAFETY: safe as per the invariants of `Resource`
+        unsafe { *inner }.start
+    }
+
+    /// Returns the name of the resource.
+    pub fn name(&self) -> &CStr {
+        let inner = self.0.get();
+        // SAFETY: safe as per the invariants of `Resource`
+        unsafe { CStr::from_char_ptr((*inner).name) }
+    }
+}
-- 
2.48.0

