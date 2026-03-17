Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AFA3161AD
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738335; cv=none; b=VaZjd0ZcdO9Lodn02F2W01Bf8Qt4wXD2ctVRcAl1WVQz0WCVIZDEEbf7oXqzUnC5HpNEID5gM5zNfsfr6vZUyYe76uTMAo8wUDjEOgVkCcb7eP0YoRSg+UugZEvnqvVthNqO3Vv44PZR7yZ+HL7VVG+YRQA8Kxu/Zi2K9otJsXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738335; c=relaxed/simple;
	bh=Nac5SCySrUfnjaJGd+Y1c81gZpkBA6lghrWoXG0djrg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=P+MUKnS1X9Cwk5gTAWTSLhOfsWyXf5DU8ZnP+jJH1/Hc9KjBtv8wTbuGCSv9HmWFyPLU9Y90mre0jZ/Enykd/KmFZ6FW1LUJ+N3HFD2x9luBanAmN7oxyx8kdiNt8CCYKGfHKnWldD0KsGiPCEwxWG/QjGbmWJB0QA5ND8oQ7Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoxZoVf4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoxZoVf4"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8297310ce0aso2955742b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 02:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773738334; x=1774343134; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teNErOVssjJSA3ZrFm7FBopN/pWjPWMmAh2R9jtM+io=;
        b=LoxZoVf4l6eiUMRBY0JErfexMnRHBL6EWrr5HFhm3gAqSoQr4aoJtlM/D2Sk1UL3F/
         TqBwrh1rLH04t8phDbOqxEVpMx2goMPfOk/wLGqg6X2qUVd3qB6L2XyTGJGieGuMQ4dc
         QdEDyoP7Nyq/vPTmL5OXgVHPhKs/+liqlay9pdLK2NRziPKq5Ij56S5gy7fgr1YfovWi
         k4+zuc3nnNk0HgDp3kq+iZS2rQrp60jKzbWfCUuDSL+0OuMjsgNaEA9zrxABu+PLCyhz
         DhigbZd7QuN/ZzKXyMYA5KxfcPinE/y3TXk+qr+L9L1a9+w9cK/Ab0XcZzd52u3Wsn+R
         zikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773738334; x=1774343134;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=teNErOVssjJSA3ZrFm7FBopN/pWjPWMmAh2R9jtM+io=;
        b=FfgFhk8y0mou8MeLosU1ImYFY/vE4niuW7EIj5qjFCIWdi4Aia86sACeMln05pCpMG
         hoDdT+dyiec37+C8M0jYptK5OjF+aM3BB+hrwbqsjbyAINW4Vxklk4JVAyXXb4bmiSXb
         JduXOyqQg0zL82GZJOKr5VgWvJDb+NmZ8YPvWscdPMF2XvQLZ7XMy1ZYQ1tw0cz7/1NT
         LAi3M4Y3dm/vbjI4gDecM0hMrWhVxBlo7+pvrJ8xRiJwo1f7iy7KhX0gAWPod1JAbOMf
         cZmUXq9AgZFxDFpJ4e8KhO7GkFCFmmBN+UUWjpeh31tBHAGzOh3KhoPZ6nRWt5nBS4uB
         rxBA==
X-Forwarded-Encrypted: i=1; AJvYcCUUChWEAuBoy1Hcpuo2GYXWJxV6jW8zGDZjRS6zdhsLMnCfVrq5Nf7kmuQ2FtNC/THnMGtcj4sJ6aghe61E4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxarou7U0CTjKJXHPxBjvIQ2okIDaj7FuBJJQ6szVTeID4IBIi1
	xlbGm/K6JoLsRX42ryxj/8//xvoRRtXBx+fLieiWmgy5t5bMzE86C3EN
X-Gm-Gg: ATEYQzyCDPopJbrx8a8P8Ifjk2eQ1TtBrwmSkQGLTOaLeohpkRunulbFFZYnU2zP5Ti
	JtFD3TkCQXhK1rNKQndI17saNTjJfLI51zgi+9TBsoKWm/OPq4xKQDw30aLzc7IxbE58b9jCIPC
	C4C1T3VpX7SzjBTHG2yMXfoOmr+Da9Dy0icV3mP9VB7MoUJc4WPOkuJKYiLPGwcodKLlnuSVmLr
	/OAwPVUW3Gp6iOkSNobYmYO10vzfj3EPOetigOW91XNGhxP9pXnv2Leiq3b4rUR99SsILobOYce
	x/p7kz/2CDUHR22rZsfwujuReOQ4pb0+ylQEEyGsOvd6kH0Qg1+mkYSFSBanPHP/gdfNqSnzCiu
	fiol2iBfW3y28XdYLVT8zUwk8I8EbjBxOu5xjUjOa2msUToeAl/CePf6QECP4iFEv80p/ol4Uey
	boB+JqUvwwhfuBVcMIVw==
X-Received: by 2002:a05:6a00:3d13:b0:827:32d7:668f with SMTP id d2e1a72fcca58-82a196f61a5mr15042936b3a.6.1773738333664;
        Tue, 17 Mar 2026 02:05:33 -0700 (PDT)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072603c0sm15131413b3a.22.2026.03.17.02.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 02:05:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 18:05:27 +0900
Message-Id: <DH4XREQ17DU8.2V3F4JZ5ZO0UY@gmail.com>
Subject: Re: [PATCH v3 1/2] scripts: generate_rust_analyzer.py: add
 versioning infrastructure
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Jesung Yang"
 <y.j3ms.n@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Eliot
 Courtney" <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260308-ra-fix-primitive-v3-0-598017bcefd8@gmail.com>
 <20260308-ra-fix-primitive-v3-1-598017bcefd8@gmail.com>
 <177308129157.19064.2462259833624603051@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa> <DH35VGPQ4P8K.2FOAKEK1K2S3Z@gmail.com> <177367187873.68572.13759534078660151207@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
In-Reply-To: <177367187873.68572.13759534078660151207@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>

On Mon Mar 16, 2026 at 11:37 PM KST, Tamir Duberstein wrote:
> On 2026-03-15 16:01 +0900, Jesung Yang wrote:
>> On Tue Mar 10, 2026 at 3:34 AM KST, Tamir Duberstein wrote:
>> > On Sun, 08 Mar 2026 08:30:34 +0900, Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
>> [...]
>> >> @@ -335,12 +390,90 @@ def generate_crates(
>> >>              append_crate(
>> >>                  name,
>> >>                  path,
>> >> -                [core, kernel, pin_init],
>> >> +                sysroot_deps(core) + [kernel, pin_init],
>> >>                  cfg=3Dgenerated_cfg,
>> >> +                crate_attrs=3D["no_std"],
>> >>              )
>> >
>> > Can you help me understand this addition? It's not mentioned except in=
 the
>> > cover letter as a diff from v2.
>>=20
>> Assuming you're referring to `crate_attrs=3D["no_std"]`, this makes
>> rust-analyzer treat crates in `driver/` and `samples/` as if
>> `#![no_std]` were specified in their crate roots (they don't contain
>> `#![no_std]` themselves).
>
> Yes, that's what I was referring to. Still, it's not clear to me why
> that is part of this patch. Is it intentional, or incidental?

Ah, now I see your point. Yes, this should be in `scripts:=20
generate_rust_analyzer.py: fix IDE support for primitive types`
(PATCH [2/2]).

>> >> +def generate_rust_project(
>> >> +    version_info: RaVersionInfo,
>> >> +    srctree: pathlib.Path,
>> >> +    objtree: pathlib.Path,
>> >> +    sysroot: pathlib.Path,
>> >> +    sysroot_src: pathlib.Path,
>> >> +    external_src: Optional[pathlib.Path],
>> >> +    cfgs: List[str],
>> >> +    core_edition: str,
>> >> +) -> RustProject:
>> >> +    assert len(BASELINES) =3D=3D 1, "Exhaustiveness check: update if=
 branches!"
>> >> +
>> >> +    ctx: RaVersionCtx
>> >> +
>> >
>> > Could we make RaVersionInfo an enum? That would allow mypy to do this =
check
>> > (using `match`) rather than relying on this.
>>=20
>> I think you want something like the following?
>>=20
>> @enum.unique
>> class RaVersionInfo(enum.Enum):
>>     V20240311 =3D (
>>         datetime.strptime("2024-03-11", "%Y-%m-%d"),
>>         ra_version=3D(0, 3, 1877),
>>         rust_version=3D(1, 78, 0),
>>     )
>>     V20251222 =3D ( ... )
>>=20
>>     def __init__(
>>         self,
>>         release_date: date,
>>         ra_version: Version,
>>         rust_version: Version,
>>     ) -> "RaVersionInfo":
>>         self.release_date =3D release_date
>>         self.ra_version =3D ra_version
>>         self.rust_version =3D rust_version
>>=20
>>     @staticmethod
>>     def default() -> "RaVersionInfo":
>>         return RaVersionInfo.V20240311
>>=20
>> At the call site, we can access each field via the dot operator. This
>> not only removes `BASELINES` and `DEFAULT_BASELINE` but also ensures
>> that we only match against valid variants, which helps reduce the chance
>> of human error. But unfortunately, `match` was introduced in Python
>> 3.10, whereas the kernel only requires Python 3.9 [1]. This means we
>> cannot leverage mypy's exhaushtiveness check yet. Perhaps I could leave
>> a TODO to remove the assertion and switch to `match` once Python 3.10 is
>> adopted.
>
> That sounds reasonable to me. You can also name the variants in a more
> semantically meaningful way like DEFAULT, SUPPORTS_XXX, etc.

Sounds good to me.

On second thought, I think we can also take advantage of mypy's static
exhaustiveness check by introducing `assert_never`. I'll send v4 and
let's see if it works for you too.

> Finally, `__init__` should return None, not Self.

Absolutely, I'll make that change.

> Thanks for working on this!

My pleasure!

Best regards,
Jesung
