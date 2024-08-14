Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610891B29A5
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723643443; cv=none; b=CwPtxHRLhty04tqdeYhQMynEWvUoTogh26gU487yN5tWjWeq6Vm3F+EBdKXjUWq0J5EF35lnkiWHnHQO69BQymkL2KQzbmjHhaH2p+5lC+QuIjcT1qoOh3yaRaS07PqF8sLLOUTnx0Iw3Mhh9XWdyGNaWzxo1C44t1p3CKYlC4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723643443; c=relaxed/simple;
	bh=5dllbuFdQk/XdLAo1kfm0ZWDW9Q7WB68XVn+ATtpGI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OY1T2528QiIGoxQj4D4g0rrPdnhRmNB1xqg0Z5b+TMc5HjQp2nQ6xcbQE/kbK5MeuT3N6jv2TXQB3P5AI0Iz8L7Lg2dbwXp7AV3b/b4F4BE6aIztkxIw2sMyeN9nn4XCLEB9B1mcKWrlGc8oH13uNzwTZpQ03KMyFyoeqIXNvdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qQXQmjTy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qQXQmjTy"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-368712acb8dso3918669f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 06:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723643440; x=1724248240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWlsD742nsSTDR/gyh46VcY1FUTXkxyk9IRkE90yJpg=;
        b=qQXQmjTyoRmLB66uOQsUypK9QvTNzvnDlFePf1Su6yIL5hexbdAc0kQywkph74foJm
         dLSooNM5/wLqIMYL+l89RcfyAF9RKdVU4SWzyrffZrTINiovPXNt/W2e6bMKfesq7lwq
         tHjb4WeIH7ZLOkey0uCS6pjz2gMv0/jxzjBTIHU2b57Ci9UNpvI6e8ri8/p1iAKHAyMi
         UKA5XXsR88PCSXNfnGvRp6RGWUuPQFUgpLFNgWx8ZLDIJwy7mS/gtiT5UEJbsAFzjz/w
         b4I7C2FMz33pwrP2PMDdtqZ2jJeK9IdGZ/mTwWIe2Z6VM/4cco6/EwSUU1YnWfmAVxDS
         qn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723643440; x=1724248240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWlsD742nsSTDR/gyh46VcY1FUTXkxyk9IRkE90yJpg=;
        b=fq93G6cs8E4KuNcnJzFJQl7XvlxgvFbxg2vEY0fCbxbTV17VEpckHIhxW475R4ySCG
         PM7VyOV2xCLc+UVLW87LSXO+FnOsWNyTEO/0J43YK3Kmfgc2ROqYyWhD1mmTechibLAN
         h/PvN+2+0bUxOvs2LziYakS4LTUya9R1VLUTugwAm9mR8LuKDHg/sLaqa7Hzdq2BDobq
         +C4tQgyG2uBiN99BbpfV4NTN1KM3n/C+woW7vrPGE0o6SqsjeR+G7ZXFN+hi2cFcSN0b
         h4uBHN89MEMd18rknDEZhE+FUmLOAlyvz+nb8j43uxfA9MlFGupEicJWIonjnTvjljc4
         sVbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjesWw11/9vZ80SHqrGHdE06La3DVtskypntYg2wJlzM7ukYJDz0EHkfeFNX2aHclmW0qGEZYQlRSnb6cZq65Ed9eWWRmxvJFklg3NGiA=
X-Gm-Message-State: AOJu0Yx4V9TikTUgIDHaReAPv6Smg3vNIIhmdCxR3p+8qqA8Tvj2HEs2
	O5jnTEbgI0r0MRacVFSS2ClTJsSHU5YgFoTqufGLDZpxn+BkryKbrEqdguvwwPCYLvaeHRqWaeB
	obzQiMMc+gSY5iNa/tIzHk9qQcXzFoHPC2VMK
X-Google-Smtp-Source: AGHT+IHj9I+uFlgfloUdFzGiBbJfNBTblh8QrvW343Z2XsZik76mgZQI5JHuhJhVeWrLt8XtSHObBHSg9NFwSyKv3Is=
X-Received: by 2002:a5d:5c85:0:b0:371:7e3f:6cc with SMTP id
 ffacd0b85a97d-3717e3f07a1mr507220f8f.9.1723643439332; Wed, 14 Aug 2024
 06:50:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812182355.11641-1-dakr@kernel.org> <20240812182355.11641-5-dakr@kernel.org>
 <CAH5fLgit0hSFWi_Bv4DFK6vvhoLfSz=BMaPDBU0Z0oyZta9U9w@mail.gmail.com>
 <Zryy04DvEsnxsRCj@pollux> <CAH5fLghsONUtxFPgD6vC139H-Uj5LDju7w5eS0JB+BnDMmfngw@mail.gmail.com>
 <Zry1qwJnPDUtp2Nw@cassiopeiae>
In-Reply-To: <Zry1qwJnPDUtp2Nw@cassiopeiae>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 14 Aug 2024 15:50:27 +0200
Message-ID: <CAH5fLgjNfJyyZygWzeTyrNi8TQNAquufxFxDgJHzq6dan=b9BQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/26] rust: alloc: implement `Allocator` for `Kmalloc`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 3:48=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, Aug 14, 2024 at 03:44:56PM +0200, Alice Ryhl wrote:
> > On Wed, Aug 14, 2024 at 3:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Wed, Aug 14, 2024 at 09:51:34AM +0200, Alice Ryhl wrote:
> > > > On Mon, Aug 12, 2024 at 8:24=E2=80=AFPM Danilo Krummrich <dakr@kern=
el.org> wrote:
> > > > >
> > > > > Implement `Allocator` for `Kmalloc`, the kernel's default allocat=
or,
> > > > > typically used for objects smaller than page size.
> > > > >
> > > > > All memory allocations made with `Kmalloc` end up in `krealloc()`=
.
> > > > >
> > > > > It serves as allocator for the subsequently introduced types `KBo=
x` and
> > > > > `KVec`.
> > > > >
> > > > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > > > > ---
> > > > >  rust/helpers.c                 |  3 +-
> > > > >  rust/kernel/alloc.rs           |  2 +-
> > > > >  rust/kernel/alloc/allocator.rs | 63 ++++++++++++++++++++++++++++=
+++++-
> > > > >  3 files changed, 64 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/rust/helpers.c b/rust/helpers.c
> > > > > index 92d3c03ae1bd..9f7275493365 100644
> > > > > --- a/rust/helpers.c
> > > > > +++ b/rust/helpers.c
> > > > > @@ -193,8 +193,7 @@ void rust_helper_init_work_with_key(struct wo=
rk_struct *work, work_func_t func,
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
> > > > >
> > > > > -void * __must_check __realloc_size(2)
> > > > > -rust_helper_krealloc(const void *objp, size_t new_size, gfp_t fl=
ags)
> > > > > +void *rust_helper_krealloc(const void *objp, size_t new_size, gf=
p_t flags)
> > > > >  {
> > > > >         return krealloc(objp, new_size, flags);
> > > > >  }
> > > >
> > > > Why are the various annotations on this helper being removed?
> > >
> > > rust_helper_krealloc() is only called from Rust, hence neither __must=
_check nor
> > > __realloc_size() should have any effect.
> > >
> > > I also do not apply them in subsequent commits for the vrealloc() and
> > > kvrealloc() helpers for this reason and removed them here for consist=
ency.
> > >
> > > > This deserves an explanation in the commit message.
> > >
> > > I can also add a separate commit for that.
> >
> > I think your change would be more obviously correct if you keep them.
>
> As in generally, or just for this patch?
>
> Generally, I don't think we should indicate compiler checks that actually=
 are
> never done.
>
> For this patch, yes, it's probably better to separate it.

In general. If you keep it, then I don't have to think about whether
it affects bindgen's output. That's the main reason.

Alice
