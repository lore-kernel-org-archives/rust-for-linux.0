Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793654739;
	b=s0HRoSteD8MkTJR1yGZaqceLJHPMUuK04bMOezdWMZHy4hoyvn5xzt9+aMOCKB2bXHqX
	 5ayKtyzBTN+4v46KhHo4u9QOMrKbwcZPT9ZaBep6WSea44WoyO/B8Kr+c7JAh0bnQbtXM
	 lv4vNjcr1gL5QD50qItQORR3RXB0MUjDSAxB0M7vKHnr/f86NdeJ2sjqovCgLkFtcawJZ
	 e/I7QDiW04lOTfDRNJSNf4SB9Y2ydeN+UvMSwmDdj+5gU5KPpTQYnP5RwoceuS47Uh59y
	 kdwyyXynnyQQGHJT7XLEJK7oxQ+5JCwJ7u1EBvJg8xznIC5FQe+CizkB9KM2HrwHG/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G8mPrYpeVU+WShay0F9jEDsk5WNbHfAAQrL3XTdtRds=;
	b=lK/30NRh5XVWCQrWXfq3YtfSL3szrq5ZAT5btpECkgsN1m9XMFWK6RF49o5SvNjFj2NG
	 uHcbST3/kTA170Rpu2S2U+KfIU6BNh3JfomGkKco79dxUWBWfQsjM4k8x61GtN4JJU5nq
	 4ajniq6Ul3bq3Ef+iqjSsO0Mhi1wSjtH7AiAc/+SRLdcJKYK9HDK9/V3D5yi/w5RKIVUo
	 iW1YwSmXoWO3UycVFHX/Ct86APgME/oGdn6cYTJiGc6IMeKpdRHnB8dlXnlad2t7TYth4
	 7FY14KDbd6jU6Y4r6W0PLa+BaDSDb/4kaCyt3SYzgH4gPyUzk495MuXjxNXTSqsvGlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrKjcsxe;
	arc=fail smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F81606A336
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 21:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F81606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrKjcsxe
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-369fc2e984fso349273eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Nov 2026 13:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793654738; cv=none;
        d=google.com; s=arc-20260327;
        b=AI1sySNZ50rgiWtvfMEKTXCe+S0QPR3y3rrc/L/Szae7ga0zSgaBmOlOXJcYYrDJSW
         gAMultbDMDj4zDOaZ4YIWpDkNdGEUEkUAjRN86b3aQ9Iep/pl6Ky9sX/8TOduZShXgd2
         djwQFaH4SFjaRHpOtI59sSHrQy5urIzk2gVhHkcVqf/w5iZaYQsAtM3qHZiG7jz7xXXP
         UvsIpo0OIyeF20MVy2+9CDPk5mw9k7CVex8bfQ9QIO940XFEGVqSU9uS1CbZy27nNJSo
         ACSMJVWQ6v3gfGOn4BOPqHe0xk7Z0k+My2PuRX3XxPGX3IGblUucRK/69dAHC2rCVvxI
         yRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G8mPrYpeVU+WShay0F9jEDsk5WNbHfAAQrL3XTdtRds=;
        fh=+je2V5umHfGIhrN3zMUz2KpW2z6xkJY57Lw2NEHe22g=;
        b=iB3WRPWTYCCzNJLuVEmZYT2ncUVUIjIAzmWQpKQg5vuUNQ4fWIbOUuXaWwbrJG+NHm
         e/MgjuwV3uYiWxn9rcMVJxrUkqg60p0MgkfXGXFtb2/Ai2eYbLaqzFuda0X2XW20CC2a
         oCp99rtXwRov0MVeFhMb5wWpVQbqW79Gs4IGGn9MNz4Z0HVfY+BffUCa7qbS+4RWCBNv
         eq3NZwgiPK1BtKsaHiuEGEQ/5XjKFKHeB2bMvFViUjWEaD8YY920nbqCBzc4Ey75TYIW
         arQ3Ty1+QH23KEKXlffmDL2heiuq1JOUVjCXRC+GHHZZQwT5ASpAyZ4r8kB/HYrpCUyU
         VzBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793654738; x=1794259538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G8mPrYpeVU+WShay0F9jEDsk5WNbHfAAQrL3XTdtRds=;
        b=hrKjcsxemS+R7t6+BuGkaaNRQAWd9Vbo6AUynjlhrP7M0Q59P6cuafnV6pNnxgFAGb
         KB02FBvER+TpA8PD8mjUF7eeoDxUswaCTWa9ij8bXEB72p4RWBNgNvg6rg3zhZy0Vx5Y
         NJDCYA7/soH/rr4G/01TLLkAsxX1ukCI6ZePr0Jo1wNBXWCMKfGOVsOhBqZ9pChaqF37
         wlRVwFP6+PsZH4brKF+ul9RXA6rThMgXO2L1LsfmaJhTEql47gogIQnZid1JQ847hSLu
         4aSmGkmYWJfGzY/3w5xVZQxROOLTYJqrO2uX5eAafjMB5Vs+olIHC52xToxgmuC8fWRc
         YqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654738; x=1794259538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8mPrYpeVU+WShay0F9jEDsk5WNbHfAAQrL3XTdtRds=;
        b=vOkkgVwenI+6j4E4uNLUNVX+L8DNVwuZN3iPi4520vD+3RymGEXgglxuXkr84yrGOT
         e57zDpkvyjDefZbfPiKNgavxQBtdCF/5fnYRWiys3fLqz8hBsTeBcOIiG2ueBas0/85s
         f4sBuF12H/IO+d1AmCO4miIlknTbRK1afNweL0DwAJmZqZPFWet2Q/iNIJTTr2V0gXaB
         bP6ZxhNlfyMaopifIOPW/nkD8Ng9+S68r94fhqco5xbc7MwJJnM0hfst81bSZnLYX9Bm
         lb/cn8aU7dtUw6L7qxY/ohK08DXdv9AymgsRUgGgVRjvqwepG/A29+Gwr7ELwaCXq4pn
         t7xA==
X-Forwarded-Encrypted: i=1; AKwUvBwEmZjFtri4HjapkO3Mms81bWkJRxVe4hxpxyyaliV3ZoWhiFsSzgrK5+86OFRbsYjTxFZWazhCixgt5mpphQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z95UYhWdclHde3xH6ykv4whHW6ZmxAADdYmNFX2I5EnR3D5mGyw
	PNk5P7LiKxRUfRuAOq1YvX3moKr8H1Z6tYXhB7Rld5zAIdEyeDS4PucI3vWkV++ZJYADsmAARuM
	uIvI32N0hI8Q7oxGZIPzCG8o3UdestG4=
X-Gm-Gg: AYBFou0dJ0LKWUZrLz575WjaV3rpKPi2tWFofb7v6TVPCZCKLlmjcTXUCq5h7Mv2te5
	X0MQ3c6IeR7dHcXzzEl3mkPz9JBGsYjzbGD9yJHUvOHwOopWTOYDqvrrdB0tVAtg2kYTCbJPbgZ
	rF30kwMV+g52ReuacRDAiLR5CuSoE4sG5s3uMxUdzap14+vFzOBBbMvH8HGWzIVnT7d7zZgBWlr
	JQpBXoB3sCv9ieGTkCw1mrAxhi5As7Ffit4ODkJp30iuS3fhcjO2emfqbyZj1WET6XA6kNTdkN8
	lt50nAdsbmWUM7pbB9mMP6qEluebIrW5O/IO4ufqhC+WgM/uHvwgu170ODDtiL+xoaDg/nOXn3F
	1jIfOhthk2PotkYz/kEoaUzsZIdkrAiESaYckCCWxasd5ui2cE7rpKrXcjOETt07Z2N851jRp01
	I/vmuhchX7iClC8tgTGoRzh8rm4fyEWfhgpQmUFReErzeJUNBXOeFommyr1jd7iK/RySzZhojtw
	tu/lQQtKfNBcX2GfbIPVbXRkOBqBvPas5Go
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr22873570eec.2.1793654738038; Mon, 02 Nov 2026
 13:25:38 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com> <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
 <CANiq72n3YfMpWndR06B0s1Mj_PjAR8MJ+0nP4XXPkaFh3zX7pA@mail.gmail.com> <DML0UIHJNE2R.3JDG4HTEN6U0S@gmail.com>
In-Reply-To: <DML0UIHJNE2R.3JDG4HTEN6U0S@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 22:25:25 +0100
X-Gm-Features: AclHuK9dhZ8ASIbeBndwVm6xD67vsmWuidG-t9qUn_gDwZivwLzke0us5vCUJEk
Message-ID: <CANiq72nVDshaUDKzLKsa-4kB13XvrB1-f-WaVkBecf-B45m=ag@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, 
	David Gow <david@davidgow.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 9:53=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> I first thought of disabling `#[should_panic]` tests by directly
> checking the conditions in the macro code. I ended up creating a new
> config because I thought it would be cleaner codewise, if a new
> constraint arises in the future, we just have to add it to the
> `depends on` clause instead of modifying the macro code.

It depends on what we want: if it is meant to be configurable, then it
should be a visible Kconfig symbol; if not, then it should remain an
implementation detail (which could perhaps be a non-visible Kconfig
symbol).

> Yes! they are pretty similar, for `KUNIT_FAULT_TEST`:

Yeah, in that case, I think a new visible Kconfig symbol may be
justifiable -- please see below.

> The only one that is different in `RUST_KUNIT_TESTS` is:
>
> #[test]
> #[should_panic]
> fn rust_test_assert_false_success_with_should_panic() {
>     assert!(false)
> }

I guess it is reasonable to expect this test to pass, since `assert!`
doesn't return and actually panics in normal Rust.

Having said that, I would expect our `should_panic` tests to be
generally about non-`assert*!` panics.

> On top of the reasons I gave above, I tried to follow the same as
> `CONFIG_RUST_BUG_KUNIT_TEST` or `CONFIG_KUNIT_FAULT_TEST` are doing, but
> in this case in particular, the config is not for enabling a test suite
> but for enabling a feature that can affect multiple suites (in this
> patch series the ones behind `CONFIG_RUST_KUNIT_TESTS` and
> `CONFIG_RUST_BITMAP_KUNIT_TESTS`).

Yeah, it is a "mode" -- that is why originally I thought we would try
to just do the right thing automatically, i.e. enable them when
possible, but then when I saw the description of
`CONFIG_KUNIT_FAULT_TEST`:

    Enables fault handling tests for the KUnit framework. These tests may
    trigger a kernel BUG(), and the associated stack trace, even when they
    pass. If this conflicts with your test infrastrcture (or is confusing
    or annoying), they can be disabled by setting this to N.

and I thought it may be fair to have the Kconfig symbol, i.e. it could
also be annoying to see the traces or similar, and thus it may be that
someone needs to disable this.

Having said that, if nobody has asked, we could keep it simple for now
as well -- that may be fine too.

David: what do you think? Is it something that was discussed back then
for that one in C?

Cheers,
Miguel
