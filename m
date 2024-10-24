Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBC716726E
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 07:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729755197; cv=none; b=F8rDzQkOKNeU3vEhG/5fDpVgv8bneUOT7aheVq2Iw6t5FNNR/CpIgJrdUmAXlrgCdrGK5IFev8tmsb0oOQF5qfiqUNgSJYn00lnnQ8J0xD2u5D77u4sYniAMNSTd/qEVsI06oDfVnffpRkKmYMkw7jJIAjoLfG8cVQQ0ILYnjeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729755197; c=relaxed/simple;
	bh=GmtVR/2IZ5UoC7zJzkUrdMzzcs0o4+oB7Cpl2y1NXWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCQyV8dpGKgnvjWfKoykln/ZxitSW9H4BmkiIOZkHGeR73tbNvNbg/peqaEHY9A40TcY5NihR8D+0v3lfhjlDkYlBjtKdJDGRX+esFhvXNbVl4OZYiAh5U1gweZHUj2Kd82G/ktT/ZWaGHoj7YYBu9s/o8N3L0ogfS1xfcneSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T3EHCbcC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T3EHCbcC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d49a7207cso400170f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 00:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729755193; x=1730359993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3ZML2pwt9SA2klMFVHj7vwI3wct/WwmcXV3aWafSbA=;
        b=T3EHCbcC5MeVZtSy4w8DlzLjwkc9p+/gFPKi7jBfxWeCNkOdopiZjl+a20E159j3wY
         WPu8UMmv9a7KfrEmtEjCnLt6mhMfq9tUYDICHYKnsOvSQqW5SlCMo196BqCHckWVCAvV
         TPIY0EWJJ3CeDBPfA0wwIt1YK7hxI9t0cl/2uks4DUAQYT0+gt7KfZXb7fTLxWgFpjIX
         Wmm0iBele8eFp/hKfYQdGMqzScMKmaPbN0a63H7Gb213eaU9rwtgC7znfIh8C+SdIzWc
         kIhSIaNd5Nz2J3QzwIGaqwGcY25wQ04uUoWjfeATOjKZcmUoMLJX32y9YoBWYsU6DxH8
         TC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729755193; x=1730359993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3ZML2pwt9SA2klMFVHj7vwI3wct/WwmcXV3aWafSbA=;
        b=lAG51oBgPSUOi1vQMA6UY+WqIfwQ139zOVaJ641Lk0eQTwOavfx7BXgcEgbox9SgPm
         Zju/sAdrDgZ2/VJGYa2vFWrItne5jSbei3PqN9B7dSXGdtshBVqYDenrA9jY1y7Z5T/w
         jcDMxDgbX8GEVXIhLwnjoIB8lkGO3pFzJ1BVBlTI++u5gMXeme3RNDIH+0Hzpn+/cMAX
         nfbiwiWwfyBJHrHAYJmXuc6qqkHYRL/kYClOwIsbP4XMannf4Vl0w5tM+UrwHc7LJ1XD
         27SSHHQoH0u+QwlUS+gPRZ1zdk6GiIE99mKJmuV9i9kkzU/G12wjJBDrOR0pqy3m8a3/
         QOnA==
X-Forwarded-Encrypted: i=1; AJvYcCWhxMjQMHw5TyIMU6mPCkcbfnTkZGRsr97mIWmOVrucHs6FU5qi6l69Zv74RKUqD9lUj4eZuDY21T8YCwyQJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuwg5hOnzsQgBMcIplUvaxqk09HiZEjVPMIZjws2oNZnjz72Lt
	ml/lSNgWtFVOXtkpDVHUAwQ7lRndTNqsSzw/ugVD8vlkptILVFtBh7NnrkPIh3SrYpXDZL3lhRa
	Fhr0fJ50FyUWSR+V0DjJPZUbHSFoT8LMoJWg9
X-Google-Smtp-Source: AGHT+IFAGhESqKClPHFOGoIGXnRexEURzt0tfdT98U++xy8JJtB3w5EjLFNRfvnqUgdiLHJAbImXKx3IIhmMWvjUEhE=
X-Received: by 2002:a5d:4535:0:b0:37d:4a2d:6948 with SMTP id
 ffacd0b85a97d-37efcf1f289mr3253401f8f.33.1729755192575; Thu, 24 Oct 2024
 00:33:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022224832.1505432-1-abdiel.janulgue@gmail.com>
 <20241022224832.1505432-2-abdiel.janulgue@gmail.com> <CAH5fLgjZ91xFo4hV4dPnDXLFr9jX3na60tVt_KuNU_c6WhhzAA@mail.gmail.com>
 <b154dd13-8cd8-4066-ba3d-6597959ca5c5@gmail.com> <ZxkPC-dLRBqBKZ5J@Boquns-Mac-mini.local>
 <CAH5fLggEGMVspJoO6CE-gTa3-OHfkUnS=L1X-VNC8Cp57GYVkA@mail.gmail.com>
 <Zxk7Tf-jhSse51AS@Boquns-Mac-mini.local> <CAH5fLgh1zXRA1dHBEtiNxWW8kNMtO47bBnaFLVhpzgxsnS1ysw@mail.gmail.com>
In-Reply-To: <CAH5fLgh1zXRA1dHBEtiNxWW8kNMtO47bBnaFLVhpzgxsnS1ysw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 24 Oct 2024 09:33:00 +0200
Message-ID: <CAH5fLgjLouU9ZRabJtP9qK6RWNLHZvW6dtUqbCkzFqZO+9skTQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] rust: types: add `Owned` type and `Ownable` trait
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	dakr@redhat.com, linux-kernel@vger.kernel.org, airlied@redhat.com, 
	miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 9:23=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Wed, Oct 23, 2024 at 8:07=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com>=
 wrote:
> >
> > On Wed, Oct 23, 2024 at 07:52:23PM +0200, Alice Ryhl wrote:
> > [...]
> > > > > > > +impl<T: Ownable> Owned<T> {
> > > > > > > +    /// Creates a new smart pointer that owns `T`.
> > > > > > > +    ///
> > > > > > > +    /// # Safety
> > > > > > > +    /// `ptr` needs to be a valid pointer, and it should be =
the unique owner to the object,
> > > > > > > +    /// in other words, no other entity should free the unde=
rlying data.
> > > > > > > +    pub unsafe fn to_owned(ptr: *mut T) -> Self {
> > > > > >
> > > > > > Please rename this function to from_raw to match the name used =
by
> > > > > > other similar functions.
> > > > > >
> > > > > > Also, I don't love this wording. We don't really want to guaran=
tee
> > > > > > that it is unique. For example, pages have one primary owner, b=
ut
> > > > > > there can be others who also have refcounts to the page, so it'=
s not
> > > > > > really unique. I think you just want to say that `ptr` must poi=
nt at a
> > > >
> > > > But then when `Owned<Page>` dropped, it will call __free_pages() wh=
ich
> > > > invalidate any other existing users. Do you assume that the users w=
ill
> > > > use pointers anyway, so it's their unsafe responsiblity to guarante=
e
> > > > that they don't use an invalid pointer?
> > > >
> > > > Also I assume you mean the others have refcounts to the page *befor=
e* an
> > > > `Owned<Page>` is created, right? Because if we really have a use ca=
se
> > > > where we want to have multiple users of a page after `Owned<Page>`
> > > > created, we should better provide a `Owned<Page>` to `ARef<Page>`
> > > > function.
> > >
> > > The __free_pages function just decrements a refcount. If there are
> > > other references to it, it's not actually freed.
> > >
> >
> > Then why don't we use page_put() there? ;-) And instead of
> > `Owned<Page>`, we can wrap the kernel::page as `ARef<Page>`, no?
>
> I don't think there's a function called page_put?

Sorry I confused myself. It's because it's called put_page.

Alice
