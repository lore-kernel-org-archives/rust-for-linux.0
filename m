Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD52304BB4
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 08:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046399; cv=none; b=uhPnC1DDUuGgPDDAHlY423+zWE/ttt5+ykrUNb3RQuTMCTcA8//VS6JsbX9bA4tagwXvphvball/PCS6wEQWDiWZ2nFInHGBCuzCkuLSSfSoio5GaqugN3rcSBmuOFsYE2cHyz2Vws9uqyK+L2UEYdkXpuyjR+K3C1h+1F1o9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046399; c=relaxed/simple;
	bh=6mr1THF+hd0pvtgpEhvjzCEOlin7VNQ77I5ESEr9cZI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m9zm8tR2pTo3f3egYNQ6ih8cVktb0JpKVEmMuhptwio5+Am4Us4TuvsCNZvgnmhyv4j9pliHFTOeqX7MiiisBTNmXzPjSZaRdbyX7mfNTWxdOMKSrkO8ch6r9P0+zF86SMX8PHtBzjrJ/I654Vk1fHBxg79tUs8X0dkFWkPFqf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z/OgglGn; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z/OgglGn"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47918084ac1so2870695e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 00:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766046394; x=1766651194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VujvuWmoVe0YPpt1qjDQ5PwdCLQbd5Um9DKPPj1j36c=;
        b=Z/OgglGneU0CDPrMxXRrD7Hzmf2oksxj4sVFzzii0hBRRi5YyOSH3bMBHqrb5Oai69
         XKeAmxzOEkeHVjviD92vzX8mgZssCIXJdO9fzxZnWKSeuJ9tIGrK2NYnpiHzWPSeHfAl
         LSggxAJxF6onYIz8G0zFPLxBsl06jNKCM4m1RSv1ag6qHiwpzxbWPTtNgsN552zPedMV
         OGoSYyJAfEb30AeHIbjNE6xS3J8VkhtJC6U94TrXUYXRNwxWUFM67fblAKaW7bKYovNu
         lzDK9VJF2WIzTubhcloRdHkZzeDP+EhNeVAa5P12lq8ds2omfU6ecDE+4zfY3hcRM1WT
         yk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766046394; x=1766651194;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VujvuWmoVe0YPpt1qjDQ5PwdCLQbd5Um9DKPPj1j36c=;
        b=iHnr7CN+D9voBYFc0pbW6jEeIvcsVcB6LbPct8ZrQlusw5QBvoGRp+tNi6SbRa/mDA
         E72cGM4BwmQnhaoLDDDqoFZjkrwJpwktsbokxf+EBPeG0IpTCu7rZj0AeYhmXUnliFOd
         PRXgAHEYPVZzSTQ4B81Scvb83ZbjTD8GD2tHeWPBM9n8oB25Xwr2adjU+uOs82BYTgPR
         sz0YHCFFp/bNlkVXjPzbOPg91eDjC8JIoNP++NRrz4OhJkpgfTzPOUgbjdVizXuadkZK
         ZXjmWBrTvUH5lMwoqDqOun9Uu0K75kZoCTpzSwg6qapvL/xCgs7iT+py0DVcWVKn8PcQ
         5g+g==
X-Forwarded-Encrypted: i=1; AJvYcCUSzXHebIcJa8Ux1U6Pc5CUCo/PrJ5+xnCN3LeGqOIsu7YQmwyFFVHlfl+fclrtHvnqRXJb36NSdFbCDFLwSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQ294Dk+GzzxrO9JmMuHPYTDbqCv+nGve0Q2zkkjSS837iVnY
	+KvcTLw4ojn8Ru1+4SceFMjH8jaTYMfu9hXkNGX+8ys9APOTvmMxIQSLAsG56rlSm21K1VSjAPC
	M/nkTA/Ov+7Rfo7R/Lw==
X-Google-Smtp-Source: AGHT+IHzY7fr/O0B5Q2XJndwJYXqx2TTW9UK/wENrcWm0KSPkTn3Csa/DVP3i6M4ZZSa7WXPvSGmqioFUNMOtn4=
X-Received: from wmbhn33.prod.google.com ([2002:a05:600c:a3a1:b0:477:55c0:6392])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cf:b0:477:a3d1:aafb with SMTP id 5b1f17b1804b1-47a8f90d757mr206128705e9.29.1766046394224;
 Thu, 18 Dec 2025 00:26:34 -0800 (PST)
Date: Thu, 18 Dec 2025 08:26:33 +0000
In-Reply-To: <DF15V0W5G9K5.KCPM8M4BZVOE@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-2-b23e5277ad02@google.com> <DF05VVOUA70W.30GJE9P4Z3OL9@nvidia.com>
 <CAGSQo00qe74q-Ztn2UubrMR+F-knO-DhrznSgM8Gk3j9OjNfKg@mail.gmail.com> <DF15V0W5G9K5.KCPM8M4BZVOE@nvidia.com>
Message-ID: <aUO6uUbGGtwXlrAT@google.com>
Subject: Re: [PATCH v2 2/3] rust: Add support for deriving `AsBytes` and `FromBytes`
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 04:23:43PM +0900, Alexandre Courbot wrote:
> On Thu Dec 18, 2025 at 3:01 AM JST, Matthew Maurer wrote:
> > On Tue, Dec 16, 2025 at 7:12=E2=80=AFPM Alexandre Courbot <acourbot@nvi=
dia.com> wrote:
> >> > +/// Implements `FromBytes` for a struct.
> >> > +///
> >> > +/// It will fail compilation if the struct you are deriving on cann=
ot be determined to implement
> >> > +/// `FromBytes` safely. It may still fail for some types which woul=
d be safe to implement
> >> > +/// `FromBytes` for, in which case you will need to write the imple=
mentation and justification
> >> > +/// yourself.
> >> > +///
> >> > +/// Main reasons your type may be rejected:
> >> > +/// * Not a `struct`
> >> > +/// * One of the fields is not `FromBytes`
> >> > +///
> >> > +/// # Examples
> >> > +///
> >> > +/// ```
> >> > +/// #[derive(FromBytes)]
> >> > +/// #[repr(C)]
> >> > +/// struct Foo {
> >> > +///   x: u32,
> >> > +///   y: u16,
> >> > +///   z: u16,
> >> > +/// }
> >> > +/// ```
> >>
> >> One thing I have noticed is that I could sucessfully derive `FromBytes=
`
> >> on a struct that is not `repr(C)`... Is that something we want to
> >> disallow?
> >>
> >
> > Why should we disallow this? I can enforce it very easily if we want
> > it, but the only difference between `#[repr(C)]` and `#[repr(Rust)]`
> > is whether we can statically predict their layout. In theory you can
> > use this to elide the padding check for `#[repr(C)]` structs (and
> > `zerocopy` does this), but it's significantly more complicated.
> >
> > The only argument I see in favor of disallowing `#[repr(Rust)]` here
> > is that if it's not a struct that also supports `AsBytes`, there's a
> > question about where you're getting the bytes to load from.
> >
> > I will point out that we probably don't *just* want to restrict to
> > `#[repr(C)]` because `#[repr(transparent)]` and `#[repr(packed)]` are
> > also great use cases.
>=20
> Yeah it's probably correct as it is. I am not sure why we would want to
> use it on types without a predictable layout, but also cannot say this
> is fundamentally broken.

At the very least such types can roundtrip to/from byte arrays. Or you
could pass them to the randomness pool:

https://lore.kernel.org/all/20251216-add-entropy-v2-1-4d866f251474@google.c=
om/

Alice
