Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058591;
	b=b02IcY+I6SCbTy/lZTTdOF/uKGLq28EnOJPPgd1U8SZaPCruGnCiR12yx0LgKHZGT0q3
	 4LGmErQZk0t54Rxan3FgWss9iyQVrMEIX/M/eVjFnETvnOcaKKIIzXW+wxGX4qGOueis4
	 HibgfppybIz8mLEQImhgyI55x2kCrjbQtuKWj0u1zgFlu+m/t+qJ5D8zrLrBuuzs86Slm
	 5ZUMh4lBg9TQ+17hhccw5dy41M3ujCBVBN5FfS0vsHw+JG8l0NbRhqlcOzNZzvdzp6Pf6
	 DV2UpH5NPwdyea7OJAug4bRIOQQjgAO9+cR480YwLu+l40FO8RwUFqITOAv6vqRw73Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058591;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=1gCemJ+OoIUXvLmdwnpvyyQkDg9ytHfxR6YyKzs9Mfc=;
	b=JrsoQPxghUgPpH7JBfTN9nwytz61PRHPowmv2TipbKG8pv7BJEihRCB6ks3kBIptcqaS
	 gZQHb7pPFxT2dSxEDON+9SPHdm+9IsEWDS6S19hVmLp1J+Mwa9IrMMHgq9tinqH/WBHyb
	 HSHyThIRoW+sjPxrF6VG0U3k/br2NZ6Nz9aQlGsZ6c8J8Ncq4lMbceg8wN50pqHB/0aZ8
	 mZLh7OqYC+AKLX6j7zpOpDSTLiTDeq+L5X+S9dq/SxD3y3AT+NkQG5YMEpSJtTSiqwU7/
	 yu8JsQ/8xyf5dQ2VsUiyDwWHFy+0TQdmFVeUdIobjFywCN3yvaic6tH/tDiaC4giMXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=mw0T9X9D;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BB8606A31C
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 03:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3BB8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=mw0T9X9D
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D78CD3F529
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 03:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795058588;
	bh=1gCemJ+OoIUXvLmdwnpvyyQkDg9ytHfxR6YyKzs9Mfc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To;
	b=mw0T9X9D2Q8CU+WtyJVZNE/Zwm7KrPBiUtl8ZDpAF9yxZIBJ9emJjnlRN7uNjK/VV
	 ML5dE4trEvhFcbM2rSfAiXCCP8+CmB5/zUio8uuclhm1UMSXJq8jSywePX2wc58djN
	 NCetCeWZuuLs0KU96oofL0uYnRk5rtEmLM2uFMFwv81/qnblsLjh/FTuJdroTbfCFo
	 hupZ2u0vMZjPCJA3Fqhm7hNhdfej3F3sh0TY3lasZ42f5pp754HEHL0wGt2GtlZwN4
	 HYULSEpE3TXOu/t+VEpdGIJL5OArpipE0Sv17G0B6Us2KuOLMUAL6azgsXkmtV9w+q
	 nIOTm0AHgEXQ2ABwBM4NUs4Sr8JzViIsZcA4i4G+DnK/kIvwEDDUO4rdhdX3zKaL8k
	 Hy8XON38b2TkaxWWWkqQXnE0j/NR2Q6LQzbcp8gyPgil4ua5+ToVjTd1s0e8shqxEn
	 j/CFVmDo+qjoJHnMIW1gyunYvd3Uxhe4xqKOAPCKJ0J4IBVX6y2ehSFCe6AHP1NJMP
	 ccrRgGRFBMsuRejzVvSlWQKdnfbVJA/Dyj5trLa/ieoB+I6TJJ365sDTWWRVq0faAr
	 XsAwGM9mC8APQKxHjoeAKIrSUgHtQAQy9Cab1JMv5ieneUP01ESDNVgtT3UT2YEM34
	 ZnK9MOQ2Ku2QI9NQOakJSOvI=
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9212335e257so13988276d6.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 19:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795058588; x=1795663388;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gCemJ+OoIUXvLmdwnpvyyQkDg9ytHfxR6YyKzs9Mfc=;
        b=2hLFrQAi/h1UNE8E5QIXK+h+SVHmvETkaeUsH/u1Ws9ucM+qZWL5pAakOOhvLyoi/Z
         UADOW8ZgYwKl+lUT6mjEHL49iHb6nCoTVcEBHf4LG2omfWtnMoz3+hUhJwtKZriQx5zS
         1QOYe0/OI+q9GWb0lRt4oFTK2t0GEvioLVKY2UHXXTLY2SOajoT02XgBqTjZo75squxd
         ypTzSdA7NrT71TwAWkyqcE0f7mVjxLacHMp2Uk/AIjFgCDbxlWcu3WqYPT3yzYgFEulg
         6tS3GsAHz/+A6PqjvpPYgdDyGNzEfSjUvuFL/002Cdu8yKbof2I+TSWeaXDIjvyA4rOf
         67OA==
X-Forwarded-Encrypted: i=1; AL+hErERpMmswpiUkfIOg5jm8aAb5YhRbzlGDnMS32dw4Xi+2eFTqL9thWtTl8aZoh+NW2tm97Q2WjWtN4w+j13Oug==@vger.kernel.org
X-Gm-Message-State: APuU4Z8l/mBykGMrMZLizLQR+/urPWT9ppSK1vd0yFGI1ist+pR31RrN
	sEDiri+6mn1pcTAsu1ubQmlF70hp611XpHOIH9q+WR+WPmxSfo6fK0QG5AQ9AlmxZfecF1zAuk/
	LipJNh8tqMwLPWAC5ClvkA3xXbLnFvHRk4oGiRytixlMrNUgerKrxaoJbGF0KZugkqbbLRTD6x7
	jCiTql4ubRybC8ylbBmKU=
X-Gm-Gg: AZFdTZdNb1ITL1TpDQJNv5u6V0Ozv2LMCfwemFVgtNJk6yq12s22TB6tLsnnow7dtKS
	lk60t++GMpB/6sjDLoGPl/bpJunb0rw+m4F3F/4gxm2mv3JzF+JN2u+SQtH3AAw+6ruJ57+5rY5
	WJlXPqEkXGvZCngEhKYivXYK0leBFIfRscW4UF4atxUseV8r3DgzZK9C5Ve0y6ViROvghC0RSnG
	fhzvP8PFVJOcBa5W5ScmAOlQvZSZGXy9M1G8Hr6icOXpfGdfPzEE2na4xZs5JAsGVe99x6ljstj
	TxNxtGIJc67PQ7nMnppO7g004o2mviVeJLxaThTeEZYZ9IfLHv/IJl07n2wNkHFj/4dA4VoVQSd
	anNJ7bKb2pH9J+Jh2MDZNpVqdzyjLlHgaFmTMFL5dJ3bl8tbMEP84gmPCU4AfLA==
X-Received: by 2002:a05:6214:4886:b0:921:2b3f:95e5 with SMTP id 6a1803df08f44-9212b3f9742mr4788996d6.24.1795058587638;
        Wed, 18 Nov 2026 19:23:07 -0800 (PST)
X-Received: by 2002:a05:6214:4886:b0:921:2b3f:95e5 with SMTP id 6a1803df08f44-9212b3f9742mr4788556d6.24.1795058587036;
        Wed, 18 Nov 2026 19:23:07 -0800 (PST)
Received: from localhost ([107.159.93.232])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d28215sm38265326d6.16.2026.11.18.19.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:23:06 -0800 (PST)
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
Date: Wed, 18 Nov 2026 22:23:03 -0500
Message-Id: <DMYV5T0TLKEG.1RHCZH8L40LWY@canonical.com>
Cc: <patches@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
 <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
 <lkft-triage@lists.linaro.org>, <pavel@nabladev.com>,
 <jonathanh@nvidia.com>, <f.fainelli@gmail.com>,
 <sudipm.mukherjee@gmail.com>, <rwarsow@gmx.de>, <conor@kernel.org>,
 <hargar@microsoft.com>, <broonie@kernel.org>, <achill@achill.org>,
 <sr@sladewatkins.com>, "Miguel Ojeda" <ojeda@kernel.org>, "RUST"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 7.3 0000/2651] 7.3.6-rc1 review
From: "Alice C. Munduruca" <alice.munduruca@canonical.com>
To: "Gary Guo" <gary@garyguo.net>, "Thorsten Leemhuis"
 <linux@leemhuis.info>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261118150247.972732815@linuxfoundation.org>
 <cb9ff126-7767-4c60-b735-1b7890a247fc@leemhuis.info>
 <DMYMKQ2PRN7X.WKDSQ4X8JIFB@garyguo.net>
In-Reply-To: <DMYMKQ2PRN7X.WKDSQ4X8JIFB@garyguo.net>

On Wed Nov 18, 2026 at 3:39 PM EST, Gary Guo wrote:
> On Wed Nov 18, 2026 at 7:02 PM GMT, Thorsten Leemhuis wrote:
>> On 11/18/26 15:20, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 7.3.6 release.
>>> There are 2651 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>>=20
>>> Responses should be made by Fri, 20 Nov 2026 14:55:47 +0000.
>>> Anything received after that time might be too late.
>>>=20
>>> The whole patch series can be found in one patch at:
>>> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.6=
-rc1.gz
>>> [...]
>>
>> This failed to build for me due to a problem with rust during the "make
>> bzimage" stage:
>>
>> """> error[E0432]: unresolved import `crate::util`
>>>   --> rust/pin-init/internal/src/init.rs:17:5
>>>    |
>>> 17 |     util::*,
>>>    |     ^^^^ could not find `util` in the crate root
>>>=20
>>> error[E0599]: no method named `extract_cfg_attrs` found for struct `Vec=
<Attribute>` in the current scope
>>>    --> rust/pin-init/internal/src/init.rs:171:39
>>>     |
>>> 171 |                 let cfg =3D field.attrs.extract_cfg_attrs();
>>>     |                                       ^^^^^^^^^^^^^^^^^
>>>     |
>>> help: there is a method `extract_if` with a similar name, but with diff=
erent arguments
>>>    --> library/alloc/src/vec/mod.rs:4245:4
>>>=20
>>> error[E0599]: no method named `as_ident` found for reference `&Member` =
in the current scope
>>>    --> rust/pin-init/internal/src/init.rs:413:28
>>>     |
>>> 413 |         let ident =3D member.as_ident();
>>>     |                            ^^^^^^^^ method not found in `&Member`
>>>=20
>>> error: aborting due to 3 previous errors
>>>=20
>>> Some errors have detailed explanations: E0432, E0599.
>>> For more information about an error, try `rustc --explain E0432`.
>>> make[2]: *** [rust/Makefile:649: rust/libpin_init_internal.so] Error 1
>>> make[2]: *** Waiting for unfinished jobs....
>>> make[1]: *** [/builddir/build/BUILD/kernel-7.3.6-build/kernel-7.3.6-rc1=
/linux-7.3.6-0.rc1.400.vanilla.fc45.x86_64/Makefile:1440: prepare] Error 2
>
> It looks like there's missing dependency not picked for pin-init changes.
>
> Greg, can you drop
>
>     [PATCH 7.3 0580/2651] rust: pin-init: internal: init: emit `slot` usi=
ng mixed site hygiene
>     [PATCH 7.3 0579/2651] rust: pin-init: internal: init: support tuple s=
truct constructor syntax
>     [PATCH 7.3 0578/2651] rust: pin-init: internal: init: support tuple s=
tructs in `[pin_]init!`
>
> ? While patch 0580 is a fix, pin-init is not used in a way that manifeste=
d the
> issue in 7.3, so it's simpler to just drop it and the other two picked as=
 dep of
> it.
>
> Best,
> Gary
>

Hey all,

After dropping the above patches there remain a few compilation errors with=
 LLVM=3D1. They all seem to
relate to pointers in bindings being sent across threads. I am unable to di=
agnose the issue farther
than this, as I'm just starting to dabble in rust/ so hopefully someone mor=
e experienced can track
down the patch at issue.

I've uploaded the build log alongside the config used in the pastebin links=
 below.

>>> make: *** [Makefile:256: __sub-make] Error 2
>> """
>> Full log:
>> https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/fedor=
a-rc/fedora-45-x86_64/11350094-stablerc-fedorarc-releases/builder-live.log.=
gz
>>
>> Have to run, so not time to look at where this is coming from right now,
>> sorry.
>>
>> Ciao, Thorsten

Link: https://pastebin.com/WCpUdkaC
Link: https://pastebin.com/5BUM2Cys

Sorry and best of luck,
 - Alice C. Munduruca
