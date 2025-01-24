Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DBE219A9A
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jan 2025 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737711790; cv=none; b=Sb2xizwSMhDlx0DUtJ19OhrPcyG5TrJtU5zbL/lTHs1DRIlcso3r0aKfw2ETI4+NHc/I9dIx7G8WF+PYTvxtZxEqLW8Vldv8ARCe86/VS75UiH+jHTTc9h+jP5zubrykG3R01KepYMNpFacEsMlxQXmQ2oI77MhVxyW8qXy45BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737711790; c=relaxed/simple;
	bh=KCKxfpEvFGFKegufwHBaouHIy5AlagjL610S6FVgBBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQzNJBevng+FpMiAivhvFkFuMexMJI7p5wrq+zkQoFGRimvCUPu199pQl2WyPiPOXyN+lMdhuGv+xC9ghB2fPMukyybtszJHr/BeCYHBPpw5BERrDdM5dtOVIBlDN0ad73YxHSDMOdBE3KjLbl94AlIXZoYdbehgXPXgbeCCjww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gl4cJwRV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gl4cJwRV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e27c75f4so1658191f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Jan 2025 01:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737711786; x=1738316586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCKxfpEvFGFKegufwHBaouHIy5AlagjL610S6FVgBBw=;
        b=gl4cJwRVqiDT3f+A4R2DNb/woI7oYMpeD7WPcCUvoHDn8D5zNpWaKDlUZkUdokwn58
         VaqnetJQjFa4ffEw7z7JOIuSKUXwH0NhL9/vLtIoljcEUckpt8Xo+ApizpINX4j7VjuR
         Eql2akcft0dHx+oTGRaKEZLmZ6sIWRqV21q+deMLupHI0/EYzVEgizNvh1DLaNBFUuKq
         juRVByQ4Xpp3ztA54E/NLuiC2q3Z6CP71nKtmBCVotXTK6+lErtvaNBQr2f98urwdJEc
         pkJ3ntSdcGD8d+dFG6DdopMVDTwtnApuXjTagntl/LTj9t81XYNmb/8ue1S2uj4G0OQf
         +h+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737711786; x=1738316586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCKxfpEvFGFKegufwHBaouHIy5AlagjL610S6FVgBBw=;
        b=AYpmhFskKNJg/Vp/f71qf4e7H7hEvDtGYx4hxNLl7FqzYyrv5T8Ra5uao0xtrnVvox
         bqHcBi5V4qd//iQv0nw0Jswkls3/lLN8U16flAPyrQfv1DaRBTgW3i6KqgT6D0QJ6oqy
         coOEOlbRQ02KL1UtS+EhiJmcjw+Xfk9PeeuFZoSKhcozMssGwFvvFgGlqqR+SMrRe9e+
         3J6//6aftjhJpYPyrEExSVfyJahDbfN2IkLipdaeenwJzISYfE0AUI1plUpQQAhx8ZgN
         9D+Je5KOqo6f2L3dmpVx1aF8KBoPSWc3V5n9VbmILWTlAnXWyqoYZX3HOF+3vg6DUAzg
         VYig==
X-Forwarded-Encrypted: i=1; AJvYcCUde1RT3mETk1q3qBKspHYQrHY4RdqFFD3bCT9gvmOKeEUItw4LAUR9Hpiu0OHegH+1+RO3hrscldflOPWMQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAczUwmCwZFSUmwqj2MW+IehZue1vB0jhcQ1SG1oC6Bg7jTSLW
	9LYjmBbGBdF8ixRHu9UhPhb1gx3ZyYMfP4yPAGDOj54A6ys77cDQW3DFUJjxOx0vH5ZK8PQ3d9e
	G0jUKCvdQsYhVU2/LdKRjUKZR+/HU/ad4G7uE
X-Gm-Gg: ASbGncu/fNmsqIkiMNit4xMoDCpxh2zE1B4KG2DFgocfDG+OJd+kpnNPOEanhEcFWlh
	vdiZPjFKSWuapwxSnN7DEVrSJaELKx4NWLspBkdWZ7mlQitNnjSwAA2plg7YmdprPrJgMyVFN+i
	sNPpDm4Lv+rIHHsFZm
X-Google-Smtp-Source: AGHT+IHLGy8hdNYFxfsiSfrX5tci9dR6SC2/Jw3hIfDOKqXy5DdIj2fonBoqEx9nkNGsQSDkbpYd5gqOMRnUIQhqfk0=
X-Received: by 2002:a5d:698d:0:b0:38b:d8e0:a862 with SMTP id
 ffacd0b85a97d-38bf58e8af9mr22800208f8f.43.1737711786537; Fri, 24 Jan 2025
 01:43:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-3-edbf18dde5fc@gmail.com>
 <CAH5fLgismQ4whAKswp843T-=q_1+C7DB1qqg6rqk013DGr13iQ@mail.gmail.com>
 <7a84da97-504c-4d1f-9c98-3a152e348c73@gmail.com> <CAH5fLgg5tjFowQq=LWQ2BtGVqHmdMMp=9Uxm4BzSy+UiXGPhZA@mail.gmail.com>
 <2025012418-legwork-chug-f08c@gregkh>
In-Reply-To: <2025012418-legwork-chug-f08c@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 24 Jan 2025 10:42:53 +0100
X-Gm-Features: AWEUYZn9plBl17BVJuIf6_LZct_uOXgxv23GUTyrziJZl0qLFm0hT_XeaBCWR50
Message-ID: <CAH5fLggCLSRfiAGnb9ZDRdUsMrBxWDjbVSxVqtdduDi5D1vQtA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: miscdevice: adjust the rust_misc_device sample
 to use RegistrationData.
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 9:06=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jan 24, 2025 at 08:29:38AM +0100, Alice Ryhl wrote:
> > On Thu, Jan 23, 2025 at 6:57=E2=80=AFPM Christian Schrefl
> > <chrisi.schrefl@gmail.com> wrote:
> > >
> > > Hi Alice
> > >
> > > On 21.01.25 4:40 PM, Alice Ryhl wrote:
> > > > On Sun, Jan 19, 2025 at 11:11=E2=80=AFPM Christian Schrefl
> > > > <chrisi.schrefl@gmail.com> wrote:
> > > >>
> > > >> Share the mutex stored in RustMiscDevice between all instances usi=
ng an Arc
> > > >> and the RegistrationData of MiscDeviceRegistration.
> > > >>
> > > >> This is mostly to Demonstrate the capability to share data in this=
 way.
> > > >>
> > > >> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> > > >
> > > > This change causes all open files to share the same value, instead =
of
> > > > it being per-fd.
> > >
> > > I know, if that is unwanted I'm fine with dropping this patch,
> > > it is mostly here to show how patch 2 can be used.
> >
> > Perhaps instead of changing the per-fd value, we could add a new
> > shared value? E.g., it could have a counter for the number of open
> > files.
>
> Counters don't work, sorry (think about dup() for file handles), please,
> either make it per-file handle, or a "global" thing for the specific
> object, don't attempt to count open/release calls, the vfs does this for
> us already.

I mean, it's just for an example, shrug. It could also be another
ioctl that updates the shared value.

Alice
