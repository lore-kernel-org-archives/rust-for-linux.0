Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886402;
	b=ct+ivHsK5EmoGhUfjYOIr83/3KR3TuKybm6ch6Yz9YldmtuPDyyUL1I3nhglfxjZ4+Gk
	 cf1Cgdb9T58mmBNPDp1QQS+WeJJzxE5iS3wZIFleMghJzS4h9/A5a4qpGPOFJviFWUJ/m
	 KhkHAt6DtgAeiSK5uHBwgQA1nal9Es4Iif5XpWHnRFuQWHUtpRBpfPOmUtlme88lx4A/D
	 8hr3InzWs760JLUsepY10BqOpxDiI0EUqL5wktZxQwTuiqGb4BoSyT0XetUsu9Ys7Lc6/
	 dl7I5l9O7XGITuJ5KEVeObCgS8kKs8VO4ZCB+UqcScGdETyC/Xcs/aKQN+GE4wVp1mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=/vPSGzrcpdRS3fICM7ap8IknGi3mQqqFBaTOgviuKOc=;
	b=Gx8Yht6Hanr31xY1shMVo+pGbUEiMqQl8+5lPFq+utZtMWNX9KNKRWIhWYpBEPuscs2U
	 w8iktCAowO4bJCCEwNqh0Qcrik+n1HcTL/Aj97PtaRYfDfFQDXXpcENtaTmJ3Zg/jyPJf
	 riPxCu/8sv8vbe/Scg+yX85y9Tt/7z/w168NUlEWKL5lafiE2rNy9yjZSXlyc7UdFXnAW
	 rZFM1zD57ldJz4dpivf9hjDYVaDfz5NKGRfXZJ3pCUnqBuG8+g3FudsBm3uCzSl/9J8eK
	 4dSC8LxKy8Es50kKLEFa1X3MXzJr40C1rF2y0GTm1btpyQvjBFS5rl2sAmHczMbeH+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH+RVuwx;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDC6606A32D
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 13:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCDC6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH+RVuwx
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e977109392so11364855ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886401; x=1794491201; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vPSGzrcpdRS3fICM7ap8IknGi3mQqqFBaTOgviuKOc=;
        b=IH+RVuwxIGYS+ptSubw3zVuKvxCYD5OLNL1eP0s4El01U4kCzmI0TYmQmuDZAe4xMM
         f2d35D08HOFyL+mRi6TnLDpLiuXbPGwdZ++KWgxANFGtdG+EinywYtq5FhY66LVupRUX
         Y6gL44mwhnIgJ+5T9cV8DQc3YFppkRcKIiAglBePWlab+gM9AUYg5ewyu4sQ4DFHidcK
         EQLpsRq64uaKaDg8jJ88xiFX74Q3oxcxrIst5wUI3JDf+rbXxnicXd5dEr9pIzLaTFPJ
         xt/TjL6jB3JmrH4BXyGqEDZewz1nAjoh/JTHKSWdyOeGBcYH1zKV+ojfP4pQ7Hjhjt+p
         AdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886401; x=1794491201;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vPSGzrcpdRS3fICM7ap8IknGi3mQqqFBaTOgviuKOc=;
        b=1MxiP0efiAW/UqBo0wWk9YlUwlku7akKBvuyXfYzeMJtr/xSZLlg48mvTvr54ESOSU
         x671u/S5d7VTpfu5LZORl+En3yrGEglgxDcqBlilqMAtVof0KbnXW9vvJB0FYCLLsrXB
         GVa3TbL/+Kfh6EBm+pqv1RdSwOgmxRTPXaXs8qdeArBJ0UspTS/Mp5W3Sz4XqggUISJ1
         dubGgEbiuvl5n/n6lwnlRh4K7mgnN3UhZ1/ChPz+RsX8e+jWAq0qt5GZONZb8sSSZlFb
         uxe1MM31pRxUSDzNttQecXJIBVlj/hJb3gGCXBYZQ8+hyvbtaJNyRNVJO0DGFpsqsQNk
         wcQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4wphDm5a19BJ49J4iQO26+nLWAcONvInxCyhzfuMaEYJ1O3xQCyMbmObzR0ojqTA9SXQ1zKnMBnJ7MWCwhQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fl/GdrmVNRiOJlYp+fMYEe5UmqVSQqftoUb9qVrqDzv1tdFl+
	AciaU3IjQVrcCbHGvjv2QrDKKOqViH42Vmu3NsigYKrSgrsI2VsP83U=
X-Gm-Gg: AYBFou2j911Q4ihmmeQp9/1FA0upy6ye9LKWyNgeeFHJ5BM7Uno62NWEAv/mtiHVGgI
	eu2TJpXOx2EHhKCiBMBKzVRlcMcSjNtox+qgftP9HHP4XjZz3kz4g86QmRSqp8JdNoJDtiyUTr1
	i0snxkuFWnjxVh/eViJo+7C79flcfpUbJY11iaB5kIR0ONoxkPW7NHZngk5WtZBYD45ZgegF/Cx
	IJJuMQIqyjn244Pac3wlLTgKuXObABjiay6xTxngPRjA1nV0DwOnxjOZg5ghh8kDJgtXHWQ21bG
	TS5fi7vxW/PXvCD/9x7W3CJAtbGUZpft0fusriAIkMGxpuoJr5SvvOMHTQtsCe0xFG2xPS6DYBz
	6aN1YAlWvzKM3aESaXtutfNLML5im/QLly9iLa47k6q5wfwqBGmwb/7R9N2m2jWGznWxMeEBXRk
	sUB4fr6GoDyTJUOs7qBOcvEMWNPitCr5hCbYVXoSwTnqKPBPh+ZZg8E2uRlpM9WMFh0Y6ee4Q7L
	P/ZdLVi0MjrNGBa/+G4DRh2Y2v7tg/HlKisXafkkJVeLKE35xnkj4LgQkyXodti+1jlHohPdRuX
	+ZPlYoIbdqX2f7p7y3RiyP93r3GQWqrFR0iuXkmpz51yMQ/MJHxA1oAXeef8QLad
X-Received: by 2002:a17:903:3c27:b0:2e9:670f:d080 with SMTP id d9443c01a7336-2eb36450a4fmr182650275ad.32.1793886401061;
        Thu, 05 Nov 2026 05:46:41 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091cf87fsm17710175ad.67.2026.11.05.05.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:46:40 -0800 (PST)
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
Date: Thu, 05 Nov 2026 10:46:34 -0300
Message-Id: <DMNBNKKPHI0H.EZQ7YA2CSMEA@gmail.com>
To: "David Gow" <david@davidgow.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Benno Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] rust: kunit: support #[should_panic] and same
 test name with different #[cfg(...)]
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <35284b5b-bf0c-4585-ad3e-a76bae4be7df@davidgow.net>
In-Reply-To: <35284b5b-bf0c-4585-ad3e-a76bae4be7df@davidgow.net>

On Tue Nov 3, 2026 at 11:45 AM -03, David Gow wrote:
> Thanks very much, Nicol=C3=A1s.
>
> I've had a closer look at the new version of this, and have a few=20
> comments. Ultimately, I think a mix of this version and the original RFC=
=20
> is probably best, and in particular, using a panic_handler instead of=20
> modifying kunit_try_catch, and removing the special-case assert!()=20
> handling would be ideal.
>
> Le 30/10/2026 =C3=A0 00:59, Nicol=C3=A1s Antinori via B4 Relay a =C3=A9cr=
it=C2=A0:
>> This patch series intends to implement two features for KUnit tests
>> written in Rust. The work is based on a TODO comment made in the
>> `bitmap.rs` module [1].
>>=20
>> Changelog:
>>=20
>> v2:
>> - Added more tests in `rust/kernel/kunit.rs` testing Sashiko findings
>>    and changes.
>> - Solved Sashiko: "[Low] kunit: spurious "try faulted" error logs for
>>    successful #[should_panic] tests": Solved by adding
>>    `rust_should_panic` in `kunit_try_catch` C struct to check if the tes=
t
>>    is expected to panic and act accordingly. Dismissed what I first talk=
ed
>>    about in [3].
>
> I think if we only handle Rust panics, this should go away, right?

Yes, it should. Since we won't `BUG()` anymore in case a test should
panic, the test thread won't exit with `-EINTR`. Because of this we
won't need to shield the feature behind a Kconfig symbol either, since
we won't have error logs in successful tests.

Here's the raw output from the panic handler version:

KTAP version 1
1..1
    KTAP version 1
    # Subtest: rust_kernel_kunit
    # speed: normal
    1..1
    # rust_test_kunit_panic_in_kunit_test.speed: normal
    ok 1 rust_test_kunit_panic_in_kunit_test
ok 1 rust_kernel_kunit

for test:

#[test]
#[should_panic]
fn rust_test_kunit_panic_in_kunit_test() {
    panic!("This test should panic and pass");
}

>> - Now the tests that have an inactive #[cfg(..)] do not appear un the
>>    KUnit execution summary as ignored, they just do not run.
>> Link to v1: https://lore.kernel.org/all/20260930-rust_kunit_v4-v1-0-e3b0=
d45311dd@gmail.com/
>>=20
>> - RFC patch: https://lore.kernel.org/rust-for-linux/cover.1789500084.git=
.nico.antinori.7@gmail.com/
>>=20
>> 1. Supporting `#[should_panic]` [2]:
>>=20
>> KUnit tests in Rust follow the user-space syntax, but at the moment
>> `#[should_panic]` is not supported. The first patch of this series adds
>> support for the attribute (only in its basic form, `#[should_panic =3D
>> "message"]` is not supported yet).
>>=20
>> The way it is supported is by adding a new boolean property called
>> `rust_should_panic` to `kunit_attributes` struct in kunit/test.h and in
>> `kunit_attributes` in kunit/try-catch.h and check for the
>> `try_catch->try_result` code and the named flag to detect if there was a
>> panic in `kunit_try_catch_run` function.
>
> I think rust_should_panic as an attribute is good, but it should just be=
=20
> checked from a panic_handler. If it supports more than just rust panics,=
=20
> it probably shouldn't be called *rust_*should_panic (and again, should=20
> probably be based on the warning suppression instead).

If we consider failed `assert!` from outside a #[test] function panics,
then I'll leave it like this, otherwise I am thinking of
`rust_should_fail`.

Thank you!
Nicol=C3=A1s
