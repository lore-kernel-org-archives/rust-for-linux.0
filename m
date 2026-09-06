Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0306535DA7B
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 16:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788712453; cv=none; b=InV7ILoYYMRhR8snDa+Ju8AGEUv904uX5bcIQ6dm2+GljgTwgKJ7JDzHoAfS04pFKz9phpQnACeZHKao9fwowVVIjH3ncXEG+TxtmCFp/HQOOHZvm+ZSv9Q6QL70Z8eqRrmqEtSrlfG1CB2AidcSRLh39kZ6AGirghqUSU4yhiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788712453; c=relaxed/simple;
	bh=b3kVj84r4nbAqIyLD+aBN8xgn+ET8/wsd+DqzDcxpE8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p3qo3A//dcdhZBRdhHyR8X738W6f/lANnq7A7lvHcUO4S1+EnXfLvYZFSRaAbZfbibQtdaXZWQ5E+3HS/R+fRVtfaliMF3kE3JlNOHZ+5yPgjWC+7QD7iO11EZv0HsFimVG1liDf57DftQU1FtxR5TRnNadT9HW4TRFOdDaSGIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gTqufNAE; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gTqufNAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788712445; x=1788971645;
	bh=JpuIpXLNS7ucE3uXpibnP0q4UP1mLVYob2ykzuW4zhk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gTqufNAEOI6IJxet/0Loo9zYLXwWHYAdrOls/QQPvNbMSxlMuwqWBtvtN5lHWqCVy
	 mfFDpTZDEO3uG32iN22LqB66pw1mOKiuu4IDAA6fav+Bgr7jMfL6HsW2UaL912R5kO
	 GkN0Eubr6Symj5CcYVNfD59EAh7xmt2ityDMGIInpMoU2nSu+ItWPUrsP14IOrLEeg
	 UwmVRN3bohqVuhPTJq4RfybQvC6sgiTSJr4wGHgBfEmS/lbKqTABuedpQuyXoK0NGu
	 yUnu2kgWfePpRB1xBAlFFzXzAr1cXl00Vu8Nri3p2d9Y9tsMuW2666dBx4ZKzpfZEv
	 6ZjlRPWjv3s6Q==
Date: Sun, 06 Sep 2026 16:34:00 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rust: dma.rs: Migrate to zerocopy's `Frombytes/IntoBytes`
Message-ID: <B1wdLMFZFXemfTYFSUvCGZXyNX5xgC5W6XRxxOFDr6bo-8MP6ObUobdRLgaYpkgGw-aWm-Dv8D9kfxeTheyiTWR1itrfyHoT_QmcEjXShK0=@proton.me>
In-Reply-To: <DL8CO3P0U67U.10GU95WWXFSCN@kernel.org>
References: <20260906102826.202874-1-sagartaunk@proton.me> <20260906102826.202874-4-sagartaunk@proton.me> <DL88TLWYE8H8.1FP5GCIYUL1BN@garyguo.net> <DL8CO3P0U67U.10GU95WWXFSCN@kernel.org>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: ba3f9e3fb54b0085aafc592b018ecb1689e6e62d
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I apologise, I only tested `rust/` for users and missed the drivers. I have=
n't checked the `tyr` driver but it does break `nova-core` and I don't real=
ly know how to migrate it.

The `netlink.rs` patch does compile though should I resend only that or lea=
ve it?
If so, would it be a `v3` or should I send it as a new thread=20


On Sunday, September 6th, 2026 at 9:18 PM, Danilo Krummrich <dakr@kernel.or=
g> wrote:

> On Sun Sep 6, 2026 at 2:47 PM CEST, Gary Guo wrote:
> > I am surprised that just changing this is sufficient. Are all users of
> > `CoherentBox` already have the both zerocopy and kernel traits implemen=
ted?
>=20
> No, and I think the uaccess patch won't compile either. It breaks
>=20
> =09impl<T: KnownSize + AsBytes + ?Sized> debugfs::BinaryWriter for Cohere=
nt<'_, T>
>=20
> from the DMA code and I think it also breaks binder and tyr.
> 
