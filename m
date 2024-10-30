Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F4E19342D
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Oct 2024 04:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730264258; cv=none; b=MYjAPyueAHPbffK8mc2Elp/iKcw8MitNNgafSWyeCCNQxc0IYzWMxCasgBEWxDLxEw4jCq5REL5EMGpYW1XGXU5dU4IXoXk3Zl2QSUnyUMwU3nDybrEUq8audrb7AiYwNItA197yzs8ETbp49Oif5IhwZxfSUOoWr46G9BFmqTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730264258; c=relaxed/simple;
	bh=DtIOSEQKKLpAj/+xE1AONx5IIk6McemYmz68qg3RKmY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QDEE8cIUV5Z7HUkEiM9znJHJf5Go+JmsUyAhg+ZC9am02ePEKz1NH71ghSDa4gJCwIs4xlSP53f6RUFqJ4FZLdF7u2Q7TH3oV6UA9NFNNaT3yYXlk5WH9jinrBBItisWtNhu9gbQAHIcq57pnDCaCAyHlrKD5svzzk/lLKc+/Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kc2XDvHc; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kc2XDvHc"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e30ceaa5feeso1197990276.2
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 21:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730264254; x=1730869054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OzCKlPiacY/Sq4Wm1aNv+IrNJi4b5UWZM+e8BOY3spE=;
        b=Kc2XDvHc540i14tiZGn8y/Ec5nGzOhhBPdGIybpUVQfd8c4thUssPXnbfy/ixswg09
         DrfHHM8MAjMLlPtendphTVFiN8JHojf3eSD+xN+E6St9bTzPrGFZwFtQnyXmC7MbgIc6
         ULoduq03s3c5CdvQmET94tnzIY+vPyGSj9+UtIj6p7c+taC26yeG9VA/JGXyIIu+fkHT
         /jcCDLqrNsR1oc1TKVvEi/+jDNHdysm1fZ3nOqRCLN8tH1wNAXBZtHRJOG7DUbmtUGwG
         /kBNHYfeJX61+Bh6BZPHXCt487hAPVzIOdhaztUXuGOCP/XHtjfnkeAtZEvJaKTvPnFf
         OUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730264254; x=1730869054;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzCKlPiacY/Sq4Wm1aNv+IrNJi4b5UWZM+e8BOY3spE=;
        b=NQtGM+cxwUu7kBZj7H5jwdSpQVWAvBw+rx89qAtewdg/BJAKoGl8jQwuDF9rG0nR62
         LKqLIzCR1eqJq/lgr5uDQ25RBTfvaPB0jF8ZS3E3ylfqW3EdvRlBdXyfXc/hNoInaiJm
         Y5MKwQum1KVKCCIz/78/37DCwas1um1Z5cpO9YgRr4TXVCDSOZpjTMcgaTuMRmyPqayj
         +sjr8qX3dTslL4QW9nCsuBkkPwPrgRVCj/7xd0b2y9/Y9XV/avWoBlTbBlQ2iGNpqdTm
         Vwsw0/nv0I02JS3+AgzL2WwTQe1kxRWkfFB+XWNCWChtG6NQZ749wFK9nmMo0FFFLXtY
         G8+w==
X-Forwarded-Encrypted: i=1; AJvYcCVhpkk6T5PDaaX6eh5bY+ItSAjoWu05fCAyknHTMLElKaf1XGjZaN3IJReF05hdb8keG103Tf2j3h+6MBcFVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzozcB2Cd92UIsDTjQb170b6jXt3D4NNKcHf59GTit4TVsyqG9q
	Z2P2ovaGc2yGhPYsUnEq/5Mfa7RnLxd9qMXfL8Jr+VdY7UAECNxmfzqSlLadbqOdQHtnPjVdlM4
	CFNB7lGffgg==
X-Google-Smtp-Source: AGHT+IFGjEe1plkuPShegWLbmtJ5p5Somjkyq6IDW0pOxQWBMN5X1q141+OuEQVEOHATX83b25iWp11NcW8szg==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:b1:7045:ac11:6237])
 (user=davidgow job=sendgmr) by 2002:a25:ec0b:0:b0:e30:da65:7240 with SMTP id
 3f1490d57ef6-e30da657350mr434276.3.1730264253682; Tue, 29 Oct 2024 21:57:33
 -0700 (PDT)
Date: Wed, 30 Oct 2024 12:57:10 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030045719.3085147-2-davidgow@google.com>
Subject: [PATCH v3 0/3] rust: kunit: Support KUnit tests with a user-space
 like syntax
From: David Gow <davidgow@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, 
	"=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?=" <jose.exposito89@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <rmoar@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <benno.lossin@proton.me>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Matt Gilbride <mattgilbride@google.com>
Cc: David Gow <davidgow@google.com>, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This series was originally written by Jos=C3=A9 Exp=C3=B3sito, and has been
modified and updated by Matt Gilbride and myself. The original version
can be found here:
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
 rust/kernel/kunit.rs | 191 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs   |   1 +
 rust/macros/kunit.rs | 153 ++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs   |  29 +++++++
 5 files changed, 375 insertions(+)
 create mode 100644 rust/macros/kunit.rs

--=20
2.47.0.163.g1226f6d8fa-goog

