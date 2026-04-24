Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4128BA34;
	Fri, 24 Apr 2026 23:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777073998; cv=pass; b=MSpH3KblpNPJoLoEHhuZrStoF6sJ1AtHDPFeSbU4RRbQkAYzA3I3LonRopa9wIZfLBWRbUzU0eZXc0oEz1uVRmHIf6+trt+JqqT5cDbnAKAl/EmV3ZspYdgddVw4dPIzgVkGW9AUIdDdrgSgcIbyD/b1NIH58wDDZUL6J8UYEWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777073998; c=relaxed/simple;
	bh=AaPtiNttGuB/t7PYj8M+d94kLl/74wFvY9trrLQs8C0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4mOjwPKWHEgC18o3Mb5ZwjGdiH3p8CuuuvKUoQyXWO+Udt1FUXpBMax7YJPZev9aMSjHql5i8ixs7UeVnU36bzfbpCRDWeGGuOi3j/BqMb4St1d7SBYUrpGoGqwlBCMUVPYycnHYWE3N/craIZuuvKAQXtKXlWASTP8AbDUeT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=D4RskA3E; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="D4RskA3E"
ARC-Seal: i=1; a=rsa-sha256; t=1777073965; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=frqXrq0/CGNuovCxcb0Ip122YhIFQQdpywRbH1dHGTsICE/aePZALln7y489WHh5l7SXJIiTcH2tyWoPY13ZBIr5Goa1S6jgI1QoPdOFwl4ZstxwQ10ybpUgfjiEyV5HNfdd+RzLMNiUn3qcBBDy4AYJ5rb7Ny2o2HHZ0NVkdCA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777073965; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9x0SAL3Soz6DOFtVmAmkbii1FCN1sclBARu8rFXjdPI=; 
	b=MeOxMaKHv8PQrerigrhPyIQjjLXdUlm2wn3pUAGliBBAVxW4/8wotEQyLB/teg/vGVjczNTfJVMmEtakOAVvl/YcCasmgB6/ipH7VSVFbbbniN/ULmhGqQawGqGiwhreBbKlWTRWXNjDMrLm74fpid43Z1y6k89lSRmhCQOIdIg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777073965;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9x0SAL3Soz6DOFtVmAmkbii1FCN1sclBARu8rFXjdPI=;
	b=D4RskA3EMruD09t9LZCcGNQm2Iq0je+IF0W8rTKQdenLBBt6YUfypSvIQ+fqLTdx
	crinznlZ2IRezSNiOiWlFDtP0ThNNmJYiSIEp0HrmlJNrf6nXvpij8Y3RJv9ZMHJT78
	DnUIQZj4bL5Fa7pzFIUGzuubLMLyRzvb7MKiEln4=
Received: by mx.zohomail.com with SMTPS id 1777073963573485.31801887966503;
	Fri, 24 Apr 2026 16:39:23 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Fri, 24 Apr 2026 16:39:01 -0700
Subject: [PATCH v4 07/20] drm/tyr: add shmem backing for GEM objects
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-b4-fw-boot-v4-v4-7-a5d91050789d@collabora.com>
References: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
In-Reply-To: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com, 
 beata.michalska@arm.com, lyude@redhat.com, acourbot@nvidia.com, 
 work@onurozkan.dev, alvin.sun@linux.dev, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=AaPtiNttGuB/t7PYj8M+d94kLl/74wFvY9trrLQs8C0=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJmv/ysI/s+pTlI+VvY89VJR9PwW4aJDZzj52theMXR7r
 v2cbcTfUcrCIMbFICumyHLW3qhHvOq9ke78/80wc1iZQIYwcHEKwESuiDMyzC9ZHe70slGX/9/G
 lMUvnvk4XH52uDsnVqj56J+fXhOOczL8L1Zg3c1Tmnhyj8C0NsYKTavXPzmkbXMZjBk66tL0on0
 5AA==
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

