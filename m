Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6C12E1742
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626890; cv=none; b=CRQcVTOPWxKipMuHQXVeHDQ7+iiSEsE9YJcZKxp0dg5LSr1UlcLzvM/uh0wA1UimCCjqy6//SbBcwposzcJBjhs1qCCxhzFBZhfm9E462d2TDQcFScotBuJWwUkmLx+gCntZbBCx1btGnl4LzAtr6hM0MiyF9vooQQBa0ISDdCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626890; c=relaxed/simple;
	bh=5xa681f2Wy7I1+GCjfTAXTfl0IqG1LYTDdggpyeF6Xw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lN4uyuM8daHs0zzAGPPyMiC8qGTQ805L4npnnpNgb6ztsh4unPAk8QKtMoAh2kT4CMg+UPJgHVJkg6s6x2+a0EbB9yGUFA7TdGxZVfiKQ+s0WKHPBZbA0GU96pgQ+tpigAPCjp5pu0JYRbJfB3bNuAJ+M8Dp9a0PK84QbEBPaKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ioBINfQ3; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ioBINfQ3"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3fba0d9eb87so667751f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760626886; x=1761231686; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EttKU3B9Wqu5R2WSYHFS6Mo9lEK4v9PvPliANhh8ahA=;
        b=ioBINfQ3sEjfR21NZtFF0zSOp2ND+1ysNux1pyZ++lkiqg7E0SG/dOD/H45JH9Vupy
         Xx5W0iQH1CGV1qjLyy9XwCX7yeZpBj0e+3yf1sQC+hVvFfqE6uhFRq7gPwBcNNN/K/W3
         E58uppNWUFRruQcFNanN/X5sRg969t1EsrBxHfoENv/CXeCGKYQ6BzoVeN8gNyUuSx6N
         8+Cag6dDUyyyMyWHKNnySD4h8uhj1fwpe3fDF5lz+U8/7tEKCCpo6xhJm8fYoABkVgjE
         pl4vLvphgBz93O2oDPeELq98s6tSlXXB2VHmGIfM78KH3d6uAxHOfE1iVrbpLK8TsptF
         vB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626886; x=1761231686;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EttKU3B9Wqu5R2WSYHFS6Mo9lEK4v9PvPliANhh8ahA=;
        b=pcUY6vC1OEjc8nW91y/joovWITrrT6kmWCPtHjxaJSLKNL7Lqo37OXjorPFxMtWSBd
         HlsygWCj5Gf+S+LBuaetPILyrDDJ11uXLZkT740EFBNCwE+M77rxctmZp996TkUWXAhy
         oRSedapQ3t7ygjS+l9758819m3t0zkBHCEm5Bye2YRRY0Z2L7d3kibl+BtkYU+lbAlfo
         IGJaWGJAYa9Zu/JZYDAleXLhpEMROOp6Eg5Mv9Gp/Y2MDhRr4+FAZa9DvGXX548PhIq+
         MsEt5CRel04xU8d1rhgLznKq6HY6P+VzBZ4r0Nl0CAzkksWQSJOobi88jiZ0tDYhugpl
         tfQA==
X-Forwarded-Encrypted: i=1; AJvYcCUcFzfDevvuwcuJxTpXfp6u2+MuLFaiZ9m4WzTf1DJS/sIIGJ3xf8s65uL4hNWfY+TsWTEx201nS9wSprMrdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAYZhGP/DFRgTxojaA+CAOyNIHLGWpgAZOJ8RWe5UmBLXgZXsb
	k79Fp8CxaaOp7rBuxVGVXErhIhLY0F811NKJA5Vzm/XQUrjDULuf2QtZwR+XObXZ+gd9Lumznj4
	59k7NZcsIzOTLXlA1HQ==
X-Google-Smtp-Source: AGHT+IHurrt5tf8cx12gEfNHRF260x4BHSkP0VT8R37ilUuWpW5OS1X89vvCHVuaNuNe6MMS4xP/qSvWBLAU6Us=
X-Received: from wrnx18.prod.google.com ([2002:adf:ec12:0:b0:426:db53:5260])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2287:b0:3ea:80ec:8552 with SMTP id ffacd0b85a97d-42704e0eda4mr264130f8f.57.1760626886194;
 Thu, 16 Oct 2025 08:01:26 -0700 (PDT)
Date: Thu, 16 Oct 2025 15:01:25 +0000
In-Reply-To: <20251015182118.106604-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251015182118.106604-1-dakr@kernel.org> <20251015182118.106604-2-dakr@kernel.org>
Message-ID: <aPEIxYlh98exA2vn@google.com>
Subject: Re: [PATCH 1/3] rust: pci: implement TryInto<IrqRequest<'a>> for IrqVector<'a>
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 15, 2025 at 08:14:29PM +0200, Danilo Krummrich wrote:
> Implement TryInto<IrqRequest<'a>> for IrqVector<'a> to directly convert
> a pci::IrqVector into a generic IrqRequest, instead of taking the
> indirection via an unrelated pci::Device method.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/pci.rs | 38 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index d91ec9f008ae..c6b750047b2e 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -596,6 +596,20 @@ fn index(&self) -> u32 {
>      }
>  }
>  
> +impl<'a> TryInto<IrqRequest<'a>> for IrqVector<'a> {
> +    type Error = Error;
> +
> +    fn try_into(self) -> Result<IrqRequest<'a>> {
> +        // SAFETY: `self.as_raw` returns a valid pointer to a `struct pci_dev`.
> +        let irq = unsafe { bindings::pci_irq_vector(self.dev.as_raw(), self.index()) };
> +        if irq < 0 {
> +            return Err(crate::error::Error::from_errno(irq));
> +        }
> +        // SAFETY: `irq` is guaranteed to be a valid IRQ number for `&self`.
> +        Ok(unsafe { IrqRequest::new(self.dev.as_ref(), irq as u32) })
> +    }
> +}
> +
>  /// Represents an IRQ vector allocation for a PCI device.
>  ///
>  /// This type ensures that IRQ vectors are properly allocated and freed by
> @@ -675,31 +689,15 @@ pub fn iomap_region<'a>(
>          self.iomap_region_sized::<0>(bar, name)
>      }
>  
> -    /// Returns an [`IrqRequest`] for the given IRQ vector.
> -    pub fn irq_vector(&self, vector: IrqVector<'_>) -> Result<IrqRequest<'_>> {
> -        // Verify that the vector belongs to this device.
> -        if !core::ptr::eq(vector.dev.as_raw(), self.as_raw()) {
> -            return Err(EINVAL);
> -        }
> -
> -        // SAFETY: `self.as_raw` returns a valid pointer to a `struct pci_dev`.
> -        let irq = unsafe { crate::bindings::pci_irq_vector(self.as_raw(), vector.index()) };
> -        if irq < 0 {
> -            return Err(crate::error::Error::from_errno(irq));
> -        }
> -        // SAFETY: `irq` is guaranteed to be a valid IRQ number for `&self`.
> -        Ok(unsafe { IrqRequest::new(self.as_ref(), irq as u32) })
> -    }
> -
>      /// Returns a [`kernel::irq::Registration`] for the given IRQ vector.
>      pub fn request_irq<'a, T: crate::irq::Handler + 'static>(
>          &'a self,
> -        vector: IrqVector<'_>,
> +        vector: IrqVector<'a>,
>          flags: irq::Flags,
>          name: &'static CStr,
>          handler: impl PinInit<T, Error> + 'a,
>      ) -> Result<impl PinInit<irq::Registration<T>, Error> + 'a> {
> -        let request = self.irq_vector(vector)?;
> +        let request = vector.try_into()?;
>  
>          Ok(irq::Registration::<T>::new(request, flags, name, handler))
>      }
> @@ -707,12 +705,12 @@ pub fn request_irq<'a, T: crate::irq::Handler + 'static>(
>      /// Returns a [`kernel::irq::ThreadedRegistration`] for the given IRQ vector.
>      pub fn request_threaded_irq<'a, T: crate::irq::ThreadedHandler + 'static>(
>          &'a self,
> -        vector: IrqVector<'_>,
> +        vector: IrqVector<'a>,
>          flags: irq::Flags,
>          name: &'static CStr,
>          handler: impl PinInit<T, Error> + 'a,
>      ) -> Result<impl PinInit<irq::ThreadedRegistration<T>, Error> + 'a> {
> -        let request = self.irq_vector(vector)?;
> +        let request = vector.try_into()?;

The resulting change to the lifetime semantics is curious, but seems
right.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
