Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEEA4F55B8;
	Tue, 22 Sep 2026 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063791; cv=none; b=d8VvFQAG0k5CEQpolf1R6xrRFGtAFPHB7ddcmxjHm3FvLLsYZ3ol3ZeZdo1IR6Bo5WQk3pfq59cb15e05qGKcoBEa2qp6GWtbG5rnOBAgFTKdLaQX+HW1ATzAXhUPUFT+zF8fTRVwr9crzs3OJSGUBBAipekFNBDO+hX8JwRWAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063791; c=relaxed/simple;
	bh=s+FkfbNj14vxWiLPnKryk0UraiA8U5TBfarwgT0bvfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZlN9PHKkM0jY7lgnEcW63yVDpS0I5DcRXxVM25ZR+6iLSr01uDFg0IbvqjnSsHShNggm6LD0KzKkG+9dgOiiNHEj1vW5NEbMkZpMw2QDaSY7z7tV70R13g+A8ZQUr+85wIb9S46MP5TxReIw8wDbqSxnm7YIC3DN/Ut7YrfufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 85A1B1EAC6A; Tue, 22 Sep 2026 15:56:14 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id A32011EAC5C;
	Tue, 22 Sep 2026 15:56:08 +0800 (AWST)
Message-ID: <d20cc2b2-afeb-432c-924b-55ad00d980fe@davidgow.net>
Date: Tue, 22 Sep 2026 15:56:06 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] rust: kunit: #[should_panic] and same test name
 with different #[cfg(...)] support
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Miguel Ojeda <ojeda@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 Jori Koolstra <jkoolstra@xs4all.nl>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Rae Moar <raemoar63@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein
 <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <cover.1789500084.git.nico.antinori.7@gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <cover.1789500084.git.nico.antinori.7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 16/09/2026 à 03:33, Nicolás Antinori a écrit :
> This patch series intends to implement two features for KUnit tests
> written in Rust. The work is based on a TODO comment made in the
> `bitmap.rs` module [1].
> 

Thanks very much for this series! It works fine here, but I think there 
are a few other options for how this could be implemented, and it's 
probably worth our at least considering them.

In particular, we've already got code for suppressing warnings, and I'm 
not sure whether it makes sense to unify all of the different attempts 
to intercept panics / bugs / warnings of various kinds.

That being said, Rust has unwinding and panic handlers as a core part of 
the language, and the C side of the kernel doesn't. Combine that with 
the fact that #[should_panic] is already standardised in Rust, and the 
argument for a separate implementation is not totally silly either.

Do you think that #[should_panic] should only trigger on a rust 
panic!(), or on any kernel panic? I'm leaning towards the former, but if 
the latter then we'd need to implement it in C and provide a C interface 
to it.

> 1. Supporting `#[should_panic]` [2]:
> 
> KUnit tests in Rust follow the user-space syntax, but at the moment
> `#[should_panic]` is not supported. The first patch of this series adds
> support for the attribute (only in its basic form, `#[should_panic =
> "message"]` is not supported, and I don't know if it makes sense to
> support it)
> 
> The way it is supported is by having a separate `#[panic_handler]` when
> `CONFIG_KUNIT` is enabled. When a test is marked with `#[should_panic]`,
> a static value (KUNIT_SHOULD_PANIC = 0xDEAD7357) is assigned to the
> kunit's `priv` field, since it is meant for saving arbitrary user data
> [3]. At the moment, I did not find any place where Rust tests use that
> field, so it should be safe to write it.

I don't think the `priv` field is the optimal place to put this. I don't 
think it's strictly a _problem_, particularly since Rust tests aren't 
using it, but nominally `priv` is for test use, and I'd rather not use 
it here (there may be future tests which want to use priv for something 
else, particularly as a quick way of passing test state between C and Rust).

For most of these sorts of things, I'd recommend using a KUnit 'named 
resource', but alas, there aren't any Rust binding for these. That being 
said, we've used named resources in C because they're setup at runtime 
(which is how we've handled this in the past). That's useful if we want 
to note that a particular line in the test wants to panic, but if we're 
only concerned with whether a test as a whole panics, then this could be 
static.

In that case, how about adding a new `rust_should_panic` field to 
`struct kunit_attributes`. If you only care about whether a panic 
occurs, this could just be a boolean, but it also could be a place to 
store, for example, a string to support #[should_panic = "message"] if 
you wish.

As an attribute, you could also then add it to lib/kunit/attributes.c 
(probably with PRINT_NEVER, as I don't think we need it included in KTAP 
output), which would, for example, allow us to filter tests by whether 
or not they expect to panic.

> 
> When the test panics, the `#[panic_handler]` function is called, obtains
> the kunit current test and checks if the `priv` field is not null and
> contains the value `KUNIT_SHOULD_PANIC`.
> 
> If those conditions are true, it marks the test as successful (since it
> panicked as expected) and calls `__kunit_abort_expecting_error`, a new
> function that exits the testing thread but fills `try_catch->try_result`
> with a 0 so the test runner does not mistake it as a failed test.
> 
> If those conditions are not true:
>   - If `priv` is null, the test panics as it would have before having
>     this feature, priv = null means that the test was not expected to
>     panic.
>   - If `priv` is not null but its value is not `KUNIT_SHOULD_PANIC`, the
>     test panics with an error message informing that the code found in
>     `priv` was invalid.
> 
> If the test does not panic, the `#[panic_handler]` is not triggered. The
> test is marked as failed (since it was expected to panic).
> 
> Regarding this feature:
>   - Do this approach make sense?

Yes, I think this approach makes sense. While I think a less 
rust-specific way of trapping panics could be useful (à la the 
suppressed warning system), I am erring on the side of implementing it 
this way given it (a) doesn't involve

>   - Is it ok to mark the `#[should_panic]` tests with a static constant?
>     Is another mechanism better to check in the `#[panic_handler]` that
>     the test was supposed to panic?

I think that we do want to base this off the struct kunit, though a 
special constant in 'priv' is not optimal. I'd go with either a named 
kunit resource (alas, which don't have Rust bindings) if we'd want to 
support extending this to specify a specific line / block panicking; or 
a new field in struct kunit_attributes.

> 2. Allow same test name with different #[cfg(...)]:
> 
> When testing `#[should_panic]` in `bitmap.rs` (check the last patch of
> the series) I found that the test that was supposed to panic had the
> same name as another one, but they were run on different configurations.
> This caused the following compilation error:
> 
> ERROR:root:error[E0428]: the name `kunit_rust_wrapper_owned_bitmap_out_of_bounds` is defined multiple times
>     --> ../rust/kernel/bitmap.rs:503:1
>      |
> 503 | #[macros::kunit_tests(rust_kernel_bitmap)]
>      | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `kunit_rust_wrapper_owned_bitmap_out_of_bounds` redefined here
>      |
>      = note: `kunit_rust_wrapper_owned_bitmap_out_of_bounds` must be defined only once in the value namespace of this module
>      = note: this error originates in the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
> 
> 
> To fix this problem, I appended to the `kunit_rust_wrapper_*`
> identifiers an 'stringified' version of the test's #[cfg(...)]
> arguments. The purpose of this is that, if we have a test with the same
> name and configuration, it would fail.
> 
> The configuration string was also appended to the tests names. This was
> done to have a better test run report:
> 
> ...
> [SKIPPED] owned_bitmap_out_of_bounds_cfg_not_config_rust_bitmap_hardened
> [PASSED] owned_bitmap_out_of_bounds_cfg_config_rust_bitmap_hardened
> ...
> 
> Otherwise we would have something like the following:
> ...
> [SKIPPED] owned_bitmap_out_of_bounds
> [PASSED] owned_bitmap_out_of_bounds
> ...
> 
> Regarding this:
> - Does it makes sense to allow same test names with different cfgs?

Yes-ish. I think it definitely makes sense for the same test to be 
redefined with different cfgs, but I'd rather only one of those tests 
then actually be compiled in (see below).

> - Is it ok to 'stringify' the configuration so it can be distinguished
>    in the report? Would you prefer something like `_case_1` `_case_2` ..
>    instead?

I don't _like_ this: my preference would be for us to keep the same 
name, and just not emit a test_case for anything which should be 
compiled out with cfg. Unfortunately, implementing that is a bit harder 
than would be ideal: we need a way of evaluating the cfg() arguments in 
a proc macro, I think. (Ultimately, because otherwise there's no way of 
statically determining the length of the TEST_CASES array?)

Unless you've got a good idea how to fix this, though, I'm happy to put 
up with adding the configs to the name for now. Though if there's a nice 
way to make the names shorter 
(rust_test_kunit_parse_cfg_in_kunit_test_cfg_config_rust_kunit_selftest_equals_n 
is definitely too long a test name, for instance), that'd be best.

> This is the first RFC patch I send to the LKML, if there's something not
> right with it please let me know.
> 
> Kind Regards,
> Nicolás
> 
> [1] https://github.com/Rust-for-Linux/linux/blob/fd73f4a6659897191fa0d40695fe370925dd3780/rust/kernel/bitmap.rs#L592-L600
> [2] https://doc.rust-lang.org/rust-by-example/testing/unit_testing.html#testing-panics
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/kunit/test.h?id=f6e7b42bf05b2427fb8a7a1d1c387a86638bb413#n314
> 
> Nicolás Antinori (3):
>    rust: kunit: add #[should_panic] support
>    rust: kunit: allow same test name with different #[cfg(...)]
>    rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case
> 
>   include/kunit/test.h      |  1 +
>   include/kunit/try-catch.h |  1 +
>   lib/kunit/test.c          | 14 +++++++
>   lib/kunit/try-catch.c     |  7 ++++
>   rust/kernel/bitmap.rs     | 40 +++++++++-----------
>   rust/kernel/kunit.rs      | 24 ++++++++++++
>   rust/kernel/lib.rs        | 46 +++++++++++++++++++++--
>   rust/macros/kunit.rs      | 78 ++++++++++++++++++++++++++++++++++++---
>   8 files changed, 181 insertions(+), 30 deletions(-)
> 
> --
> 2.47.3
> 

Cheers,
-- David

