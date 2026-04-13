Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA58539B942;
	Mon, 13 Apr 2026 22:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776119554; cv=pass; b=pMGntjFRPVZA8iCPUqkIXadCyHqj9whxRKESqiweTm5QqPTS21szwzwSQliUa8aX4IeUO+onGkC9P/0o+xfyuMHTDMaOYVoTD8trkk2Mz2oDvaWReWdEMLayV8Hv138fk9JOaDLKNh/nrk9+HGblhmDyNUTTQeC9W1iakVTeSJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776119554; c=relaxed/simple;
	bh=AaPtiNttGuB/t7PYj8M+d94kLl/74wFvY9trrLQs8C0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L30LEabQYdhJe4cBHbpSZIOAzRQL4WKXNY6pxkkQq2E20EuzJPHzp7Vw+0RKBLlSrxCuTyekr6AAA+vJjV6fk+4QDZl4U7a1Ed6DZJ76QeXu1rzsEigOLGxVEn0hGE2FDSNUWYKOezgyogwIpKl2daYJASLBuverRtGZ4wCdmfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=QH31m1kc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="QH31m1kc"
ARC-Seal: i=1; a=rsa-sha256; t=1776119521; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UY95dKSUKyBveMffV9DzxQWkpwiUhrf7HdbX1UH4XL1xYDK8drXIPJgCwG+VqHf7e1/fHEnfXHaxJy8gP/Z+jUie0bCDKMfutsQUPntb9tUkzoOrQig2EEDSUrkoWLDA1okVZXc/LXCagosvj/13DcVuC+e2y7shO9TZ7fz2ZLA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776119521; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9x0SAL3Soz6DOFtVmAmkbii1FCN1sclBARu8rFXjdPI=; 
	b=VqL8PnO9q+kSkS8qmgJT2CgdbgSLBElVK+zjJbTV4ATS1zrlyvoVLnFaHeJfOwCXUITyoiHqOpAbLYJhPypHGJOX4RycPyBL1Bcr1I+5qZp3yNuffe3nsTsQdC+iWD6XFp45XuenQB6bem+t4NjOmWZcOt7Tid81t0XfBC06IF8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776119521;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9x0SAL3Soz6DOFtVmAmkbii1FCN1sclBARu8rFXjdPI=;
	b=QH31m1kcnSt3n0rqQEABRoI3Em/giVHhoe+SG0nwbhq1NBpYt4sQz6sP/5uLI84q
	SNEuoaQUd1cWPLd1JL7hE4fc48mMvMSjrKhkLL+XKWWpoin0OpYmH0KaeYQ3HthXlMI
	wejPsE5R+sTV7vSL0rPVnZa9dKYY/Yy03T8CMpGA=
Received: by mx.zohomail.com with SMTPS id 1776119519931477.25225554263204;
	Mon, 13 Apr 2026 15:31:59 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Mon, 13 Apr 2026 15:31:42 -0700
Subject: [PATCH v3 07/13] drm/tyr: add shmem backing for GEM objects
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-b4-fw-boot-v3-v3-7-b422f3c03885@collabora.com>
References: <20260413-b4-fw-boot-v3-v3-0-b422f3c03885@collabora.com>
In-Reply-To: <20260413-b4-fw-boot-v3-v3-0-b422f3c03885@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com, 
 beata.michalska@arm.com, lyude@redhat.com, acourbot@nvidia.com, 
 work@onurozkan.dev, alvin.sun@linux.dev, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=AaPtiNttGuB/t7PYj8M+d94kLl/74wFvY9trrLQs8C0=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJl3866W7JsuFNPJcvBu4fmvh1blH/P+lsRvNKdh+8Lla
 z3aQpdv7yhlYRDjYpAVU2Q5a2/UI1713kh3/v9mmDmsTCBDGLg4BWAizY6MDNsWLawzv33w6SY+
 xQLNJ3d4OQunbVA9mLKBRSPk65qc07cZ/qcEcD/tmvW0VH2ahNW/xvCoCJ2DR+dt0C2++2hK2Hp
 tFUYA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Add support for GEM buffer objects backed by shared memory.

This introduces the BoCreateArgs structure for passing creation parameters
including flags, and adds a flags field to BoData.

Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/gem.rs | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 11951b507b18..c6d4d6f9bae3 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -1,4 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
+//! GEM buffer object management for the Tyr driver.
+//!
+//! This module provides buffer object (BO) management functionality using
+//! DRM's GEM subsystem with shmem backing.
 
 use kernel::{
     drm::{
@@ -13,19 +17,27 @@
     TyrDrmDriver, //
 };
 
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
         _dev: &TyrDrmDevice<Ctx>,
         _size: usize,
-        _args: Self::Args,
+        args: BoCreateArgs,
     ) -> impl PinInit<Self, Error> {
-        try_pin_init!(BoData {})
+        try_pin_init!(Self { flags: args.flags })
     }
 }

-- 
2.53.0

