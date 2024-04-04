Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4625B1272BB
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Apr 2024 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712239432; cv=none; b=e4+/pl4NE9BooeLbyMgj8Ill6rr2I2G/3HE+1i2ZTwdpJzV+Sa0X179q/bUDhon1WWllDr1fD6+a+cZzmXMfrlxXsS9UEP064BPLAcc6to3YudtSkKh0JcLt/dFsexbUb4NQDW+7y/IU+F98uqhQkEZYHx36a7ZHMGHXV3ywpMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712239432; c=relaxed/simple;
	bh=vMu0LL9ltMkRityf3ku4FuM/lwy4EpU8+q5p5WfKSBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzS+zXRbG+jRM5yaevcO9VctBflhijAslYYnCqzvcR8JffcA+FfEO13OaiYhNQ8GZ4dz6V6kqmklMOUvw4ukm64cQmm3wuUwvP/sLKoRZskkh5bjVGsFRc2OCvtq04l/uiAlzE5ZkZGCVOKw0xFH7DKyAj0InGudXJm/NHikul4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mDxvgZgY; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mDxvgZgY"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-69682bdf1d5so5288256d6.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Apr 2024 07:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712239430; x=1712844230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDF2zaMYbn25r5wA1TfRjMdRiEFg3+k+XSId485H2dY=;
        b=mDxvgZgYCIElilxjr+QUpfhCI8gQmuewuIvsRJxMsWQhXHpUrzblEdwbFg2AmEvL/c
         5JmaCkoc1Q0vkm/AzJ+57/YzEvOYj8qvi+FH4Exox0mo6kyzfuSymX+IeCsprtF375SH
         DU+Ji+YVnR7vKwXgNL43ZhzagdYLFHNQ/QA7GmMnBAMwzozEgv+5j7X0tQWc6lH8ysLY
         5dd+8QjxzFeVFHllzcD+1XpETdCRWGof9mwa2srYAITYxHunXCEQgvgXc9TL071nbBiI
         JxPYPP9yjYWHKPyitj1qxbddu6PiNs4OOJ4zSutPG7D44xnFEXLmT1dZQscw35rfk54b
         O4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712239430; x=1712844230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDF2zaMYbn25r5wA1TfRjMdRiEFg3+k+XSId485H2dY=;
        b=cvFfMjao3CNhiPpYJiquvbipVuWQYDvm82RbZVGyvC+xas6oAzGdtFb0hZ1t62IbOG
         uq4V9hWuIcKcFWH2V7Cw6Xhjm9lWxn5QgkygKjfDkeJSJARckO5zMmkHTzxyPGRk7NJ9
         cM0C1pTVkd/CaWEBKPistKvNNxbxo5eIQBv/i2mfUBRMTTtWOu1OjOCB4sykzzNY5Ojg
         74U91WqYlyKoYyZrC2tOxlXGxLQ+Fp47Oikf9t9Y3JXAUP6SR+iOLq1PbjGOYhAVqO62
         qfLOQwvCDmEwgMgbxywnaNnph48FBpxV70f1+WNCO9bdHqyUWUxkdWfSLxEJiju++2nK
         457g==
X-Forwarded-Encrypted: i=1; AJvYcCW0z75F0z5BqXR86BeFjRJJy6RxVQtRe/w1Ub1yoJLRUtcE4f7RrzGQyp1D0MFFsGhb8IvDJqYMRdpmr9csmope0N5bIfzkYuHGtmvnk78=
X-Gm-Message-State: AOJu0YxyN6sJ+eln0vmBgleL/mBVv7n+Lnw7RuJPWjKNbW1QrJ9byQ5l
	fZHkTXflRTsSraIXu3IZqer4/ncrdpiStc836D7/VHd/++MsVYCQxwkCWhBF8J8+Y80OXc6nzyY
	MfbDdCj5Oa0pwZMXv5U0fouzR2lIGjIY7bppo
X-Google-Smtp-Source: AGHT+IH9nVJTFBf6KYHVkWq5I3dTrlUqSuMe+JgthNlKh222XhK+A4MXytM7wglRKaRV8iIDAr29miZUuh1n5Ol7cbU=
X-Received: by 2002:a05:6214:d07:b0:698:6e84:95e5 with SMTP id
 7-20020a0562140d0700b006986e8495e5mr2270945qvh.16.1712239425130; Thu, 04 Apr
 2024 07:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402-linked-list-v1-0-b1c59ba7ae3b@google.com>
 <20240402-linked-list-v1-3-b1c59ba7ae3b@google.com> <2500d66a-e54e-46d8-97cb-37fd9fc00c45@proton.me>
In-Reply-To: <2500d66a-e54e-46d8-97cb-37fd9fc00c45@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Apr 2024 16:03:33 +0200
Message-ID: <CAH5fLghJtSvW-zNnDNFVgtb-px2d4W-xUk2++QdvyMYFMBGM-Q@mail.gmail.com>
Subject: Re: [PATCH 3/9] rust: list: add struct with prev/next pointers
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, 
	Kees Cook <keescook@chromium.org>, Coly Li <colyli@suse.de>, Paolo Abeni <pabeni@redhat.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, Ingo Molnar <mingo@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 5:57=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 02.04.24 14:17, Alice Ryhl wrote:
> > +/// Implemented by types where a [`ListArc<Self>`] can be inserted int=
o a `List`.
> > +///
> > +/// # Safety
> > +///
> > +/// Implementers must ensure that they provide the guarantees document=
ed on the three methods
> > +/// below.
> > +///
> > +/// [`ListArc<Self>`]: ListArc
> > +pub unsafe trait ListItem<const ID: u64 =3D 0>: ListArcSafe<ID> {
> > +    /// Views the [`ListLinks`] for this value.
> > +    ///
> > +    /// # Guarantees
> > +    ///
> > +    /// * If there is a currently active call to `prepare_to_insert`, =
then this returns the same
> > +    ///   pointer as the one returned by the currently active call to =
`prepare_to_insert`.
>
> I was a bit confused by the term "active call to `prepare_to_insert`",
> since I thought that the function would need to be executed at this
> moment. I inferred from below that you mean by this that there has been
> a `prepare_to_insert` call, but not yet a corresponding `post_remove`
> call.
> I did not yet find a better way to phrase this.
>
> I like putting the guarantees on the functions very much.

How about this?

If there is a previous call to `prepare_to_insert` and there is no
call to `post_remove` since the most recent such call, then this
returns the same pointer as the one returned by the most recent call
to `prepare_to_insert`.

Otherwise, the returned pointer points at a read-only [`ListLinks`]
with two null pointers.

Alice
