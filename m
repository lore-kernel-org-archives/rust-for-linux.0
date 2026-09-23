Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA2A531603
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175861; cv=none; b=LywQdnps8mWXZQNwJHSP3w867vTa2jJ8BbKkYuPKCUwKC/WJFb6uNVH5pCqxhqHr/FKY9fBkwsaP4ngZIWuEUSjXHqu/gAZxb66NuEkydmYgkebSSGywGz5Kc6OsBkVYulqYnZQDC4I2sIS51DGIrsaJ+SwDh3PdWhYPosdyAxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175861; c=relaxed/simple;
	bh=zyLAgDuGCnbVM6PTXgtJv50sRhjEn2knlMH3iE1IJP8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=XLIlxZdTl8FR7dL/5JrG4eYNnNH7Pgqr6zoSMhl+ptnIEKhTB6dAKfocMT3RSwMrDjm/d4qpog8Tew6lyFp4q+lyzGYQgcAFsWvIPsjb59A437pPS1sIxSGh/uDhQKcY1Mc468jUKXlL/O2jzmhLm7I8vaCFj0yqvU+5AjJoJ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFx3OztI; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFx3OztI"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78565b4db79so562952137.3
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790175858; x=1790780658; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NTCUrwfrXeq8SGaMAxsVqs9zM4f5GTdExNXsJCfYt6I=;
        b=NFx3OztI3NryCMYkmzhNeSjc1yQGHeE4wjmS+o0LTFVzV021yfQ9LGt8GHAeJNiYq3
         ChroK4Zdge2AiDcyTV/FJbP4F5VgDTf9VQk49jUe7fSV7tI6AkpOpaREF6PRgqNflb3l
         q/c48D0g29tENTLys34CECAIOrGoMfVljmZlKI8XAGhiJll8wA8GYztwb7HcfGjOHu7K
         xDpMXPx2utiluSMUx5gdTo2HlixFhxXpQYYYd35evUyG/8OTwNPlnFZIUA0Cr+He8Eh7
         NC0eVG4TqofKlpm/8wdvBabRjbNP4XufMOHtqInxaAygbzvMvNm8tN7rvH1YEZg81Qis
         hQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175858; x=1790780658;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTCUrwfrXeq8SGaMAxsVqs9zM4f5GTdExNXsJCfYt6I=;
        b=0SnND5Fn7Co1bHRq0QR65g97QVa8zpeqroShrFZTO14gWsv2df+0uTCu/kmvDLYLWW
         MxwawS5lPoQqLKqO16ghnh7932XFgVhkNpq7qy/wg+FXZ/TaSOMS85u6Ohrv7yg2d7tb
         aZnlr7/qow+w+FmM8Cbg33f01TDHUGTqjiBbwS9+OlEr3pWKrrueecOpMdBGFfbU2LSM
         DGujuq67/3zYaLFZFdwIVP03IGlhhFiFHXqIcPjZT33zdwqth/j+hFNP7oPjvqH2GzDz
         K4WxrI0ThfNergCfK6pDyf6Ha96FwfDXMT77ZyWDsbuj0tOpRTnP/Z8xyRL1K8PobSX8
         TjFg==
X-Forwarded-Encrypted: i=1; AKwUvBwBmQ8mTU8pPDftJF/Hb5IulSzG1spy9sDzmiWNtTyf74BmoyOEUQeJFxeAgSvtxSId9D6DRk0Bg/cxg+RVRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kYIxiLMbVxtSPv0WqFm4aJ12K56+LUa5OeuG7lS6yT0Ce3/iVs
	UnRcDDMhQPAncMx8U+i43eMklY0ochaLpXKbH78U9RIcl2f1q0mTHa4=
X-Gm-Gg: AYBFou3iTNc1f3+xr/7VQhi0XwMsC88bxTUtO/gwdM/AOL4IMdfn60vXCQdQ29x5Rop
	fHjrptHgSR2V5Gx6pT/ivppeBQNPPHEKMZ54eSa/wyp2ON+pPYlb++6wxu2eqsRwbDsczV0ZPrb
	sHUhtckjmn3JhqUj9iEj5Z2J0Z9E2+ETPmjEAyvvI5bw+gfVAuAL9SsvNlRV7KPRawFKytiNUld
	mIDJ4E5UK39TQ8DgekVwbv6fE8uvxCioePdH6Y4drS5sK2DNytxlgI+NmGqL43o6M7j+crqPezn
	sEwlheHqhDgTwE1r+yJL+ONX5jVWW4ZYSI+NmcIIWuT4uYXB+S8zoOqGbUs3C4U3HeWlmspPPLq
	e0mmXdMDrAAudCU69gluWYJpKcPJxUuB08hl4kMXwDLBiuHgzamj0VRMRk3bcNFXhipLy4rlLxM
	QpqxoZgSoEsCv6Wumv7SFcY+VVNaAulbBaFquVHADhTwvnYLOKjGiylyR+0C/UxbKwkwEKFs9h1
	f5TONtPYBUMSLF70IsgbV96aSqL5xr+HgHKrqA+7TXy
X-Received: by 2002:a05:6102:1609:b0:7a1:3d97:fa91 with SMTP id ada2fe7eead31-7ac1a6bfc1emr2812341137.4.1790175857500;
        Wed, 23 Sep 2026 08:04:17 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98517a8ecaesm3259852241.12.2026.09.23.08.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:04:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 12:04:10 -0300
Message-Id: <DLMSDK8YPOR1.7XGP4DV03R1H@gmail.com>
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "David Gow" <david@davidgow.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Burak Emir" <burak.emir@gmail.com>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>
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
Subject: Re: [PATCH RFC 0/3] rust: kunit: #[should_panic] and same test name
 with different #[cfg(...)] support
X-Mailer: aerc 0.20.0
References: <cover.1789500084.git.nico.antinori.7@gmail.com>
 <d20cc2b2-afeb-432c-924b-55ad00d980fe@davidgow.net>
In-Reply-To: <d20cc2b2-afeb-432c-924b-55ad00d980fe@davidgow.net>

Thank you for the feedback!

On Tue Sep 22, 2026 at 4:56 AM -03, David Gow wrote:
> Le 16/09/2026 =C3=A0 03:33, Nicol=C3=A1s Antinori a =C3=A9crit=C2=A0:
>> This patch series intends to implement two features for KUnit tests
>> written in Rust. The work is based on a TODO comment made in the
>> `bitmap.rs` module [1].
>>=20
>
> Thanks very much for this series! It works fine here, but I think there=
=20
> are a few other options for how this could be implemented, and it's=20
> probably worth our at least considering them.
>
> In particular, we've already got code for suppressing warnings, and I'm=
=20
> not sure whether it makes sense to unify all of the different attempts=20
> to intercept panics / bugs / warnings of various kinds.
>
> That being said, Rust has unwinding and panic handlers as a core part of=
=20
> the language, and the C side of the kernel doesn't. Combine that with=20
> the fact that #[should_panic] is already standardised in Rust, and the=20
> argument for a separate implementation is not totally silly either.
>
> Do you think that #[should_panic] should only trigger on a rust=20
> panic!(), or on any kernel panic? I'm leaning towards the former, but if=
=20
> the latter then we'd need to implement it in C and provide a C interface=
=20
> to it.

When I sent the series I leaned towards the former too. But thinking
about it I believe there are situations where a kernel panic can be
originated from C code called by Rust, for example, this test case:

#[test]
#[should_panic]
fn rust_test_kunit_panic_in_kunit_test_bug() {
    unsafe { bindings::BUG() };
}

This kernel panic is not caught by the Rust's panic handler. In the
current version of my code, I catch that in
lib/kunit/test.c::kunit_run_case_catch_errors function. With that
modification there's no need of a Rust side panic handler (as it catches
Rust's panics too, since the panic hanlder executes a bindings::BUG()).

>
>> 1. Supporting `#[should_panic]` [2]:
>>=20
>> KUnit tests in Rust follow the user-space syntax, but at the moment
>> `#[should_panic]` is not supported. The first patch of this series adds
>> support for the attribute (only in its basic form, `#[should_panic =3D
>> "message"]` is not supported, and I don't know if it makes sense to
>> support it)
>>=20
>> The way it is supported is by having a separate `#[panic_handler]` when
>> `CONFIG_KUNIT` is enabled. When a test is marked with `#[should_panic]`,
>> a static value (KUNIT_SHOULD_PANIC =3D 0xDEAD7357) is assigned to the
>> kunit's `priv` field, since it is meant for saving arbitrary user data
>> [3]. At the moment, I did not find any place where Rust tests use that
>> field, so it should be safe to write it.
>
> I don't think the `priv` field is the optimal place to put this. I don't=
=20
> think it's strictly a _problem_, particularly since Rust tests aren't=20
> using it, but nominally `priv` is for test use, and I'd rather not use=20
> it here (there may be future tests which want to use priv for something=
=20
> else, particularly as a quick way of passing test state between C and Rus=
t).
>
> For most of these sorts of things, I'd recommend using a KUnit 'named=20
> resource', but alas, there aren't any Rust binding for these. That being=
=20
> said, we've used named resources in C because they're setup at runtime=20
> (which is how we've handled this in the past). That's useful if we want=
=20
> to note that a particular line in the test wants to panic, but if we're=
=20
> only concerned with whether a test as a whole panics, then this could be=
=20
> static.

I did not know that you could test particular lines for panics! That
said, I believe the #[should_panic] attribute is meant to check if the
test panics as a whole.

If I had to test a particular line for panic that I'd write a new test,
but that's just how I'd do it :P.

>
> In that case, how about adding a new `rust_should_panic` field to=20
> `struct kunit_attributes`. If you only care about whether a panic=20
> occurs, this could just be a boolean, but it also could be a place to=20
> store, for example, a string to support #[should_panic =3D "message"] if=
=20
> you wish.

I could not find a way to retrieve the kunit_case struct from Rust. I
believe this is needed for implementing the check because the actual
panic message can only be retrieved from the PanicInfo [1] struct.=20

I am sure this can be implemented (the first things that comes to mind
is having a C api that retrieves the current kunit_case struct, but I am
not sure if the kunit_case meant to be leaked outside the runner) but
I'd do it in another iteration if we find that it is useful.

>
> As an attribute, you could also then add it to lib/kunit/attributes.c=20
> (probably with PRINT_NEVER, as I don't think we need it included in KTAP=
=20
> output), which would, for example, allow us to filter tests by whether=20
> or not they expect to panic.

Excellent! I'll do that!

>> ...
>> 2. Allow same test name with different #[cfg(...)]:
>>=20
>> When testing `#[should_panic]` in `bitmap.rs` (check the last patch of
>> the series) I found that the test that was supposed to panic had the
>> same name as another one, but they were run on different configurations.
>> This caused the following compilation error:
>>=20
>> ERROR:root:error[E0428]: the name `kunit_rust_wrapper_owned_bitmap_out_o=
f_bounds` is defined multiple times
>>     --> ../rust/kernel/bitmap.rs:503:1
>>      |
>> 503 | #[macros::kunit_tests(rust_kernel_bitmap)]
>>      | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `kunit_rust_wrapper_ow=
ned_bitmap_out_of_bounds` redefined here
>>      |
>>      =3D note: `kunit_rust_wrapper_owned_bitmap_out_of_bounds` must be d=
efined only once in the value namespace of this module
>>      =3D note: this error originates in the attribute macro `macros::kun=
it_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
>>=20
>>=20
>> To fix this problem, I appended to the `kunit_rust_wrapper_*`
>> identifiers an 'stringified' version of the test's #[cfg(...)]
>> arguments. The purpose of this is that, if we have a test with the same
>> name and configuration, it would fail.
>>=20
>> The configuration string was also appended to the tests names. This was
>> done to have a better test run report:
>>=20
>> ...
>> [SKIPPED] owned_bitmap_out_of_bounds_cfg_not_config_rust_bitmap_hardened
>> [PASSED] owned_bitmap_out_of_bounds_cfg_config_rust_bitmap_hardened
>> ...
>>=20
>> Otherwise we would have something like the following:
>> ...
>> [SKIPPED] owned_bitmap_out_of_bounds
>> [PASSED] owned_bitmap_out_of_bounds
>> ...
>>=20
>> Regarding this:
>> - Does it makes sense to allow same test names with different cfgs?
>
> Yes-ish. I think it definitely makes sense for the same test to be=20
> redefined with different cfgs, but I'd rather only one of those tests=20
> then actually be compiled in (see below).
>
>> - Is it ok to 'stringify' the configuration so it can be distinguished
>>    in the report? Would you prefer something like `_case_1` `_case_2` ..
>>    instead?
>
> I don't _like_ this: my preference would be for us to keep the same=20
> name, and just not emit a test_case for anything which should be=20
> compiled out with cfg. Unfortunately, implementing that is a bit harder=
=20
> than would be ideal: we need a way of evaluating the cfg() arguments in=
=20
> a proc macro, I think. (Ultimately, because otherwise there's no way of=
=20
> statically determining the length of the TEST_CASES array?)
>
> Unless you've got a good idea how to fix this, though, I'm happy to put=
=20
> up with adding the configs to the name for now. Though if there's a nice=
=20
> way to make the names shorter=20
> (rust_test_kunit_parse_cfg_in_kunit_test_cfg_config_rust_kunit_selftest_e=
quals_n=20
> is definitely too long a test name, for instance), that'd be best.

I did not like it either but I could not find a way of evaluating the
correspondig cfgs and not including the ones that were not active in the
TEST_CASES array. I implemented the Gary's solution [2] (very neat
trick!) and it worked really well!

Again, thank you both for the feedback. I'll be sending a patch soon.

Best regards,
Nicol=C3=A1s

[1] https://github.com/Rust-for-Linux/linux/blob/93f51579e7df24878021409441=
8f205253383cc5/rust/kernel/lib.rs#L179
[2] https://lore.kernel.org/rust-for-linux/DLLYGLVEA0R3.3D1733XFFTFPV@garyg=
uo.net/
