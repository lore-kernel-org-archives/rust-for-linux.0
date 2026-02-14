Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA12B78C9C;
	Sat, 14 Feb 2026 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771057107; cv=none; b=CdJO/mLmx8Ix40qEThpiEVCIZOf3YL2ZqjcPHK8tlHAjKUnwr1KN/DWFVkpRdGqZrK4q8sZlmjCzft9PyzEuSWoJh9ay6fxHrZ610Hhs1nBVjWR2D9RRWWHixN32he72aUpWaMEL+92A9CuQRIQULxIMkS0PDDmCA615s3maeck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771057107; c=relaxed/simple;
	bh=tnGsM71fazkwZU0Sg5W474EIVzu07NCnoHxR0Z4YUL4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nNzn1RC8kQOPmk5fU/0VkTBy6EylDUQmX8WsNFy1x50vAGeHriYQ+vA4fGokJVe18xmMOV+vLUeuuV85wI3AAagNBew08fwcSJPPWojDOHRLz2481SpKui0yBUiQIT9R0Wv9kiae+krWnCaH8oJx9NuPAkZmTF4MBh9yYRDgm0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iz7z95+3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iz7z95+3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEB7C19421;
	Sat, 14 Feb 2026 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771057107;
	bh=tnGsM71fazkwZU0Sg5W474EIVzu07NCnoHxR0Z4YUL4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iz7z95+3FmKmtQELbykPO1iAhpT9bzN3jHPnBOkCasdhNjSiy2SKsxn5PZExGgNTr
	 vmwJj9zg8uJmHIccft5CjHmCFvKIBVHDw/baCy2J8YpVSGo54B8gxc6rUJGRMHdLAj
	 dDWe9NqjmLB6Dy4UXFIfBG4/rUPnbu5mu7pPzgGKMyGTqLxZcJGfF4UKRfBlKRlhMu
	 8XU2dwA856PBgSUuRHHUIWyQgZSMT2TIJkfeYyT9QBTDUO+65qSfdL5/1p1noi/07V
	 lEvSULuv3NUUzghzksRBvwwBx4wcHI2H56ryor1DXB7wYywtkcFTagXwhOhOkqpWFQ
	 TnjwZGZUtqeEw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: impl_flags: add method to return underlying integer
In-Reply-To: <b3388ec6cbd8f42532e876737e015e15@garyguo.net>
References: <20260212-impl-flags-inner-v1-1-1e2edc96e470@kernel.org>
 <b3388ec6cbd8f42532e876737e015e15@garyguo.net>
Date: Sat, 14 Feb 2026 09:02:57 +0100
Message-ID: <87zf5bsqfi.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Gary Guo <gary@garyguo.net> writes:

> On 2026-02-12 16:02, Andreas Hindborg wrote:
>> Add a method to return the underlying integer used for flags. This is
>> useful when using the flags with C APIs.
>> 
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> I am not sure if we want to actually expose the underlying representation
> for all flags. It should be something up to the caller of `impl_flags` to
> decide.
>
> Would it make sense to add visibility the wrapped raw type so that you
> can do
>
> impl_flags! {
>     pub struct Foo(pub u32);
>     ...
> }
>
> to make the inner accessible?

I don't see how that is better?

                bindings::blk_mq_tag_set {
                    ...
                    flags: flags.into_inner(),
                    ...
                }

vs

                bindings::blk_mq_tag_set {
                    ...
                    flags: flags.0,
                    ...
                }


I would prefer the first one.

We are going to need to be able to pass these flags into C APIs. I feel
like adding a method to do this is the best way to go about this. We can
call it something else if that communicates the purpose better.

Best regards,
Andreas Hindborg


