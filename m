Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6904F194A52
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083511; cv=none; b=IFfYIc1vPEVviVQJFpKeXLvJL6JM6zZ085fnf9s+iLoaceK09KCFBkbtK2iIZO7+w1X5+fcViGgQd7cug4noCRugnR0MOkOnKys3hF01ZASSNxzKJkzTRLsMfaUd+JlTEAgW/Q9KJf0spD8nZV8JOKpaDqxTEck3t4w7VS3N/ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083511; c=relaxed/simple;
	bh=v1QHDoOgmexyrfMU9NoNlKhk5cabPz+7ykUd04NhdaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Av/7T/ljeDik090nsOt3WY8D6lSXY0Pvx3tZ9cOE37hbI4ETrWEuCMHSAsh/NFLJ1EddBn4vA1E18/8usj8wrws+lpYCOyWjX+qRcZOL+3APCAO/IDaPIkTd26bSH3IRRK81KvlGcQt7i9OlGlaY6pRQHTyXcf/jKyIgSAl9US4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SQ/xTLwC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SQ/xTLwC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso53060525e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727083508; x=1727688308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zo/inl+dQkj4h/8JHayWlKE13Gh29+Qcnjfcg0oSMnk=;
        b=SQ/xTLwCGQsvs4JWws03utGCo+MvCOflKzRHQynH9eKeBxYwoJHWy227h1m8Jng2SJ
         duY/ak6cg3j2RP8ft9aO2gMvobQPr0dFwrnFZIUL/HoDI12Eo52Ne3u4KkyNo4lnzhY6
         wCGcHv+uXhKcWKpIKxzdK/0RRUvPl+fUuYnrFnQQG+B8RA1IBxQ4gA3LJrCa9EjH0dg4
         27QIrGxM1YXMtcr10OIMUQYIou9cZUnC2wRp2W4WoGCMO/XzzMCk8HmCxc2Stryn6NX7
         ROfZ8wtPfDCXBOfaA56occ0Y/i0qjmlV8oUncxQFY5ryZa8D2CRpDiiT5sXaON5gIYxm
         0olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083508; x=1727688308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zo/inl+dQkj4h/8JHayWlKE13Gh29+Qcnjfcg0oSMnk=;
        b=b4LiQW0ykU8KW6ynsuh8YeQt958J8gbmv4xt2CUviwTj3rdo0o9R/Jf2UaCYme4H5J
         2PrIQTLYk7AqPKkq0TDWpcVFZdNtCsMfAv+ulJ3qdAoexFK1byNg4R5ekk85PRCiLdau
         mqCp8JxLgAQcN5OsrJscHM9ktP4k4GHqTW1E1TyQOsc3yHScHJCvhkRfNjt6ejLTXXQw
         SEUO2J/iuwQjhq2TRE5NaSeJ6EkyJP1HHiXwNOUrJjvSjhfHcDkMJy40kcph/mimyKn1
         tC0UFGn2cLfsuqcImLMcZB2yvQZgMGE/+lk+T1WN1tYSfqZRh/P/WcpZBxeAvyfTY7d3
         rs1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIeuOiTZKb3LHwe/b7b4HjYENPLKDt1bW2TuVRkpfUV1bzs1vsSXb2Kp4E44yV/5xtqQJeEdf7Y/U7qcxjKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlBzwv0RF5rfbA8LZUuNKo7dJR9yCzztKu4XKJBpFxZ6LVqhpg
	kCeNmcT4TfQDTs8LsO6MLaR46K86+mu6ozX8kK/gPdTMb50sbbf45eL17re7x5v3AOeJ9FkZpEG
	sipQQ7IWt591auWnSnaJ/ifIt/s7WUZbdLezS
X-Google-Smtp-Source: AGHT+IHx8d58x69Efb/u7PFGAQqvDWRxGlD0tGf0focGcku3t84Rjwu43AOhis6qf2wJYkTXSAOF08RL9gMyuD0uADw=
X-Received: by 2002:a5d:5585:0:b0:371:8e3c:5c with SMTP id ffacd0b85a97d-37a422532b6mr9309865f8f.7.1727083507425;
 Mon, 23 Sep 2024 02:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816001216.26575-1-dakr@kernel.org> <20240816001216.26575-14-dakr@kernel.org>
 <a8c31bce-aac2-4ffe-8fab-2e68c9bab035@proton.me> <ZuIS0lBDyxsxuHwf@cassiopeiae>
In-Reply-To: <ZuIS0lBDyxsxuHwf@cassiopeiae>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Sep 2024 11:24:54 +0200
Message-ID: <CAH5fLgh+4QHsiQZmKixhZ+e10fAO-gHfPi0Y8wsWBeiV8gyp0Q@mail.gmail.com>
Subject: Re: [PATCH v6 13/26] rust: alloc: implement kernel `Vec` type
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 11:59=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Tue, Sep 10, 2024 at 08:07:40PM +0000, Benno Lossin wrote:
> > On 16.08.24 02:10, Danilo Krummrich wrote:
> > > `Vec` provides a contiguous growable array type (such as `Vec`) with
> > > contents allocated with the kernel's allocators (e.g. `Kmalloc`,
> > > `Vmalloc` or `KVmalloc`).
> > >
> > > In contrast to Rust's `Vec` type, the kernel `Vec` type considers the
> > > kernel's GFP flags for all appropriate functions, always reports
> > > allocation failures through `Result<_, AllocError>` and remains
> > > independent from unstable features.
> > >
> > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > > ---
> > >  rust/kernel/alloc.rs      |   6 +
> > >  rust/kernel/alloc/kvec.rs | 629 ++++++++++++++++++++++++++++++++++++=
++
> > >  rust/kernel/prelude.rs    |   2 +-
> > >  3 files changed, 636 insertions(+), 1 deletion(-)
> > >  create mode 100644 rust/kernel/alloc/kvec.rs
> >
> > I noticed that you don't have a `pop` or `remove` function implemented,
> > I think it would be weird to have all the other functions but not those=
.
>
> I'd rather not add them for this series anymore. We can add them in subse=
quent
> patches, or wait until they're actually needed.
>
> I also already have some subsequent patches in the queue. For instance, i=
n Nova
> we'll need `Vec::resize` and `Vec::truncate`.

When this lands in rust-next, we should open good-first-issues for
these on the Rust-for-Linux bug tracker.

Alice
