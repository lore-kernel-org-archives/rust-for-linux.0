Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC141CD2C
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 00:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780012874; cv=none; b=OmaE06RZDeVRTx1V0mdouH/KGA/N4iNYHgZv3fZENkhs0FiS+NOB/6yvDMgNVSKtZKjqobrb0wksA5T3aSf0W+i+6CMXsx4Z8BBZfDSJljQ/rLM8L6nMT0P2LmIQAtwZ25Al9Ta+fS4bxNw+EmSyXSD1WFZqwa65uDIV/TE8id8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780012874; c=relaxed/simple;
	bh=AibSrcv5NaGzzGY+fzc8rQzEMq4MIHRS+6m8nYH/w9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFq6GA8iprpIRQG379oCPnn4K/T8IsqN0tSAOvgmpuwnCy9/wTeJMhvAzAR1zI4OyqmhTESvWz4yf5Yh/Ka2BTkGB5myKVpPpPqr+xAlw+66cPXNoNplRHp4UlDf3/fNO0ZZnLkEkVjDv2oMeF83N0aKHzNsW+i7MyvWrTt7/CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Es4T0sbT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Es4T0sbT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3E31F00A3A;
	Fri, 29 May 2026 00:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780012873;
	bh=ibxw5ByK6Volf1eEM1Bvibw6dVh9H6dU4M4YYCNG6cE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Es4T0sbTrua9mHqg01dr4h1xVh7wnYi0IhH+OGntkaJ8lYlFcReukPagOgqpIbLEx
	 5As4K4k20J0MYMuHsHqLbmlLf/QLv8JeDnStgM+T1hyyS3oCb2KsWkVOH17KDd05MO
	 /chjaXXHf5qI+McDV4oPPRu7pOz6FamIDPB0V4dAgrYU3LjE+z/Emo6xmJZquWuio2
	 Afy6v5G4m2YGITuClYabg+rm7oR9TvhWqD6PCJ/xj27RUj3GI20zIbc7Sqdf/L47sq
	 4Gk7ZUKnboHaDEej8PbJqjLqi6bdo3XJHz9djjM47MLeIrL4vHZf5q6w/LQT60KXHF
	 dbZSw5yk3gHWg==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	boris.brezillon@collabora.com,
	deborah.brouwer@collabora.com,
	gary@garyguo.net
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v2 1/2] drm/tyr: separate driver type from driver data
Date: Fri, 29 May 2026 02:00:53 +0200
Message-ID: <20260529000106.2257996-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529000106.2257996-1-dakr@kernel.org>
References: <20260529000106.2257996-1-dakr@kernel.org>
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

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/tyr/driver.rs | 10 ++++++----
 drivers/gpu/drm/tyr/tyr.rs    |  4 ++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 98732afc096f..6276e9743c32 100644
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

