Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9127417BB2C
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Apr 2024 19:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713468968; cv=none; b=CtbwJy3Y81LdykHsa4iD0AbrPM8u4uoTmTVlw1rLg/6V/D+gShA6Hqb5rjfVHmFpN8jeWZkvVywvQb1ztqYb6SWY4N0Idqlkk9I48fMmdefpmqy6EFNDMAxlwSbn4abSD2oU4DdvNk2yQRGXAuU3xZS0r8zPuLxNxF9h/RQyjgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713468968; c=relaxed/simple;
	bh=4wnmGBPm7QXnFuYr3SnHPxOZEt/EMqUAhmJpVbdQCQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhcdepDtWSxCg2GU33ARyioQqsEwua4/Mvybcg3up6L4jBXjAu5pzmPb94MwmoKQoMkKST53pr9hpvZ7eiUraF4dd87SiJjlAa7Bn8luua3Ch8gb/ZPS1Us01Lcp6774pxYLuDO0MiIDdhXggNPGTWCB96A8gRhvHuwoQa8ahFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=necsN8/n; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="necsN8/n"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7eb89aa9176so315770241.3
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Apr 2024 12:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713468965; x=1714073765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDw45IBLdxhM9LjWeyHX6+dY7iByC19AmUWN5RO+9ZI=;
        b=necsN8/nbNrlCCZ/hWYYg/qlHEzSSUAe2ndDeoK2YUvEoNjFpGYUGIb1Ks+8yz+E4d
         IybkuIIq/E2x5W7AyKJsXul0NafZ8e3MMYgsMss8gthbxtJpY6qlP5U9+YAekULqwyJp
         YSMaWZzfvnm2x8IYWItnempkbKuhDYBxcdm3aEXWwt2P7BIgL8J3XY5SPwyiXuGwQ44g
         RCyGCIhk4ZNEiQ3AATvSL/gywd7E0OsmAOkNybQr7UgdfAclUNZLfRU8C8U1Gmp8iPGr
         qIlOCRqB1dUIcXnAkGU2yaHeFFk/fDf38bsX20d6jDJBWLP3qPzRhsmpY6TOhSKzeqRJ
         LQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468965; x=1714073765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDw45IBLdxhM9LjWeyHX6+dY7iByC19AmUWN5RO+9ZI=;
        b=GX2SIXyrm3U3GtUWkvam95b97aq/TRy/RPJQJgmPnnCsCzjN7UTrjsPoMsT/h90yak
         U15m3iBDMsMQf+Y0PfZL5Xfa51vSryCl5O9WBQvlwkl0Mr+Wc8mPCZDP1MjJBvhmccIU
         qMuWT6SVTF/lbo0muFnZhe7uOM/nvZOUl7BQVQpHAYGdITWb+jecZ2T+LEhFVqRpmbxK
         17GBMxW13P61A/s7B/KPX4W4s7u3bLgDr9uoaW5PtEV2OzlLr4rteEiQaAZ4hG8Vg+bE
         pjSJcdtaltbpGQ4fgmPdrXnNoIoBvw6jR5Qc4xS/2w1T6jLOOMRzAOBLLQR7uupaN7ve
         SNqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG67n4szKFsdbe9GrBgEqo4xFFCzHDDK8YFIpjguYzyAHi0WtxRcBt9mEpws0cYHF7R6LgrgeW5yoHB5jZa44isOGvVnqa0RtIavpKKMI=
X-Gm-Message-State: AOJu0YxWTSpJZR/oGgIonsXUDPYrEjIDT7IH8Umbqp+MNN9va9adDIQR
	d5PsqO4Z0U6AJvujkMR4bhY3MPljrbtcvNEu0Zq9AmJt3w+sG9QJsOq40PMNAUv4yknMtJ1phfr
	2Hi9K347Rt3bh9wcN21z8lGEiaUKql3tDim+V
X-Google-Smtp-Source: AGHT+IHWSmA+AfhQF9/pyCrR3PIU8inWb525EGlHJDtOQVNbZNkBZXIDGXbngqcol+h71pHrWWwtbSq3HJMU/ZUYWPc=
X-Received: by 2002:a05:6122:178f:b0:4d1:4e40:bd6f with SMTP id
 o15-20020a056122178f00b004d14e40bd6fmr4926638vkf.10.1713468965153; Thu, 18
 Apr 2024 12:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418-alice-mm-v6-0-cb8f3e5d688f@google.com>
 <20240418-alice-mm-v6-3-cb8f3e5d688f@google.com> <5fd684d8-d46d-4009-bcf8-134dab342322@proton.me>
 <CAH5fLgiMLxmmm0AVX_5HQF61FzzN69GCKabrr-uM_oV-rRMuHw@mail.gmail.com>
 <c6239407-8410-49e2-a8a1-16be8468ab88@proton.me> <ZiFWIFMSBbU0i8JF@boqun-archlinux>
In-Reply-To: <ZiFWIFMSBbU0i8JF@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 18 Apr 2024 21:35:53 +0200
Message-ID: <CAH5fLghTqbK-b4z_GJYJF9PFj8JkkKE+dNNpELFZspC2o9Oa1A@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] rust: uaccess: add typed accessors for userspace pointers
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, Trevor Gross <tmgross@umich.edu>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 7:27=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Thu, Apr 18, 2024 at 04:23:06PM +0000, Benno Lossin wrote:
> > On 18.04.24 15:17, Alice Ryhl wrote:
> > > On Thu, Apr 18, 2024 at 3:02=E2=80=AFPM Benno Lossin <benno.lossin@pr=
oton.me> wrote:
> > >>
> > >> On 18.04.24 10:59, Alice Ryhl wrote:
> > >>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> > >>> index 8fad61268465..9c57c6c75553 100644
> > >>> --- a/rust/kernel/types.rs
> > >>> +++ b/rust/kernel/types.rs
> > >>> @@ -409,3 +409,67 @@ pub enum Either<L, R> {
> > >>>       /// Constructs an instance of [`Either`] containing a value o=
f type `R`.
> > >>>       Right(R),
> > >>>   }
> > >>> +
> > >>> +/// Types for which any bit pattern is valid.
> > >>> +///
> > >>> +/// Not all types are valid for all values. For example, a `bool` =
must be either zero or one, so
> > >>> +/// reading arbitrary bytes into something that contains a `bool` =
is not okay.
> > >>> +///
> > >>> +/// It's okay for the type to have padding, as initializing those =
bytes has no effect.
> > >>> +///
> > >>> +/// # Safety
> > >>> +///
> > >>> +/// All bit-patterns must be valid for this type. This type must n=
ot have interior mutability.
> > >>
> > >> What is the reason for disallowing interior mutability here? I agree
> > >> that it is necessary for `AsBytes`, but I don't think we need it her=
e.
>
> Hmm.. technically, if the interior mutability behaves in a way that each
> byte is still initialized during the modification, then it should be
> fine for `AsBytes`, for example and `AtomicI32` (implemented by asm
> blocks)? Not making any change suggestion, just checking my understand.

No, that's UB. When the type is not interior mutable, then any two
loads from the same immutable reference may be assumed to return the
same value. Changing it with an atomic would violate that since the
value changes.

Alice
