Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E43218AD9;
	Thu,  9 Jan 2025 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429572; cv=pass; b=mAmax8bZNfnDVWD7ayu5Qa2YbDGOeDwZtg0d/ozbIy9tQhg/naxvIEe2i2HwoUnhUGUTKytABOOLsYqvZH+0YnOM0Bu9GzPgxwpRg78dD8AgEShaFPuQnGN8Qms3Fw6QNku7X/GeMgq4C737fyzIbvA/ugyw9WP4ze7Jxu3ghew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429572; c=relaxed/simple;
	bh=kam9naxRQIvPg7agsDREKZxfHv2YoAklYkOfwAuiFgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0h1HfolYGunwzjIlgHr6/qaHY7Of3gFjG+26gE2jk1+3IAuO/8C4x3jh2j/jtAv/f5BEE1yO7ZE+zk8pv/hldzWSrWfJPyKB2dPCjOrCMLL97+zelPcTCeRl9zvHEeMkB4mjlm6GHqf0+LEIeCVLu96EEwuIFRBchW91AyLUhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Z9fk0SPr; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Z9fk0SPr"
ARC-Seal: i=1; a=rsa-sha256; t=1736429546; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dFXlLbIoZ4oA2FFhtZhnql9fX0sEzWAJXZQXTvZUOno87GQtycALhxmNJiRXP/5E0dYwdmE0bYp4L75qtmtg6kzuYQe4aWWsvegsjr2vEqqBlmPqWdM9m7SaXZX+9WU37tGAF4Gm2ccofTi7iy2BwSRqt+ieo/0g+QHWI4U1PIw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736429546; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oPExcULudPjkjEOepmyiEju1wua9Fxj2smvvnK8wHxw=; 
	b=Lc5qrfqzFCp7qP1F3jGbJ2zekbj879f2EVdGtOCt0Yo4SVe9Sh9UKJWdNmW68jzPuf4rc2y5HpfF26Mj35H/m/EmIyL92cswSfkPmdVyJEnaloQBlbFjFClMnKXVtey1tHiMWtpz0VkBvl8ZtpPb93dmD7MjlSQZvEiQBq3UQ8g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736429545;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oPExcULudPjkjEOepmyiEju1wua9Fxj2smvvnK8wHxw=;
	b=Z9fk0SPrOM59CxuIE4mWJ5hsDzbi+G2cFlZ4LzpRbAKNlZ39ML7ALeyVFS3tdWTj
	z0THk+Ia8gndhR0vUIQmci7vIR4lW74VcK5ZigHpGUh2dX9WexsTGqA2EoQNrAkm2aW
	MQZNfhz9U6Xh6vef0QBMkS1l5Z+/rrUZiYtVy6SU=
Received: by mx.zohomail.com with SMTPS id 1736429544232864.3002211562534;
	Thu, 9 Jan 2025 05:32:24 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	boris.brezillon@collabora.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] rust: io: add resource abstraction
Date: Thu,  9 Jan 2025 10:30:53 -0300
Message-ID: <20250109133057.243751-2-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
References: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
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
 rust/kernel/io/resource.rs      | 49 +++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)
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
index 000000000000..84876af1699c
--- /dev/null
+++ b/rust/kernel/io/resource.rs
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstraction for system resources.
+//!
+//! C header: [`include/linux/ioport.h`](../../../../include/linux/ioport.h)
+
+use crate::str::CStr;
+use crate::types::Opaque;
+
+/// A resource abstraction.
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
+        unsafe { &mut *ptr.cast() }
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
2.47.1

