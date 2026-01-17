Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7145328A3F2
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 21:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768685763; cv=none; b=RRSSP5euYIic7uJdnqgLFidRulzk1LeQ8fPBWv9LsOh+y+6RN7sRovw8XIKno5cIf+orJ0KMu7rYzCapaWSyXCfyDNYhHkR8vuy69E2F8P9I2MXmrsNeyFLd0YAc9Dh/2tBUtajAJGPmLbHQjugZDLxT6ePQ1iCCTWWn9pnbab0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768685763; c=relaxed/simple;
	bh=H0I0q9BLGW25tNeWsLq3ULFRIxBx3XEGEQrTR1cuWZs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=WRlSOeHHXfNDORBeJh697S4Q9liRgJ2FS4znfxWOHGhUtfJDU0PZs9h8ATm0Mv0/AQ+YeQxjKNo/cRYqeUkJ829fb7DazRUStq+pYuV+q4c8LP2xpTuZP7WZKgPBM4LcsJxrQM4a0L3cgUG0J6hqBOI37YZviUO/hauiTGf+S7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uEP4OsZ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uEP4OsZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21940C4CEF7;
	Sat, 17 Jan 2026 21:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768685762;
	bh=H0I0q9BLGW25tNeWsLq3ULFRIxBx3XEGEQrTR1cuWZs=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=uEP4OsZ+JCm2i4Vkh9FRrqcAvjKO07nTNQRc8Oh9eM7qUMdx6YcCdkdSsF2y9T2aa
	 fT/La48ikDpHr2MYU3Soqae8umqYvpQZwAS86H5lSsAakmz0wgED0Y5xXscieIZH8D
	 wv/+FrnvElnozbI2OieU9pjFMJ7h8W1tbBWPOWIsGfKq2YHOjYFN4Z11qEu5e0ur48
	 aTS3yH21czDsJ1m0iIv0AzQZ7Ud/o5jsBs/y6cC6gHUf6vFrlbQsXzRWHGfZMLg/U5
	 1bW7QV/s/IG+ZJ3n/Bmb/gfyQuEQQWplArcWSnoDlXHq621iGS2Eg2KOABYnKypFOu
	 9svvDz20ccCaA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 22:35:59 +0100
Message-Id: <DFR6RWROWBYA.1Q9JKH8UDSXOX@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module
 init
Cc: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "mmaurer@google.com"
 <mmaurer@google.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-8-ttabi@nvidia.com>
 <DFQV57XCLMB6.1A0IW206EXE3H@kernel.org>
 <656bfffe43ab220b387fb56bb6eeb829ff0bd1ef.camel@nvidia.com>
In-Reply-To: <656bfffe43ab220b387fb56bb6eeb829ff0bd1ef.camel@nvidia.com>

On Sat Jan 17, 2026 at 9:58 PM CET, Timur Tabi wrote:
> On Sat, 2026-01-17 at 13:29 +0100, Danilo Krummrich wrote:
>> On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
>> > =C2=A0 impl InPlaceModule for NovaCoreModule {
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn init(module: &'static kernel::ThisMo=
dule) -> impl PinInit<Self, Error> {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let dir =3D Dir::new(kerne=
l::c_str!("nova_core"));
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: we are the only=
 driver code running, so there cannot be any concurrent
>> > access to
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // `DEBUGFS_ROOT`.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { DEBUGFS_ROOT =3D =
Some(dir) };
>>=20
>> I think you forgot to add a new Kconfig to nova-core to enable this and =
in case
>> not set leave it as None.
>
> You don't want the debugfs entries created by default?  That's how it is =
in Nouveau.

I think it's OK to always have the entries on keeping them beyond device un=
bind
has to be behind a Kconfig option.

I thought you want this behind a Kconfig in general, otherwise what is
debugfs::Dir::empty() for?
