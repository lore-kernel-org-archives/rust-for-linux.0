Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EE5238D5A;
	Mon, 17 Nov 2025 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763361407; cv=none; b=YWyFJzYP0hC99mN1Xbxa+sFcjaU5hKIvW6Y0sLAC2O5SxNtQPFy4l8VucnptjwYnfaPWDfiW5QEfiUFpt8Gr9b+lshRdkf2+Liu29Ig2BVC7L7RpcWGJwvJAVBF+B9hdSECSj9Yo3w29icjF6mcIJaaYDmSDFE/cP81cv+RFYo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763361407; c=relaxed/simple;
	bh=0VYM9ziG5jbHXQ6eyDUCfHfxVBe+pv++/HYHCwsOqoE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WVSuvoZ+BmJTbg91cmRp5YbGWIVMq5Os5cYscAiBFfsx+Z0Tn3JDvCTCVLCSN7HNhP2DJRy1OkWCP+0U+K1TKW2WqQFnWKQndtaziaw4qb2U6+FJUDRGQKgg3win+wHrI3qrSf62AauCZiQJRDlNLHftUEbkKd8lXpS7EPp//gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vcriVSju; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vcriVSju"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d8yh9388Fz9tLh;
	Mon, 17 Nov 2025 07:36:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1763361401; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0VYM9ziG5jbHXQ6eyDUCfHfxVBe+pv++/HYHCwsOqoE=;
	b=vcriVSjuKDS26K1DYRfzGdBNLPWXipOlbxE4pP1hZIyA1Tb/osvA5BCBrojQ9p6YeeQp66
	rREGCLXAikcO/g6IeuAvo4X9cb/kS1F/hIp77sviDny/UzUsTeeYhDSBAzGreD5ChsuMMc
	I+QtN/v4LX19JKaMusECRfY+Dsn7ONHplYj28/m7Dxxm+zxmOqwuhagKBVJ98osD694KTc
	jof4Lo077Vrz6T39wJXejRskTDgiAYc0P1A4mzszMnna7qkUQAsZvNQRp0e6ctY/kNwCcY
	jtkE4CbdJWSNCC3Ii7mV6EVndgpTuTKlD3dmsAMdLIJe+Lz75thAt/dkitx2hw==
Message-ID: <7146fee26e0d24d0998e9a9199d9ef3ba842e0a8.camel@mailbox.org>
Subject: Re: [PATCH] rust: lib: Add necessary unsafes for container_of
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Philipp Stanner
	 <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Viresh
 Kumar <viresh.kumar@linaro.org>, Tamir Duberstein <tamird@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 17 Nov 2025 07:36:36 +0100
In-Reply-To: <CANiq72m_wGhXqu9es=zOcDbK4UqAiSbn5bBLhjDewXV3=4ckmA@mail.gmail.com>
References: <20251114140020.327075-2-phasta@kernel.org>
	 <CANiq72m_wGhXqu9es=zOcDbK4UqAiSbn5bBLhjDewXV3=4ckmA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: gakijy5t5kusu48hzgw7m4nw6tqjkaq5
X-MBO-RS-ID: b88c13565395222a015

On Fri, 2025-11-14 at 21:21 +0100, Miguel Ojeda wrote:
> On Fri, Nov 14, 2025 at 3:00=E2=80=AFPM Philipp Stanner <phasta@kernel.or=
g> wrote:
> >=20
> > Add unsafe blocks to container_of to fix the issue.
>=20
> The root issue is that we missed unsafe blocks on the list macros
> because imported declarative macros from another crate do not respect
> `unsafe_op_in_unsafe_fn` (or Edition 2024):
>=20
> =C2=A0=C2=A0=C2=A0 https://github.com/rust-lang/rust/issues/112504
>=20
> I have added it to our list at:
>=20
> =C2=A0=C2=A0=C2=A0 https://github.com/Rust-for-Linux/linux/issues/355
>=20
> And tagged it with the Rust for Linux label there.

So shall we in the mean time merge a fix as suggested by Alice, IOW a
version 2 of this patch here?

P.

