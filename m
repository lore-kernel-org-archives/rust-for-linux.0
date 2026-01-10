Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550F7348454
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 15:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057762; cv=none; b=hM6QJuw1ZMpAnBUabCRhMBOXthg2KHZzSzA1XVqK5QkYPo77bX7zsreXTfXjinK+E2n6/W0N6SCkFLcotqPAQ7vd1Rsa3noaUVzBG0CDrWTijP9UPjcOEfA1Df/2EQrJyJjzCuIakbnBzA7BvWuSmEf+ENKaBhF5GXws8bWOhrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057762; c=relaxed/simple;
	bh=pObMsqQ3xkzVkZ3cfdHVrZzRa8fls1Dett+yl59GTWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQiQlKLkcfdWT6iMAGq7mLci88str0P5WTRsd31op8MxlkkA/N5izKwQL33lvc0muPhpodbx7Tm5d92jSr9aOtpCqs+0kmbLehkcIMlZl/eI6VXZ78EUTKRyMo8Pp60WvV37Q+JdwADgbEBo5uzj422fKIhsf76pFEmQS8vm9pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNkkbRo6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNkkbRo6"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b7bb3b913so2876925e87.1
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 07:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768057758; x=1768662558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POe8fbaXk5saKFPceg6wmKUDp4vPexwP90O+JTHpGXU=;
        b=NNkkbRo6aZbyc06RlLk1lH6ZXqkmowM+l54L2ZcMX1EWCqGBDSx/t1ut8jyp4lLRYe
         ZzCPCSWbF/6nHNtqketNdBc2Rs4p7n2NxODS9mhEDRzCdo1MGhtrdqPwD8DbgL6uNHEp
         +JzoXSp0L3AE/dwcjuAhG1QNca7EFz+yoKTogTRFxzd/Z0EO6xaKOdwtlWqLfGlbCMpW
         UUCObZsH7+dk9tGaTqseR95BAjGbUHC91fGzO9zB+oZDtqWirktvirSpXpWfjTmF2INb
         9xrWxT/xIyI+hdRoz5Bj4Ty9XT5xytQNk0sMK2V87pfWGaAh6ZSnaZLe9NdgOtsBNEUc
         YHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057758; x=1768662558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=POe8fbaXk5saKFPceg6wmKUDp4vPexwP90O+JTHpGXU=;
        b=Ljep/zGgxsgDIRZqt2XDaaYKDGBPqZIQ6f7IlwQCjILH1esF9D9EWafkZMuF9xnyww
         niHJxXR+j79EUmqL1c/mzpyXUj2Fjw3456MVYb4qZCE5qZEcxgTbqusr1qh2J+8JnMKA
         T5V+fzk6rRqElBs5E5vT46ynQHimvDv2o3rHDXH5V7sbhG5p6iPR4lRi6irL/w65EHfZ
         InYtwdnesyLP0vdgBWja+Z0iHWYoAoazSJkF0l0Ebc1rJAmUCbm+yhL9FxKd5syMq8dM
         XRJ7ugZA4sbKlhnwqtN4fooV0MxALlIRrK488NSWG+yYQVieKoFe/Fq9TPBShTrqDXUf
         ibMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBM3sp+JRYPGeCh/B3cXPcMYXMeRCvT6Y2nd33+qOqb1Uy4y1oYVmknDWKFlwHmUs83SWpKcLbOFYHdDY/dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIvmdUfim7yOvvFjdyd+4NlLorsJNuB/VULcIHp4LyALOzIE0V
	pp8SbJrOsxG0Fz+bNhf1gd8s/WP8a8v57yf/tgpu4FvflJUFE4dzj8xY
X-Gm-Gg: AY/fxX7ttNYT/HIbNIey4Piwe7ZqTWjNbNjrr+SV8uAh1tU6rUFWVEcBQsG8eokOlYe
	P5RoB2MOD6L21qwIRCEmQZ0dcz6vsmz/TAyZ9PM8Otb7DoYGUDONvvTTW0seX65M7wHfXVnDO1H
	QoO8cL9w6LO0KtYxiQqImgr3jYeORitFggspTO3B/fPe/oVjqFGsRIyg0948Z85IjK9/10HwKaU
	hfkH7GuuWOk/9sHiS/N2KoVA8vYcoRBnZWOXq+pn8LFHxpQJUbj0lkEVkgWY46rRjgs5NO3PYPg
	XB2wasW7sWZ1fC2q0ynQXkhOF5OKpWeKeOHxHsZK4Z3mLWQe50biME1vPyXsKkE3sPc79Z+G08H
	vEIJZ857DRvQTJ7xPIv8M8YdfU+qWb9ze8BSXU9B+XNEDHo6EYHy0k2C04y4fY4cjdd6QtmnfvO
	+tGk60XMQUpN/Q1IjZCxvGGo2kU0McMFy7KZpmFrqb1PKcWdLOXMO0zPI5Ujgi8x1tpeLhfDpE
X-Google-Smtp-Source: AGHT+IFNLBJQ01WunUBd430d8tTEifFvMoI0XyeN6DoOTINO7+ijuLgcerNFWqW0B99vr+losLUPpw==
X-Received: by 2002:a05:6512:2117:b0:59b:7319:1178 with SMTP id 2adb3069b0e04-59b7319121bmr2477799e87.18.1768057758332;
        Sat, 10 Jan 2026 07:09:18 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-148-7.bb.dnainternet.fi. [37.33.148.7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b75543a64sm2137059e87.49.2026.01.10.07.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 07:09:17 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 10 Jan 2026 17:08:03 +0200
Subject: [PATCH RFC v3 05/15] rust: drm: fix missing owner in
 file_operations
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-this_module_fix-v3-5-97a3d9c14e8b@gmail.com>
References: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com>
In-Reply-To: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768057742; l=4166;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=pObMsqQ3xkzVkZ3cfdHVrZzRa8fls1Dett+yl59GTWk=;
 b=7zLe5lryXy/9T6T96fAXZ7YJeKt8qHxw069TB58wLHh6FQK1Lc+lOPi4kQLZ71zfyr/Y1nIP9
 SPGhEma2/P/CfpNojS+bq8ykYv3iAGUyS47NiSESO5YlCZu6vHqAVfF
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

Fix missing .owner field in file_operations. This has been previosly
left out because Rust feature `const_refs_to_static` has not been
enabled. Now that it is we can make define owner even in const context.

This should probably fix use-after-free problems in situations where
file is opened and module driver is unloaded during that.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 drivers/gpu/drm/nova/driver.rs | 2 ++
 drivers/gpu/drm/tyr/driver.rs  | 2 ++
 rust/kernel/drm/device.rs      | 2 +-
 rust/kernel/drm/driver.rs      | 4 ++++
 rust/kernel/drm/gem/mod.rs     | 5 +++--
 5 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index b1af0a099551..7ce505802716 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -14,6 +14,7 @@
 
 use crate::file::File;
 use crate::gem::NovaObject;
+use crate::THIS_MODULE;
 
 pub(crate) struct NovaDriver {
     #[expect(unused)]
@@ -65,6 +66,7 @@ fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<S
 
 #[vtable]
 impl drm::Driver for NovaDriver {
+    type ThisModule = THIS_MODULE;
     type Data = NovaData;
     type File = File;
     type Object = gem::Object<NovaObject>;
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index f0da58932702..11932d3f03ff 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -25,6 +25,7 @@
 use crate::gpu;
 use crate::gpu::GpuInfo;
 use crate::regs;
+use crate::THIS_MODULE;
 
 pub(crate) type IoMem = kernel::io::mem::IoMem<SZ_2M>;
 
@@ -179,6 +180,7 @@ fn drop(self: Pin<&mut Self>) {
 
 #[vtable]
 impl drm::Driver for TyrDriver {
+    type ThisModule = THIS_MODULE;
     type Data = TyrData;
     type File = File;
     type Object = drm::gem::Object<TyrObject>;
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3ce8f62a0056..a740c87933d0 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -92,7 +92,7 @@ impl<T: drm::Driver> Device<T> {
         fops: &Self::GEM_FOPS,
     };
 
-    const GEM_FOPS: bindings::file_operations = drm::gem::create_fops();
+    const GEM_FOPS: bindings::file_operations = drm::gem::create_fops::<T::ThisModule>();
 
     /// Create a new `drm::Device` for a `drm::Driver`.
     pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<ARef<Self>> {
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index f30ee4c6245c..a157db2ea02b 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -9,6 +9,7 @@
     error::{to_result, Result},
     prelude::*,
     sync::aref::ARef,
+    this_module::ThisModule,
 };
 use macros::vtable;
 
@@ -99,6 +100,9 @@ pub trait AllocImpl: super::private::Sealed + drm::gem::IntoGEMObject {
 /// drm_driver` to be registered in the DRM subsystem.
 #[vtable]
 pub trait Driver {
+    /// Module ownership for this device, provided via `THIS_MODULE`.
+    type ThisModule: ThisModule;
+
     /// Context data associated with the DRM driver
     type Data: Sync + Send;
 
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index d49a9ba02635..705afea65ff6 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -11,6 +11,7 @@
     error::{to_result, Result},
     prelude::*,
     sync::aref::{ARef, AlwaysRefCounted},
+    this_module::ThisModule,
     types::Opaque,
 };
 use core::{ops::Deref, ptr::NonNull};
@@ -292,10 +293,10 @@ impl<T: DriverObject> AllocImpl for Object<T> {
     };
 }
 
-pub(super) const fn create_fops() -> bindings::file_operations {
+pub(super) const fn create_fops<TM: ThisModule>() -> bindings::file_operations {
     let mut fops: bindings::file_operations = pin_init::zeroed();
 
-    fops.owner = core::ptr::null_mut();
+    fops.owner = TM::OWNER.as_ptr();
     fops.open = Some(bindings::drm_open);
     fops.release = Some(bindings::drm_release);
     fops.unlocked_ioctl = Some(bindings::drm_ioctl);

-- 
2.43.0

