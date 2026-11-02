Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631500;
	b=ghangsparCCRENfauayGd2Y73WO8mu8TC+gVmNl5HJKpPOTugtaQVs4b2WDormoj2J8l
	 dpfEFbXbvj69cBb9v86Dh3/4g4sjIZhzybRKwEX9FmZKhuTxXmNvnWKfROuQ7D6mVn4Ko
	 Nh9r2r+V5TIgKCuXNGJs09UoXskOISKQYsu3t9M1SPGIcuZDsfuEYv3OUzqEEVnu+Vivs
	 8xKwV4sW9/e5UvZeUbaHbDsOhdedeKTz1AxJwsWq23bYQUvnQeEoIjOzLdOAMXZpdQvpf
	 im7Wpott9ZHjTKLVJrZV67q0CDVZ1YBx7PkOLdaHoj22HGGtV7QurW9/qsBI3rkWARg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=p6saGje44sOd9IVlSUbpbD3i/Gf15gvuNPhaoK8DjVU=;
	b=xF71JzTrkQ2JD2u8EM09SDXsaJQ2qcEP93/LYp6NYNzkKcQlVZxs57AzUSf30Q+ho4Cy
	 u0djJ054Cg8frseFKKeWXqkD6+9C53mqVc+p3OzdOE5IoNByr1WLtElMReNEmH8h3Kd7p
	 EXetZrYyAs7Gjae6H4YEWOhfxfJY98EdbLHWw1Zs+BYGsoHO45HzMdceZF6+xyzhLRDt6
	 QnCBxyg8FraHJugXE+a/ec4DVUxLNI1UeDyXqu5+xg748qexxScRXmthSkdpv78MFpGjK
	 owPJtNbW807JVn2g59sWsxlITuQgDb4K/DmiZ5dGc5SnR8uZR6DGKZXZXEikrbODI4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7TNQmEt;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A2C606FB5C
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 14:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1A2C606FB5C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7TNQmEt
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so4681560eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Nov 2026 06:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631499; x=1794236299; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p6saGje44sOd9IVlSUbpbD3i/Gf15gvuNPhaoK8DjVU=;
        b=A7TNQmEtRhSGmI+/kljCE0Gf4gfBJHEXFtpbChpK1os5kr5tgYhjV+owLFr3lxH8Cl
         ccE8XMbOJoiUuY7e5Yjkc2+Dxpku9mV+tl255IkMZfvrrbw1S4XZr+GEshcP1SgVuJlX
         hxR8HudvVUygZv7ZszkctSoeyEcH1yC5lYWLIOiP5GLlYgTB90kg1Cx3PUkN1nVkhhMG
         Y/Bm72LV7J/NZyre2Nzisx0wk1LzHo2wi0DyxJE9CURZoU8cYI4W/ECQ+ZQAtofypAh9
         SNT3pEAqIVGV3ITZxyIjtB+WE2fLlhHCrd/UAKuPBIQjvdTNNGMpBbV8CGl+oECIvuV7
         ICNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631499; x=1794236299;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6saGje44sOd9IVlSUbpbD3i/Gf15gvuNPhaoK8DjVU=;
        b=yKwwyBUfSg6RKEv26tUKjstlA5vQZs+WwvUKK7mhuNLHryZ61aygD2Nb2KjP8hxkHO
         G3apgKDH6jyPK1GIcd4Zc4tR8rMW8pIbEJOccQsIw2L2mJZUPuDSOujzA0sVvPEFgEiG
         TUu9HwDq0Ryou512bteWmjOXexLJv1Fbjl0G60FODV1GrHcUF5dxLMaDHkHOVTDwXTkv
         ZpQdAFTFvW0/J+URmNYhdEjiLYVS7UYwPF0wYRRUesT3O5l9KXw2az5H7VpdYjRzU9JH
         AG/PdrS9A56zci18ogIPMjZzfJMwB6HVxz23yeCPynxHxQsVzQSQsMnZeTIWyfTazJRT
         U98Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7gtHNhH2w0lGGSjPrPz5xM4m7boNnNvBJB3nNaAmSAc8PEHJpiHD6YfOr0f2Best79HL+xGGfbpeEIXd2vA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/HkNYxxY4QwmFkLibfU29VEomfPorb7V+nPEWseiy9/rxS6XoH
	5VvSBgzJYntDC0iQ6DibvnA8ByBbbSmKrSdxsHRhUA+7mBN8VcVyZ1k=
X-Gm-Gg: AYBFou1ykBOmFD9+NSNCoTL3Fx8Txi/7zCfleIxiPufZyaJFDQAtac60ptmKIcpABN+
	3MT49DlVcZTSsLCALyXoKXcxKnsp4Yt58PRIRikk3M7S1/Tbn0cPEAs9GxET2zv55F6MO/tbszZ
	AxD2YCpB8f0gkqEy02MxyYHBPNW3fc2mGxG6HzGzefDXLBh2V2/Mufkv6V2c5O6Ymknxxg+8iEu
	wgh6pqOifBTb8V93EQkEcWKk5nSBbL29Zk880NxabHistFEpPBb18o8P7gokHIxHlI0WhKkWSqL
	3v60v3k1aa5xvwD9KqYWDNohvJmJxsUSjW5h0+iW35pJ5MN+1XRVwP73czaQXgPH4MJo46Je8u9
	PcChok/5oLGKbKo/0BKDL9XO68xwldCdPMSDfmL+wOECs5H8lpLQk9CwpBwQn02szFG583MwfEN
	gZshxSqwB/3U8nQ3kmNT44FgiSEEQHlQ/AJyj/sqmuBd7ml35n/fL/7Zt2RBhvI7ccTxU5WjQ1D
	w5+A+d1PBOTKYxktRuHHqaeLg8H9B/xlVCvEvUJYVj6iE/yCWj78yMzSGXs+V03eaLraA9vpiAX
	nZ9QCfTTvbe5w8+xwhght5vve5rKzpGrB+6U5Ak+ka38rYvTrZR+Y1wY1G91lPmj
X-Received: by 2002:a05:7300:fe41:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36a42401960mr16137115eec.7.1793631498925;
        Mon, 02 Nov 2026 06:58:18 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm42424368eec.29.2026.11.02.06.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:58:17 -0800 (PST)
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
Date: Mon, 02 Nov 2026 11:58:11 -0300
Message-Id: <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: <nico.antinori.7@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Benno
 Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Brendan
 Higgins" <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Gow" <david@davidgow.net>, "Gary Guo" <gary@garyguo.net>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>

On Thu Oct 29, 2026 at 1:59 PM -03, Nicol=C3=A1s Antinori via B4 Relay wrot=
e:
> From: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>
> KUnit tests in Rust are written using user-space like syntax. This patch
> adds support for the `#[should_panic]` attribute, enabling the user to
> test conditions that are expected to cause a panic and report the test
> as successful.
>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Hello, Sashiko found two issues [1] with this patch:

> [Severity: High]
> Will these new selftests crash the kernel or hang when
> CONFIG_RUST_KUNIT_SELFTEST is enabled under CONFIG_UML=3Dy,
> CONFIG_PANIC_ON_OOPS=3Dy, or CONFIG_BUG=3Dn?

This is true, I tested this with:

./tools/testing/kunit/kunit.py run \
	--make_options LLVM=3D1 \
	--kconfig_add CONFIG_RUST=3Dy \
	--kconfig_add CONFIG_RUST_KUNIT_TESTS=3Dy \
	--kconfig_add CONFIG_KUNIT=3Dy \
	--kconfig_add CONFIG_UML=3Dy \
	--arch=3Dum rust_kernel_kunit

./tools/testing/kunit/kunit.py run \
	--make_options LLVM=3D1 \
	--kconfig_add CONFIG_RUST=3Dy \
	--kconfig_add CONFIG_RUST_KUNIT_TESTS=3Dy \
	--kconfig_add CONFIG_KUNIT=3Dy \
	--kconfig_add CONFIG_PANIC_ON_OOPS=3Dy \
	--arch=3Dx86_64 rust_kernel_kunit

And some other configs using the configs causing problems.

To solve this I created a new config "RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE"
that depends on !UML && !PANIC_ON_OOPS && BUG. If the test is annotated
with `#[should_panic]` and CONFIG_RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE=3Dn,
the test won't run and won't show up in the summary.

> [Severity: Medium]
> Does defining macro_rules! assert and macro_rules! assert_eq at module sc=
ope
> in kunit_tests() leak the preceding test's #should_panic value into helpe=
r
> functions or impl blocks defined later in the module?

This is also true, the solution was redefining the `assert!` and
`assert_eq!` macros inside the function's body (as Sashiko suggested).

I'll wait a bit in case there are any feedback on the current series and
send a v3 with these changes.=20

Best Regards,
Nicol=C3=A1s=20

[1] https://sashiko.dev/#/patchset/20261029-rust_kunit_v6_send-v2-0-5ce551e=
fc48e@gmail.com?part=3D1
