Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DAA29CE3
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Sep 2024 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727024709; cv=none; b=TsDSjW18FG71AtLoaa+/s20kAfuNUfwwjJfKJkf22dbe5ZWdlNQYMP+UbT19/DLRpAgarFcv9/lunSiwIyLzyg49C/37ExSKBg/AcFG1+dAQNkougJ+XajoHzUvB51r+KpT+U36NbA9+7tC6wby34r9dNQtm1HPeM1k/lE6XkcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727024709; c=relaxed/simple;
	bh=hKouXnSohzO0zQ+wjR/Dh6OTuSEbhD97eR3Ipl28BtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3IhIgbuEEHFLEY/mOyz46MO6APAOgrazLpt7vBkKQXGMwXNXyRhKW9UHFGy8xFh+cUV/VVdGBmGR5RfaGcgupq3ty9ojYhKnI2qaAWmVehOjLSPcyqFx5oowIbDJpHRUmEU9VPShKFZi0g9vYArvMgVxgzNeZ1+TMhBrPG/+b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gl51o3We; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gl51o3We"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso34438465e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Sep 2024 10:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727024706; x=1727629506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veWNnGSV8JPvO7ZEpQhYz2qiIqFZBxeslk/SL0SM1dY=;
        b=gl51o3WejSPMf5yAPFevTRkybfLSTSltDTboBh4WigGKk+cTFeJ9zkdQEj45eS3HdL
         xTbcinxhjzlXIRuD4hJSw5DUhNNMdRdtwzFNb8mu9bCgLY00qxpWgblh2ozvz3l24+pW
         I/V+CHIARfTKl1nr2iJimWLSCdZZ1VA6YfFxQQ+bBLD99XOdw+UYM6DlCGpiDUwD+3D/
         wTQ9CPs13uZPEEFmAHgXFSt/B4U4ys/3SkMNXaLt3ik60k6T7pZKLqTGOx5ekASDXFiA
         1yaRNiw3Xd8nf2HpZrWjpA+4OaGPZOEuHPyaoLsL09dTMJvneh2UQxCfLcyiNlSZCDvR
         MXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727024706; x=1727629506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veWNnGSV8JPvO7ZEpQhYz2qiIqFZBxeslk/SL0SM1dY=;
        b=ZDR2OstZDu2Tgl9n0pIRpKxL0ZrWjXQHjuHyl8FMp+xjwqYPFbJVc6EQjSOs7IPBic
         4i8Rgdvw0kQKi1nyNuDx7YbT9wjpDpMpPHRMm5p3xGWO2pdVGxGdomFGhMaIIHQMhS+R
         lfdI7E3j76edBScgeVwb8kn358qzDK8VuwCLQBPDtgY8LBVu8Hzv2lsu7xDO1O/Umvoe
         Ldn2dZAOWScZUCcYdbHU8sA4FPEFeYd5IcHKOY60qqr5EG82BzfjP99wG1r4goQQ3BD/
         aFA3lM6HViiOvzqAaDTEmtyBbVUdg6mCdVqZEUbSiGRUCTJIMGN3kfPgpXAZjuYLhzOX
         SUzA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1Ms2Ke4xbfUtTcoI6U9PPJxuleBvFSqbHGYjt1QNoVIfMPmfUwS1B4HBTWRCSfL3K9Jjol2J8zDClD6T2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDrOcsXKKiHEb92LgZ5RMtFnjbqIwi0EANbXKB9MgBzHNRpbdY
	3BckWxAZOm1tETsiYfX4CnVSpaLIrawMWBcorVKFrkSzMKbsVMR6aEN+qe3oMdBdzV/FN1GMXLg
	FydH0NRaN8oKDSQrBBEgZ+FjczhvWnTPhAiFW
X-Google-Smtp-Source: AGHT+IHoRj232ud+Ogb0cPaaHYQs3nhgibC+IH2EwIfqZg/zoPtqI0ieL1JHiQCGJqS5QB6NuSYTV7Ec7TzO2+EbIxk=
X-Received: by 2002:a05:600c:1d1b:b0:426:5fbc:f319 with SMTP id
 5b1f17b1804b1-42e7c1a97b3mr64548645e9.33.1727024705648; Sun, 22 Sep 2024
 10:05:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240915-alice-file-v10-0-88484f7a3dcf@google.com>
 <20240915-alice-file-v10-5-88484f7a3dcf@google.com> <202409151325.09E4F3C2F@keescook>
 <CAH5fLghA0tLTwCDBRrm+GAEWhhY7Y8qLtpj0wwcvTK_ZRZVgBw@mail.gmail.com>
 <39306b5d-82a5-48df-bfd3-5cc2ae52bedb@schaufler-ca.com> <CAH5fLgjWkK0gXsGcT3gLEhYZvgnW9FPuV1eOZKRagEVvL5cGpw@mail.gmail.com>
 <afe99ad2-bb53-4e80-bc43-f48b03b014cf@schaufler-ca.com>
In-Reply-To: <afe99ad2-bb53-4e80-bc43-f48b03b014cf@schaufler-ca.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 22 Sep 2024 19:04:53 +0200
Message-ID: <CAH5fLgiWZzOQt+B90c59gvMkdut=owMMbN1Gd1G8+ZMCRkJvVA@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: security: add abstraction for secctx
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Kees Cook <kees@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 22, 2024 at 6:50=E2=80=AFPM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
>
> On 9/22/2024 8:08 AM, Alice Ryhl wrote:
> > On Mon, Sep 16, 2024 at 5:40=E2=80=AFPM Casey Schaufler <casey@schaufle=
r-ca.com> wrote:
> >> On 9/15/2024 2:07 PM, Alice Ryhl wrote:
> >>> On Sun, Sep 15, 2024 at 10:58=E2=80=AFPM Kees Cook <kees@kernel.org> =
wrote:
> >>>> On Sun, Sep 15, 2024 at 02:31:31PM +0000, Alice Ryhl wrote:
> >>>>> Add an abstraction for viewing the string representation of a secur=
ity
> >>>>> context.
> >>>> Hm, this may collide with "LSM: Move away from secids" is going to h=
appen.
> >>>> https://lore.kernel.org/all/20240830003411.16818-1-casey@schaufler-c=
a.com/
> >>>>
> >>>> This series is not yet landed, but in the future, the API changes sh=
ould
> >>>> be something like this, though the "lsmblob" name is likely to chang=
e to
> >>>> "lsmprop"?
> >>>> security_cred_getsecid()   -> security_cred_getlsmblob()
> >>>> security_secid_to_secctx() -> security_lsmblob_to_secctx()
> >> The referenced patch set does not change security_cred_getsecid()
> >> nor remove security_secid_to_secctx(). There remain networking interfa=
ces
> >> that are unlikely to ever be allowed to move away from secids. It will
> >> be necessary to either retain some of the secid interfaces or introduc=
e
> >> scaffolding around the lsm_prop structure.
> >>
> >> Binder is currently only supported in SELinux, so this isn't a real is=
sue
> >> today. The BPF LSM could conceivably support binder, but only in cases=
 where
> >> SELinux isn't enabled. Should there be additional LSMs that support bi=
nder
> >> the hooks would have to be changed to use lsm_prop interfaces, but I h=
ave
> >> not included that *yet*.
> >>
> >>> Thanks for the heads up. I'll make sure to look into how this
> >>> interacts with those changes.
> >> There will be a follow on patch set as well that replaces the LSMs use
> >> of string/length pairs with a structure. This becomes necessary in cas=
es
> >> where more than one active LSM uses secids and security contexts. This
> >> will affect binder.
> > When are these things expected to land?
>
> I would like them to land in 6.14, but history would lead me to think
> it will be later than that. A lot will depend on how well the large set
> of LSM changes that went into 6.12 are received.
>
> >  If this patch series gets
> > merged in the same kernel cycle as those changes, it'll probably need
> > special handling.
>
> Yes, this is the fundamental downside of the tree merge development model=
.

Okay. I'm hoping to land this series in 6.13 so hopefully we won't
need to do anything special.

Alice
