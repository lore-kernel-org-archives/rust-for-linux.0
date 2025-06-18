Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D54F27442
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233565; cv=none; b=r9TjrnKu2ru1CG00yGyiztcFqmTadzzL+hFsI9TIDLA+FiuQKW5o0HC2ViihVgLaGlMIBDs3fCRGIi4a8yxRMNVxhDDO/p+975QAcIC8sO0QThmewIrBBIXdzE1pR1ptMTeCb1pnBMKZ0ZneRRf8N0sz/vKV620mtlmASGe/KiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233565; c=relaxed/simple;
	bh=0Be7JDt97PhYe0VuG3FOHRYaLlNK9WkSZh+WlC2OJ3A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bZ8XLG0inZ/lDvGFh0+tC/kMwrhvBPr7tsOWrRUqpJZjNIzo9sEE7hxpTIgWLu4ImnvZ+F8Ihrv5wmZT4M3wKuGWiQwS35LnNkcK6CwDCyR2LBrvTF4RbldrQ9/alvH7YdPUSOnaEjBhX6wkuNstd5BT/lrPr9aKOz6Ko+KKZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ix1M7rlL; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ix1M7rlL"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so37409715e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 00:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750233562; x=1750838362; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gE3cyMbdsQnJ5cCYU/k10Qcrh2iDe81VxgYFWcT5W9c=;
        b=ix1M7rlL0r9rNvXBx8s84Na5XpRn6nU+EFV5/68Lkmc0vKU73fjDPD8Bz4d6y/WkH7
         axtsUTTiAMqMIYrGfWVVOKIcDXJNuWwhvg8Q9zoZZ3CFAfSwF13QxW4F2i8Um29ZFdoG
         lTT0F7bX2HPx083owQ/E18+zvamgYTleJUhMaD6Uivd4yY1jtqlDD1bup++xYC1pJHeg
         3CJUhznZ39Uh8pdtxQsGkjz9tZ24TYrZ7q9JmVpEd56RDCYcU4YXvucEBYjXWbJW7Pkn
         /ldiXZFkcAPdlNY1t50F1JQ4BIZqbed5rsO2atJo8H0RiY2HeqhhpKebJnd2e4Dul26J
         hidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750233562; x=1750838362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gE3cyMbdsQnJ5cCYU/k10Qcrh2iDe81VxgYFWcT5W9c=;
        b=txfAKQFezWPOuhNXt5/gdlxb/wFHeX2fV3RdDZjLNlhDuMt9rq7BahBeHRKgDixx10
         h7yMb/l+EmIRUfdXGJIUJMoukxWalbuFd9/5Bo0uf6RTxcFoPMKjCTT4h3zhkMALneEI
         DcU1OKBqdmY6S40atie6O2w+46LjHFJmZNasL+WCB8MhRi5khj+iZDrHA3NvsDWhLtVo
         /ULnE8b3dCGrGnHCwh3pSsTZekJACucRjNO+gGX77ALar6HYUk8Qt19v4bXNvxSmUV4c
         JLxCgx1+ucutzC1i5+7KBrRCW0YXRG3Jh8xzrlMcA8L41IjaSCXhgWTtwC9/WWXTzFmF
         +GQg==
X-Forwarded-Encrypted: i=1; AJvYcCV4N/1EQoL8TO5UKkpKtBShbmSfxzrKKpzc78+KtFfFeogrgspmg40WfpdbqrxuySNIVOJyoLjdNgTqOwzYqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf4fu0/GapS5hRraJehfVeRmjfEwoNCJ+64f3IF1hKXUPBk8Pd
	66TFaxNV7oTL0JqnN9AARdh2Hc98VAsrIqDDnwHRos/E+DN0oXvV5mbNkKs/Sk1qXNN8S1/hKfn
	tkz1yEsNAJmbwxpOTdQ==
X-Google-Smtp-Source: AGHT+IHz0C1fYGWY5kiY7lnbdlwuTwLWyWDvSnxCqZ65/YnQjSJhZWyEL1X3Pk79eSjdSXC1t1NrM3Lzh/LlLWQ=
X-Received: from wmbep20.prod.google.com ([2002:a05:600c:8414:b0:450:df6d:a450])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348c:b0:450:cfcb:5c9b with SMTP id 5b1f17b1804b1-4533ca7a16bmr135014865e9.1.1750233562598;
 Wed, 18 Jun 2025 00:59:22 -0700 (PDT)
Date: Wed, 18 Jun 2025 07:59:20 +0000
In-Reply-To: <aFFzi88miMbCZ0yQ@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com> <aFFzi88miMbCZ0yQ@pollux>
Message-ID: <aFJx2IqLfCjWsbVv@google.com>
Subject: Re: [PATCH] rust: types: add Opaque::from_raw
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jun 17, 2025 at 03:54:19PM +0200, Danilo Krummrich wrote:
> On Tue, Jun 17, 2025 at 01:36:47PM +0000, Alice Ryhl wrote:
> > Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> > `container_of!`") we have enforced that the field pointer passed to
> > container_of! must match the declared field. This caused mismatches when
> > using a pointer to bindings::x for fields of type Opaque<bindings::x>.
> > 
> > This situation encourages the user to simply pass field.cast() to the
> > container_of! macro, but this is not great because you might
> > accidentally pass a *mut bindings::y when the field type is
> > Opaque<bindings::x>, which would be wrong.
> > 
> > To help catch this kind of mistake, add a new Opaque::from_raw that
> > wraps a raw pointer in Opaque without changing the inner type.
> 
> The patch does more than that, it also adds a hint to container_of!() and fixes
> up two occurences. I feel like we should split it up.

I think they go together pretty naturally, but I can split it if you
insist.

> > +    /// The opposite operation of [`Opaque::raw_get`].
> > +    pub const fn from_raw(this: *const T) -> *const Self {
> 
> Do we want to name this from_raw()? Usually from_raw() methods return either
> Self or &'a Self.
> 
> Maybe something like cast_from() and rename raw_get() to cast_into()? I think
> the latter may be confusing anyways, since it sounds like it would do somthing
> with reference counting.

The name raw_get() mirrors the stdlib function UnsafeCell::raw_get().
The stdlib uses this naming because in Rust the word "get" normally has
nothing to do with reference counting - outside of the kernel, we use
"clone" for incrementing refcounts and nobody would ever call it "get".
That said, it may still be worth to rename the method. Thoughts?

Alice
