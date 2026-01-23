Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A364B27A465
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 18:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191751; cv=none; b=ejPUCNGFQ78/TleQUVaUKVw5AzrNSa+jR/KMZASZ85PzFBntxQnHKKDDAXjO5oScC13Mco3cvQ+nW4BWQSwxmCul7Ay04emiIX7hKfeWWpXILh8PQUawhBWfVLliyPJCD2ZqK9PZhDpQDqjqZ8pNG3mlrfb16O1vI9gui+IJZ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191751; c=relaxed/simple;
	bh=KORpUpWT8N6G23r3zxfQXNFQDP2wToDG0CmtNfoTmsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cPOYrXD7mA3ibseljVqb8GdEYFbWP3z//iq+e7qu+AxbUN9FcIRNoRyvKfcTl8zD6TNuuXyof5T/fXz9Gd9GmU8YLTFZsSjpZ1cthTwIHcrB93mw5towcjk0yXVMuzb+z/vDPI8SMIw7V/IhYOvLosTEUWXoeWI2orQifF2k0Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h7x6HdDj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h7x6HdDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769191748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xv6fD/wkVGKHsH+9DOHuW4wmIxzzH7K++nYkQn67um0=;
	b=h7x6HdDjVYQfwjnBmivIyKNGqZHdjG6khlX4D6XUKm7a5P2MiKChRvnM7b3mX+5BvLdx6a
	iws4fUGJaYL+DtvySb0a/UlCF55UFX7WKqRTREqE/aBSufjL3QRr36CpvtcTr+0dAo0CB5
	YSHydCU/6WnSQchE5BqLJm/RQHpaGAI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-58-cT6ycDT3M36-rqN1hj5Szw-1; Fri,
 23 Jan 2026 13:09:05 -0500
X-MC-Unique: cT6ycDT3M36-rqN1hj5Szw-1
X-Mimecast-MFC-AGG-ID: cT6ycDT3M36-rqN1hj5Szw_1769191743
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E79951955D9D;
	Fri, 23 Jan 2026 18:09:02 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 15C0218004D8;
	Fri, 23 Jan 2026 18:09:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: "Ewan Chorynski" <ewan.chorynski@ik.me>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Shankari Anand" <shankari.ak0208@gmail.com>,
	"David Airlie" <airlied@gmail.com>,
	"Asahi Lina" <lina+kernel@asahilina.net>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v3 1/2] rust/drm: Fixup import styles
Date: Fri, 23 Jan 2026 13:08:07 -0500
Message-ID: <20260123180851.3974488-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

This is to match
  https://docs.kernel.org/rust/coding-guidelines.html#imports

There should be no functional changes in this patch.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Make sure // is on the last import item always (Gary Guo)

 rust/kernel/drm/device.rs  | 31 ++++++++++++++++++++++++-------
 rust/kernel/drm/driver.rs  | 12 +++++++++---
 rust/kernel/drm/file.rs    | 14 +++++++++++---
 rust/kernel/drm/gem/mod.rs | 25 ++++++++++++++++++++-----
 4 files changed, 64 insertions(+), 18 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3ce8f62a00569..ae123ffece790 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -6,15 +6,32 @@
 
 use crate::{
     alloc::allocator::Kmalloc,
-    bindings, device, drm,
-    drm::driver::AllocImpl,
-    error::from_err_ptr,
-    error::Result,
+    bindings,
+    device,
+    drm::{
+        self,
+        driver::AllocImpl, //
+    },
+    error::{
+        from_err_ptr,
+        Result, //
+    },
     prelude::*,
-    sync::aref::{ARef, AlwaysRefCounted},
-    types::Opaque,
+    sync::aref::{
+        ARef,
+        AlwaysRefCounted, //
+    },
+    types::Opaque, //
+};
+use core::{
+    alloc::Layout,
+    mem,
+    ops::Deref,
+    ptr::{
+        self,
+        NonNull, //
+    },
 };
-use core::{alloc::Layout, mem, ops::Deref, ptr, ptr::NonNull};
 
 #[cfg(CONFIG_DRM_LEGACY)]
 macro_rules! drm_legacy_fields {
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index f30ee4c6245cd..24e81afb04f58 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -5,10 +5,16 @@
 //! C header: [`include/drm/drm_drv.h`](srctree/include/drm/drm_drv.h)
 
 use crate::{
-    bindings, device, devres, drm,
-    error::{to_result, Result},
+    bindings,
+    device,
+    devres,
+    drm,
+    error::{
+        to_result,
+        Result, //
+    },
     prelude::*,
-    sync::aref::ARef,
+    sync::aref::ARef, //
 };
 use macros::vtable;
 
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
index 8c46f8d519516..7dade6dfa1ba2 100644
--- a/rust/kernel/drm/file.rs
+++ b/rust/kernel/drm/file.rs
@@ -4,9 +4,17 @@
 //!
 //! C header: [`include/drm/drm_file.h`](srctree/include/drm/drm_file.h)
 
-use crate::{bindings, drm, error::Result, prelude::*, types::Opaque};
-use core::marker::PhantomData;
-use core::pin::Pin;
+use crate::{
+    bindings,
+    drm,
+    error::Result,
+    prelude::*,
+    types::Opaque, //
+};
+use core::{
+    marker::PhantomData,
+    pin::Pin, //
+};
 
 /// Trait that must be implemented by DRM drivers to represent a DRM File (a client instance).
 pub trait DriverFile {
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index d49a9ba026356..56b7641b1405e 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -6,14 +6,29 @@
 
 use crate::{
     alloc::flags::*,
-    bindings, drm,
-    drm::driver::{AllocImpl, AllocOps},
-    error::{to_result, Result},
+    bindings,
+    drm::{
+        self,
+        driver::{
+            AllocImpl,
+            AllocOps, //
+        },
+    },
+    error::{
+        to_result,
+        Result, //
+    },
     prelude::*,
-    sync::aref::{ARef, AlwaysRefCounted},
+    sync::aref::{
+        ARef,
+        AlwaysRefCounted, //
+    },
     types::Opaque,
 };
-use core::{ops::Deref, ptr::NonNull};
+use core::{
+    ops::Deref,
+    ptr::NonNull, //
+};
 
 /// A type alias for retrieving a [`Driver`]s [`DriverFile`] implementation from its
 /// [`DriverObject`] implementation.

base-commit: 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
-- 
2.52.0

