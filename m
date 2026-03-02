Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8783B8BC2;
	Mon,  2 Mar 2026 12:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456042; cv=none; b=Ba+mNxfwcsqaAQBTw/B5ejx+EjT94XPRJBaOtm962FHuIhuTAABhx1OXVQ66hIai5+0ulZkvS6WsRCurxQe0LQeZFYHYMcjxES8IxP3IU6+7H53Be0223d+gFoxBbCD2BxO8xLoDzI0s+F1NeMG2JL/TGpcVXGAFlKaqPZZG4yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456042; c=relaxed/simple;
	bh=PDpyM2ReDXAjjisAFT8NZ3D/awbu5zzfsouwdrb4+Fs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oO0a9CBAvG1/4fUEASvLCGJlki6QwDinoVjkGXMfUHOTCF5B1au7KyUzaI/Qt7ZOIQZNPCn2LcwdTiXdCAvNj2OPotfuZejEYkqjduV/iNFcmgv0fdlT4v5+EZ7S4aBMANXhiW1/D8XAb8h0bec0WDSqShrX5WslWLnOUw7t8NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=onkfqdhn; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="onkfqdhn"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fPdv45Cthz9sZv;
	Mon,  2 Mar 2026 13:45:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772455520; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDpyM2ReDXAjjisAFT8NZ3D/awbu5zzfsouwdrb4+Fs=;
	b=onkfqdhnv4raevbW/pg2TRc55Me/prLtMiKSCBgX3UI95uT52KcQeqwdTZ4KGznfm8Idse
	ONRneQd4UiPKbq0r7Yc1GNe67Sjze8UVi5ugC2n7eOQ0FYn57nVj6rI16J+J2AIUlQv+5w
	07ECf0pu1SsqT3IATd0B0RNNy0fy2GAQ/lXfEUPa1uHm7sJcaiDoo1x4exKh+ga/nK+ouL
	SkKcPJp9ZHZoBSh3T3exMPjDgQi3L6cy4MRFmt18uPoFtENletw6X1jHmPpSQuLey1eqWc
	OJrfuNabcM2e5uD93QVnfeZOJx/4vRM4MmNimzg/C/BUC3MZMq4Bcx5LCP5AnQ==
Message-ID: <9e18a6f83c0b7b89fe4b11b4228cf71accebcf39.camel@mailbox.org>
Subject: Re: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Lai
 Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Daniel
 Almeida <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,  rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, Benno Lossin
 <lossin@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Date: Mon, 02 Mar 2026 13:45:10 +0100
In-Reply-To: <aaQpRXR2hBde5LZy@google.com>
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
	 <20260227-create-workqueue-v3-2-87de133f7849@google.com>
	 <DGPUOSG5I4GM.1N5AWMP5ZFY4M@kernel.org> <aaHq9VpaVN4_hchW@google.com>
	 <DGPZMZKAQ2TC.RA0BF64C639M@kernel.org> <aaLmzp0mMPpE45yQ@google.com>
	 <DGQOAM62LGC8.2S5KJZBQU9OR8@kernel.org> <aaQpRXR2hBde5LZy@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: bdo59fzexxyjxj6rbtr3axky8tgcihob
X-MBO-RS-ID: b043eb62f6ea1da58f2

On Sun, 2026-03-01 at 11:55 +0000, Alice Ryhl wrote:
> On Sat, Feb 28, 2026 at 03:43:02PM +0100, Danilo Krummrich wrote:
> > On Sat Feb 28, 2026 at 1:59 PM CET, Alice Ryhl wrote:
> > > On Fri, Feb 27, 2026 at 08:23:44PM +0100, Danilo Krummrich wrote:
> > > > On Fri Feb 27, 2026 at 8:05 PM CET, Alice Ryhl wrote:
> > > > > On Fri, Feb 27, 2026 at 04:30:59PM +0100, Danilo Krummrich wrote:
> > > > > > On Fri Feb 27, 2026 at 3:53 PM CET, Alice Ryhl wrote:
> > > > > > > +=C2=A0=C2=A0=C2=A0 #[inline]
> > > > > > > +=C2=A0=C2=A0=C2=A0 pub fn max_active(mut self, max_active: u=
32) -> Builder {
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.max_active =
=3D i32::try_from(max_active).unwrap_or(i32::MAX);
> > > > > >=20
> > > > > > The workqueue code prints a warning for max_active >=C2=A0 WQ_M=
AX_ACTIVE. Maybe use
> > > > > > debug_assert()?
> > > > >=20
> > > > > What's wrong with just making use of the C-side warning?
> > > >=20
> > > > IIRC, we have the same pattern in other Rust code that we use debug=
_assert()
> > > > when a value got clamped, e.g. in udelay().
> > >=20
> > > In udelay(), the clamping happens on the Rust side, so it makes sense
> > > that Rust is the one to warn about it.
> > >=20
> > > Here, the clamping happens in C code. To warn about it, I'd have to
> > > duplicate the existing C-side check to clamp in Rust.
> >=20
> > That's fair, although I also think that it is not unreasonable. Given t=
hat this
> > uses the builder pattern, I think it would be nice to ensure that nothi=
ng
> > "invalid" can be built in the first place.
> >=20
> > Maybe we can use a bounded integer?
>=20
> Bounded integers allow zero, which is also illegal.
>=20
> I think it's a bit much honestly.


My two cents here would be too that it's more elegant to just leverage
the C side's warning.

P.
