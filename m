Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4294C26AC3
	for <rust-for-linux@vger.kernel.org>; Wed, 14 May 2025 22:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747261952; cv=none; b=Eeq81VD1iijG3een1AeteSbbnKKe7vVrU8X8Ln096kl/REQTXHli/RLrbIBK9Fe3Aiy7o5IKq5+QWeRqI5SHVNGowxdGjP3ybwf8XnqLULNjC0zmWbt4mLUVCJrN8i8ck8QB0m6oZcwqV00nQw8qdGGS6Etk09rShXdPEkXu32s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747261952; c=relaxed/simple;
	bh=jiFV0vlenO1Rbvku4DYYGPaFMDhbTykcNufaXyd3YJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lb1UVu0QV0Uwq8WKl28gYNn9BMFDaLGjt0EJ7Ie+TxOqXv/ROavZ3bFobWwmeMEHWX4u+AhE9ykS/HVliHTVb5DzRjaq+K+sDRj4hnLXRLKIZU5F4kM/Kfj8puS3UXWOepaktBVUwsbnOPTe5JJ7jLvrb3ONzjjCk38s8EkTpvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mcV16G2/; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mcV16G2/"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1568a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 May 2025 15:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747261948; x=1747866748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiFV0vlenO1Rbvku4DYYGPaFMDhbTykcNufaXyd3YJ8=;
        b=mcV16G2/SLY2RaxABgo37IBukb+vGY/xEHXcRm0CyEdZMULExcxGjM3sbGWmzaxton
         JBCZxcWw5/rLT4ygPc4s4SME7Y60ihrAebKFtWJXbbRXGD218xLYmc9gM3PfUdUgH6qX
         cr5XK9xKW8UUzqu+q4XEpxPIJPqJzDPhOZWcFeYFFXt1lsrvXxgBc7Kf/g7pmp6vRjOj
         FIA3FAwTBqJ1T/7i/hnWmW+lZSNLPMxmz/QWgs4H2Q2QomAHXco4dGrjULVjMZ7bVDPe
         zqwmfm/6aJUG6RnC/Zx3QXirzZpXTC8U5dI/gwZdxNu9yRXa02LBc5HapcZOx8li5N44
         0Qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747261948; x=1747866748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiFV0vlenO1Rbvku4DYYGPaFMDhbTykcNufaXyd3YJ8=;
        b=aQwpzubvIK8SW9E1RZHmuAvZICtB4E+lNZXbIk5Qh41i/+oA4ENehcIWgN86DuWavG
         rTtYoR6en1S9PgTujMrIyPvTlJlzL7rPzbvW5nruYD+NSNC1j/nMuQvS8oUbyXSLrYlZ
         EVRvZ7UsjsTvLUQD49iSRpjEQRwLm/FL+94BB1L0Vc34P0FYb/39HcUqOQOIUJd1v+sX
         TccjhVyzP6kXPW27jkG6UjtGnrVpCy7OZWPAK+MCzFfzQ41OxYvK50Yp3ixcSphpC6rv
         H1Zo9Jbim6SAjcUm6zEo7OWH6iVPRiU3ZvMF6/0VvI8NtBdsr+Ld3GbkM3+UOcASFyd9
         qyWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHuHnvO3FQHIyOqKAsedOUKeNBPUeVAzanog0fcoNxtpZWDmzYwZsph5rN+x9D1rlTlW6z6dYJjN6xiYI/2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlrP7HArobmLddgEjoA67aeponik6cI93Xx/1DyA+GR9c6Ep64
	WFg6rA9vEiTZlHMgRYBV971x2po9RRRAmJx5+qMpzzrciJs+CGmroSZmu6XJQqGghRcuxkU+wUO
	BftHZqL9w78qdoLq8+ocsfAPnRuzc+KH4EwxMJDPD
X-Gm-Gg: ASbGncti30OqalUt2ooeX8Wp2pauHUySXfnPtAT2gKI+k56qZMuM91puysNpqY+Wn7v
	i2HGYLI67F7pA/j+upZHsbntXDWi3eWA7Ap4ASr7SRcOH2Kw/oXyoNtDWNyCTIQBNtd59wmsft8
	ypo6A8pOblbkNF8mPQbDJKEm5S5Q0VpaIrXbl8m8VygHar8qbSwK9qiU1ydcLpqT2X1g5qKWaY8
	w==
X-Google-Smtp-Source: AGHT+IENBVMwPkcZRK5Kn9zFnslPutCzR5+V6iz72Hx1RgIhIENZm9gONRlb04iiJ/C6bN5V//qD+Gh/Ii6iSS5eB68=
X-Received: by 2002:a50:f69a:0:b0:5fb:eab6:cdb0 with SMTP id
 4fb4d7f45d1cf-5ffc9db061dmr36510a12.4.1747261948330; Wed, 14 May 2025
 15:32:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com> <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux> <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>
 <CAGSQo00Pj0qF90712K7xACNEvr2e0q=98b8-0VUcXLD5V+oDhg@mail.gmail.com>
 <aCUVuXO_jORqlxwr@pollux> <CAGSQo02nP8MT8q-_gQwjUGFNSyiW2AKOQ3V4yy9jofDzjc0SpA@mail.gmail.com>
In-Reply-To: <CAGSQo02nP8MT8q-_gQwjUGFNSyiW2AKOQ3V4yy9jofDzjc0SpA@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 14 May 2025 15:32:16 -0700
X-Gm-Features: AX0GCFsh5Ea8MxW4AUlXxhaDj3kYAN9Fr24tLDobVyQg6MN8zSXM0SZhbLmPFx4
Message-ID: <CAGSQo017FgGmStYxLX7JeqV+AcMUMjmnxF6KBesFhc31BieBbw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 3:23=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> On Wed, May 14, 2025 at 3:14=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > On Wed, May 14, 2025 at 03:08:21PM -0700, Matthew Maurer wrote:
> > > On Wed, May 14, 2025 at 2:54=E2=80=AFAM Benno Lossin <lossin@kernel.o=
rg> wrote:
> > > > Another problem that only affects complicated debugfs structures is=
 that
> > > > you would have to store all subdirs & files somewhere. If the struc=
ture
> > > > is dynamic and changes over the lifetime of the driver, then you'll=
 need
> > > > a `Vec` or store the dirs in `Arc` or similar, leading to extra
> > > > allocations.
> > >
> > > Yep, this is part of why I tried to follow the "Build it, then hold
> > > the needed handles to keep it alive" approach rather than keeping the
> > > entire structure around.
> >
> > I already replied to that [1]:
> >
> > "If it changes dynamically then it's pretty likely that we do not only =
want to
> > add entries dynamically, but also remove them, which implies that we ne=
ed to be
> > able to drop them. So, I don't think that's a problem."
> >
> > It is much more of a problem if we can't remove certain entries anymore=
 without
> > removing all of them.
> >
> > [1] https://lore.kernel.org/rust-for-linux/aCR9cD7OcSefeaUm@pollux/
>
> I think the main question here is this - is it OK to land an API that
> does static-layout or add-only-layout first, and we figure out how to
> do dynamic modification later, or do you think we need to solve the
> self-referential lifetimes issue in the first edition of DebugFS
> support?
>
> If you do think we need support for dynamic layout modification in the
> first patchset, do you think we want to allow static layouts that
> forget things, or mandate that we always manage all of the handles for
> the user?

One further possibility here, which we'd need Greg to weigh in on - we
could add a method to the debugfs API intended for Rust usage which
specifically releases a directory or file *without* releasing any
nested elements. This would mean we could get rid of all the lifetimes
on directory and file handles. This variant would mean that if the
user did something wrong (e.g. released a root directory before taking
an action on a child or releasing it), they wouldn't get undefined
behavior, they'd just get no effect. If they wrote this kind of buggy
behavior, they might be *surprised* at the file being absent, but no
UB would happen. If we wanted a variant that used the current
recursive remove, it would still need the lifetimes, with all the
difficulties that entails.
