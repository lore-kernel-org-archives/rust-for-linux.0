Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02072B676
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 01:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940519; cv=none; b=BPlWFfvs2MDo3zEfwtTmlFbVBmPvgHg8sB1VEEaph2BokpWnFQZVNGsF3UOMdmBpioVvsuYj1simVXzBG3jGLgf2vFusS4A7xLINGJkzB1ilzIS+/3wUBHslhFq9OO2xwGrlfOJWMLmv571sBFGD+iZFsVWB4i3J6Gc2kFOdAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940519; c=relaxed/simple;
	bh=RJT7J8FK66LPT/CdKBBSsl4rrPcxtr7qVlW9KxjD/cE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LzhpmGWrwakT3KAtwwsk/DoIVJ2OMJfeuP/Si6/kkyCV2ZdJ//I0aW4o/Un8w5Pe3/uXxkMrAziUA2pYiuQRacCrf/cJ/NOH94K+cnY4DpNkjkGbMa0ASuPBgpN7PGFvBPGxZ3RSEbucCyq9fxTIyyE9+KpGeFdxKdZmYpUuAt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=hZFPUa0t; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="hZFPUa0t"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ff37565232so12531687b3.3
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 18:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940517; x=1745545317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PFJY7+yYNDyZcYodvTWOUSsk6LfuMYVTL95kmRuQi4=;
        b=hZFPUa0tOBruRSKRprwUcZDuH/vJ8GmZkYs0FhaTYq9aC4AaqImAxh6GGcDcVQ+p1u
         Tpp0d4ksSveCvejPVRTCkMCrSfNhfjVPpU/7swxV7kIbt34n95cBVKmSHaJdlQ5K80Xz
         7nPm0voU4pu5dccJzc6hDM5iTMoSw7Lc71XR9NCVTbarVIKrPpxe8T0JyGH1fS9Z5pj2
         J1zUQue8r0Ef9uP+LEiR7zZ6zx9YPYnq5m6Z1m8hKWp2d1V+8FTa1e3kvAy3xTb+6yp+
         wVIidZSOSyMIhelF6VFEb1dVrHM9dMKxtRhHWTZ24csCMAuSTgYDVOi7X8KYZaxORbHd
         WREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940517; x=1745545317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PFJY7+yYNDyZcYodvTWOUSsk6LfuMYVTL95kmRuQi4=;
        b=tZBdaRgVZyxbg4//ey5MiQnTn4vefRzaX1EsoLGjo51ZiS9VasxoQai+WRosBGbIgY
         EzrZ4axGC/kgcbRWNgEs2AZt8kl3eNEP21XWbnU1LpOwZVaulNtDOaD0ycLTOsnm0Imx
         eH6uZVFCJ9Tl1UsJnT9DKXA6P9HWaK8PTul8iUeb2fDTEPewapZEd0j3GF5RZTO7z93k
         y8rabXaHpX+gv8LRadmPa7Lkxe9nbyW8Fu8OIweCz5+DlCcJCN9RFEeth25igseB9u1F
         RfnaPh7n2d54oz6n5DuCqYIHjomQXMgr9WozXPG4qAslnHILmgOxLhC4K0HuOk1gVuNe
         hLHA==
X-Forwarded-Encrypted: i=1; AJvYcCVTlLCwoGFFoYheVZvlXsPwOrPu/W6hH8EZ9wmwnSedVN2P5iQoQGokWc/9m4itwFFpi/xCTdEoDcdX1l/YxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHWiHYejgTIlu3vNMLuIQ1jZ2uv0qU/UbdsNrUqHCfAmwPGiRK
	ghzNILQTQv7TBaVbw77/B6tWhK3CKpykpVpGuphWwNxK0KHbZ7g3k1UXP3UqS0k=
X-Gm-Gg: ASbGncvm+tn2TU4KjnAlM+AoE75Q34AWHgyrdJ4c+LOScJmiqebu6OxT6a2O3G4JHmj
	6Tug38w53gkpZEEU3eelPkeDkZ3Ii47QMN0cEZtXKk93kld2l8///URFOQkNXYgvcLdQR8CzbRu
	0IH1+y8al8L7A68EKSYdQ9wu/guqJY6S1fgHXWrlSlpQfe9oK4fQZtbCR3S28nQLlusjfpF93yM
	4XlyPD6klbwCHi2rSYexGNXeHcZjcQEZ0a1gjBYJa/dB1gDOtsq3QSrUS0zMrEQXuKlg7AGO88w
	8FRzzh9bhQ3n4D+Sw+Tpf17QXwDs2f4r57Uri9Rg1H8naUGkvcOcJSHvK3sT/prpsA5Ozth/9M1
	4zTaz8xjPbKTWZTrri7ZX/IaPrqzl1oXwSCat
X-Google-Smtp-Source: AGHT+IFyJy29QrvXIXMI57LyhS7SLD9X4rPVDH+pPLlzHqrD+qgI6VNuxn7+sHPH7jMa6E0o1Uq8OA==
X-Received: by 2002:a05:690c:6801:b0:6fd:33a5:59a with SMTP id 00721157ae682-706ccd1a5ccmr17595247b3.18.1744940516821;
        Thu, 17 Apr 2025 18:41:56 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:41:56 -0700 (PDT)
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
Subject: [PATCH v6 00/18] refactor to utilize `&raw [const|mut]`
Date: Thu, 17 Apr 2025 21:41:21 -0400
Message-ID: <20250418014143.888022-1-contact@antoniohickey.com>
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

Changes in v6:
- Rebased onto rust-next to refactor new occurences of `addr_of[_mut]!`
  and handle the 2 patches from the v5 patchset that were merged.
- Link to v5: https://lore.kernel.org/all/20250320020740.1631171-1-contact@antoniohickey.com/

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



Antonio Hickey (18):
  rust: init: refactor to use `&raw mut`
  rust: list: refactor to use `&raw [const|mut]`
  rust: task: remove use of `addr_of!` macro
  rust: faux: refactor to use `&raw mut`
  rust: kunit: refactor to use `&raw [const|mut]`
  rust: workqueue: refactor to use `&raw [const|mut]`
  rust: workqueue: replace `raw_get` with pointer cast
  rust: rbtree: refactor to use `&raw mut`
  rust: net: phy: refactor to use `&raw mut`
  rust: sync: arc: refactor to use `&raw const`
  rust: jump_label: refactor to use `&raw const`
  rust: fs: file: refactor to use `&raw const`
  rust: time: hrtimer: refactor to use `&raw const`
  rust: pci: refactor to use `&raw mut`
  rust: platform: refactor to use `&raw mut`
  rust: dma: refactor to use `&raw [const|mut]`
  rust: pin-init: refactor to use `&raw mut`
  rust: clippy: disallow `addr_of[_mut]!` macros

 .clippy.toml                           |  4 ++++
 rust/kernel/dma.rs                     |  4 ++--
 rust/kernel/faux.rs                    |  4 ++--
 rust/kernel/fs/file.rs                 |  2 +-
 rust/kernel/init.rs                    |  4 ++--
 rust/kernel/jump_label.rs              |  4 ++--
 rust/kernel/kunit.rs                   |  8 ++++----
 rust/kernel/list.rs                    |  2 +-
 rust/kernel/list/impl_list_item_mod.rs |  6 +++---
 rust/kernel/net/phy.rs                 |  4 ++--
 rust/kernel/pci.rs                     |  8 ++------
 rust/kernel/platform.rs                |  8 ++------
 rust/kernel/rbtree.rs                  | 22 ++++++++++----------
 rust/kernel/sync/arc.rs                |  4 ++--
 rust/kernel/task.rs                    |  4 ++--
 rust/kernel/time/hrtimer.rs            |  4 ++--
 rust/kernel/workqueue.rs               |  9 +++------
 rust/pin-init/README.md                |  3 +--
 rust/pin-init/src/lib.rs               |  7 +++----
 rust/pin-init/src/macros.rs            | 28 +++++++++++++-------------
 20 files changed, 65 insertions(+), 74 deletions(-)

