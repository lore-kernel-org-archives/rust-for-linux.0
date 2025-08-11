Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AB82DE6E6
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902323; cv=none; b=dbIIzeWeawjhG/4Q4nG1PhJTxNFj3eHFysPsIVk023SQCi6UGYUYPK4reYD45cEXtp4Crx7F5//nwGeHpzy6CIvYbo1Q9YVdwXNaawd3xZ+J+beT2N3O5GLm8gQT1JQn9FXkG+AzRMi+wiFQ77tK6/a7AbgMZ13n1HlqcPg3tUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902323; c=relaxed/simple;
	bh=oR+cLaLZEfASl4KzRZ0QYEKnOtgXvD2+d/xX1nhUAeQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N3Dhbtk+2HPm+Ip46W44KEEaiP1Y84aNZtPyDnHVih7mT852YlpjfEFOJGZUA1B9U98E9lkQvfBIZoL9j71FfyR4LTon01wshNhZNaqz0cIZ7/eiH5Wfvxw09f3xXhXyLIom9LyEYFov7w8BgPX3fm/S9WraNE4ZTNlYUEAI6Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev; spf=pass smtp.mailfrom=weathered-steel.dev; dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b=QhC5DiAt; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="QhC5DiAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=protonmail3; t=1754902313; x=1755161513;
	bh=oR+cLaLZEfASl4KzRZ0QYEKnOtgXvD2+d/xX1nhUAeQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QhC5DiAtETNp3hsQSKWaQVadsBiPO615K/SjqiF0VUBlYm3zwpCHDioUXa1IhpOFp
	 xZjKrXI60GhGE+vifPWDfRvQN/gqgNs2JhFA9OtVij5X6BGZso6w+tmephaoYZle4u
	 QoKxhEnfTEQVGQSAmSdfKAgVXXJyBQj22nipygrru6gNV1ZUb4EVy77N5PD4ztOskz
	 XTChZJ4mI/bA5SpP/8nCPem1g30oGWxDv43jVCX93/Bd9h1jc8u7M6AMj6o9Fl8lGZ
	 Vd+GOB3vYwRIPvGeccqolM0ok7b48wp7WmcQmMdg2a2/KsiMd/Nh8CORrb3CgbOxdU
	 wddF7YdWwEsLA==
Date: Mon, 11 Aug 2025 08:51:48 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Elle <elle@weathered-steel.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH linux] of: resolves TODO for copy_from_slice
Message-ID: <BQ1zitrkA-R0VKTOh7flS5oVZcEp4APN_GMEn0ZIxW7NaJ3HKwEl-o5Nw_xbvu40PUjQzCmzySKUKnPST0mD15jCPlziFqmORQqHqBSSnJo=@weathered-steel.dev>
In-Reply-To: <CAH5fLggrXbaOu8D2eFL+UtrNSqbm8H9sfgjDJzVJXMEgjBkffw@mail.gmail.com>
References: <175489428990.9320.6825335165759789458-0@git.sr.ht> <CAH5fLggrXbaOu8D2eFL+UtrNSqbm8H9sfgjDJzVJXMEgjBkffw@mail.gmail.com>
Feedback-ID: 142044023:user:proton
X-Pm-Message-ID: 177418ed7b1ef960d0b084464ab0997a1afcda10
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I tried to find the MSRV before sending the patch, sorry for the noise.

Since this is a pretty low-priority patch, guess it can just hang out until=
 the MSRV bump to 1.87.x?




On Monday, August 11th, 2025 at 8:02 AM, Alice Ryhl <aliceryhl@google.com> =
wrote:

>=20
>=20
> On Mon, Aug 11, 2025 at 8:38=E2=80=AFAM ~xllx _xllx_@git.sr.ht wrote:
>=20
> > From: elle elle@weathered-steel.dev
> >=20
> > Replaces the copy loop with `copy_from_slice` which became `const` in
> > stable Rust with version `1.87.0`.
> >=20
> > Authored-by: elle elle@weathered-steel.dev
> > Signed-off-by: elle elle@weathered-steel.dev
>=20
>=20
> We still support rustc 1.78 and forward.
>=20
> Alice
