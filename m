Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238242EA754
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 19:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766000002; cv=pass; b=Hh4n4pCXllukOB8flCd+zT9/asQyHUH/HdRVEwJg9b49x1/KAojcQxEauD0wzqeco8mC/IwwBfkiyFh2tV+P9RxGJmFj14juWlzf+8gL8y07Mzdyt4lq/KpKplEipH7z74VL2l98MlYUorRfXab9BjP69eHK0ZvX7Qs+pegCops=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766000002; c=relaxed/simple;
	bh=DFHEGuitL16+yUdqs8zbfDljbZ4kjmmjuWeusyXk2aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxT3jCnga55ZQGbmXbDn5yEIGBeoT9WRZYdXr0/Uehay2D2ThQLLk8tEyX60NF6vQjUVA4WE94OnmSBVdocWANxeeId9ThG0mXrLU/l4OazzUYOyaBjnJ0o7usLdJrVfjYGhGQQOiJ+Q29mP5w2G2HSiGJlhnC1RnLHUZ9WGpAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e8fzMNuJ; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e8fzMNuJ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-645ed666eceso1547a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 11:33:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765999998; cv=none;
        d=google.com; s=arc-20240605;
        b=GPz5aBsVU56vwzqOyZad5Gr1st+wTeTlbbtvw5Q3I++MTsp4bluqzmoNmbz0WgMRHg
         fyjXQ6TjzaB2n15ISx+/CdSL5M7VLvAYtWKq/CAp4rMnxd9KKAzMFCXGao2He/mSralA
         If1lgjTPNykiGQhM+EY5UzQP/xpj/P+A5HyA11cZaXTQ/r1rzzwLnjkO5JXNmqfaS7kU
         rSXfDj8v4SNAHAPqb3UJPOgYChM3lWV/uJTOdUqGW2t95/d2cMRMO1GEYWLh4PFpu4Vc
         mYScDtgyDCGNUiJskKJgNbbllg07+zi+b4eNq9WmWSv35/FSPpAp75jsOH7GTAzp345G
         4E2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XA5sLVAMDb7AMQE+9grTNk1/mj8fBqrlPkl7Vub14qI=;
        fh=JP/4AqcrIxrf5xjKzq8w0kC1Nq7zwZNFYIZgQxKxoD4=;
        b=Tx2dt124juz2cq6xZdnY3wAnMqmi5GzkZAj0Fvr6OHPSdQ84hN1gSr8Jt/bWE264Na
         eiVBQ0+pKlj0Cf6Kxy7mubmlhNyz99dBTTMFgbDi05P9nPPTtcA619FonwEAbU1AAx1G
         MQ7kpqo3mLFhLmlnJz4/AyXW7yYZWRRITUSzXTSh1tSGBYInw9dijXqpAKEm3RDcX3Eq
         e2y7p5H/l0Njb7kfDTiLjz1bRBqDDVvqlduWf/LViWy129bes8lGhaFL5LWKs4pgC4ok
         8P7DXg2hF/dLhp8ZN5NBLrm4XmHgS4DpyMyft8Lpb2xn+V2duszWGkGUfh26WDsLw4lW
         3Wbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765999998; x=1766604798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA5sLVAMDb7AMQE+9grTNk1/mj8fBqrlPkl7Vub14qI=;
        b=e8fzMNuJClNim/fkGYS0YbFpEbp7rkZQlGNq30IbPH5nPZHYh+5xnlLKhkKoI+K8Q3
         Kt5Ku+wO4yZjt+++RJYmVZHPMT1jVFUUrEl631J9kTuOZtyLqdMxNyTrDVaIWX21uXYi
         wJTj8DkERCZn7J9Xv6u1W0LtWc58ZXcMcsTInhxiy1WCq3ux5jIs+ptXFhhVKYt27mNI
         6l0uO45/GXjUEBQQuCnutd3Vwi6Htv6CiLyUJlFB1U9E1RXKtoKZBLO+qRXeBDXREDXM
         6rJkWZgXxy9S9pWTxerjjxAh2Qah0JuINoe6gMUJrJM4IXFNEXMkxed8/HVdFs75EBw+
         U5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765999998; x=1766604798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XA5sLVAMDb7AMQE+9grTNk1/mj8fBqrlPkl7Vub14qI=;
        b=LFLF1llDtRt9TVBgqA6sBsb6nqSuaaNDMNdO9v9D8NxW1RovsWPNzFIaQLCsa3whNV
         PbicI8+UN0UtTnHBJKZhN2y+uhAjib0AeZ1uWY2u+1EyY2xyBL8kOK3OxJLc8GACE/Ag
         X7tSZj3frRWeRsh8SgGk8f0GBV84tmxZJsVgRJoeZpx19tR6qzMnS16L7fn5NsF4nPF/
         N6KSiYe6EJQcUuDnn7KtfZ6OmVSpQf/HFaE08DvxDr0jWDL39DQPTTlrkkDK6abpi7NK
         nLBgxhp1H9kj9mX6EmOdp6vIyP3LK2a28xuvSCgndFIvbNH/fIW7/DlfqdW5JS5BfLAM
         P1kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2iLBGfUvZ3dtgxIpJHZB7e4E8lkWg/ha5r+jg75+FQnUwp6V9jOXdGPk8S9OsEEOBdFgwtYrHgExM2fAiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx03GQKcCbZlmr2Y6zI1izY6Pg0TrmhSwWEEPxYmAgG1tAkOJiU
	cXPK85yT1Gfyu8aoMILDhW0N63SPnkXuk3e1pi1biOv72mIKeVfVnA57lu6F56sGF6WfxgDlsBg
	dItjbvT5okUCZZHBvzr9C6wF4jllKc7tDVPJjy0Jn
X-Gm-Gg: AY/fxX6sI9Sblj22sQMq5bImMjjxjwpGuXuP5qZhIS+lyin3kS1Tj23RgI0KjCKpZyN
	bxPw6IFNYUB4MJplMKzmDBBK/EUQaPF1shkwil/0Tk3zViUTR8PjY3Bvowl4Gj43VgxptHjfWbq
	OVdd6EcgWY+GnYa14OrjXSabektS7dXcl232leNDpCyEqWHv47wlXLHzr+tiMwrWzf1I0tOVtUM
	L5AZKak3Y65Lz7tS41U4K7ZJLaiHk4QYaitL17iTJwtr0WrBcwFXn7mV6YSyocXYebBrUEe2ysH
	bskAfwRADDo4ukwyB+vwir9WBRRdtPLEP0Rb
X-Google-Smtp-Source: AGHT+IEQFIVeZrpvRa9z/2M0MTOWgQYH+ASc3Y89yIAVHTfR01ONYalI7z3hRUo4T3To497XhFEZjAuDcyv3nLNT2E0=
X-Received: by 2002:aa7:d885:0:b0:643:bfa:62cc with SMTP id
 4fb4d7f45d1cf-64b5a10fcb3mr6297a12.10.1765999998156; Wed, 17 Dec 2025
 11:33:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-3-b23e5277ad02@google.com> <A92BEB09-6F45-4886-8723-99A27D3F6518@collabora.com>
In-Reply-To: <A92BEB09-6F45-4886-8723-99A27D3F6518@collabora.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 17 Dec 2025 11:33:07 -0800
X-Gm-Features: AQt7F2roIwgTHunQCWBnXUhlhfqKMqd7BTqpoe6a8hpgXXpDx1efa53bTPlzYms
Message-ID: <CAGSQo00LhEQBejw1N6KojJnXZwSm9h+i9MsDuP3E2GCn8i=nLw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: Support deriving `AsBytes`/`FromBytes` on
 bindgen types
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 11:26=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Matthew,
>
> > On 15 Dec 2025, at 21:44, Matthew Maurer <mmaurer@google.com> wrote:
> >
> > To support this, we need to move the `transmute` module into a separate
> > crate to allow the `bindings` crate to depend on it. Most user code is
> > still expected to address the module as `kernel::transmute`, which is a
> > re-export. `ffi::transmute` is now available for use in `bindings`.
>
> Thanks, that=E2=80=99s really useful for Tyr.
>
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> > rust/Makefile                     | 14 +++++++++-----
> > rust/bindgen_parameters           |  8 ++++++++
> > rust/bindings/lib.rs              |  4 ++++
> > rust/{ffi.rs =3D> ffi/lib.rs}       |  5 +++++
> > rust/{kernel =3D> ffi}/transmute.rs |  0
> > rust/kernel/lib.rs                |  2 +-
> > rust/macros/lib.rs                | 24 ++++++++++++++++++++++--
> > rust/macros/transmute.rs          | 12 +++++++-----
> > rust/uapi/lib.rs                  |  4 ++++
> > scripts/generate_rust_analyzer.py |  2 +-
> > 10 files changed, 61 insertions(+), 14 deletions(-)
> >
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 5d357dce1704d15e43effc528be8f5a4d74d3d8d..178aa3036c4acba1c4c2661=
96912da2d60fe0d5f 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -207,7 +207,7 @@ rustdoc-compiler_builtins: $(src)/compiler_builtins=
.rs rustdoc-core FORCE
> > +$(call if_changed,rustdoc)
> >
> > rustdoc-ffi: private is-kernel-object :=3D y
> > -rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
> > +rustdoc-ffi: $(src)/ffi/lib.rs rustdoc-core FORCE
> > +$(call if_changed,rustdoc)
> >
> > rustdoc-pin_init_internal: private rustdoc_host =3D yes
> > @@ -249,7 +249,7 @@ quiet_cmd_rustc_test_library =3D $(RUSTC_OR_CLIPPY_=
QUIET) TL $<
> > rusttestlib-build_error: $(src)/build_error.rs FORCE
> > +$(call if_changed,rustc_test_library)
> >
> > -rusttestlib-ffi: $(src)/ffi.rs FORCE
> > +rusttestlib-ffi: $(src)/ffi/lib.rs FORCE
> > +$(call if_changed,rustc_test_library)
> >
> > rusttestlib-proc_macro2: private rustc_target_flags =3D $(proc_macro2-f=
lags)
> > @@ -657,22 +657,26 @@ $(obj)/build_error.o: $(src)/build_error.rs $(obj=
)/compiler_builtins.o FORCE
> > +$(call if_changed_rule,rustc_library)
> >
> > $(obj)/ffi.o: private skip_gendwarfksyms =3D 1
> > -$(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
> > +$(obj)/ffi.o: $(src)/ffi/lib.rs $(obj)/compiler_builtins.o FORCE
> > +$(call if_changed_rule,rustc_library)
> >
> > -$(obj)/bindings.o: private rustc_target_flags =3D --extern ffi --exter=
n pin_init
> > +$(obj)/bindings.o: private rustc_target_flags =3D --extern ffi --exter=
n pin_init \
> > + --extern macros
> > $(obj)/bindings.o: $(src)/bindings/lib.rs \
> >     $(obj)/ffi.o \
> >     $(obj)/pin_init.o \
> > +    $(obj)/$(libmacros_name) \
> >     $(obj)/bindings/bindings_generated.rs \
> >     $(obj)/bindings/bindings_helpers_generated.rs FORCE
> > +$(call if_changed_rule,rustc_library)
> >
> > -$(obj)/uapi.o: private rustc_target_flags =3D --extern ffi --extern pi=
n_init
> > +$(obj)/uapi.o: private rustc_target_flags =3D --extern ffi --extern pi=
n_init \
> > + --extern macros
> > $(obj)/uapi.o: private skip_gendwarfksyms =3D 1
> > $(obj)/uapi.o: $(src)/uapi/lib.rs \
> >     $(obj)/ffi.o \
> >     $(obj)/pin_init.o \
> > +    $(obj)/$(libmacros_name) \
> >     $(obj)/uapi/uapi_generated.rs FORCE
> > +$(call if_changed_rule,rustc_library)
>
> +1 on splitting the above into a separate commit

Sure, I'll do that in the next rev. Two people seems like enough of a signa=
l :)

>
> >
> > diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
> > index fd2fd1c3cb9a51ea46fcd721907783b457aa1378..d56343ca03979e345f8adb7=
eb8fd7f2b9d4be6ee 100644
> > --- a/rust/bindgen_parameters
> > +++ b/rust/bindgen_parameters
> > @@ -64,3 +64,11 @@
> > # Structs should implement `Zeroable` when all of their fields do.
> > --with-derive-custom-struct .*=3DMaybeZeroable
> > --with-derive-custom-union .*=3DMaybeZeroable
> > +
> > +# Every C struct can try to derive FromBytes. If they have unmet requi=
rements,
> > +# the impl will just be a no-op due to the where clause.
> > +--with-derive-custom-struct .*=3DFromBytesFfi
> > +
> > +# We can't auto-derive AsBytes, as we need a const-time check to see i=
f there
> > +# is padding involved. Add it explicitly when you expect no padding.
> > +--with-derive-custom-struct cpumask=3DAsBytesFfi
> > diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> > index 0c57cf9b4004f176997c59ecc58a9a9ac76163d9..c29312fca1b01b707bb11b0=
5d446d44480a4b81f 100644
> > --- a/rust/bindings/lib.rs
> > +++ b/rust/bindings/lib.rs
> > @@ -31,6 +31,10 @@
> > #[allow(clippy::undocumented_unsafe_blocks)]
> > #[cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_t=
ransmutes))]
> > mod bindings_raw {
> > +    use macros::{
> > +        AsBytesFfi,
> > +        FromBytesFfi, //
> > +    };
> >     use pin_init::{MaybeZeroable, Zeroable};
> >
> >     // Manual definition for blocklisted types.
> > diff --git a/rust/ffi.rs b/rust/ffi/lib.rs
> > similarity index 87%
> > rename from rust/ffi.rs
> > rename to rust/ffi/lib.rs
> > index f961e9728f590fd2c52d4c03a1f715d654051d04..14052362f091a609bc505fe=
6eca77fe998fe2321 100644
> > --- a/rust/ffi.rs
> > +++ b/rust/ffi/lib.rs
> > @@ -10,6 +10,11 @@
> >
> > #![no_std]
> >
> > +#[doc(hidden)]
> > +// This lives here to make it accessible to `bindings`, similar to the=
 other `ffi` types.
> > +// User code should access it through `kernel::transmute`.
> > +pub mod transmute;
> > +
> > macro_rules! alias {
> >     ($($name:ident =3D $ty:ty;)*) =3D> {$(
> >         #[allow(non_camel_case_types, missing_docs)]
> > diff --git a/rust/kernel/transmute.rs b/rust/ffi/transmute.rs
> > similarity index 100%
> > rename from rust/kernel/transmute.rs
> > rename to rust/ffi/transmute.rs
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index f812cf12004286962985a068665443dc22c389a2..4aa54dd83319ef16bd4baa1=
964114f1e6549942b 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -63,6 +63,7 @@
> > extern crate self as kernel;
> >
> > pub use ffi;
> > +pub use ffi::transmute;
> >
> > pub mod acpi;
> > pub mod alloc;
> > @@ -146,7 +147,6 @@
> > pub mod task;
> > pub mod time;
> > pub mod tracepoint;
> > -pub mod transmute;
> > pub mod types;
> > pub mod uaccess;
> > #[cfg(CONFIG_USB =3D "y")]
> > diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> > index d66397942529f67697f74a908e257cacc4201d84..bde94c2a8ddf708872bcd56=
a4713784b5ccdf04e 100644
> > --- a/rust/macros/lib.rs
> > +++ b/rust/macros/lib.rs
> > @@ -506,7 +506,7 @@ pub fn kunit_tests(attr: TokenStream, ts: TokenStre=
am) -> TokenStream {
> > #[proc_macro_derive(FromBytes)]
> > pub fn derive_from_bytes(tokens: TokenStream) -> TokenStream {
> >     let input =3D parse_macro_input!(tokens as DeriveInput);
> > -    transmute::from_bytes(input).into()
> > +    transmute::from_bytes("kernel", input).into()
> > }
> >
> > /// Implements `AsBytes` for a struct.
> > @@ -536,5 +536,25 @@ pub fn derive_from_bytes(tokens: TokenStream) -> T=
okenStream {
> > #[proc_macro_derive(AsBytes)]
> > pub fn derive_as_bytes(tokens: TokenStream) -> TokenStream {
> >     let input =3D parse_macro_input!(tokens as DeriveInput);
> > -    transmute::as_bytes(input).into()
> > +    transmute::as_bytes("kernel", input).into()
> > +}
> > +
> > +#[doc(hidden)]
> > +#[proc_macro_derive(FromBytesFfi)]
>
> Let=E2=80=99s perhaps capitalize this as FromBytesFFI?

Our Rust coding guidelines[1] do not specify a kernel-specific
practice here, and say to defer to standard ecosystem guidance[2].
Derive macros take the position of traits, which should be in
UpperCamelCase. There is an explicit section which reads: "In
UpperCamelCase, acronyms and contractions of compound words count as
one word: use Uuid rather than UUID". While we are free to define our
own naming standards in the kernel, I do not see anything in the
current Rust coding guidelines[2] to overrule standard guidance here.

[1]: https://docs.kernel.org/rust/coding-guidelines.html
[2]: https://rust-lang.github.io/api-guidelines/naming.html

>
> > +/// This is equivalent to `FromBytes`, but uses the `ffi` crate as the=
 trait definition site
> > +/// instead of `kernel`. This is intended for use inside `bindings`. E=
veryone else can refer to the
> > +/// trait through `kernel`.
> > +pub fn derive_from_bytes_trait(tokens: TokenStream) -> TokenStream {
> > +    let input =3D parse_macro_input!(tokens as DeriveInput);
> > +    transmute::from_bytes("ffi", input).into()
> > +}
> > +
> > +#[doc(hidden)]
> > +#[proc_macro_derive(AsBytesFfi)]
>
> Same here?
>
> > +/// This is equivalent to `AsBytes`, but uses the `ffi` crate as the t=
rait definition site
> > +/// instead of `kernel`. This is intended for use inside `bindings`. E=
veryone else can refer to the
> > +/// trait through `kernel`.
> > +pub fn derive_as_bytes_trait(tokens: TokenStream) -> TokenStream {
> > +    let input =3D parse_macro_input!(tokens as DeriveInput);
> > +    transmute::as_bytes("ffi", input).into()
> > }
> > diff --git a/rust/macros/transmute.rs b/rust/macros/transmute.rs
> > index 43cf36a1334f1fed23c0e777026392f987f78d8d..9bd6d279675fb1d58cdceff=
1f4dde0dcf33fbf99 100644
> > --- a/rust/macros/transmute.rs
> > +++ b/rust/macros/transmute.rs
> > @@ -1,6 +1,6 @@
> > // SPDX-License-Identifier: GPL-2.0
> >
> > -use proc_macro2::TokenStream;
> > +use proc_macro2::{Span, TokenStream};
> > use syn::{parse_quote, DeriveInput, Fields, Ident, ItemConst, Path, Whe=
reClause};
> >
> > fn all_fields_impl(fields: &Fields, trait_: &Path) -> WhereClause {
> > @@ -19,7 +19,8 @@ fn struct_padding_check(fields: &Fields, name: &Ident=
) -> ItemConst {
> >     }
> > }
> >
> > -pub(crate) fn as_bytes(input: DeriveInput) -> TokenStream {
> > +pub(crate) fn as_bytes(crate_: &str, input: DeriveInput) -> TokenStrea=
m {
> > +    let crate_ =3D Ident::new(crate_, Span::call_site());
> >     if !input.generics.params.is_empty() {
> >         return quote::quote! { compile_error!("#[derive(AsBytes)] does =
not support generics") };
> >     }
> > @@ -27,7 +28,7 @@ pub(crate) fn as_bytes(input: DeriveInput) -> TokenSt=
ream {
> >         return quote::quote! { compile_error!("#[derive(AsBytes)] only =
supports structs") };
> >     };
> >     let name =3D input.ident;
> > -    let trait_ =3D parse_quote! { ::kernel::transmute::AsBytes };
> > +    let trait_ =3D parse_quote! { ::#crate_::transmute::AsBytes };
> >     let where_clause =3D all_fields_impl(&ds.fields, &trait_);
> >     let padding_check =3D struct_padding_check(&ds.fields, &name);
> >     quote::quote! {
> > @@ -37,13 +38,14 @@ unsafe impl #trait_ for #name #where_clause {}
> >     }
> > }
> >
> > -pub(crate) fn from_bytes(input: DeriveInput) -> TokenStream {
> > +pub(crate) fn from_bytes(crate_: &str, input: DeriveInput) -> TokenStr=
eam {
> > +    let crate_ =3D Ident::new(crate_, Span::call_site());
> >     let syn::Data::Struct(ref ds) =3D &input.data else {
> >         return quote::quote! { compile_error!("#[derive(FromBytes)] onl=
y supports structs") };
> >     };
> >     let (impl_generics, ty_generics, base_where_clause) =3D input.gener=
ics.split_for_impl();
> >     let name =3D input.ident;
> > -    let trait_ =3D parse_quote! { ::kernel::transmute::FromBytes };
> > +    let trait_ =3D parse_quote! { ::#crate_::transmute::FromBytes };
> >     let mut where_clause =3D all_fields_impl(&ds.fields, &trait_);
> >     if let Some(base_clause) =3D base_where_clause {
> >         where_clause
> > diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
> > index 1d5fd9efb93e9db97fec84fca2bae37b500c20c5..2033b7125558d7ccfae67b9=
4777f5ce59593a528 100644
> > --- a/rust/uapi/lib.rs
> > +++ b/rust/uapi/lib.rs
> > @@ -34,6 +34,10 @@
> > type __kernel_ssize_t =3D isize;
> > type __kernel_ptrdiff_t =3D isize;
> >
> > +use macros::{
> > +    AsBytesFfi,
> > +    FromBytesFfi, //
>
> Why is this =E2=80=9C//" here? Is this related to the import style change=
 that took place recently?
>
> > +};
> > use pin_init::MaybeZeroable;
> >
> > include!(concat!(env!("OBJTREE"), "/rust/uapi/uapi_generated.rs"));
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index 147d0cc940681426771db865bc2462e7029a6d7d..843d081eacaca8edeeac597=
8bd8107a498008186 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -137,7 +137,7 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, core_edit
> >
> >     append_crate(
> >         "ffi",
> > -        srctree / "rust" / "ffi.rs",
> > +        srctree / "rust" / "ffi" / "lib.rs",
> >         ["core", "compiler_builtins"],
> >     )
> >
> >
> > --
> > 2.52.0.305.g3fc767764a-goog
> >
> >
>
> ^ IMHO, this should also be in separate commit.
>
> Looks good to me overall.
>
> =E2=80=94 Daniel
>
