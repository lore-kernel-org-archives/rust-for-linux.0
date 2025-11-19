Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D441F5847
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 19:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763580912; cv=none; b=An9MyrikG06yq9vqVdJrUDg/WfzHqvW6SSPD74+yB5QTqyAIiBZXtf91MSu9aDRUrw/mY2B4DgDtS1Ho1wlbq/Vxu737sgAbwPs3leIdmA8DhKxo1Yy35g+LvAhFu9JUQNRLfI7xXNein196/wZzsN2RDgdk2hUPjQociwI6o6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763580912; c=relaxed/simple;
	bh=qQwb+nyOmVWNkKmDpbdo8td0cyYMOhTtSoDa7FJCXvY=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=CrdS+9PANIRoJIwTKvoNzHPIUDhaW3xm9K4yBe732i3vgrLj3DmueLaspSulWDDP6CQ5ysYdFLF4zsbbYhExTcOTLg1pbxv5D+rJsx6NELVN46x+9yeFQFhwZ9JNwDuLWuxw+3q8HhaoVHF5vgx4+xFEstZpSuLNmsezGUCNv18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=EAd9H5gJ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="EAd9H5gJ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso85218a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 11:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1763580907; x=1764185707; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQwb+nyOmVWNkKmDpbdo8td0cyYMOhTtSoDa7FJCXvY=;
        b=EAd9H5gJyP2CcghkYFCg1bbi6VVQYcSHV1WTYwpxWmsSHSu5wW3/RUPGm2lv66H8cS
         9mWA71X7I2M3m8YlhddZqpqLDgDCwnJsn6S9omtZ9DbuLJQZo+hxpsrFbEZHz/0OfiKa
         2XzfUScmQMAYSTjIPVacocFcL+O+t/IpfluzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763580907; x=1764185707;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qQwb+nyOmVWNkKmDpbdo8td0cyYMOhTtSoDa7FJCXvY=;
        b=fS752gtH4ZM/u75hHXjDbvPKkJUdefzF81FiLANArc3Q1jeRjK0X46vSWCEHYvsOZO
         ISYwo6RTFCJzxlpZ3Omym46uVOl8k++GloDKLDs8f8/SWiivo7QXLUn8NCtcM+gryj42
         oklOmDVG0PJEVQIQ3nj8iUCkpXan7Fu4rZ025l0O6r0HSeUrWyv4r7FpWC9zUmXd9fqw
         b+L91nH7P8XNIPM7r4Ff31In35N8DIH/cvhzjy5Nt/YKmrqf9JYhiYzkFmOeb7KrtVR2
         pi2apTE+YVpsT6YPdyNKqyMCf+WlNoUtGnYgaO0KisMgvy1EVopbKZ1Sv5Utm/4K7aKa
         0S/g==
X-Forwarded-Encrypted: i=1; AJvYcCWgX8tEjAntcOEIPlA7kJ0Hjp5odwdcXV9lBU+qL0y7OpcqUflUoUQyLl6pWSgPx1oM9XTW4KZyfEVeEufO1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGH+xHN0S5XE5iML4NffKCgHkmis19OwX8cYGVo7riaCcUhRmK
	s37F+KmBdNOHJqGoFDqeyU1ZcTyYY9UqkR7SCrcol6lIRPujYc2riEVVM+oqFJaHRDw=
X-Gm-Gg: ASbGnctL3noEWfAUkeXeASqZDQbIuWvrHAORzxtzbRymfUpGJeLo5j659gYR58apLJv
	JiVnuHlNz4rwUE0QSiY46rh0yfFvRESaZ287k3IBhcCXw4uXaB2tNOrInTz0TdjIJvuxWWRdmV6
	zy/Znc0ZEaaf66t3u6cgnRhWYK7BlkS0wglwjzIpWcU3bFTB/XssS9Gwgq5I9xv/eB/Zh2UZc20
	/XtuIKNdrezpe8CScHPxmlasSJ+urrDWvnQ+SiQsSl2Ulc5HmJuPUBC+2C4FxVikDsabkhu3VO0
	HXogHOqxgE1w83DwaExAnFDUPNYJ938Qqj695bcS8Xz3za7EHXDuQLVNAwRSmEiKRiaUnfdI31G
	x4Dz2S3+mD7VLMc2sBX6MfOzUnGjCbWsPuq7p6KQKVpvJBgPVAHjmuBSKEKzpEJuNyvcTqcUCn0
	nsCSChV7ohLRrKOuqD7mfWCgY/Zh4dhXBUW12wwcPPdML3I71haw82hKOt
X-Google-Smtp-Source: AGHT+IEjm2Bf9a2+PL1IBujBnJjUDjgUmYSLDwpAJV3ppjeH1qkHHxcwIZ0xlDYjvVfvxMzOIL+gwQ==
X-Received: by 2002:a05:6402:2690:b0:640:80f4:3914 with SMTP id 4fb4d7f45d1cf-6453643d135mr436294a12.19.1763580907224;
        Wed, 19 Nov 2025 11:35:07 -0800 (PST)
Received: from smtpclient.apple ([109.166.135.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm283999a12.31.2025.11.19.11.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 11:35:06 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] rust: add a function that returns a reference to the IO Ports Resource
Date: Wed, 19 Nov 2025 21:34:55 +0200
Message-Id: <B113730F-8A24-4C68-A2EF-C859281CC136@wyliodrin.com>
References: <8A9FC261-679B-4596-B7D2-C05466AEFABF@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 Fiona Behrens <me@kloenk.dev>
In-Reply-To: <8A9FC261-679B-4596-B7D2-C05466AEFABF@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: iPhone Mail (22G100)

Hi Daniel,

> On Nov 19, 2025, at 20:05, Daniel Almeida <daniel.almeida@collabora.com> w=
rote:
>=20
> =EF=BB=BFAlexandru,
>=20
>=20
>> Thank you for the quick reply. I am trying to teach Rust for the Linux ke=
rnel at the university and this seems to me like a chicken and egg problem, b=
ut I might be
>> wrong. My understanding is that if there is no real drivers usage, this c=
annot be into the kernel. My concern is that if there is no API for this, de=
velopers will
>> just ignore the port reservation or use the unsafe (and possible forget t=
o release the prorts).
>>=20
>> =46rom the didactical point of view, for someone just starting with this,=
 writing these simple QEMU drivers (debugcon and isa-debug-exit) is a very g=
ood exercise.
>> What I wanted to avoid is them patching the kernel before they can write t=
hese drivers.
>>=20
>> If we cannot merge this due to the lack of users, could you point me to a=
 driver that we could rewrite so that we actually have a user? Or, is it ok t=
o add sample
>> drivers that use it?
>>=20
>> Thank you.
>>=20
>> Alexandru
>>>=20
>>> =E2=80=94 Daniel
>=20
>=20
> Have you checked the LED driver that Fiona was working on recently?
>=20
> I think she did not have the time to complete it. That was the original
> candidate user for this code. You may be able to pick it up.

I did not, but thank you for the tip, could you point me to it?

Thank you.
>=20
> =E2=80=94 Daniel

Alexandru=
