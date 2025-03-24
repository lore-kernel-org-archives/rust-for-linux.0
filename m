Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch [185.70.40.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB7F1990AF
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 21:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742852965; cv=none; b=kh33LdZlgzkqKeyeM1d/tx647Tng1wmsFNqCYA0oJtCQZJbBZrDVARcFWKnUsesayxocMDlAPRKBpRH7f0KRtm+2/0aCyuJj6FHIMhM2MpvUQIJRS1/okLtLKiwUPgpBttQnyq9lOw4+lECuATMQYmHI1wn0+E5oJ9K8VEAjVUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742852965; c=relaxed/simple;
	bh=ebK7J3SgVt+wS48RbZUeHcn2vqc1fVdV1QujFnxiW44=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AN9ZRftNjGAyxATWCkdSq/4NvBuqv4c0bpiB3Awl3Y+fWQEUQwgJ7+47WLMXcVJyTJMEG48xqAQ1MZCHLGsMiVkrVpqkJ6KuRMdTnVmAdWstwMEUXDCmhZ5OenBg+PwncyYvspoF5F+dvYMOMTFx3L7WNmQZ6EG+O1m3Fn4ehfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu; spf=pass smtp.mailfrom=ozlu.eu; dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b=mK9/ckW0; arc=none smtp.client-ip=185.70.40.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b="mK9/ckW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlu.eu;
	s=protonmail; t=1742852956; x=1743112156;
	bh=riQM3C4wTT6n8TaIfNDI0LPZWupIzG5is/d47CXYhsc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=mK9/ckW0TnwDOFgtmHKlLEdc8uXTRFopZq8/ZHEv1OJmSn6r1ZiklfJ+qlTg40/3j
	 WY6FTBKbh6iR96pJFWVeOEQoJdJ1HDsTilBIct99qUrkwgTWoqDumbiAxnQFxtZ3uJ
	 KZ6Yyo0CdAROkWh9597COPUzg/iZnQ5A3Gpvszv+WpNzjhcZKUmfWLRdp+oRHf1gBf
	 i1eQDQWWcS3qsIoHxVSQeZ0kbnA1BvGTyKxIzaZhbW7byDnEDAAdb7rWu3+5IACcW2
	 3Z85dm+TJb9TAuuuP8GhbuqIVMawL+BmkeVaej7zKFrHwx/HE+e6d4NU3WgeLUui/V
	 qobV7O+KwZzBw==
Date: Mon, 24 Mar 2025 21:49:10 +0000
To: benno.lossin@proton.me
From: Altan Ozlu <altan@ozlu.eu>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, altan@ozlu.eu, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH] rust: static_assert: add optional message
Message-ID: <c33181ca-f620-4874-a166-7e5523f0cc95@ozlu.eu>
In-Reply-To: <D8OQPZ158VUE.OXMRUZI9MJ3Q@proton.me>
References: <D8OQPZ158VUE.OXMRUZI9MJ3Q@proton.me>
Feedback-ID: 127873954:user:proton
X-Pm-Message-ID: 42288a0374d99c7506ded61d19ce80e56dba3e2a
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

>>  #[macro_export]
>>  macro_rules! static_assert {
>> -    ($condition:expr) =3D> {
>> -        const _: () =3D core::assert!($condition);
>> +    ($condition:expr $(,$arg:tt)?) =3D> {
>=20
> Shouldn't `$arg` be a `literal` fragment?

You are right it's better to keep it as literal, changed it in v2.

--=20
Kind regards,
Altan


