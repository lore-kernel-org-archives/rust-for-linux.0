Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D338273D6F
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 10:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113998; cv=none; b=EGT3HzaRUPl7Btp/rR2SarSMEvGZ3uUUDWhvzy4wbOcqa3Kvoeuq+IMMwCJp5LwhyG+1UcwcHruizYumOxsm0SzBDWL9pnUrg20Js6wlx+qP+yS7Q1KBboaBa+yhFsDHIme1ebhxxivmVddxBCKe0geqvBgnl8FrnSvjPXh8PCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113998; c=relaxed/simple;
	bh=xvvkQhtVIqyzEPg+3gJRfjF7bLrgLly5dCN4UQJTB5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G39r3g6eKuwzfLLfCBWW8ZaH+RfA8s6Web0R8QLv2rYTlzHp7MLc9AZMGNtdiEBQR+rN3HGdWcip5j7YbDqBlCzlXqXPQ1SuifSRfZOaZ979MrWpUusr0N3KtQTmhwuF4h/MT5WpcXViOjcFzbigV3YiXpZGuYmdGZ+vwW5UBJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dC56ye3Z; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dC56ye3Z"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4806fc58fa5so49151385e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 02:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770113996; x=1770718796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKtpLfF5GQtcoNGGOm242qe747ja9KaZrktNT9l6vdo=;
        b=dC56ye3ZIMcOWhbvc9ScGwedwYkt7DGyHNl108rLQZtzfqwk4kZlj7RAOuwMq/uWIe
         FC1wlNeu/O2zEaVqzQOVqHt88H5S2RIzKhH6kKxZxG5W5VjbZr0Vh8kqDOjt1hKDcQvF
         WA2fbN+S//yrEd1jDsw2MBGhH9nEcvl1eJHGagRSPiz5hPu6l8dIschzvx9qTo58xQp+
         9yKrjAjfYrHVA4ITBAjMbOIMmBhMDtSbYv/3Tla3sLZIfenvWttnFtpuDqHajJ/1M0Re
         ljJlAwaLshV/cXi6On7fMwnz2/tAMNJAnwgV1AnCIOJk1hLt01tdlBYYGhJp1J/5Xtew
         oqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113996; x=1770718796;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZKtpLfF5GQtcoNGGOm242qe747ja9KaZrktNT9l6vdo=;
        b=Z8Xi2aCoz5EMF8HWKr0/DC4145uN9wP/4YQV0OqUoEpiNxi4rpD9eu/PwEM5QD45n0
         LmT28AbI27sKvMC8tksagHG4QPaUMXj22YQ9O+loXJE6RxkmdtRI20c3WKPvMsB0k9Ul
         w/XzpFBR4gXQ4mamqLYO2K8ugOz3pvQOZaaDuET+qzptpvBrwfHSOGRMzqEyFJdStOmX
         mHOLgQzTceqBmmjmp6gDxVv39m52O7MyT5I9l9KWvXHNlPEpQCq3QJsysYl6yHF66PxU
         nFO1j0l7idrQX6S6L6JWNaoFSkW4RmkoeGD+gyR6v/vK7r0rn1qstLSRkzSvMfnoDz3a
         NVQA==
X-Forwarded-Encrypted: i=1; AJvYcCVMbmMLsjhqIYKs/gp2n3hA2KDB4r7fMTCkqsG0MaqMYJGQM6uxy3EzI5GHpGOXlYYAfqmG+QbhJlwGNOOrkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3AKKiDoGoKlAD63QG3O3vaiSswETUiSsBaTRS9Zn/NQAMjsie
	9cWio46X1dSBZbGowXhjW6xdHQGAAuRXbH0+zzsr85ZViRlSt7L36ykWag2+mg1ZxskZf2PTto+
	FXFqALU1Klg2PLFeMEg==
X-Received: from wmfv6.prod.google.com ([2002:a05:600c:15c6:b0:480:73cc:3e48])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3148:b0:47a:935f:618e with SMTP id 5b1f17b1804b1-482db45ce3amr189304255e9.15.1770113995703;
 Tue, 03 Feb 2026 02:19:55 -0800 (PST)
Date: Tue, 3 Feb 2026 10:19:49 +0000
In-Reply-To: <CAAofZF6jcCAdDjRp-7w7+_ZgOG4k3apxbSiKvGoUDVf5hw0GhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251008151554.340806-1-marco.crivellari@suse.com>
 <20251008151554.340806-3-marco.crivellari@suse.com> <aOaJlHEPzHcAdcUx@tardis-2.local>
 <aOeZ3ho6SHjmaw_2@google.com> <CAAofZF76TADGfF36gMV7qpZCHpXUYY+aOi_mFwrE6UrnkkQKXg@mail.gmail.com>
 <aWS5Yg9xScOR51Q1@google.com> <CAAofZF58s-q4WxOFYk1K29x+ceiX7rjFuNo498VVqL5AZckkNw@mail.gmail.com>
 <CAH5fLggwRc51eVHAtKO-nUNKJt98PpMOGq2Nrnivh047AGPMaQ@mail.gmail.com> <CAAofZF6jcCAdDjRp-7w7+_ZgOG4k3apxbSiKvGoUDVf5hw0GhA@mail.gmail.com>
Message-ID: <aYHLxVwa6eBYMuZT@google.com>
Subject: Re: [PATCH v3 2/2] rust: add system_percpu() around the new system_percpu_wq
From: Alice Ryhl <aliceryhl@google.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2026 at 09:41:07AM +0100, Marco Crivellari wrote:
> On Mon, Jan 12, 2026 at 5:23=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> > [...]
> > > > Another approach is to add a new `enqueue_cpu` to the existing `Que=
ue`
> > > > struct. In that case, all of these four combinations become legal:
> > > >
> > > >         workqueue::system().enqueue(my_work_item)
> > > >         workqueue::system().enqueue_cpu(my_work_item, cpu_id)
> > > >         workqueue::system_percpu().enqueue(my_work_item)
> > > >         workqueue::system_percpu().enqueue_cpu(my_work_item, cpu_id=
)
> > > >
> > > > which approach is best depends on whether you want all four combina=
tions
> > > > to be legal or not.
>=20
> Hi Alice,
>=20
> I was starting yesterday evening when I realized the 2nd approach
> would be a better
> fit for the work we should do now. I also think in this series we
> should already convert
> the system() users to system_percpu() (same goes for system_unbound()
> =3D> system_dfl()).
>=20
> Using the 2nd approach would just make the migration smooth because we ca=
n just
> rename all the users of those functions.
>=20
> I think it's better to migrate / convert to the new functions because
> they are using the new
> introduced workqueues. Sooner or later in the C code we are going to
> have warnings
> for users who are stuck on the older workqueues, so it's better to
> also migrate the Rust code
> on the newer version.
>=20
> In short: I would like to introduce only enqueue_cpu() so that it's
> just easier to do a 1:1 conversion
> without changing the behavior and in the meantime introduce these renames=
:
>=20
>     system_unbound() =3D> system_dfl()
>     system() =3D> system_percpu()
>=20
>=20
> What do you think?

I'm ok with the simpler approach.

Alice
