Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6591D9A50
	for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 20:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732220288; cv=none; b=GbZi46j53hd7Y9Ls3Dij6z3e8hnLEGuvKtot0xuEh1+Hu8ofs9H4LlTMYNTquKoLGgsuo7IdnH/M/pt1F3W3KxPtrZDOuVptKT3qfyq3MmtG6CwlhH+hcdcaIsPNMFPIgJanti11AoZhEGFbl4R6OZ4akH9FVCE+2xzMX3qaOew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732220288; c=relaxed/simple;
	bh=98cSwaFxCRGFRUwjUPD3e4lx7JgzTQnwUJ6h05gwh4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GxV4IzidtJoVFhYIZWMmu0IjuBNSR/hU+EqpF+mCjNE3LfCKE2vLgFgqLN/ISqc2jBXuDg3gERIILW+cBn02A/XfzVD1J+N2K0iRc6y23QMru9wX1zfjlx2VE+uXAFm9QyIOYeFf/TUtyHdbqtVlhDeu41wVycWnSO5F8nZ94sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RIIcAvgk; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RIIcAvgk"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d00ecd97beso1908a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 12:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732220285; x=1732825085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsRAQ6t08WPFqqtrK9Y/yi/Kj5TOA65Z3KS9Ukbgptk=;
        b=RIIcAvgknjsZsclVq4+YktCaIVefIyUv8xqCuSCpOIhRpWrs0ncBUXbEVlVisZ4EmF
         DmUVSur+KVPzs8kP0EABL63oAvoXIxcA2xRKWeIqiLJ3baPbMR1vCmo3+QtgXZHcERnB
         E6m7429wDOM4hqBRRszugqg8KxvPbx6+A4v0BZr30iYs1D+DQYbCLxuxbk3cAoLuDWJE
         Ox/XunnEaIrQmVIGXlkLVhwAQkLNMPYgVGF1t6mhyNYCSjy7W030jvwevYtw9nNP5IF4
         igNnbLBsKmVZ+65VORORzBtM62wHTWOFZWz2aSXFacAgFt+BSese53hsvy78m5U9y5xk
         DwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732220285; x=1732825085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsRAQ6t08WPFqqtrK9Y/yi/Kj5TOA65Z3KS9Ukbgptk=;
        b=HAPJxMDXY1FWYNXeiYxbtZDlmotgfsD33coLMOqzGw9ByXZ3p+jE/nxbnJPm4sle3H
         dg0GFcy5j0qIS4U1aAQ6LauIXES78qRYvw2Kg1Mbpvn0WulSrFtt14mhxow4v9vWLGuC
         Wpy0R21wd7vgK3hbNrHKQia6gXhMq7AIZMSZtyEcW6xjdMKejXYxfsbQ7ZvOneVp35nI
         UjykithAy8xSMfgNz2DkuLvDlxN24QZ9Tfc6N+WM1EK6NQ9M0EDdJ4z5s/xuubJ7LhB9
         7DYkLsYjBRl9XaE/3x5PGAvT2EFuWsShpPm7VRxSH61EXCyADqyuKAgUldQG/JSDEnEg
         D/ow==
X-Gm-Message-State: AOJu0YxPiYDHjsSRo0HRjqWPJFJxrlsfIzguwsKW6S71HwhymRenkwBY
	C+BhHN+XRlFIGBJ4Fq84vITsSOhGyBEJiZzXegcqSJ8m/NdZspzJkcxCB5ZH1GJ2Eg0BM3Q0S+o
	Xvol7SbNHV/Afa24mI6CflpfGTGOUvxkHcqAJgfmXCKZFKmEHOEMiciE=
X-Gm-Gg: ASbGnctBDTRuOq2lI5lbekdbz7iNu3C7+869KrlWMWhfc/xB4GpYq2bpElbWY7Sch+j
	83dM7oB6A87M1n5Z0qorz3igjZHfBOGnzmjpALyvLOkJoep53SEGI8xL8k8Y=
X-Google-Smtp-Source: AGHT+IFvnfJzTTJ/+eR3Vxjo7zD5SinHcpQMhmMje2i6LAznZGVS+bpiK7Ig3Hi4h3GcgmluFEyuti7p0HNlUHLa6I0=
X-Received: by 2002:a05:6402:5158:b0:5d0:a5a:6ffc with SMTP id
 4fb4d7f45d1cf-5d01e4fe710mr7807a12.6.1732220284214; Thu, 21 Nov 2024 12:18:04
 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119112408.779243-1-abdiel.janulgue@gmail.com>
 <20241119112408.779243-3-abdiel.janulgue@gmail.com> <CAG48ez3fjXG1Zi=V8yte9ZgSkDVeJiQV6xau7FHocTiTMw0d=w@mail.gmail.com>
 <43a07c04-2985-4999-b6d6-732794906a36@gmail.com>
In-Reply-To: <43a07c04-2985-4999-b6d6-732794906a36@gmail.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 21 Nov 2024 21:17:28 +0100
Message-ID: <CAG48ez1uzoEcsFG7Tsfj2WCXor9-mhffoWO8VFoit3j_mUC7-A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: page: Extend support to existing struct page mappings
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, open list <linux-kernel@vger.kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 11:56=E2=80=AFPM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
> On 19/11/2024 19:07, Jann Horn wrote:
> >> +    pub fn page_slice_to_page<'a>(page: &PageSlice) -> Result<&'a Sel=
f>
> >
> > Sorry, can you explain to me what the semantics of this are? Does this
> > create a Page reference that is not lifetime-bound to the PageSlice?
>
> This creates a Page reference that is tied to the lifetime of the `C
> struct page` behind the PageSlice buffer. Basically, it's just a cast
> from the struct page pointer and does not own that resource.

How is the Page reference tied to the lifetime of the C "struct page"?

I asked some Rust experts to explain to me what this method signature
expands to, and they added the following to the Rust docs:

https://github.com/rust-lang/reference/blob/master/src/lifetime-elision.md
```
fn other_args1<'a>(arg: &str) -> &'a str;             // elided
fn other_args2<'a, 'b>(arg: &'b str) -> &'a str;      // expanded
```

Basically, my understanding is that since you are explicitly
specifying that the result should have lifetime 'a, but you are not
specifying the lifetime of the parameter, the parameter is given a
separate, unrelated lifetime by the compiler? Am I misunderstanding
how this works, or is that a typo in the method signature?

> >> +fn to_vec_with_allocator<A: Allocator>(val: &[u8]) -> Result<Vec<Page=
Slice, A>, AllocError> {
> > Do I understand correctly that this can be used to create a kmalloc
> > allocation whose pages can then basically be passed to
> > page_slice_to_page()?
> >
> > FYI, the page refcount does not protect against UAF of slab
> > allocations through new slab allocations of the same size. In other
> > words: The slab allocator can internally recycle memory without going
> > through the page allocator, and the slab allocator itself does not
> > care about page refcounts.
> >
> > If the Page returned from calling page_slice_to_page() on the slab
> > memory pages returned from to_vec_with_allocator() is purely usable as
> > a borrow and there is no way to later grab a refcounted reference to
> > it or pass it into a C function that assumes it can grab a reference
> > to the page, I guess that works.
>
> Yes, I think that is the intent. I appreciate your help in pointing out
> the issues with using refcounts in slab memory pages. As you can see,
> page_slice_to_page() only returns a Page reference (not a refcounted
> Page). Hopefully that addresses your concern?

Does Rust also prevent safe code from invoking inc_ref() on the
returned Page reference? Normally, the AlwaysRefCounted trait means
that safe code can create an owned reference from a shared reference,
right?
