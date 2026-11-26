Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706187;
	b=jhc63T17vCt3HgP0UgD+ADP0cHpgJ9fNO/VxuaTBZwUzgsSvEHRvzC0IOaejjlr8nbHV
	 cAiOxBGb9R+/lxuBPGA6R35SnIAwJJ0Yg2FlGzb0XrSl+mFeOZiaJHbgiDwQJqK9OO3SI
	 1vAktiQaxEGyW8nmioZhECTH5ft4dLtYCX929Td5nJDn/okT7d4YEpx9nPLkGYpN4LHPN
	 fLPuxsSnLuJ+NLb7uy9qW5CcqGe1pF4y/MGkEXIpigTJewJfGSUoQ/Xp+rOp/kS1DD0oM
	 FMszWJdlTIZ1xFBwGIA7RCi1DMZh+w3LUeZ7LPnOdrhq3t8vQ2b/97hJayWgYjCyrcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=73RhbSCzzEXErQpCoUjkNFQF+UmJqC718yIoC62o/2I=;
	b=Bpq5VPX9cVbEGvq/jBl7eCo6x9BFmbkEGJ1fcTlrKBvIuUUj877qJ6MWaFnkXKxfgKNE
	 CdNvNolBTb/7bT3e5IHvw/T3wtBHhB8ya7rEy/vYFlFp9CJYwyZyQVWo9rnP36PF7zwEh
	 lIY6sJDUl98kUCledA6oTIN8QlU6vBJGKty9c1XOJCjPYuRzutII9JeRjtPj1dJc03Hxv
	 fpRbjRwi/o4OusfI9pYgczP5iiOVBL/rQugqC2KJ6WO/S21JDpB00YETbDDfKok8X5xha
	 r90GitEh4y+MK3duGLj9RGtoUEJ4KRRbxzGprx+8Wz3DNM6q/SwGcHRZtmtVaStT5WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bF0rIll;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F13606A323
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 15:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F13606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bF0rIll
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9906870a9baso3582840241.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706186; x=1796310986; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=73RhbSCzzEXErQpCoUjkNFQF+UmJqC718yIoC62o/2I=;
        b=0bF0rIllZMds9r3Rg/X9Bi+iVHdHNqm+S1vsVtFnT5IDmowjopX6s5Jm6OZvmfydcf
         w5lvVkXo+toCwdm7KFyah1q0wvuXDdthl4mtV1SMGemFDmdUaV9OtHEJzjgNc31QkRUQ
         QP2gJ5cVLG7u5Nv8uQCm8VC/oH67MbE9JLud1EqvFxMpaMMjQ7Q8lA5/TkHO5H85HMem
         3q2/EbLhzaNpqlvkN9/vPueWbZyrRHUPorRN9t/t5ttzUwBv44QccQe1Tm1w4LMh/dh1
         7dTGRzrwRiAAyCCCvPvRbgc+3gzRd+mc53T0xG7X1PAECRZEYWDSMxWBOeh2Mgr2Oe/b
         PZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706186; x=1796310986;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73RhbSCzzEXErQpCoUjkNFQF+UmJqC718yIoC62o/2I=;
        b=0GHU2Psvujh0QR4lBMi2g2dFDiHmrx2mi0WrGCBI79VM09zX4GKhX4FNoB3ZwCaO2w
         bGngGg/gOFoQQytuNpbkemB5lslNE8ZGSSgTLJGDoenOU0D9sN2G07/VhXiBbT/nagNU
         CoDTou6vqy4SkC023DHpVLGEPnRx+TgUpBNe4NYJRZy1vnMJbqsTBf0Vbt4TItSAye4Q
         ZnYdwGJs1Wj10OtBV0PgNcYoWTh7n5xigU5mQAGD9RFNkECx/+gJK4zhxsgGXIlxsXBe
         6LXHGlqExcQhRqN0hoHuYbomPRSErpMYtIq3jgmYbNTCR2ruAQmSCivXb6uswRLlVbUF
         dUiA==
X-Forwarded-Encrypted: i=1; AL+hErHdcoMbWZC6UkiW0HN/0QIIcQj6F5t+wUdf+ekeFJUar5uV0lRwrbmHk397PW6UKfNWD1Toq5DAY+8Jba0XpA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8N6+Cot/c0ZamQO9Ap8fMTerTkHCco13Gagm9HYF6KRDEEP3KC
	vJAoss2aW7oQajgTEDuJXcWgP/H3JRqdYBoNWjWbebd2iKCu8u7IAHE=
X-Gm-Gg: AZFdTZcAincfo7nSEnKqcRBJCSGm8DhFMIeDf7AsyTkd5D1MqSe8V48ATZKu6dLkedN
	FskFlQM1DbD3zAd3GvMeLIxHCgTmxSJuUHzu8fJWCrVBoG1g2yKyVIKNj4tToXh5nLxTsohQdr3
	Jgtm2yka+65XTw6no48LNKGeQAeyboVttLwme2iOi5NZM6+NeQJhYarJACt4k+dZLUL5NWIzWzH
	i8uUPIMRCxUMjZI5iWdbJcBKHO65Rgw77YTEzm2NAYn6ZaJMs6XgLnB3Up15wE4P3Yk+sJQudQM
	OvPNBZPjS/zRAVLAFU2R3yrCnsS+U72G+iRIBa+JPXt6/C0v8NntgSRQAQD2fL5ns78pwMJdrxv
	LRMbPq4YDidO6oQmizyGUxBUqtHQQS2BmKz9kPH6wNNHolelZ7JcBEnhCeb21xJuRNmHuTcou8B
	CWig/hTpe8NOxIo+UvYuzgip4LOWH7yNNQ4MYvdmgzLjUG2aBm2P87dlOtnvhVUuu6tNHDflDvL
	x/s73W+FHwKk8KJgQi0MYjyWAoqUAy+TOfsqHftHXkpWPD18tZK5pTzw3hl909vnbMKC8gAZHkg
	erU+nGT77cbpqrSjUdzLgxn/ljlliYx12PgbDisqzocLcpLzY9/RetJFWdIQveQ1NQ==
X-Received: by 2002:a05:6122:8c8c:b0:5ec:e6b8:ebad with SMTP id 71dfb90a1353d-5ee8af4a759mr12322188e0c.10.1795706186471;
        Thu, 26 Nov 2026 07:16:26 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee91a4e0cfsm19662910e0c.13.2026.11.26.07.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:16:26 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 12:16:18 -0300
Message-Id: <DN58PQ0UNTCV.2C8E5QAXJ53I7@gmail.com>
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Burak Emir"
 <burak.emir@gmail.com>, "Rae Moar" <raemoar63@gmail.com>, "Tamir
 Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Yury
 Norov" <yury.norov@gmail.com>, <kunit-dev@googlegroups.com>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "David Gow" <david@davidgow.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Benno Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.20.0
References: <20261113-rust_kunit_v6_send-v3-0-0d7832c07166@gmail.com>
 <20261113-rust_kunit_v6_send-v3-1-0d7832c07166@gmail.com>
 <0e68f60e-e9e0-4443-8189-72180ff07a14@davidgow.net>
In-Reply-To: <0e68f60e-e9e0-4443-8189-72180ff07a14@davidgow.net>

On Mon Nov 23, 2026 at 10:36 AM -03, David Gow wrote:
> Le 14/11/2026 =C3=A0 02:20, 'Nicol=C3=A1s Antinori via B4 Relay' via KUni=
t=20
> Development a =C3=A9crit=C2=A0:
>> From: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>>=20
>> KUnit tests in Rust are written using user-space like syntax. This patch
>> adds support for the `#[should_panic]` attribute, enabling the user to
>> test conditions that are expected to cause a panic and report the test
>> as successful.
>>=20
>> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>> ---
>
> Okay -- this looks good to go to me. Thanks very much for all of your=20
> effort!

Thank you for the reviews and explanations! I'll be sending the
implementation for `#[should_panic =3D "message"]` once this lands.

There's a sashiko observation [1] but I dismissed it because before this
patch `KUNIT_ASSERT_NOT_ERR_OR_NULL` already aborted before setting
`priv` and executing `kunit_init_test` and `kunit_resource_test_exit`
performed the frees without any check. I assume that this is acceptable
in this context, but let me know otherwise!=20

> I'm not 100% happy with how pushing the attributes into struct kunit has=
=20
> balooned into all of the different kunit_init_test() call, but I think=20
> all of the other options are either worse, or involve even more invasive=
=20
> refactoring. (That being said, I do think this might be the thing which=
=20
> finally makes me look into refactoring how we handle the struct kunit /=
=20
> struct kunit_case dichotomy better... :-))

Yes, this was tricky! The alternative I thought was setting attrs
directly when declaring `struct kunit ...` (right before the two calls
of `kunit_init_test` in `test.c`) but I was not sure if it was the right
place (we would have avoided passing the attrs in all the calls if I am
not mistaken though).

Regards,
Nicol=C3=A1s=20

[1] https://sashiko.dev/#/patchset/20261113-rust_kunit_v6_send-v3-0-0d7832c=
07166@gmail.com?part=3D1
