Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB014F9F7
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750338068; cv=none; b=fHCScggqHDHhZ1+J2BM7IuqxkXzHJQpWGEZacTs7DW18KPK1ihGkj3RHuZCPzoIZgs/PWHc9on5wtImg83o8TtpMVYQ4Fh+XBrlcVCgXLLvAXaKAss9ZnS9XQuoAelrdqP27UsSI4meqRWBHZfBGUyXL2pZgr0ppADW4LFJGKmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750338068; c=relaxed/simple;
	bh=Fb+eo7mMD00G/kYVNIX50aLuR7GCNA1tlFF3IvTl3B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVLJDfSG9Yh8sGQXIR/Fmna6oJytl/exUAbOLCARmIjRk6WU5HqMlA1wLDcNSGSkgA5iymnAG5wulvMNQ2/TpHf6Jlv1aeSgFpt/fmFi16nEmUH2L+0fG+dgWyqd3b5U3TgGwK3hhF8Rl8FrEcu42RcFMfyZ/8UiuakRFx1JrG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTaX4qqj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTaX4qqj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842F2C4CEEA;
	Thu, 19 Jun 2025 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750338067;
	bh=Fb+eo7mMD00G/kYVNIX50aLuR7GCNA1tlFF3IvTl3B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTaX4qqjnmYnKGrgUdNZfjtPgrnCsUce+FpIN0BqsuTq1XNVMPEYR0+L9s6FC7d+/
	 rdNXJ3CJQDKb+YP0ELyv4NhW8rXRw5QfIfMzLmimWx+eK2Vqja5iYw8Ei1dmJYOAVy
	 Pff6wIqHSRN9Zd1RC85U5ve/2Keebulf0vcLoQ3yZW5yv+206MtCpGDBT5NhJwMVRJ
	 ImTJjATlppWCXbuT8q5NFFUDwVBsov+td2sm/GuHuWlWigWwoAsgbE4CDriwBMOCrI
	 E60LCX3SHH1sXcE4rBPR3j57OKfRgSNch1e1lO0TUVwr4GPJj7LfbHmR2inUKMx9Lv
	 7tdT4cZLNqL1A==
Date: Thu, 19 Jun 2025 15:01:01 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
	daniel.almeida@collabora.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
	lyude@redhat.com, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFQKDe1Pks9nJQqt@pollux>
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFPsjIFIC1J2qtdc@pollux>

On Thu, Jun 19, 2025 at 12:55:14PM +0200, Danilo Krummrich wrote:
> On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
> > With the Opaque<T>, the expectations are that Rust should not make any
> > assumptions on the layout or invariants of the wrapped C types.
> > That runs rather counter to ioctl arguments, which must adhere to
> > certain data-layout constraints. By using Opaque<T>, ioctl handlers
> > end up doing unsound castings,
> 
> Which unsound casts? Please see [1] and [2] for how nova implements those IOCTL
> handlers.
> 
> Speaking of which, this patch breaks the build, since it doesn't adjust the
> users of the API, i.e. nova.
> 
> If you want I can post a diff to fix up nova accordingly for you to add to this
> patch.

diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index 7e59a34b830d..7e7d4e2de2fb 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -2,13 +2,11 @@

 use crate::driver::{NovaDevice, NovaDriver};
 use crate::gem::NovaObject;
-use crate::uapi::{GemCreate, GemInfo, Getparam};
 use kernel::{
     alloc::flags::*,
     drm::{self, gem::BaseObject},
     pci,
     prelude::*,
-    types::Opaque,
     uapi,
 };

@@ -26,20 +24,19 @@ impl File {
     /// IOCTL: get_param: Query GPU / driver metadata.
     pub(crate) fn get_param(
         dev: &NovaDevice,
-        getparam: &Opaque<uapi::drm_nova_getparam>,
+        getparam: &mut uapi::drm_nova_getparam,
         _file: &drm::File<File>,
     ) -> Result<u32> {
         let adev = &dev.adev;
         let parent = adev.parent().ok_or(ENOENT)?;
         let pdev: &pci::Device = parent.try_into()?;
-        let getparam: &Getparam = getparam.into();

-        let value = match getparam.param() as u32 {
+        let value = match getparam.param as u32 {
             uapi::NOVA_GETPARAM_VRAM_BAR_SIZE => pdev.resource_len(1)?,
             _ => return Err(EINVAL),
         };

-        getparam.set_value(value);
+        getparam.value = value;

         Ok(0)
     }
@@ -47,13 +44,12 @@ pub(crate) fn get_param(
     /// IOCTL: gem_create: Create a new DRM GEM object.
     pub(crate) fn gem_create(
         dev: &NovaDevice,
-        req: &Opaque<uapi::drm_nova_gem_create>,
+        req: &mut uapi::drm_nova_gem_create,
         file: &drm::File<File>,
     ) -> Result<u32> {
-        let req: &GemCreate = req.into();
-        let obj = NovaObject::new(dev, req.size().try_into()?)?;
+        let obj = NovaObject::new(dev, req.size.try_into()?)?;

-        req.set_handle(obj.create_handle(file)?);
+        req.handle = obj.create_handle(file)?;

         Ok(0)
     }
@@ -61,13 +57,12 @@ pub(crate) fn gem_create(
     /// IOCTL: gem_info: Query GEM metadata.
     pub(crate) fn gem_info(
         _dev: &NovaDevice,
-        req: &Opaque<uapi::drm_nova_gem_info>,
+        req: &mut uapi::drm_nova_gem_info,
         file: &drm::File<File>,
     ) -> Result<u32> {
-        let req: &GemInfo = req.into();
-        let bo = NovaObject::lookup_handle(file, req.handle())?;
+        let bo = NovaObject::lookup_handle(file, req.handle)?;

-        req.set_size(bo.size().try_into()?);
+        req.size = bo.size().try_into()?;

         Ok(0)
     }
diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
index 902876aa14d1..730598defe04 100644
--- a/drivers/gpu/drm/nova/nova.rs
+++ b/drivers/gpu/drm/nova/nova.rs
@@ -5,7 +5,6 @@
 mod driver;
 mod file;
 mod gem;
-mod uapi;

 use crate::driver::NovaDriver;

diff --git a/drivers/gpu/drm/nova/uapi.rs b/drivers/gpu/drm/nova/uapi.rs
deleted file mode 100644
index eb228a58d423..000000000000
--- a/drivers/gpu/drm/nova/uapi.rs
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-use kernel::uapi;
-
-// TODO Work out some common infrastructure to avoid boilerplate code for uAPI abstractions.
-
-macro_rules! define_uapi_abstraction {
-    ($name:ident <= $inner:ty) => {
-        #[repr(transparent)]
-        pub struct $name(::kernel::types::Opaque<$inner>);
-
-        impl ::core::convert::From<&::kernel::types::Opaque<$inner>> for &$name {
-            fn from(value: &::kernel::types::Opaque<$inner>) -> Self {
-                // SAFETY: `Self` is a transparent wrapper of `$inner`.
-                unsafe { ::core::mem::transmute(value) }
-            }
-        }
-    };
-}
-
-define_uapi_abstraction!(Getparam <= uapi::drm_nova_getparam);
-
-impl Getparam {
-    pub fn param(&self) -> u64 {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_getparam`.
-        unsafe { (*self.0.get()).param }
-    }
-
-    pub fn set_value(&self, v: u64) {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_getparam`.
-        unsafe { (*self.0.get()).value = v };
-    }
-}
-
-define_uapi_abstraction!(GemCreate <= uapi::drm_nova_gem_create);
-
-impl GemCreate {
-    pub fn size(&self) -> u64 {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_create`.
-        unsafe { (*self.0.get()).size }
-    }
-
-    pub fn set_handle(&self, handle: u32) {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_create`.
-        unsafe { (*self.0.get()).handle = handle };
-    }
-}
-
-define_uapi_abstraction!(GemInfo <= uapi::drm_nova_gem_info);
-
-impl GemInfo {
-    pub fn handle(&self) -> u32 {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_info`.
-        unsafe { (*self.0.get()).handle }
-    }
-
-    pub fn set_size(&self, size: u64) {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_info`.
-        unsafe { (*self.0.get()).size = size };
-    }
-}
