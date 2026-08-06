Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073063F482E
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004909; cv=none; b=fMqE99ul8u/C+PKaCSd+wyJrY2Ni0ckCoA/fzBZtFHJi+c/OYYPx4qG68ceOFpiR/e6FWWbar9Atu+OjVmF2qzs6rIdlJhPG0PuGhEPR/NTLApMIVsYIDQQYK1Oejx53biyQJ1+mT7YfSDe6FPbfSClrETcWwqRPjvSCk8trJcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004909; c=relaxed/simple;
	bh=j3yPQoqrGj24DA78KQYUgHZU2noVjIuvE8SivGuQOBo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qa4D9nj3WOCRz2zgcH5dQLeVfiL9l8FE4ryyPGSxxlT0jAYZxV/NuFQnrHAl8AnNVOXqpDeuE5DpfMTCkCZ2xD0048CLRf2HrrgXiM3EfjtXDMESSyD11f2HFuTVOSG/1JhQzPt9WrF7naVH1nfTzdRA1SOFhF1OFjk96om+Nqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P5R1T6jP; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P5R1T6jP"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-493a7fa8481so4416455e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Aug 2026 01:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786004904; x=1786609704; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OYizOyPkPXEuYIqzFOLigQQZGOQqkAaAqTRP0x1kvU=;
        b=P5R1T6jPdVOij4s/51MTLfUvI72oFJeSE7kBfEUQQ6UsdIn8lsI0BlrFWalcr9FMIG
         k1rHOLCPVm8HwXNBXAZhIE122ykWiAl5Ri5/gg8eVb7YjEno2wKjOrztJ92o17Ug0yj3
         rNAyDsnRGKnE9FcPD9gLdYDLEM+4XHax3DNUCawo8JQ77H1Li6LLro/cvX44GUnmGZ/f
         Al0GBCocPh8Vvet1QwpgDDXTpU2DlZb/3VZwa7YhJAg2oEtT2XshXmBTk3PGEKRt6Kah
         xqoZdSstKbr8Jf6NvbayAUT0eCtPbvDy34oRqCldP5JRVOAcR22RdKTFU0K443XcJr5q
         28Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004904; x=1786609704;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5OYizOyPkPXEuYIqzFOLigQQZGOQqkAaAqTRP0x1kvU=;
        b=f9ZkkO5MjfsMhlz1RRj3aAUaxcxcjOg3zNhB+tIYOZjDA3szShQlUCWC7v1xBhN2vt
         yUH5dKPxrb0ssjy0rsTHLFbvnlHhL8tkGliDFRrswvzqZMRLJC2MmHh2aXkQzb1zMCh8
         MJdMedwXvurgUfpsaH+11MfvLrl/jEX2k2ugvxUUejHYYOKPztQVAafXkTjMZ9x1fLWH
         r82f5W8pTPVl+zl8Iq4u5uQ1dCDS20akH4NHSZuNtp3CkKelj+3Nupnbwj+S09eGRG7c
         Eft1DtNuAadXGd/4Ap9uXP7l0bvzzATfDW0kd9PaulnGyIBtk50FNzZodkLhFOmflh9j
         bjNw==
X-Forwarded-Encrypted: i=1; AHgh+RqaFrDoyYA9lDxXKIuxWD45qMZO83Cuft1FlELLe5mk0/CYFtpV5gJ9qNasfrgqKr0/XKd3g8EhcjKtEgseTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPik1SsaNSgZ+KTaVzO6bBLXFrPTErnY9N/e7EhOdI925CWSdI
	vnRpQ50HwO1YgCgcXhcuXyz+onHHyatYliVJ6TPAFyued+QtvFhj1+j8d1aVECyWWoUaQAI87lO
	aIruOdSzzRvZWI47HJA==
X-Received: from wmtk4.prod.google.com ([2002:a05:600c:c4a4:b0:493:ae35:2761])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1546:b0:495:3bc6:d381 with SMTP id 5b1f17b1804b1-499553bcbc8mr27546045e9.2.1786004904128;
 Thu, 06 Aug 2026 01:28:24 -0700 (PDT)
Date: Thu, 6 Aug 2026 08:28:23 +0000
In-Reply-To: <20260805-rust_tmp-v1-1-7851cc1c00e8@wyliodrin.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260805-rust_tmp-v1-1-7851cc1c00e8@wyliodrin.com>
Message-ID: <anRFp0rqUomBOSkO@google.com>
Subject: Re: [PATCH] rust: misc: add OWNER field to the `MiscDevice` trait
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 05, 2026 at 03:20:07PM +0300, Alexandru Radovici wrote:
> Add `OWNER` constant to the `MiscDevice` trait to allow modules
> to prevent unloading while the device is in use.
> 
> Set the `OWNER` field in the `rust_misc_device` example.
> 
> Signed-off-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>

This is already being solved by:
https://lore.kernel.org/all/20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev/

> This patch exposes the `owner` field of `file_operations` to the
> Rust API `MiscDevice` trait. It allows users to prevent the
> unloading of their loadable modules written in Rust
> while their `MiscDevice` is still in use.
> 
> Without this ability, writing a misc loadable module and running
> the following commands will Oops the kernel.
> 
>    # insmod misc_module.ko
>    # sleep 10 > /dev/misc_device
>    # rmmod misc_module
> 
>    ... after the sleep, the kernel Oops
> 
> I added the `OWNER` field to the `rust_misc_device` example.
> ---
>  rust/kernel/miscdevice.rs        | 13 ++++++++++++-
>  samples/rust/rust_misc_device.rs |  4 ++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> index 83ce50def5ac..21c5d88c5dc4 100644
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@ -31,7 +31,7 @@
>          Opaque, //
>      },
>  };
> -use core::marker::PhantomData;
> +use core::{marker::PhantomData, ptr};
>  
>  /// Options for creating a misc device.
>  #[derive(Copy, Clone)]
> @@ -126,6 +126,12 @@ pub trait MiscDevice: Sized {
>      /// What kind of pointer should `Self` be wrapped in.
>      type Ptr: ForeignOwnable + Send + Sync;
>  
> +    /// Set the owner of this `MiscDevice` instance.
> +    ///
> +    /// In case this is compiled as a module, setting this prevents
> +    /// the module unloading while the device is still in use.
> +    const OWNER: Option<&'static ThisModule> = None;
> +
>      /// Called when the misc device is opened.
>      ///
>      /// The returned pointer will be stored as the private data for the file.
> @@ -430,6 +436,11 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
>          } else {
>              None
>          },
> +        #[cfg(CONFIG_MODULES)]
> +        owner: match T::OWNER {
> +            Some(module) => module.as_ptr(),
> +            None => ptr::null_mut(),
> +        },
>          ..pin_init::zeroed()
>      };
>  
> diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
> index 41e26c825060..bf8801ea3cb2 100644
> --- a/samples/rust/rust_misc_device.rs
> +++ b/samples/rust/rust_misc_device.rs
> @@ -177,6 +177,10 @@ struct RustMiscDevice {
>  impl MiscDevice for RustMiscDevice {
>      type Ptr = Pin<KBox<Self>>;
>  
> +    // Set the OWNER constant to the current module to prevent the unloading
> +    // of this module while this device is in use.
> +    const OWNER: Option<&'static ThisModule> = Some(&crate::THIS_MODULE);
> +
>      fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
>          let dev = ARef::from(misc.device());
>  
> 
> ---
> base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86
> change-id: 20260805-rust_tmp-095994661956
> 
> Best regards,
> -- 
> Alexandru Radovici <alexandru.radovici@wyliodrin.com>
> 
