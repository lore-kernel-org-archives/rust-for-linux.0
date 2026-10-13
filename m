Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0516748F022
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 21:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928705; cv=none; b=SA8JsoWvX43lxMAHJMAvED0YJtgHJA5O1N1+mTt31csyGsbR9LYdDlq7yP/RyLPjS5MaZ+tDKAOF1SEZPOL3Ns6Mv+UpT3+/zh2xF4lCp8vWJ78W/XvhFRJZszhReCSWFlFxRxp4cPdqtSloWn/kbmH+a5N+wd2OQnvPxRdS1r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928705; c=relaxed/simple;
	bh=ZVzarpf8WNOwq2Ti/pRme3ZP570l4a1ExNIDsoiGNYY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=BEqH9cOdcoOCiBorDk3sYdERJWRp9VJhxnwQNG1o8SG2t6Xf1SwR4TMHXvc2OdX3nTiI0hd41eFWVIEcqMS/wP4L87FLA/yGyJNwLv00Q23uXCYKzRvfLcv5wCFQQQoZrI3FmEMNkqZFGuLlKkHBDfY0zuaApfO5qRDRFzP73to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPVwBcAc; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPVwBcAc"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e78346891fso2770591e0c.1
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791928703; x=1792533503; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p1do2oSuujusCaRjwJuehcZTG9i2h5W9hCTlUTrulZ0=;
        b=PPVwBcAcqOc+OoF9YYOx3GHGta/eiTnenOMPB+lI9FlTwpi687p9fRmu8R1FKv/u9a
         BSpWtpB4tEs/9LAt8GgcvJvykkslnttBm0E/FChUKS/IYSzty5aQrIfFcfKq5FZKqB0m
         7GDeNPiKIO6/YDAEXQWdXgc9+YtRNzqenFw99M9ljABfEL3EaOp2dB9jI8ypZOxgpaIo
         xu5OPdQv7id3g2WEmpIV1duolJ+ZWXkxLSSvIvxIKCmuNO3Zq8NfHECWQ0UXV51DEKZL
         hFDO2xb9XR032Te8vcr+ujVU/53C1pz9fXc+6dqijRt7pkPoLANyW8t4DaZ81HCezb4y
         keFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791928703; x=1792533503;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1do2oSuujusCaRjwJuehcZTG9i2h5W9hCTlUTrulZ0=;
        b=alAt52OzTjGYX2HiD5H7kAc4Eyoqph+nZo62LrmhxzF1vCla/cmOAZcYxBz6Y/Lm+N
         BRVxJ2okF6IxnU1r6r21u+SelS02gab9t5XZ0gCxlnS51dky2I3BpZifUmsTlHi3g22B
         Ndah6rimgGxbrfZfUQx1olO5PeA3Zdrsrdud1Wn3XfO7AZkT5STLYotIeXOTHDO4+8m3
         j2AJRNiPxKWpX5OzoDJhMVglje5VyK8e/f6+P48T785jp0fkY0jzhi+9yn5E78OgNKGO
         Lyg3hYHY9hi+RIxWBa/kWby+uTtuPOsftQEp4hyTcMEg9DIoFGBJ6bo7oCiQN5sXa9tL
         FL3g==
X-Forwarded-Encrypted: i=1; AKwUvBycIKmsjGGH2VPTygsVd6QjffC1HbBSdYHOrUbwxiKVsDt+VTsA45sJdJ342DQ2foR8B5VEzickC2Zwzw0wrw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJo3vvJKzwjShggttvxECoWpBXK0O0ECiIKOCzNfWQhPIhKgsOb
	bthx+0Yk3VJF9zM7Bs9awDvRw/Z89UZyxExdaNTc7b/hU1BQFzqIfXs=
X-Gm-Gg: AYBFou1OqC9TOGNudTPACSI8abk+HX/NldzWV51tjJW3sNcwkQRNETscSwFY730argz
	VQs7QhwDG71JENRxlYYHRq1Wh6/fngIOd7+bQvGi7mbkT8BcDuv+2D/Ebx67TbcEqWsmWK25v+w
	f+c9gljEqAFc4habY2bmWshtXUFdpYx2H0KSKBl5gYA9STOHOQRvzG/r8YA8h3vrE3mdqodZ5Gu
	6JPj9eE4U0YJLCECwLeNYdk8qP+JmFo7QilaVd2sxedwQHYm5Afu5v3pW6nO27rYGSrKwf0znT9
	d0lqBYFOZm/OT01XD6NHcPemvYNPUJYgv6MiLhCGLfM8qGAnLL5PpjHSuRClEuhQ5MbnioNMHOI
	Aj5dQo33SeA9hQ17K5gvMEM05c2ty4EU3ghqrH2ed8xs15iOk+2CPVEq9y8GbsMP0MrogmU9AYF
	qgKR0LhZCYFJPMGnB0UrTU1mV7UeV6az8W03+MAi/3Cdq+8Qo6WrosOvAD9bYtJXVWeWiJ016VO
	g/soylse+oboArPpNgxz3JPQ097Xyf1VQ==
X-Received: by 2002:a05:6122:30e7:b0:5e5:35a5:8b09 with SMTP id 71dfb90a1353d-5e91f4c2a8amr4731717e0c.17.1791928702687;
        Tue, 13 Oct 2026 14:58:22 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e9646bad8fsm1758237e0c.17.2026.10.13.14.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 14:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 18:58:14 -0300
Message-Id: <DM41PHVITKOG.3I6P2X8048BEP@gmail.com>
Subject: Re: [PATCH 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: <nico.antinori.7@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Burak
 Emir" <burak.emir@gmail.com>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>, "Miguel
 Ojeda" <ojeda@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Rae Moar" <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
X-Mailer: aerc 0.20.0
References: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
 <20260930-rust_kunit_v4-v1-1-e3b0d45311dd@gmail.com>
In-Reply-To: <20260930-rust_kunit_v4-v1-1-e3b0d45311dd@gmail.com>

Hello,

There are two observations by Sashiko in this patch [1]:

> [Severity: Low]
> Does this interception occur too late to prevent spurious error logs?
>
> When a Rust test panics as expected, it triggers a kernel fault caught by
> KUnit with an exit code of -EINTR. However, kunit_try_catch_run()
> unconditionally logs an error message for -EINTR before returning to this
> function
>
> lib/kunit/try-catch.c:kunit_try_catch_run() {
>     ...
>     else if (exit_code =3D=3D -EINTR) {
>         if (test->last_seen.file)
>             kunit_err(test, "try faulted: last line seen %s:%d\n", ...);
>         else
>             kunit_err(test, "try faulted\n");
>     }
>     ...
> }

Even though the tests marked as `#[should_panic]` are reported as
successful by KUnit, when run with `--raw_output=3Dall` those log errors
appear. Is this a problem? Along with those the Oops message and stack
trace message show up as well. The report summary is clean if no special
logging options are used.

> [Severity: Medium]
> Will this condition correctly handle KUnit assertions inside a
> #[should_panic] test?
>
> The kunit_tests macro overrides assert! with kunit_assert!. If an
> assert! fails, kunit_assert! reports a KUnit assertion failure and
> aborts the thread via __kunit_abort, which results in -EFAULT rather
> than -EINTR.
>
> Since -EFAULT is cleared to 0 in kunit_try_catch_run(), this condition
> checking strictly for -EINTR will fail to intercept the abort. Will this
> cause valid #[should_panic] tests containing an assert! failure to be
> incorrectly marked as KUNIT_FAILURE instead of passing?

This is something I missed when working on the series and is accurate.
The following test:

#[test]
#[should_panic]
fn rust_test_assert_false() {
    assert!(false)
}

Is reported as failed:

[18:31:00] # rust_test_assert_false: ASSERTION FAILED at rust/kernel/kunit.=
rs:383
[18:31:00] Expected false to be true, but is false
[18:31:00] # rust_test_assert_false.speed: normal
[18:31:00] [FAILED] rust_test_assert_false

But the user-space behavior is to pass the test [2].=20

Does it make sense to leave this behavior as it is for the kernel? If I
am not mistaken tests like those can easily be expressed without the
`#[should_panic]` attribute and negating the condition inside `assert!`.
`assert!` that are not in the test body behave as expected.


To solve those I'd need to check the `rust_should_panic` flag inside in
`kunit_try_catch_run` function. That would require changing its
signature (since the `kunit_try_catch` struct does not contain the
`test_case` struct and the context argument is void*, so I can't safely
cast it to what I need). Other alternative is to create a new function
for cases where `rust_should_panic` is true.

My approach to this was to modify as little as possible in the C side.
I think the current behavior is ok but I want to know your opinion.

Best regards,
Nicol=C3=A1s

[1] https://sashiko.dev/#/patchset/20260930-rust_kunit_v4-v1-0-e3b0d45311dd=
@gmail.com?part=3D1
[2] https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=3D202=
4&gist=3D2b4b29a266271497ea9932068ecdb8ff
