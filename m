Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE3E331203
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 23:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772493926; cv=pass; b=Sh0GG2IJOJNVobWDKLL9F/7jHl9xtX5wTmQA28o+cNptbRVE/KVI0YUGMC18+QT054PiPw7GyJ0pNcmKjOeZX2zcPK64pOF+BPWnLEYXMk9uj8v/e6caBgdJDf3HqLRjSi01SDsggP3ZaWhU+TBWas3Nrenh8gq7+3DrsRr+lN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772493926; c=relaxed/simple;
	bh=7OwtpWNxpgYZiJZDMvWJPpcP3+oVp/5pM8gEyKUDxcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AI9Q6NK8k1lntsv2GVsLobRbHpUEYFnYhD9pOCuxQGmssM5yKfbW/2Dz7LBMpt5aT1JRCFrwjCHU97mPKVavggSqS6Jhz0NciwPSvKZPLpdRoPev9THIFuZYsUOj+teTgOvvInTYx51DsgpnHIvZsaw7s006pYeV7HutUm3iaHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=IxGNiuBa; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="IxGNiuBa"
ARC-Seal: i=1; a=rsa-sha256; t=1772493913; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BogQtQr0xGVABOZ2DNkdB4YYDGCZZJwbjj17S5pd1YBBJAm3hK/qS2AmQSuO5z6BIl3FxNdSn8J2y20ojGUb3+AHcbLiqt+AeNRNFDR/YaWj8ad1fsa4RahQ/F5uyZKdV8xccqho5I3dXcMB8iC2oGiY0D/YSVdtLXGMQ430Q6A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772493913; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fEQDlRMrasKgPU5QpP7ZXP1eBZYjVkPBkfRG1OFa5Cg=; 
	b=UWbkkwr+n+p/u9UI9kMme53bJ1dwlWQ9dVjYDGXkKMye4vDVsQeVJpZsBnrrNjbvqn4nePuGwsHu3ynw2cgsBefR3rbWRTnRLHndlI4P+CnIvHjWIZFmQfHCKmBilKjyU3+PHuuoXqlhIk88BWhauzZ4u22ftwF1XecVo1+fbw8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493913;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fEQDlRMrasKgPU5QpP7ZXP1eBZYjVkPBkfRG1OFa5Cg=;
	b=IxGNiuBaqwxJUhmzYJfp6uVI0G8oc41XsjVvv9Fbh1tDFhQ8f+BGDKHuRi6kFEvS
	pHrG7lVD0XYV0c+6UjieT5nxKf9icRlhWp6p+oVPG8hpS9GZvx9J/TsCSh7MKxVSBQM
	bOuu2IvuX1msM9kndBADr3NQFPh+Pvswc+KgcYdw=
Received: by mx.zohomail.com with SMTPS id 1772493911612728.389852300208;
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
Subject: [PATCH v2 03/12] drm/tyr: rename TyrObject to BoData
Date: Mon,  2 Mar 2026 15:24:51 -0800
Message-ID: <20260302232500.244489-4-deborah.brouwer@collabora.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

Currently the GEM inner driver data object is called `TyrObject` which
is a fairly generic name. To make the code easier to understand,
rename `TyrObject` to `BoData` so that the name better reflects its
role.

No functional change is intended.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Pick up Reviewed-by tags.

 drivers/gpu/drm/tyr/driver.rs | 4 ++--
 drivers/gpu/drm/tyr/gem.rs    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 4fff01478391..eccf36d601ac 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -36,7 +36,7 @@
 
 use crate::{
     file::TyrDrmFileData,
-    gem::TyrObject,
+    gem::BoData,
     gpu,
     gpu::GpuInfo,
     regs, //
@@ -182,7 +182,7 @@ fn drop(self: Pin<&mut Self>) {}
 impl drm::Driver for TyrDrmDriver {
     type Data = TyrDrmDeviceData;
     type File = TyrDrmFileData;
-    type Object<R: drm::DeviceContext> = drm::gem::Object<TyrObject, R>;
+    type Object<R: drm::DeviceContext> = drm::gem::Object<BoData, R>;
 
     const INFO: drm::DriverInfo = INFO;
 
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 0c488984d2ec..87f3890e4be6 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -15,9 +15,9 @@
 
 /// GEM Object inner driver data
 #[pin_data]
-pub(crate) struct TyrObject {}
+pub(crate) struct BoData {}
 
-impl gem::DriverObject for TyrObject {
+impl gem::DriverObject for BoData {
     type Driver = TyrDrmDriver;
     type Args = ();
 
@@ -26,6 +26,6 @@ fn new<Ctx: DeviceContext>(
         _size: usize,
         _args: (),
     ) -> impl PinInit<Self, Error> {
-        try_pin_init!(TyrObject {})
+        try_pin_init!(BoData {})
     }
 }
-- 
2.52.0

