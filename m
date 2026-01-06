Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377C9328B49
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767716002; cv=none; b=G3yK/18SFcvmX+h8yerX/Uun2PEtBGRcVYyRFIhjwnVVoxfu837ISEFOtXnguU8p7OHHwC6o9JK+BgjXIu0YcRb5yrPVvkZhMqFEexJndslkDyhmLrdaAEpvo7unCw9rjrBQ4MJCuhYMgw8W4IP6oxtXyiNce94/MWUm7Z+L2DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767716002; c=relaxed/simple;
	bh=Iq8dwvKf4qpl9g//ZJHlBlX2MQk95xnztRt44GtTqZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1T0n0lIPrWdQBocGstrMUa7ftahQcqQ9hlJbDNyNS24j93uNEQVKi+C2VwA920xG1rZwmQtyjvTxR3HgFxqg08nv5sRbp56xA+0P8GXih/OiAD2ujUw8Cp+/ySNaFjG8J3dTHirfoOve07uMSe8lv75kp0pS3FGDlr7p+HAJk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W06Xvs/s; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W06Xvs/s"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37b9d8122fdso8852981fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 08:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767715997; x=1768320797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWUZeCU4mb7jx94MzKj81ED9AcODZrS6l0/OTITjt+k=;
        b=W06Xvs/sf/v+MZNPC+Y34MesjNreiOnIZCuM0rBRzxZIehHqfUNE0pfFsPF/dMAtUx
         M6JDSa01em3odFwnyE45Wl0blFhAY8eljTlhjpTqr/PcLV9EJD3X4LZyAR1qKIFK75/v
         hdgLdu2T9+6aCku+uvqmPu9tarNc6Wv2u6/cRxsdWEwFOsvcgT4RKPb2NX581EVhm9pl
         LDb4lGOtHQEb26qUbfdctfyhZq/jkvTXAKLXVn2t7f3vKiJX7tgT3cLCB8a1OxFqS2Nh
         phPfF+mWUgyWdRVw6mZ4bOlNFO3maMwLOJahu5HMT740RLciGj8N+Uw9q7REJiWfFtE5
         If0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715997; x=1768320797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HWUZeCU4mb7jx94MzKj81ED9AcODZrS6l0/OTITjt+k=;
        b=izMmGf8DqsSLV7E1JtZBOddlRiyZ1iD7FI5XDjKAqoGqkvBoJac36ClDdHmj0qUXJE
         uVW5nOT8PWEupTstI+3AKsicxKI1ZLvU/m4lRwMngVcrNhGPZWJDr+lZgI+rtpck0v3W
         dPbxDtBpSw3BjOvfu1FXTvVdJW9IfvfjYcSJQa7rcb3rmmHU+ZklxaMDkbOF/XVYrNkO
         +QVYAF3kS9V2AJ5VvkUhslt7luJrNtJJGEo/6l6OFVbvHKB6LDJrDXTX54swxmUd6/uh
         rDHi/ripmsAw9muQirDR/AUfpe3M/RicPoSC1DAB6S2wBGtevmNey6iI+WZh5IEC6bH/
         SsiA==
X-Forwarded-Encrypted: i=1; AJvYcCXdhCveRIaS7hsHauIJV1qBWm6boOjzkTHVuiJjRhfWHRWinV4SKjW+Owahk/ggjcd0UJoHusDL/wkH+lVaEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDHWgIXaRjBN7galwFJMrfDOp/0SQrqkl4lD2+NoGL3qIcaULf
	cFBr+/6MCShEog8uBDgEsbADWMzIZkx32Bpb/E48STyUCJGjv1ljPq9U
X-Gm-Gg: AY/fxX7LYDcUmy17sb/ll1vvl/J+ptDRxM85lhMm4rxLK1ugEywUhyzkX/lk0pTv+Oj
	l8GucHbTfrO+6E7EZMjTQJMYGZ5YRESaElYgOxM8NtDtgoEYnKHVg/tzt61AHOFMsCYpeRwiF44
	bRI0uNT4pTSg+GJ9BKBqbWcHZOen6rQyn/pskTkqWTjzbdxQE+dbPMeTlvRzGwBtVV8+Lx/uiGq
	DQdl9wae7W1SVJFWg37nqpRoLIPtL6FBXwHLzV+2lvKzJQEHZFUcpisc64/RBZrrtTdw+EDowkD
	GMNhsosb3DeT+AFttu+KXxGKQCGlgCZf7Q0LzC2OyRBoN4GytvTbUSO/0iZHnHGBKa/qniHIcbi
	Y6OGgHHUGUyLAbtoCnMaVtdux1GWDE67MbOWQqOd2zCZubYqwrskKLUTXNHdh5dd+W7BrKD35Ge
	8MRkDuCDdJ3+Kjaip5vNVQi5N8YFYskXPizREihrBgF3CncYA4QmFZkLR8Jfcmc85fdO0BDWthk
	g0D+E7MIffoaN5N
X-Google-Smtp-Source: AGHT+IFU5y7W4r3vtwvNrwDt2AEQu7aHNHiFMmS0kmAFCGGtvAOwYmDUlbx4za8//rQD3V+f7QSnfQ==
X-Received: by 2002:a2e:a88a:0:b0:37a:47a4:d5cb with SMTP id 38308e7fff4ca-382eaa05509mr11025441fa.11.1767715996847;
        Tue, 06 Jan 2026 08:13:16 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-180-149.bb.dnainternet.fi. [37.33.180.149])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb91dfbdsm5256091fa.44.2026.01.06.08.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:13:15 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Tue, 06 Jan 2026 18:11:43 +0200
Subject: [PATCH RFC v2 05/11] rust: drm: fix missing owner in
 file_operations
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-this_module_fix-v2-5-842ac026f00b@gmail.com>
References: <20260106-this_module_fix-v2-0-842ac026f00b@gmail.com>
In-Reply-To: <20260106-this_module_fix-v2-0-842ac026f00b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767715983; l=4164;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=Iq8dwvKf4qpl9g//ZJHlBlX2MQk95xnztRt44GtTqZg=;
 b=4PHWmJPXGk2AFwwIRcqeacJX2YPoIRKK6cosxTWftT0EnsRQWaboWc7UTcbG/a5B+Htm208HV
 CyfU+LVXIKuDZ6vKwGOJZZNDvgiPCkSjNODmdz0MFTOv3nPt31QejWD
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
index bdaac839dacc..9980cebec96b 100644
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
+pub(super) const fn create_fops<M: ThisModule>() -> bindings::file_operations {
     let mut fops: bindings::file_operations = pin_init::zeroed();
 
-    fops.owner = core::ptr::null_mut();
+    fops.owner = M::OWNER.as_ptr();
     fops.open = Some(bindings::drm_open);
     fops.release = Some(bindings::drm_release);
     fops.unlocked_ioctl = Some(bindings::drm_ioctl);

-- 
2.43.0

