Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACA234AAE0
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 15:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057798; cv=none; b=EZRp5XuQF9vPbdcUy8FBJki2RrcAtLBmZhKQr1/I1GRRnB+K7wDAcRxB9kUk6JMloKKX1qiHVNwxV+zIE2Y1yn3r82XeLU6N94XVvsJVUYpkJAKA0X4VkaQv9u3ziya9CWUX3f0nIp2bGJGqH9bgjLipq1AqHoePkzti2XY1OEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057798; c=relaxed/simple;
	bh=UABoSaxqonAoKMSM1A63J++kkIOF/YOhd1jPbvYZYCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjFj0OqBlqysv6z/PDJeDJecO7GfSvT0GS1n/fmI6s9ssfrcHtm60pRnKRwHcIK/w+vjW88idUB7B6LNjMrrmq9c8/iROVI0unBJIkH6R0t3Jo0VFvrD4rZPC77yl2dIFDj+Xp7ytysyJVZEJGsCoQI729pyz4CM7MFRqLMA6ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWQ7eOxf; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWQ7eOxf"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59b679cff1fso3996130e87.0
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 07:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768057782; x=1768662582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07QAswGWdpTr3hHbMzjaD5v4uBQulILTtvUpre8K2Ow=;
        b=ZWQ7eOxf97xHLhIPvfuTd49AeMmU/28Rn9hpFcVKv4/6JCVpEEmjkyE++hkGYeAyy9
         u/XabzGwc0iWeDWmIjbwzuihKZ6BI/v7x+v3gt0fewJ05etbStoq1FtDOOHC+hpV3dsj
         qDpjWhxezIpKrwTU09yeQvsrKOavty4/k0qX9yU2Hg+kH9f2BzP+AA9eeR2+dxNhx3ce
         r2fUeEaeUS6HktASLy5+8lDi14tSLTI81jKlStsHTnc7KXHd5HFnm0d5zrHLvlAb3RW7
         eu7BmtBb1qkc+Uyr97VyiiCrPWHyLtZQyPWjh6IdO8WBTirnwsmexiwENvOB0qLxKem9
         aFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057782; x=1768662582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=07QAswGWdpTr3hHbMzjaD5v4uBQulILTtvUpre8K2Ow=;
        b=WBolLQ9rxZN7xTee7gewR+d3ou3cYM8zA40zGnXFY19ugyNRyCnZuOsviZaDjkja6T
         xq7S2Dc8b3woR7sKIL7NJzRkz0Rfb9E8JnXeTIAI90qeTa+fW9PJrpj/nyyb8UcaUqr/
         VplLk6Jc6UswUoGvZNpPTRBzvWBnu0ej6EFiiEgEXB4us/YryWZ1+1ofFWBY1NpIEkCl
         svCSxTYOvbw/EnAKpYaXeoKeJz3TCc0zSGHmofEyJy2GY2j43reXnCRBpM2WWR1ROVnC
         kPkzw5Y+pzmpQ2VNtu6yR7qBpA6v8r6ir+TlIc0NdDTAtbhGw94ERDGAnlTv4m7B9YBk
         VbUA==
X-Forwarded-Encrypted: i=1; AJvYcCV5miN0+wH2strkpmVYbnbokAbLoLNWs2eJ/H30sHcpFRy/wBqtSpsdQl6nIvZcWUGmjH5S+J3Lq97BMHESFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVPzScNZksmM9bMIcNg2BUOfN1zijUUtNSfpKdy0ke3PH2hwJH
	+3dTmYoBFCm00DDCdwXnB1FsaMmPgUHZNxnjaGi8XdueKPtFX6j6UBpX
X-Gm-Gg: AY/fxX5yTaKZBhZxXNEClqp35yKm58DkZPXmv06GCwx3+21vLB37dLC3R7ol1zrRr5m
	LOFemmdd/Bye2KbjOcLKAdMzKoXm8Sc38lxJbxUcBVgWxweJDOZmW4dU4muhknoGjDeUkA9jgw6
	xklc3+CVD+DACAX4Vc0Um5Lb7V2GWcuDSDABx1tMtHJCpDs8qB01VXGsRJ7o4kStHXJH4HLNpVD
	fyRrkfz+pHCrwUoEI42/VbYwM5pI/EuTRSnOT7YOHRHdduQRCVUfYSKbmXFAnDxQIhysir/NKfS
	5NcO9SizAavwPAttS75UOxQM5Zr/3XZmaiDsBzG1oa5Y/36LZi7q1OYcHY2IF251W+ic0yXmQG2
	ICnT0mz6cb2FX0dkeNK0cn4kQwmp3Z/TZ6MjNtyMy/iY3B4Lqiv9ihk37bifqA3hW9XfzqDMp0X
	/fU30vtcfpP8ebjmriPtwfUewyUJ3S6q8KbF35/aP5KW+Ur73VHSZatxgnLh/z1cAHoQUMqkDo
X-Google-Smtp-Source: AGHT+IF14K6flXm/FKp0Ka/5zTocdLoJ5AAn0WrROFOXnN5R/o8ywfpYrSkhDWVGQCOP2bqs184yBA==
X-Received: by 2002:ac2:4894:0:b0:59b:6ff4:195a with SMTP id 2adb3069b0e04-59b6ff41a97mr2884280e87.43.1768057782129;
        Sat, 10 Jan 2026 07:09:42 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-148-7.bb.dnainternet.fi. [37.33.148.7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b75543a64sm2137059e87.49.2026.01.10.07.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 07:09:41 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 10 Jan 2026 17:08:11 +0200
Subject: [PATCH RFC v3 13/15] rust: remove module argument from
 InPlaceModule::init()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-this_module_fix-v3-13-97a3d9c14e8b@gmail.com>
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
 Kari Argillander <kari.argillander@gmail.com>, 
 Yuheng Su <gipsyh.icu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768057742; l=13585;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=UABoSaxqonAoKMSM1A63J++kkIOF/YOhd1jPbvYZYCc=;
 b=H8JijuxSUV9Ec+/8vdofzKs+jAGXj7xuXT0odKnocxFhcVjniBAuXPiabaJPIL97UNO5cZ25B
 VZPXUEk5+R3B4f+LjgQQo5XrzcH1KpLUpfXBWU/lIKy6c0QeXpEk2Mr
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

InPlaceModule::init() has ThisModule argument. However modules always
have THIS_MODULE made by module! macro. So it is unnecessary to pass
same information through this function. End goal is to make idea of
THIS_MODULE simpler. Driver getting this THIS_MODULE from multiple
places is confusing. So let's just stick with THIS_MODULE as that also
works in const context very easily.

Reported-by: Yuheng Su <gipsyh.icu@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/720
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 drivers/android/binder/rust_binder_main.rs | 2 +-
 drivers/block/rnull/rnull.rs               | 2 +-
 lib/find_bit_benchmark_rust.rs             | 3 +--
 rust/kernel/configfs.rs                    | 3 +--
 rust/kernel/driver.rs                      | 4 +---
 rust/kernel/firmware.rs                    | 2 +-
 rust/kernel/lib.rs                         | 8 ++++----
 rust/kernel/net/phy.rs                     | 2 +-
 rust/kernel/sync/lock/global.rs            | 4 ++--
 rust/macros/lib.rs                         | 4 ++--
 rust/macros/module.rs                      | 2 +-
 samples/rust/rust_configfs.rs              | 2 +-
 samples/rust/rust_debugfs_scoped.rs        | 2 +-
 samples/rust/rust_driver_auxiliary.rs      | 2 +-
 samples/rust/rust_driver_faux.rs           | 2 +-
 samples/rust/rust_minimal.rs               | 2 +-
 samples/rust/rust_misc_device.rs           | 2 +-
 samples/rust/rust_print_main.rs            | 2 +-
 18 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index fc921c0e1116..8b865112e60c 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -291,7 +291,7 @@ fn ptr_align(value: usize) -> Option<usize> {
 struct BinderModule {}
 
 impl kernel::Module for BinderModule {
-    fn init(_module: &'static kernel::ThisModule) -> Result<Self> {
+    fn init() -> Result<Self> {
         // SAFETY: The module initializer never runs twice, so we only call this once.
         unsafe { crate::context::CONTEXTS.init() };
 
diff --git a/drivers/block/rnull/rnull.rs b/drivers/block/rnull/rnull.rs
index 862369ab9b5c..a9be1b2187f4 100644
--- a/drivers/block/rnull/rnull.rs
+++ b/drivers/block/rnull/rnull.rs
@@ -36,7 +36,7 @@ struct NullBlkModule {
 }
 
 impl kernel::InPlaceModule for NullBlkModule {
-    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
+    fn init() -> impl PinInit<Self, Error> {
         pr_info!("Rust null_blk loaded\n");
 
         try_pin_init!(Self {
diff --git a/lib/find_bit_benchmark_rust.rs b/lib/find_bit_benchmark_rust.rs
index 6bdc51de2f30..5c231569d887 100644
--- a/lib/find_bit_benchmark_rust.rs
+++ b/lib/find_bit_benchmark_rust.rs
@@ -7,7 +7,6 @@
 use kernel::error::{code, Result};
 use kernel::prelude::module;
 use kernel::time::{Instant, Monotonic};
-use kernel::ThisModule;
 use kernel::{pr_cont, pr_err};
 
 const BITMAP_LEN: usize = 4096 * 8 * 10;
@@ -88,7 +87,7 @@ fn find_bit_test() {
 }
 
 impl kernel::Module for Benchmark {
-    fn init(_module: &'static ThisModule) -> Result<Self> {
+    fn init() -> Result<Self> {
         find_bit_test();
         // Return error so test module can be inserted again without rmmod.
         Err(code::EINVAL)
diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 908cb98d404f..2af63f7daef2 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -27,7 +27,6 @@
 //! use kernel::new_mutex;
 //! use kernel::page::PAGE_SIZE;
 //! use kernel::sync::Mutex;
-//! use kernel::ThisModule;
 //!
 //! #[pin_data]
 //! struct RustConfigfs {
@@ -36,7 +35,7 @@
 //! }
 //!
 //! impl kernel::InPlaceModule for RustConfigfs {
-//!     fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
+//!     fn init() -> impl PinInit<Self, Error> {
 //!         pr_info!("Rust configfs sample (init)\n");
 //!
 //!         let item_type = configfs_attrs! {
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index dc7522c4ebda..de77f95d7fe0 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -201,9 +201,7 @@ struct DriverModule {
         }
 
         impl $crate::InPlaceModule for DriverModule {
-            fn init(
-                _module: &'static $crate::ThisModule
-            ) -> impl ::pin_init::PinInit<Self, $crate::error::Error> {
+            fn init() -> impl ::pin_init::PinInit<Self, $crate::error::Error> {
                 $crate::try_pin_init!(Self {
                     _driver <- $crate::driver::Registration::new::<crate::THIS_MODULE>(),
                 })
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 2702f01c0403..42bae71f6af1 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -157,7 +157,7 @@ unsafe impl Sync for Firmware {}
 /// # struct MyModule;
 /// #
 /// # impl kernel::Module for MyModule {
-/// #     fn init(_module: &'static ThisModule) -> Result<Self> {
+/// #     fn init() -> Result<Self> {
 /// #         Ok(Self)
 /// #     }
 /// # }
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 4b899f75e56d..d6111a44fb3a 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -175,7 +175,7 @@ pub trait Module: Sized + Sync + Send {
     /// should do.
     ///
     /// Equivalent to the `module_init` macro in the C API.
-    fn init(module: &'static ThisModule) -> error::Result<Self>;
+    fn init() -> error::Result<Self>;
 }
 
 /// A module that is pinned and initialised in-place.
@@ -183,13 +183,13 @@ pub trait InPlaceModule: Sync + Send {
     /// Creates an initialiser for the module.
     ///
     /// It is called when the module is loaded.
-    fn init(module: &'static ThisModule) -> impl pin_init::PinInit<Self, error::Error>;
+    fn init() -> impl pin_init::PinInit<Self, error::Error>;
 }
 
 impl<T: Module> InPlaceModule for T {
-    fn init(module: &'static ThisModule) -> impl pin_init::PinInit<Self, error::Error> {
+    fn init() -> impl pin_init::PinInit<Self, error::Error> {
         let initer = move |slot: *mut Self| {
-            let m = <Self as Module>::init(module)?;
+            let m = <Self as Module>::init()?;
 
             // SAFETY: `slot` is valid for write per the contract with `pin_init_from_closure`.
             unsafe { slot.write(m) };
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index ef9c4be4f1ad..4c4dc376bd5a 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -899,7 +899,7 @@ struct Module {
                 [$($crate::net::phy::create_phy_driver::<$driver>()),+];
 
             impl $crate::Module for Module {
-                fn init(_module: &'static $crate::ThisModule) -> Result<Self> {
+                fn init() -> Result<Self> {
                     // SAFETY: The anonymous constant guarantees that nobody else can access
                     // the `DRIVERS` static. The array is used only in the C side.
                     let drivers = unsafe { &mut DRIVERS };
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index eab48108a4ae..7fde464462d1 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -203,7 +203,7 @@ pub fn get_mut(&mut self) -> &mut T {
 /// }
 ///
 /// impl kernel::Module for MyModule {
-///     fn init(_module: &'static ThisModule) -> Result<Self> {
+///     fn init() -> Result<Self> {
 ///         // SAFETY: Called exactly once.
 ///         unsafe { MY_COUNTER.init() };
 ///
@@ -243,7 +243,7 @@ pub fn get_mut(&mut self) -> &mut T {
 /// }
 ///
 /// impl kernel::Module for MyModule {
-///     fn init(_module: &'static ThisModule) -> Result<Self> {
+///     fn init() -> Result<Self> {
 ///         // SAFETY: Called exactly once.
 ///         unsafe { MY_MUTEX.init() };
 ///
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index b38002151871..d22a93696209 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -80,7 +80,7 @@
 /// struct MyModule(i32);
 ///
 /// impl kernel::Module for MyModule {
-///     fn init(_module: &'static ThisModule) -> Result<Self> {
+///     fn init() -> Result<Self> {
 ///         let foo: i32 = 42;
 ///         pr_info!("I contain:  {}\n", foo);
 ///         pr_info!("i32 param is:  {}\n", module_parameters::my_parameter.read());
@@ -114,7 +114,7 @@
 /// struct MyDeviceDriverModule;
 ///
 /// impl kernel::Module for MyDeviceDriverModule {
-///     fn init(_module: &'static ThisModule) -> Result<Self> {
+///     fn init() -> Result<Self> {
 ///         Ok(Self)
 ///     }
 /// }
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 1bcd703735fe..7473a377a3bd 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -490,7 +490,7 @@ mod __module_init {{
                     /// This function must only be called once.
                     unsafe fn __init() -> ::kernel::ffi::c_int {{
                         let initer =
-                            <{type_} as ::kernel::InPlaceModule>::init(&super::super::THIS_MODULE.as_ref());
+                            <{type_} as ::kernel::InPlaceModule>::init();
                         // SAFETY: No data race, since `__MOD` can only be accessed by this module
                         // and there only `__init` and `__exit` access it. These functions are only
                         // called once and `__exit` cannot be called before or during `__init`.
diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
index 0ccc7553ef39..f34260793677 100644
--- a/samples/rust/rust_configfs.rs
+++ b/samples/rust/rust_configfs.rs
@@ -42,7 +42,7 @@ fn new() -> impl PinInit<Self, Error> {
 }
 
 impl kernel::InPlaceModule for RustConfigfs {
-    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
+    fn init() -> impl PinInit<Self, Error> {
         pr_info!("Rust configfs sample (init)\n");
 
         // Define a subsystem with the data type `Configuration`, two
diff --git a/samples/rust/rust_debugfs_scoped.rs b/samples/rust/rust_debugfs_scoped.rs
index 6a575a15a2c2..75897e02766b 100644
--- a/samples/rust/rust_debugfs_scoped.rs
+++ b/samples/rust/rust_debugfs_scoped.rs
@@ -134,7 +134,7 @@ fn init_control(base_dir: &Dir, dyn_dirs: Dir) -> impl PinInit<Scope<ModuleData>
 }
 
 impl kernel::Module for RustScopedDebugFs {
-    fn init(_module: &'static kernel::ThisModule) -> Result<Self> {
+    fn init() -> Result<Self> {
         let base_dir = Dir::new(c"rust_scoped_debugfs");
         let dyn_dirs = base_dir.subdir(c"dynamic");
         Ok(Self {
diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index 8536a8eba45d..528866b953aa 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -111,7 +111,7 @@ struct SampleModule {
 }
 
 impl InPlaceModule for SampleModule {
-    fn init(_module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+    fn init() -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
             _pci_driver <- driver::Registration::new::<THIS_MODULE>(),
             _aux_driver <- driver::Registration::new::<THIS_MODULE>(),
diff --git a/samples/rust/rust_driver_faux.rs b/samples/rust/rust_driver_faux.rs
index 5330b77ea986..2653b2ec3338 100644
--- a/samples/rust/rust_driver_faux.rs
+++ b/samples/rust/rust_driver_faux.rs
@@ -21,7 +21,7 @@ struct SampleModule {
 }
 
 impl Module for SampleModule {
-    fn init(_module: &'static ThisModule) -> Result<Self> {
+    fn init() -> Result<Self> {
         pr_info!("Initialising Rust Faux Device Sample\n");
 
         let reg = faux::Registration::new(c"rust-faux-sample-device", None)?;
diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
index 8eb9583571d7..c024f8083499 100644
--- a/samples/rust/rust_minimal.rs
+++ b/samples/rust/rust_minimal.rs
@@ -23,7 +23,7 @@ struct RustMinimal {
 }
 
 impl kernel::Module for RustMinimal {
-    fn init(_module: &'static ThisModule) -> Result<Self> {
+    fn init() -> Result<Self> {
         pr_info!("Rust minimal sample (init)\n");
         pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
         pr_info!(
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 464e3026e6e3..709adf4a6026 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -128,7 +128,7 @@ struct RustMiscDeviceModule {
 }
 
 impl kernel::InPlaceModule for RustMiscDeviceModule {
-    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
+    fn init() -> impl PinInit<Self, Error> {
         pr_info!("Initialising Rust Misc Device Sample\n");
 
         let options = MiscDeviceOptions {
diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index 4095c72afeab..de1bf7b80153 100644
--- a/samples/rust/rust_print_main.rs
+++ b/samples/rust/rust_print_main.rs
@@ -59,7 +59,7 @@ fn arc_dyn_print(arc: &Arc<dyn Display>) {
 }
 
 impl kernel::Module for RustPrint {
-    fn init(_module: &'static ThisModule) -> Result<Self> {
+    fn init() -> Result<Self> {
         pr_info!("Rust printing macros sample (init)\n");
 
         pr_emerg!("Emergency message (level 0) without args\n");

-- 
2.43.0

