Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9894D09EF
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 18:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829486; cv=none; b=HJaY3s8tSCAQhFBUVUDSNQ4KFdRqQ6wxQpc/qwEkehDjCJ+d2gQpAmqcRllo2imr/WfTABMDQdf4OnVuf1TVrQ9xwk9Cm47waifc1MqkG1RenS0NmJRAz9Qkf1KUYX4J2DA+5JesqdtOT7vKfmjmagKs/+8hRw51VKnr7t+tc8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829486; c=relaxed/simple;
	bh=ILjixpa1Z6s/+qhrU+GyCpiEGP3d0AUWEEgb/Jq7zFk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uz461rpA1rOw2wkZg51vCctQxKtqQYeiAue6A7Tn87//6bolno3GDMP9Ty4YxMsVACvfZ0or8HVj4FMELMYPi+PppEhZr7ZkTPB9Sxkv4UxycEesZ1yYIK2ZRYNRhlEhWni3S1i/fHMtN3X7Thi6uIcAgo0DiNn03Yw0TV7skTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=rVCVZ4py; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="rVCVZ4py"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791829478; x=1792088678;
	bh=ILjixpa1Z6s/+qhrU+GyCpiEGP3d0AUWEEgb/Jq7zFk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rVCVZ4pyWfqM1LJ6AKoZuDZojXsV+VOJe8u5DMAqJZptoj4kzZJvZTPVre2eli6ll
	 0s5MtTkx5HHE66dNuma7ZlJoZEizszIKSzOPXXDvtVOkW0mCnBww3bOF7g7fDFzCQ4
	 yhKGrwR64uRdn3JZNGx07CGzU3SJawN0X9vTQu6Y+78ZDDYA+7tz14zSn+TokM5b29
	 llEXglzceQzPb9GGM4Z9yL7E273BBmAR8I/enfzDQvCs5gjYQ8/kDeFT5fULKNnQmy
	 YRnRQj3mun1xKW1iohyCFEsoHijTiKQ4y7mppzamfPUPOceHRnbBSwprum7Y+zD/gH
	 Pdzp3Mp2DTz4Q==
Date: Mon, 12 Oct 2026 18:24:32 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: Lorenzo Delgado <lnsdev@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Subject: Re: [PATCH 2/2] rust: uaccess: use NonEmpty in strcpy_into_buf()
Message-ID: <20261012182426.4013900-1-lnsdev@proton.me>
In-Reply-To: <CANiq72niDTiewxWGC=PTCoG1xeb6hVmeKT+5N8DDHV2bQdQ0Ug@mail.gmail.com>
References: <20261012-nonempty-slice-v1-0-37d1fecff82c@proton.me> <20261012-nonempty-slice-v1-2-37d1fecff82c@proton.me> <CANiq72niDTiewxWGC=PTCoG1xeb6hVmeKT+5N8DDHV2bQdQ0Ug@mail.gmail.com>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: 240db68821d1338579c9a7134214b422732702c3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:22 PM Miguel Ojeda <miguel.ojeda.sandonis@gmail.c=
om> wrote:
>
> Hmm... I thought the idea was to request a `NonEmpty` in the signature.
>
> Is it not possible for some reason?

It's possible. I kept the signature as is to limit the change to the
inside of the function, but you're right: the point of the newtype is
to put the requirement in the signature. In v2 it will take
`&mut NonEmpty<[u8]>` and the `EINVAL` case goes away.

Since callers will usually pass a fixed-size array, v2 also adds a
constructor from `&mut [T; N]` that checks `N > 0` at compile time, so
they don't need a runtime check either.

Thanks,
Lorenzo

