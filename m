Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B801E2615
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jan 2025 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736244697; cv=none; b=uPqOMWqdzrKHDlV0ea2YIG0tzYg17cLIwyiN8H8SCavMqQ4nHfP55HJoGaUk8zQf/TQZJAjQaIVU0TOkDRcAwuVUcpJmZcuZLu3R31YkOoBZaonWTeg10g52L0vOdt1SEp4WcQVIcyMVT4t899aYrl3kWJMUDfoT9EVPn1cnKd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736244697; c=relaxed/simple;
	bh=o3IfCcJs8R6rNBKJN/1m7j1H9Uzw9S63JvNX4Op2hE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6jQloT6SCib43jga0Z6bwbuXqIjjYvEa8V0zmk/UfxXfYdoWakXglcVbEr1yuLgTkWbE7Z97jxIp/hPhU/dmFH1sHG+d/F/VsEI2JHIr+Ngls2huvuXZIL91p6L/J2QrO2bSOL90Bwd5zk4bBfZNl9w+pzabJFyjQhFMaG6MCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HveJ+TdA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HveJ+TdA"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862a921123so10331550f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jan 2025 02:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736244693; x=1736849493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tToGeoZK6CqWKTsOxe2fwO1OtfKXuCyA66/ItVRVwZk=;
        b=HveJ+TdARvqpyZTD8d3NcC7/hkT6hPJPhfsb1akKzeOOFJ3bIKWX/L5WpytlazEwb4
         Lod9OAuDOtduaofwISkxuvIfy4+sKhSKTRcJ9vomgtE/JbOpooc4LBA9HyEmX/pnWyRZ
         5+xC56MOXhMx6ZmheR1PQond2SNtZSfJnbLT4AmrslpVwWzsBy4gKSaXDbk0S+LdnW/6
         MCHR7tSIFreEEFsBVmSJyT/0qZPRCqVQfecAyPvN6/GmZP5XbGrRy71chQBTE9HcVTm8
         KoVTKBZSsRsgMn0xbPDqfjI5xCTdZPX2Ad4BEjeus8MZb/cthWYnEHh9IzhE7O4EjAP9
         fh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736244693; x=1736849493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tToGeoZK6CqWKTsOxe2fwO1OtfKXuCyA66/ItVRVwZk=;
        b=xDhfigt+h2PvpGLXjq4G7l9XaOmL1mkYR2YNho7rl+ENzIo9a/06IFF4D8BdbwwljS
         oyAT3fZ+31exmbHxIDldyZK5cu/fcrAlQDLxaukPg5q/iw/WYZgdxUglp6NXj+kgEG6S
         pYSY4madbh9XuzZvW+dv7WYi+K2FBq1dBJ4EgQKibYrG2lWCNTuAEbhlWoXLMFuovfDm
         i1xWPMTn28k6rsoTSuLy3Kr27DZ6fL+e9wKrHlgc38f7o322V58gp6lgIPbrvuLOZzaz
         XhMXuGbhxoxTtLdBDpB41HdLUZ7Q8u3tLZZT9CIudfrrLAmA2SorfcCwbqTUZ8pbaNEX
         wXyg==
X-Forwarded-Encrypted: i=1; AJvYcCWsdlwN/CZOA8hR3uSuVxc36R5UKc50MPdOEvnTCgGdKhbjdx3cBBEL2m4FHDONnb4EAWm7Kbh5i1BT+9kHGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpDSwCf+K4ETGa7DmjD3nJ45GbDoeqJnanKdh8zJ5hkrfn2wrI
	8RfH/O5/TK6ZlULaHAc2JMK2TkWbGy/Az2xQcoUH1fEP6pr6Tzp1ZsDqBqMX82pzAblpqyr7XFf
	FfKZxE0j6+jRRYg6ivU9JrmBMloeqZeSrGTGS
X-Gm-Gg: ASbGncv7KlouOSfLpyVUtf/YQ8hEYML9PDkCajNrQwf4ZoJBh1WDEdLIwGeHggBpBug
	mc3WFIGFj2kaCx2ZgFwne9p92qRM1bmQKmGmS+bjMzpAppbWdp0OhCMw9Ltpf1xSLFTd1
X-Google-Smtp-Source: AGHT+IFb6kAhNCeDYhA+1zOewtDsfVA0bM7fKteqNdW4Fgvl9nCwChlBL5BUShV+lE/eA8OCPQMrBQg8TwGo0r64YQU=
X-Received: by 2002:a5d:59ab:0:b0:385:fd31:ca31 with SMTP id
 ffacd0b85a97d-38a223fd39fmr60227828f8f.53.1736244692669; Tue, 07 Jan 2025
 02:11:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103164436.96449-1-dakr@kernel.org> <Z3vC6MzIG7zN8zBT@phenom.ffwll.local>
 <Z3z8Ra2PUQjL91kn@pollux>
In-Reply-To: <Z3z8Ra2PUQjL91kn@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jan 2025 11:11:20 +0100
Message-ID: <CAH5fLgjvP1=aaw9hC8M6L=0uWO+-z+RkC8aW+pn6Z7SkSn03+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] devres: add devm_remove_action_nowarn()
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	tmgross@umich.edu, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 11:05=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon, Jan 06, 2025 at 12:47:52PM +0100, Simona Vetter wrote:
> > On Fri, Jan 03, 2025 at 05:44:30PM +0100, Danilo Krummrich wrote:
> > > devm_remove_action() warns if the action to remove does not exist
> > > (anymore).
> > >
> > > The Rust devres abstraction, however, has a use-case to call
> > > devm_remove_action() at a point where it can't be guaranteed that the
> > > corresponding action hasn't been released yet.
> > >
> > > In particular, an instance of `Devres<T>` may be dropped after the
> > > action has been released. So far, `Devres<T>` worked around this by
> > > keeping the inner type alive.
> > >
> > > Hence, add devm_remove_action_nowarn(), which returns an error code i=
f
> > > the action has been removed already.
> > >
> > > A subsequent patch uses devm_remove_action_nowarn() to remove the act=
ion
> > > when `Devres<T>` is dropped.
> > >
> > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > > ---
> > >  drivers/base/devres.c  | 17 ++++++++++++-----
> > >  include/linux/device.h | 18 +++++++++++++++++-
> > >  2 files changed, 29 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> > > index 2152eec0c135..d59b8078fc33 100644
> > > --- a/drivers/base/devres.c
> > > +++ b/drivers/base/devres.c
> > > @@ -750,25 +750,32 @@ int __devm_add_action(struct device *dev, void =
(*action)(void *), void *data, co
> > >  EXPORT_SYMBOL_GPL(__devm_add_action);
> > >
> > >  /**
> > > - * devm_remove_action() - removes previously added custom action
> > > + * devm_remove_action_nowarn() - removes previously added custom act=
ion
> > >   * @dev: Device that owns the action
> > >   * @action: Function implementing the action
> > >   * @data: Pointer to data passed to @action implementation
> > >   *
> > >   * Removes instance of @action previously added by devm_add_action()=
.
> > >   * Both action and data should match one of the existing entries.
> > > + *
> > > + * In contrast to devm_remove_action(), this function does not WARN(=
) if no
> > > + * entry could have been found.
> >
> > I'd put a caution here that most likely, using this is a bad idea. Mayb=
e
> > something like:
> >
> > "This should only be used if the action is contained in an object with
> > independent lifetime management, like the Devres rust abstraction.
> > Anywhere is the warning most likely indicates a driver bug."
>
> Yes, I thought of something similar too, but wasn't quite sure if it's ne=
eded.
> At least for me, if something has the postfix "nowarn", it already makes =
me
> wonder if I should really use it.
>
> I'll add a paragraph.
>
> >
> > At least I really can't come up with a reasonable design in a C driver
> > that would ever need this.
>
> I tried, but couldn't either. The only thing I could think of was a revoc=
able
> thing in C.

Potentially if there are two cleanup paths that could run in parallel,
they could use this to avoid needing to synchronize which one removes
it?

Alice
