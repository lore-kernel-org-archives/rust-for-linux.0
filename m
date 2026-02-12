Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6690D1E98EF
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 01:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860264; cv=pass; b=kPFjtihnG+o6tLIzVKFmOuTDwA1IzIubhqOf4YHjld/xcQIe306VyeR2aXn+8L1LmeYdqea/jWZgTTbp9Pcq8keCQyVypNWkn6ci0khJjAujgxGlu87QSaU6GE+l0iwRu/QZyi/BVZgUsamm08Rn3wz1qIyKDikJk0PrhyMN91w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860264; c=relaxed/simple;
	bh=XrttDPh/+WaudsMHUGqEUa7XEq2rN2LVSf8xrZruiik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNRi6YlYlDrD/BNzqm2w1D0nkAJYZ/0uejhR/psS1qH3N4yOQyyBZs2Cx65YIX3tDpZoEMGSGRdgnVlTnSsTmsacN/YRNI2eIY4LuycY7A4MucJ+lCcR9tLAusVcMuUoV5FpPsDnHaCSx36f1dRNEpxMBJ1NHVSLOnJbOICTug4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=fluhAbjt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="fluhAbjt"
ARC-Seal: i=1; a=rsa-sha256; t=1770860257; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nNKwZO+UuomSywQ4STVPvodymuZWJh2MLcZMR+2sNtsQFaBL2M3Xkw/5UwF0plw5Hl4p7J9BY6IrgLS5hFh/ePozEntF2eRhQUX/i5PF66pFuZfntMPgS5NjF5fGUUw37tT6G2nec/ciQtp2SyPFARl5Km5wqcyOMsEKiESNTuA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770860257; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tABKwkCZarODDg6UBYScq6ItYwlBRtetGE5gJO5m+6Y=; 
	b=QfwHAdpDB5DmNlPHk0kg3OfHXfvdVS4DLnY7LjJ3S73gWRlFI5v4b1fiWRpEq+fMoFSJZKGvhixsgUnjNnLccIOhtQmc3MvZ0M6D/sUbljodKXZpt4lGpgyS0fG9ddTA1RjcbxHA6G5IUraQGyTjC+FLLDID1nI02di9MlAlKR4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860257;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tABKwkCZarODDg6UBYScq6ItYwlBRtetGE5gJO5m+6Y=;
	b=fluhAbjteISS3qL23mkDyAFDRiNvnhCT7yKa7U7U1evKNP1j7D8IxqQaJd9+QVqg
	QBhAHGXBhHLEG0vSlQHfpqlR5KTYt4JmBio9/Vlnrn7ZODvfZWJb2Ktt1ZZd/dTNoav
	9U9oCL2CscbgM346WqjbjIUQcvCtD9iYvF5izsuo=
Received: by mx.zohomail.com with SMTPS id 1770860256717140.73848187285262;
	Wed, 11 Feb 2026 17:37:36 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	beata.michalska@arm.com,
	lyude@redhat.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 03/12] drm/tyr: rename TyrObject to BoData
Date: Wed, 11 Feb 2026 17:37:04 -0800
Message-ID: <20260212013713.304343-4-deborah.brouwer@collabora.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

Currently the GEM inner driver data object is called `TyrObject` which
is a fairly generic name. To make the code easier to understand,
rename `TyrObject` to `BoData` so that the name better reflects its
role.

No functional change is intended.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 4 ++--
 drivers/gpu/drm/tyr/gem.rs    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 9bc6ed56c45e..e5eae5a73371 100644
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
index c59214e3d0ef..c1208d332dea 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -12,9 +12,9 @@
 
 /// GEM Object inner driver data
 #[pin_data]
-pub(crate) struct TyrObject {}
+pub(crate) struct BoData {}
 
-impl gem::DriverObject for TyrObject {
+impl gem::DriverObject for BoData {
     type Driver = TyrDrmDriver;
     type Args = ();
 
@@ -23,6 +23,6 @@ fn new<Ctx: DeviceContext>(
         _size: usize,
         _args: (),
     ) -> impl PinInit<Self, Error> {
-        try_pin_init!(TyrObject {})
+        try_pin_init!(BoData {})
     }
 }
-- 
2.52.0

