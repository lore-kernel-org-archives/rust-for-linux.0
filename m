Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA92E3D332E;
	Wed, 21 Jan 2026 19:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769022572; cv=none; b=VIxS3BCITBTnc6Z/ySA1y/P0jlEvQr6AyU5eiQ0jQhM5O3gcqG39qdVl4eCT6Jbpj/Hun7lkTVMhIWEx/BPmNvDeoOZL369xcVABfyQl85u+ASKH0/VPV87zNL6Rm61EtBkuPAkMT9WUKsKsntE3+PyzphXsLIw50J+gSkVskjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769022572; c=relaxed/simple;
	bh=1IigDFdkZhLGr63g8cJWxw1arfG4qPoivzrr/r/mKIo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S8EUYFaxKjNfpA4Lc5CwRoBbTvNRpcwqQs2hWzu10UwygS1jRZUg9HHsU8jM17U5J4loRRS1+36b3zQyIAOnAg9P0bcF6XCeOOky3eaNWlJuSfUb8Vn/acy4uY/arEg/Uf0ic4/8yz26/FoYN8acAQF/QYUI/HgzPuDX+SZWRqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwQD/WJd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwQD/WJd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DDDC4CEF1;
	Wed, 21 Jan 2026 19:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769022572;
	bh=1IigDFdkZhLGr63g8cJWxw1arfG4qPoivzrr/r/mKIo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pwQD/WJdy3jY135c2S+lnKOiL4CW9pnbnV0AlayAGfJMEPPI3C2mz0NnQSbEMnvjS
	 CgmfG2NHfAtst5PXM76H0W9+7FBZ/BvawvhRH/q2mokTWXE+GMaLj9z0/fd/OrTVH4
	 x/VFCXf3wcEgwmZ5za4V3bjkNI58ghJBtOcQL+2dYh0V0xloSMqeK4TebZG/6Nda8E
	 tnqwBNGsnqc/HBtM2Zu98XblKROuB+BPOszTil2oqM02Jeu+abkIGgX3rNpEQ5GrHW
	 X2GbwWGfRqlDf2/M4BHR5Q/jpw+dN/INvFW9x1TqAb8c2p+nLHepSvCl9eMEtJ7LJ3
	 8XOAiuVa/lmWg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Tamir Duberstein <tamird@gmail.com>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/10] rust: xarray: add preload API
In-Reply-To: <DFUE1Y1SLI19.DR47N9FFG12X@garyguo.net>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-9-9e5ffd5e3cf0@kernel.org>
 <DCgjCNtFd3q4LCtR4Lu3Vc1QQwPa5JalRLd2aQVhnDUN-Nics3MyEHb-rL-xODD3o2Z84SUqjEsEoqi7g0BwKQ==@protonmail.internalid>
 <DFUE1Y1SLI19.DR47N9FFG12X@garyguo.net>
Date: Wed, 21 Jan 2026 20:09:20 +0100
Message-ID: <87cy32u6jj.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Wed Dec 3, 2025 at 10:26 PM GMT, Andreas Hindborg wrote:
>> Add a preload API that allows preallocating memory for XArray
>> insertions. This enables insertions to proceed without allocation
>> failures in contexts where memory allocation is not desirable, such as
>> in atomic contexts or where reliability is critical.
>>
>> The API includes:
>>
>> - `XArrayPreloadBuffer` for managing a pool of preallocated nodes.
>> - `XArrayPreloadNode` representing a single preallocated node.
>> - Integration with the entry API, allowing `VacantEntry::insert` and
>>   `VacantEntry::insert_entry` to accept an optional preload buffer.
>> - A new `Guard::insert_entry` method for inserting with preload support.
>>
>> The implementation uses a circular buffer to efficiently manage
>> preallocated nodes. When an insertion would fail due to ENOMEM, the
>> XArray state API automatically consumes a preallocated node from the
>> buffer if available.
>
> It looks like this code doesn't neede to be XArray specific. You can provide
> a generic abstraction for kmem_cache and just use a specific instance for
> XArray?

I guess. Perhaps we can go with this for now and make the code generic
when we have more users? Just so that we don't over engineer if there is
not reason.

In the session at LPC25 where we discussed this series, I was
recommended to use a sheaf rather than managing the preallocated objects
myself. I did not look into this yet, but I will.


Best regards,
Andreas Hindborg

