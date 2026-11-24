Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510231;
	b=cPkAHAdCCWpUEdr/0LrWZwvxit9e7Wi5dIjhhnI8XL9FjOQTK3aYKxf/rtQI5Lp7oE1t
	 rhU+F1fY5bwHfbeWkhfgtQSuDlDwzDs5/fFp1h9g/MiNuAPSBkI4ssWtcEMhmELDKxkcm
	 QTP4Cx09GQR0hO2PabyIMcVm1ZF8nMOIkm3Nmt3rC0cECtFonI0REB9FQC/ZltGtN8kIc
	 xz0oZ4d4RrHnAOPWRxJp+GsAOvAbcJtmB/ji8XPBvxdJzBGi5Ln38CQKvGkf4Sl7eRMmq
	 f9doKAfS3JXUsMQR7/YWQ4PJONuE/HUpOta74JBljOfKvkBEmGlFVeS1OqsLURmEE5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Correlation-ID;
	bh=Ytx/MmCKq4L7Gfy8rXv0iAOzT1xtWn9s97+5u9XXrhk=;
	b=CjRrukUmnHEOWF7lyZnSumaAlD/LvmqAjMEPXzC+Wb2JmSpnYd+AsArNT0mLO8mm6Uwn
	 zwj5XR7N4T8CYRdMDqLwj5AqBnErEpmOFpigrrUx0s8/6+9ulH9KCHzMvZzFr0ZZYpewL
	 XsWVlYGd5SpMVXBPcVPw1Z4d6UhPrWxwizbPxCqvPRROksWhHNvT9phtgMO2Z4ZquJ1nq
	 zmQTzrjzFvKlYup6V2fgOnwcOBkjO3bx+9wb5BNPwGDcHZj3Z7UAI/eGnLgRBDVPHHand
	 CbMT6lfXVWqN6cpRVR23gCxxkhfUpw2lFFSyJqcQkt+Sfrb3nXgAjq8l+lOXh7S3JOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwghTiG1;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA008606A322
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 08:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA008606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwghTiG1
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f046b0adc0so21894215ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 00:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795510230; x=1796115030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ytx/MmCKq4L7Gfy8rXv0iAOzT1xtWn9s97+5u9XXrhk=;
        b=IwghTiG1toayCj+xAgXK+k7p1cSV2MCa+Uh7VOhYwrBfMiEnGgj4R1SOZ2YePkWuTc
         MbW1zL6qvozZ64o0mUz1nYj+fb14MAiqrC27FUOBPpI/cUTF5OuDKxqIYzyYeLKzRREt
         2kCkUzFyn/3v28hWN2TK14tfcvCwIa7S4V2IIz0+wQC4TBQBDmsermQN4UJcrx6rvmNn
         3/8EAkX6z6f/OcFNpD6sl61nEAfMG+Cn7o3TLFbJSysmk5yloxbhfyhRTOtKJworbsI2
         kSzvraXhHu9f5uQpVccYhvXqnpMImKthFTZhjpLF8YOFlrn9HJvNREJIS4dgqHA0ZxQS
         k6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510230; x=1796115030;
        h=content-transfer-encoding:mime-version:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ytx/MmCKq4L7Gfy8rXv0iAOzT1xtWn9s97+5u9XXrhk=;
        b=zSCi19yD7BNXnfTjwJ86OGL3GjrZPElOAlYt39onLXHJ8hbuNmx1sTtflW7DN75TQ1
         J7XMt/+8IoUF7uU9du5j7Mf0IjfJnkorzCi4bOOnAKurcRFv9XsTg6QTKpzUifuD3rWr
         K+UkhvGk7fNhRn8ElF5zP7fQ1BFuY+bnRbM2gczRXQT51KhUH79HHCM28fD1C04bxHXL
         Hd4+onDFCgrwVE+hxBbdUaUwCMSbQdR173sLvJEL4ga/uPge0Is5vInH5sout6OuQebh
         zEsv+bmxXDSkfGzutn0S1fRHYKzpOoNSUbmwSt5b59ss5NBCbqZLjy23zTeYrc8xKikv
         T25g==
X-Forwarded-Encrypted: i=1; AL+hErFbxH6XgXhOXlP4XKMPf5+c8Ux91PwRjGDKekgv1oRVIzuejnuNdrHMD4z3ZSVzATh37rbDTTBwb82o7ryIXQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/OlQ0EyTC+G+3wXaWJVievHIE43IedYF4AO5B42SSnB1IRkse
	R1kIERaF3bX6C3UyMuXCP6j/fwVyTMbmFEzHWa0XL2paDXG2Fnx2hzir
X-Gm-Gg: AZFdTZdEHizaq9a8kwOAkMXvHXOweweuFQdQpBUqJv+PZqe97gGC0h0JAAQsDUnzB/V
	j/Cc+/xIKVNYcq/OO2Mh6ZOVON0G312MERGGTERtqSOFwIzVmPjZ2mS58OkdlFJ0LnPdqXV7vdM
	MMXzAOcEnC9vlJ95dSDRQy2+scINTTnkhRh/3HqtnzSJahFTvrNSlHo2Fh8f+TTNTHHkEIF9Lkk
	M4zWRymghgIMBGPVoCDRPjBcySuZO4vRfZV6S9NSqR7lZ5X9j+90aPhySP6FZD08ECxIy5cJYsa
	s1u8F7qsr8Pr8Jh2KVLAYBaJo4LKhUcFGLO5/q1R6QtsoknV/q+gdh8On1YfH/G2Cnxl8G5qIFn
	P1rGY+Fi35Gfqa0TUhgn2Fzxct5iUPM33duYb8MGVnJ4PAjwdWZkqgCzhsGT65Iqzyyk0ZsK/Ah
	It1/g56aukrDa6jcFF29ms05k+NCZnoIRacGgpMGeHDWn6UMKOzXpi0mCcyoL1bijDpgMP9bBzX
	cfzwCd1DwZ3PPTC3ajp8c3NpavoGfkonFkHeR4T5elK6L32UK53wZai9txqbgaMgGr3kjC15FqA
	6SPGl96OG6rJ7uMVrph0te260A==
X-Received: by 2002:a17:902:d54f:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2f03f118afdmr122301645ad.12.1795510229878;
        Tue, 24 Nov 2026 00:50:29 -0800 (PST)
Received: from localhost ([2001:8004:1ee0:986a:826:47b4:7374:22bb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f146b84sm65630815ad.71.2026.11.24.00.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:50:29 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 16:50:16 +0800
Message-Id: <DN3B92I0MGTB.BJYABJ1HG9XS@gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: clevo-laptop: add minimal WMI driver
 skeleton and Kbuild plumbing
From: "Nick Dowsett" <nick42d@gmail.com>
To: "Werner Sembach" <wse@tuxedocomputers.com>, <nick42d@gmail.com>, "Hans
 de Goede" <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: "Armin Wolf" <W_Armin@gmx.de>, <linux-kernel@vger.kernel.org>,
 <platform-driver-x86@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
In-Reply-To: <b5f96ec9-ee4c-44c8-8451-9f40bed43290@tuxedocomputers.com>
References: <20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.com>
 <20261122-clevo-laptop-v1-1-881debf4d4b0@gmail.com>
 <b5f96ec9-ee4c-44c8-8451-9f40bed43290@tuxedocomputers.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <DN30VXQ0GPTS.KZ91F75HTGGQ@gmail.com>

On Mon Nov 23, 2026 at 10:12 PM AWST, Werner Sembach wrote:
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 9ce384e0475e..18aa4550c9f4 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -1059,6 +1059,23 @@ config OXP_EC
>> =C2=A0
>> =C2=A0 source "drivers/platform/x86/tuxedo/Kconfig"
>> =C2=A0
>> +config CLEVO_LAPTOP
>> +=C2=A0=C2=A0 tristate "Clevo Laptop Platform Driver"
>> +=C2=A0=C2=A0 depends on RUST
>> +=C2=A0=C2=A0 depends on ACPI_WMI=3Dy
>> +=C2=A0=C2=A0 depends on DMI
>> +=C2=A0=C2=A0 depends on LEDS_CLASS
>> +=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0 This driver provides platform support for Clev=
o barebones and
>> +=C2=A0=C2=A0=C2=A0=C2=A0 rebranded laptops (Tuxedo, Metabox, Sager, XMG=
, etc.).
>> +=C2=A0=C2=A0=C2=A0=C2=A0 Currently only Clevo NLx0AU boards (e.g. Metab=
ox Edge NL57AU)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 with a 5-step white keyboard backlight are sup=
ported over WMI.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 It is intended to be extended with additional =
Clevo models and
>> +=C2=A0=C2=A0=C2=A0=C2=A0 EC features over time.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 To compile this driver as a module, choose M h=
ere: the module
>> +=C2=A0=C2=A0=C2=A0=C2=A0 will be called clevo-laptop.
>> +
>=20
> TUXEDO is officially all caps.
>=20
> Technically all clevo barebones are rebranded and it is sometimes more th=
en just
> rebranding.
>=20
> Maybe just drop everything behind the "and".

No concerns from my side, happy to amend this in v2. Please have a think
also about how you would like code license attributed to TUXEDO.

>> +impl kernel::InPlaceModule for ClevoLaptopModule {
>> +=C2=A0=C2=A0=C2=A0 fn init(module: &'static ThisModule) -> impl PinInit=
<Self, Error> {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin_init::pin_init_scope(mov=
e || {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if d=
mi::get_system_info(dmi::Field::BoardName)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .is_none_or(|board| !SUPPORTED_BOARDS.contains(&board=
))
>=20
> We most likely need more complex matching here in the future.
>=20
> Is dmi_system_id table matching available in rust for the linux kernel?

Not currently, but I believe this would be a relatively straightforward
binding to write if needed, or it may even be idiomatic to write the
complex matching directly in this driver since Rust makes iteration
and string matching simpler. I'd consider this out-of-scope for the MVP
unless you have some other tested boards with the same requirements as
the NLx0AU.

Cheers Nick
