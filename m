Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B772F4A03
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 10:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081799; cv=none; b=RzrFKKRrUFOeKiEaASn8UTr0bFaiqGGape7Zptfmv4DuASIBKU9CNNlJRgXCnOqFaCyC3fIkwlLAItkU5fOtXhNKE7KHbInf2vThFXDe6oBFYn8ZMdVwlHAyLEFMrj/PhQCL22I1C0d+KPKiMO1wqaOTYJkFagzMOqdxVfOlrqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081799; c=relaxed/simple;
	bh=Lf/NL5QOHwMW2Iutxnd4wsPDuulfO9RRCXtezf2rcik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6EDFNz5jBVil3ZALDobu9QlHnZI6jbay4Cyn9701cFUe1ktGGfOflmQ9xNEOoDnlJQPkZqWLDWOgkYhQWbn+Zx0c7X4rfcOiLSvt4jsMY7qdEjeNtMYkvGgDVeCVeK1gkuWtQR9efUhH6HPS92ZiWFY5fuGn5x6a9BEaC9lHxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xKwKwZjk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xKwKwZjk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b7961cf660so5231633f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 03:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755081795; x=1755686595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4uE0XQX9BBRs7vnQBat+j8UAbJkeGIyj7RMIBvdIaE=;
        b=xKwKwZjkZ3tkatJeTmCcvf2yjCa51bb9CpbIcUIvhmepqix5shtLKIbWYz4B1rRlXc
         NFaKj3Fj7aRvqI9MaPsGfAUEQ+udmSAEstdbl2aCW16DhrYiQAvGiN8vzG1Gl6HphHNb
         38+k4nH5haTOv6UdKYS+RAWGr+BNtFXgOazkxAhG/wMTGS9IpuyS7AfqECCZoW+nGL3d
         C5jQmEfwHPxQjYc+xFj61jDU00XoyFIsqHORGXdZZE8/yI9sL4JDjuYt+2WhHL14e4jq
         qwPHaH2LWlFH5NSO/sr6IR/0XQHNpDaKFXFvQHbRLZxmqpfPdm8ZjW4KF7bkzcR7V64Q
         ORbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081795; x=1755686595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4uE0XQX9BBRs7vnQBat+j8UAbJkeGIyj7RMIBvdIaE=;
        b=VtHsdK7HP1jTREXkd9fL66YxcDY16daYLMP7rb6FyGCTDIjlYWpCxtlvHZFOB073G7
         7Vgk5L3zzz/WMIAOJ1z9djf6ETlHlW/NYJ0JjKBwG5kMW/f7jtstLLzBxYOlTznxFvYt
         f90cuoxfDhdQGULuo98QuG1Mfx2E+/DfIzNFFZM8s58W+UhlTQ8oD2eRYlfC1YL3oigP
         cgkd2UizAMFY4NoZHY+oDrzmdg6YwamqNuIOCAL/Uab1T4gxuhKTzSYvuYyVjWDA67LB
         EHWuWiVEKIwdAjMjI2z434wUChYL1cz0EZ/1984zBmjspk1jOpm0MVEmJEZoloseoxQL
         Kmiw==
X-Forwarded-Encrypted: i=1; AJvYcCUjz1Knovhh8N7a53SZqha9sUXZLNQ3U2OOVMDSFxqBdm9vMeLseKggHQG4OgS4ulFui0gmY5KchLJFZ8ddtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOoamoaEvxrTifNo6oFrFzAHDAHoFd9qH5T8gESMwPwH8BCLy
	aMHi7EC0EGG4eVgQX8qSbuegKhdR0bg8Bqf6qfq4+WAh4+OXpB/MEVtDgk1OFvRYio4znjoV3Jf
	pJrtFiIo/JJYAiWiPbAlSjVIS+se/qi2zE99P30xp
X-Gm-Gg: ASbGncu2YFcImohe7ia2vEpHbiTJ43/Sd7UGV2fP2kjFbjzziOsqSyIEcMAxuOu0fKi
	MIFVlyPEd2C2/b/ljxdgG0EaPcTYsACZB5TCfrW+hTyYTG+X/mK8eiMvkuZXqLc4VUphus5l5oM
	VTiwko/loohPKTqnwIwLO+cLvry+pj8Ee+0RL8pVuPEMLMxi4GnuKm6i5LwOtvU75z1p8BO8ycn
	TSSu7Bwtx7HvU+MUitsAigu5vsUGBrmIBRBEA==
X-Google-Smtp-Source: AGHT+IF/TV3ToK4rxIMHl5p7DjAnTq4l6H00VcPGxiaF+/Z4Vi/IkaVQ/YobLKuN2AYnUwN4jqZ8h195KcmiHubxYOo=
X-Received: by 2002:a05:6000:40ce:b0:3b7:8473:312c with SMTP id
 ffacd0b85a97d-3b917c6f512mr1752518f8f.0.1755081795255; Wed, 13 Aug 2025
 03:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-align-min-allocator-v2-0-3386cc94f4fc@google.com>
 <20250811-align-min-allocator-v2-1-3386cc94f4fc@google.com>
 <DC0N2SBVHIS7.2P91EJSTIT1FM@kernel.org> <aJxESG0l4-kyUHXg@google.com>
 <DC16OLU29VX3.16T0QDJF7Q18P@kernel.org> <CAH5fLgj0kjGBwZFHjErsa7MCV1fz4xTWwrZAcFzHHnkbvS=OMg@mail.gmail.com>
 <DC182DB9HNS9.21ZVBYT6DXHDE@kernel.org>
In-Reply-To: <DC182DB9HNS9.21ZVBYT6DXHDE@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 13 Aug 2025 12:43:02 +0200
X-Gm-Features: Ac12FXzxznSW7kYK-990_IfjHnKYHoLoTPqwohIab_6KCmVnUpHRy9Ptq6yMDuE
Message-ID: <CAH5fLgjYNy3R79nZzPOttk1fx81T+_Q+h8Ug40aVz44TNaCVgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: alloc: specify the minimum alignment of each allocator
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 12:19=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Wed Aug 13, 2025 at 11:32 AM CEST, Alice Ryhl wrote:
> > On Wed, Aug 13, 2025 at 11:14=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
> >>
> >> On Wed Aug 13, 2025 at 9:52 AM CEST, Alice Ryhl wrote:
> >> > On Tue, Aug 12, 2025 at 07:52:35PM +0200, Danilo Krummrich wrote:
> >> >> On Mon Aug 11, 2025 at 2:31 PM CEST, Alice Ryhl wrote:
> >> >> > diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/a=
llocator.rs
> >> >> > index aa2dfa9dca4c309e5a9eafc7da6a8a9bd7b54b11..25fc9f9ae3b4e471a=
08d77130b374bd1397f7384 100644
> >> >> > --- a/rust/kernel/alloc/allocator.rs
> >> >> > +++ b/rust/kernel/alloc/allocator.rs
> >> >> > @@ -17,6 +17,8 @@
> >> >> >  use crate::bindings;
> >> >> >  use crate::pr_warn;
> >> >> >
> >> >> > +const ARCH_KMALLOC_MINALIGN: usize =3D bindings::ARCH_KMALLOC_MI=
NALIGN as usize;
> >> >>
> >> >> I think this needs the following diff:
> >> >>
> >> >> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindin=
gs_helper.h
> >> >> index 84d60635e8a9..4ad9add117ea 100644
> >> >> --- a/rust/bindings/bindings_helper.h
> >> >> +++ b/rust/bindings/bindings_helper.h
> >> >> @@ -84,6 +84,7 @@
> >> >>
> >> >>  /* `bindgen` gets confused at certain things. */
> >> >>  const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN =3D ARCH_SLAB_MI=
NALIGN;
> >> >> +const size_t RUST_CONST_HELPER_ARCH_KMALLOC_MINALIGN =3D ARCH_KMAL=
LOC_MINALIGN;
> >> >
> >> > Hmm. Maybe that depends on the configuration? The constant was gener=
ated
> >> > for me. Either way, happy with the suggested change.
> >>
> >> That is a bit odd, I'd like to understand this before merging.
> >>
> >> All of the definitions in the kernel are defines that shouldn't be pic=
ked up by
> >> bindgen.
> >
> > It is possible for bindgen to pick up a #define in some cases. The
> > main case where bindgen fails is when the macro is defined in terms of
> > a function-like macro. This is why we see so many failures with _IO*
> > macros.
>
> I think I see it now, ARCH_KMALLOC_MINALIGN seems to be either a literal =
or
> __alignof__(unsigned long long), either directly or indirecty through
> ARCH_DMA_MINALIGN. bindgen doesn't like the __alignof__() extension.

That sounds right. So yeah, please go ahead and pick it up with the bindgen=
 fix.

> So, I assume you were on arm64? :)

I did in fact build for arm64, yes.

Alice
