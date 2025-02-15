Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC08198E78
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Feb 2025 09:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739610393; cv=none; b=PTSnBaftmJhMzY/y0+nsmdEmD4wHM9nBACE2clWNCsFkEfmm+U5hbE87C/Bdj73PZqMEDW/sj0GC9w0kZpszPP98AmOVJ9tMeon5ZHci/ZpGuhbII3Ce6S0LLuqKvWhBSs9l1c6s5ICD3ZlzM+8FKhmDTqoYRFyTWFpnJAsH5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739610393; c=relaxed/simple;
	bh=iDAJsI0tQXq58igUlZahn2t0Z5JBIlJCkLHgREaCk1c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bAe0HcAd9D21hftUsfI9QitNlFfYy7rgXXl1yijkqL2fa2C7UGWZviJu56c6/RmeA6GVv6/8QE3RlwxifMhGoFH9wJWK1n7FcB4R/HD6ZE6RvPHCPU6AJ6PfVWxb/26Lqad9nU1IVgLFLwQP5d7ZlHpvI/8JGdJxK2MQwUugQ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YpMhzKaZ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YpMhzKaZ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-220f0382404so31100965ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Feb 2025 01:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739610391; x=1740215191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NQRyd0F7BKZh087rrQFW8k6283qvnshjN9rutxPqWIc=;
        b=YpMhzKaZv5Q6gnfIVeHCm//ph0BsxWUvQt387JpJJVm6AuAi+0ARdAtRRlvcsI4/gJ
         M96XW9nYAu3X9nCqqxJOuiaowJWqkWjbYpMaVZHh9XeZ+GnAVwv797GtA+tPzYf/MnpW
         LgCngbZAvBET7hSi1SIz14mQP+4JOKhNxYkANwuLl8powqSu/8f3U9lHNIxFNzXi8Ixt
         kAyfcz+265WwFlLSKP4IKvOz/kJD05X4fP6ZP7nuLbQmreKnymD4ZhhEXlwWLVXKiJ8c
         fAL5xargg7S+nv6Ti7TRFfAygG0hKhXL78Vki3GIdeq+wSS6sg3PBMP7hzO2cBBlRrh1
         zIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739610391; x=1740215191;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQRyd0F7BKZh087rrQFW8k6283qvnshjN9rutxPqWIc=;
        b=emHuz8c52l7QDl6mABQhHPuAM4Ki3oWVpzAPIDHK3v3xGptaPKnHYRvAYWfQZ4hHPH
         wz2QiiSKPZ/deVFr4zVEzjDnU8uNqzzcRt770UWAFhylAOmeiInXKFFEbVpkyTkwCL/b
         dqVRaE0yqtGgmGA+gaW0JjD6hdhZ0USUSnJzFYZFwiNHyMvBweW9oEPa1lNStiFI84IV
         zVyZNyjQFUWOFPmzQOuahwfV/rn8gR45ftPzAHI3KiWOVs3aQVuMmMx9DRFYaSzQTy1s
         MMuuz3b85Mkr3/e6b0DRQT4GaOeRUYNbU/iQutoX9u8vEiZ/dW78OSvvnKSoJuA3W2cr
         ANkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI7UWo+JorvK6CiLPV3qhBa/GT3hm0FFbAtHqNHURrDlD+ti0z8aCjNBRpcj7VGfh5tN6P1Qwq86ODLWJuxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9SuZ1xoX+gPfqKUydZW9HsPmO48Z2dT06FAdBIi2DXLBf7afV
	0aHRLpN0vbmhTqSJ0p96ToRY7FpgKKWQ8mU+0Y435IBrdsTc10Pc+NNP+9U0nFlJQ/M/KTX+sZS
	QMf8a2iohfQ==
X-Google-Smtp-Source: AGHT+IECq3E5vULHURfwTLuhCmRc1tM0x9VBo1aFiYiADPBTXR68KA9qWpxKPEruAsY8LlG6aq3KJiwoPuEC7Q==
X-Received: from pgcs136.prod.google.com ([2002:a63:778e:0:b0:add:b2fa:214d])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce0d:b0:21f:89e5:272d with SMTP id d9443c01a7336-22103f0507emr44780945ad.10.1739610390714;
 Sat, 15 Feb 2025 01:06:30 -0800 (PST)
Date: Sat, 15 Feb 2025 17:06:17 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250215090622.2381038-1-davidgow@google.com>
Subject: [PATCH v7 0/3] rust: kunit: Support KUnit tests with a user-space
 like syntax
From: David Gow <davidgow@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, 
	"=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?=" <jose.exposito89@gmail.com>, Rae Moar <rmoar@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <benno.lossin@proton.me>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Matt Gilbride <mattgilbride@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

This is v7 of the Rust/KUnit integration patch. I think all of the
suggestions have at least been responded to (even if there are a few I'm
leaving as either future projects or matters of taste). Hopefully this
is good-to-go for 6.15, so we can start using it concurrently with
making any additional improvements we may wish.

This series was originally written by Jos=C3=A9 Exp=C3=B3sito, and has been
modified and updated by Matt Gilbride, Miguel Ojeda, and myself. The
original version can be found here:
https://github.com/Rust-for-Linux/linux/pull/950

Add support for writing KUnit tests in Rust. While Rust doctests are
already converted to KUnit tests and run, they're really better suited
for examples, rather than as first-class unit tests.

This series implements a series of direct Rust bindings for KUnit tests,
as well as a new macro which allows KUnit tests to be written using a
close variant of normal Rust unit test syntax. The only change required
is replacing '#[cfg(test)]' with '#[kunit_tests(kunit_test_suite_name)]'

An example test would look like:
	#[kunit_tests(rust_kernel_hid_driver)]
	mod tests {
	    use super::*;
	    use crate::{c_str, driver, hid, prelude::*};
	    use core::ptr;

	    struct SimpleTestDriver;
	    impl Driver for SimpleTestDriver {
	        type Data =3D ();
	    }

	    #[test]
	    fn rust_test_hid_driver_adapter() {
	        let mut hid =3D bindings::hid_driver::default();
	        let name =3D c_str!("SimpleTestDriver");
	        static MODULE: ThisModule =3D unsafe { ThisModule::from_ptr(ptr::n=
ull_mut()) };

        	let res =3D unsafe {
	            <hid::Adapter<SimpleTestDriver> as driver::DriverOps>::registe=
r(&mut hid, name, &MODULE)
	        };
	        assert_eq!(res, Err(ENODEV)); // The mock returns -19
	    }
	}


Please give this a go, and make sure I haven't broken it! There's almost
certainly a lot of improvements which can be made -- and there's a fair
case to be made for replacing some of this with generated C code which
can use the C macros -- but this is hopefully an adequate implementation
for now, and the interface can (with luck) remain the same even if the
implementation changes.

A few small notable missing features:
- Attributes (like the speed of a test) are hardcoded to the default
  value.
- Similarly, the module name attribute is hardcoded to NULL. In C, we
  use the KBUILD_MODNAME macro, but I couldn't find a way to use this
  from Rust which wasn't more ugly than just disabling it.
- Assertions are not automatically rewritten to use KUnit assertions.

---

Changes since v6:
https://lore.kernel.org/rust-for-linux/20250214074051.1619256-1-davidgow@go=
ogle.com/
- Fixed an [allow(unused_unsafe)] which ended up in patch 2 instead of
  patch 1. (Thanks, Tamir!)
- Doc comments now have several useful links. (Thanks, Tamir!)
- Fix a potential compile error under macos. (Thanks, Tamir!)
- Several small tidy-ups to limit unsafe usage. (Thanks, Tamir!)

Changes since v5:
https://lore.kernel.org/all/20241213081035.2069066-1-davidgow@google.com/
- Rebased against 6.14-rc1
- Fixed a bunch of warnings / clippy lints introduced in Rust 1.83 and
  1.84.
- No longer needs static_mut_refs / const_mut_refs, and is much cleaned
  up as a result. (Thanks, Miguel)
- Major documentation and example fixes. (Thanks, Miguel)

Changes since v4:
https://lore.kernel.org/linux-kselftest/20241101064505.3820737-1-davidgow@g=
oogle.com/
- Rebased against 6.13-rc1
- Allowed an unused_unsafe warning after the behaviour of addr_of_mut!()
  changed in Rust 1.82. (Thanks Boqun, Miguel)
- "Expect" that the sample assert_eq!(1+1, 2) produces a clippy warning
  due to a redundant assertion. (Thanks Boqun, Miguel)
- Fix some missing safety comments, and remove some unneeded 'unsafe'
  blocks. (Thanks Boqun)
- Fix a couple of minor rustfmt issues which were triggering checkpatch
  warnings.

Changes since v3:
https://lore.kernel.org/linux-kselftest/20241030045719.3085147-2-davidgow@g=
oogle.com/T/
- The kunit_unsafe_test_suite!() macro now panic!s if the suite name is
  too long, triggering a compile error. (Thanks, Alice!)
- The #[kunit_tests()] macro now preserves span information, so
  errors can be better reported. (Thanks, Boqun!)
- The example tests have been updated to no longer use assert_eq!() with
  a constant bool argument (which triggered a clippy warning now we
  have the span info).

Changes since v2:
https://lore.kernel.org/linux-kselftest/20241029092422.2884505-1-davidgow@g=
oogle.com/T/
- Include missing rust/macros/kunit.rs file from v2. (Thanks Boqun!)
- The kunit_unsafe_test_suite!() macro will truncate the name of the
  suite if it is too long. (Thanks Alice!)
- The proc macro now emits an error if the suite name is too long.
- We no longer needlessly use UnsafeCell<> in
  kunit_unsafe_test_suite!(). (Thanks Alice!)

Changes since v1:
https://lore.kernel.org/lkml/20230720-rustbind-v1-0-c80db349e3b5@google.com=
/T/
- Rebase on top of the latest rust-next (commit 718c4069896c)
- Make kunit_case a const fn, rather than a macro (Thanks Boqun)
- As a result, the null terminator is now created with
  kernel::kunit::kunit_case_null()
- Use the C kunit_get_current_test() function to implement
  in_kunit_test(), rather than re-implementing it (less efficiently)
  ourselves.

Changes since the GitHub PR:
- Rebased on top of kselftest/kunit
- Add const_mut_refs feature
  This may conflict with https://lore.kernel.org/lkml/20230503090708.252431=
0-6-nmi@metaspace.dk/
- Add rust/macros/kunit.rs to the KUnit MAINTAINERS entry

---

Jos=C3=A9 Exp=C3=B3sito (3):
  rust: kunit: add KUnit case and suite macros
  rust: macros: add macro to easily run KUnit tests
  rust: kunit: allow to know if we are in a test

 MAINTAINERS          |   1 +
 rust/kernel/kunit.rs | 199 +++++++++++++++++++++++++++++++++++++++++++
 rust/macros/kunit.rs | 161 ++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs   |  29 +++++++
 4 files changed, 390 insertions(+)
 create mode 100644 rust/macros/kunit.rs

--=20
2.48.1.601.g30ceb7b040-goog

