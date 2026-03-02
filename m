Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C953909A3
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 23:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772493925; cv=pass; b=Eg8RNQjl0cIlWy7SXunREh+xGYGZNI8xjren/utPiLH5nvbEazrhPRfPaJbVC36kZwfm0XqydB4YsjxmYKymdzBvnGBtxQP/pKTjKKvA/UJHgEPFsJ69RlZP3fh4NLs3Ljlib87RNaWI2lYtYrTWondAMyeWdpDauNYJJ1Z8ZdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772493925; c=relaxed/simple;
	bh=AvMMmI20i26o6LIH7tGiMCe7EGT7m0NU/oLm7YcMmAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DD6L22MqPIyq74LffKUYqD7PCv44nzjivRvfoAK/66Twr+F3wH6d9V0YoTelH4UIco7qVSxM6KJH0QWcjP5AeO2wFiMRfzFpcEBQ9ncSvBfrT68p11WMNW9zPTUBfatR/r58Qb3KdbqZZ0eQiQ4zftM95BX18UUsZFZKjKJVPsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=HxFvgbOR; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="HxFvgbOR"
ARC-Seal: i=1; a=rsa-sha256; t=1772493913; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XHuP/ecpMVBWNRcFchhNtqW/nBJXdY6JFa+lEgVWekQUCQJQWT7XIHghA4yOb4DtIjszCJFunkmRIhlctmptcrhHT5ysj9I4uYTtaH0nxuPngAbpnzYsvdvsHyFWy3Tdf4pCd3+kgwEWPhL5f9ZLifBGmml/VQCMhjkmNFBoQ9g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772493913; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JeVKrmBGAZbOfL0zQIy44YasmHlurQx5d/IhOY6/xAA=; 
	b=NKzLIa1PuLgAqJ+V3onBbuQ5w9FeW8ZSc31EsTvWwdT1JJAtWbe+loN84RSeb4zdLV4ipriYdi1p2BxWSjpRSYqaXFhXzDD2pTKjwt9yE9vjwebSPnWUL0m0YGRL0k5w808f2NxyOWkucaLH7pwWT7Wil8w1aK1MPATM1nEJyL0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493913;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JeVKrmBGAZbOfL0zQIy44YasmHlurQx5d/IhOY6/xAA=;
	b=HxFvgbOR4fEuqQmZyFoUAEG/DFus7cJTuuJYjsfCHLAG+ZP2EdukCYdjE1mzTVtq
	u7EhZa4r5c8lg0GK//4wr4JLUQGNaKZ1yep02C6lNeQNLMlJyP95nc31t72s1M9YDKg
	nmi0o/5u/J+dpY5vMlKpF94xuZbxTyi4Inu7RuuE=
Received: by mx.zohomail.com with SMTPS id 1772493911012417.9461385509999;
	Mon, 2 Mar 2026 15:25:11 -0800 (PST)
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
Subject: [PATCH v2 02/12] drm/tyr: move clock cleanup into Clocks Drop impl
Date: Mon,  2 Mar 2026 15:24:50 -0800
Message-ID: <20260302232500.244489-3-deborah.brouwer@collabora.com>
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

Currently Tyr disables its clocks from TyrDrmDeviceData::drop(), which
causes them to be shut down before any other fields in TyrDrmDeviceData
are dropped. This prevents us from using the clocks when dropping the
other fields in TyrDrmDeviceData.

In order to better control when the clocks are dropped, move this cleanup
logic into a Drop implementation on the Clocks struct itself.

Since it serves no further purpose, remove the PinnedDrop implementation
for TyrDrmDeviceData.

Also, while here, remove the #[pin_data] annotation from both the struct
Clocks and struct Regulators since neither of these structs need this
macro to create structurally pinned fields.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Mention pinning changes in commit message.
- Pick up Reviewed-by tags.

 drivers/gpu/drm/tyr/driver.rs | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 38e5268e881a..4fff01478391 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -54,7 +54,7 @@ pub(crate) struct TyrPlatformDriverData {
     _device: ARef<TyrDrmDevice>,
 }
 
-#[pin_data(PinnedDrop)]
+#[pin_data]
 pub(crate) struct TyrDrmDeviceData {
     pub(crate) pdev: ARef<platform::Device>,
 
@@ -168,17 +168,6 @@ impl PinnedDrop for TyrPlatformDriverData {
     fn drop(self: Pin<&mut Self>) {}
 }
 
-#[pinned_drop]
-impl PinnedDrop for TyrDrmDeviceData {
-    fn drop(self: Pin<&mut Self>) {
-        // TODO: the type-state pattern for Clks will fix this.
-        let clks = self.clks.lock();
-        clks.core.disable_unprepare();
-        clks.stacks.disable_unprepare();
-        clks.coregroup.disable_unprepare();
-    }
-}
-
 // We need to retain the name "panthor" to achieve drop-in compatibility with
 // the C driver in the userspace stack.
 const INFO: drm::DriverInfo = drm::DriverInfo {
@@ -202,14 +191,20 @@ impl drm::Driver for TyrDrmDriver {
     }
 }
 
-#[pin_data]
 struct Clocks {
     core: Clk,
     stacks: OptionalClk,
     coregroup: OptionalClk,
 }
 
-#[pin_data]
+impl Drop for Clocks {
+    fn drop(&mut self) {
+        self.core.disable_unprepare();
+        self.stacks.disable_unprepare();
+        self.coregroup.disable_unprepare();
+    }
+}
+
 struct Regulators {
     _mali: Regulator<regulator::Enabled>,
     _sram: Regulator<regulator::Enabled>,
-- 
2.52.0

