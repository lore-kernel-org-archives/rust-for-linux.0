Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE03184
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 18:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191757; cv=none; b=kSmWwsl2SgM6k2yzzki1bRiRyL5d/1x3zGR7hGU6ZV71/1USJoltdwqQQSbBoj+4Zdq187Td9P2rye7G4a/2FAvq6lblS9lvud7FTwUhY7YrYOSO0VQUuJ9mgCpYkK2b+Ok66kSlhIYR7sLImxQ5doYYAGUH1JF1xghv0+svop4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191757; c=relaxed/simple;
	bh=U6jok9Lm4gAl1gXQAwBolGmq4HjJ88DnwYNX9jA/Pek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRpi/eSfRDxLXPSP5R9WSK3MFa66+qa0zYveYAnLLKOJfH6zUlY++K0P8X0Sqnzv9lnPl+WmFWdjg4PQUKSzn12zA5nBJ3zn/g8yZWF/toCVBUsGN/T2ePKqEQ1XKsJHhF4f+JAI4vFYf/43T19nH8ffKpJGdbZNn0QdJweR6yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I10RhgmB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I10RhgmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769191755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sju1fArvXLQeBXSNQsoi+yWmCa/O67MXYMKkbK3HSjs=;
	b=I10RhgmBf39UeyzW1PFGmT1UTpngJD3/z7VkwIDIYC4PbGFpj/8TUt8mwQicUJ0iVYXsLK
	0Y5zDwMsvTnPugyEUbFHrM22dC/NUwv8LdKKhAo+YgVGGLqZdeLeQZKz/f4K12TOX/mBgH
	Rb4FUKNs+4dc7FMTMVvnDehYZti/A7I=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-435-8ZTT9zXcO0-1LCjDfiacMQ-1; Fri,
 23 Jan 2026 13:09:11 -0500
X-MC-Unique: 8ZTT9zXcO0-1LCjDfiacMQ-1
X-Mimecast-MFC-AGG-ID: 8ZTT9zXcO0-1LCjDfiacMQ_1769191749
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B183B1944B0C;
	Fri, 23 Jan 2026 18:09:09 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A394718004D8;
	Fri, 23 Jan 2026 18:09:07 +0000 (UTC)
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
	"Atharv Dubey" <atharvd440@gmail.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v3 2/2] rust/drm: Remove imports covered by prelude::*
Date: Fri, 23 Jan 2026 13:08:08 -0500
Message-ID: <20260123180851.3974488-2-lyude@redhat.com>
In-Reply-To: <20260123180851.3974488-1-lyude@redhat.com>
References: <20260123180851.3974488-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

This just removes any explicit imports of items in files that are already
being pulled in by `use prelude::*;`.

There should be no functional changes in this patch.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/device.rs  | 5 +----
 rust/kernel/drm/driver.rs  | 6 +-----
 rust/kernel/drm/file.rs    | 6 +-----
 rust/kernel/drm/gem/mod.rs | 6 +-----
 4 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index ae123ffece790..629ef0bd1188e 100644
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
index 24e81afb04f58..2940fece7d59e 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -9,14 +9,10 @@
     device,
     devres,
     drm,
-    error::{
-        to_result,
-        Result, //
-    },
+    error::to_result,
     prelude::*,
     sync::aref::ARef, //
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

