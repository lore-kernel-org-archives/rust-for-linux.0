Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BBF28313D;
	Fri,  9 Jan 2026 18:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767981783; cv=none; b=q02rE1WLcn4n1LN7mEQT7O3qaSDd/X+0GjccZKL+qZ8C8RyxECKoVyiYA2QVyDvaTj9k4NRz1B4pYLiXFiCHo0U4tCW6IHCJxtvguULwH7fgPHjDHNAVroa+Exnf4QMe5sfJUgLqf6/TgEgnJ2Q4rQ+OaBjI8ka6XIlaZRs08DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767981783; c=relaxed/simple;
	bh=r7+uys9qxbAX5b8ZmaXfPwKPr4MTkJbsTReSeB7LAIQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=dMOnV6f4Y6x/4EZhDfssl14RCtXlpbbuiZ8Uc9PsDfjFeX+FvAifZN2KVV/jbKxF3n0jSsIX+X6TIbVpftIxn+VXIhlWNTPQMybqZrVeT5dYwdUYJHBIWJO4qpMmms4qBW7gCg3Szz2WbZGZTYwcRr+AeIADePD257HA3nmuYyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJYP0MNq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJYP0MNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7567AC4CEF1;
	Fri,  9 Jan 2026 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767981783;
	bh=r7+uys9qxbAX5b8ZmaXfPwKPr4MTkJbsTReSeB7LAIQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=tJYP0MNqGL1tC7kT4ZZresVixgS9Ap9qAIQY6hxwZdOF7U+iCumDTd0w6fWrcJHyc
	 Yp2vhiARe9takGRT9i4TIUulIXoEX/C4xpqh7NTSVwkJiSYbQhWJxCfmXJThnjexQ3
	 BId9gB6h984c9V1xI1W7Yk8rCVMjORjnbbsNdIjMz5gf74rITTUbdC57nmSZaa0mG1
	 oxqb8x/Rw4bIShpw+dEmAhJ+Y5hzz2jPwkfHnED+W1oWoDwXTEvsnbUwdQPztpryXn
	 VbDeSqxAIqPMQnDr9D9p8TqF6ejJKadu9Mj0zL6SfVER66e3gpjlRQzE1/TveQ5K76
	 H0IKtq7KtQXYQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 19:02:59 +0100
Message-Id: <DFK98H2AC9OD.3TKEHOTK5CKE1@kernel.org>
Subject: Re: [PATCH 11/12] rust: pin-init: internal: init: add support for
 attributes on initializer fields
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-12-lossin@kernel.org>
 <DFK3Z9K6SMVA.1XCWR3Y3WK7OI@garyguo.net>
In-Reply-To: <DFK3Z9K6SMVA.1XCWR3Y3WK7OI@garyguo.net>

On Fri Jan 9, 2026 at 2:55 PM CET, Gary Guo wrote:
> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>> -        if let Some(ident) =3D field.ident() {
>> +        if let Some(ident) =3D kind.ident() {
>>              // `mixed_site` ensures that the guard is not accessible to=
 the user-controlled code.
>>              let guard =3D format_ident!("__{ident}_guard", span =3D Spa=
n::mixed_site());
>> -            guards.push(guard.clone());
>>              res.extend(quote! {
>> +                #(#attrs)*
>>                  // Create the drop guard:
>>                  //
>>                  // We rely on macro hygiene to make it impossible for u=
sers to access this local
>> @@ -316,13 +332,18 @@ fn init_fields(
>>                      )
>>                  };
>>              });
>> +            guards.push(guard);
>> +            guard_attrs.push(attrs);
>
> I think guard_attrs should just get the cfg ones, not including lint leve=
ls.
> Otherwise, `#[expect]` would be broken?

Oh yeah that is probably right. I do not yet have extensive attribute
tests due to lack of time.

Do you also think that only cfg ones should be included in the
`#(#attrs)*` in the `quote!` above?

Cheers,
Benno
