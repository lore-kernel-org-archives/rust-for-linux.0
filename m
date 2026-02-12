Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44671F4C8C
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 01:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860265; cv=pass; b=Ycb1YKt1zvPjjt2oWDG2zfD9fRUa8pv0uwAc0zsv6pEt+tSGV4v8rJy1OZVuUepxTIvrZ595RmylvDr5pTP+TsMvjZjSN4/hyl3IoV9pUa08/sQj4nh1aG7R7FKJh79LydewVL1IMJx8vKeHsUJ8PKLypfkqOgwSC+jHUkOMejI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860265; c=relaxed/simple;
	bh=vTeukiWmBGiTc4qrVyP2dTfx+Y4v8/oz2xRkN4/M6pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQAEO4AbKP8wvguYRxZk9yvi96EvQaXF/TjE9HigwET3Md1YgIF3asPORfxLqPlMEFauPDwPQ1Mw5mitK+rfnggftMn2bwRAQitUcjdSQqDTRkyLCrcn+7zQvkJ8x8Qgu+THpyeJoVXHPgenUa7DQxen8NGd7HTuYMMJQF9m3BU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=jPD6NzBb; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="jPD6NzBb"
ARC-Seal: i=1; a=rsa-sha256; t=1770860257; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ef90pc/KGC3B8e22BusjKTMFJGjKowbVXTWSGkzsEfESZTudqST7kQlr5yUSsmajAg3/vz3x/Qaap2xz14E2lfk6KNAdYJM2DPjwrlw4ZzK2FQ21AkSXYrjtlJIxhXw2r15lYI5kWmSBZBmMlsf3Y0hwxoC14pittSF0hsMOnps=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770860257; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WxI0alUh/iTXR4SSXMC0dJb74nKNJ3C6ERTvSFTYYCI=; 
	b=GZShAn+YeqOXUc2I+dfNz8gCuG1A4vigSqxsYpd8kcWL5P/27zbTJEI0Jh/qkZWi6DyxxfuEjix5LTHc+dstYXJZa7Wx2gOPhTyesaA5wXSzeeKgKg3+5JMFL7jbDK+jQ9QlPpf+nm/0BVW1T8yjJSX5gJ0F9AzxDE7+49fTGUw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860257;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WxI0alUh/iTXR4SSXMC0dJb74nKNJ3C6ERTvSFTYYCI=;
	b=jPD6NzBbzNoa9cDgPhJ/DntAFEgP+xRX1HpTbRxOI3wlvbq4ij4DvVedl3oYNVyJ
	N/NRhg+XXPr+32BBTIaIAFd7DC6Fcqr9zfgQhl15uy6H2DuDWtDwwfWL5dHVlAztJ0T
	OqCoxnO/H+FmAPR6jRCCXD5o4vId2RFM03jaMF60=
Received: by mx.zohomail.com with SMTPS id 1770860255056638.0660570457901;
	Wed, 11 Feb 2026 17:37:35 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	beata.michalska@arm.com,
	lyude@redhat.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 02/12] drm/tyr: move clock cleanup into Clocks Drop impl
Date: Wed, 11 Feb 2026 17:37:03 -0800
Message-ID: <20260212013713.304343-3-deborah.brouwer@collabora.com>
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

Currently Tyr disables its clocks from TyrDrmDeviceData::drop(), which
causes them to be shut down before any other fields in TyrDrmDeviceData
are dropped. This prevents us from using the clocks when dropping the
other fields in TyrDrmDeviceData.

In order to better control when the clocks are dropped, move this cleanup
logic into a Drop implementation on the Clocks struct itself.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index ae4daa12b3e5..9bc6ed56c45e 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -54,7 +54,7 @@ pub(crate) struct TyrPlatformDeviceData {
     _device: ARef<TyrDrmDevice>,
 }
 
-#[pin_data(PinnedDrop)]
+#[pin_data]
 pub(crate) struct TyrDrmDeviceData {
     pub(crate) pdev: ARef<platform::Device>,
 
@@ -168,17 +168,6 @@ impl PinnedDrop for TyrPlatformDeviceData {
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

