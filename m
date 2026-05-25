Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690AA35DA5D
	for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 23:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779750130; cv=none; b=h76dfRQaM4ZSPPmJVeLv1Szy+YMild8g5wavrFOr3xtDooik6lSD5YbKMJ8U+AApyWLAfsJv6P+JqukcPbqzc2VeS1Pvw8xmspIeiRsM2frfJDilmzFg0OEeqLhTrF3TlsSYoHHfCY0EHgXmW9z9KKFca+CgKEamKwRdpHeNhPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779750130; c=relaxed/simple;
	bh=w5qRHrSWBFSUfbfuz2NnlVe8bbFrXvhMa3kfxDBcneo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvnqH3a5vJ1JLULTc//JH9HIu2kK2+xEwj+8eH2OxuD3zKqDQeU1Qa50fdw87ONJev4rqHAuY8+mw/7jwwyXULzkY+XobIKgDqJJgTLvZRy1toS/nPgTOG+FadU6HDbeDNGxWr4vMdR6BhppIMS3aqNpQ6XPNX00bT2B6DK0/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0w8emvl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0w8emvl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC081F00A3A;
	Mon, 25 May 2026 23:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779750129;
	bh=DGOJOSQ7b8NBZpTxAI72jcjvSeKR03Lp8WhOZgHY0hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T0w8emvlIZ5ZAjcXpOuE1mjzhefGaPvsVPpMzr+m4sHk3ZzkddZrDkNglwVoPBRCQ
	 io0WwZvdYwOjrhQBygp5yGCqA7PwbEZSN8fcK+mEcrtFntR8eV+BH9+1HAH2Ov5k3W
	 y4towv+7GxuVQZ5CzzKDUmiNEqNyOg166wpomrS/dqU2tgsjsExWJrg+D0g/lv4Y+0
	 Sj/GzCOAa7sNk6l3vsnqCP8SOxKnbJI/P4c1pH/x6rl5YDUckuFrnzEyQ2/Qa/rnYp
	 7ipkSaCi86SPuVOwFOD9XZarIhrkt0MfmlPi7pb3SS+8rceEdClwsJlH0n9T4XwBEH
	 agtTSkAm7Kz/A==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	boris.brezillon@collabora.com,
	deborah.brouwer@collabora.com,
	gary@garyguo.net
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/2] gpu: drm: tyr: separate driver type from driver data
Date: Tue, 26 May 2026 01:01:43 +0200
Message-ID: <20260525230152.277820-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525230152.277820-1-dakr@kernel.org>
References: <20260525230152.277820-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce TyrPlatformDriver as a unit struct for the platform::Driver
trait implementation and keep TyrPlatformDriverData for the private
driver data.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/tyr/driver.rs | 10 ++++++----
 drivers/gpu/drm/tyr/tyr.rs    |  4 ++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 2224fdb20a51..5f4c484f671f 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -51,6 +51,8 @@
 /// Convenience type alias for the DRM device type for this driver.
 pub(crate) type TyrDrmDevice = drm::Device<TyrDrmDriver>;
 
+pub(crate) struct TyrPlatformDriver;
+
 #[pin_data(PinnedDrop)]
 pub(crate) struct TyrPlatformDriverData {
     _device: ARef<TyrDrmDevice>,
@@ -93,22 +95,22 @@ fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
 kernel::of_device_table!(
     OF_TABLE,
     MODULE_OF_TABLE,
-    <TyrPlatformDriverData as platform::Driver>::IdInfo,
+    <TyrPlatformDriver as platform::Driver>::IdInfo,
     [
         (of::DeviceId::new(c"rockchip,rk3588-mali"), ()),
         (of::DeviceId::new(c"arm,mali-valhall-csf"), ())
     ]
 );
 
-impl platform::Driver for TyrPlatformDriverData {
+impl platform::Driver for TyrPlatformDriver {
     type IdInfo = ();
-    type Data<'bound> = Self;
+    type Data<'bound> = TyrPlatformDriverData;
     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
 
     fn probe<'bound>(
         pdev: &'bound platform::Device<Core<'_>>,
         _info: Option<&'bound Self::IdInfo>,
-    ) -> impl PinInit<Self, Error> + 'bound {
+    ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
         let core_clk = Clk::get(pdev.as_ref(), Some(c"core"))?;
         let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c"stacks"))?;
         let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c"coregroup"))?;
diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
index 9432ddd6b5b8..95cda7b0962f 100644
--- a/drivers/gpu/drm/tyr/tyr.rs
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -5,7 +5,7 @@
 //! The name "Tyr" is inspired by Norse mythology, reflecting Arm's tradition of
 //! naming their GPUs after Nordic mythological figures and places.
 
-use crate::driver::TyrPlatformDriverData;
+use crate::driver::TyrPlatformDriver;
 
 mod driver;
 mod file;
@@ -14,7 +14,7 @@
 mod regs;
 
 kernel::module_platform_driver! {
-    type: TyrPlatformDriverData,
+    type: TyrPlatformDriver,
     name: "tyr",
     authors: ["The Tyr driver authors"],
     description: "Arm Mali Tyr DRM driver",
-- 
2.54.0

