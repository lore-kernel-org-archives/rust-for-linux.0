Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F307E1EBFE6
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483264; cv=none; b=OZ9v7P3LycICWgOOg+/gf/9gyAIaiPCXdiD0UzFxJOvlYGG+Tf7e8gixY3jbQqZlYKgiKpsWV//oCPk2G+be6uT0o9J9Fz7i8Zr4jGDRo8K9f313lCbYKqmY8yMM+5Ta24vNScA2/IhoDzCZLHKecJ4VG+Tctlq0l3kNNqVmakw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483264; c=relaxed/simple;
	bh=CREou4y/+U6bUYhLNe/N351zpQJAgpdQqf53UGRVSBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdxDEJFIFCAqy46X1dubk5acZpCI6WGZdKrd+2npIsLo4hADrBDhjHydQQPgSS4udis1e79ZkIrcbyrBACQSOkWN+LomU1ga/UFLxQIBlJSQWjIzxI/FCTq/uHwb7b+CKL+Iu8yRTnZD4x6Muo7Zl1T5z8RyscrGQhw9roeEO2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w9A012Zq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w9A012Zq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3062543f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 03:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740483261; x=1741088061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TieRo03C9onpOScmMgtCBQj1o1WeXXfQS18urJ4Jtb4=;
        b=w9A012Zq+ISEbHKlHjjvxiikKN4ZWRBRygHhyQAXrVlf/cgPUW+Pb8PmiNaTKmq5Vo
         XkSjRfQPY/y4tLt/VO5ar3POV6TiV5PII6C0G+43OIYrYFElqd75vL0PQaMulhWrvVVX
         5NSeml/aekAcwXW9rKSZYmDivH5ecq67WifyFAp0x/l/0R/c04cyu2EpYXTWQX9Npjg2
         YIMG+k3xz9XdaHp6z76J+mrZrEC4kpAkSRmdK4HFgrgkBTnuywbuKPiEaVClWe6Xpcrk
         XQ6juTgjm+65us0ft7/gfuVUcWLblcXtNGpRiPA0qutiWnuuseHj07wL8Y6gz3dGkuv0
         qXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483261; x=1741088061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TieRo03C9onpOScmMgtCBQj1o1WeXXfQS18urJ4Jtb4=;
        b=GBMu67pMrO2wyaFXRTCSPvXhj3ryyEJPs2NLsxhwCcuJfEleXkltDsrT3QIHILYRb/
         CkDq77YH709stMD2Hgb/nm5I/UqBtw6vFxJ7qmOJSoLmp3HQATT1ZJ17AvVfkkhgoWH8
         Ah/Y4dfK2Mc3S7mRzge7juwsSuMQeTupyZPMjvdAUoW8FUpKS65iyLYGwGjDOmMk6iis
         71heP/k48cz2gSyEoC/MEPrchMRReAr4lfnCh5f2Vxs0HSn9/H0IwHJlrWO+K867kvyo
         I4r8YNeCeFNvSCtQU/CyS377fKxXmfsms/q0lvxUctbMAo4dSAxqPgMfb9WMiqqm/8l7
         fQ8A==
X-Forwarded-Encrypted: i=1; AJvYcCWb5dZ5bE6MeTQ+o15kxLeFui+y4GrPP8ZY5VCuevv3qn1J17fCu+CvH04MQdjU1MgKqD1GFVwUG1y8YO3Hhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHu4NnpR6PbX7+E3sDf/KV4F4fz/pTVa7crGXusWS8kyE4Wzx
	oOaDv8UVeJtRWsNUbs82XK+B7gWdaHJ942JRs8F7zsEcL62fo8zo2ghCaJqBsfWJueZJeLbblUX
	L8nY+25mx7X+q6SATyMNvKfhVLFFylwiPgokW
X-Gm-Gg: ASbGncvww9IebIps1FjAWz7RpoATsKzetWHM2YIMO3etoFCOf4mazZrY6KalgeCdhm6
	wKkDpdySDSVHBx6mXmXFuEhLF2wdQFo5cS8XkU0aTzym0ZF9l93UxJeBmO25qizS5RpxkA7u3VV
	U3kp+4wUrkj0u16BmgKHUrbcT+l2NlYtm50yFtvA==
X-Google-Smtp-Source: AGHT+IFuQe5i+7zSpyl92MNrd+ihjdRnVV5HSYuuSo3c0eiByulZFl7LuiY4yHbGeqIo5m3MYEG1Igcn/QXeQMwNFW4=
X-Received: by 2002:a05:6000:47:b0:38c:617c:ee2f with SMTP id
 ffacd0b85a97d-38f6e95f4bdmr11415200f8f.13.1740483261227; Tue, 25 Feb 2025
 03:34:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740475625.git.viresh.kumar@linaro.org> <68ac0f0ee3c0ebd3d3cc078a6270752778a1b732.1740475625.git.viresh.kumar@linaro.org>
 <CAH5fLgg7o7hs5B4mMzPd6RzYm+RcX8gw1Aw8voJqnmfnA_aM4Q@mail.gmail.com> <20250225105425.ooqvefiae5bmr723@vireshk-i7>
In-Reply-To: <20250225105425.ooqvefiae5bmr723@vireshk-i7>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Feb 2025 12:34:09 +0100
X-Gm-Features: AQ5f1Jqoh_oqWwzicR7sl7AH4qtQrypdV62Ab3La63JTVep-rxjy5YnPI5krq8s
Message-ID: <CAH5fLgjbW0yGm0TQcQEG9cc+i3WxbF8JKaqBUFD7=pJ-JkJ9zg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: Add initial cpumask abstractions
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 11:54=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> On 25-02-25, 10:55, Alice Ryhl wrote:
> > On Tue, Feb 25, 2025 at 10:47=E2=80=AFAM Viresh Kumar <viresh.kumar@lin=
aro.org> wrote:
> > > +impl Drop for Cpumask {
> > > +    fn drop(&mut self) {
> > > +        if self.owned {
> > > +            // SAFETY: `ptr` is guaranteed to be valid for the lifet=
ime of `self`. And it is safe
> > > +            // to call `free_cpumask_var()`.
> > > +            unsafe { bindings::free_cpumask_var(self.ptr) }
> >
> > This is missing a semicolon, but it's not the last statement in the
> > block. Did you compile this with CPUMASK_OFFSTACK=3Dn? I don't think it
> > compiles with that setting.
>
> I would always add a semicolon here, yeah I missed adding that but ..
>
> I have missed minor things before sending a series a few times in the
> past and this one really scared me thinking here I did it again :)
>
> Though I was sure that I have built the code with both
> CPUMASK_OFFSTACK=3Dy and =3Dn, I performed the builds again and it worked
> (again).  That confused me even more :)
>
> And here is what I think is happening here (which makes it build fine
> accidentally):
> - free_cpumask_var() has a return type of void.
> - The block {} allows it to build fine without a semicolon here.
> - I performed a simple test for this [1] and it works too.

Ah, you are right, the block makes it work in this particular case.

> > > +            #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
> > > +            // SAFETY: The pointer was earlier initialized from the =
result of `KBox::into_raw()`.
> > > +            unsafe {
> > > +                drop(KBox::from_raw(self.ptr))
> > > +            };
> >
> > This looks like you did not run rustfmt.
>
> I did this:
>
> make CLIPPY=3D1 rustfmtcheck ARCH=3Darm64 O=3D../barm64t/ -j8 CROSS_COMPI=
LE=3Daarch64-linux-gnu- CONFIG_DEBUG_SECTION_MISMATCH=3Dy
>
> I hope that is all I need ? I checked again with both CONFIG options,
> doesn't complain with rustc 1.84.1.

Hmm, ok. I would have expected it to format on one line:
unsafe { drop(KBox::from_raw(self.ptr)) };

That is what normally happens when the semi-colon is outside the
block. Not sure why it did not happen in this case.

Alice
