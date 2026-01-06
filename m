Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BC12E041D
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715995; cv=none; b=PPgX7o1oBI1XHSCDK4s1Tg7PXK39WePG+9mgeDvdDAXmvH5T13Yi4P8KNEgzVSizDNZPZ94IL9ZvF7WD/R2eHklN+iMLNNgSOFq9c92a2Vbvs7VYpiNAVZR4P08ABs8s36wQtYIss4iPoRzhq2yUukP8RO+1Zaqrp5X9+NtEzsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715995; c=relaxed/simple;
	bh=891dg5NeMMgINCtxfUx5z2GhTLzUtO+bREujFmK9Vxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFTo0g97LO8n9YezhD0l7nZO3AMrfSGiObd8+y77HWNaO+Jah/KV8PqT9vvsBxZDTMMwtUWxq92+zifr+JDRQOQcstw/MPByI/J4Wr2YR3ln4Mgg882HSSBj4xzjMog0HtImcwnCFv4Gai5mViTPUF/9K5ds7Y5hW/IarEqhnb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldu++Ps4; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldu++Ps4"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37b9d8122fdso8851911fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 08:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767715991; x=1768320791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SI0sZ7uVNTRnuO/8Ld3c5O3KKGDZMWG55LzxmtwZszI=;
        b=ldu++Ps44zc7q53vPwr67A5C/YUHDRRHIknPwGDZFvgN6MCdczym6TRGrzGiV/dPb3
         E2Tz2usQgfl431x6YYsDhbotP4eOAItpgWJIMHWym2W1yet15nTDGAChTfd2ysDv1mvG
         VQ15EZyc0zXZ6KxV4gf9I2Yj0Z1J/OFkjT+Jo2SO+2yGfCFsNhXpwAPDIiqrPJo5uiPk
         h0NwIi80fU0FcfmO7q5BtVF25MMYkb8LigHM65Uau9ziaO4yT/QJX7Mm7bqTQMpl5a2l
         rwIXIcYi9C/Wzm2LQpnBR5y5zmDQL7l9/wbb0EuY/4ormYAm5Gxk/CEjfqC8lZWMtEeD
         dHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715991; x=1768320791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SI0sZ7uVNTRnuO/8Ld3c5O3KKGDZMWG55LzxmtwZszI=;
        b=GS2T/EWewMrItG9iiTgdC/qwSgrhzrk3iYsdnVW/2KEQRuhzY/gNYL9wsjabDuFnjM
         iUSzzTwX4a0X4wsgQLbZOaijqhckRAhWyXBw7riZ+6xiCpXdJLM+s9OLzEa6Xi7ZxKT8
         9qyBrTH0W5AVfGyucnxE4SAR8q6eOMb/SqHnqZVV1zQ962scaIXGLcQtKlq6Ms7ZbIyE
         qHLHL9mNQVBLaVsNrrCdRBmapGt1OuWxMiWjtTJTn55VAZ866SigUwq6+2tHg6btvoE3
         /Z4tRJ2JavFuawkF6mj1gs43qwhW6svZetwNaV1vC8FgLlCWYY35KrURxdIY3Q+lFrku
         hhXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc6kLs2yb3e+dnE1QkWw/vZnXwMurqSEgSpiaa87Mt++G5FhaVvE7UsKmGmMWE3t5+cCMiIqRnemeu3opvhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGM0ltybdJaVB3WEFFK/TULJzaJMaQWwvJuwF6Fyn+k/sRoCAC
	zwA4zQuxLudoR+YoljQn5K9ks3NTddaNBdMwIPeKjxCKcgP/83X+Tz0j
X-Gm-Gg: AY/fxX5T5nMilJRIpehGRksmc3daguSowt12sQ4Jj/reuUmc+LSVOmYmVfsZfGMv+qc
	9aKlWyNrI1bk/2UC+QVSctJLH5gLXRw9RmpYUB8uwjpCnciAua7QknGdbE94UqqMpOkOdOErubq
	MOgrkZXOcFWR0kCUpXrejoB43uWpxVrm0bLfx55WpcVzRMImkHVu0Fz15JKknqqz2tE1a0ly3/W
	P7bla/hNwUqXQfXe8m+/TChD66QlRD520YB3be1NcLjPAW1vbotW96w36zH0RZ9ZdKfgXSfwMyE
	kzWcZsSxmfBUIM7P8BO1/sxoXRmVqZ5RZthdiUECdny2/7/FpQoeR44IJLaQjcRIJpFT16Euriy
	BpcdM+WwekTQrOuL9hPnP0KcHgbQAloLHLsWzNr0/UyZunZAFE9/yAUHgBnvuuzufBz3hiInF0s
	CpPKjLuDSIrCvDH4CU+1A00p1z8cRltnYUFve8xqd5Lv8NHRgMCXEtbfDrodkDSr/7kz8TnZedY
	7jhvry6wXQ9VjWp
X-Google-Smtp-Source: AGHT+IExWVexzUnKcxTwfYgOYf3r4tTgS0aisp7MxRHoeqvXnsdWfpbBK/qR84vqvGxwAzpgZN+KnA==
X-Received: by 2002:a2e:a905:0:b0:382:5178:3e96 with SMTP id 38308e7fff4ca-382eaac9c85mr12054861fa.29.1767715991373;
        Tue, 06 Jan 2026 08:13:11 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-180-149.bb.dnainternet.fi. [37.33.180.149])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb91dfbdsm5256091fa.44.2026.01.06.08.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:13:10 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Tue, 06 Jan 2026 18:11:41 +0200
Subject: [PATCH RFC v2 03/11] rust: miscdevice: fix use after free because
 missing .owner
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-this_module_fix-v2-3-842ac026f00b@gmail.com>
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
 Kari Argillander <kari.argillander@gmail.com>, 
 Youseok Yang <ileixe@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767715983; l=2370;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=891dg5NeMMgINCtxfUx5z2GhTLzUtO+bREujFmK9Vxo=;
 b=XTB+sVOL63dP4+VWC+iJBYkzCmbAeMtvvB++kKg5rg1gpSNNQmkqwSCagBJoh3NsSq0qwA4nQ
 VI5WDjBJtTIDa6b1hFQyngjY104t7ooXovgREEee0nWRpTUeFWWqvFb
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

Currently if miscdevice driver is compiled as module it can cause use
after free when unloading. To reproduce problem with Rust sample driver
we can do:

    tail -f /dev/rust-misc-device
    # And same time as device is open
    sudo rmmod rust_misc_device_module

This will crash system. Fix is to have .owner field filled with module
information. We pass this owner information through vtable.

Reported-by: Youseok Yang <ileixe@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1182
Fixes: f893691e7426 ("rust: miscdevice: add base miscdevice abstraction")
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 rust/kernel/miscdevice.rs        | 5 +++++
 samples/rust/rust_misc_device.rs | 1 +
 2 files changed, 6 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index ba64c8a858f0..d4b0c35c4b60 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -18,6 +18,7 @@
     mm::virt::VmaNew,
     prelude::*,
     seq_file::SeqFile,
+    this_module::ThisModule,
     types::{ForeignOwnable, Opaque},
 };
 use core::{marker::PhantomData, pin::Pin};
@@ -112,6 +113,9 @@ fn drop(self: Pin<&mut Self>) {
 /// Trait implemented by the private data of an open misc device.
 #[vtable]
 pub trait MiscDevice: Sized {
+    /// Module ownership for this device, provided via `THIS_MODULE`.
+    type ThisModule: ThisModule;
+
     /// What kind of pointer should `Self` be wrapped in.
     type Ptr: ForeignOwnable + Send + Sync;
 
@@ -388,6 +392,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
     }
 
     const VTABLE: bindings::file_operations = bindings::file_operations {
+        owner: T::ThisModule::OWNER.as_ptr(),
         open: Some(Self::open),
         release: Some(Self::release),
         mmap: if T::HAS_MMAP { Some(Self::mmap) } else { None },
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 49dd5814e1ab..464e3026e6e3 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -155,6 +155,7 @@ struct RustMiscDevice {
 
 #[vtable]
 impl MiscDevice for RustMiscDevice {
+    type ThisModule = THIS_MODULE;
     type Ptr = Pin<KBox<Self>>;
 
     fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {

-- 
2.43.0

