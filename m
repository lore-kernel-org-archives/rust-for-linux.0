Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED51E9B1A;
	Mon, 23 Feb 2026 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771832053; cv=none; b=rkb1X5U8P3ZBbCmmJvp3bcn5JBnYymDOeax+BlbWy5DDKjgOuGH70nl6z1MSEXYyYigOicR4lmEUwGCi9/iHDbAd/ulHaBXGJpPIbTwpDemwS4gZTyRROt7h/aCdOakqie8EM748d9K81cPqIlCpdvF43+2TnTO7hgEFGYBkRj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771832053; c=relaxed/simple;
	bh=ar6of4eX2cRR7iEigNz5rEjhbejK77lrSA7pIK1OljY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YGtCW5Y1nJAJpxj+JWHuFhdIwDDJ7vPuartquIf1oKq5u7iXvSivKCatq0Wa2d5kHu2jUI55U25QXzpioOAGTayB3YLiiXagNwGmUrs0L6VzBzMEjzvepFUOS44UMLYhlH4kjNLVILuWg1l8d4kI4qtlxoX6fla3iSotRMvukvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jTqqm9pg; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jTqqm9pg"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fKCK51SdQz9tc2;
	Mon, 23 Feb 2026 08:34:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1771832041; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ar6of4eX2cRR7iEigNz5rEjhbejK77lrSA7pIK1OljY=;
	b=jTqqm9pgxkc/V4Q/DfR3IuayNyw3tOgZMCPolL3qd3xSD+B8UErZcSnCKfk43s3MOhvSEA
	V3Y7vUxwYg08F88jw/i8+iDHxiwylwJc9kbg7hmjceC+Zo5y+J+5rK7hEffXQwmRCz/GBC
	9VIDezRyt0GZ9hC3WQXJSdNH740k/wYUk7DY5FVvAqp0PFNOAYRNumpp+HRl/xi6uIP4aI
	YfE5Jigbv+GACJQn1M+kh/bcabXrEHLtEjLtLzohEVak72PtePNnOJEdZoDY1O4AGHg2oz
	/o6APWDLfFLn4N1FZll9bOWt1WC67k2q9vA0sY4k6Sb/7Iu7Y4RA3zpFgme7+A==
Message-ID: <fa1c81f58b05faccf69dce8645a337f7bd35a9f7.camel@mailbox.org>
Subject: Re: [PATCH v4] rust: list: Add unsafe for container_of
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Philipp Stanner
	 <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir
 Duberstein <tamird@gmail.com>,  Christian Schrefl
 <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Date: Mon, 23 Feb 2026 08:33:55 +0100
In-Reply-To: <CANiq72kgsgSW5tPj3xA0DLhJS8yBS_uDT=xDbNE=rf8t-H8Qzw@mail.gmail.com>
References: <20260216131613.45344-3-phasta@kernel.org>
	 <CANiq72kgsgSW5tPj3xA0DLhJS8yBS_uDT=xDbNE=rf8t-H8Qzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 2c81773f03c144bc136
X-MBO-RS-META: pnmrakk66619n6cy7hr8sh543prw4bsm

On Fri, 2026-02-20 at 02:08 +0100, Miguel Ojeda wrote:
> On Mon, Feb 16, 2026 at 2:17=E2=80=AFPM Philipp Stanner <phasta@kernel.or=
g> wrote:
> >=20
> > Add unsafe blocks to container_of to fix the issue.
>=20
> So I don't think this was tested with `CLIPPY=3D1`, because there are
> other safety comments missing even after this is applied.
>=20
> Please note that `CLIPPY=3D1` must remain clean for all Rust code:
>=20
> =C2=A0=C2=A0=C2=A0 https://rust-for-linux.com/contributing#submit-checkli=
st-addendum
>=20
> I have pushed to `rust-fixes` the patch with placeholders to show what
> is missing.
>=20
> I am not sure if I will keep it there.
>=20

Feel free to drop it for now, I can go through it properly with the
list author to see what the most accurate formulation would be.
