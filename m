Received: from forward201a.mail.yandex.net (forward201a.mail.yandex.net [178.154.239.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75B63EBF1D;
	Tue, 10 Feb 2026 18:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749143; cv=none; b=iOTgwizIVgX9iXShLOgixDKx8bkczUUbZm/DAnkFC3obYlwMffDaRK2bvS6hZVZywkaG+QMxXdL7jkm5zWR7gpCqu5Rrpv+CQYJURSiMIdKzkUWTUYDZR0EjYk//2mfKksc7F4gAV68EHZsfw0W2QaKCCzA9r1IUsnstWh0Z8cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749143; c=relaxed/simple;
	bh=LMoMVQAqPbX8i4k+pDwwvXLsKGiNiQ9WWcrA/kE5GK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hpwDFR/saasQeYMWWAfjmiwqSj+z81b7pIzXMAHiVcs7SQFcLtKo2WG4VY1D0qIUE/I9EtZLipNV2to4kpafBqjzXi7u45jWLcGoLxYxsNaGA3Q223HWsLUXCFogI8rNW1JBQzP6NezTYLtXth2rPdOJz1sJ6osS8oF6WS6EvUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=hBROQdAq; arc=none smtp.client-ip=178.154.239.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="hBROQdAq"
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
	by forward201a.mail.yandex.net (Yandex) with ESMTPS id C856183BE2;
	Tue, 10 Feb 2026 21:39:16 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:582e:0:640:200:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id AA25D80C69;
	Tue, 10 Feb 2026 21:39:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id PcXcMe1H0Sw0-2SQWIV15;
	Tue, 10 Feb 2026 21:39:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1770748747;
	bh=Rc5AjI3Knt85NCpzELFh1EO7d2bbaLUNXALLlH/+aDo=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=hBROQdAq0uC7jvfp51qciv3n7QPevHsltrzL05gVHx2ewGXmLIUtR4U4eaOvRDFVq
	 sLsQt3Mdn3P46oKJivHUo0igEWkh7PoltFMWTkHAPPx8OahvIyZDnmTPiokKJQ5I7N
	 Lh2IuFCRYxtF2+43CVVbnO9jnOm8jro2ufLM8R1w=
Authentication-Results: mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v1] drm/tyr: gpu: fix GpuInfo::log model/version decoding
Date: Tue, 10 Feb 2026 21:38:12 +0300
Message-ID: <20260210183812.261142-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GpuInfo::log() was decoding GPU_ID like this:

  major = (self.gpu_id >> 16) & 0xff;
  minor = (self.gpu_id >> 8) & 0xff;
  status = self.gpu_id & 0xff;

That does not match the Mali GPU_ID layout and mixes unrelated
fields. Due to that, model detection becomes `mali-unknown` on
rk3588s which is wrong.

We can already get all the version information with a single
GpuId::from call (less code and cleaner), so this patch uses it.

Also renamed `GpuModels` fields from `major/minor` to
`arch_major/prod_major` to reflect their real meaning.

This change was tested on Orange Pi 5 (rk3588s) board and the
results are as follows:

Before this change:

$ dmesg | grep 'tyr'
[   19.698338] tyr fb000000.gpu: mali-unknown id 0xa867 major 0x67 minor 0x0 status 0x5
[   19.699050] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[   19.699817] tyr fb000000.gpu: shader_present=0x0000000000050005 l2_present=0x0000000000000001 tiler_present=0x0000000000000001
[   19.702493] tyr fb000000.gpu: Tyr initialized correctly.

After this change:

$ dmesg | grep 'tyr'
[   19.591692] tyr fb000000.gpu: mali-g610 id 0xa867 major 0x0 minor 0x0 status 0x5
[   19.592374] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[   19.593141] tyr fb000000.gpu: shader_present=0x0000000000050005 l2_present=0x0000000000000001 tiler_present=0x0000000000000001
[   19.595831] tyr fb000000.gpu: Tyr initialized correctly.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/gpu/drm/tyr/gpu.rs | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 6c582910dd5d..da97844efbec 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -99,13 +99,11 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
     }
 
     pub(crate) fn log(&self, pdev: &platform::Device) {
-        let major = (self.gpu_id >> 16) & 0xff;
-        let minor = (self.gpu_id >> 8) & 0xff;
-        let status = self.gpu_id & 0xff;
+        let gpu_id = GpuId::from(self.gpu_id);
 
         let model_name = if let Some(model) = GPU_MODELS
             .iter()
-            .find(|&f| f.major == major && f.minor == minor)
+            .find(|&f| f.arch_major == gpu_id.arch_major && f.prod_major == gpu_id.prod_major)
         {
             model.name
         } else {
@@ -117,9 +115,9 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
             "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
             model_name,
             self.gpu_id >> 16,
-            major,
-            minor,
-            status
+            gpu_id.ver_major,
+            gpu_id.ver_minor,
+            gpu_id.ver_status
         );
 
         dev_info!(
@@ -167,14 +165,14 @@ unsafe impl AsBytes for GpuInfo {}
 
 struct GpuModels {
     name: &'static str,
-    major: u32,
-    minor: u32,
+    arch_major: u32,
+    prod_major: u32,
 }
 
 const GPU_MODELS: [GpuModels; 1] = [GpuModels {
     name: "g610",
-    major: 10,
-    minor: 7,
+    arch_major: 10,
+    prod_major: 7,
 }];
 
 #[allow(dead_code)]
-- 
2.51.2

