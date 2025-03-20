Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD6470807
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436479; cv=none; b=vAn+pumjYjVDSr5IQwtz0WF7kFFgW46uGqoCnU2YrQ7MwAhnrMi6Kdv64K4NTc9Ez5cdw7y8s45KVOYkXXLl/zrr+n6i4DHARAi9dSGa5NZ7T9IUuJ7xrnlE2qGBCqdojS7TcT0xkicm92bVhL3GiFyWKewijLskBpYQyhOBLgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436479; c=relaxed/simple;
	bh=FPOaIYLnn2OPEVTSCHCF4VOFfG1fiD4ZDOeP/ou1wVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=etpOFLR13OVlonCi/RQDLNPyjc1eZ/wUHEJTc+ic7F9st33TOTAWlHLraiq7+nV06eRLy0f84NDsbbXDnbLXWzv/I8VGB6fpKoclDiDxi19sBXM3bejQT4w5b0cNjv7SIWbl5dvJ6RThRbJq7Z5Kc9j9SZbsrTM00pqJlMhFQ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=FaYp0vtv; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="FaYp0vtv"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6febf391132so2647847b3.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436476; x=1743041276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6IprsZmLsWJ1W+SXEGJm+5gLIm+beldY+cLbCePzQVA=;
        b=FaYp0vtviIr574vcS9rpJ1vimeyllVbIdpM/+77kPX/scaioK0wCZhhrIXYZ1CHmiL
         6SwSKcSxrWHfKd9TEjzVUFKGPH/h8sGigKo+AZ+ZwU78yxNK11WYv/kxZFdwQcK1MDzW
         bsabNPHZ/GdQl4R/mX3OP4wjSihqp+rPslkc+KMT/hMPjcCujx4UQldywut2Lhq0MkGg
         XrphT7OmUtMUOfw4JQG27aJ66mXFP4Zz7f5FRtUyGcZFpFw6aHvh84OxHNBeaA70sZtH
         RBoIhilwlYF0vw4FJyere3n7pRdt7mFSs7ze+j35JopDzi9aR6Fm6aPEiFNauucXV8ym
         Z/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436476; x=1743041276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6IprsZmLsWJ1W+SXEGJm+5gLIm+beldY+cLbCePzQVA=;
        b=NaRsMRU7Z4x8QhyKPNu3QTQ1dpmbNYdrxS9HEaFqL94L+X4OtlllEiqmsUij9BxL1U
         J9wscqaAkkKRF/UTIPku2e46FwhbeiGhUR9z0JvYTDvbm+6UKcXSv8hoLASjDElqzCji
         2gxPO8Hmcla/tL9wnimrS9je5BLhV+Z+RaYPmQsi4M8uZyK7ncK9aq4R1+kzcdRXdIw7
         SkPG1cK7+R49lXVUp52dOscPg6IFn6VaCeTP1JsPF2scHrUE1KBe2tECEhHYISc1Dcg6
         d5UU0pyzWADykOwEOPyOS7p0KdvmZhsAk61cWya7Hmli4+UNJSGpfNLEe+u862kC2E6H
         dJJA==
X-Forwarded-Encrypted: i=1; AJvYcCWshGxIzpDPhiy7Vq7gL0oWSHCTSaMDyfHrwciKOMVoGF1m3PksRoYe9d5LIh5u8bKjkM37vrLUQJcPV401dA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt0OgKEt85ufe8FpbojDhFGB1ThBhWLoVjv1VHAe4YNQVrbzO9
	moHmX1c9c4mpVmXYZ9BJ35xT8gmTNWS3M5VJSPBbykYUrAA6iiiABvyd+AsIra3AVMPQWEN1cOg
	K6LE=
X-Gm-Gg: ASbGncs/OPOvHwOiVhHnPZf+uBdCdti5Y/knTghcS9ZpB2O/MtURZFOBGLXMELORoTN
	o5mC5v8nqN14yeB85W3oUM334FpmQDrapCeGAfNHHkuOaZujMbnXyi9pSfYhhQkoUSOKPTMywIt
	UnSgwnAbeXvqzE4Y/R50KHsdIWsnLBqd6DVb1pAjqcjCm3F+nR6E9LXJAxO2GSj+gpdG1+aipOu
	97qOMO4qvFwM0lEZfw93ZtdiuLnbXZGLSI6x+0jLxVFtSNh7og3wnEKm5Soe3IyetXE7BoCgr07
	ozN3ZS2G7meYxG+tApTkq/mAjjwWYURMmcJgsyAQWr6FRAvAdmRI/70l/+icAFTTsB8/kee6PFw
	iQAHrr2MELoW5baYHUk36s3shbE90Vg==
X-Google-Smtp-Source: AGHT+IGn9MsvhBrphdch5568J8s/1p7rWVeurpQ14cLnVtuIprIyi3uU25kkj7ENbCqtI3Mix3n8+g==
X-Received: by 2002:a05:690c:f14:b0:6fe:b88e:4d86 with SMTP id 00721157ae682-700ac5ce5admr16680087b3.9.1742436476174;
        Wed, 19 Mar 2025 19:07:56 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:07:55 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v5 00/17] refactor to utilize `&raw [const|mut]`
Date: Wed, 19 Mar 2025 22:07:19 -0400
Message-ID: <20250320020740.1631171-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set enables the `raw_ref_op` feature, which became stable 
in Rust 1.82.

It then replaces all occurences of `addr_of!(place)` and
`addr_of_mut!(place)` with `&raw const place` and `&raw mut place`.

Finally it adds the previous macros `addr_of!` and `addr_of_mut!` to
the disallowed macros in `.clippy.toml`.

Changes in v5:
- Fix doctest errors when compiling on the minimum Rust version (1.78)
  due to not having the `raw_ref_op` feature enabled for doctests.
- Reword commit messages to more accurately describe the changes.
- Replace unsafe call to `Opaque::raw_get` with pointer casting
  in workqueue.
- Fix clippy disallowed macros message for `core::ptr::addr_of`
- Link to v4: https://lore.kernel.org/all/20250316061429.817126-1-contact@antoniohickey.com/

Changes in v4:
- Fix comment typo.
- Fix clippy issues.
- Add more context and link for disallowed macros with clippy.
- Separate the patch replacing of `addr_of[_mut]!` macros with
  `&raw [const|mut]` into smaller patches for each section.
  (PATCH v3 2/3 -> PATCH v4 2/16 through 15/16)
- Fix email typo.
- Link to v3: https://lore.kernel.org/all/0100019597091f92-cb55b6cd-4d06-4d14-8d9c-1a1314949a00-000000@email.amazonses.com/

Changes in v3:
- Re ordered the patches, so that the patch adding the `addr_of[_mut]!`
  macros to the disallowed macros in clippy is applied after replacing
  all the instances of `addr_of_[_mut]` with `&raw [const|mut]`.
  (moved PATCH v2 2/3 -> PATCH v3 3/3 and PATCH v2 3/3 -> PATCH v3 2/3)
- Link to v2: https://lore.kernel.org/all/0100019592c224ba-0cf38e16-2aa2-459d-99cd-09a463d616d4-000000@email.amazonses.com/

Changes in v2:   
- Fix `&raw place` should be `&raw const place`
- Fix email typo
- Link to v1: https://lore.kernel.org/all/010001958dfeacb5-9039aaab-6114-494a-9f1d-f13982091169-000000@email.amazonses.com/

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>



Antonio Hickey (17):
  rust: enable `raw_ref_op` feature
  rust: init: refactor to use `&raw [const|mut]`
  rust: list: refactor to use `&raw [const|mut]`
  rust: task: remove use of `addr_of!` macro
  rust: faux: refactor to use `&raw [const|mut]`
  rust: platform: refactor to use `&raw [const|mut]`
  rust: pci: refactor to use `&raw [const|mut]`
  rust: kunit: refactor to use `&raw [const|mut]`
  rust: workqueue: refactor to use `&raw [const|mut]`
  rust: workqueue: replace `raw_get` with pointer cast
  rust: rbtree: refactor to use `&raw [const|mut]`
  rust: net: phy: refactor to use `&raw [const|mut]`
  rust: sync: arc: refactor to use `&raw [const|mut]`
  rust: jump_label: refactor to use `&raw [const|mut]`
  rust: fs: file: refactor to use `&raw [const|mut]`
  rust: block: refactor to use `&raw [const|mut]`
  rust: clippy: disallow `addr_of[_mut]!` macros

 .clippy.toml                           |  4 ++++
 rust/kernel/block/mq/request.rs        |  4 ++--
 rust/kernel/faux.rs                    |  4 ++--
 rust/kernel/fs/file.rs                 |  2 +-
 rust/kernel/init.rs                    |  8 ++++----
 rust/kernel/init/macros.rs             | 28 +++++++++++++-------------
 rust/kernel/jump_label.rs              |  4 ++--
 rust/kernel/kunit.rs                   |  4 ++--
 rust/kernel/lib.rs                     |  2 ++
 rust/kernel/list.rs                    |  2 +-
 rust/kernel/list/impl_list_item_mod.rs |  6 +++---
 rust/kernel/net/phy.rs                 |  4 ++--
 rust/kernel/pci.rs                     |  4 ++--
 rust/kernel/platform.rs                |  4 +---
 rust/kernel/rbtree.rs                  | 22 ++++++++++----------
 rust/kernel/sync/arc.rs                |  2 +-
 rust/kernel/task.rs                    |  4 ++--
 rust/kernel/workqueue.rs               |  9 +++------
 scripts/Makefile.build                 |  4 ++--
 19 files changed, 61 insertions(+), 60 deletions(-)
