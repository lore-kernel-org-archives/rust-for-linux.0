Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7028A1891A9
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691557; cv=none; b=Uxdd+fCGcG7K9fFW8zb+5BHj89rdrvUNqDx39ycLjS/ev90mdxVG3C8U8StnchGdqbG2pfsqgKYjGsMC1u4zbk9fPhxcM65IvQYAV7YGd2/yFtkSPyvFt1avOmu/AJcVoe+fl8gB63NXQFbjndzOkvH/F/d2u9qj8ly9LVVYZHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691557; c=relaxed/simple;
	bh=DcbTLHD/tVnZXO6Wcep2ztjwIHfAxEpXw9x6ciDS0H4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DyjU2TVevOcXjLMv65SBnMKrYIcP/XdE764tt2Avqb2rIrK8T0k8Zp9dH/NgY9zbN4WTt9kWpLVsMh4I5V0NUDGMfULS7scgIHWNZfXEJRK7RWbB5O0fn9NoAY1WBSJ4pfVcAXwpkd8rg1EH2JswfvqMq1/MIX8rKmS0XV7qfIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/EahVrV; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/EahVrV"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04be87so940095c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691555; x=1791296355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0iuzWgmMrAdCcDL0sS3FSyhRSjl5Wen75MYK1Cmll8=;
        b=G/EahVrV6VudcNY/jj+pOe1dJD5YUuISkj7d5KyZH0Jupx5WqIt+DJrirnbBWe9ddS
         uukGApyZYWuRdlDSBki/gbjMUNbZfnKNYJSs7ttVKePjDwJSGilRSQTVFT+Qb/qkxedt
         QSRVYq7wq0RAjJwlS3XvKoq8pXyZn9zRlEuMd98eEB0/H30fHVaJkWVK51zZdYYfNhjX
         vVPH66H6o7slgCq7NxvP56FL6rGuxCpjASXGiA1kpCleqrWQR1RFvzWG68nZ9rjxc+eH
         azWmuF/mt/4u5vlrUuWXTGedTLRfzvo5JxXqG8NTekm5OxtAa9kadhoQzUj6+8e1kcDC
         l2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691555; x=1791296355;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o0iuzWgmMrAdCcDL0sS3FSyhRSjl5Wen75MYK1Cmll8=;
        b=Jg7Q5k+82azU431htsodJ8Hqqt5/wNXDlrQ7+5kcyfls8XktQYoTGuPKKEPUdEKxwY
         1ZfFrXwUm4Qd2EhvJGQ1eplm1DqKEH2chfkaSKI94c7S99lCDIIdngjapwbPwumMFapr
         wGgSvJ665nXQKeRlZuHxEd/Y+JRPwl+p7fZ/2SK77ydNvqQxN9JC6UDKYiveKHth4JrM
         FIz6BBRcmGqxH+dWVhs+u4Bb4lhR4wlo4q/OnzKlhgHWGdNPOicoTpmegOIwm3iMpJPU
         J6N3w1O9HHE8zu3AezL59CgaD1ITKOXyHf0EYmspeo6Sg38oyUkH3DiERCzk7RtnfL7u
         dHBA==
X-Forwarded-Encrypted: i=1; AKwUvBzTQB16+Y2rQR97oPfPXhSjb/2xaBhuY0PUC53CPBMypigRro3fSTB8IsOvMgrkU2bBJZj2ulUPOkyax3yZjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mQr+vcGaK5BE1BGneKSyF/2SHucCTr2ChuaoSX2gMUuiI+tM0T
	YL42J+ciRQxegkH+sO0GQRyx+dbOlISziW+B7scTJ5/tAo5JKXVLGCfuaSN9
X-Gm-Gg: AYBFou22udpE65dJ9l2M3Vxdo01Otmh6gFRiSfNa2KoaWjkteKwPpdJlNbrgD+VcpvA
	2QyfPuvuSwoVuYUE/aFP/l/8Lo4YCOLEL/EVtwALcmyX6AAfalfLcVmTqUWhF9X1pGN28cnXuyY
	0u1tXXi42GCriO4EZPgQrF5StzAidNA6oyGT/8A45v/uLT5/kPiD5lR/OEUM9grm5UgjO3Ijbih
	+iboKFKhP7uaKM802FV6VsqteYRJJbfcyIPVHgka6TrlQ1lY+l5cfWhngzExk2iL3gwunQk3wfX
	s822f2UN0WtnGntzC5Pjok8csjy+bbTVt0o4+YPwCrogUOEf2Pb/m7+8EZSqWcXN9GQG01SgVCG
	4RjD+KgiBX9ubO8Og2zXsKu5nfunDKJbJRdTOzLteuc4tvWP8+KNtJXpicT3Uod3uv4CvCXpHjT
	ndz/BxorS7YfuzQWWJJixHgyFdzYpd6HfJhR9CPId/idLy5RvpvYVpu/1bsOKfrZkj673LqhGR+
	fK3Egawbo0mF97DgPlkMfuvM6TwwrDjlepARRVQXFH+nZvYfg==
X-Received: by 2002:a05:693c:65d6:b0:340:c464:1a2f with SMTP id 5a478bee46e88-34270ab09f7mr15069104eec.16.1790691213669;
        Tue, 29 Sep 2026 07:13:33 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm34733297eec.24.2026.09.29.07.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:13:29 -0700 (PDT)
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
Subject: [PATCH 0/3] rust: kunit: support #[should_panic] and same test name with different #[cfg(...)]
Date: Tue, 29 Sep 2026 11:07:40 -0300
Message-ID: <cover.1790599486.git.nico.antinori.7@gmail.com>
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

Nicolás Antinori (3):
  rust: kunit: add #[should_panic] support
  rust: kunit: allow same test name with different #[cfg(...)]
  rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case

 include/kunit/test.h   |  1 +
 lib/kunit/attributes.c | 18 ++++++++++++++++
 lib/kunit/test.c       |  5 +++++
 rust/kernel/bitmap.rs  | 40 ++++++++++++++++-------------------
 rust/kernel/kunit.rs   | 37 ++++++++++++++++++++++++++++++++
 rust/macros/kunit.rs   | 48 +++++++++++++++++++++++++++++++++---------
 6 files changed, 117 insertions(+), 32 deletions(-)

--
2.47.3

