Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [178.154.239.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6909D2D5944;
	Thu, 12 Feb 2026 10:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890776; cv=none; b=Psl4cvej8F1BxaobYi7IBGJSi6paFfJ1qnf2iZbGRCQGczjyFflj9wqmH5MD22+tTefn9sgFr3av3yg1L3EBakGqdKuAanRrCNlAp3IPpUevM1A3jAK+NpQEwvvP3yZRIQIPBhhaMRPSls9X541gfopZGJGN0T0LBQ8/POFiJi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890776; c=relaxed/simple;
	bh=K2FvBmak7h1lFE66ueg2a4+QUsvgqkg3P89hh1YADfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qyYF8GnQZ2QfOX73w3lcNe+uO8DP+qMbA97KN2eh4oCN5TjM8c0orgRxXpGn3lJuXf+We1V7/uAQIds1TR832f2w5vAgDRhKYhWav3cSG1Vil+sjNw4GzdGK2X2ZzPu/pWJ5nOOnVVjEFm+BoSSw7jVOtYohoYCENZnFjMEIxZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=fq8lRvhH; arc=none smtp.client-ip=178.154.239.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="fq8lRvhH"
Received: from mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:eaca:0:640:4fc0:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id 46C97C0066;
	Thu, 12 Feb 2026 13:06:07 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id d5RU869G5W20-HuVH63BL;
	Thu, 12 Feb 2026 13:06:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1770890766;
	bh=qxkeRDbJgUJjhLFpKBJWlnb3gZXNfZQn/ZWX3SwQCBY=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=fq8lRvhHuCXcjV+lpfbScCKhcGFCEDjW+/gN6IHq9my2LYRKuk4k3tuTCwK/dKSvD
	 XyHN4035vMWDtjEqOxhvYbhP6tzsfNlljforBQZwHPkkq5hj8ZUhpZdQ5tsx1yCDli
	 N94/cdmG1nFG/0cukBX+QXaCualNzakggQ8xhs6c=
Authentication-Results: mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Date: Thu, 12 Feb 2026 13:05:38 +0300
Message-ID: <20260212100538.170445-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260212100538.170445-1-work@onurozkan.dev>
References: <20260212100538.170445-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On rk3588s, `dmesg | grep 'tyr'` logs:

  tyr fb000000.gpu: supply SRAM not found, using dummy regulator

This happens because Tyr calls Regulator<Enabled>::get() for SRAM,
which goes through the non-optional regulator_get() path. If the
device tree doesn't provide sram-supply, regulator core falls back
to a dummy regulator and writes that log.

Panthor handles SRAM as optional and tolerates missing sram-supply.
This patch matches that behavior in Tyr by using optional regulator
lookup and storing SRAM as Option<Regulator<Enabled>> which avoids
dummy-regulator fallback/noise when SRAM is not described inside
the device tree.

Link: https://rust-for-linux.zulipchat.com/#narrow/stream/x/topic/x/near/573210018
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/gpu/drm/tyr/driver.rs |  5 ++--
 rust/helpers/regulator.c      |  5 ++++
 rust/kernel/regulator.rs      | 45 +++++++++++++++++++++++++++++++++--
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0389c558c036..e0856deb83ec 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -113,7 +113,8 @@ fn probe(
         coregroup_clk.prepare_enable()?;
 
         let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("mali"))?;
-        let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("sram"))?;
+        let sram_regulator =
+            Regulator::<regulator::Enabled>::get_optional(pdev.as_ref(), c_str!("sram"))?;
 
         let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
         let iomem = Arc::pin_init(request.iomap_sized::<SZ_2M>(), GFP_KERNEL)?;
@@ -201,5 +202,5 @@ struct Clocks {
 #[pin_data]
 struct Regulators {
     mali: Regulator<regulator::Enabled>,
-    sram: Regulator<regulator::Enabled>,
+    sram: Option<Regulator<regulator::Enabled>>,
 }
diff --git a/rust/helpers/regulator.c b/rust/helpers/regulator.c
index 11bc332443bd..5ef45a8adf12 100644
--- a/rust/helpers/regulator.c
+++ b/rust/helpers/regulator.c
@@ -25,6 +25,11 @@ struct regulator *rust_helper_regulator_get(struct device *dev, const char *id)
 	return regulator_get(dev, id);
 }
 
+struct regulator *rust_helper_regulator_get_optional(struct device *dev, const char *id)
+{
+	return regulator_get_optional(dev, id);
+}
+
 int rust_helper_regulator_enable(struct regulator *regulator)
 {
 	return regulator_enable(regulator);
diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
index 2c44827ad0b7..d27ce3f6ef26 100644
--- a/rust/kernel/regulator.rs
+++ b/rust/kernel/regulator.rs
@@ -232,10 +232,11 @@ pub fn devm_enable_optional(dev: &Device<Bound>, name: &CStr) -> Result {
 ///
 /// # Invariants
 ///
-/// - `inner` is a non-null wrapper over a pointer to a `struct
-///   regulator` obtained from [`regulator_get()`].
+/// - `inner` is a non-null wrapper over a pointer to a `struct regulator`
+///   obtained from [`regulator_get()`] or [`regulator_get_optional()`].
 ///
 /// [`regulator_get()`]: https://docs.kernel.org/driver-api/regulator.html#c.regulator_get
+/// [`regulator_get_optional()`]: https://docs.kernel.org/driver-api/regulator.html#c.regulator_get_optional
 pub struct Regulator<State>
 where
     State: RegulatorState,
@@ -283,6 +284,29 @@ fn get_internal(dev: &Device, name: &CStr) -> Result<Regulator<T>> {
         })
     }
 
+    fn get_optional_internal(dev: &Device, name: &CStr) -> Result<Option<Regulator<T>>> {
+        // SAFETY: It is safe to call `regulator_get_optional()`, on a
+        // device pointer received from the C code.
+        let inner = from_err_ptr(unsafe {
+            bindings::regulator_get_optional(dev.as_raw(), name.as_char_ptr())
+        });
+
+        let inner = match inner {
+            Ok(inner) => inner,
+            Err(ENODEV) => return Ok(None),
+            Err(err) => return Err(err),
+        };
+
+        // SAFETY: We can safely trust `inner` to be a pointer to a valid
+        // regulator if `ERR_PTR` was not returned.
+        let inner = unsafe { NonNull::new_unchecked(inner) };
+
+        Ok(Some(Self {
+            inner,
+            _phantom: PhantomData,
+        }))
+    }
+
     fn enable_internal(&self) -> Result {
         // SAFETY: Safe as per the type invariants of `Regulator`.
         to_result(unsafe { bindings::regulator_enable(self.inner.as_ptr()) })
@@ -300,6 +324,11 @@ pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
         Regulator::get_internal(dev, name)
     }
 
+    /// Obtains an optional [`Regulator`] instance from the system.
+    pub fn get_optional(dev: &Device, name: &CStr) -> Result<Option<Self>> {
+        Regulator::get_optional_internal(dev, name)
+    }
+
     /// Attempts to convert the regulator to an enabled state.
     pub fn try_into_enabled(self) -> Result<Regulator<Enabled>, Error<Disabled>> {
         // We will be transferring the ownership of our `regulator_get()` count to
@@ -329,6 +358,18 @@ pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
             .map_err(|error| error.error)
     }
 
+    /// Obtains an optional [`Regulator`] instance from the system and enables it.
+    pub fn get_optional(dev: &Device, name: &CStr) -> Result<Option<Self>> {
+        match Regulator::<Disabled>::get_optional_internal(dev, name)? {
+            Some(regulator) => {
+                let enabled_regulator =
+                    regulator.try_into_enabled().map_err(|error| error.error)?;
+                Ok(Some(enabled_regulator))
+            }
+            None => Ok(None),
+        }
+    }
+
     /// Attempts to convert the regulator to a disabled state.
     pub fn try_into_disabled(self) -> Result<Regulator<Disabled>, Error<Enabled>> {
         // We will be transferring the ownership of our `regulator_get()` count
-- 
2.51.2

