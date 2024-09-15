Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3CE1C689D
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Sep 2024 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726409533; cv=none; b=XRiRA26ebFOiJ5rIlVLkNnbLFdybl32aTiir75lhgW/x6ZNpw5Kka+h7vHq3AXp4SxF/HqiHIeqzDSkvte+dZCZLDjZOted1S+3dvPq4BFrxSnYh4G1B5ZZxVPKyObjg6WeB07l1vR/zPq1bXVi4/UnYjal5UygSSZptRTgprJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726409533; c=relaxed/simple;
	bh=r5zBW4jZUhZNWoMWeQalIZceyQXecUyHiGiXyQHzAs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tFizKCsxK4VuIeTpOeEtWTNA/v12jm7IcsAazwZeNwqGaA2aBih+/Vv91UjuLVkmVutqZlNXGNW6XWY4u2kLXNFcgQ0/jpHp67NYjZ6LeWQ5QyXWS3ThDjSFduLr9d2t2snDoieNuk97SC2LcyJeAbNcIWHwTxbojOeWfHeRBY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bl8B3+sb; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bl8B3+sb"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374c7e64b60so2159779f8f.2
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Sep 2024 07:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726409530; x=1727014330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yxz5nmGRzq4N/sr7E3GVipIykhiwk1dNJyYW68ELoro=;
        b=Bl8B3+sb90meq3NlhAtcvAzOzGjPzim9doMwgsMF2hElf/eGMKH5J68dATgQOcozOi
         spDqaL5skQpIBa91NON63BBjn8oHUogo0ZiDb568Z29cB+AyDC83ZoQNFUCiNgXjCHcF
         l/QXavsh4VBvnEBosFMsin7go17aoR0IN/t71dwzVOd2qjBrealxxN1522MNnGjeqnQZ
         C+YNsksXNtW3ya8H9KYDdHRPsQNveueoj2cX5k5gdvue1mkDNXuS5/TR2FW2lmCdENgn
         ayehZKTwg13OJdkGVOoD10DYtjnMJ0OFHEQCSIgeHHjgp72XoTuQaLiGbcxWAY4Bmes0
         sSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726409530; x=1727014330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yxz5nmGRzq4N/sr7E3GVipIykhiwk1dNJyYW68ELoro=;
        b=ou9tS5SkwT6C+BOqYBpM3gsnQci6uUB9QswoD+IxT00g28c6PWhuRP0+fRv3HFM+FW
         gQNV7tXitvKbKDKPPxSmHxFtA7h/piZ/2nmJPjxb+1VjRdM+vwfUy7cg6Tgew0wGXIJm
         WEo3IxmntnJNq9nroSrmrTuwAIx5KqlQf0sDghrr52AOIVmBhsGfCyvWei5OSlb/doTp
         989q20YbYYfIZkPG8d6fYVqI+Azbjg0E8wwYzBkRNXq5yEioDt2y5kof1HzyqLCKDDb9
         rL5EZjd1HyAKmTioh0x2Q+Go5iPm96oUbxpOPq5W80ZUBqjwDObKPGOw5l/cLbh4lWjc
         wLIw==
X-Forwarded-Encrypted: i=1; AJvYcCVj2XwDDaMe8lVdJs4F3Hghk8EDKfMawUclUxKbT7II1p1f9yTaZH3Gk0uBsa2jK9Uj1uBUu5Dlgoy4KND+IA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFicSrRFfI3dTgc4FQU4zjk2nuxTpcoIzl6T7deH5SvHkJlxeH
	AZigTQGCE9Vgj84n5rXENOKRJzQiEqY/+4Za8ryoeDb1eXTKhU/EJbmFeNAczVoKU5oV1Kn8Plm
	Veb+0ml4GyCbwm9ccAo5fQOo792jScBVmAjni
X-Google-Smtp-Source: AGHT+IFYx2WRh//19q1aLbfgfstbMz/qJ1WyjNFbXNIv7xjFUNkkC/3NbCERqsrU73d4amcIy29/C9nVSzXq8QueaWA=
X-Received: by 2002:adf:f6c6:0:b0:374:baf1:41cb with SMTP id
 ffacd0b85a97d-378c2cfedebmr6870954f8f.4.1726409529945; Sun, 15 Sep 2024
 07:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912-locked-by-sync-fix-v1-1-26433cbccbd2@google.com>
 <ZuSIPIHn4gDLm4si@phenom.ffwll.local> <ZuUtFQ9zs6jJkasD@boqun-archlinux> <20240915144853.7f85568a.gary@garyguo.net>
In-Reply-To: <20240915144853.7f85568a.gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 15 Sep 2024 16:11:57 +0200
Message-ID: <CAH5fLggoz5gdgOpEiXu7u9hPXjLLeSv9An6jaq0am0-dG7+ohw@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: fix incorrect Sync bounds for LockedBy
To: Gary Guo <gary@garyguo.net>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 3:49=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Fri, 13 Sep 2024 23:28:37 -0700
> Boqun Feng <boqun.feng@gmail.com> wrote:
>
> > Hmm.. I think it makes more sense to make `access()` requires `where T:
> > Sync` instead of the current fix? I.e. I propose we do:
> >
> >       impl<T, U> LockedBy<T, U> {
> >           pub fn access<'a>(&'a self, owner: &'a U) -> &'a T
> >           where T: Sync {
> >               ...
> >           }
> >       }
> >
> > The current fix in this patch disallows the case where a user has a
> > `Foo: !Sync`, but want to have multiple `&LockedBy<Foo, X>` in differen=
t
> > threads (they would use `access_mut()` to gain unique accesses), which
> > seems to me is a valid use case.
> >
> > The where-clause fix disallows the case where a user has a `Foo: !Sync`=
,
> > a `&LockedBy<Foo, X>` and a `&X`, and is trying to get a `&Foo` with
> > `access()`, this doesn't seems to be a common usage, but maybe I'm
> > missing something?
>
> +1 on this. Our `LockedBy` type only works with `Lock` -- which
> provides mutual exclusion rather than `RwLock`-like semantics, so I
> think it should be perfectly valid for people to want to use `LockedBy`
> for `Send + !Sync` types and only use `access_mut`. So placing `Sync`
> bound on `access` sounds better.

I will add the `where` bound to `access`.

> There's even a way to not requiring `Sync` bound at all, which is to
> ensure that the owner itself is a `!Sync` type:
>
>         impl<T, U> LockedBy<T, U> {
>             pub fn access<'a, B: Backend>(&'a self, owner: &'a Guard<U, B=
>) -> &'a T {
>                 ...
>             }
>         }
>
> Because there's no way for `Guard<U, B>` to be sent across threads, we
> can also deduce that all caller of `access` must be from a single
> thread and thus the `Sync` bound is unnecessary.

Isn't Guard Sync? Either way, it's inconvenient to make Guard part of
the interface. That prevents you from using it from within
`&self`/`&mut self` methods on the owner.

Alice
