Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318656;
	b=OHwS65+hOx0ScV/JO/5jL0z6xCtQsAKTPBmF3wcJsYj3TFwQ6eZwAHuFV3+eml0onFVo
	 oweelFYKZ/kxTOAHwy395T8e7CgJqNIngkjlR4AaSs7KWJHwBR+Awpd9GXZLC/nwXmtLZ
	 bkopPFVUF0hK8fNEt3lTyX9TR2VhqDbpaQT/QfnG51YzI3SvMr50vFH9SI5Nu2NuTZFCc
	 MUxwJAFDWGsfzMrQwyIBoioTf6AZ7wqgUQwgRAxlMmDRE0hVGhBJFXEZIxvJXpGNBAHdD
	 aCEx2ip8Ql5D9EZPVi/Yty4nOta3Ab0xc4bAR4rztytiB6G4cIFzczvMVrdM08ANJMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=1NYWU2IFMFcOZ4Xu65TWye0KHFmImuRiCo78dAp2MRY=;
	b=FLSr7F6oJcmg/Qma/716WcGOs5g08doUTdVpTlKlszQ+q471wxS8WhKY+pSTfbwpH+OU
	 5v9qLC0Ua0tTlTFJS70+5MLTcDhqwLhJLKF7HLn3E1xIqI6W5uJQYy8seHQ0ZONPrpXps
	 +aNcSKqPJqcWMORex4VAmgUvo7xOPACsXz5iggP1DFzNSfChM94qgsCjJx1ACnovq9ffT
	 F8KIdXOaLX3V0lX+DAPcv3WMigls6M3UIYWyK0K6/R/kuRNqT8hXMZDg04k781kSFGRAe
	 3FOhEoKXsQ3qUAHxhQ/+MFXKSkYYU2hWGhq6Ops1/WAm1PfpzRLNKl4NWM9kmrugNhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgZQ2PXP;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D773606A338
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 13:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D773606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgZQ2PXP
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso28049907b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 05:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318655; x=1794923455; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1NYWU2IFMFcOZ4Xu65TWye0KHFmImuRiCo78dAp2MRY=;
        b=rgZQ2PXPVrNCfsW0OegwCsJKX6gwPzauztRbfGffPyiPzuH9sgNOFZHbjQ2TPU7xHd
         HXnhXa/CInh3orIlh1j5T3FgG2yaY7i98dX3Z7aMte6sQntvLmkfWSYp2NqcP0OyOr6R
         TU9q1AQwcelJn8HWOdT4V7fFrlBU6HOe+3Wxd2xifEaQvyl9uPYjW/6QJ104kynOpVAC
         MuaW1ze5Xm7AU8GcgMXlK03ajGzPmnmXwZFSm0LBLQ856DiezSuINQxgnr8z8jbwnzHo
         t36Yv0MGurTmPRlXEZZ1A1ASMmOLgWgTxPCgLHQi8kg2IO5j2qJUw7XFZhm7N4s8aVtb
         kYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318655; x=1794923455;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NYWU2IFMFcOZ4Xu65TWye0KHFmImuRiCo78dAp2MRY=;
        b=npqJZerwPCjgR15lIcGl0CiDeh9C4p1Dwt6wfbR53SyPG0aVhodxlflD392NFRMyGd
         opoF9XQO9ZwFUTC+gvMK8du8ddgr2yuKbGhxrqj9ut0daPTa7RgXHu7eOmrGosEXjl/8
         yaWYoJ3LUlt6h15XAGDg6q15LxN9WFE3amsyB6vUhHLWz/ndX5fSjr3wQ0hCt9gbYlKZ
         kj8RJd3/Ksr1PCwYLnDjUfvhkiRVO+WvvE2C5DXVoBL+y8h9UXRw8s/rnh6GhAvTJAFs
         TaLsef6dcY2wnSUy254d9aSZaWxxKSStOn2f6vDfQ61UY/qpeOMCpsGNw8HuV3lTJtTA
         iPxA==
X-Forwarded-Encrypted: i=1; AL+hErE33or+XAZlmImXqFBkrshdneRKx9FpVTHMU81xJugG+WuFJZaz2r9qL1mhhFbj5KB+MrOE/8uAnB875h2wFA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Tvt2yCGYXFlTAz9cpdtTxi1ApZwo1DBg33TbxOEs9tloYBUUP
	Yj5MVpimMWqqtOZva+rx344TKdgjEGZGRQQ63HH7/vqAOyaD10y1IX8=
X-Gm-Gg: AYBFou0CQgM25BFurs4D51vzVm6Ai5VAJKzHxtC4AositXkjLOKg/1XhA5JecVX1MA9
	65h3E6VRvtZ1t+/pUimgkCXKYRurlaM5cYVcTXzAt4mvqiAabwtowviPndZqHoUN9mfJaRm+IJp
	X7cFnDRQYV5QqTAyXyhauvPA9qJwBJbQ3fRuOVHLA+CL8OFWTvX9FciEL8DViEoPKmA4/qOStL2
	B5IGNw3BemXhoXWE06S5+z6pYL2v3+M/w1thkn8omkfJSpWrzD/qxbJRv1QF6etRk5Pj0ByIgzh
	HiSWGX9x0hXOtlqjXueiDieqdF60Efx6hqxQs74g03xDdJQaqpgsPvtiW6T+7CuALwD2gJmdT7y
	X/i8oxTQHI4RztCGZq3tSsoKnoHZTmj+EDGhPrzbMYstszItT9j2CTWaRdLR2oosVPYoX6e+bU9
	Dngm1bxAq+9X8wetsSYBMHIv2/kiyK9XSctyzJhq1PUCsZxZM4fcOezpcY6hqolXaAoOiG5QMn9
	tVsKd3RyLKgSYQsxI37FWVTo4XExu3RkBTwz9Y4C0Hdi30ERld3VGI4lSitK5VNAH2txwunanUP
	iBzA8seObeMT4BRFTlJUNkJf4g7cRc3SWrmq5nw5wlNh+xQH14wUloA1zaSSzzA/
X-Received: by 2002:a05:690e:1306:b0:67c:332f:3fd8 with SMTP id 956f58d0204a3-67c565f716cmr1597436d50.5.1794318655428;
        Tue, 10 Nov 2026 05:50:55 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39324bf84sm19649867b3.3.2026.11.10.05.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:50:54 -0800 (PST)
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
Date: Tue, 10 Nov 2026 10:50:49 -0300
Message-Id: <DMRKVJYRSG2B.2LT5AVK5FQ52G@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Benno Lossin" <lossin@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Gow" <david@davidgow.net>, "Gary Guo" <gary@garyguo.net>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment
 owned_bitmap_out_of_bounds panic case
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
 <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>
In-Reply-To: <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>

On Sun Nov 8, 2026 at 4:59 PM -03, Miguel Ojeda wrote:
> On Thu, Oct 29, 2026 at 5:59=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Rela=
y
> <devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>>
>> -    #[test]
>>      #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
>> +    #[test]
>
> Is this one done to match the other? If so, please mention it in the
> commit message, and consider whether the last test in the file should
> also be changed then.

Yes! it was to match the other one. Since there are more tests the other
way (#[test] on top) I can change the one I am uncommenting! (kunit.rs
have also the #[test] attributes on top where a #[cfg(..)] is present).

>
> (We could do it in a separate, previous commit, but that is nit :)
>
>>          let mut b =3D BitmapVec::new(128, GFP_KERNEL)?;
>> -
>>          b.set_bit(2048);
>
> Spurious change?

It was on purpose, I thought it looked tidier separating it (but it is
just personal taste :P, gonna revert this in the v3)

>
>> +    #[should_panic]
>
> It is great to have this, thanks! :)
>
> Cheers,
> Miguel

