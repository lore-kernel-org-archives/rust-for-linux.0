Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00D02DC33D;
	Mon, 11 Aug 2025 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902385; cv=none; b=RCxPR7ZOoNxUCIR6mn8e7OcLLYAxzhxUEQRL3EOOqg8QTBSoatmLEaxF/ZbFg586+5J9KCP6nipNP4mHyITfG0V+MacnD4g0wf+xepSYBYxrfJU8oqbM/u9Cfku+Ug7WtjD8J/4Udd1GZOtgchGkmDZQGkof1e1DQZDmE6NgJPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902385; c=relaxed/simple;
	bh=3kVG8f1i4qecmQj6uNOyJ7SaJDArHCkOImFbadhHBMI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ne63ID3CHIVYPnJ1j0Pmtpi0up5LOsyrEZ4QKN+3G4INrQCaMZeJOkNTUoq3+Q66Qcj9UPdM0cNgCz0NnCsKXP9RimbWQB3kUmvc+dp99ynoNeWNUo3cN4f2vIOKFfjLJPIkbjqwU/FHhDQ5TIcCKDKUnDfKm47m1NXgl5Kjb+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev; spf=pass smtp.mailfrom=weathered-steel.dev; dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b=JNZpYm1q; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="JNZpYm1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=protonmail3; t=1754902381; x=1755161581;
	bh=3kVG8f1i4qecmQj6uNOyJ7SaJDArHCkOImFbadhHBMI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JNZpYm1qLGTHcCAgjPRYJ8zLHWB/Un9Tmt8AkSh4egmJMDyEz4y1+CkcmxotBTW9L
	 PjpI7U2Oe/oAyVcnB4IF9ALeblF0WDrJxClYHHd4VBhjhd2bl/FSFQbrs2J6xbBcL6
	 b9cJhIpIgzafDGRuQNhfZvfcyrbizvUlkSbcP5WdojdoAdAM+Cvq2V516O9oj+5vr+
	 V3OrUbJN3uDuVtWo7VJ3gBdKrfvrqMAhUw4dm0RDgTQBEwB+z4K1fW4bgtIiGZq9Mc
	 yKfBsW++OuNILexe+vOCsGgGauDKkzOG0+DP7XWGIAlzRlr7yXa+Qiyqd9Djg1qQ1V
	 ulXd6VuBeUvpA==
Date: Mon, 11 Aug 2025 08:52:58 +0000
To: Greg KH <gregkh@linuxfoundation.org>
From: Elle <elle@weathered-steel.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH linux] of: resolves TODO for copy_from_slice
Message-ID: <IKH52NNvIWBXMZyS8DlrrVWBS9sO_jRfBhpRKB6WBq6abqhuvmyfzeXuJA2cBKvSQwYtWgYP1uY6F4cYejd-2sxlM0dtoyPyLgLxGYUfsLg=@weathered-steel.dev>
In-Reply-To: <2025081151-brunt-grief-fd48@gregkh>
References: <175489428990.9320.6825335165759789458-0@git.sr.ht> <2025081151-brunt-grief-fd48@gregkh>
Feedback-ID: 142044023:user:proton
X-Pm-Message-ID: 4ee53292d71981b44d4ab5388ac19e228687bf3e
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I'll clean this up in future patches, thanks for letting me know.




On Monday, August 11th, 2025 at 7:13 AM, Greg KH <gregkh@linuxfoundation.or=
g> wrote:

>=20
>=20
> On Sun, Aug 10, 2025 at 11:23:55PM +0000, ~xllx wrote:
>=20
> > From: elle elle@weathered-steel.dev
> >=20
> > Replaces the copy loop with `copy_from_slice` which became `const` in
> > stable Rust with version `1.87.0`.
> >=20
> > Authored-by: elle elle@weathered-steel.dev
>=20
>=20
> This isn't a normal kernel tag, the "From:" line guarantes this, please
> no need to repeat it again.
>=20
> Also, we need a full name please, as per our documentation.
>=20
> thanks,
>=20
> greg k-h
