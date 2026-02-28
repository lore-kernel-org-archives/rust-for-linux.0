Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4503B44BCA8;
	Sat, 28 Feb 2026 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772290613; cv=none; b=GV6RjzEdTnLtj9Rmw4gy5bW8AN+mxx+aD7kQXPwtdoDvuQJq8CqqDga997sJiVT2gH5MfmTd+Lwej2WeQGe2jABFseQGSvcD3WK0LsUcpwqOJ0jHeZa3AaIZ7RhGNDaMtYrJqRGfKFkLpuSqJZii6tQAXBFH8U8OJGJM9R1zuyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772290613; c=relaxed/simple;
	bh=nMtdbiP2HKP61yIcu+YQQSlHUdnuPLxRDCcLbKBEocw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Azcm+hDe4l8KYOHkYEiHx7hJckELquuy2vGUt9ZnSXqEUwaSWCDNyJS2Mst3vwbqynQbU2BULXT7fYa/cMytcCu4pMobLrAHRJmDADY7AN/3aMBiGibjYdmG36f9Moa5x8xjW34l1hlRyaA/cfdgRi3N6Yr1W6xuqj7zvuh5TnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENqNfFuc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENqNfFuc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78D9C116D0;
	Sat, 28 Feb 2026 14:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772290613;
	bh=nMtdbiP2HKP61yIcu+YQQSlHUdnuPLxRDCcLbKBEocw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ENqNfFucdSRlXBi8VQrOSjLwOMmC7gJthDBRno9AD+CT5PFxK1yOB1ETahaMorq1E
	 9V2TRDK7MDTH2nPA0YC8koRLjeXZnEve6tKByPizQJgMERRIsFuP095Tid6YmwfCFK
	 tLtKUkuiY+fXkOyTSHPHrk7TN3BWYBssGRR3M/6/D8Gq/PY2A6+juq65yrHHh8kqnN
	 F14GlXlvQG40sEC7aTW04STgCFTdmpc1YFJLPMKrOhLMA/vrFJIof3frxKL4cesr0S
	 WXiwXoKsuaIbDsfvaJ7XMTIt1q4qazYOb09q23+/rw2gqM/4A5GGNRKAaeSsJcYd/U
	 0dEOq+LcOf3OA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 15:56:48 +0100
Message-Id: <DGQOL5TWOD70.4WHKMEIP1FEN@kernel.org>
Subject: Re: [PATCH 2/2] rust: pin-init: internal: init: document
 load-bearing fact of field accessors
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Wedson Almeida Filho"
 <wedsonaf@gmail.com>
Cc: <stable@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260228113713.1402110-1-lossin@kernel.org>
 <20260228113713.1402110-2-lossin@kernel.org>
 <DGQKQM3UOCTG.25ULNY22EYXJI@garyguo.net>
In-Reply-To: <DGQKQM3UOCTG.25ULNY22EYXJI@garyguo.net>

On Sat Feb 28, 2026 at 12:55 PM CET, Gary Guo wrote:
> On Sat Feb 28, 2026 at 11:37 AM GMT, Benno Lossin wrote:
>> diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal=
/src/init.rs
>> index da53adc44ecf..533029d53d30 100644
>> --- a/rust/pin-init/internal/src/init.rs
>> +++ b/rust/pin-init/internal/src/init.rs
>> @@ -251,6 +251,11 @@ fn init_fields(
>>                  });
>>                  // Again span for better diagnostics
>>                  let write =3D quote_spanned!(ident.span()=3D> ::core::p=
tr::write);
>> +                // NOTE: the field accessor ensures that the initialize=
d struct is not
>> +                // `repr(packed)`. If it were, the compiler would emit =
E0793. We do not support
>> +                // packed structs, since `Init::__init` requires an ali=
gned pointer; the same
>> +                // requirement that the call to `ptr::write` below has.
>> +                // For more info see <https://github.com/Rust-for-Linux=
/pin-init/issues/112>
>
> The emphasis should be unaligned fields instead of `repr(packed)`. Of cou=
rse,
> unaligned fields can only occur with `repr(packed)`, but packed structs c=
an
> contain well-aligned fields, too (e.g. 1-byte aligned members, or
> `repr(packed(2))` with 2-byte aligned members, etc...). Rust permits crea=
tion of
> references to these fields.

Yeah that's a more accurate account of things.

> Something like:
>
>     NOTE: the field accessor ensures that the initialized field is proper=
ly
>     aligned. Unaligned fields will cause the compiler to emit E0793. We d=
o not
>     support unaligned fields since `Init::__init` requires an aligned poi=
nter;
>     the `ptr::write` below has the same requirement.

That's a much better suggestion, I'll send an updated series later
today.

> Also, it is not immediately clear to me which one, buyt one of the two oc=
curance
> should be `PinInit::__pin_init`?

No, `PinInit::__pin_init` is never called from the macro, since that
only makes sense for structurally pinned fields. That info isn't
available at the callsite of `init!`. We emit it in `#[pin_data]` which
exposes it to `init!` via the `PinData`. That ZST has a method with the
same name as the field and it takes the respective initializer (so `impl
Init` or `impl PinInit`) and just runs said initializer.

This happens in the second hunk in the case where `pinned =3D=3D true`.

Cheers,
Benno
