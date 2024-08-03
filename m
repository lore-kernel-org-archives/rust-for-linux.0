Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144A3E54C
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Aug 2024 14:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722695029; cv=none; b=RKc0JgotBsBp5PAwdx3fS2c5Wp7CMOA5uyNl0BBea5tdJH9WhMfzkM5RAWKeMbMPztIXRnl4Z4CKuZoig7Pkfpv8RdCO97N1hjg3fSViAeZBBhhFJbM0LKD3J75hL21GHqLEdHC2BDytF1Q8a/0HvEvtigYbMva03Zk+ZFDeMxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722695029; c=relaxed/simple;
	bh=e7vAc3u5WcxulX6c9toYXG+63UvR5pd6bppJspj3/0E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=koBcSheXW5byArwgvQ2bJ7uBu1K/Ee39h9VunB8ygd+GYA6cWa7WA+Rl87bRJs7sw32Ox+LMHdnujNswOK846aL0iiNRh7VW6nLnrz7R8Dxc/g3WJpXhhBd+KK8UheDAnZgZQuFx7+5lteju3vawetHEvUFrItw2Yw4+7Lid38s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Y9r5YlXs; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Y9r5YlXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722695026; x=1722954226;
	bh=Itosixs0DzJsqZbTH3UQJ+zCITZIyRvnlRVkMP/cRQI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Y9r5YlXsV/umRm7S8qalYxI35HByKaJnzR4wMjtzzEtf+wKDZwuVHBiR17jBMDfyx
	 Ra+MiKxFisJJ+zSnSeGDxByaYLfWXUWvJ8PPBpfqF5/uT5xeEc1+lmOxE/yNLC+ZpP
	 veUOYfd0xXYGelwYSDAknaLaGg5V0VmaOdEJAdJs6CbogS0OkT/QXx+LoNO6KMbwAZ
	 F9QL2mmyBVg6Dr58zbccQMToGpc1oR8K3xOgYwOjZnadaVBJuj/wGXzOsFnS8xL2/v
	 FeoBFKDFyg/orrpaLbG5rF7dUPFAylQwSxZyo612yBZDsiYpVMUwttZPZ2aIG4pJzH
	 vzcCvC2WkQFvQ==
Date: Sat, 03 Aug 2024 14:23:42 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: kernel: add `drop_contents` to `BoxExt`
Message-ID: <241c994e-28fb-448c-aa4f-b96154988bf6@proton.me>
In-Reply-To: <20240803141639.3237686-1-benno.lossin@proton.me>
References: <20240803141639.3237686-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 0a436d58b9a6aacd3659a0566c36a710ae023d3c
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03.08.24 16:16, Benno Lossin wrote:
> @@ -53,4 +69,12 @@ fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<=
T>>, AllocError> {
>          // zero-sized types, we use `NonNull::dangling`.
>          Ok(unsafe { Box::from_raw(ptr) })
>      }
> +
> +    fn drop_contents(this: Self) -> Box<MaybeUninit<T>> {
> +        let ptr =3D Box::into_raw(this);
> +        // SAFETY: `ptr` is valid, because it came from `Box::into_raw`.
> +        unsafe { ptr::drop_in_place(ptr) };
> +        // SAFETY: `ptr` is valid, because it came from `Box::into_raw`.

I just noticed that I missed another comment from Boqun here. Got
confused with the two mails. I would replace the comment above with

    // CAST: `T` and `MaybeUninit<T>` have the same layout.
    let ptr =3D ptr.cast::<MaybeUninit<T>>();
    // SAFETY: `ptr` is valid for writes, because it came from `Box::into_r=
aw` and it is valid for
    // reads, since the pointer came from `Box::into_raw` and the type is `=
MaybeUninit<T>`.

Let me know if you want another version.

---
Cheers,
Benno

> +        unsafe { Box::from_raw(ptr.cast()) }
> +    }
>  }
> --
> 2.45.2
>=20
>=20
>=20

