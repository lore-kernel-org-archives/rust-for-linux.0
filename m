Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E1F19F42D
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Jun 2025 03:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750909361; cv=none; b=gDGd4+6VFPJqstW3WRKKx+UXiPJrccC8gqoTIljs4O8vWUC6mdr22oy4h8yzzbcPj1rLyiYdRtWX9qSmNO2EhuChCEA1SU1VbSQFrgROJK0WRJrqepA03fzebW1bNxcDnPVzyapyu6K2NiS6l0RIRRTEZO6AnYg7aUQOQzRP1MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750909361; c=relaxed/simple;
	bh=ziz5RaIHjUmXzirMJ9t2zMO3ma04CAh9yvpjFBg+j6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5c+atyrMkMA9pqSP4EnwUL/8/raii9HOjlQn1w8cOeMpArmzggx05DbVHBWqR+tyWCvR84dPvakIgj7oi9bQXziQpiQQPWJ3THeJ2y/5yaCpPup2M0CXl59+EneKKjLoYeJIHmKxOCHrY6uI7srlZCbwLSvO/yux8OPY7AH8Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWuhwIxO; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWuhwIxO"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a6f6d07bb5so7362281cf.2
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jun 2025 20:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750909358; x=1751514158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3liawWZctXs7keSPhZo5W3GQUl0iBuavz+nLQeEcPG8=;
        b=OWuhwIxOF19c5yizTu9dXyU/4+RH9Q4Pc2Dl8nj1Vubjcv3l2JklM9rI9dYp7XUWh1
         vjLnFVZI3ACVtZ9DolSeDglVFlB5Q5KAWZseT7tntqn1u8byQhA712JfIhsvQtJkWhTN
         MHYXuhBJXFkm8SPCvJbGRhhmwlZo7pfEj9FvkrKw6rBCYkus2vGY+QyiDL8RqyWRKRHO
         4TrCJ/iyu90bHYHskNTaBBULhYa8YwMuk3YPD/XMnqJaQDHTHrp8XDr5gR3wuHRDqCH6
         2ythiSkSduBXw+gaSSW0z908LCTWMpU1+SIIvUhZ5ErkDthgd82hMdKPBzaBV+TtflzB
         oG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750909358; x=1751514158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3liawWZctXs7keSPhZo5W3GQUl0iBuavz+nLQeEcPG8=;
        b=tGDcvR+XNqyAt/S73p/qpqhzYZZ+zncczsTgntghjg5D7nm+w51DRQa5Vioi8FF76Z
         33TTW1YwdHcV2FlC52c0IVOYE/VmKO6LGzLLwEcIreH9kW+5lCa2jIg9tMAzyHsxT/Tx
         LRbDKv5yNNWqOLeKqapPdiQThuR5/6AFw7fn3yeMXBodWecU8bLJHwJ0qdvmOBhMhiw+
         ow4CWxwf9kGtxKlof5/nVB/5kUysTz7FPYgbD7hakfxrn6VMOb4Gb7ESgFsLIzduWrbS
         DEwdyucg+fysjS3P20GUC3YO7T5osaDs2pO9W+BToqgfOiNq+WhXkzMwPsjvHB1Jcp/V
         bB2w==
X-Forwarded-Encrypted: i=1; AJvYcCWEe2avVjuZ5JHPg+SaXv1dSnZNtu6I+/8w/XkmUNGVWbGOJf6ks8y7E631AYmC8WsWpfPW+j1hxXN9P/6now==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFnTQOibMOEYeJDtYi6AhtobWskQ+NMxpfR2jlc79nzI2O1jNo
	8V3C90Q05Kmhnh6SvAnUFES+tXjZCwsq3KRjRti7u0rUnj4QusmmOmx+
X-Gm-Gg: ASbGnctvqNNUhF6TB1KdBFmwF3w+0kbusksIGUU3B/andbSSnawU0o04PbNNU6i6dd3
	OZ79/t1Bwz57KvAaA962U5/k2BZSD0T7EzpbPCCC+LahBVqaD6zc7sU9MYCtR7Ci1htxNcNa3F8
	/AObTRFJ3GgSMKSFA+4aYBF7NkS9DbOAbWfJg61530dpZfCaNGzsJfLWlNUiDVF/RVRM5QczQAs
	Mr/QUQ+tj2O8lAgyaRV5WU/8tUiQI/cPAyDiPSPAkn1I4SBTnQTBFw37M8fejAgKG/DNvm0xjxj
	f9/bzplsqb63+FCqXEBSx+VbfrIfnXMM8YVekodApX499hH/EpXHn3/Tmyt5M/TKMowaXfEHfk5
	0HjWE+hVL/KKK6/Uf+Xk15iOyPOSWfMHE7mrLWpiQ8rRq0aRa38fg
X-Google-Smtp-Source: AGHT+IFhhwRvlnji45uC2Dtp9KaiTKyb5Stv70eMaFEe1Wr/Xy7cLd1PkADT73suamYikUi7ELZa4w==
X-Received: by 2002:a05:622a:2611:b0:4a7:14c3:7405 with SMTP id d75a77b69052e-4a7c07d4cf2mr107582861cf.27.1750909358053;
        Wed, 25 Jun 2025 20:42:38 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d672f6sm67750101cf.27.2025.06.25.20.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 20:42:37 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 05400F40066;
	Wed, 25 Jun 2025 23:42:37 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 25 Jun 2025 23:42:37 -0400
X-ME-Sender: <xms:rMFcaD5BdUPjrtAh5aOxRjF_iLdRO-hxNTiqfRPNKbnZgm2e6vEe_w>
    <xme:rMFcaI6XqELPHFIhvtaz37h7hihLLQ0j7zTnx3tz1dT9kRKZ2xbaMeVy2tzfzZqKv
    ZVKnA_wunb9YF9p6Q>
X-ME-Received: <xmr:rMFcaKdzOqw2NHmYJy7B0GVPNmCZtA7qrtbJ2JW43Vghs6irOyvfNzZeZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvgeehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    udeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsvggrthgrrdhmihgthhgrlh
    hskhgrsegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtth
    hopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhes
    ghhoohhglhgvrdgtohhmpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtoh
    hllhgrsghorhgrrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvght
    pdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtg
    hpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rMFcaEK0oo0zlHzCXKcyG9qLhXYVgKA3pvoSkUtDQvKhN8Ja4L32TQ>
    <xmx:rMFcaHLQVSEhKlQNKz_9JCrNP-VkwoEzjlUfLA6PoSJmkUtpoQuA6Q>
    <xmx:rMFcaNzIztB8Gegt3cMyIl33klVJzmM3M4v00BefVQok6wQlA8wHTA>
    <xmx:rMFcaDK_7hUsd1j5ZfV9pHBEO4wbwZBPw1tfS3JUOl91Fm6P9cTPNw>
    <xmx:rcFcaCYhN305NErnbZx_pqfampNke6-guDhSERvjtsVTglYZoi0KvRcE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 23:42:36 -0400 (EDT)
Date: Wed, 25 Jun 2025 20:42:35 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, dakr@kernel.org,
	aliceryhl@google.com, daniel.almeida@collabora.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
	lyude@redhat.com, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFzBq4wDVbLFry6z@Mac.home>
References: <20250625081333.2217887-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625081333.2217887-1-beata.michalska@arm.com>

Hi Beata,

On Wed, Jun 25, 2025 at 10:13:33AM +0200, Beata Michalska wrote:
> With the Opaque<T>, the expectations are that Rust should not
> make any assumptions on the layout or invariants of the wrapped
> C types. That runs rather counter to ioctl arguments, which must
> adhere to certain data-layout constraits. By using Opaque<T>,
> ioctl handlers are forced to use unsafe code where none is acually
> needed. This adds needless complexity and maintenance overhead,
> brining no safety benefits.
> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> ---

Appreciate it if you could put a change log here mentioning changes
between each version.

>  drivers/gpu/drm/nova/file.rs | 23 ++++++--------
>  drivers/gpu/drm/nova/nova.rs |  1 -
>  drivers/gpu/drm/nova/uapi.rs | 61 ------------------------------------
>  rust/kernel/drm/ioctl.rs     | 11 ++++---
>  4 files changed, 16 insertions(+), 80 deletions(-)
>  delete mode 100644 drivers/gpu/drm/nova/uapi.rs
> 
> diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
> index 7e59a34b830d..7e7d4e2de2fb 100644
> --- a/drivers/gpu/drm/nova/file.rs
> +++ b/drivers/gpu/drm/nova/file.rs
> @@ -2,13 +2,11 @@
>  
>  use crate::driver::{NovaDevice, NovaDriver};
>  use crate::gem::NovaObject;
> -use crate::uapi::{GemCreate, GemInfo, Getparam};
>  use kernel::{
>      alloc::flags::*,
>      drm::{self, gem::BaseObject},
>      pci,
>      prelude::*,
> -    types::Opaque,
>      uapi,
>  };
>  
> @@ -26,20 +24,19 @@ impl File {
>      /// IOCTL: get_param: Query GPU / driver metadata.
>      pub(crate) fn get_param(
>          dev: &NovaDevice,
> -        getparam: &Opaque<uapi::drm_nova_getparam>,
> +        getparam: &mut uapi::drm_nova_getparam,
>          _file: &drm::File<File>,
>      ) -> Result<u32> {
>          let adev = &dev.adev;
>          let parent = adev.parent().ok_or(ENOENT)?;
>          let pdev: &pci::Device = parent.try_into()?;
> -        let getparam: &Getparam = getparam.into();
>  
> -        let value = match getparam.param() as u32 {
> +        let value = match getparam.param as u32 {
>              uapi::NOVA_GETPARAM_VRAM_BAR_SIZE => pdev.resource_len(1)?,
>              _ => return Err(EINVAL),
>          };
>  
> -        getparam.set_value(value);
> +        getparam.value = value;
>  
>          Ok(0)
>      }
> @@ -47,13 +44,12 @@ pub(crate) fn get_param(
>      /// IOCTL: gem_create: Create a new DRM GEM object.
>      pub(crate) fn gem_create(
>          dev: &NovaDevice,
> -        req: &Opaque<uapi::drm_nova_gem_create>,
> +        req: &mut uapi::drm_nova_gem_create,
>          file: &drm::File<File>,
>      ) -> Result<u32> {
> -        let req: &GemCreate = req.into();
> -        let obj = NovaObject::new(dev, req.size().try_into()?)?;
> +        let obj = NovaObject::new(dev, req.size.try_into()?)?;
>  
> -        req.set_handle(obj.create_handle(file)?);
> +        req.handle = obj.create_handle(file)?;
>  
>          Ok(0)
>      }
> @@ -61,13 +57,12 @@ pub(crate) fn gem_create(
>      /// IOCTL: gem_info: Query GEM metadata.
>      pub(crate) fn gem_info(
>          _dev: &NovaDevice,
> -        req: &Opaque<uapi::drm_nova_gem_info>,
> +        req: &mut uapi::drm_nova_gem_info,
>          file: &drm::File<File>,
>      ) -> Result<u32> {
> -        let req: &GemInfo = req.into();
> -        let bo = NovaObject::lookup_handle(file, req.handle())?;
> +        let bo = NovaObject::lookup_handle(file, req.handle)?;
>  
> -        req.set_size(bo.size().try_into()?);
> +        req.size = bo.size().try_into()?;
>  
>          Ok(0)
>      }
> diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
> index 902876aa14d1..730598defe04 100644
> --- a/drivers/gpu/drm/nova/nova.rs
> +++ b/drivers/gpu/drm/nova/nova.rs
> @@ -5,7 +5,6 @@
>  mod driver;
>  mod file;
>  mod gem;
> -mod uapi;
>  
>  use crate::driver::NovaDriver;
>  
> diff --git a/drivers/gpu/drm/nova/uapi.rs b/drivers/gpu/drm/nova/uapi.rs
> deleted file mode 100644
> index eb228a58d423..000000000000
> --- a/drivers/gpu/drm/nova/uapi.rs
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -
> -use kernel::uapi;
> -
> -// TODO Work out some common infrastructure to avoid boilerplate code for uAPI abstractions.
> -
> -macro_rules! define_uapi_abstraction {
> -    ($name:ident <= $inner:ty) => {
> -        #[repr(transparent)]
> -        pub struct $name(::kernel::types::Opaque<$inner>);
> -
> -        impl ::core::convert::From<&::kernel::types::Opaque<$inner>> for &$name {
> -            fn from(value: &::kernel::types::Opaque<$inner>) -> Self {
> -                // SAFETY: `Self` is a transparent wrapper of `$inner`.
> -                unsafe { ::core::mem::transmute(value) }
> -            }
> -        }
> -    };
> -}
> -
> -define_uapi_abstraction!(Getparam <= uapi::drm_nova_getparam);
> -
> -impl Getparam {
> -    pub fn param(&self) -> u64 {
> -        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_getparam`.
> -        unsafe { (*self.0.get()).param }
> -    }
> -
> -    pub fn set_value(&self, v: u64) {
> -        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_getparam`.
> -        unsafe { (*self.0.get()).value = v };
> -    }
> -}
> -
> -define_uapi_abstraction!(GemCreate <= uapi::drm_nova_gem_create);
> -
> -impl GemCreate {
> -    pub fn size(&self) -> u64 {
> -        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_create`.
> -        unsafe { (*self.0.get()).size }
> -    }
> -
> -    pub fn set_handle(&self, handle: u32) {
> -        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_create`.
> -        unsafe { (*self.0.get()).handle = handle };
> -    }
> -}
> -
> -define_uapi_abstraction!(GemInfo <= uapi::drm_nova_gem_info);
> -
> -impl GemInfo {
> -    pub fn handle(&self) -> u32 {
> -        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_info`.
> -        unsafe { (*self.0.get()).handle }
> -    }
> -
> -    pub fn set_size(&self, size: u64) {
> -        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_info`.
> -        unsafe { (*self.0.get()).size = size };
> -    }
> -}
> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> index 445639404fb7..3425a835f9cd 100644
> --- a/rust/kernel/drm/ioctl.rs
> +++ b/rust/kernel/drm/ioctl.rs
> @@ -83,7 +83,7 @@ pub mod internal {
>  ///
>  /// ```ignore
>  /// fn foo(device: &kernel::drm::Device<Self>,
> -///        data: &Opaque<uapi::argument_type>,
> +///        data: &mut uapi::argument_type,
>  ///        file: &kernel::drm::File<Self::File>,
>  /// ) -> Result<u32>
>  /// ```
> @@ -138,9 +138,12 @@ pub mod internal {
>                              // SAFETY: The ioctl argument has size `_IOC_SIZE(cmd)`, which we
>                              // asserted above matches the size of this type, and all bit patterns of
>                              // UAPI structs must be valid.
> -                            let data = unsafe {
> -                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
> -                            };
> +                            // The `ioctl` argument is exclusively owned by the handler
> +                            // and guaranteed by the C implementation (`drm_ioctl()`) to remain
> +                            // valid for the entire lifetime of the reference taken here.
> +                            // There is no concurrent access or aliasing; no other references
> +                            // to this object exist during this call.
> +                            let data = unsafe { &mut *(raw_data as *mut $crate::uapi::$struct) };

"ptr as ptr" should be avoided, see:

	https://lore.kernel.org/rust-for-linux/20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com/

so probably

    let data = unsafe { &mut *(raw_data.cast()) };

?

With that fixed, feel free to add:

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

>                              // SAFETY: This is just the DRM file structure
>                              let file = unsafe { $crate::drm::File::as_ref(raw_file) };
>  
> -- 
> 2.25.1
> 
