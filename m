Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7977473
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Oct 2023 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KSZ6HIkk"
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88D8F7
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Oct 2023 00:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=n6gvyn43rfhurm23bk4ehn3pdq.protonmail; t=1698044498; x=1698303698;
	bh=aDzL3P4c++HPB9/QZEWqLcqCnvnrKJCxXeKLtziOMrY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KSZ6HIkkAiRAmNQA9mLy63yB4G/B/C5qV9I0ZFlJrOaHw+nMFBcqzZAzm2ux752Wa
	 OLnSwIgQk6I6ZZWHvsdhm5KnP9gq9xHWLfyCuXqWUk7Rc/4VIt5i7jzjwKU54Ib2Lw
	 yjNE+X00e7pKIbDEK4xFeMbrOOfNjgHRHLwNR4NYQdRSEtfLGGQxgX55CC1I4NePFn
	 LzZlFX13Cvwy7HA/hUa64rp7Bcx676XwLqRBOpam3vRBpxi/EzOxjrLyKtnkFairme
	 ixG4md6SpLG73FMRVQNc9w5v5e76RDrFp8d3npeDNHjn9D85vCo5usJDWpT7mg8lBk
	 Z7I4SbTJQr9oA==
Date: Mon, 23 Oct 2023 07:01:28 +0000
To: Alice Ryhl <alice@ryhl.io>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>
Subject: Re: [PATCH v2] rust: macros: improve `#[vtable]` documentation
Message-ID: <06d27457-6b6c-4392-9be1-d1fecfbfd9f3@proton.me>
In-Reply-To: <1cc11492-248e-4b37-9608-b475acde3da2@ryhl.io>
References: <20231019171540.259173-1-benno.lossin@proton.me> <1cc11492-248e-4b37-9608-b475acde3da2@ryhl.io>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 21.10.23 14:45, Alice Ryhl wrote:
> On 10/19/23 19:15, Benno Lossin wrote:
>> Traits marked with `#[vtable]` need to provide default implementations
>> for optional functions. The C side represents these with `NULL` in the
>> vtable, so the default functions are never actually called. We do not
>> want to replicate the default behavior from C in Rust, because that is
>> not maintainable. Therefore we should use `build_error` in those default
>> implementations. The error message for that is provided at
>> `kernel::error::VTABLE_DEFAULT_ERROR`.
>>
>> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>=20
> There is a minor nit below, and in reviews sent by others, but overall
> this looks fine to me.
>=20
>>    /// # Examples
>>    ///
>>    /// ```ignore
>> +/// # use kernel::error::VTABLE_DEFAULT_ERROR;
>>    /// use kernel::prelude::*;
> I probably wouldn't hide the import of VTABLE_DEFAULT_ERROR from this
> example.

What do you guys think of putting the const it in the prelude?

--=20
Cheers,
Benno


