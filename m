Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7DE1E2606;
	Tue,  9 Dec 2025 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765282459; cv=none; b=fq5FWfpM8af8Pjyfxr9KQc+K994q2Y+K+DhBMb19rrgX+dhw24Ld2gB3awuGsfGyh3YZ/sU/rg/vFRk5QABpczI9aGTVR6NYwv031qBf3j78FQpZhBiWFUBIvuJo1fLpcjdt0nc+RDkkGz0Odpjx2voGXTGwGGkJghUrs3oT2Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765282459; c=relaxed/simple;
	bh=ny3JXDwchpGu0mFuCTUina2wd15qApZduvqMFqFiP3g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ppW9jhaI7kgNB13LGYnBYVCSChM1Fx/aecO9LLCb7oZUA6Tl4Vzb0o2jIl9+gEIWODz6UB8otbaLAlsiXESbjwruxFGbaU1xvTHy3MdaHa+f6O3+1C6w+YOoQ3KC5FS5gvJdE4xX+++lvSXAeqN8dFl5ThbAD9r5vOb7rb1b5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s62AJZuc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s62AJZuc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37159C4CEF5;
	Tue,  9 Dec 2025 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765282458;
	bh=ny3JXDwchpGu0mFuCTUina2wd15qApZduvqMFqFiP3g=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=s62AJZucUzA7Dj8nFMKDyTmjnDiiqJYVX6rEfCFPvwoBQm7Augno96xDkA/iQrT8d
	 uNRxzp9QQFlikDXr3ARBZK2cjxTborxmjJ1ZkCwtcO96J8xpTR36Qa66pA1kiQDA+X
	 fyYPc8pktIxw/HNot7Yi1Mna+llvlzu1aVg2clWxtZ6UuL9SAnhl7PXlgClsZpL9rt
	 Ii7MlYui+NZ/YRqVq5qwB1g/oYWazkYxsEi/6WN3rRs6MVVB1GU6FJ612Oddoq/w2C
	 lTkWMU4L1qkVHHhellLnORmtE38E5uPaXFTfgghD934DRn+eduIO06oonzkSlgReba
	 FpE42l5l5H0Ag==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Dec 2025 13:14:08 +0100
Message-Id: <DETOEHE7WBR8.2440Z49KZTAY@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251209-transmute_unit-v3-0-819fe584ba06@nvidia.com>
 <20251209-transmute_unit-v3-1-819fe584ba06@nvidia.com>
In-Reply-To: <20251209-transmute_unit-v3-1-819fe584ba06@nvidia.com>

On Tue Dec 9, 2025 at 3:57 AM CET, Alexandre Courbot wrote:
> This is useful when using types that may or may not be empty in generic
> code relying on these traits. It is also safe because technically a
> no-op.
>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/transmute.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index be5dbf3829e2..a888a312e7ff 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -170,6 +170,10 @@ macro_rules! impl_frombytes {
>  }
> =20
>  impl_frombytes! {
> +    // SAFETY: Inhabited ZSTs only have one possible bit pattern.

Even inhabited ZSTs cannot just be conjured out of thin air, since there
might be safety invariants on the creation of such a type. Now these
two concrete ones do not have any, so this is fine, but should still be
mentioned in the comment IMO.

Cheers,
Benno

> +    (),
> +    {<T>} core::marker::PhantomData<T>,
> +
>      // SAFETY: All bit patterns are acceptable values of the types below=
.
>      u8, u16, u32, u64, usize,
>      i8, i16, i32, i64, isize,
