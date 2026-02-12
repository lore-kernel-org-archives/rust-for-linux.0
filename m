Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF3B83A14
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 01:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860273; cv=pass; b=Ek14Peq5lGQXPuv9Lf19bq82qzJ2IxjEM8wUX/Azco7hDSvWIZYVw/yD0OM8qozqoj5+gwj6l8nzAep/p4yKy2BR+8EjJqJb/oOu/1+h+fcD0EOpB3zv3yo2IEwYLO4RiOL1wxr5vQ9+wKixFW4x8DqOEBfgmbwv+di+tSCB6Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860273; c=relaxed/simple;
	bh=B+4t3MA4uFO8i7m+loCKhgtsECjik9Xj6DirPf0f7sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKU6UdKLESm8rXNRwh53eJ7zYP6GZnY1YApycDsqx0W1p1POUYoPgCweDA4Ne5RO+MDGTNhRa7xRTySYJBL+Mr58WrK4VvTQQO59GO+az48MY7JRABvTDyyWOOhIZynVnPAnf1Zz4exXcBTaur2O43kHTBfvdS5sJrc76fqFLps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=AQDZ0NFp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="AQDZ0NFp"
ARC-Seal: i=1; a=rsa-sha256; t=1770860263; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WENxZRI5ARoyOHmuXvQU51JK0V12y1bBm+Rfej7Rtb++SW6XXHcmBdsBQjuKMOas/ogpQaauDftF2N14W5v8Jlbq4YHw6eW1Jvh2oyeP5yj+h7ngmJ3Dw+PmFLnBh1T9hKLVoOmwzWp9u0jBo/Ebq7cN5AzhAXT8tgWpR3I8pQY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770860263; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=arvc3A7kVKOZImIISEA7QoPqP9daySKhh4Mbr1901II=; 
	b=Jr04evUz7aeXZaQP4XO4zmEtRG43SUbDz/T48xVuLHvBDvBe0dmri7cw2L+cM4eIh+REhWCh3Y9F9PA0GYTHtNtnQoGJx2o20CWWgh3tARckwIxPxLux410XYepfM6hCsSrT3HK7r/FqNsgCo69Kj5ROiQjFhboGMweInVHvDOs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860263;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=arvc3A7kVKOZImIISEA7QoPqP9daySKhh4Mbr1901II=;
	b=AQDZ0NFpkkbnmbDpsM+P2kfrCD3+XD8+HGXrmYaEk/GnTXtB8D+wIhBs29c61wix
	36rPIYs/8niCAzZj5W16Z1Jttxi05mhEC97Yx1e9ayxE2PoVayylnROozVm9vMIhbhs
	HVl+Pgu1xiu7xetzajseADSdD2qfvAxMx62l2gQ0=
Received: by mx.zohomail.com with SMTPS id 1770860261379801.9602771459028;
	Wed, 11 Feb 2026 17:37:41 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	beata.michalska@arm.com,
	lyude@redhat.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 06/12] drm/tyr: add shmem backing for GEM objects
Date: Wed, 11 Feb 2026 17:37:07 -0800
Message-ID: <20260212013713.304343-7-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212013713.304343-1-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for GEM buffer objects backed by shared memory.

This introduces the BoCreateArgs structure for passing creation parameters
including flags, and adds a flags field to BoData. A new_dummy_object()
helper is provided to create a dummy GEM object for use as a GPUVM root.

The Bo type alias is added to simplify working with Tyr's shmem-backed
GEM objects throughout the driver.

Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/gem.rs | 52 ++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index c1208d332dea..6a58f2da88d3 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -1,28 +1,64 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
+//! GEM buffer object management for the Tyr driver.
+//!
+//! This module provides buffer object (BO) management functionality using
+//! DRM's GEM subsystem with shmem backing.
 
 use kernel::{
     drm::{
         gem,
+        gem::shmem,
         DeviceContext, //
     },
-    prelude::*, //
+    prelude::*,
+    sync::aref::ARef, //
 };
 
-use crate::driver::TyrDrmDriver;
+use crate::driver::{
+    TyrDrmDevice,
+    TyrDrmDriver, //
+};
 
-/// GEM Object inner driver data
+/// Tyr's DriverObject type for GEM objects.
 #[pin_data]
-pub(crate) struct BoData {}
+pub(crate) struct BoData {
+    flags: u32,
+}
+
+/// Provides a way to pass arguments when creating BoData
+/// as required by the gem::DriverObject trait.
+pub(crate) struct BoCreateArgs {
+    flags: u32,
+}
 
 impl gem::DriverObject for BoData {
     type Driver = TyrDrmDriver;
-    type Args = ();
+    type Args = BoCreateArgs;
 
     fn new<Ctx: DeviceContext>(
-        _dev: &kernel::drm::Device<TyrDrmDriver, Ctx>,
+        _dev: &TyrDrmDevice<Ctx>,
         _size: usize,
-        _args: (),
+        args: BoCreateArgs,
     ) -> impl PinInit<Self, Error> {
-        try_pin_init!(BoData {})
+        try_pin_init!(Self { flags: args.flags })
     }
 }
+
+/// Type alias for Tyr GEM buffer objects.
+pub(crate) type Bo = gem::shmem::Object<BoData>;
+
+/// Creates a dummy GEM object to serve as the root of a GPUVM.
+#[expect(dead_code)]
+pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) -> Result<ARef<Bo>> {
+    let bo = gem::shmem::Object::<BoData>::new(
+        ddev,
+        4096,
+        shmem::ObjectConfig {
+            map_wc: true,
+            parent_resv_obj: None,
+        },
+        BoCreateArgs { flags: 0 },
+    )?;
+
+    Ok(bo)
+}
-- 
2.52.0

