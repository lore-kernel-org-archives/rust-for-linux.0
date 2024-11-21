Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EA31DB34B
	for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732200001; cv=none; b=bWLA69Bk4v2wB32yT+pzo4WktWVWvS7xqqTjEjZKT3YgHjD437N5EgIk3Rf29M5vKoyWbSyiebN+zeN9Zxlm/jcFHiAJ7JDDio3pZnUrgtSdl39dlsb65/nru486LgiSZhJNvhXwgW7m9VUdZeH5mB0O86f+YC6E89KjiFgbIEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732200001; c=relaxed/simple;
	bh=nO+3nDyIudH0dDMPwsn4/5w94K4SpantV8zCiRa35TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KR3oC0nzcV16Y6h2nqyx6aETadd6EsP5ZgnBUxYCHO4XV9//H1WaxAljnoE2lT4N7Slr3Z0bW8Dv3xILzgM/ozB3yJcs+Ic5J+KycR2PptsTCuPkRGSWLoAgHFJ9LJBU3j0J7ePZH2KuM7kWpG8Jhw8GqOIqCTNJWHfKMq0xVfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pqpPkR3v; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pqpPkR3v"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so604830f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 06:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732199997; x=1732804797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRJx2WZ5u5Th7dWmrrUrE1cesu1hkjYpX0gzcJWX5Y4=;
        b=pqpPkR3vK3iG2zgt0Fev4luKmvZQNjp1VTaM9JSOzyFKq/Lp4HdYuP5eTDfyFt8UKQ
         Y6AoMgb8/bo7OPWbOoEt2x0YnELwdlPBDvEHGHeG/UjLCwc1p+qSJUkQV7dQ1okoTeII
         5sHDImxa4D+L6OPO218ZqY2j4A5EEK3NII2eGx1rxG7eDibgmZvjnmjmeeUikzGF8dri
         +qaQ/o11HT8gWzsi9rcR73hjB8WKV8aUNrrl1jpPnQBFE96p6LVuc9tTThDiJzdDKjqF
         8PLsO8g49WFiGUfOibzPNWX27C8hHhss3NT8HcnePU+4roPMYTbKmtiAc5jfk4riYnIB
         UhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732199997; x=1732804797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRJx2WZ5u5Th7dWmrrUrE1cesu1hkjYpX0gzcJWX5Y4=;
        b=fX3wjtkRN4rb3Npk61srb9ADJ29a16Q0W6VXx8gS8xQf8qOV/UdtymAqCCHZEhOgzx
         JA4Ll7QhVXLsEz2XCFQ6c5gUYcr6vAhqGEEB78W/1P4K6tgsaXbPa9ndfGeRRhC0YADu
         FyMWHSDFQ9DWiW2Z6LBW1old6cjfGJ6WiJLFslgH0eE51tZaLjPlejK3edloVQ8F3gOx
         IIbn1isR+NwUHyq3kDjTWgIIM9SQkYk6GJloGrTszrBeZ0qYRXdpt4lCA1ieeZ6sG4nw
         gN7+5duJ7fnAVORkZz5yS4eCd63ShsFWKDSCs6b41bwjux99OE6kAdbktyu1g6RQC58C
         EK0w==
X-Forwarded-Encrypted: i=1; AJvYcCXVcIxEjr5lMWb9LbvSppVbrYqXJm3Gkol2U/8A/nS4nYT5rK08XaaJ3Yzbocfk4uO51GF2eY3OH2C1c2oSyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVpOuAnvLdkmflWXwaQJhspAyQEzE+Wf2lxFKL6OUda+vHak65
	bm7JQWcwUUTxiFJSxRT+oZHdyI6Di617kU6pVWxyeV1wFnNn4H/jJD8dPDy7ZTi7jU8XrNZ7aWN
	kEWHvVEgoRN4wO2nq/nACexqxhMrMmzKaNecl
X-Gm-Gg: ASbGncuSf+LgoydPmHSfMBxF+ePpa6otuuEWMZYQCbWelMCGJfu2g31NrqNFAkw4G0m
	XLGn4Dyx/f9Zvb8uWfh0HBijmHazYbIZGoyLPdkrK2r4mYxErcXfQs/qQYLbVqQ==
X-Google-Smtp-Source: AGHT+IEovcTS4X7zk9GHA36taO4imLGGYuJ2IpetSRs95zNJpNYqDqE1eWMgvsHvtxUKoS5Hl2pXCf075S4vMEjTkXU=
X-Received: by 2002:a05:6000:4410:b0:37c:d244:bdb1 with SMTP id
 ffacd0b85a97d-38254afcb4emr3878408f8f.26.1732199997420; Thu, 21 Nov 2024
 06:39:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-vma-v8-0-eb31425da66b@google.com> <20241120-vma-v8-2-eb31425da66b@google.com>
 <c26a63a3-0f1e-467d-b24f-3963e5e4e13d@lucifer.local> <CAH5fLghdeBvbtC+aPq0mSr1io+DUt-J54zYagys63cK-4tictQ@mail.gmail.com>
 <d2d1f25c-780d-4103-aeb1-461adc4940c3@lucifer.local>
In-Reply-To: <d2d1f25c-780d-4103-aeb1-461adc4940c3@lucifer.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 21 Nov 2024 15:39:45 +0100
Message-ID: <CAH5fLgijS7JOO==JQegexPEgx3hs8hFDcQqFa4L50F1LdfZJJQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/7] mm: rust: add vm_area_struct methods that require
 read access
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 1:50=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Nov 21, 2024 at 11:23:39AM +0100, Alice Ryhl wrote:
> > On Wed, Nov 20, 2024 at 8:07=E2=80=AFPM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > On Wed, Nov 20, 2024 at 02:49:56PM +0000, Alice Ryhl wrote:
> > > > +    #[inline]
> > > > +    pub fn end(&self) -> usize {
> > > > +        // SAFETY: By the type invariants, the caller holds at lea=
st the mmap read lock, so this
> > > > +        // access is not a data race.
> > > > +        unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_=
1.vm_end as _ }
> > > > +    }
> > > > +
> > > > +    /// Unmap pages in the given page range.
> > >
> > > This needs some more description, as 'unmapping' pages is unfortunate=
ly an
> > > overloaded term in the kernel and this very much might confuse people=
 as
> > > opposed to e.g. munmap()'ing a range.
> > >
> > > I'd say something like 'clear page table mappings for the range at th=
e leaf
> > > level, leaving all other page tables intact, freeing any memory refer=
enced
> > > by the VMA in this range (anonymous memory is completely freed, file-=
backed
> > > memory has its reference count on page cache folio's dropped, any dir=
ty
> > > data will still be written back to disk as usual)'.
> >
> > Sure, will add that to the docs.
>
> Thanks, I assume you mean this comment, which will form part of the docs?=
 As
> here we should at least replace the 'unmap' with 'zap' to avoid confusion
> vs. munmap().

Yes. Comments with three slashes are rendered in the html documentation.

> > > > +    #[inline]
> > > > +    pub fn zap_page_range_single(&self, address: usize, size: usiz=
e) {
> > > > +        // SAFETY: By the type invariants, the caller has read acc=
ess to this VMA, which is
> > > > +        // sufficient for this method call. This method has no req=
uirements on the vma flags. Any
> > > > +        // value of `address` and `size` is allowed.
> > > > +        unsafe {
> > > > +            bindings::zap_page_range_single(
> > >
> > > Hm weirdly I see this in rust/bindings/bindings_generated.rs but not =
in
> > > rust/helpers/mm.c is this intended?
> > >
> > > Is this meant to be generated _from_ somewhere? Is something missing =
for
> > > that?
> >
> > The bindings_generated.rs file is generated at built-time from C
> > headers. The zap_page_range_single is a real function, not a fake
> > static inline header-only function, so bindgen is able to generate it
> > without anything in rust/helpers.
> >
> > > > +                self.as_ptr(),
> > > > +                address as _,
> > > > +                size as _,
> > > > +                core::ptr::null_mut(),
> > > > +            )
> > > > +        };
> > > > +    }
> > > > +}
> > > > +
> > > > +/// The integer type used for vma flags.
> > > > +#[doc(inline)]
> > > > +pub use bindings::vm_flags_t;
> > >
> > > Where do you declare this type?
> >
> > It's declared in include/linux/mm_types.h
>
> I meant from a rust perspective, but I guess bindgen handles this?

Yes, anything in `bindings::` is output from bindgen based on C headers.

Alice
