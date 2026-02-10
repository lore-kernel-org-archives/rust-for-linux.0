Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCC5318BA0
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770742679; cv=pass; b=l7sZwI07kz/fiJ/Ac+OkYUVJKQtigsKzAacr0It4SmpvyMmOHmawSWLAhdxGE0o7zJPCUYveL3yAWHP7ml7C9t0UD6k8eRHCO0kGrpALT2gBP3qWyUNguGIO18HCRZFkuZu/6puk/CvkSdgAbKD70YbsOvK+IIDln3b5MW2adhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770742679; c=relaxed/simple;
	bh=WP61RW8xgJYKXlcfVEA8A2UCYSHnijD5eRB2joWPVOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aceQuI8AA7yMzhDrTB5rinF1Th+pmxiYGFHqjvQHBFglq4vCLvrLxLjoewj8UGvvA9ejHVcbbTqfhWEwLNNkaVxHQXi7Jc5QvwBcbxhN45wQOPCoTVNqeyJNUn9SXcfeitsTjUV9JbqsPNq8lArZnZNoY6sYsDAkTTh19za3AZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtlWDarI; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtlWDarI"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-385d9fb297dso9829081fa.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 08:57:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770742676; cv=none;
        d=google.com; s=arc-20240605;
        b=Lx7wl8ClBHG94PKGtMjgg579Hgf5v4CP+bYE4y6zaWIWZGwSNICqrYMGPlI30lTHMo
         9BZZwWPGyAf8Su9dmjd0flsVxQTLElLGD5r2mOoYLR1dE8Cutw7OgYnabCUbDZ/9s6gz
         uQVcQpLTUNntX8PPSA+SQdopMzZPAURM+LSJZ2BN4z1Eox6pjDPndQWxDemzlp22TQU4
         Dia9UPBAuSc7O1U7wTKhQjHqy94y3c7mQYj7NoXZCnHf3KSasa4V6c8WEvkQihH3slek
         KhL464/OaC4qZhYet5/hpQxqHRrsIM0xnpbqEoMrFQKNy1vAntd8pyeXfsjXjVcHQ5sS
         xjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JuTr1v7vZJwrCLefGdygjnFVcvKYo7h+RejLuFTqn2c=;
        fh=b9kBsAzQkCsIwG/aFMI8PyMHF6XOq0LfJSC1Y+WL7vg=;
        b=DsBIXzh7LgX/4/k4heW3QapfQYeaJpXuQgubRDrOXv1nKxjqSnF4uzlGOBiX7EZN97
         LzdTpLlO/ELP8JXC8vNMiHQxCh3hDeS6YAoO6aM8pEos194YtsBEWOoeZtm2u/Ac6j/i
         2PhhMOM2q/edn9prl6AZQRa3evsc20Ae3LFKJEOEKGEmxMk0ei8YydtMH/wrU6WEA7YH
         nL0Jmp+/QE0JGTagPsGTVuIQAgirLMIvDAQrVGFN7U0ATrvhmC39VSiE1OxiKZNgE4vH
         yrcZT5Vb7pTGtxywhn7H+YuehoHIbpWTRLbaNNJAyVRO+BDly2ACceckmDdr6fePIu6u
         y5kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770742676; x=1771347476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuTr1v7vZJwrCLefGdygjnFVcvKYo7h+RejLuFTqn2c=;
        b=VtlWDarIqMGNa8QzueNjC5cCqVTuqm7rSipvI6eq/dfkN0VGumN0D7zcJvDmvObwC5
         RLKUGSp9SGf2jacPXNVStv5UUeF2B+jwGEWSTInTVyQjy8EIZsh80Sk+OBBYZOqYyGjT
         fzS89lw+4zEW8HLl7siCDvwFCCkIcX5i/EwDBn0YgsjSytWwueTtKmMXCGZUctIQUncn
         ZBefp5iUam/DXP9lIQzVn5vGAdpcqIMdi+w3HuTKO0aQlu+mbBMI8wBCiCGK/bDDxW1c
         oHjjufN8yCif5CNGpjy43iYUcUEyqh6qTPY3kEDkW7+XTtS2XxMA5SXFqwn28C6XaTz8
         wAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770742676; x=1771347476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JuTr1v7vZJwrCLefGdygjnFVcvKYo7h+RejLuFTqn2c=;
        b=S/tEIz3uqUAVqSmBiqbOjGPgUjnch6RQTG6UP6s+4dg6U2HKvmgqBTfrecTizz88qX
         lZlW76XCdfUmUwg2rKWuTrNle+WBamRiVpVcelsLp5jZcJ+z0pHPd0p0ct9zcuMUyKm5
         He2Z0rFYPhthxBOnnwLu4IxQeqnzZ6ylU3yH55EQZQlOuYWsFmY1XOeTPgOL1EVcDr7D
         QvnA7q6MSDsSgMBBAXY8nVXN6Nuf3guNYYr996sqqwTIGQ9AZh8xJOjAneQT8gliNj00
         DC4mebzjLh/eI7Ts7MUW3Wn4rzDSbjDbXvEtVV3EtR3b32itXYPuFhDVi+Oxcl4e49W3
         iVUw==
X-Forwarded-Encrypted: i=1; AJvYcCWgGW6kcojLc3K0GDThiWokZAFd7Jj7JhA3qFYkPk5u7ILA4oB9Q+LiwhwfIcnudfdn6XUvva7/BsqMN6VJWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycZrcqUmVnArfGDMvfY08x1F3x8jPrkP1Hz2ZH1QZlJFkzEByk
	dQJ21CjCw078yGUyVuPSYYsj4w5+TnVDqh8lqxM+bWkaZHr9RxykvwltJkbdZUvClQCzisLR55U
	v/SPSVaCrWCYh7gqC3jbGYoCiEt5tJeI=
X-Gm-Gg: AZuq6aIcKdPvpA1BW7cf6xTmEPfZNYMsUt3KGDkMX02CcGB0LnN74cE7/hJZKabjZaV
	zcw/HeRXk77Pq5/ifwCgeJZ39TjEWjjet3R4oMoXCRRLkvM050zWpwdUnfeWpshaNKvOxmesqRX
	trJdZucXk46AdFCaAsvQ36FjSZ3nGB0Iwjm2Xb5LskYlm9WbMiNVO0kPEpcM2GNcCDD2hhxbUI9
	dny68D7pSEVtfBb7BwMO0Optb3c1nHI4ZAcyMT0M2q8M/79fkAxBBIL41OQDXDYaZOG9aGzhEtt
	ENhbQBN5A3l09tgpu4ej4pekW/rPAU7XdHTvj1t6oLrhJSVTRoSaOiOHgHjVS7LJFTc+o51HwhS
	t4NCm6YL9fPwv79lI8xiL
X-Received: by 2002:a2e:a5cb:0:b0:386:8f97:d0b8 with SMTP id
 38308e7fff4ca-386b5106ef5mr52202351fa.20.1770742675630; Tue, 10 Feb 2026
 08:57:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org> <20260209-xarray-entry-send-v3-4-f777c65b8ae2@kernel.org>
In-Reply-To: <20260209-xarray-entry-send-v3-4-f777c65b8ae2@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 10 Feb 2026 11:57:18 -0500
X-Gm-Features: AZwV_QjO2-EsPct575RPXi7JROMwJ92pVr3PLA-_MmegBYrDreR1XZieS5jWe_Q
Message-ID: <CAJ-ks9=hWB2eFcEj1obfsoLvK15=YR9y=hifxVyeB=mJOz+gXQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] rust: xarray: add `XArrayState`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
	Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 6:39=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Add `XArrayState` as internal state for XArray iteration and entry
> operations. This struct wraps the C `xa_state` structure and holds a
> reference to a `Guard` to ensure exclusive access to the XArray for the
> lifetime of the state object.
>
> The `XAS_RESTART` constant is also exposed through the bindings helper
> to properly initialize the `xa_node` field.
>
> The struct and its constructor are marked with `#[expect(dead_code)]` as
> there are no users yet. We will remove this annotation in a later patch.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/xarray.rs           | 41 +++++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index a067038b4b422..58605c32e8102 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -117,6 +117,7 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D XA_P=
RESENT;
>
>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
> +const size_t RUST_CONST_HELPER_XAS_RESTART =3D (size_t)XAS_RESTART;

Please add a comment to explain the cast.

>
>  const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;
>  const vm_flags_t RUST_CONST_HELPER_VM_READ =3D VM_READ;
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index ede48b5e1dba3..d1246ec114898 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -8,7 +8,10 @@
>      iter,
>      marker::PhantomData,
>      pin::Pin,
> -    ptr::NonNull, //
> +    ptr::{
> +        null_mut,
> +        NonNull, //
> +    },
>  };
>  use kernel::{
>      alloc,
> @@ -319,6 +322,42 @@ pub fn store(
>      }
>  }
>
> +/// Internal state for XArray iteration and entry operations.
> +///
> +/// # Invariants
> +///
> +/// - `state` is always a valid `bindings::xa_state`.
> +#[expect(dead_code)]
> +pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
> +    /// Holds a reference to the lock guard to ensure the lock is not dr=
opped
> +    /// while `Self` is live.
> +    _access: PhantomData<&'b Guard<'a, T>>,
> +    state: bindings::xa_state,
> +}
> +
> +impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
> +    #[expect(dead_code)]
> +    fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
> +        let ptr =3D access.xa.xa.get();
> +        // INVARIANT: We initialize `self.state` to a valid value below.
> +        Self {
> +            _access: PhantomData,
> +            state: bindings::xa_state {
> +                xa: ptr,
> +                xa_index: index,
> +                xa_shift: 0,
> +                xa_sibs: 0,
> +                xa_offset: 0,
> +                xa_pad: 0,
> +                xa_node: bindings::XAS_RESTART as *mut bindings::xa_node=
,
> +                xa_alloc: null_mut(),
> +                xa_update: None,
> +                xa_lru: null_mut(),
> +            },
> +        }
> +    }
> +}
> +
>  // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff `=
T` is `Send`.
>  unsafe impl<T: ForeignOwnable + Send> Send for XArray<T> {}
>
>
> --
> 2.51.2
>
>
