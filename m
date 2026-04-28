Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A849F47D94B;
	Tue, 28 Apr 2026 19:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777404013; cv=pass; b=tmfFvQYbXZckr8Qd7cmMqUdQtsx4LI3DQefmevvm+h+j78jggaY6OV4F4GCM3rLynTd6geaGBRksbjUNwYVJ8bSafy1DEIyrbGaYabMSHJ0202J60tlfXhYZgui4ljFMp4rt5PtuvjYpeim9I1/VZOB9FVPsXA4D9T41i8HZxts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777404013; c=relaxed/simple;
	bh=W29CcEg4G/bR/nBkZsGLw9Q//UYR0bu9cBHhR83fmzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TepdZO7BIzLIxkawNgWI6KbGaWHKjvJOPIHFGFwFlmlkJymb9jRJCITLQG8NpHHZUUgl1zPhIn0CQH036Jze2pgmM7uITgmIapBsmfIoQ4zXfEw40RMynreRxVb7fnIoZCs2XPkx72oq1Gfi/bCq9I0q+ThPKIPtCLQaOB3Upig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=Hjkf5Tvh; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Hjkf5Tvh"
ARC-Seal: i=1; a=rsa-sha256; t=1777403983; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IbIPdgBkg3eE0bdD/OL77s9hC6ViO2kSQMbPLChOsmql44qnS13K7TU0udpzzeuzkQQSjScgc3FnBVvmPVz5WtVQDAOtFvizZCrsprlcmYHUzOdXKOlQjxYGiJ5CsJxMk5vDFeu3eI1bod2HZ/samTjm0FUEd/Q4iIEW/BKBN0U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777403983; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wLGSvc2M7EuyDUwLLZMuCL0UwqmYT4uqmf47d+D6rF8=; 
	b=drOG1TuZ+G4mbMvSQq1ldHA5tpjx9/ZYDrQOMImoqC47KBQ3mkZQvkzCkPcBnk+BFro1XxkSvMNfjCWMnqvNXjtXyJ6DZb0lAC93ArkY5WJfeWeNQ3f0vPs2j/9hByhMgrxT0FyC+949de8FybE+dOZGSzqum4dVH1fYeNW16Gg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777403983;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=wLGSvc2M7EuyDUwLLZMuCL0UwqmYT4uqmf47d+D6rF8=;
	b=Hjkf5Tvht5izMS2gVQfxNb1zIKFE9ziv4xsqzu0XCFj/dwjWLls85MqK+ZeQNc7G
	Clez9mGeTdCbHQy7TDwhbsqQtyJLCNaeBJ5BqjctzofYISYkPHBae9l89ocP0gCdbgA
	eevQKVkaa3SKfwnWag05oliNJMnSy8MwubOg5Ggo=
Received: by mx.zohomail.com with SMTPS id 1777403981907227.00808545959512;
	Tue, 28 Apr 2026 12:19:41 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Tue, 28 Apr 2026 12:19:32 -0700
Subject: [PATCH 5/5] drm/tyr: add shmem backing for GEM objects
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-fw-boot-prerequisites-v1-5-c69af9abe1af@collabora.com>
References: <20260428-fw-boot-prerequisites-v1-0-c69af9abe1af@collabora.com>
In-Reply-To: <20260428-fw-boot-prerequisites-v1-0-c69af9abe1af@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com, 
 beata.michalska@arm.com, work@onurozkan.dev, alvin.sun@linux.dev, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=W29CcEg4G/bR/nBkZsGLw9Q//UYR0bu9cBHhR83fmzU=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJkfOdyXPVv4VrSWY6K71LkZhS+KNzRNOdSRG2Ydlv3+L
 9OHG7LZHaUsDGJcDLJiiixn7Y16xKveG+nO/98MM4eVCWQIAxenAEzkgQ7D/yyWi1crpTdW7nxh
 duby5euGFwMDFk2zazvwcK+decUs2TWMDM9CO5xnKk235PEwUNHWU4iYKXqJPf51S8TmhDjt7ZG
 z+QE=
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
index 66c427a16c31..1640a161754b 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -1,4 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
+//! GEM buffer object management for the Tyr driver.
+//!
+//! This module provides buffer object (BO) management functionality using
+//! DRM's GEM subsystem with shmem backing.
 
 use kernel::{
     drm::gem,
@@ -10,15 +14,23 @@
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
 
-    fn new(_dev: &TyrDrmDevice, _size: usize, _args: ()) -> impl PinInit<Self, Error> {
-        try_pin_init!(BoData {})
+    fn new(_dev: &TyrDrmDevice, _size: usize, args: BoCreateArgs) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self { flags: args.flags })
     }
 }

-- 
2.53.0

