Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1783FADF1
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802783; cv=none; b=F8E2pcSGOd+FdmeQ4DpD0qH5aBeqm5yBvv2MUUdEsc1Kw/KQifrKwp1vCM3jixnwkcgoM9OyPorXh3rYTE01wMKsVtrnfibk/qQCeHQqJiIrULyo4gYxy8G16NkDakIrkwR7UQrEdb3liKSVsmPAW/zNCGCQtqigHYTALKatiXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802783; c=relaxed/simple;
	bh=ew4p1M6EiwXVqYxQI4iNdZGDzMbxd2aRA4toI29bDL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEaYPVf07XP5VLedJSdZYTMJiTy1huGE5QmtsWiDypZHHKYmFZYcet2OoW7NTK22cJ/A+9T0C4haMeZFIAW3YWu+MpIpLZLXfFqk8QxXIutj4F5x2DSUJYWNlOggwlZX8GNssCAW/QJ83jb0D1xdvkVcoYTXlqrgeV256FvZCCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8t+tXIH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8t+tXIH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6693D1F0155D
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 13:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779802778;
	bh=cgpurTLsKTKOc/Mbx1UPwnMB8AY1ZoR1IaWf4i6T0+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N8t+tXIHO1C0ThdNhx4NG7GPuTp1zVcpSHoE5MItvLaaE/BufJ4bYQLPSxKNkPj6q
	 w4sR35SZbjB0P2Wq7Pgj4RIWAf6wziPDfa5hKuTngSm09MHsKlQKJJT1f7awxNJael
	 ldb6qQqiygevutO2q9kAa+KQN2CEqdNIks6Rf1rVEHYRQcKgrk4Aw9YY9VfFwjOd6e
	 oC5h2KFpshF5vp3FuNv4fnp3y4Nf32RU6K3FJ+CoRCpW56RVYIkCjWdYrOF8ozYA+F
	 T1g+DI3j7zz1ZzSqqs+Nqw2E/z6JoJ++OUBBmiubzf0fILk7yNLiRj2B4EXfHZG/7d
	 RmxqUsR6ia2uA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39378db197aso108795091fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 06:39:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+CE2iLajahK4TSmCodaTPDESDswmCIw/Mg+9TtV1yon1Uz8IzwjrtDmADezv8cD4H4mr6lZ6k8PFfpCqXZSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeVOWn+KIit9tFUXCMwpyDN/ReJFsX0zXojftX8VpZ70Y3KM3O
	0aVUNsemkZt39aEwElVxX06USeBQ6OUvG6PIzhM0R7f6GhNjPcLPMGtr1GrX56AnV9VoUVNlVvl
	ZPyIgASdAqrkg8YzsD7O3TBGEVnHLDjw=
X-Received: by 2002:a2e:3506:0:b0:38e:a8ef:b61 with SMTP id
 38308e7fff4ca-395d8d1dcedmr42980691fa.29.1779802777076; Tue, 26 May 2026
 06:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
 <20260522-binder-strict-provenance-v1-2-3d6e9406e864@kernel.org>
 <ahWTBbLpYEDlPTr2@google.com> <CAJ-ks9kdwuO=wmjmfhHMOOSG6cuEs7hnVVActxP5DSHTRFfX7A@mail.gmail.com>
 <CAH5fLggtyjE8utcGfESCGKPTyqpdbPsKCvpJX6x1yBKUYywW5A@mail.gmail.com>
In-Reply-To: <CAH5fLggtyjE8utcGfESCGKPTyqpdbPsKCvpJX6x1yBKUYywW5A@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 15:39:00 +0200
X-Gmail-Original-Message-ID: <CAJ-ks9=8GSw4sZxy_Vm8VW5j8n02yxr6eDSX3TA7VrnBo5pCDg@mail.gmail.com>
X-Gm-Features: AVHnY4J4WNB4zuGGonXlgzi2-J6tNiV894ozypzzkdNwcN2689I1UxjKoaM4TdU
Message-ID: <CAJ-ks9=8GSw4sZxy_Vm8VW5j8n02yxr6eDSX3TA7VrnBo5pCDg@mail.gmail.com>
Subject: Re: [PATCH 2/6] rust: binder: transmute transaction data
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 9:36=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Tue, May 26, 2026 at 3:34=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > On Tue, May 26, 2026 at 8:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > On Fri, May 22, 2026 at 07:12:47PM +0200, Tamir Duberstein wrote:
> > > > `BinderTransactionData` is a transparent wrapper around
> > > > `binder_transaction_data`. Use a transmute to view the transaction =
data in
> > > > `BinderTransactionDataSecctx` through that wrapper, matching the sa=
fety
> > > > argument at the conversion site and avoiding the raw pointer round =
trip.
> > > >
> > > > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > >
> > > I think it is an anti-pattern to transmute references. Please keep th=
e
> > > raw pointer cast.
> >
> > Can you please elaborate? We already have this for kernel::io::Mmio:
> >
> > ```
> >   rust/kernel/io.rs-    pub fn relaxed(&self) -> &RelaxedMmio<SIZE> {
> >   rust/kernel/io.rs-        // SAFETY: `RelaxedMmio` is
> > `#[repr(transparent)]` over `Mmio`, so `Mmio<SIZE>` and
> >   rust/kernel/io.rs-        // `RelaxedMmio<SIZE>` have identical layou=
t.
> >   rust/kernel/io.rs:        unsafe { core::mem::transmute(self) }
> >   rust/kernel/io.rs-    }
> > ```
>
> I also think that code is using the same anti-pattern.

As in previous email: please elaborate. Why is casting through pointers bet=
ter?
