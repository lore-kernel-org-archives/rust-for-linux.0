Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4D53E498
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389006; cv=none; b=rLJdXArmEj74bdv9UsIKnUjCLCnKrqlDn0cvtLHuCejgdzxPSL5zp6JaK3EkT3piN/MaYALrmPTNLcYaRdHDykY3bHJg/5P8mlck9uczre0628sVBlXuQZvKRHtdkeX90L4ZWTxILjQtQ+Jff7UvWzB3TtAVs14P0Qv8n6vYMoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389006; c=relaxed/simple;
	bh=Csg25TMmXlsPfUWjg8c5RaDN8Ky+cfTv+YdstZXoYec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pCfbSKT2ZVM/IgnLAcv58mS/QIP9EceaRi6AZUCvf3BgIelzUj3pUbzN93/lymoNbrYWw3zx0xKaC80CdDO0Vsq5YZtIPs0PKAKA1vife/Ykh9wQwbfjKPGS/B89K0r2LqYkkS/WcqqVS8mthjFZFo6b0FcgWR1jmkrVXdM2/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FIUp5aEV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FIUp5aEV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711389003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b22L7dtBLsIt7xjz+3x75joldlmk5k7EqKyOfwv3rM4=;
	b=FIUp5aEVhBM1BM4MY+BdQ/7Ce2e1kkeUxX68Z8dStEN9LGSLEECThBqQnagkmsLOigZZ6G
	YPjf3fixwpXAhmjpnYB+ZpC+nSplVcwZ7bU0SVg8uPgxCAqpKk4uSB5hbqI5KuEjmifj/r
	La8B8zEC2IAKnrd1e75pwUaKoBKv12A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-oekuZM8RNGOOvYQ4oN3-JQ-1; Mon, 25 Mar 2024 13:50:02 -0400
X-MC-Unique: oekuZM8RNGOOvYQ4oN3-JQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33eca7270ccso1972208f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389001; x=1711993801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b22L7dtBLsIt7xjz+3x75joldlmk5k7EqKyOfwv3rM4=;
        b=JNpjxurCwyNJNjWOBW/wC+sff5414NC9MOlkAx5XSEZFII0hSoK+u09AOsgm8+OOSg
         PFXdE9RoRhfCRYPGmALF9FryyEogcfLrCczLtqBjlmdaacNnGkMfYFqMmyGqYFbkVimu
         2Ryzqcl2llFaenvQ2B370P725bWMvXZd80p/WgPa5XpoT7orUJ/Q980VtbIKPzVRDQsj
         qLHivbz8caE1uyOhaHGIhvxrI4LejzQhelwtCmCorruuJePZazhwAOX+9FYvrkMPOeiy
         VJewIN9aG3TRSAlD2dGR3hSgy2AsIaq/+F/Yxaks8fGrsp4aGIi+kMTDjvFmNlC7/PUM
         HV+g==
X-Gm-Message-State: AOJu0YwA2LmOgnKtAMBdLomLPEfVVYW3Vk9WkCxxdE65UlIAmgm7G+2/
	cMRzly4i9NEiF4W0qUNhKA5kSQ6w6y6SG/7ZZ8b0gGtLZAlaQioyRPn9IQ9zGbgbFBSR/9geyZE
	+FBF9HwvFm6nqZiVNDje0hTpv/mAICMwqo2EYfC1lTGZpqGwFohME3YVQAzQo1zFc
X-Received: by 2002:a5d:6044:0:b0:33e:c07b:cad with SMTP id j4-20020a5d6044000000b0033ec07b0cadmr6689601wrt.0.1711389001412;
        Mon, 25 Mar 2024 10:50:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqeNLFX7mfakYTyW3nITiP/w3Z3JAlNcdUTIfDGnL278BxO5VjmYi8Q/88BY0tTp214v4WmQ==
X-Received: by 2002:a5d:6044:0:b0:33e:c07b:cad with SMTP id j4-20020a5d6044000000b0033ec07b0cadmr6689575wrt.0.1711389001150;
        Mon, 25 Mar 2024 10:50:01 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id l15-20020adfa38f000000b0033e03a6b1ecsm10115918wrb.18.2024.03.25.10.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:50:00 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: rust-for-linux@vger.kernel.org,
	x86@kernel.org,
	lyude@redhat.com,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	airlied@redhat.com,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 8/8] rust: add device::Data
Date: Mon, 25 Mar 2024 18:49:12 +0100
Message-ID: <20240325174924.95899-9-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325174924.95899-1-dakr@redhat.com>
References: <20240325174924.95899-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Wedson Almeida Filho <wedsonaf@gmail.com>

This allows access to registrations and io resources to be automatically
revoked when devices are removed, even if the ref count to their state
is non-zero.

Co-developed-by: Andreas Hindborg <a.hindborg@samsung.com>
Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/device.rs | 120 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 7309a236f512..707c699c3090 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -4,7 +4,22 @@
 //!
 //! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
 
-use crate::{bindings, str::CStr};
+use macros::pin_data;
+
+use crate::{
+    bindings,
+    error::Result,
+    init::InPlaceInit,
+    init::PinInit,
+    pin_init,
+    revocable::{Revocable, RevocableGuard},
+    str::CStr,
+    sync::{LockClassKey, RevocableMutex, UniqueArc},
+};
+use core::{
+    ops::{Deref, DerefMut},
+    pin::Pin,
+};
 
 /// A raw device.
 ///
@@ -95,3 +110,106 @@ fn clone(&self) -> Self {
         Self::from_dev(self)
     }
 }
+
+/// Device data.
+///
+/// When a device is removed (for whatever reason, for example, because the device was unplugged or
+/// because the user decided to unbind the driver), the driver is given a chance to clean its state
+/// up, and all io resources should ideally not be used anymore.
+///
+/// However, the device data is reference-counted because other subsystems hold pointers to it. So
+/// some device state must be freed and not used anymore, while others must remain accessible.
+///
+/// This struct separates the device data into three categories:
+///   1. Registrations: are destroyed when the device is removed, but before the io resources
+///      become inaccessible.
+///   2. Io resources: are available until the device is removed.
+///   3. General data: remain available as long as the ref count is nonzero.
+///
+/// This struct implements the `DeviceRemoval` trait so that it can clean resources up even if not
+/// explicitly called by the device drivers.
+#[pin_data]
+pub struct Data<T, U, V> {
+    #[pin]
+    registrations: RevocableMutex<T>,
+    #[pin]
+    resources: Revocable<U>,
+    #[pin]
+    general: V,
+}
+
+/// Safely creates an new reference-counted instance of [`Data`].
+#[doc(hidden)]
+#[macro_export]
+macro_rules! new_device_data {
+    ($reg:expr, $res:expr, $gen:expr, $name:literal) => {{
+        static CLASS1: $crate::sync::LockClassKey = $crate::sync::LockClassKey::new();
+        let regs = $reg;
+        let res = $res;
+        let gen = $gen;
+        let name = $crate::c_str!($name);
+        $crate::device::Data::try_new(regs, res, gen, name, &CLASS1)
+    }};
+}
+
+impl<T, U, V> Data<T, U, V> {
+    /// Creates a new instance of `Data`.
+    ///
+    /// It is recommended that the [`new_device_data`] macro be used as it automatically creates
+    /// the lock classes.
+    pub fn try_new(
+        registrations: T,
+        resources: impl PinInit<U>,
+        general: impl PinInit<V>,
+        name: &'static CStr,
+        key1: &'static LockClassKey,
+    ) -> Result<Pin<UniqueArc<Self>>> {
+        let ret = UniqueArc::pin_init(pin_init!(Self {
+            registrations <- RevocableMutex::new(
+                registrations,
+                name,
+                key1,
+            ),
+            resources <- Revocable::new(resources),
+            general <- general,
+        }))?;
+
+        Ok(ret)
+    }
+
+    /// Returns the resources if they're still available.
+    pub fn resources(&self) -> Option<RevocableGuard<'_, U>> {
+        self.resources.try_access()
+    }
+
+    /// Returns the locked registrations if they're still available.
+    #[cfg(disabled)]
+    pub fn registrations(&self) -> Option<RevocableMutexGuard<'_, T>> {
+        self.registrations.try_write()
+    }
+}
+
+impl<T, U, V> crate::driver::DeviceRemoval for Data<T, U, V> {
+    fn device_remove(&self) {
+        // We revoke the registrations first so that resources are still available to them during
+        // unregistration.
+        self.registrations.revoke();
+
+        // Release resources now. General data remains available.
+        self.resources.revoke();
+    }
+}
+
+impl<T, U, V> Deref for Data<T, U, V> {
+    type Target = V;
+
+    fn deref(&self) -> &V {
+        &self.general
+    }
+}
+
+impl<T, U, V> DerefMut for Data<T, U, V> {
+    fn deref_mut(&mut self) -> &mut V {
+        &mut self.general
+    }
+}
-- 
2.44.0

