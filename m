Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E517F33065B
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 23:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772493929; cv=pass; b=p0SjEh3+npcI5FSEU5SePLR/X0f50GGi5JAJbDJAZO9eVCzGUQ5MVmgZXvyr6BIZjLIP+xdOvcMg0LchZPU8Y1gd79Y+MKm6JFblHyhlS8rFIToLwTvn7N/e9TAxBs7FRXW2b1F5JWqgj3DbjEfGrc5GzCTETp3IoVXRSTgmi4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772493929; c=relaxed/simple;
	bh=T8I6xZyDElRl03GZgWY928l8r+pU4CgZp0nyUDIkmiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHxH+dlRfeqWJiLQowDKAt97RM8SI7VvIHRb70pug0d1XoeWIP0SDT1ZzEs5MZN+pM9Ppzgx+jCW3eLSMs7PF04pKhp8qQHt2UCnYmzRTxOsJmAVFIf9yelO/wztcqjT8GGOUpjy/6xBkmnduYmBb8f3VPuEuRp9WaUWfC0Qw/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=PR6pvU80; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="PR6pvU80"
ARC-Seal: i=1; a=rsa-sha256; t=1772493915; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Uyt9gHRRufePiv4uCZqWTMEwLbO5SfmP0arm87HUvBkKcNc/Rh5UHiwlqg/JPwhXMEfoTq1XeLR6P9lidqHqmRU1qdROAhqFd/xv7lxvzbRFC1ht/0jhTuZ7rSzuxaeKpX6427t6uZLrLFDz77Z3yUKWKYC/gDjSaDcSRDvruhg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772493915; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Wm4c+DKt9fCFOoFomQ1pATjbxeL9QiBAficVWlTvgsY=; 
	b=QTPbPr4iBNtPF+oRLRY9HJcYzkcc+a7x+PMJyom48sftdxp45zjFgrgXC/4ZI/AgraaPGRMJJ/uXDszM7naWNNZVmzb2ClC/gheLufxELhgn6xNoYRn9JbBbnHXS1R7rg0Rf1onMBKl+TurUXZALW+02GP7FqdM4PCwcSw4DmtA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493915;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Wm4c+DKt9fCFOoFomQ1pATjbxeL9QiBAficVWlTvgsY=;
	b=PR6pvU80iUQFPHW6xf7EQZ3mneaZxmaJeQ4wR5l859atPM9xKoDRXIW2/b4gMeQ7
	IwQizISCeGaz/pWNV6bypR6gTe58SGefcUleZCl6cQ4OySAJuJsAFUZ3lMHVcl9wvvG
	uzskDLgwWH9IW7OODY2B83IM9rEGmNTytEBPqcgs=
Received: by mx.zohomail.com with SMTPS id 1772493913718758.9095255982013;
	Mon, 2 Mar 2026 15:25:13 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	beata.michalska@arm.com,
	lyude@redhat.com,
	work@onurozkan.dev,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 06/12] drm/tyr: add shmem backing for GEM objects
Date: Mon,  2 Mar 2026 15:24:54 -0800
Message-ID: <20260302232500.244489-7-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260302232500.244489-1-deborah.brouwer@collabora.com>
References: <20260302232500.244489-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for GEM buffer objects backed by shared memory.

This introduces the BoCreateArgs structure for passing creation parameters
including flags, and adds a flags field to BoData.

Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Remove new_dummy_object() to add it later in vm patch.
- Remove unrelated change that used device alias.

 drivers/gpu/drm/tyr/gem.rs | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 87f3890e4be6..c6d4d6f9bae3 100644
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
-        _args: (),
+        args: BoCreateArgs,
     ) -> impl PinInit<Self, Error> {
-        try_pin_init!(BoData {})
+        try_pin_init!(Self { flags: args.flags })
     }
 }
-- 
2.52.0

