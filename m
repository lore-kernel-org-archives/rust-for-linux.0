Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D347330FC3C;
	Fri,  2 Jan 2026 20:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767384313; cv=none; b=iRBYQty8WlF1dp+y3opjDl7c2uCzkVRh/nB9ojQSXmlmsC9+5eEu46unD/ynwRBdOugnVxRoHdjVqum5YxT2mmyH7PO+Sx0uHD8lpE4ipQav6jM1nd+tDoltqL7Eo8r3pPtahGVpxq089lWIseUi5DU9Htvoj76iO/fHjj24M8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767384313; c=relaxed/simple;
	bh=9H+nDyj3Ryc6j7slQ/ZaapNCcutVRASv47ZdRWQRyaY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=FHKb3uGqvF6EybaqlXzh3wugex75nGrUjYPb7cK76Qu6Uu9A3+08e7MDCNAqdDdw8qCW2fzxoKcFfOnXw09BaaWl832D2P9kipknMQd5JBORJj39VcJUSNGtUeq5fsO7spSXrV5xq24HJpL01i8Y9vbOguItSpu4zTs01EfOVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0i2AP4K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0i2AP4K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B6BC116B1;
	Fri,  2 Jan 2026 20:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767384313;
	bh=9H+nDyj3Ryc6j7slQ/ZaapNCcutVRASv47ZdRWQRyaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0i2AP4KJb3c1ABkmcuhDHjbz8ewNLwrCLUxB1j9Ik/5l8yRE32YPLRQTBqHzWoSm
	 OZ12+I2x4BpfECDTwme6uOf0a/MLLYtbj+SnBMOW2wIn9PUT4NJrM73TqkxeFUjkAS
	 tGA93BoRjYL1NrJCSwP8QdSe/5LNy9dU6uVwq/5mx1eX8K8GIYVIl2ctrp7+hlkvyY
	 TFKUV93IAcUdzCIvC9/NauDGzn4gQQ98F9kz9C5v8fDOInDTYXMAsHExlqRFe1R0gE
	 tGKYVET/00euCAz7jhdrlTPyPrJ9lYODSL5Mh6lNbt38onQxaHARF0O+ebvtirVgkq
	 vs0j4rweoEU5Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Jan 2026 21:05:09 +0100
Message-Id: <DFEDG6TK5AY9.1Y9EPEYQLMCMX@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] scripts: generate_rust_analyzer: match
 rust/Makefile
X-Mailer: aerc 0.21.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
 <CAJ-ks9nJ149Dt2v5Dn0A3+Qw=TnzE84Lm3Ridrfrc=mdhFt-MA@mail.gmail.com>
In-Reply-To: <CAJ-ks9nJ149Dt2v5Dn0A3+Qw=TnzE84Lm3Ridrfrc=mdhFt-MA@mail.gmail.com>

On Fri Jan 2, 2026 at 4:25 PM CET, Tamir Duberstein wrote:
> @Benno would you mind having a look at this series?

Oh wow this is an old series! Sorry for missing it.

I'm not maintaining the build system for pin-init, but from my side the
changes look okay. The commit messages are missing some context though:
why do we need these dependency edges? etc. If you fix that you can add

Acked-by: Benno Lossin <lossin@kernel.org>

Also note that this might be different in the new build system.

Cheers,
Benno

> On Wed, Jul 23, 2025 at 11:39=E2=80=AFAM Tamir Duberstein <tamird@kernel.=
org> wrote:
>>
>> Minor fixes in this series. The main one is fixing navigation in
>> pin_init_internal.
>>
>> This is my first series using tamird@kernel.org; please excude any
>> hiccups.
>>
>> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
>> ---
>> Tamir Duberstein (3):
>>       scripts: generate_rust_analyzer: Add compiler_builtins -> core dep
>>       scripts: generate_rust_analyzer: Add pin_init -> compiler_builtins=
 dep
>>       scripts: generate_rust_analyzer: Add pin_init_internal deps
>>
>>  scripts/generate_rust_analyzer.py | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> ---
>> base-commit: dff64b072708ffef23c117fa1ee1ea59eb417807
>> change-id: 20250723-rust-analyzer-pin-init-925467269001
>>
>> Best regards,
>> --
>> Tamir Duberstein <tamird@kernel.org>
>>
