Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984291;
	b=dF2WZZg+gMBu6xSucmAO1wISDnAoTCVplJ3vC2mJMmjkjssSUbc5d+shEosOSGdsdVz6
	 1QoEBiUQ4lBiz22Ofcdllq+FSZyEhLcDDoIhqgbiuvDa5K52T3zRWupFC8Uk15+QjxlJN
	 Y0gZ0YNtm2m1j/DFOTPB7VTvkgjkhyvo4R33C0/PANaJzRLY6B17070CVX5Gw1EK4XuXr
	 kXj8/E5xbkqBz2p3Wm0N/206XV5Nuids844FrnpWXrBih3EIvmtgWrxAxIPuKHpDqxGKs
	 X/FXLjWGGwWFbC2yijMxLMR5RNpBnVXpVuxgct7w8qMKsmMe7BWM+jnvWZ0RB84d+kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type;
	bh=tR15PMze+HXvf4bfvFEctvvE9+eNUsNFEYsIngDBI2g=;
	b=w0nOnOUevBBklHdgNhqd1dbXyNzlwOnq1Lymj9GLPHJFdBm6SfY1Zl5Sl2IJKpt2BOEq
	 aq4GpJex9MKnYX+bKJxPGin4y0JApmAXogxMX4DlOkmHxxUqDRbwPRGb5LWYM1ZLfna9F
	 3zlCAkUrlW5RsEj3lToo2M9Qb3PPXr1hyzEKV0lVxM/Gzok64IofYcB0I0hHIipQUrJ+0
	 DjPRjPZxBbjpiGpWtVEdkCByG/VLo0yHa8o1+fL3VpAbDkRLfercLfbwKDVcmtot/VvBY
	 UWCIlJaaumWykJ8ACQR3CxIcssaONnfZUHzSZQtWqbrZYOHNujuyHas+TuF0W4q3Gjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gin1H2B7;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C546606A332
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 16:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C546606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gin1H2B7
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491aaed7565so502793f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 08:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793984290; x=1794589090; darn=vger.kernel.org;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tR15PMze+HXvf4bfvFEctvvE9+eNUsNFEYsIngDBI2g=;
        b=Gin1H2B7wRNxcbyBjdL47uyUsygj6jXUQQMLnvnt70dhjtMpIp0wxMNHuLJ3+or5KW
         VtUGmlr6/jQOgAQ0l+85oN7AjQUcvwmjRMy2hj3TSQDg4RBl8NJmPTuFn2RIYcfiwrXt
         m0vyrORwQ5eI+N/DwsQlHzty5n5YE+Lp+GwKf27yJ9ifctGHUWorj9kS69k+oeddpxxd
         nq/qxFZ0gb1mL+p8C60sMHqS+YmtTW0M/GR+lDcVg90mirmvj31J0rd0Gxm9oGyTl3TN
         ZB6d2pS15uTIOuf0Nz585VVcpSAjMwFmOsa1HXyGzI9BJV8TDk3f/rY48Ch6LXUrEkwZ
         woiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984290; x=1794589090;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR15PMze+HXvf4bfvFEctvvE9+eNUsNFEYsIngDBI2g=;
        b=iB9FmIgl/qh+WpyiMdZjGDSIqhuc4pfai+HH7HMghg8Fy76g4m13JsCajXl8oakgnY
         wZ7ljur2mnOkmGmgkrB6Uj0tF3E89Dc018yuprCEh1SFLC6lAj2Gg6N5LmPgECkGS3VH
         Rj1UZm67faqTvQ6NWdh3cWOdLDjQGvw5IVmP5HvM6Ft0CZ61YM7kwemER+DBVLJDpmXO
         TxmfpLth5xqtTWwo7lIMt93tlq/g+zzsS2wMbOenpRatgwcmNn00NfgbGHHoL/GK+PfU
         VjcB6rvE241DYM7qBwnfBmW6PijM2cZz0cPwmLJj95WKr2zHkc+px2wo7CNBpLzmbmlv
         hTKw==
X-Forwarded-Encrypted: i=1; AKwUvBxb95bKqydvhGvj9Bkegx3FN0DKUqgxVqxxmDkpJtGxfnzIOGwPFzqGtu2qVaqWaOgUD7qD5v5gQjKjhXWx7Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8bv6mOqGRLAsThgzrR93yjyyI1ylT7rzy/9mN8q4Vc3nuKZTiF
	ggLUPskRHdUAzj7LiJR8LL5pQlAJdn8K932KGjGr0v7YxKx/vJlhasRx
X-Gm-Gg: AYBFou30FEBjBC4fTLh3aIPhm9qbkyp10dy/pudMl+GPgXuJO794W9ShBBM8smiLqR8
	Ri/abeZx2dTrwlPwzJIN1qFL3ZbYOHevsXfjllaTIIP8nIRMJ8+HKTSE5OxkYz/PfT3/sAKEAiJ
	qGTljFbxdku6rT/0vO5Br9yMkyIaNGzOuavuTFKCqz5DQvvSg5nl7+Qn0ngbhd3XLkIzwZIgtdf
	UV7YbWb9Ogq/v6jXwypwG8F/RgoRmd60XlVnoEstmN3irbd6ateM2ao8vuPpRz3rvTU+uxI1z6R
	TYAEHkSfa36O5rbQE8GN8IeExUy27BsbI3L2cWJOa982GtzAjZd2wZP/DG/ZRmhs4/s4olOm3mJ
	knHyj0AD3STaIKEE0dDWQV2Tsih8cS6VO0hzgw/uFVcjbxkG3AnLcPSbVqquNeBubpW8yjA7A06
	2PxB9LEslIKJhTDRerqvdV20TQBvBRDLlkbhvQX38/IBSSrqQxEVijLUDNVyb2kPo9iz1PJPGPU
	iEUHxHKBY05RQTH5H0iF5ywpeXg9TzAeEdHkNH4DJMRtSuHIJLIr/e0kqLV0PLAq+jEz+hek9tS
	442TO7fDwjO6TmD7CyTq8P1XnMOkPT6r8HyrfvHo8pkwtwIFUAU0VhrimUWeST4UwCLUPyiG+n3
	/fCfykjsQaL/U9fVLWy88
X-Received: by 2002:a05:600c:4e8b:b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b6de4a6fc0mr55795315e9.11.1793984289501;
        Fri, 06 Nov 2026 08:58:09 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm176253205e9.15.2026.11.06.08.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 08:58:08 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <c855ad2d-2d30-4a49-8bdc-3adde0ead951@gmail.com>
Date: Fri, 6 Nov 2026 16:58:07 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: wrap long expressions in menuconfig
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org,
 nico@fluxnic.net, rdunlap@infradead.org, grahamr@qti.qualcomm.com,
 jakub.git@horky.net, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261010095001.265759-1-julianbraha@gmail.com>
 <179385226473.826739.16877681288448258281.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179385226473.826739.16877681288448258281.b4-review@b4>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fFUEAkC32a0sU4w7dqS1o43G"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fFUEAkC32a0sU4w7dqS1o43G
Content-Type: multipart/mixed; boundary="------------uCKM7dDNQohHbh0KBfQRDc9s";
 protected-headers="v1"; hp="clear"
Message-ID: <c855ad2d-2d30-4a49-8bdc-3adde0ead951@gmail.com>
Date: Fri, 6 Nov 2026 16:58:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: wrap long expressions in menuconfig
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org,
 nico@fluxnic.net, rdunlap@infradead.org, grahamr@qti.qualcomm.com,
 jakub.git@horky.net, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261010095001.265759-1-julianbraha@gmail.com>
 <179385226473.826739.16877681288448258281.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179385226473.826739.16877681288448258281.b4-review@b4>

--------------uCKM7dDNQohHbh0KBfQRDc9s
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/5/26 04:17, Nathan Chancellor wrote:
>> In an offline conversation, Miguel Ojeda reported that scrolling
>> horizontally in menuconfig's search to read RUST's dependencies has be=
en
>> slowing down debugging.
>>
>> Let's wrap expressions (like in the 'Depends on', 'Selected by', or
>> 'Range' sections) between tokens at the end of the window, such that e=
ach
>> line begins with the same indentation. Ensure the '!' negation stays
>> attached to the left side of the option symbol, and keep the value
>> annotation attached to the right side when wrapping.
>>
>> Note that the 'help' textbox uses the same expression printer as searc=
h,
>> so this has the side effect of improving the formatting in 'help', too=
=2E
>>
>> In the future, we should consider a larger revamp that would wrap all =
text
>> in the search window, allowing us to safely disable horizontal scrolli=
ng.
>>
>> Assisted-by: LLM
>> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> I spend some time searching for random symbols to see if all long
> depends or selects lines looked seriously broken and I did not find
> anything.
>=20
> Tested-by: Nathan Chancellor <nathan@kernel.org>
>=20
> Like you said down thread, this seems much better than what we currentl=
y
> have, which is nothing. The Sashiko comments [1] seem rather contrived
> (if valid at all, I did not check closely) but it seems reasonable not
> to get things wrong off rip so with those fixed (if necessary), we can
> probably get this into -next to see if there is anyting we immediately
> need to tweak.

Thanks for taking a look!

I can confirm that the findings are true positives, but it's a mixed
amount of contrived-ness:
(1) there actually are some Kconfig string constants in use with
trailing '!' characters. Rare usage, but not overly contrived.
(2) the leading space problem is much less realistic: technically yes,
Kconfig allows strings to have leading spaces. But no constants in-tree
are using that and I can't imagine potential use cases.

I've thought about tightening input validation to disallow leading
spaces in strings, but I suppose it's _possible_ the host has a poorly
formatted env var, and preprocessing Kconfig macros should probably not
be the place where that gets caught...

Okay, so resolving sashiko's alarms belongs here.

It's taking me longer than expected (why is expression printing this
complicated?) so let's see if I can finish v2 this weekend; I agree on
giving this its fair time in -next.

- Julian Braha

--------------uCKM7dDNQohHbh0KBfQRDc9s--

--------------fFUEAkC32a0sU4w7dqS1o43G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCau4HHwUDAAAAAAAKCRDElYPCBXNxIFKr
AQCrhnSPHcHE+swEYsZ/SIizzkKit9xBCx5qG07aLfWfpgEAv9xaTjeThzK/bKy4bN4It816GVjU
jxvCawJTIw4GLgw=
=zWGj
-----END PGP SIGNATURE-----

--------------fFUEAkC32a0sU4w7dqS1o43G--
