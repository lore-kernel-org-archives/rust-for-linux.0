Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F9E1E2839
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 22:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728598501; cv=none; b=UwgqQha2S39zZAB+mHIUpY4iqr8Y76JaQERq9TbNdre/UHU/yAEyHBXhce5TgnCUnG60YfZsknsuhTr9DP2Z7iXv1/Zzrf4awH0gOAv+bLrxm36ds9heD8AKTB/tGlEYN5fUeJXozAOD5I7oRpwf//O8o00HGwoMg5e7mmll8GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728598501; c=relaxed/simple;
	bh=6wuvlwCa6TSt0v332U+6mY0pX9kM6s8vhMYzCkSEeEk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YBQuVRDXgSFLQTpaghqHlCKE2VF5Rd7hXYTBH8innRZndDntoE1BxFozuf7fVxQdWzSw4/PEooWnIxg/T4oi839WdQUGhdWkIGm+Z2+ddkEDFm7KbOtLP76KtLM8JeKDZo6mwj7wJeCk0R2Utk3ztacrijKr5KjlJ2cUNr49xxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=O8cHpUgX; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="O8cHpUgX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1728598497; x=1728857697;
	bh=c2eztCA1e4UB4MlQh9sJYpniTjBOlUpjxUjuhUGTTBM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=O8cHpUgX+pv15xmM7aAjyhLNuYGKog5tKvySd3F4NoAmQFnRlieCKSa2meQA6560M
	 Lu0LsrdwMN17MXdhfJJZl2G3JyoxJkLNGhtXZVBKID61WeN0Zgi+w7AbtvUoa81IGV
	 oxnwf5UeA4v2bRTIZMLOClUUhZrPCKv969NZOF4DZCGy0w9Xm/I3SJ464oXAYL14nb
	 kwCWPywUfbRuYFtaVJT0kB+c2+TfsuhNnNLDWf1qX9LwFS0BdyOaoBhWbkHvamg0gc
	 7x3zqrOS0Gmvb8tiFKqPXPsCNzCIjQvNpFco+O5d4jLLqVtOkj4+O87tmfEav5Z9iF
	 2g3LXWWGALQDA==
Date: Thu, 10 Oct 2024 22:14:52 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] rust: add global lock support
Message-ID: <2376e7b3-42a4-4743-a5cd-83251dcc0075@proton.me>
In-Reply-To: <87msjckqfw.fsf@kernel.org>
References: <20240930-static-mutex-v4-1-c59555413127@google.com> <HVPdDHj35lGMPHyA8YvYjO4hhof-vNaVDqo_ILwyCmuY13oskqVKxaIA7OK4wo6fWYeJIV_RMtbPdjVRGJcLvg==@protonmail.internalid> <1f688070-66bd-450b-ba5d-b929de64ecf0@proton.me> <87msjckqfw.fsf@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: e1ab7e91a78749aba42462da63b16ce6f6adcaba
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10.10.24 16:01, Andreas Hindborg wrote:
> "Benno Lossin" <benno.lossin@proton.me> writes:
>=20
>>
>> Also,
>>
>>     error: type `__static_lock_ty_VALUE` should have an upper camel case=
 name
>>        --> rust/kernel/sync/lock/global.rs:100:18
>>         |
>>     100 |               type [< __static_lock_ty_ $name >] =3D $valuety;
>>         |                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: convert=
 the identifier to upper camel case: `StaticLockTyValue`
>>
>=20
> How did you manage to get these errors?

I added a `global_lock!` invocation to `lib.rs`. Otherwise I also don't
get them (they might also be emitted from the examples, but I didn't
compile those).

---
Cheers,
Benno

