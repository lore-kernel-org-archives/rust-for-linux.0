Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AB034887B
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057788; cv=none; b=G7nLjTVuHgcqMl9Ehnc6ngwO5PnnDvX29wmGlhwUEnucKvv8ejA3immVPGafyqw1ENm0QsMWs0L2/ijS43Ofpj9SSdfkJWLXloDmqqBjf64uH5b8uf8WtgZXxrx5RXQrVu2w8uX2qIMA18YnqK8HDPt2eff9vWSogrlm2llqhaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057788; c=relaxed/simple;
	bh=RPwYcsbO6FvGujOyqzQn4sJnbXGyGs4NpzWn8HY+yNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=llP8finnwS16qjmFxlDZAvB/Xvjpnyrg3vpeDnSRxGqwIhtgQRL2kkBCGpO9+BP8ZokgtOccGJsWZ0ZRU9kebEIa75UCW4Y9Pr8Is/IXP/Nkb+9iXWMEz2HIHFJJDXyn7gnmOsiRrMbYfAyPSkcqDssCXcwWC9E1utF+dXdTLpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMjyDMUP; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMjyDMUP"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59b8466b4a8so869949e87.1
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 07:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768057780; x=1768662580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJZFqk7vh2YSe9SFh94/y7TJPpOJJYaVuu6o0W+r2E0=;
        b=iMjyDMUPSEY8Lmq3R0FAa3quZjmWCFnzj0ccxNiTn8rYW7WDyI0Zy1DMSxJqXW3bzx
         +P7cmQGSiY6AJ09TTWqJrN9NN5gsp+USi011s0g/poVghoANObGOmlrdwhioBkvc4eKe
         wgBk1NtkzuYjILvPgOuWXEKNMTsfhSd/MHRGwf3+zmmYDnDFJXiT6x+IHJAEYLdg0edC
         kj/yXGQc1l6pImih45hk/lGhJHapUXVSd7LaPVpYX0U8daR2qqpKaQpTnzD7ViL50OxR
         G71kYh5mUcCq9pIuyl3n+6ag8HtO7stfVCaR9nGRACS41OnKZamqmy27MoJ6+hWmtXvm
         pCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057780; x=1768662580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TJZFqk7vh2YSe9SFh94/y7TJPpOJJYaVuu6o0W+r2E0=;
        b=RpYzddCLBIo6xWKKjsVtk4Hi6vyb3MbVkcPmMJ8KPWO9m/vOaAFRsnHV+jm0Ui4M3z
         Iz/It37wiAqPijNeKWQfq/RoJKkBZC74VAq69VLRCfRPBad4WhAbZsAH/eFYX51uqO67
         xzOfVpuLV/R2xqJHzWcHJe8swW6itC3anvwA+wxrJhQcYSjyw+WyUbzm0YVpbjNFtY1t
         ln1WyxZcsPa0St0ZSseeQbM5D31zOZjJlmiqxIuZ4Hcf70xDYLs/ToILQ8V9ala6M2Sq
         ca1ZmSqf733Ht8btJpWpHG3Mu1JrdX2D1J2nQPra7PLliP5nTAUDJjtutKXClnDa6OC4
         Rq9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJq9vndZKxoDN5+jqtm9yxnH/ljGl9rdDu8RyEllntu/jbdON/PASJeCx13WhdDVixy5olEW2a/6yBbkDjLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIEGR9ld3QufKUajP4YkAWVni1v3AP5HlPccqp+x5ZByveqcRw
	WIvVbmr03HwyjBspe+sK05nfEglU1Rv8i0DxeBMuGF/19kxaGfGIrBtl
X-Gm-Gg: AY/fxX7NlZQOJz8eWF2l7hvJKZKqJH+UE/ZBbAzNEFeBAlOTPxmsnmwdf8/BhCQud0s
	pB8JWBPLLmLHfhTA0JKQbYLjwY93pi0StUBSbY/l5C49/RoX0hey5HB6LJ/W/uo1ady4fkbARkH
	iyTBFKTAJAIyLeXOgM3j6ZUiCCTLgIRCDVmh3iACb9BuRWzDPEKP9qw/ny+Rx7F0+A5j4g3CTBC
	6xRHPyYOq3UWFuuqw3zbsjvE2fmpfSRtMAlLwHI52q/mo6wQQrUQfth7PXbjOivHx/33Nj/D6QF
	3xb3bLMqnfbi/Ujoax+v17lEipduTJoPhb2QoRsMzI0ZYp0a6m+WUkFy8ma+uXkcN8NkGp2Uqic
	jLMY81f3vJoJIuD9wc6UUIdy5N2Eo9ajRvq5mpXB4dbZNnmCaKaHJ4A8dsxVP8uYcC/EkZs9hAW
	Bznx8jE8HP/dny3B+lDcXe21HMGqyPb8nGhVKwYwuNud3q5LrUwOpLOVd1TpGzDJICTAmt5A0m
X-Google-Smtp-Source: AGHT+IGrXaDwrVcPD7nQyKOzD7OZoH3I9M3zAJdjB+Pw3+clRX2CyUU8JcGUGqOgg81EpbJqhGCXjg==
X-Received: by 2002:a05:6512:3b92:b0:598:efe3:42d9 with SMTP id 2adb3069b0e04-59b6ef23c6cmr4461411e87.5.1768057779866;
        Sat, 10 Jan 2026 07:09:39 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-148-7.bb.dnainternet.fi. [37.33.148.7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b75543a64sm2137059e87.49.2026.01.10.07.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 07:09:39 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 10 Jan 2026 17:08:10 +0200
Subject: [PATCH RFC v3 12/15] rust: phy: make Registration::register() use
 new ThisModule
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-this_module_fix-v3-12-97a3d9c14e8b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768057742; l=3371;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=RPwYcsbO6FvGujOyqzQn4sJnbXGyGs4NpzWn8HY+yNY=;
 b=eOz1FkieCkXNv0LbzaUrw6lJv8jXnr2v2Ev87tDvYXN97UoTGaEAUQ7gOBLgSrC/C9PzjTfOI
 uNR/UatFeLaAqdfhARe65M84rWjJrWC14lZyJdS7QY5ojhJUns9YC/1
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

Switch `Registration::register()` to take the owning module via the
`ThisModule` abstraction instead of an explicit module parameter.

The function is now generic over `TM: ThisModule`, allowing the module
owner to be resolved at compile time through `TM::OWNER`. This unifies
the way `THIS_MODULE` is passed to Rust abstractions and avoids
threading module pointers manually through the API.

This also removes redundant parameters and prevents accidental
mismatches between the registered drivers and their owning module.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 rust/kernel/net/phy.rs | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 3ca99db5cccf..ef9c4be4f1ad 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -6,8 +6,17 @@
 //!
 //! C headers: [`include/linux/phy.h`](srctree/include/linux/phy.h).
 
-use crate::{device_id::RawDeviceId, error::*, prelude::*, types::Opaque};
-use core::{marker::PhantomData, ptr::addr_of_mut};
+use crate::{
+    device_id::RawDeviceId,
+    error::*,
+    prelude::*,
+    this_module::ThisModule,
+    types::Opaque, //
+};
+use core::{
+    marker::PhantomData,
+    ptr::addr_of_mut, //
+};
 
 pub mod reg;
 
@@ -648,10 +657,7 @@ unsafe impl Send for Registration {}
 
 impl Registration {
     /// Registers a PHY driver.
-    pub fn register(
-        module: &'static crate::ThisModule,
-        drivers: Pin<&'static mut [DriverVTable]>,
-    ) -> Result<Self> {
+    pub fn register<TM: ThisModule>(drivers: Pin<&'static mut [DriverVTable]>) -> Result<Self> {
         if drivers.is_empty() {
             return Err(code::EINVAL);
         }
@@ -659,7 +665,11 @@ pub fn register(
         // the `drivers` slice are initialized properly. `drivers` will not be moved.
         // So it's just an FFI call.
         to_result(unsafe {
-            bindings::phy_drivers_register(drivers[0].0.get(), drivers.len().try_into()?, module.0)
+            bindings::phy_drivers_register(
+                drivers[0].0.get(),
+                drivers.len().try_into()?,
+                TM::OWNER.as_ptr(),
+            )
         })?;
         // INVARIANT: The `drivers` slice is successfully registered to the kernel via `phy_drivers_register`.
         Ok(Registration { drivers })
@@ -889,12 +899,11 @@ struct Module {
                 [$($crate::net::phy::create_phy_driver::<$driver>()),+];
 
             impl $crate::Module for Module {
-                fn init(module: &'static $crate::ThisModule) -> Result<Self> {
+                fn init(_module: &'static $crate::ThisModule) -> Result<Self> {
                     // SAFETY: The anonymous constant guarantees that nobody else can access
                     // the `DRIVERS` static. The array is used only in the C side.
                     let drivers = unsafe { &mut DRIVERS };
-                    let mut reg = $crate::net::phy::Registration::register(
-                        module,
+                    let mut reg = $crate::net::phy::Registration::register::<crate::THIS_MODULE>(
                         ::core::pin::Pin::static_mut(drivers),
                     )?;
                     Ok(Module { _reg: reg })

-- 
2.43.0

