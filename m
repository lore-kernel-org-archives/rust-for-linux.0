Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CEE2FDC5C
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940950; cv=none; b=pXYqN33ymgQXca4OHLjsbdjEbkm7UA/Mdm9447MtDRj+77snhtQYDD84svpwYsaJfFnoFKlwcHpgWmKsqhdIJLJdARvKkzeIE1qDHs6Qtpf3wKgO+o/QXR7ZHW3FKK/X2iF437e/rcM1ndE5XtLZMI2KE/a3jvDvmwOZ3Jx/8js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940950; c=relaxed/simple;
	bh=JnroIx5Mod0LvWzfxsHi8lC2HMAygcMfxnURZ1dW9Z0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hUpECMKd5TdLE1SoFu7gq6/dqycyCNounuYTTmut+6Ikg/vLD6UFKV9pgFZqWaHRwLwKgiKI+oTfZX1QJA+KDrYO1DamKZ5rVJbUuYhPMV1wHWmU4euzPubTNYWUMqhrxVsXr5uF+bnqce9Vwv91I7iMcodhY9519ZGFZvwbIeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vVpr7Ih1; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vVpr7Ih1"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6411fc67650so691729a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 01:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762940946; x=1763545746; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XgfDsUZ638nSlM9QsO/BjlaImnMhRtBDf+7UnlFjNC8=;
        b=vVpr7Ih1G7xxs1FHFMg7hvv0X/u7djAzPcXsNyEeLACQW3st1YpMcLSfjEp1l1OonA
         HTS3ScdqNMZ6+jzHEP8lMpcp3bRBP6xsgLMhGDAIcax5p8nXL9+jKXTyqWnFc96aHB2K
         A5QE0HrNWTulQkcCXWO0xcUaAes3DqKtOS6aTwkeUrDRg75fBPahC3YzBSG0GmgFK1eJ
         uz1i7YOMf4tORRZFbXr2DiZeCRoZdITml6ZlvhdAgeQXS2VQQuxqICAxQyVEF7krnFWh
         O/UYZ8xsX85dHBsmQaZlIZx81C7wnz0wPuzXmgNlwE20Ru0gF5q37ZXuAAtXzjt9rbl2
         KiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762940946; x=1763545746;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XgfDsUZ638nSlM9QsO/BjlaImnMhRtBDf+7UnlFjNC8=;
        b=MRPL4AbwahoHl6jwyWObp7SwkvMji0KasII2Ud5+t1FbzOkwn97+W9VHHpQTIQ7KqV
         KDbbozluLGqv7Jky+s9X2qeHbMXNx2nx6Llj3ricQg+y/aotIEHRO0eX1HRNS9au1TY+
         D51dUVcfZnYSDhaA6oazVjZMZNIGjMw2p93W9sIayG3l9bEcaQfuVKJJlP2f65U366UN
         /IltZshMv0v2O0WHIvYrcxezS8y/5lao6ltuJVF8uAC9reaiYvIDUWmztrNkg6+YoVzs
         Rv5uF7RtyllvBepXUd8EsDkuSj4onik8Zteq+fO5cab0V6kztSK7/UID69uybT1YizI0
         friw==
X-Forwarded-Encrypted: i=1; AJvYcCXvBOaCKz9oJMWUNxS/h6b2rBZV+h6AHcxDBhdPp2HEXNwJDk+jjVXdsYF9l88Dv6/Fhqz7skTCKsY+A1AVeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCcxAGjRaUi7wu86I13dtsy3d5s/oMq3QMXYTJRRkJFPANsSGP
	uGINQa7ZvzvKItCbeCirQVqR8mEwMuOwn3PsBjoucMcJLf3GU3l7t9E7iHDYL0fuCbDk9XmXtYe
	hnQcI45UtjTjGal1GiA==
X-Google-Smtp-Source: AGHT+IE+cjLYnTFZuo5v6gTqC7tY+9gCgCj3XFCBabgexAOsp/gnMC81dLElIaB5dX/oUzHAaCm70diaCOcjx8M=
X-Received: from edhs12.prod.google.com ([2002:a50:8dcc:0:b0:643:12a9:41aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:518d:b0:640:af04:d71d with SMTP id 4fb4d7f45d1cf-6431a530103mr2083350a12.22.1762940945677;
 Wed, 12 Nov 2025 01:49:05 -0800 (PST)
Date: Wed, 12 Nov 2025 09:48:35 +0000
In-Reply-To: <20251112-resource-phys-typedefs-v2-0-538307384f82@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251112-resource-phys-typedefs-v2-0-538307384f82@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4678; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=JnroIx5Mod0LvWzfxsHi8lC2HMAygcMfxnURZ1dW9Z0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpFFgMvhta5ZE+nVzvbAWjQ6Bmf4qj5MzJLHNql
 Vvajde1Zy6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaRRYDAAKCRAEWL7uWMY5
 RoltD/4gZDgFyfkmyIQ8jz86Sq14oRcj4YA9tYmTwoVN1CNa0xK19cl2/YssVaGvVJxNcrFmImO
 X80ej0I0zG+N35qE9MRyjp7qUtarjOuVT2FKZtQi9EEtO4dipnF5LukHnEm4qrU1e9Eu3ML6x/0
 mnqNVazTZYVsrshwe8rYpA5mYMCmapfaF/43rzAJarZD/cqEAlRD8Lg+JWsUsDj9KCFO4dras+e
 7C6t/f1dRVt2fs0+hYv+sjqlA6AXvL0HY0/CYmF3nD1UKg8FftxzaJGvhwFDR7thPD7G5xlYEVi
 YXOOW0Mo9FLTi4UwCz9gY+7uT8SC8ZaWLsTv8slejFqpgFp6ITYWlxAFwi0Xw2u5+Y7Or1wquv3
 j8hACH5nreHi4yUGKkzaVcYYZTEn4jMJqBS+GQGIZsxAQ1bG93z7+EVkE3iVH64PpADt3AeiOzr
 c7fVEe4qsBqRbFK0lHt847m0x/GNejvgS2PUnuKcKPlqf0guND8h120c+eQ3f0fV+8NvG57WSBH
 fjjjrIqrBEVvU8ySKVS/O3/EgtSzTBkKB80YAojHF8Y8Rdst/ZdpOfvpqRKoJ8z/szWMzUu/x+I
 RCaXvjlYMJupB0eimvFU2Q19Nkx5LKWWVxaozUnvB6gKZHgIkMAu1AbhH2cASzPLHr87k1Ceg8t BjyyHxyV1Vo33Hw==
X-Mailer: b4 0.14.2
Message-ID: <20251112-resource-phys-typedefs-v2-4-538307384f82@google.com>
Subject: [PATCH v2 4/4] rust: io: add typedef for phys_addr_t
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

The C typedef phys_addr_t is missing an analogue in Rust, meaning that
we end up using bindings::phys_addr_t or ResourceSize as a replacement
in various places throughout the kernel. Fix that by introducing a new
typedef on the Rust side. Place it next to the existing ResourceSize
typedef since they're quite related to each other.

Cc: stable@vger.kernel.org # for v6.18
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/devres.rs      | 18 +++++++++++++++---
 rust/kernel/io.rs          | 20 +++++++++++++++++---
 rust/kernel/io/resource.rs |  9 ++++++---
 3 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 10a6a17898541d4a0f01af41f68e3ab3d6bb0aca..e01e0d36702d38e9530a2fa4be884c935c6b5d0c 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -52,8 +52,20 @@ struct Inner<T: Send> {
 /// # Examples
 ///
 /// ```no_run
-/// # use kernel::{bindings, device::{Bound, Device}, devres::Devres, io::{Io, IoRaw}};
-/// # use core::ops::Deref;
+/// use kernel::{
+///     bindings,
+///     device::{
+///         Bound,
+///         Device,
+///     },
+///     devres::Devres,
+///     io::{
+///         Io,
+///         IoRaw,
+///         PhysAddr,
+///     },
+/// };
+/// use core::ops::Deref;
 ///
 /// // See also [`pci::Bar`] for a real example.
 /// struct IoMem<const SIZE: usize>(IoRaw<SIZE>);
@@ -66,7 +78,7 @@ struct Inner<T: Send> {
 ///     unsafe fn new(paddr: usize) -> Result<Self>{
 ///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
 ///         // valid for `ioremap`.
-///         let addr = unsafe { bindings::ioremap(paddr as bindings::phys_addr_t, SIZE) };
+///         let addr = unsafe { bindings::ioremap(paddr as PhysAddr, SIZE) };
 ///         if addr.is_null() {
 ///             return Err(ENOMEM);
 ///         }
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 6465ea94e85d689aef1f9031a4a5cc9505b9af6e..56a435eb14e3a1ce72dd58b88cbf296041f1703e 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -13,6 +13,12 @@
 
 pub use resource::Resource;
 
+/// Physical address type.
+///
+/// This is a type alias to either `u32` or `u64` depending on the config option
+/// `CONFIG_PHYS_ADDR_T_64BIT`, and it can be a u64 even on 32-bit architectures.
+pub type PhysAddr = bindings::phys_addr_t;
+
 /// Resource Size type.
 ///
 /// This is a type alias to either `u32` or `u64` depending on the config option
@@ -68,8 +74,16 @@ pub fn maxsize(&self) -> usize {
 /// # Examples
 ///
 /// ```no_run
-/// # use kernel::{bindings, ffi::c_void, io::{Io, IoRaw}};
-/// # use core::ops::Deref;
+/// use kernel::{
+///     bindings,
+///     ffi::c_void,
+///     io::{
+///         Io,
+///         IoRaw,
+///         PhysAddr,
+///     },
+/// };
+/// use core::ops::Deref;
 ///
 /// // See also [`pci::Bar`] for a real example.
 /// struct IoMem<const SIZE: usize>(IoRaw<SIZE>);
@@ -82,7 +96,7 @@ pub fn maxsize(&self) -> usize {
 ///     unsafe fn new(paddr: usize) -> Result<Self>{
 ///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
 ///         // valid for `ioremap`.
-///         let addr = unsafe { bindings::ioremap(paddr as bindings::phys_addr_t, SIZE) };
+///         let addr = unsafe { bindings::ioremap(paddr as PhysAddr, SIZE) };
 ///         if addr.is_null() {
 ///             return Err(ENOMEM);
 ///         }
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index 7fed41fc20307fa7ce230da4b7841743631c965e..0e86ee9c98d840b44b8f8953f83d31612fdaea46 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -12,7 +12,10 @@
 use crate::str::{CStr, CString};
 use crate::types::Opaque;
 
-pub use super::ResourceSize;
+pub use super::{
+    PhysAddr,
+    ResourceSize, //
+};
 
 /// A region allocated from a parent [`Resource`].
 ///
@@ -93,7 +96,7 @@ impl Resource {
     /// the region, or a part of it, is already in use.
     pub fn request_region(
         &self,
-        start: ResourceSize,
+        start: PhysAddr,
         size: ResourceSize,
         name: CString,
         flags: Flags,
@@ -127,7 +130,7 @@ pub fn size(&self) -> ResourceSize {
     }
 
     /// Returns the start address of the resource.
-    pub fn start(&self) -> ResourceSize {
+    pub fn start(&self) -> PhysAddr {
         let inner = self.0.get();
         // SAFETY: Safe as per the invariants of `Resource`.
         unsafe { (*inner).start }

-- 
2.51.2.1041.gc1ab5b90ca-goog

