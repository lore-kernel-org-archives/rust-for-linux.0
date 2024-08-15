Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4568417C9AA
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723725307; cv=none; b=ffx76Sh5O7B9Hc851VqychlcruVqPIpW/FI2tfHSLeFh5zbuN/AmY+U4HGAGTsaBL+yhr+lF87JTQtfjIZmCv2EyOtUx4lLMOyj+WYiZD2xvjpddWkGpe+e9pRwsJiRT3NXQoJSfVJ4IAL2kZzERdcxIfORmn7s/vjZ4RYOjA1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723725307; c=relaxed/simple;
	bh=uQvYqrPJzwS/8Ptp/F8xSXd4QSBGsixV4sGa9RP+nyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0uNfn2Ps1f8wQwzwZOoXbkCSHzjB/ExK2Hakx7X/dbIWZc/0uImOs3rw+wvlL1FbUftO0ijaA0jdUXe1k9xUI40I3EJ8CfsmMg60EU4TYx+JML70P9jwdXbOS4ytRx216+vzyKNtFC2gbvxuerumclTK2ZmwXmMu9MsqqNmtxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EGYOVNMG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EGYOVNMG"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37189d8e637so345116f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723725304; x=1724330104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGIDF+aYZNgQXSDZe/HjaDy7QWphoJnZtou4CagSDHc=;
        b=EGYOVNMGbuC0HyVWzFOEj69xK5PxmGix30HC+L94d+TBuEgNyadOf+nAzqGq0aCrkz
         sbWPJkYcof5WAwbDu6+dguRNTuohLrmC9cjthe4x8iZ4P4DkV5/6n20O9u3kWnxANp4L
         zFdIx4gc+4+oaqzUY5tfCWnsGUzdupWJ85tTBExrWx14wh7Vwt17d63bosALs9HoMNnC
         jvp4Hh9DW4ekRUkQSe6laNc2WK4w8enyIzifnes+PQfH/Cd5x5MCoMQF68WO5qaRCPgY
         0gMJsUVTsbj5zFpqPU/pq+s/Bjk9/yhMrpd9oTEVTRcrlXCv63WBC9JY/l/cD0RqmANk
         CxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723725304; x=1724330104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGIDF+aYZNgQXSDZe/HjaDy7QWphoJnZtou4CagSDHc=;
        b=kwIp8Q7+OKIYjyxOlAY3kNSBRCqFvSizEEIw7hAeTvBuLG5XX4UYYdkz5Q6QOUmwVS
         Hk4ledyq7C1+zK45s/DOgYr0cgtyjVXkqRkeQkr7Z6YWCbXqk68BGa9bDFrKE0ZNk+lW
         kzf7fuJYXjQGUaP9n/GCTIIoBw8pUqTlP7HFLY8Bi6DqL0vWFMQl8xWY6R4TJPPgE7NY
         tKyV7NuL0AJEhMG/7/tsU08Qh5KRuZvzTHvsW8XMYfy43CdeakjsYW40BTwu6KFv/meF
         +G53swFuBwjYrdl4kaVAXSfKZbxSLh4PdscEdYa1JMDaHmZgKwYVJYef1t3hw8pCXow+
         Qwkg==
X-Forwarded-Encrypted: i=1; AJvYcCWb6LpW5a4ybUmWOj3cQ9I59ENyJbn3XZKXU9yY6u9CwR0q9k4AVuZdix0AHbbyGP5vyJQpg6sV/EYc93/rpJY4jjsb2nnB12cME5pOzZ8=
X-Gm-Message-State: AOJu0YygY5pIW5h9aZ1PLpBCJ8RcsWfHqgX8fX4p4tmrvkXmDJs05QCo
	fImiKXxgva+GvnM3a3hDqqv4xbxWPoU7l9wRYWpWSqK1xAfjW0i3CSu7l24pPub7Xjf65rLYCxI
	M2/zxnpbX08BpywvecoJeHOoqyuiBCQMDUJJ9
X-Google-Smtp-Source: AGHT+IEAwSQtJNHUdRPQigq7uRt4SoNYYsQGSkn4XDCbOAfrLnsv+ih0U8e7xn81tFFxQq6aOGcjZ+3/+n3gowswxD8=
X-Received: by 2002:a5d:5d84:0:b0:371:7e73:eb43 with SMTP id
 ffacd0b85a97d-3717e73ec6emr2109262f8f.42.1723725304072; Thu, 15 Aug 2024
 05:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812182355.11641-1-dakr@kernel.org> <Zr0GP0OXliPRqx4C@boqun-archlinux>
 <Zr1teqjuOHeeFO4Z@cassiopeiae> <CAH5fLgjvuE5uU00u4y+HyHTkQU_OBYvHe6NS5ohAhrLntTX1zQ@mail.gmail.com>
 <Zr31jqnA2b3qHK5l@cassiopeiae>
In-Reply-To: <Zr31jqnA2b3qHK5l@cassiopeiae>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 15 Aug 2024 14:34:50 +0200
Message-ID: <CAH5fLgjzNpeVVurPqVS=tMkKQOhXz08EsXRO4s9wYsNBuT6eVw@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] Generic `Allocator` support for Rust
To: Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 2:33=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu, Aug 15, 2024 at 11:20:32AM +0200, Alice Ryhl wrote:
> > On Thu, Aug 15, 2024 at 4:52=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Wed, Aug 14, 2024 at 12:32:15PM -0700, Boqun Feng wrote:
> > > > Hi Danilo,
> > > >
> > > > I'm trying to put your series on rust-dev, but I hit a few conflict=
s due
> > > > to the conflict with `Box::drop_contents`, which has been in rust-d=
ev
> > > > for a while. And the conflict is not that trivial for me to resolve=
.
> > > > So just a head-up, that's a requirement for me to put it on rust-de=
v for
> > > > more tests from my end ;-)
> > >
> > > I rebased everything and you can fetch them from [1].
> > >
> > > I resolved the following conflicts:
> > >
> > >   - for `Box`, implement
> > >     - `drop_contents`
> > >     - `manually_drop_contents` [2]
> >
> > Not sure I like this name. It sounds like something that runs the
> > destructor, but it does the exact opposite.
>
> I thought it kinda makes sense, since it's analogous to `ManuallyDrop::ne=
w`.
>
> What about `Box::forget_contents` instead?

One option is `into_manually_drop`. This uses the convention of using
the `into_*` prefix for conversions that take ownership of the
original value.

Alice
