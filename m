Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B371235C14
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 10:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736763441; cv=none; b=Qj25Kq3bCvvBWX2RunkhXw1JgArhbSg0uhRTSI4DkBlmeKnUWTWQvJQpeE4deVZAl5n8vBvTfpoO2YroKuUayN4vnszdNKJId0w8owrbi6EOWnXof3lIRkFsVdNXsR+YA9x2ob4olNmnCZQo8IE8idZv1RGOF5811j+AkuVZbwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736763441; c=relaxed/simple;
	bh=bffvwM3XdM8VR9WnawbU2w8E9NX2tOwWIe1TVpkJBbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n4tOYM6yoZesMtl2yk2iJoU/ZuPLeEQwIFxq+BHHPts8EVcHaab5YYmofEjf2Dx7f4rAFxEFDHWwEki8ENxUUY4JMTns1KUReS1tnUPX/E4USoFsJTQeQfarS2EDaUVER3KHDRGOpON4pTWIhXJTFrUsb1ONKkS77Qv5U0DNbqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G9mtCxSf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G9mtCxSf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so2200141f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 02:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736763438; x=1737368238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVwLccJ/qBNtLBYtLIsjswh7rnPTuhm4wsmmDihDcOY=;
        b=G9mtCxSfj98IMSrhgculUDcE/PXRm4njjtdwlOHntV75ByU09vNF11FheOUa9TVtbL
         Ss4u13ccK+dTCr8xvCviOpdOz9yewcFZWZS2J5tckuY6v2M5DHCO/i0qznbtQL87MLJa
         wRHzxnf8qA5/LnJxjmkdlL0a1GUeGQk9R7jNZUpyD1RloLY2xLi8C/3zDx2FVxq0fJlx
         fiulscwifwdWIWpbvX5wcPAhREmsO22+aeKn04QkFOhGc1xIYBCe+ajopums5aUMuaCw
         AbIRe52IKKSDxvGvJQrQKMLsh5wXjPbvhclv5bqjbiHJ990WGHV9njkPwdcAHFz3geEr
         RRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736763438; x=1737368238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVwLccJ/qBNtLBYtLIsjswh7rnPTuhm4wsmmDihDcOY=;
        b=keztYMoJOmgvJlYs5zfe1ueFx4c1Lg+St24YWr9QihIAUB2eWWE4izcj+U+0WWudXe
         PCUw/v+SdAp5XIY6yJq+TdNVGvGt1GloVNf2kvAvuZVqrAmPjCLkTP4IQ6MoBOfRO23U
         RHF/oZ2CtmNgs+PPQaxfCI5S73edPCPELhtuRKUw4rxxr/AqnZjyiCp4aPaij4zv6cLj
         xGAzX5+MVq+T/ihLSYdCJ0KnuXaJcjxim/v7v0MCZlJg0N8cAR/u4ph2C6p5TCQFnVIq
         6pQsituctOfkww6E1KOWft2yNELMv+W/YLPJog7SmUjrcaUSHaVEO30tRVzCSTZ211wA
         cJvg==
X-Forwarded-Encrypted: i=1; AJvYcCVuN7lNsggOtCU4wUfWPIqEyWK4h5zTW5vOFuQVzDOlNP6dmgnb1uHSnff2Ztm9eZGoJGNXlSrUkDs/Nq1YQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJSe73eUuwRSFwXFAofIEg7V9AJ68dgfdK4iyvcue7+qDYan/p
	/YRc5qIOTQiahC5sEkgVXaipuVcVpQwXuJQdcTV5GwrOJHaR96yV+XFaER9/lFRUzKg6BrLHMzq
	FdevTeGUWz+DRe8xeQ6m8M1a3Bpr7CRtbvX4J
X-Gm-Gg: ASbGnctHx8P1Sh8yKUluHd8Uodxzyn4GK6OWa01imQaemYDIVK4OIOAttQgMUG0N+So
	VzhOD9WiowGULSWNFwcnF6RSrclFkxeht0/ud0Sl5jAUeET4N4lHzuMFmELzw6tgCwE8D
X-Google-Smtp-Source: AGHT+IETMQpwaCZqoV6SxajS/MhMZGoNm6bmFVOkqmqiwnQcQTve9gV6I95ylPTQztElPYhJaU0mnFYr8V1Z/nxoBgU=
X-Received: by 2002:a05:6000:4023:b0:385:f7a3:fed1 with SMTP id
 ffacd0b85a97d-38a87336e53mr18975373f8f.44.1736763437617; Mon, 13 Jan 2025
 02:17:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <f8bp5f3T5_3_0LpabBpwjSarzhZTp1CbAvcTBI6lHlaKpPAAFiofsNI2iJxK9kuXwnqvTkky9uvpS0rqRpa_RA==@protonmail.internalid>
 <20241211-vma-v11-6-466640428fc3@google.com> <87o71bagpf.fsf@kernel.org>
 <vdoUDPvED_7e_bvzaMNFhBpC-6TLpsrA9cfX8LWc-w69rv1whT7EnYLMtUn_MNlJ2R-e3LrKOfHNnacUsHivFg==@protonmail.internalid>
 <CAH5fLgh8g3d+v-am=VRdExZug6hTJf-3CWPoxxYCZLpyiXnKdg@mail.gmail.com> <87a5c0bdr0.fsf@kernel.org>
In-Reply-To: <87a5c0bdr0.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Jan 2025 11:17:06 +0100
X-Gm-Features: AbW1kvbldJAN_sLM0Yo64QYawu1Ocbm6TKYsLCUSYC5fjd6C863RDivQhYbqTOY
Message-ID: <CAH5fLgiFzFyVPNSjAkEBvK5Uk-OgaOHDujdXHBeLRZBVaf=Fhg@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 9:19=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Mon, Dec 16, 2024 at 3:51=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
> >>
> >> "Alice Ryhl" <aliceryhl@google.com> writes:
> >>
> >> > This type will be used when setting up a new vma in an f_ops->mmap()
> >> > hook. Using a separate type from VmAreaRef allows us to have a separ=
ate
> >> > set of operations that you are only able to use during the mmap() ho=
ok.
> >> > For example, the VM_MIXEDMAP flag must not be changed after the init=
ial
> >> > setup that happens during the f_ops->mmap() hook.
> >> >
> >> > To avoid setting invalid flag values, the methods for clearing
> >> > VM_MAYWRITE and similar involve a check of VM_WRITE, and return an e=
rror
> >> > if VM_WRITE is set. Trying to use `try_clear_maywrite` without check=
ing
> >> > the return value results in a compilation error because the `Result`
> >> > type is marked #[must_use].
> >> >
> >> > For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. Wh=
en
> >> > we add a VM_PFNMAP method, we will need some way to prevent you from
> >> > setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.
> >> >
> >> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> >> > Reviewed-by: Jann Horn <jannh@google.com>
> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >> > ---
> >> >  rust/kernel/mm/virt.rs | 181 ++++++++++++++++++++++++++++++++++++++=
++++++++++-
> >> >  1 file changed, 180 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> >> > index 3a23854e14f4..6d9ba56d4f95 100644
> >> > --- a/rust/kernel/mm/virt.rs
> >> > +++ b/rust/kernel/mm/virt.rs
> >> > @@ -6,7 +6,7 @@
> >> >
> >> >  use crate::{
> >> >      bindings,
> >> > -    error::{to_result, Result},
> >> > +    error::{code::EINVAL, to_result, Result},
> >> >      mm::MmWithUser,
> >> >      page::Page,
> >> >      types::Opaque,
> >> > @@ -171,6 +171,185 @@ pub fn vm_insert_page(&self, address: usize, p=
age: &Page) -> Result {
> >> >      }
> >> >  }
> >> >
> >> > +/// A builder for setting up a vma in an `f_ops->mmap()` hook.
> >>
> >> Reading this line, I would expect to be able to chain update methods a=
s
> >> in `Builder::new().prop_a().prop_b().build()`. Could/should this type
> >> accommodate a proper builder pattern? Or is "builder" not the right wo=
rd
> >> to use here?
> >
> > You cannot create values of this type yourself. Only the C
> > infrastructure can do so.
> >
> > What would you call it if not "builder"?
>
> It looks more like a newtype with a bunch of setters and getters. It
> also does not have a method to instantiate (`build()` or similar). So
> how about newtype?

I don't think newtype is helpful. Ultimately, the f_ops->mmap() hook
is a *constructor* for a VMA, and the VmAreaNew type represents a VMA
whose constructor is currently running. The "method to instantiate" is
called "return".

fn mmap(new_vma: &VmAreaNew) -> Result {
    // VMAs for this driver must not be mapped as executable
    new_vma.try_clear_may_exec()?;

    // we are done constructing the vma, so return
    Ok(())
}

Alice
