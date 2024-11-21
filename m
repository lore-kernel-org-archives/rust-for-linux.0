Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECC41E52D
	for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732189192; cv=none; b=ieEYDU/SHduftesvlnMFpc14e/lALOfYJg7aFto/YIAaFL5aCqudESnLVzTJBTtd6crVE/ANPzHJ1ywZsHtz9zOOck0KyDKBmLCmpqeLyGAl/FkmpEjgNue2XMofrp4M7SQ70ZTlOYD6KLUzt2mqkg/NoDScuQpjqrE/t+AmCIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732189192; c=relaxed/simple;
	bh=U9v+K6sJOOG6x+RFfN+V0Si4bcR0z6pz+6B8md76rd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOEx0OE9cgzzpnpKca2URci9Pu1q1CDWgFGQvTN8d5yvGXMSAosIfv7q5J0DdcF4oRpy/X9nmlBfsD8/5881FM9q8Qn0jZXyqj5DnTmfqIShDgJzWmZ/qOzkh5pDMEjtFclP42FgCQ75ukhxLvZoGUe6ZSoFGF5YXzbCFUe57gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BYzmFeM4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BYzmFeM4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-382376fcc4fso448972f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 03:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732189189; x=1732793989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IZyw4FOcZ6R/V4mnMHgpIhe+XP7mjUrhnLeyIz/iRg=;
        b=BYzmFeM468ryeUt8P7KEyeA1lUTodlyL0qC5KvLydrMZm020b8jJhu6MO3C9FtXkKi
         zLU5JG5RWXvXb2wHC6s1ZWQhgPNlz6OpOkIFOoQpaZ+czaz5r0wZEMmCx7YV9zpknheC
         PZw1ZA0S5x/xX3Sd/VWQNss8SiHQTfQJ69Ojtn+e+tkBYpiI24L/fXTdGUSB9TOiB/yj
         ehV92xYuUx0a+Uyp4uncsyJRz3imYbMMxLfBCUTElx8M1UuQ+0hHZhM70vDEMsaoyAR2
         +p6KOCbe9TGxdg540BE/Tdy4iZ2BEH2E5cJNlVcRVyqT4QyySuZq6dacRW72Qg2W/50w
         Ol5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732189189; x=1732793989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IZyw4FOcZ6R/V4mnMHgpIhe+XP7mjUrhnLeyIz/iRg=;
        b=HFd/DFgzr7bdGNakPidhh8qoaJumOgMmhnbc0nZKjxwhEYzey95z32N77IwogJTVLu
         bO9i2JGT+FdicnUmBpShZiQ693Ht92YihTjaMkp2oj03gSmz36T4sfVttQuiNkSEvEYv
         CURshzC0OU1oBTSEI+PyLEWcI4O1JgxjICzjufM7VMHL6AANFcYEWb+Dh0qFWoZDi8e5
         ImouGXKnovp8+6zAUkc5HklHdbNItgRs8MuIAYMyElh4srRbcv4ddaF9ltxEDmVAP+jx
         l8oT6RNLaBbhB2B+wwunxOqLraVMYP0CsakY4R4cGnbyuUky/dUlAkVFQx03LDc5zM9L
         xcDw==
X-Forwarded-Encrypted: i=1; AJvYcCWPaXnEb5t2KRYCTch1tIZwwEy0UBdCwMOHEy358tzYyk60xlC/FGFL/t7ndGS6+KjiA2/da7G1XtXPLIiTYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze8biXIPgjTISI4azt0N2NM6xdSYwSiBeq0Zm00h1LmG0ycWoj
	ccJQMioopO8rDtAvzt35jPZ5ij3gU3453lorBLoxnQgb3pZERz+vVo9IQP0GgtFitrPMggz9sZk
	laD/xNMf6dUx6hkYIjSznK/O9OK/pLdXLFXL4
X-Gm-Gg: ASbGncvrZoJc41u2GMG4suKCF5b3/FkJeYXWMOLFQGxhIn44DG7ImM+RHnqzif0Nvn8
	GE5z+EYftTdFG/xrLk71UKiGgnK/YBU7LNqpNuMJxyZS2eIm14cfFm5vZGhdTqw==
X-Google-Smtp-Source: AGHT+IHOUT5TK9qW8nVjhNy0VpEtuheP882P7CKZcuAtr3r08tu4OVDN35SCuTs2d/vi/YNbZK0QGKu6hwSa17GxWlo=
X-Received: by 2002:a5d:47af:0:b0:382:44e0:c5e9 with SMTP id
 ffacd0b85a97d-38254af9c4fmr4724755f8f.25.1732189189300; Thu, 21 Nov 2024
 03:39:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-vma-v8-0-eb31425da66b@google.com> <20241120-vma-v8-5-eb31425da66b@google.com>
 <5762ab92-3091-46cf-9565-f59cf917b470@lucifer.local>
In-Reply-To: <5762ab92-3091-46cf-9565-f59cf917b470@lucifer.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 21 Nov 2024 12:39:37 +0100
Message-ID: <CAH5fLgjDfSL+7XB28sYmq4e40yxBv97h7jQPs=9Qe4+_3f1FRw@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] mm: rust: add mmput_async support
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

On Wed, Nov 20, 2024 at 8:47=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Nov 20, 2024 at 02:49:59PM +0000, Alice Ryhl wrote:
> > Adds an MmWithUserAsync type that uses mmput_async when dropped but is
> > otherwise identical to MmWithUser. This has to be done using a separate
> > type because the thing we are changing is the destructor.
> >
> > Rust Binder needs this to avoid a certain deadlock. See commit
> > 9a9ab0d96362 ("binder: fix race between mmput() and do_exit()") for
> > details. It's also needed in the shrinker to avoid cleaning up the mm i=
n
> > the shrinker's context.
>
> Oh Lord, I didn't even know this existed... I see it was (re-)added in co=
mmit
> a1b2289cef92 ("android: binder: drop lru lock in isolate callback") back =
in 2017
> so quite a history of being necessary for binder.
>
> I see mmdrop_async(), I guess that's not needed for anything binder-ish? =
A quick
> look in the code suggests this is invoked in free_signal_struct() and is =
there
> due to some softirq stuff on x86... so yeah I guess not :)

I didn't know it was so binder-specific. I assumed it would be a
relatively common use-case.

> >  // These methods are safe to call even if `mm_users` is zero.
> >  impl Mm {
> >      /// Call `mmgrab` on `current.mm`.
> > @@ -171,6 +213,13 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::m=
m_struct) -> &'a MmWithUser {
> >          unsafe { &*ptr.cast() }
> >      }
> >
> > +    /// Use `mmput_async` when dropping this refcount.
> > +    #[inline]
> > +    pub fn use_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsy=
nc> {
>
> Again, nitty, but I wonder if this should be as_xxx()?
>
> But I guess this makes sense too.

In this case, the as_ prefix is incorrect because this is an owned ->
owned conversion. See the API guidelines:
https://rust-lang.github.io/api-guidelines/naming.html#ad-hoc-conversions-f=
ollow-as_-to_-into_-conventions-c-conv

If we wish to use a prefix, the correct prefix is into_.

Alice
