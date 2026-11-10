Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317964;
	b=zqv78Jll3QIUPkDFZfeBdVR3yHQ1yIzvuHtetpOx+iwcS+x2mFNHhE7L0C46LKAuWu74
	 xiAoPvD6JJZOyD6+OUcrDL94Xx2lUYD7lqMv6cZAu6nFR+Mz8DXxPINsACa8zzmbNMN6F
	 kvw/LTUKx3WAbmL6LCDMSlaV8iyVbZGHcBc0gqhjdZTe5ZIbNN0sVNdZDclCZFBCPMeiX
	 uaEnvYKDgfvbi8XV8yBzGuXMlzupesc4Lez6NN2uaYFJbrBr+GaHjgZTM2oejaLWlAckj
	 Tom5OoyHyRo6atC2+8Owo1K7XQbJrj6y4stKcS5hrcXVlOQS7lZSD1GUBxevvJqV/ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=wrYdLEXUQczC45027W7j/17QxqnElVdgY/9dzZeBiks=;
	b=KdoMBgPYsB06C2AQM5Sg58UbLg0WUQwyRTCpwASohQ9B9eY3VeObrYMkGt28Iw60QbpT
	 ECpLKrgXeL99upUWdfyt0lpn9cBc8Q+sqXSY19xxgXbniLp+p+x7ivXWnQMQ67IBns2Bj
	 ULLMzFHLAPDlX78EwA0m8Hg25vnPXPQfTSL5+O9rOOlZ3eIW1upjOKdEjcXVTb385DSLz
	 bMW/pF4fHKnGfgH7/uy907ZC1B1Pk8uIxokimjpw1z8J0HuRxQCkb9bWCgxeTrH2n8wav
	 KCuG0+bx533bibSsfZssMFGY78k2LY1TfA+g5KgcF+ECmm4Lj22ojBq1iK4OXI7pKNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Jbfz6kh/";
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5107606A33A
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 13:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5107606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jbfz6kh/
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-677af43eed4so2276511d50.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 05:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794317963; x=1794922763; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wrYdLEXUQczC45027W7j/17QxqnElVdgY/9dzZeBiks=;
        b=Jbfz6kh/HpDc+iYvSMq+UD27VNHlFLPHcbic2zVDi+JV7ZfeXFUIEbMhdvsJYMtQD7
         6tDwNbi5/fxQaTlyxIlz+BsqrNDOaoUW8Nim91YHiIh3tvKr8//JolyFGlzJ5cZHy5ld
         KSfLQBQTPTmMVV5tCIi0vOS7Eg6cYK23ihpvtZmD36PM0vNB/h9Z4ZZFgL88WS97gMfy
         8PWPw+IdllFB+D8w1sPQwGBaDYNLUH9EGuw8NN+zAG+wV6bxulLNs1+EZdEGhahjW1BT
         v3p3HAQ9/xSKxm4FgZTtEUkXmfArxUyS7hUpAEy0HomOQ1Fw37vo8H6R/+ziuteR1QkA
         wbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317963; x=1794922763;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wrYdLEXUQczC45027W7j/17QxqnElVdgY/9dzZeBiks=;
        b=GCVXM49ErsGE961SLMKFjy6ZfEogNrPLFTOzyOeQK1N3WcfN6giBISI+jePCuPBRSC
         v0Zk13Bb64yexYp41RaTDR+vM5O4fzm+u3rFSJRlPLKnMK+N3kbJYfpcaW7xT2uzCTWQ
         1QXzemoifng9hkTDYPensnHMDwuisJTBIN1aHLU4Ppe3RtvfCi9NSUHQdjZxHKy8gNWu
         f1TA3sNUECP9z2DZf6gXtT/N3dMaGE3Y3pOIgz1jBUoPrW2hsUZMHVU22fPIID/x4Inr
         hfKLOq7UDmKvW0tB7sBzy+ksMAmydCbIvvBaS6tTFvpVGJLviMbZ1CH718O/hl2xkRoN
         e9Wg==
X-Forwarded-Encrypted: i=1; AL+hErGZUO3zGh1i6R7/awM4iB+n1URUHbHODfqF3hMdtGinZZkaM3sZXZ05Nd95J73keTIW619tUY6GxQ0O2wOYug==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ifC6hio/doR6+4B4BkdFzIYnXRH/ZV1QlR6MW83/TDtlO6OlE
	FAMHNvANA3FWKgcrbaHN4QB816MckBi+HI5PKRbvcuGhfc24OKuEvnU=
X-Gm-Gg: AYBFou0OOOH9ezTykWloDqMaPd8Gzqr88dGH38sG5EQDudrM2rEMqTXvEUINB9Bqjgz
	sbAl/p53m6KAdnOYVlhWu12OUu6D/wr9OjA+YASEkCqDA8qhiFCc9WdvQUJtFi+lWIVLkw+whvt
	UHyxBqgyf4r9vysWeXLxmhl6JYx9gL5ZvNqE29XTSQEmQq8RS/zC2DQlERdH6scH+JnfKlI0H2/
	7I6V3pW3RRYohOmI33rJo2BY8krTIAxNnGiGaM7Lh8KsEIuwHmk7TLNCt3YAAuQFnOuFtYGG0+E
	L1OI6IDBfKtYycVk9KwOkBtvqUFl/nw5+jtZ/rXHAEchxMefmU+1uMweDuvLI8DWj94SQLdcCeA
	KIUMX2F2ZwSkA3yhjSCPtMG50bEYbzS6eL/leABExQkKG/xVvww1yKh2sstKOWhZueBeLpXRvRt
	xlp7LeIyRDzSPQdxp+RpslnzeyI0KktMg9U/cikEXqLXPv7lrlpXIffKMbLBYejhP++HJ+MHqFE
	8pJOuIBTKY1whA7eFoKqwdHnlyWoHDvFOnFTN9xPbqxGEJUfY3Zz1h4v6COYBg+fAKlroZw3Hbp
	JK1hPAdMU6SuIRES3NH8fkEwUE6LQxGL3M8oZkbNVrM89mmcVk9fNSR1FHmLc/BB
X-Received: by 2002:a05:690e:4810:b0:67b:f249:5820 with SMTP id 956f58d0204a3-67c5676f8d1mr1411133d50.41.1794317962789;
        Tue, 10 Nov 2026 05:39:22 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3934643aasm18888917b3.43.2026.11.10.05.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:39:21 -0800 (PST)
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
Date: Tue, 10 Nov 2026 10:39:14 -0300
Message-Id: <DMRKMOLNNODA.3M7QNVIBGVI5R@gmail.com>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
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
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>
 <6d7a63ae-f08f-4973-b2d5-27be454380ef@davidgow.net>
 <DMMMDQO787UH.353XT44UDG8YS@gmail.com>
 <e7301e33-4813-4382-84e6-5c82a70b1ad7@davidgow.net>
In-Reply-To: <e7301e33-4813-4382-84e6-5c82a70b1ad7@davidgow.net>

On Fri Nov 6, 2026 at 2:31 AM -03, David Gow wrote:
> Le 05/11/2026 =C3=A0 1:58 AM, Nicol=C3=A1s Antinori a =C3=A9crit=C2=A0:
>> On Tue Nov 3, 2026 at 11:46 AM -03, David Gow wrote:
>> No problem at all!=20
>>=20
>> I'll be sending the v3 with the panic handler then. I decided go this
>> way because I thought it would be useful to catch C panics, but those
>> would be rather rare cases.
>>=20
>> The only thing I am not yet sure regarding the panic handler
>> implementation is how to read the `rust_should_panic` attribute from
>> `kunit_case` struct. If I am not mistaken, there's no way to retrieve
>> the test case linked to the running KUnit test from Rust. Would it be ok
>> to add a public `kunit_get_current_test_case()`? I am not sure if that
>> struct is meant to be used outside the runner.
>
> Yeah, this is a pain. In theory, struct kunit_case / struct kunit_suite
> are internal to the executor, but we end up having to pass them around a
> lot, and a way of getting the current test's attributes is, at a
> minimum, something we should support.
>
> I'd rather not expose the struct kunit_case to test authors (though
> exposing it to the Rust macros is fine by me: they're sufficiently
> KUnit-internal that it's fine). The ultimate best 'public' API would
> probably be to have a bunch of 'kunit_get_attribute_value()' style
> things, but that's definitely a more involved thing.
>
> How about we compromise on a way to get the attributres for the current
> test. The simplest implementation for that is probably just including a
> pointer to struct kunit_attributes in struct kunit.
>
> (Though the better long-term solution would be to pass a struct
> kunit_case pointer in struct kunit, and generally rework things to not
> pass struct kunit_case/kunit_suite around as regularly. There are a lot
> of gotcha's there, though, so it's not worth holding this up on that.)

I'll add a kunit_attributes pointer to kunit then! I can rework this
later to add the public kunit_get_attributre_value functions.

>>>>   #[macro_export]
>>>>   macro_rules! kunit_assert {
>>>> -    ($name:literal, $condition:expr $(,)?) =3D> {
>>>> +    ($name:literal, $test_should_panic:expr, $condition:expr $(,)?) =
=3D> {
>>>>           'out: {
>>>>               // Do nothing if the condition is `true`.
>>>>               if $condition {
>>>> @@ -93,6 +93,14 @@ macro_rules! kunit_assert {
>>>>                   ));
>>>>                   break 'out;
>>>>               }
>>>> +            // If condition fails but the test should panic, then we =
just abort.
>>>> +            else if $test_should_panic {
>>>> +                // SAFETY: FFI call. The `kunit_test` pointer is vali=
d because we got it from
>>>> +                // `kunit_get_current_test()` and it was not null.
>>>> +                unsafe {
>>>> +                    $crate::bindings::__kunit_abort(kunit_test);
>>>> +                }
>>>> +            }
>>>
>>> I'd rather us keep asserts working as normal: a failed KUnit assertion=
=20
>>> shouldn't be considered a panic. If normal Rust assertions (particularl=
y=20
>>> those outside the test-specific code) compile down to a panic, though,=
=20
>>> that's okay.
>>=20
>> I'll revert this. I made the change because in user space those tests
>> pass [1] [*].
>
> Having thought about this a bit more, I think there's a compromise:
> could we make the override of assert!() and assert_eq!() only appear on
> non-should_panic tests. In that case, the assert!() and assert_eq!()
> will behave the same as userspace tests (indeed, they'll use the same
> code), and we won't need a complicated implementation. And later if we
> want the (IMO, more logical) KUnit-style assertions which aren't
> negated, we could suggest people use kernel::kunit_assert!() directly
> (or with a small wrapper), so it's obvious the behaviour is different
> from upstream assert!().
>
> Thoughts?

I think it is a good solution! Making explicit that there is a different
behavior using a different kind of assert, will make the tests easier to
understand (since we are mimicking the userspace API, a Rust dev will
expect a #[should_panic] test to pass if a common assert! fails).

I'll be sending a v3 this week!

Regards,
Nicol=C3=A1s=20
