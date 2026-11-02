Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652797;
	b=Zvizf20Q2XJRMa4T79pRsWmDC3DetmahMm3N5/4E5h5aLPE/l70TczSLP+DLEWRcoKPg
	 iam/DC7kUswsw5JyC5tG4RIPt1PeJ4kpVXkHqvi5JMDLxg1QcG40MeVD1SgWVe5Hjl/qu
	 uTj7G7YbbjZOukv1H9sDS49NsC8hsx3MCBFojW1hcMilwH23p+ybItGHm8N1nIAOf4JiN
	 gQUFEOsl77lkV/w7LU4PwZ0lxGY7qq8egvDRLitLd/+Uk/3TyC4rOA5Iwx99W9pa+xa+n
	 exnqMuul9mMEvGzc2UCndDz9Ty+R6lDpmXO03VADQF5pn5m96h9E9kiPM7I1Q4KoEDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=e2uq0IAsarHDTLXqFZ/CFLC17YQu7mmJAfgLDCf/Xbw=;
	b=x8LFbHfyeyzlN+dThHUiRSgqkuU2/jE6W108l2jYKpTLRxhCzxy6cLZ6DTvrNnpLkGqG
	 bJPNjfBlipfcRXivgpFC1GDG0D4Is/Mo8Jm0+has1KRXoqxLF7ACd+9qcPUWDC6FJdJZ2
	 zY7ADAR++e0lgH55U0NIY/zDvA+S/dHPLjK8LUHmBJY6pCAiZ+9msocmG1UizM6rQq8pM
	 89BiJnjqTio1C77Y+lZGuzYr3nWLMroC5/qApZsz5MdgsqP2WEm4wz1xIRZpxJiLYIPHx
	 obMZstIEI3QrcQvMzTesUxfpavEzMjVtg8X6+yILwvrXi2Wdv5M589eED+QNdnM0DQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qy4/nMyO";
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E39606A32C
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 20:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E39606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy4/nMyO
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eab93a9862so580785e0c.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Nov 2026 12:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793652796; x=1794257596; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e2uq0IAsarHDTLXqFZ/CFLC17YQu7mmJAfgLDCf/Xbw=;
        b=qy4/nMyOD2tvlZ+lCMFZXzwX1bR7Z92mNyX9ed8vsHjy7D8YOFf4wJCD3irRABXwuv
         tRnRQ3a07FzomD3HdEtcyU9aC01aB3cnxpkSjm5itPFUZkohG6yNZnbuaiU/rJpHVsMH
         m2t0ECWmneskImGe5GHRozAhoak3QNDdWYS7K/0BH7eYUz4VPR6UEAoO8o2zPh30ifYY
         O3TPOYxgDVLaHuCN1vNAVUUFoLoi7/h+/28kcDEzunmUFPeTaQQkx4nx7Jk+zhfor3Ql
         EnO+FXOs+ry3iOjWASHJ0AssEdooqmV81e5NQPjjQ5WLjSZ7mnqlG90WrETa5W7j05BE
         86/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652796; x=1794257596;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2uq0IAsarHDTLXqFZ/CFLC17YQu7mmJAfgLDCf/Xbw=;
        b=Gawx9fJgxi9Vvenz3qEQzrBbncffXxOf/13p0inWbT5VdzqcfuA7zDEmNUa+I9NKhm
         8AblZS1C9d/+GE3xDj7KkPV4sTovdQcgTJkW+9TKOJckayifVp0jYkB6QIKXWqr9jKM3
         7TKyvXkCaeDDoVyNgnM+g17KTJz3Wks+G7P2AamY78Rm1lb+elhdgDaFoYe6kB027yMU
         LgV4zhGa9ylVTqKiuHFqu+iSbzS0lAIfUB1KqQaLFTMU9yU40n6Aluy4hOJSzsDrlZK1
         qGz9F/PubDgw6I8Onf8bSC2EAOgEajoT71GlSlykL+MwDsrrQows6EisJlX/2f2lpqG3
         ZBCw==
X-Forwarded-Encrypted: i=1; AKwUvBwXLht09Ph/p6EfHLqsVfR07sPh9qR+AdzIZNi5Ag9xXAwH+2uliO7dbhOGj27Pz6vY89nSc7J4aGsQcPoyxg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+yH4aEkFHiFlg9K/qo+XOzBrfzb6eoIajeuWGH2Ifs9T8Xpmnv
	kkWj+xYfoPXrQGrqFcNetqJ4q3+eRWnF2LVe1Pzq8YlYnGxE9krItKA=
X-Gm-Gg: AYBFou1+7NfsKxpJZJAkTZIGZxv2Hxjgb4UGUsfn6UM3txb1O8Uv0yFCGY5XnC2ad6d
	XebmpbHuVGoJiWYtvpZBreJRlAdCYqjOA6E0SMjrVeisCcV5e/PNgUH6K6fGQIjdC8encusW4yw
	40JDJpDJHyx+H/E2pvAa4DiDeQ9uVzF8HmNIhIJlpxI1+VIrBFYsiAJ7rwphbDgff4h3z8l82d4
	BL2vCemqWGkz+Wz35LjVN3qof0FFbX3xCgto35C8nAdxl/uOG3/T+uPyXKxWAMw1Zk0v1PzoJ3L
	spLgYHWF4DkpB/4tTLx/cAdBCNA+27lUecNvHu1r9tCaSPCV3ja5/SQBhWopTf3GreWl12oa233
	/BoCOLt95LZPmygmNBYrOceLDIKewcfLMuE8YeMQ5dyAmhq6CLtE+mpvZQamhixrkshtKguIYPW
	vzaU3qAjyvgsXu1BcBMwIEC6Fd6XE+Rlb/TV3iG5fDqc7attZUZ9QQLp5P1fzzPagwp3yPtQ2ca
	DTOvnDZlKQWwtuoLo72WGr0VHk3hwJdH2WyEMLrdoIyFzE6wbj7vHdNLTJAZXwev0x2nj0ibS43
	gHnfT32VXXVXCCfdMMdh9a1fvW/WBucapbEAf0tAN2MwzSo+xoBdwh+MSIMBGaa01g==
X-Received: by 2002:a05:6122:d2a:b0:5ea:d14a:ef8f with SMTP id 71dfb90a1353d-5ec6870c5d1mr4724163e0c.4.1793652795618;
        Mon, 02 Nov 2026 12:53:15 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69caeccdsm10740493e0c.16.2026.11.02.12.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 12:53:15 -0800 (PST)
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
Date: Mon, 02 Nov 2026 17:53:05 -0300
Message-Id: <DML0UIHJNE2R.3JDG4HTEN6U0S@gmail.com>
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
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>
 <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
 <CANiq72n3YfMpWndR06B0s1Mj_PjAR8MJ+0nP4XXPkaFh3zX7pA@mail.gmail.com>
In-Reply-To: <CANiq72n3YfMpWndR06B0s1Mj_PjAR8MJ+0nP4XXPkaFh3zX7pA@mail.gmail.com>

On Mon Nov 2, 2026 at 12:51 PM -03, Miguel Ojeda wrote:
> On Mon, Nov 2, 2026 at 3:58=E2=80=AFPM Nicol=C3=A1s Antinori
> <nico.antinori.7@gmail.com> wrote:
>>
>> To solve this I created a new config "RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE"
>> that depends on !UML && !PANIC_ON_OOPS && BUG. If the test is annotated
>> with `#[should_panic]` and CONFIG_RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE=3Dn,
>> the test won't run and won't show up in the summary.
>
> I was wondering if we needed the flexibility, i.e. if we could just
> simply disable them when the conditions are not satisfied, but I guess
> given `CONFIG_KUNIT_FAULT_TEST`'s existing description, it may make
> sense to have a new Kconfig symbol=20

I first thought of disabling `#[should_panic]` tests by directly
checking the conditions in the macro code. I ended up creating a new
config because I thought it would be cleaner codewise, if a new
constraint arises in the future, we just have to add it to the=20
`depends on` clause instead of modifying the macro code.

> -- do the ones added here look
> similar in the kernel log to those fault ones?

Yes! they are pretty similar, for `KUNIT_FAULT_TEST`:

KTAP version 1
1..1
    KTAP version 1
    # Subtest: kunit_fault
    # module: kunit_test
    1..1
BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 0 P4D 0
Oops: Oops: 0002 [#1] SMP NOPTI
CPU: 0 UID: 0 PID: 30 Comm: kunit_try_catch Tainted: G                 N   =
7.3.0-18137-ga2943ba718b4-dirty #357 PREEMPT(lazy)
Tainted: [N]=3DTEST
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 11/11/2019

... <Registers and stack trace> ...

note: kunit_try_catch[30] exited with irqs disabled
    # kunit_test_fault_null_dereference: try faulted: last line seen lib/ku=
nit/kunit-test.c:100
    ok 1 kunit_test_fault_null_dereference
ok 1 kunit_fault

For `RUST_KUNIT_TESTS` (left only one that panics to shrink the log, but
they are all pretty much the same):

KTAP version 1
1..1
    KTAP version 1
    # Subtest: rust_kernel_kunit
    # speed: normal
    1..1
rust_kernel: panicked at ../rust/kernel/kunit.rs:399:9:
This test should panic and pass
------------[ cut here ]------------
kernel BUG at rust/helpers/bug.c:7!
Oops: invalid opcode: 0000 [#1] SMP NOPTI
CPU: 0 UID: 0 PID: 29 Comm: kunit_try_catch Tainted: G                 N   =
7.3.0-18137-ga2943ba718b4-dirty #357 PREEMPT(lazy)
Tainted: [N]=3DTEST
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 11/11/2019

... <Registers and stack trace> ...

    # rust_test_kunit_panic_in_kunit_test.speed: normal
    ok 1 rust_test_kunit_panic_in_kunit_test
ok 1 rust_kernel_kunit

The only one that is different in `RUST_KUNIT_TESTS` is:

#[test]
#[should_panic]
fn rust_test_assert_false_success_with_should_panic() {
    assert!(false)
}

That logs:

KTAP version 1
1..1
    KTAP version 1
    # Subtest: rust_kernel_kunit
    # speed: normal
    1..1
    # rust_test_assert_false_success_with_should_panic.speed: normal
    ok 1 rust_test_assert_false_success_with_should_panic
ok 1 rust_kernel_kunit

Because a BUG() is never called, the failed assertion is catched in the
`kunit_assert!` macro and, if the test should panic, the KUnit thread is
aborted without throwing a failed asssertion.

>
> (And I was wondering because, in general, adding Kconfig symbols has a
> price: users may get confused etc.).

On top of the reasons I gave above, I tried to follow the same as
`CONFIG_RUST_BUG_KUNIT_TEST` or `CONFIG_KUNIT_FAULT_TEST` are doing, but
in this case in particular, the config is not for enabling a test suite
but for enabling a feature that can affect multiple suites (in this
patch series the ones behind `CONFIG_RUST_KUNIT_TESTS` and
`CONFIG_RUST_BITMAP_KUNIT_TESTS`).

If this is prone to causing confusion, I think I am going to check the
contraints direclty in the code.=20

Thank you for the feedback!

>
> Cheers,
> Miguel

