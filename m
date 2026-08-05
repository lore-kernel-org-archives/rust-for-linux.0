Received: from mail-24426.protonmail.ch (mail-24426.protonmail.ch [109.224.244.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ECB364024;
	Wed,  5 Aug 2026 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785940148; cv=none; b=OjzZf72XI/cqBxQzM0b9gJ7SHk0w+Id574WkYlKIskEE8CfSHB2JueWYmCWRttLUluasGGmlCoHv3aXTy+bVlt6tekWGfZ509yB81bpqOgymPhMShRCh3kHXB+0g7fRKwxxBG+lutWqefhFw+BHrub0Ag0zpv78NE/+GCXaa95s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785940148; c=relaxed/simple;
	bh=mJQE4EquGiWBRuG6TJJ3HJ3sVO9ktZiHkzUjhlbZVXY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TBNG576qX/CoStSE5b7bjQrgFiFFgev8qGAr/iY0z7iTHdvdeDZYaUkP0SOXocWgol7upuJyybX4xD04M9k9xoe8zc/9nJaCL8MNGRIs6pwSQ6xByPWVUcAgf95s7DyHm/ZYoXH59Au4/uPFPS4HA/DN6rkzw5PeilAaMUUgYvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=UVxiAlRX; arc=none smtp.client-ip=109.224.244.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="UVxiAlRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785940124; x=1786199324;
	bh=4qy3z3jNhoiG4DGN/ItIT1Isb7Y3IgZbkcI2XLGTctY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UVxiAlRXriVau7trkkyJkUd25b2O99/LUHEariClj/8TfkZWIxnTs0lZMpAuZ7l2q
	 GB5CdXo7t2x23PbBG4Kxfg5n+BUUSfVJCA7hSBSIIRYj0YJW8h4qOrGOB10PI6xa8V
	 cC+q79QYEflPiTg213Hno+VhM6sEjYoNIz+a1X3SlgyijKFu/ufq3eU7uk2JOHt5d+
	 LDRCVnPFB2KcN5ZIrhzo7gS+8bBmHTr4CMZk8p+TJ55YyUY4qL3I3Wmmz5t4wzvICF
	 OnIn5QM0HLtbGDFY1Cbc2lTJ3Q0mmnL9xuK2orQl/JU+Kshii5YChYDMn8g6nBgemG
	 F91v7yApl0C4g==
Date: Wed, 05 Aug 2026 14:28:38 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Daniil Detkov <d4n11l@proton.me>
Cc: Todd Kjos <tkjos@android.com>, Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>, Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] rust_binder: enforce delivered death process ownership
Message-ID: <LkLJ6kna_XlfWWj0zhJ4JNfzildMiCWFyD-Nfn2iFVvRINHEiDhrWZ2kXEPSz24jcoIGquTtxQDxnPxcULgZY10H4Usp6PGd5NkIu7ho5lk=@proton.me>
In-Reply-To: <2026080523-mothball-giant-c5a5@gregkh>
References: <20260805-fix-rust-binder-death-ownership-v1-1-a89594c3b5db@proton.me> <2026080523-mothball-giant-c5a5@gregkh>
Feedback-ID: 204876372:user:proton
X-Pm-Message-ID: 25a5de78ee48d2464d57f4e9311b0bb951df1286
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, August 5th, 2026 at 6:13 PM, Greg Kroah-Hartman <gregkh@linux=
foundation.org> wrote:

> On Wed, Aug 05, 2026 at 05:50:56PM +0500, Daniil Detkov via B4 Relay wrot=
e:
> > From: Daniil Detkov <d4n11l@proton.me>
> >
> > The delivered_links field of NodeDeath may only be linked into the
> > delivered_deaths list owned by NodeDeath::process. The existing safe
> > ProcessInner::death_delivered method does not enforce that relationship=
,
> > so safe Rust can violate the invariant relied on by a later unsafe list
> > removal.
> >
> > Move the insertion boundary to Process and validate both the supplied
> > guard and the NodeDeath owner before mutating the list. Keep the existi=
ng
> > lock order and duplicate-insertion behavior unchanged.
> >
> > Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1238
> > Assisted-by: Codex:5.6-Sol
> > Signed-off-by: Daniil Detkov <d4n11l@proton.me>
> > ---
> >  drivers/android/binder/node.rs    |  6 +++++-
> >  drivers/android/binder/process.rs | 23 +++++++++++++++--------
> >  2 files changed, 20 insertions(+), 9 deletions(-)
>=20
> Cool, how was this tested?
>=20
> thanks,
>=20
> greg k-h
>=20

Hi Greg,

It was built and checked against rust-fixes with:

  make LLVM=3D1 CLIPPY=3D1 O=3D... -j32 drivers/android/binder/
  make LLVM=3D1 O=3D... rustfmtcheck
  make LLVM=3D1 O=3D... -j32 bzImage

I booted the resulting x86_64 kernel with
CONFIG_ANDROID_BINDER_IPC_RUST=3Dy under QEMU/KVM, mounted the binder
filesystem, opened the binder device, and verified that BINDER_VERSION
returned protocol 8. The boot completed without a BUG, Oops, or panic.

This covered the valid Binder open/ioctl path. The issue report contains
an in-kernel PoC for the mismatched NodeDeath/Process insertion; I had
not run that PoC when submitting v1.

If it would be useful, I can also set up and run the in-kernel PoC from
the report against both the pre-fix and patched trees.

Thanks,
Daniil
