Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F91B19DF4A
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Oct 2024 12:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729601196; cv=none; b=gwEawuO4KsmXFTpVJwgaBW438S2kRaW6ju3JW48HQhp1uzTRhEmDqawcLfyKt+au5Z/iQkAEb3pspbKOsziQXS1y4BpL/1Wn2i7zXZrWWtMpa2W54WSzcsghg2UL2uNEnHARFT/cOE2nyBLcHCrRQWoisB1F2qB8bkQjuIm8jKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729601196; c=relaxed/simple;
	bh=Vx2h3v1y9ITGYk/4YqnyyI5UsVK+4L4HjGCwI5LwPHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLmmw0cIi481cb9yokUTNwRzJ1lXvJdSDRJZussQN+VywXJROEI0JyjgWBQsdTbN0JWcoEtnxqXLu4N0qzOg70Lg/UeFIAPmHJ0zJU/DSf5zWBNIHT/ob9TwnC+CtBcDDaEHUaNkwi9BY3E6Wq4JBxiR8Xgr5XT4yqwONQX9TCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tSu5DL4S; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tSu5DL4S"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so5378742f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Oct 2024 05:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729601193; x=1730205993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWt1QgZ+k4yosJJFZ2Lxkp6vi2dnYByQlfBoj3HTnos=;
        b=tSu5DL4Sgi1wuZnTAchlavyWjcSuIdk4FcneJ/j7h4kOGNpCsEV+5rttVTtHR6stH6
         2ZMYvZ4KKnTjAVxCeooBJZqFjUTb/ffO9PDMI+vfEMF91RQCh0tSRqY2917s0OHyIT3q
         f//i28yJEGMyBlUh1ShQFPHVJYzUnp0TBmnmyTsSfSDzDwFW1qJwneJCagllbpkNr0xl
         ZeCqpDKrXn7g5PvRCkBDRZr2xxsjxeWom063Ym8EbllT7UthVtb2JrK0qTPuRIMTbE/q
         w+ecVxMs418SQZ6gQdZsmI4bq3edRKxnaC+7kVs96dnfplgG6R0QIL9EQanMkOzXyH1u
         Ekdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729601193; x=1730205993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWt1QgZ+k4yosJJFZ2Lxkp6vi2dnYByQlfBoj3HTnos=;
        b=fdpNQiSkeHsHldk6x5Him/l+AKWeAO+4FrrwG7YIjIfaeLNicxY/9sBEupyFgUc5Ij
         kDhWO25qIFk0rJyKnoywk8lGoPD6iJ8TIX/FDlgKeGmfXaY6JPW8nqVyt9ZDxVg7hqHz
         0litldBvuRFxF+dPwwI7ZWuaULETQKMiMR2c98oG7e8lTCtBKcFbaxspmX8zOD5F0u19
         MXppiQC9S8XZAuo5Ku6zSyMAJrodSm/Iy6G70xKDMD0c8X0IwSabwU0Ceq2OdoxXFH05
         WWQQGi+kaGWdCjaS3mwbWGAQcNX711qnfs9k7JI9dfvS3lgH4s14owkHGy7lBg5g2331
         TCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmmtUZUHRwAQ9bZGpbNlksZleindrK6Wi4i2RfRV0BlUswZyQdUl4txDyOsvFlZTAK8ASfyI4ZTPGbOoiNlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCDqaC+lLGXBnbg8W+eq2BgQy51Iuf7hxRHSXEM9q92N9NK1RR
	ZkeNiZI7RY5YzFL1KceKXkU/C/XdAj+Mgb/VlE96kLt/oXlziV/9XHExSbem/9hfKAbyjBEb8Oq
	d9nfzCUzjoTKDFhDjYZ/LXFSBzgSlmXuaakrf
X-Google-Smtp-Source: AGHT+IHHrb1ZvDYKv4j0/c2a3JEmXpHadHXvk776QJ9rlhtlmkBkz9Vi+wH6TGQLWMsWaJaZ1alAT7TfAiJDX888U4w=
X-Received: by 2002:adf:f9d0:0:b0:37c:cfa4:d998 with SMTP id
 ffacd0b85a97d-37eb4768898mr12672840f8f.49.1729601193295; Tue, 22 Oct 2024
 05:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-static-mutex-v5-1-8d118a6a99b7@google.com> <ZxZxzjEaSZ8e_6mn@boqun-archlinux>
In-Reply-To: <ZxZxzjEaSZ8e_6mn@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Oct 2024 14:46:19 +0200
Message-ID: <CAH5fLgg=Hb5NDaQQJW4SVh+hCj51bp+BzCMQs=Pg_L+_MMiZgA@mail.gmail.com>
Subject: Re: [PATCH v5] rust: add global lock support
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 5:23=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Mon, Oct 21, 2024 at 01:17:23PM +0000, Alice Ryhl wrote:
> [...]
> > +///
> > +/// A global mutex used to protect all instances of a given struct.
> > +///
> > +/// ```
> > +/// # mod ex {
> > +/// # use kernel::prelude::*;
> > +/// kernel::sync::global_lock! {
> > +///     // SAFETY: Initialized in module initializer before first use.
> > +///     unsafe(uninit) static MY_MUTEX: Mutex<(), Guard =3D MyGuard, L=
ockedBy =3D LockedByMyMutex> =3D ();
>
> Thanks! This looks much better now ;-)
>
> But I still want to get rid of "LockedBy=3D", so I've tried and seems it
> works, please see the below diff on top of your patch, I think it's
> better because:
>
> * Users don't to pick up the names for the locked_by type ;-)
> * It moves a significant amount of code out of macros.
> * By having:
>
>     struct MyStruct {
>         my_counter: GlobalLockedBy<MyGuard, u32>,
>     }
>
>   , it's much clear for users to see which guard is used to protected
>   `my_counter`.
>
> I prefer this way. Any concern about doing this?

I think I came up with an even better way of doing it. The macro can
generate a dummy token type for the global lock, and then we can have
three types: GlobalLock<T>, GlobalGuard<T>, GlobalLockedBy<T> that are
all generic over the token type. The token type is an empty enum with
no contents, but implements an unsafe trait saying that there's only
one static using it.

This way we also do not need the helper module, as we no longer need
to generate a struct with private fields.

Alice
