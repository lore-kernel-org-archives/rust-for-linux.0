Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9B427B347;
	Fri, 16 Jan 2026 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571894; cv=none; b=KleentTJH8KDtm7aTsH6ZKM4ie3ZLcRk2EExOURZFe7600PejimVs/U0sXxSMHcr8TpYZtYGkOdlYqAkjfJ1tM4KXLPXhUmH9/we8rZBYUUxbHyT+gW8Vlp9ILKG7ZgmuD/vwfC+0VZguQCN6GWTZ+JayY3lFXEWAkHxKbxzxH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571894; c=relaxed/simple;
	bh=g5iALcS0tIslRxLBVt9TYjT2cP4WEv0rfJAOu9M6usw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=n+u4a5/M5s+yeQFc/1Yic0xLPMNkvgEaRy6pX/53WZxcu7pbBvcPfrt94sqjwWfGC5CDsv9t6uLWA4RwmPQl5+Or+j8kH2CroxbWkluJQxAOeO8/+9NtCfD86ED2jvW78pCe47otVsvzEDNcOKDpSuOHFJfhjNusP8Zzke4FKUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfFA1nBV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfFA1nBV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556E4C16AAE;
	Fri, 16 Jan 2026 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768571894;
	bh=g5iALcS0tIslRxLBVt9TYjT2cP4WEv0rfJAOu9M6usw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=RfFA1nBVANwp2mZUEpeIrZJ8u7/QmnY2Km5o84kP/EIuj0/f2uNXaSUsVh+Z0Kfp0
	 lCMetP4/zfGemUsK3PLdFBr94R392ZzWHN9rpn6QqklBPsAs5VXCeKVlkd7YVhu6sv
	 E0QAzg+1exf/Pzd3pqG3LbKrw9tDb+GOKOIDwo7LybBbdZYOgRuUcB7LLEPBlaIGy3
	 v8AtrxO1mmEKJJkFyUr8UbiIewS0UXsRbHjQbVsquPcezfbRyZBUVcuQsfz3PD6k8E
	 WR02gWE2vZm2Se+OoQWkegp40aHZAfy1E6nJNOKDtQIDFb4hf3lS+5/wOYn3vTnhlm
	 ix2myJBTQO+Vw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 14:58:08 +0100
Message-Id: <DFQ2ETAYEE9B.1B3P7RH733YM7@kernel.org>
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <dirk.behme@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Steven Price" <steven.price@arm.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com>
 <DFQ16QS1RAEL.1Z0ESXE0MBA7G@garyguo.net>
 <25EE982E-B03D-4C50-B973-34AC4FFA96B6@collabora.com>
 <DFQ2B06J0U0T.M8K7D98WCZYI@garyguo.net>
In-Reply-To: <DFQ2B06J0U0T.M8K7D98WCZYI@garyguo.net>

On Fri Jan 16, 2026 at 2:53 PM CET, Gary Guo wrote:
> On Fri Jan 16, 2026 at 1:38 PM GMT, Daniel Almeida wrote:
>>
>>>>>=20
>>>>> Is there any reason why you replace the UPPERCASE register names with
>>>>> CamelCase ones?
>>>>>=20
>>>>> I was under the impression that we want to use UPPERCASE for register
>>>>> names. Like in nova
>>>>>=20
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpu/nova-core/regs.rs
>>>>=20
>>>> Not really. UPPERCASE for non-const items will trigger the linter. The=
 Nova
>>>> people chose to #[allow] this to align with OpenRM and, IIRC from the =
LPC
>>>> discussions, their registers are automatically generated from some int=
ernal
>>>> docs.
>>>>=20
>>>> We have only a few, we can simply convert them to CamelCase.
>>>=20
>>> Frankly, register names do look nicer in UPPER_CASE, especially that th=
ey're in
>>> many cases, packed with acronyms.
>>>=20
>>> Best,
>>> Gary
>>>=20
>>
>> I don=E2=80=99t have an opinion here, to be honest. I think CamelCase do=
es make it
>> easier on the eyes since our register names look quite simple,

I think you want to go with what your datasheets do, it is much easier for
people if names are consistent.

>
> You're on the lucky side! Most hardware don't enjoy that, especially if
> you want to match register names with the ones documented on the datashee=
t.
>
>> specially when
>> compared to Nova. However, I can switch to UPPER_CASE and add an
>> #![allow(non_camel_case_types)] if more people chime in.
>
> I wonder if we should just such allow `non_camel_case_types` to the regis=
ter
> macro? I don't have an opinion on whether we want to enforce using UPPER_=
CASE,
> but at least I think we should allow it.

I fully agree here. I would not enforce it either, but given that the absol=
ute
majority of datasheets uses UPPER_CASE for register names, we should allow =
it in
the register!() macro.
