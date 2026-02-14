Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FC01AA7A6;
	Sat, 14 Feb 2026 14:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771081008; cv=none; b=lRxu2BiEGycVbT4dkWOpHCaPIb7TPjoIYqEfx0b/fZTGzm7Ru2uqJt9U0pEtD60qqSI4f7IoO0UidxqmnRtRVVm8H8NZ8Mqyjrjy0s4WZtG8kcxv8vv8lps9YbkvK4TH9RSS3PZ9oRbUakdmWbKGnviPYlxPldEhzu0mj9IXa9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771081008; c=relaxed/simple;
	bh=yyhrpWQxV+QCcejkqYcg4svwRB2CZp4Bur1FDdI+ZI4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=UU8y6/L8QyZDQUlO0umVgcVJ/G+sYUo73/wSniVjNvn8rUEb3CCLUYerwLXdXuWON6DeK5cXx8raH4jk+TEzu2rEl4BYuLP8txGrztZjet2dIzW5uO3Dph1YQrgmLWh9zUFIuZRrihqMv1E2nvToUtWAvO6iCE0tGtlTqEWoBxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMmkPdiV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMmkPdiV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5E5C16AAE;
	Sat, 14 Feb 2026 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771081007;
	bh=yyhrpWQxV+QCcejkqYcg4svwRB2CZp4Bur1FDdI+ZI4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=LMmkPdiVSYuHg1KxsQfKko2QXJg07n+MTjhEMIKZCGRIOFWXLLEy/gZcNWJzP97FI
	 +nrGYlUdLohfkModkb57hhE97lTJXLM3KXNSsVxNF9hV7NtT53/Fhz6rffCycep/7e
	 76o0FQ7L8wtsqjKI8XELHQtTd3OExrkmQBl51ix2nPoyFRY4m8229PzeYofIAf+q6M
	 g7fq5ZLMuNwvZDwfCwAeNHUN1UTa/pCmmQ/8xQ8mLZK2pwC7aCZQdcbs0rLxtCooiE
	 ULlL2G0QJWkUGKsWTEkwYa+dseenM6xprpYwBwZW5hcTVTD/PjlapSwnqa9Q9lKcru
	 NkSu3DJd+FOSA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 15:56:43 +0100
Message-Id: <DGERTGLMB5S2.3OE4VYDYHMJ3M@kernel.org>
Subject: Re: [PATCH] rust: alloc: allow different error types in
 `KBox::pin_slice`
Cc: "Andreas Hindborg" <a.hindborg@kernel.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>
 <DGEQZHTOW6FC.2SWNBWY9XE3LD@kernel.org>
 <DGERGXTEJ2B2.24F7OWLIZZAK7@kernel.org>
In-Reply-To: <DGERGXTEJ2B2.24F7OWLIZZAK7@kernel.org>

On Sat Feb 14, 2026 at 3:40 PM CET, Benno Lossin wrote:
> On Sat Feb 14, 2026 at 3:17 PM CET, Danilo Krummrich wrote:
>> On Sat Feb 14, 2026 at 2:28 PM CET, Andreas Hindborg wrote:
>>> @@ -333,24 +333,31 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<=
T, A>>, AllocError>
>>>      /// assert_eq!(s[3].d.lock().a, 20);
>>>      /// # Ok::<(), Error>(())
>>>      /// ```
>>> -    pub fn pin_slice<Func, Item, E>(
>>> +    pub fn pin_slice<Func, Item, E, E2>(
>>>          mut init: Func,
>>>          len: usize,
>>>          flags: Flags,
>>>      ) -> Result<Pin<Box<[T], A>>, E>
>>>      where
>>>          Func: FnMut(usize) -> Item,
>>> -        Item: PinInit<T, E>,
>>> -        E: From<AllocError>,
>>
>> I think we should keep this bound and just add:
>
> The `Into` trait bounds are the idiomatic ones for functions consuming
> things. See https://doc.rust-lang.org/std/convert/trait.Into.html:
>
>     Prefer using Into over From when specifying trait bounds on a
>     generic function to ensure that types that only implement Into can
>     be used as well.

Yeah, but isn't this only because of [1], which does not apply to the kerne=
l
because our minimum compiler version is 1.78 anyways?

I.e. are there any cases where we can't implement From in the kernel and ha=
ve to
fall back to Into?

[1] https://doc.rust-lang.org/std/convert/trait.Into.html#implementing-into=
-for-conversions-to-external-types-in-old-versions-of-rust
