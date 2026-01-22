Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3D4350D7B
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 21:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769118235; cv=none; b=WgHkaQOvURQ2j+/Iagx1J3zBoLgNrKkN9sWXPnWs31X/ctk603K4KbHcGybIHeizUbcDuc15bPbNoGUSojKlqNvyFITqMs5g7fLrzP4XqfA1Law0S3D1vlhA5wq/PY3sbm5Uo+FPfKdK76HpI0tDviDajbfzYgp2iaEu0hyByCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769118235; c=relaxed/simple;
	bh=WCqgFc9cewr4XZu5f0sdwaLuhKGwhBpcnvkzMaOCOzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNO+PuecDonb+M1O4tAJR5UuK1JTyUHCfx+oFRjMbb/WpDA4HxrJZs6LrUAQwzInJa98xDvPG5dyRexQGmUSWtA8nCkkLVEQHxXXTP1yrjvCkFSK9+UQewYdEvp7ETsgMzljfVJuJWLSd1ut2CzMtpeY+LOK678h+KdhRo3Lc/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QTsAbb1I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QTsAbb1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769118227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lAQV4O1UaX/OoIDeCzrBseKKhkGScnjnhRmZuyKIEn0=;
	b=QTsAbb1IOV/AoIXGiRmpnX0QWxnjtlOhCd2wA3MSl9+jgwJSETWpwM0o2q6J4CrsoJWFco
	1nsCN4rAOgSD4QvJYR9mDXLDG8yaXpEzhxV8iCwnKwI1lCa8tj2DnwcbAxGpWehthdhr7o
	eGMTBq2hbVE3hZlu7JVUMkpx/RAM7Qg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-82-Ld1vsUYTN9WFTl1Ae8tWlA-1; Thu,
 22 Jan 2026 16:43:43 -0500
X-MC-Unique: Ld1vsUYTN9WFTl1Ae8tWlA-1
X-Mimecast-MFC-AGG-ID: Ld1vsUYTN9WFTl1Ae8tWlA_1769118221
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE4DF18005BB;
	Thu, 22 Jan 2026 21:43:40 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 798D530002D1;
	Thu, 22 Jan 2026 21:43:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: "Ewan Chorynski" <ewan.chorynski@ik.me>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Shankari Anand" <shankari.ak0208@gmail.com>,
	"David Airlie" <airlied@gmail.com>,
	"Asahi Lina" <lina+kernel@asahilina.net>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v2 2/2] rust/drm: Remove imports covered by prelude::*
Date: Thu, 22 Jan 2026 16:43:03 -0500
Message-ID: <20260122214316.3281257-2-lyude@redhat.com>
In-Reply-To: <20260122214316.3281257-1-lyude@redhat.com>
References: <20260122214316.3281257-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This just removes any explicit imports of items in files that are already
being pulled in by `use prelude::*;`.

There should be no functional changes in this patch.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/device.rs  |  5 +----
 rust/kernel/drm/driver.rs  | 10 +++-------
 rust/kernel/drm/file.rs    |  6 +-----
 rust/kernel/drm/gem/mod.rs |  6 +-----
 4 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 23c457c90a6ab..30116d78cabe0 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -12,10 +12,7 @@
         self,
         driver::AllocImpl, //
     },
-    error::{
-        from_err_ptr,
-        Result, //
-    },
+    error::from_err_ptr,
     prelude::*,
     sync::aref::{
         ARef,
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index c8ec5c0819a06..2940fece7d59e 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -8,15 +8,11 @@
     bindings,
     device,
     devres,
-    drm, //
-    error::{
-        to_result,
-        Result, //
-    },
+    drm,
+    error::to_result,
     prelude::*,
-    sync::aref::ARef,
+    sync::aref::ARef, //
 };
-use macros::vtable;
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
 pub(crate) const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
index 7dade6dfa1ba2..10160601ce5af 100644
--- a/rust/kernel/drm/file.rs
+++ b/rust/kernel/drm/file.rs
@@ -7,14 +7,10 @@
 use crate::{
     bindings,
     drm,
-    error::Result,
     prelude::*,
     types::Opaque, //
 };
-use core::{
-    marker::PhantomData,
-    pin::Pin, //
-};
+use core::marker::PhantomData;
 
 /// Trait that must be implemented by DRM drivers to represent a DRM File (a client instance).
 pub trait DriverFile {
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 56b7641b1405e..b4199945db378 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -5,7 +5,6 @@
 //! C header: [`include/drm/drm_gem.h`](srctree/include/drm/drm_gem.h)
 
 use crate::{
-    alloc::flags::*,
     bindings,
     drm::{
         self,
@@ -14,10 +13,7 @@
             AllocOps, //
         },
     },
-    error::{
-        to_result,
-        Result, //
-    },
+    error::to_result,
     prelude::*,
     sync::aref::{
         ARef,
-- 
2.52.0

