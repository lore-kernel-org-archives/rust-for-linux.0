Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8953812FB
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 19:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501006; cv=none; b=Swcc/FBaTvoOR3d+Kjfi2k1m3CM2cBaoBUajbd09zaTux7Pp2+AVngjYbW8ia6SsTioIXJA+v4eiILqYjGHobKqOsOz2wXEqHJbGMahdb8ikdk4e+530UBdcE33owN178fKkNs648MGrGTss+NiKwWeXds5szk8+kwREeSbBa/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501006; c=relaxed/simple;
	bh=NZxyuYd8MBX4INnHpLnZWaZcXYmbCWHu3By/SP04rlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kqLji1YPB+j1qLW2mmygiLsEM0gRSAFaEJYcAJ+NT0dlCkMNMfuVH9pnwohmDwIdqMZP80C1gRAq1lUpkIqCtOTNT+c6N32/7oezzLIS8k+OD4qw43eccL4IrZY5lHgCiw+IgqRTzu5q3nq30f5xvBMViMlLJaRRAF2m4Uqzxso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZq/uiYk; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZq/uiYk"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78564319a92so36167137.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 12:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501003; x=1790105803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+JWI+F2CNEMS8Pu8FOZHWNS+sSqTKhiXS9hsbDKr4o=;
        b=eZq/uiYkHR71kkcAH4NT/0XzUHTinyM50HByJjHRtb0bE9AKkj6otMvlkTDx1Tl9ts
         wjki0yvRGZgYHsMO0nFL/vbtPQn6fIP8kTLUx3QwDAK7vBOmSzT6KA7DVLY7By63r+bk
         x7vQOerb8YWEKGX/7K4RcdCCSOTpX8eQTR/b7+w7Z02dEJnGQTvVRZj6266uquF54tYY
         GBnDrpgq6MOcDch/2hcCX8113LJ0T1CGjPvrWU3uCfymg7h0yHHfoaZfWpUvItUAKhj6
         qLJMypp6L+232poGxgVbMkACiSO/WQ7BR5supKoJdcMS6vkjcV4YloIOwFGDGSaHQzE1
         jSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501003; x=1790105803;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+JWI+F2CNEMS8Pu8FOZHWNS+sSqTKhiXS9hsbDKr4o=;
        b=n83f+wZSlBXltbuYT/ElFV3XEXkG+zdj88PeuSNhHv2Z+e5pVYu6WvNuZt8hktT1sT
         26O+Rl945iCaouydOWZfbO0WKETj1H2Hr9CRcmcKUpvB0DAfLiogQ/gk7sp76j54J1t9
         eBcS8cNArEA08d3hBVMGmvC70tTTk01xNgW6TUD4aMDHVY6db5eOusp5ItNrzRfi+qew
         cZfYNlUGZqNwh/mU/Lv30Q0mFha3YW8Rt3V8ZzZwy1iZTCHhrAl7vhxYkd/iys2f+qEX
         H9HWX4/U7dnPSfNNwQo5b4ZmHBmOy0nmnVaYj6kmb5yWob3tIswSnwHJfRpdyde0xJb5
         vKbA==
X-Forwarded-Encrypted: i=1; AKwUvBx/uPrmnLB3wLNobSoiVLdQJuBbbG0MeyXDsoMphlh6gKJ1GNYNyQ9L4eYsFKsxTC9sY2kdndqb46yla37Akg==@vger.kernel.org
X-Gm-Message-State: AFuF++khCfURaaBZM2YIGMWJx/bHX5zSuJTEFd+QuBZwUjDJlz9u0h7G
	5Juake8RYqxfx/yVRKDv0oOxXLASInyJQouiHD3Cbqi+5XqztvcMvgs=
X-Gm-Gg: AYBFou1sx1ZQtnNqSuMtuXrCMSzOaBwRcJn3Jz8XJE5cW+EdrMHMCdt5Bib3DCmNMv/
	pkCqatNq6ZokWudcadgxeGQjMcfJ+AzRyTl9X42VSFKT6tgVSWRMDRyXQ/a+yIR9Kgxvx0Nrqxe
	1kdGVjCm5t/yr0Agod0bEqOWWBGbRQK69VLhMYkn1VMWLKbcYF8+A+jgjI6zkShpnsqkiQOc+hA
	H6AYjkPGHSq5gWqecAlj5Bbf2PAbzFkLjneOsQnjhlczDprh/6yxZjXGGkB1TzTra4JR1gcaHEz
	Cq+Wn5v28eBooYpXvQetFpaj80TqzuZ0TycfJQsXonxQWymDD7kfDdHXV22VWwqSfmzxDLA4QhZ
	Arm47Gm56l+Ukc2XmdUwPepxmLdn7oFh6lV4+mOwNmV4KrxRGa93BiVHE6YYRoxtoOIAGblrooD
	2pFJXBSsOwhF8c2BS3i6Og4woUjQAolShdlo0Ynx5fXLcAlK3bAymzLAUOFJxtmcP9z4SCeVK9K
	ebImktkvK+Ku/wA4pQ9+9p2poYFVOslH1ugRJH/d1Yi3OonVw==
X-Received: by 2002:a05:6102:510b:b0:778:5369:763d with SMTP id ada2fe7eead31-79b56aec243mr10445153137.1.1789501003323;
        Tue, 15 Sep 2026 12:36:43 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb1148f57sm691450137.4.2026.09.15.12.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:36:42 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Yury Norov <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH RFC 0/3] rust: kunit: #[should_panic] and same test name with different #[cfg(...)] support
Date: Tue, 15 Sep 2026 16:33:51 -0300
Message-ID: <cover.1789500084.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series intends to implement two features for KUnit tests
written in Rust. The work is based on a TODO comment made in the
`bitmap.rs` module [1].

1. Supporting `#[should_panic]` [2]:

KUnit tests in Rust follow the user-space syntax, but at the moment
`#[should_panic]` is not supported. The first patch of this series adds
support for the attribute (only in its basic form, `#[should_panic =
"message"]` is not supported, and I don't know if it makes sense to
support it)

The way it is supported is by having a separate `#[panic_handler]` when
`CONFIG_KUNIT` is enabled. When a test is marked with `#[should_panic]`,
a static value (KUNIT_SHOULD_PANIC = 0xDEAD7357) is assigned to the
kunit's `priv` field, since it is meant for saving arbitrary user data
[3]. At the moment, I did not find any place where Rust tests use that
field, so it should be safe to write it.

When the test panics, the `#[panic_handler]` function is called, obtains
the kunit current test and checks if the `priv` field is not null and
contains the value `KUNIT_SHOULD_PANIC`.

If those conditions are true, it marks the test as successful (since it
panicked as expected) and calls `__kunit_abort_expecting_error`, a new
function that exits the testing thread but fills `try_catch->try_result`
with a 0 so the test runner does not mistake it as a failed test.

If those conditions are not true:
 - If `priv` is null, the test panics as it would have before having
   this feature, priv = null means that the test was not expected to
   panic.
 - If `priv` is not null but its value is not `KUNIT_SHOULD_PANIC`, the
   test panics with an error message informing that the code found in
   `priv` was invalid.

If the test does not panic, the `#[panic_handler]` is not triggered. The
test is marked as failed (since it was expected to panic).

Regarding this feature:
 - Do this approach make sense?
 - Is it ok to mark the `#[should_panic]` tests with a static constant?
   Is another mechanism better to check in the `#[panic_handler]` that
   the test was supposed to panic?

2. Allow same test name with different #[cfg(...)]:

When testing `#[should_panic]` in `bitmap.rs` (check the last patch of
the series) I found that the test that was supposed to panic had the
same name as another one, but they were run on different configurations.
This caused the following compilation error:

ERROR:root:error[E0428]: the name `kunit_rust_wrapper_owned_bitmap_out_of_bounds` is defined multiple times
   --> ../rust/kernel/bitmap.rs:503:1
    |
503 | #[macros::kunit_tests(rust_kernel_bitmap)]
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `kunit_rust_wrapper_owned_bitmap_out_of_bounds` redefined here
    |
    = note: `kunit_rust_wrapper_owned_bitmap_out_of_bounds` must be defined only once in the value namespace of this module
    = note: this error originates in the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)


To fix this problem, I appended to the `kunit_rust_wrapper_*`
identifiers an 'stringified' version of the test's #[cfg(...)]
arguments. The purpose of this is that, if we have a test with the same
name and configuration, it would fail.

The configuration string was also appended to the tests names. This was
done to have a better test run report:

...
[SKIPPED] owned_bitmap_out_of_bounds_cfg_not_config_rust_bitmap_hardened
[PASSED] owned_bitmap_out_of_bounds_cfg_config_rust_bitmap_hardened
...

Otherwise we would have something like the following:
...
[SKIPPED] owned_bitmap_out_of_bounds
[PASSED] owned_bitmap_out_of_bounds
...

Regarding this:
- Does it makes sense to allow same test names with different cfgs?
- Is it ok to 'stringify' the configuration so it can be distinguished
  in the report? Would you prefer something like `_case_1` `_case_2` ..
  instead?

This is the first RFC patch I send to the LKML, if there's something not
right with it please let me know.

Kind Regards,
Nicolás

[1] https://github.com/Rust-for-Linux/linux/blob/fd73f4a6659897191fa0d40695fe370925dd3780/rust/kernel/bitmap.rs#L592-L600
[2] https://doc.rust-lang.org/rust-by-example/testing/unit_testing.html#testing-panics
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/kunit/test.h?id=f6e7b42bf05b2427fb8a7a1d1c387a86638bb413#n314

Nicolás Antinori (3):
  rust: kunit: add #[should_panic] support
  rust: kunit: allow same test name with different #[cfg(...)]
  rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case

 include/kunit/test.h      |  1 +
 include/kunit/try-catch.h |  1 +
 lib/kunit/test.c          | 14 +++++++
 lib/kunit/try-catch.c     |  7 ++++
 rust/kernel/bitmap.rs     | 40 +++++++++-----------
 rust/kernel/kunit.rs      | 24 ++++++++++++
 rust/kernel/lib.rs        | 46 +++++++++++++++++++++--
 rust/macros/kunit.rs      | 78 ++++++++++++++++++++++++++++++++++++---
 8 files changed, 181 insertions(+), 30 deletions(-)

--
2.47.3

