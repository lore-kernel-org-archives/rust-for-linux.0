Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57C034F498
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932428; cv=none; b=FwaqQW43EMoeul4Bvqr0wY7JdTx+NTVCJJM3qlshb222SW1gwquYGc9VBro09wcQRNYcWpRTbXYsvBkVaD8sxG03P3qXSB3LXesf5HIpCAsjm9VCiAtUfmYBajv8XcgZs4PzEas5JFb0yQgwx4ala5ENYl0RlNMzch3lU3pJzXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932428; c=relaxed/simple;
	bh=7GYie+sje6vYUEu4nfQt7Cuk2MmcmlQNrMLtJybe3qE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rWdQm2rY1qSfw7KNT5O3XsDkKb0aKd9UQ4b45qUUa/lcZGPBwr3fczHlfRjF9Geac9e5H8LaaWPRP4itaYYgETfjJWN21khkkU0JemD3Ugvq//niUX8vzEAQDhNFHL4pTM/vWqJUliajEuph36I+ry8J/xVFJte8ndGNuXjzTwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=klPTLvYp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="klPTLvYp"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f71156e1aso431683f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1785932424; x=1786537224; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lOuY5JDUypH3xF3cJHSxCPv7eqlTAbf9vmoap0AQkDE=;
        b=klPTLvYpbXhYTuiI8aEBr6Jt/VW37xxPTFWNxXN6+VIFGSBne4ja097OUJEyNx+xMA
         1zNEa/nJBRux/WsNuPNi4p6Nvsry2srJDQ4qn5cy9BG28xENRP/4BNB3lfWHhQKiUt1I
         pFbDHEolAHLfSZucV6Y1pOWWFb3+9UAopa4Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932424; x=1786537224;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lOuY5JDUypH3xF3cJHSxCPv7eqlTAbf9vmoap0AQkDE=;
        b=nBznc6hSywLfH45dsta7V2Hr9xJfUa2D40EFJb2y30q8lUlNIW+TyzjIzzt4vgDsvb
         YAmAjufVO0L1DXHf30ZpLCtxgUn2WWhPVUzEg1MymO7zaNmSToC+D0Xfo2Nc7FLL7uyj
         R+XIEBm6jtKItlBCGOt3raI80XEHUL/L0iDszgLSEa0tmiMbfK9dUxBQsvQX5DucJbsa
         OZSm1yrzmCynftZqjfim/KscRgYcuBfLwfkANv1dNwNgddi2FMNXCzQMdL+/eTW0t6c+
         SnPI+zdinBmDFfWpl4DB5bT1olYnkYTnjoG+YMl6dTSuYw+SOkDRNT4Bn1UnGE5DQDdE
         8r7A==
X-Gm-Message-State: AOJu0Yx7Do1wcrIyzJsUW+CPKEZntId7Oy5EX2ragurqwCp8mONwEJLL
	l7GyafRia1rFRw5hVR9O1O2VquIBF7XEmoQ8HrLjRVpHiHC9r7vNIbfWYzu/OAkbHi8=
X-Gm-Gg: AR+sD12gVRGvnaLumiVamGz8v7aUzrBDiigwZHVGHKoB090292w/kqGqzLdVoE2/r6E
	y0UCALMk6JgfnRVPhRDEc73s3sINPm3JmdMM/YjoW/S//zK73kaNye4cZYuoOfbqSXVRECngVtN
	jT7uSiMdVzGvon0i8+RiGQGp+WCm8696uYrU7cmLJwgLpT74DY6lLG9oxZmjye8zlNWzuNwE6kT
	QfPItslo9BL7T6cdZldX2/90V7iqYJ/vzKVTVk0QVTkjTb86wH5UfvDNxGqWPkdRpFiWkwVh7qZ
	ozbQuXxujLOw+UZovMn0z5waddGbKj/ZOJXN6/OpIUkmDsOFjasZxR8RQKXnISBaj8b/Nc/MHfm
	J8NEtITvWq4c4+XYUxcvDfZtKPub5IEdYCOgLFAH498K/fQ8z85b5LPmne741P5CVmHAeQdDIZ/
	eQj54wcbvV2LGnRGCmQinfx06yjaHQA4nHle0eujmzAvUqiv5zcqExOn3IR7yvGztZkJzVf5nsw
	lKB4IMMuDCj6Wm549Px+wblU87ENPXV6m2M1zgNXmjdQBW8
X-Received: by 2002:a05:6000:46cd:b0:47f:77dc:60c6 with SMTP id ffacd0b85a97d-47fec502d33mr8037515f8f.1.1785932423038;
        Wed, 05 Aug 2026 05:20:23 -0700 (PDT)
Received: from [10.0.36.57] ([217.73.170.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febf7e5bdsm8209157f8f.0.2026.08.05.05.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:22 -0700 (PDT)
From: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Date: Wed, 05 Aug 2026 15:20:07 +0300
Subject: [PATCH] rust: misc: add OWNER field to the `MiscDevice` trait
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-rust_tmp-v1-1-7851cc1c00e8@wyliodrin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNT3aLS4pL4ktwCXQNLU0tLEzMzQ0tTMyWg8oKi1LTMCrBR0bG1tQC
 ewsLOWgAAAA==
X-Change-ID: 20260805-rust_tmp-095994661956
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandru Radovici <alexandru.radovici@wyliodrin.com>
X-Mailer: b4 0.14.3

Add `OWNER` constant to the `MiscDevice` trait to allow modules
to prevent unloading while the device is in use.

Set the `OWNER` field in the `rust_misc_device` example.

Signed-off-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
---
This patch exposes the `owner` field of `file_operations` to the
Rust API `MiscDevice` trait. It allows users to prevent the
unloading of their loadable modules written in Rust
while their `MiscDevice` is still in use.

Without this ability, writing a misc loadable module and running
the following commands will Oops the kernel.

   # insmod misc_module.ko
   # sleep 10 > /dev/misc_device
   # rmmod misc_module

   ... after the sleep, the kernel Oops

I added the `OWNER` field to the `rust_misc_device` example.
---
 rust/kernel/miscdevice.rs        | 13 ++++++++++++-
 samples/rust/rust_misc_device.rs |  4 ++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 83ce50def5ac..21c5d88c5dc4 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -31,7 +31,7 @@
         Opaque, //
     },
 };
-use core::marker::PhantomData;
+use core::{marker::PhantomData, ptr};
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
@@ -126,6 +126,12 @@ pub trait MiscDevice: Sized {
     /// What kind of pointer should `Self` be wrapped in.
     type Ptr: ForeignOwnable + Send + Sync;
 
+    /// Set the owner of this `MiscDevice` instance.
+    ///
+    /// In case this is compiled as a module, setting this prevents
+    /// the module unloading while the device is still in use.
+    const OWNER: Option<&'static ThisModule> = None;
+
     /// Called when the misc device is opened.
     ///
     /// The returned pointer will be stored as the private data for the file.
@@ -430,6 +436,11 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         } else {
             None
         },
+        #[cfg(CONFIG_MODULES)]
+        owner: match T::OWNER {
+            Some(module) => module.as_ptr(),
+            None => ptr::null_mut(),
+        },
         ..pin_init::zeroed()
     };
 
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 41e26c825060..bf8801ea3cb2 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -177,6 +177,10 @@ struct RustMiscDevice {
 impl MiscDevice for RustMiscDevice {
     type Ptr = Pin<KBox<Self>>;
 
+    // Set the OWNER constant to the current module to prevent the unloading
+    // of this module while this device is in use.
+    const OWNER: Option<&'static ThisModule> = Some(&crate::THIS_MODULE);
+
     fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
         let dev = ARef::from(misc.device());
 

---
base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86
change-id: 20260805-rust_tmp-095994661956

Best regards,
-- 
Alexandru Radovici <alexandru.radovici@wyliodrin.com>

