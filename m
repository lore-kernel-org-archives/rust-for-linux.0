Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EA0328B46
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762430959; cv=none; b=JiVCUZP3BV/A73cqAvQXolVm6fEo0WEXrIl82Thj7l+P+ht65XOqeFUjKDx+GkjIvRfCtpH1sqzT3CBTuQFyY7xbDHdL0T6N2DrdVtxkjTt6oq/+BgKevTaJSZwBJL/9RK4gSe5DfgAJOmxYVgUItSvL9M5/3S3m+nGcZhAf1ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762430959; c=relaxed/simple;
	bh=N05CdPPb9ETL4l1CnNbsvW0DFUOjIo2ix3kfvkTeeCc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k4Qn/SyjJ0fRKhuJSqTDEpP/ndZVGG5KzgWMwj5SR2lUUbC8KmyeODkVwJvs5yCh2fiYWiLWwCQQTF0LDZjfGCnUwTyDPdaycKKya6ZQ9zwcsIb6djUtcmw20GrjGQ2j6k3YgYU6WO29YGNlug2F4EeMJXTWyvzi8RMDakZSX9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DvbGdzwg; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DvbGdzwg"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b726b7d1f1cso70180666b.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 04:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762430956; x=1763035756; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QLAnUrDI2pvarEVlAqbKGGVmDyTWyIE6rE0vKb5WBQQ=;
        b=DvbGdzwg/eyyHFEm8BYHxpsKo01dfzH46NjjEIAF4ZNuU9IMcB9GyhgAbWBTFhI2mi
         LTQ0/2f+14CVf8X0mLBENM4ezqsrWYKz8eaZSZYkSMxIDj0/wmGR7eG3jSu6eJ5bnTPy
         m5li7XNcwJ6fSP9jm+LYBrHU7cu6bvVf+J/cK9liKVn1yESfQ6lDs14vy+zXnEVd4l+F
         rG9VkqW8C0vbLnMk/8bVx3CoxWiEZ6Zn4dIJ3svdBJ5Kk/sj5aRJ1YItGrN39+OjZkel
         Iltd7XHNJZBOWlAcrefRRYciL6JtA4EE3A5YNnMCMpMvgPlm9Lbmg16cSIMmHU17BGs7
         WNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762430956; x=1763035756;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLAnUrDI2pvarEVlAqbKGGVmDyTWyIE6rE0vKb5WBQQ=;
        b=MmP2NanQUIbdWhyTIAcsG8YtZ/E0SkXKXNNd1Jq0n9O1tfLFokh9uX7eaLFwLC5cN/
         Cu9ShpIfVbfo8cCSyL9r1PqSPHUMjzovqhh7yhmWndmUtez5Nbgs9MVq35zXLcZLhyGh
         jQOjXvZYxSEuy2kypza7Ey8VXw+J4DzQm5fNkyp5wq5MWa1rC1qPVIaTtbXDa++SK2H1
         rqj/uTFTrrtmb4to3cYtpLcoVBTA0pROC3WnegRMf4Sar6/juknLoisLiYICl1irznYu
         5Bz2xlwFQfpc+WsffCq/rFCqlV1lMs25F6CsZjj8kH7ZTksfnmXiMTWhIJ5iLp/EOwMG
         JccQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvYPmgPQ7co6dqJEV42CJuPNKdC3SgpK6YU5SEu5e4MpuSIv8uBV7+JbbgoBT1nwPdnuZ7g6NKBN/HKX4hTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd+WYmwkiRF6t7NXA6AvCQB23ZQFRoYPVqPNV/8yErHOejnug3
	UAyYUcfhbMipYL7jzGe7NI3Gk3/nSiA6fdh+LnlqSItv6PDfT9REtN4sK09bKuR/71tPXBiRL8k
	chMGLsdNstC3NLC0c3g==
X-Google-Smtp-Source: AGHT+IHZKqqI2XUnv1NqDn2nFtMCabo5jj2vf8iQOxGK0AI5f769IUV6PRuiKrcsKGUscO20SxePO1gXrhAmLq8=
X-Received: from ejcre5.prod.google.com ([2002:a17:907:a2c5:b0:b70:b6ce:57a8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:26ce:b0:b70:4757:eb01 with SMTP id a640c23a62f3a-b72654ce415mr682874866b.32.1762430955652;
 Thu, 06 Nov 2025 04:09:15 -0800 (PST)
Date: Thu, 06 Nov 2025 12:09:02 +0000
In-Reply-To: <20251106-resource-phys-typedefs-v1-0-0c0edc7301ce@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251106-resource-phys-typedefs-v1-0-0c0edc7301ce@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4638; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=N05CdPPb9ETL4l1CnNbsvW0DFUOjIo2ix3kfvkTeeCc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpDI/mVsDWdH65xZZn0wJf/1RF4wWgKuZEvMdiG
 VquKb2PwfmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaQyP5gAKCRAEWL7uWMY5
 RumYD/sHpobC8Tj/jMQH5LPcsb9Ubds4RBkAdtKQxvMttfZPvjXUyzmfZce14LgEWE4V1kLRDsU
 gZrbGW4u2mb0IpcRpkKDZz3DowMuh1tX0Nn/+2xJ0Dn+oov3553j5cXBO3fPoThhWvxaJ4zlb4t
 wcxfBYCmyK/NyvfHOun6F+Mu4FhFAmMcY51vTglSyHOJ54VyOvBLeiVTUpf8joPwnQRuH5slaAb
 sXOO82yccX1CU3aKF5GchQGG1C/Af+u0BePT3rER1zbv5yaLZ/PWDyjuRZOQZwHZ2NalV3gcj20
 WIqK1zowXfOYofFQ9qhNIlQDV/ZCpMB/YQdBd2kl85ztjseJtREj0tC12oLfmbG0V+TYTeh9qFY
 YnDuK7bJdOco2m8jtnfW6DiqI7IdZ/4FZeXrrd5anxCKIhaV4GkqYu+qNC/qVb/3raInEXAcjtP
 ntuxDtK5wGoFwzrK6P18BrMQqKuqihJ4ywflxLhoea2hWaGT28Q2AOZ8gRE/9RhPZytbNJEZGpZ
 lkxVsRzqDDi1L0ex9Y/An/CnW2HFqVBB/ZBfV7IUq9XShkgvuepUu0E+0WJVl/+E42nWAh3+LyM
 Q0176J+kGY3TY/sJuBritWrTYWG+CmB26jzhYQ5AVzC4OBgYj252mkGGxTNXAvCQgR35pzIzDyp 3drIolvaqL9X9KQ==
X-Mailer: b4 0.14.2
Message-ID: <20251106-resource-phys-typedefs-v1-4-0c0edc7301ce@google.com>
Subject: [PATCH 4/4] rust: io: add typedef for phys_addr_t
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The C typedef phys_addr_t is missing an analogue in Rust, meaning that
we end up using bindings::phys_addr_t or ResourceSize as a replacement
in various places throughout the kernel. Fix that by introducing a new
typedef on the Rust side. Place it next to the existing ResourceSize
typedef since they're quite related to each other.

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
index 7fed41fc20307fa7ce230da4b7841743631c965e..5d9d9f01d91c3b8b13e4837d4fb19a786d7720c8 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -12,7 +12,10 @@
 use crate::str::{CStr, CString};
 use crate::types::Opaque;
 
-pub use super::ResourceSize;
+pub use super::{
+    PhysAddr,
+    ResourceSize, \\
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
2.51.2.1026.g39e6a42477-goog

