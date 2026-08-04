Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D776543B3E5
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830538; cv=none; b=n/bhFzTlTiN5slAqw8YRX2+Vd+eIxHDPKnvpAz7mnmsY1bMbEJslpgy3TlfjSugj+BN2co1RVVmuri2k59pfbxPKtRVko4rmKrkXYtooD8vgv6ZzrSgA+q9aS+/Oya/I6MGCU4AFCnHpKdqmzU6WUpk3dY8ILshPvM+7aEHI5ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830538; c=relaxed/simple;
	bh=CB5SYoKg/5ZxEr5pPhwxBoe4hMu1CcWGN7cso8dfp4M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a0XWZYfg5iAtxp5H7aRHmxS9cjmdUCUSA38VczfZvLlP6wI5ez/FaKrCEGg8gzkO1krk96RUP51DDJkozQETkdmUD7CzgTiBd38Yfl9+2DvIyPJTyJU2bOop2vZQzqiAU4FgfcaYQYy5oPv64lEvpyumjduQWgFVAiFK0aapldo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZZ79MWYP; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZZ79MWYP"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4957287363bso18524565e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Aug 2026 01:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785830533; x=1786435333; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEJITv1WcGLvr9b4sfSYJz2GZb00MTzVJtJ1pz53UrA=;
        b=ZZ79MWYP6Jvv2LYutooK1TErsMloJ3F3TgfvrnqLUsOPlsz3FZzocV4yQN6HtjvukC
         U9Fq9TbiBIrLUpCCj6kK5NjHjKeUzAN0wwrclDIrPC3uQmZeaeAF35jReVIpC6ipDEsp
         CLb1WIQLVYhhJNp347imKwpxMqlAikgxvnEEb8iO0EaTfYqG8Lquoj+q7YsN0xJxDgUy
         YZB+JrDp0yLKkaDv174XLfweyqZCLIgD1l6juoezzXtTk6YpTWP1Es3DOF1XpFiebOaW
         PqdOHGCCGNm1i+YHtfGxVddWHq+2zsQuiD3AGzPeI6u54xHMVBkr0n/w8GLn6tkZNIre
         5ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785830533; x=1786435333;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEJITv1WcGLvr9b4sfSYJz2GZb00MTzVJtJ1pz53UrA=;
        b=PHvE9YHGW1wJUDrQAg2KalPicVFWcUNyzz7+ASSQV5TQTnDUcCw1l29Oga8w0Dv1vT
         PXhdmvWpTE5DJlfivlE5ZBgHACORt+6+ihyw81BvVdgv/f/tDcT/64Fkup3+nuQFPRg3
         1kcHN/+xHKOFOKcirZ06BLSCtAXLwwyDPoBrC+YMhl085eJ8MR8td5LZfmhH27q9JkjV
         V5nZMxbDCfz+gp2cAtb6sxxDOuWs+XoitVtXTAidgmN/ouDoCymDHGLvUx7rNYCmiyyj
         pgVt7gQzEp8Q++d9XzAFPAsfL4iNqB7+aZTwhNv3T6G8NxungYpi5Xcx2a777s30UuiZ
         DLSw==
X-Forwarded-Encrypted: i=1; AHgh+RoZAq3SoASirKovUcWtvn0VDAR6ZEwWR3lh7TKz1tga8AP5qvsGMsPy2KjnhwIlxlqif4v1VPIQzGELR76jAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN3iXWecjpCIzMkK244w8zq2/G7w/dlK4XdKHn9YPwE+UOtZkF
	vBGl46vc5GY+JjB5KelId3ohVATnNWL6D9G8OIE2aKbsE+tUM01d02Dn9a5wdJ53ErKBVDJG6sI
	vi14CmuvrzpocB0ihkw==
X-Received: from wmpx38.prod.google.com ([2002:a05:600c:18a6:b0:495:49a0:9476])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f84:b0:496:bbcb:b0bb with SMTP id 5b1f17b1804b1-4980c674e31mr299591655e9.18.1785830532277;
 Tue, 04 Aug 2026 01:02:12 -0700 (PDT)
Date: Tue, 4 Aug 2026 08:02:11 +0000
In-Reply-To: <20260721153617.869933-3-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260721153617.869933-1-beata.michalska@arm.com> <20260721153617.869933-3-beata.michalska@arm.com>
Message-ID: <anGcgxwNXz5_RzD1@google.com>
Subject: Re: [PATCH v2 2/3] rust: platform: wire runtime PM callbacks
From: Alice Ryhl <aliceryhl@google.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 21, 2026 at 05:34:03PM +0200, Beata Michalska wrote:
> Allow Rust platform drivers to expose runtime PM callbacks to the driver core.
> 
> The runtime PM abstraction builds a dev_pm_ops table for the concrete driver
> implementation, but the platform bus still needs to receive that table through
> struct platform_driver. Add an optional PM_OPS associated constant to
> platform::Driver and initialize the coresponding C device_driver struct
> accordingly during registration. The platform glue only wires the callback
> table into the C driver model; ownership of the callback payload and
> runtime PM teardown remain with the pm module.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  rust/kernel/platform.rs | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
> index d8d48f60b0b9..b7e422388634 100644
> --- a/rust/kernel/platform.rs
> +++ b/rust/kernel/platform.rs
> @@ -72,6 +72,11 @@ unsafe fn register(
>              None => core::ptr::null(),
>          };
>  
> +        let pm_ops = match T::PM_OPS {
> +            Some(ops) => ops,
> +            None => core::ptr::null(),
> +        };

This value is just any user-provided &bindings::pm_ops, which I think is
too lax. There is no guarantee that the Registration and the PM_OPS
table agree on what the type T is, which can lead to type confusion.

Most likely, you must instead give `trait Driver` an associated type
saying "the PmOps type is this particular type", and then here you can
do `Some(T::PM_OPS)` to actually get the associated table.

And then in the registration, you can further require that the types
also match there. E.g., maybe make the registration generic over the
Driver type and then the inner type T is just D::PmData or similar.

Alice

>          // SAFETY: It's safe to set the fields of `struct platform_driver` on initialization.
>          unsafe {
>              (*pdrv.get()).driver.name = name.as_char_ptr();
> @@ -79,6 +84,7 @@ unsafe fn register(
>              (*pdrv.get()).remove = Some(Self::remove_callback);
>              (*pdrv.get()).driver.of_match_table = of_table;
>              (*pdrv.get()).driver.acpi_match_table = acpi_table;
> +            (*pdrv.get()).driver.pm = pm_ops;
>          }
>  
>          // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
> @@ -222,6 +228,9 @@ pub trait Driver {
>      /// The table of ACPI device ids supported by the driver.
>      const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
>  
> +    /// Runtime PM callbacks
> +    const PM_OPS: Option<&'static bindings::dev_pm_ops> = None;
> +
>      /// Platform driver probe.
>      ///
>      /// Called when a new platform device is added or discovered.
> -- 
> 2.43.0
> 
