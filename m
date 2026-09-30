Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793C4E06EC;
	Wed, 30 Sep 2026 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774632; cv=none; b=l+wxrcCs+Fezwe5jBFWpmUDa9pDYHf6vT/3YGSPj/4rz4rTCanMkpXBQUiWmL/5GLoSfH8V2DtO2Sh38/Z6pl+iBeF4KIuA5fMZjUQVNVVF5CA5zGWn8DlUb7REsKd323dfD7vx3dRs/jyKaF+na0kBWYRvA+G1HuYbth2nALaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774632; c=relaxed/simple;
	bh=VGHctiLRGLtxCXo9/4XFlJUglmSuiMVZOShKuE7rVnw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=icglwt8EEz4Dg2YD9UmBK2MFcD2T2Q1oVzYKvq0UZ5MES7YTWJypbYh0jZCa7cPQFqyVj+jOVFdpvyZ1oIig+sqqdtCyx4NYfDwVWjUJxA0w03NJIUupJ6UXaTB+M3e3nRPJeAGFVZzt0wYuiJ2GimS7OQPkMthjbAxOT0qdD30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJxKcjNk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJxKcjNk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D12F2C2BCF4;
	Wed, 30 Sep 2026 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790774629;
	bh=VGHctiLRGLtxCXo9/4XFlJUglmSuiMVZOShKuE7rVnw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SJxKcjNkWgB9BYVHgZ4TfndRpIWN58d0/pQkdYhugz8GUQVBoYJZY5lsXu8WmGRJg
	 u60EaChrB5lesHOBAOxXQL6Smrzjo72bW9FrFR7mKggHSpxxAWj1hAVnojszpJn1X2
	 JxJPyMnCb4hWA8TQuWu8C/4WzaMV1URaM1SBSAaj7Ywbl93+AUMAlzamPd0qST/K6L
	 67fomaGStR0cXyIlbZ05a+5sL0h68RIkkr82RvGA+Qv3oRdqXJs+lcDoWzoRB0lSSG
	 Zas+5tpAXwaWvOtd/kjiV4ca1Nx4hfuelke/cd5gZsIzMUh92vQ//5LsKpmd+m5V6w
	 fwXKykBrwLIZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98D4CA5FAC;
	Wed, 30 Sep 2026 13:23:49 +0000 (UTC)
From: =?utf-8?q?Nicol=C3=A1s_Antinori_via_B4_Relay?= <devnull+nico.antinori.7.gmail.com@kernel.org>
Subject: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
Date: Wed, 30 Sep 2026 10:23:27 -0300
Message-Id: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAE8NvWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS2MD3aLS4pL47NK8zJL4MhNd88SkxNRUQ8NUs8RkJaCegqLUtMwKsHn
 RsbW1ANhmrY1fAAAA
X-Change-ID: 20260930-rust_kunit_v4-7abaee11e6ac
To: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Miguel Ojeda <ojeda@kernel.org>
Cc: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn1_gh@protonmail.com>, 
 Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Jori Koolstra <jkoolstra@xs4all.nl>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3413;
 i=nico.antinori.7@gmail.com; h=from:subject:message-id;
 bh=VGHctiLRGLtxCXo9/4XFlJUglmSuiMVZOShKuE7rVnw=;
 b=owGbwMvMwCV2QdXfwqNJ1YjxtFoSQ9Ze3uQpQg1cP3Ynumcdyv0WdOoQ62KeWu/bh+zWp745p
 Vg0x8C4o5SFQYyLQVZMkWUu5/vPxrbmFeXSm4Jg5rAygQxh4OIUgIn0KzP8lYxKc6gKZwqMUbg1
 QU7vkcxHxtXNGY7KzwP57nj/vqG4muG/j7K44XTjbblnThzt+nAtf7uU5fmZnxxUp9j+3L3i8P4
 JjAA=
X-Developer-Key: i=nico.antinori.7@gmail.com; a=openpgp;
 fpr=9D09EFF3333D3778771BB252D0254F3848822532
X-Endpoint-Received: by B4 Relay for nico.antinori.7@gmail.com/default with
 auth_id=1086
X-Original-From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Reply-To: nico.antinori.7@gmail.com

This patch series intends to implement two features for KUnit tests
written in Rust. The work is based on a TODO comment made in the
`bitmap.rs` module [1].

Changelog:
- RFC patch: [3]

1. Supporting `#[should_panic]` [2]:

KUnit tests in Rust follow the user-space syntax, but at the moment
`#[should_panic]` is not supported. The first patch of this series adds
support for the attribute (only in its basic form, `#[should_panic =
"message"]` is not supported yet).

The way it is supported is by adding a new boolean property called
`rust_should_panic` to `kunit_attributes` struct in kunit/test.h and
check for the `try_catch->try_result` code and the named flag to detect
if there was a panic in `lib/kunit/test.c::kunit_run_case_catch_errors`
function.

The difference with the previous version [3] is that now, almost
everything is handled in the C side, meaning that we don't have a
separate `#[panic_handler]` when KUnit tests are active. In other words
there's no need of a Rust side panic handler because the C side catches
Rust's panics too, since the `#[panic_hanlder]` executes a
bindings::BUG().

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

Now, only the tests with an active `#[cfg(...)]` will be executed by the
runner. Tests with an inactive `#[cfg(...)]` will not appear in the
report since they are not added to the TEST_CASES array.

[1] https://github.com/Rust-for-Linux/linux/blob/fd73f4a6659897191fa0d40695fe370925dd3780/rust/kernel/bitmap.rs#L592-L600
[2] https://doc.rust-lang.org/rust-by-example/testing/unit_testing.html#testing-panics
[3] https://lore.kernel.org/rust-for-linux/cover.1789500084.git.nico.antinori.7@gmail.com/

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Nicolás Antinori (3):
      rust: kunit: add #[should_panic] support
      rust: kunit: allow same test name with different #[cfg(...)]
      rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case

 include/kunit/test.h   |  1 +
 lib/kunit/attributes.c | 18 ++++++++++++++++++
 lib/kunit/test.c       |  5 +++++
 rust/kernel/bitmap.rs  | 40 ++++++++++++++++++----------------------
 rust/kernel/kunit.rs   | 37 +++++++++++++++++++++++++++++++++++++
 rust/macros/kunit.rs   | 48 ++++++++++++++++++++++++++++++++++++++----------
 6 files changed, 117 insertions(+), 32 deletions(-)
---
base-commit: d266640c6c760c9bc215bf5a3ece122ca488b6f5
change-id: 20260930-rust_kunit_v4-7abaee11e6ac

Best regards,
-- 
Nicolás Antinori <nico.antinori.7@gmail.com>


