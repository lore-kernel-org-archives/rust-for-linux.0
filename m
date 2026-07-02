Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C028386443
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 21:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783026786; cv=pass; b=SyEhh1TZQv3WYuiZHgsibQOg9BkaA9MFPVZ2CGOGDd2RJzdPSi10jUCL+Y+mYrTEoGRO7DAyb4teuGbRCfGpksgOnqwue4I1tEK4NT/VrtP/4okBrQWw6Fws8rFOLPiWWI7DnpNyBaCsg1PuiNf1bvMkRgkcCxJLZtbhCCBQg9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783026786; c=relaxed/simple;
	bh=6cZbDjgOL37MD41a4mUgO48Jw/rtoj/VLkwNf4EshIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmE3FsSVWI7vkvHmE9oRkaOOQAqGluHD9RNGWf2t+X7VneCDDDLFZVBjP1/+mVebvAfqFLqPjgXAMMQjCzfG+CSa9ssrVaYYyU5Wh6ouIdE/FHqrvgVYL+/4+puwNU0azRL5LVGFITgMb4t13sQyg03o4AjOZnmsbXnmP7Bsskw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Ck61Fc5T; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Ck61Fc5T"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cacb8416a1so4763145ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 14:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783026784; cv=none;
        d=google.com; s=arc-20260327;
        b=GzJa0/CAy1OmlOCIEIqWhF0cY10O1su1VbKJy22tpbgghfmt4v5ocwRwJGZ7lOyHGO
         YJYDxKjOWbRbJ/bHdrtAz/LDvONX/nSFYFadHOtklXwC7XqFSmSyncZJpEpy5P4BDPvb
         +IwJopEa9k1lmzoxH7RntkUwabn8muV8t+xvZIi0UdEFNPFTdhDr94L3xyQB3yjfYPb4
         Ixcz6i0xTeJfGnohY2iDxOhAA2AjZW97WYGBFctLjPKWPlt5vbyao2La9nWOp6BzyVsR
         srPhD5ei3WaZIdP+xdBU2O9sueCl9/NORvOyQUXPfbPf2eBfeXD9Ekefg2ErNqJ1gZR0
         jgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AyIW9b1L4RTcWNQ05u8o4YPVZ1U+N1SMUlgeq725Esc=;
        fh=zH8V38siJbv7ntDDyyWJUAMIoq7OfLvZBeegRtSKesY=;
        b=Tcw6fYZaQ3SEgdnX8nfcJ/Q+bVAv8+tFOlEPvfrvkDA55VQnxjzE4mE5yNDjtzlcRm
         D56LhpdMTtA1DWuRPabFLEHjZX/HXCcyiMtQFgy0Sxt9Sz4vbsPoBDY8L9WlXO3roiTY
         fK2vJrxeWi0DoKbtxGwmSBaN2jHlzWR2su1ETU9x0l5mpbNwhc2WJXrSCVScWBSMrGTV
         Z1R9vlV6+rzrUK5G0avaLyte8XOi5k2QEVNZo3UdUPRw7GIb9WEIJMdOLSWgMTAPTqif
         bhxAKNyK+beIu+HrB2cOxN98AyyPgI9HTSNlFIcb+qEvE271p0hY2X9+GoOGl9aTwjF2
         AGHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1783026784; x=1783631584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyIW9b1L4RTcWNQ05u8o4YPVZ1U+N1SMUlgeq725Esc=;
        b=Ck61Fc5TJzIU09+axx+e6RLYwDfGVqprsoe1m2tRj4enLqm0IA8/WvBxd04tQAaBIB
         9lQUsZEYbaCGOpP8E4rC242gtPQnirRjBU+EOLWNY36xMxvff1qytC3d15QIMGCFTVRf
         n4mfpzQmQkbbOaEdaNFIzkkh3I6RmvoL09K4bkE2wlrV0k6U4oBom/XqLGIalWKessfp
         AG43lp7KJrk47m3/UJeuw13uKE7hVwwvGDiW7VmPyJF7aoC3JiTALcaHuF6uQf4i3jKt
         6ko+xoobjCKjtpAymZl/QgRORh21J4ihVvZXnWIaR5iRpxt+vFRhM2mg1MBaFMTzsO1e
         b8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783026784; x=1783631584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AyIW9b1L4RTcWNQ05u8o4YPVZ1U+N1SMUlgeq725Esc=;
        b=c2Xp7zq5+BpJ6nfODPM3LZ9Oeg86fBs095fsny+ic9ZLyKOD3tsXiKjy91blFuVy05
         EFJFQktySVMg5BKR+KwfPSI+ZNhDxKJObHhjgm2AH6Lh+0j3S7ONTOrawWHJIFo/TVnG
         s9rCm0ugaQ2M5oI6inIqru3D0Mzrs9d/RA8o5vQnILo8152cSN1TFw6xa+/a6xFRUKXS
         IdOOr1G/sxQUDwA4qF1ICKQlRVcT3h+AUthy0E9REkiKfjhfXp2giEJNguz5gCzsZddn
         7qjRwYLJjx1IXFk/JTdpN3CdIZ65qgN0AxuNOwQ6I15wrIX6uJajz91PWL+I+Vk9/B6W
         yUfA==
X-Forwarded-Encrypted: i=1; AHgh+RrLQz0z+dWx8Dprc7k2YGB9j0zRVIf9NDHkCl5R09+NRiG7JSLg7jTrJKfCmK1qUYSnFxGKSXMZUl6THD9qMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPN1GQ8Z91IVakqlRzNcvc2/i3BJD3Z12PaPlegiaMeA/Gvv8K
	pGP0U4Ob7u59moQUaSypjbH6ZSIFn2em5HAFtB+TsxFqJM8EgXtDitGT5i0/jbqmv63+i7A5fH3
	AFyU3h+Iw6oKUlONg4NEjOh9ROYJ5YQhV9AXxiXpt
X-Gm-Gg: AfdE7cnrmYJMRHDcuOk3PF6SooBnor9QEyKuditzI2QuipiOu5qHpTZNHd346yhWBLo
	RyaxiqMl65plueUNdWY+gcrj915cHk0j9oLnNgyY5+yVOEv9CJIiMilvDNYmQKy6gnK1ra5yJRC
	09LJTsmpCp6AL6mycxzFYDNGtbdtkqzbUhicUDniIBkwWqpZiXCQE+dX0gQnulJFBj7wijgCqqP
	gL6znqE6n+FjF78Q473lfVLEtry+c50cW8rgMpLN0OKrqWhHr9gecPdMh2eXb2xbss/N8ho
X-Received: by 2002:a17:902:f710:b0:2c9:854b:d53c with SMTP id
 d9443c01a7336-2ca911f9311mr68892545ad.36.1783026784472; Thu, 02 Jul 2026
 14:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-remove-task-euid-v4-0-07cbdf3af980@google.com>
 <CAHC9VhR5Ca+WyP2OiNGtL1SqHn0SwLe=M9SB8D2bxtdS52quhg@mail.gmail.com>
 <ah51DY5yfaNZejBd@google.com> <CAHC9VhQyNzxJgdMkmEsOeAQ7Wt2L+eW6aNLjeoYmnCQLmcYRnw@mail.gmail.com>
 <CAH5fLghJaFXheAZqKyM9Cdo6iqTw1W=haA79POhmZWEfuKujRA@mail.gmail.com>
In-Reply-To: <CAH5fLghJaFXheAZqKyM9Cdo6iqTw1W=haA79POhmZWEfuKujRA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 2 Jul 2026 17:12:52 -0400
X-Gm-Features: AVVi8Cc226agFjsV3IzoL0ZtqLK8mwQAJ-H8dg4RuGGydr2Hd_jseubNHLDGNTk
Message-ID: <CAHC9VhTfOnOgOzGk9==wJYKx5gAi3Zf3oTwbj183o0_xxrfKag@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Delete task_euid()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 1:05=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
> On Wed, Jun 3, 2026 at 6:05=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> >
> > On Tue, Jun 2, 2026 at 2:15=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> > > On Mon, Jun 01, 2026 at 07:13:37PM -0400, Paul Moore wrote:
> > > > On Fri, May 29, 2026 at 5:33=E2=80=AFAM Alice Ryhl <aliceryhl@googl=
e.com> wrote:
> > > > >
> > > > > The task_euid() method is a very weird method, and Binder was the=
 only
> > > > > user. As of commit 65b672152289 ("binder: use current_euid() for
> > > > > transaction sender identity") Binder doesn't use task_euid() anym=
ore,
> > > > > so we can delete this method.
> > > >
> > > > Given the problems from last time, it seems like it might be pruden=
t
> > > > to let the commit have some time to "breathe" in a proper release, =
I'd
> > > > suggest merging this not for the upcoming v7.2 merge window but
> > > > instead waiting for v7.3.
> > >
> > > Sure, that makes sense. I'll resend after the merge window.
> >
> > No need to resend if there are no changes (see below), it's in
> > patchwork and I'm tracking it so you're all set.  I'll send another
> > notice when I merge it.
> >
> > > > > My suggestion would be to merge this through the LSM tree.
> > > >
> > > > That's fine with me.  I'd also suggest updating the commit descript=
ion
> > > > in patch 1/2 to indicate that binder is no longer using task_euid()=
;
> > > > it currently reads like it is still being used.
> > >
> > > I guess this occurred because when patch 1 was written, it really *wa=
s*
> > > still being used.
> >
> > Yeah, I understand the world has changed since patch 1/2 was written,
> > which is okay, we just need to update the commit description ... which
> > should be a trivial task.
> >
> > > Perhaps we could pick up only patch 1 now since even
> > > if we run into problems and Binder has to go back to using task_euid(=
),
> > > clarifying the docs is still useful.
> >
> > I assumed that was one of the reasons for splitting the changes across
> > two patches (reverting patch 2/2 leaves patch 1/2 intact).
> > Regardless, we're at -rc6 and with patch 1/2 being purely a comment
> > update I don't see an urgent rush on this, especially considering that
> > if I did pick it up now, it would be for the v7.2 merge window and the
> > binder/current_euid() change will ship in v7.1.
> >
> > Let's update the commit description - you've got a couple of weeks to
> > do that - and then we'll merge everything once the v7.2 merge window
> > closes.
>
> Sounds good, thanks!

Just wanted to check in and see if this is still on your todo list?
No rush, we are only at -rc1, but I was reminded of this while merging
other patches and just wanted to check ;)

--=20
paul-moore.com
