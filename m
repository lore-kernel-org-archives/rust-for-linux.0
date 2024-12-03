Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412F91E32BF
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Dec 2024 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223548; cv=none; b=KfLCpA4KR+c42Bu+HaoilZ/PAjvZTcQcWTVHFDm70J5hzm2lU/S++eu6UHfMpL7gTnmr8MMRobEHL7mKeTJBzsltN3sjDQhAwbMzRl0CyRcMx2kLlIxzDtfQmkPz1n1lEJcPRbMb9/5r1YDgBBTgLswn+Y8vccTMkSc9dBeCEYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223548; c=relaxed/simple;
	bh=G/uV3VWcCH22zMHivLa7VwR6PtdVxBUv3KTTfYzWtX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcNgEV5FI1rbpGtt8P9TBghc++bxlbwzce5ufIWWJPcQBraFrggArjbHCQQU9M55uUlwtnCkvNGe1GvUNYID/SLf+iGoXpnNS2jFK1vm6/G3GLlVNNn2Ef+ff/+0OzA1Gg/RCZSorTfUt88MBFXiVF358MmX9/v9MLU8yUY1CCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=osw5gBZx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="osw5gBZx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385df53e559so2993865f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Dec 2024 02:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733223544; x=1733828344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvO7oSSSLlyGlXJesd40xkQ3Qx/29E4LxsvtSxRhtqA=;
        b=osw5gBZxWI3LnzUiNo3qv1ebDJE4tUTSPbISGZVQlM1eQFHvcabLpBlPW0Mca5FQfC
         A+GvpOyoYPITS4GU+bvXCikPov13wE5czZskvQWeZmqvwgvSmLDFIApvTTNmwRs5ITXe
         ssDSk18gas8ySG3BsFbHLhhFSxnZIZ7DC5UopBsCggcXu3wCr/Y8CjFkNtLuSSu+VqJJ
         gGlschKQ3oWShHm17R+Wq4dAwPZ2IJ2OkFK2KLuuMPndB5wV2scc0zOch6G8iNhQpiAV
         wHI253HFL++ENfkJqhnAPeV5LWIKLTKC0uWfXEv5n/aCgn1I6HIRRuvEwF0SRs+qY02J
         H9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733223544; x=1733828344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvO7oSSSLlyGlXJesd40xkQ3Qx/29E4LxsvtSxRhtqA=;
        b=YNIJMCvTAcqMX7KNLckx+jhFei3w4csbzS1W6RoEcb910zDzJD0is07s9BqLEqys2t
         1Y/5ehdKnMB14ZSJrkLcVnk0xuNNKVT6+bDnpWzl3FlIC25+j0AznC0IyAjRJJ1c3pTZ
         Avk5no5frcWpuNc4Wo5vMC7MVxBHzYZY7nmRO9Am4Wle99j2JLipUK42V5y6lhS2FUcM
         r5myrkXDdwRdTJTKGN5iarPDer7y2GV3nXW5pC04+ZHME2OzIYr755mMGxfOBKgGA3jG
         iy/NXEVUSfuBWjzrcLPBX/3JXtNVg5gjWvcKFDIDLBqN+mDilH8yGUb6R92IOlOfr2TU
         dFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/n8+i4MTMIaJFBzyC9kL1xpHODQr2wMNrMT4w14o0lhQlAs/k1JXSOWLmO17g8ZSLYAo4WCdWGHJeq0g2Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKIm+ZQady/9iFt4MgxQg4Lm9mr9ZvjLzgSfPItz62WUo+Pb5V
	yP6Bzpx8vX7HHWIDCWgWEz4bOZqch5smnQrDcNiSAwEhMjKr3Q+TCm+9Cu2ek0v7B8IAIINI1jp
	4XnA6d6ISh4v3lOByU9twtPh/od677YZko2Rv
X-Gm-Gg: ASbGncuFcFOptJh1c9Z9YmGc2iSjWIZn/ciQGySUDGPO3mJwvLN7GQ7gv7Mf0VPt2gy
	sApQWr0l4ijgmsFjm/NNcNtHq2z+PMqihqirAScE/1ZZ7zzcCDswSZqmBEm7xXA==
X-Google-Smtp-Source: AGHT+IHPIHPJrpA1VgFrbn1LGMTDmbjcvUt0wuiaDpJhnhhJZrwW91lOLvnm4gtS/RYy7pFqADxfNSMer6BUmhNavWo=
X-Received: by 2002:a05:6000:42c7:b0:385:f89a:402e with SMTP id
 ffacd0b85a97d-385fd3ce04amr1170892f8f.14.1733223544417; Tue, 03 Dec 2024
 02:59:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022213221.2383-1-dakr@kernel.org> <20241022213221.2383-8-dakr@kernel.org>
 <CAH5fLgjcy=DQrCYt-k40D4_NcwgdrykUW9d74srGn5hxxo2Xmw@mail.gmail.com>
 <a25f7cfe-ef43-4841-ab81-0ecf59b20f15@kernel.org> <CAH5fLgjgvq40mEsFZZLGi1s_OHNBsOXPT1Si6vM2sruM=tibQg@mail.gmail.com>
 <5f34564a-618e-457c-868b-0a3901b6d69b@kernel.org>
In-Reply-To: <5f34564a-618e-457c-868b-0a3901b6d69b@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 3 Dec 2024 11:58:52 +0100
Message-ID: <CAH5fLgiG31JLL9ce_Wwaz_okg4roxAhmOniDEyw0hQG8vSTtig@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] rust: add `Revocable` type
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	tmgross@umich.edu, a.hindborg@samsung.com, airlied@gmail.com, 
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 10:36=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On 12/3/24 10:24 AM, Alice Ryhl wrote:
> > On Tue, Dec 3, 2024 at 10:21=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> >>
> >> On 10/29/24 2:26 PM, Alice Ryhl wrote:
> >>> On Tue, Oct 22, 2024 at 11:33=E2=80=AFPM Danilo Krummrich <dakr@kerne=
l.org> wrote:
> >>>> +/// A guard that allows access to a revocable object and keeps it a=
live.
> >>>> +///
> >>>> +/// CPUs may not sleep while holding on to [`RevocableGuard`] becau=
se it's in atomic context
> >>>> +/// holding the RCU read-side lock.
> >>>> +///
> >>>> +/// # Invariants
> >>>> +///
> >>>> +/// The RCU read-side lock is held while the guard is alive.
> >>>> +pub struct RevocableGuard<'a, T> {
> >>>> +    data_ref: *const T,
> >>>> +    _rcu_guard: rcu::Guard,
> >>>> +    _p: PhantomData<&'a ()>,
> >>>> +}
> >>>
> >>> Is this needed? Can't all users just use `try_access_with_guard`?
> >>
> >> Without this guard, how to we access `T` with just the `rcu::Guard`?
> >
> > I don't think `try_access_with_guard` provides any access that you
> > can't get by doing `try_access_with_guard`.
> >
> > That said, I guess this guard functions as a convenience accessors, so
> > I don't mind it.
>
> What I mean is, how does the following work without `RevocableGuard`?
>
> ```
> struct Foo;
>
> impl Foo {
>     pub fn bar() { ... }
> }
>
> let data: Revocable<Foo> =3D ...;
> let guard =3D data.try_access()?;
>
> guard.bar();
> ```

Is there a reason you can do this?

let guard =3D rcu::Guard::new();
let value =3D data.try_access_with_guard(&guard);
value.bar();

Alice
