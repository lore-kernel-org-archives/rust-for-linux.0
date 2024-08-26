Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B93A5B69E
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Aug 2024 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724687181; cv=none; b=SiECugc9dNY2GxJUbUoUh7nFAi5vRMcwGMoytZVf+/6K2Q+XEpCxCucmttGrjizXqHH+FaAVBRcJit1UkwUuaSb6YQxfAL0enTh8bN3pT0jL9qYMXOMUkaMZvZZo6pUpa6svUKBcnIde/xYNpG3tQ+06jvJAovwlm1xzTJ0SBOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724687181; c=relaxed/simple;
	bh=rijYHIP0Ao4lvCJLZaabkuQiGBKAVts2w69Ma/szZjQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AsKBSlI7XoZdgwKqxjBzyQTgtO+8ZjvolCzc7LDZQ53NuBWfZbdOFwIFQqMl3cFeoGfQI4JZvJPODrFUpCK/Eei2h4rlFoEf9HdjZigD+0keP18i3rlEBGBuwIu52K/LDiT2dJpDMY1BMzs45wYAXAXBr9R5Bkit/nPJIgBeInM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=X+7HGJhG; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="X+7HGJhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ewcidbvko5enbggt7fhozxovdy.protonmail; t=1724687177; x=1724946377;
	bh=1S2zdt5fhwBL6dRleG9sKZYBdZBYfRqGJChdpr7OXPg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=X+7HGJhGLPHX1+IPTRM1q+GrUynyMCtOkS7+gafxmPJtqPDa9ifCxgOW1Ga4oSGpy
	 leDnLCiFYCgudimQW6MX8lkDHV7KkhUDd8BVB2H06KpgzuQDpt5NHWjuSL89P7lFbw
	 Tvz8IRHhd6IyuNrzpSvX5Nsr92djm9JCIN2aNhD2qGT21FTDVUfw3zh1rZLTYeyhGa
	 /EGaTxdhJBqDFfkk4xKVbxKSD9FE0qpZTqXO0k7W0vurUl8+pEZg8aU9Zg+dzNB37+
	 uS71jDlgpeJDQm3EpNcqtIh1qdaiOts93d6X/iUYETMIilJLT5WupVHdeY37TbIZ2p
	 nW8F4KYQNYdMA==
Date: Mon, 26 Aug 2024 15:46:12 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: add global lock support
Message-ID: <91ce9f9a-5def-4f5a-ab9d-9bde4736cca0@proton.me>
In-Reply-To: <CAH5fLgjtSVMcKL4aMrNT=zJPGvzAPJt3qAUMYdB-+3=s80FNKQ@mail.gmail.com>
References: <20240826-static-mutex-v1-1-a14ee71561f3@google.com> <9feb41cc-cb1c-4d0d-a3df-09298e69af69@proton.me> <CAH5fLgjtSVMcKL4aMrNT=zJPGvzAPJt3qAUMYdB-+3=s80FNKQ@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 40ae1f2bb1268bc8d502447b32524023b018a751
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26.08.24 17:31, Alice Ryhl wrote:
> On Mon, Aug 26, 2024 at 5:30=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
>> On 26.08.24 17:27, Alice Ryhl wrote:
>>> +    /// Initialize a global lock.
>>> +    ///
>>> +    /// # Safety
>>> +    ///
>>> +    /// * This lock must have been created with [`unsafe_const_new`].
>>> +    /// * This lock must be pinned.
>>
>> You could also ask for `self: Pin<&Self>` and remove this constraint, or
>> is that not possible in your use-case?
>=20
> The value is going to be in a static, and it's inconvenient to have to
> use Pin::new_unchecked when calling this initializer. Not sure much
> value is gained.

Can't you use `Pin::static_ref` [1]?

[1]: https://doc.rust-lang.org/std/pin/struct.Pin.html#method.static_ref

---
Cheers,
Benno

