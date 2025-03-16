Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0D02E337A
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 06:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742105684; cv=none; b=jwF/37ineR7yJ9hEIirxHHl1yO3LLk7DmRv0Dev1ZN3E0e5ivycbiYA9QcjKnJcMfCE4voFjxmKaokUOo/rrpBdlnvbg8snL5JtOeRpdjjtR2jStqVOU+IJ3n4LbaFL9kYYcNLcuTtJYisrm5EGpq0E/nVvuE4FbR9NqA7ZvFtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742105684; c=relaxed/simple;
	bh=MiAQ5XYpRYoq0L7p9viCrla+58wg+VEaLRkT3VJ3lt8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uiyTzoZn13VtmMkkcrvG7WyMD2rRTwzSbMeW5RYyXzcT5foPm8I9s7G8s6Kvo8qHk2uMiaWzgWtNj4LHXVKRfqHRuuya1FRGueQSSxyGxyBfViCr6PcN4vJRoh3UYyIZv6PTAbuiJLRACCgACVwmxtig9EwR+7ZTomo2qg0GhJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=RddgydBB; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="RddgydBB"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e3c8ae3a3b2so2744354276.0
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 23:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742105681; x=1742710481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzRabq+JRAZHa+fTrrP/kCJyvMZrxLIT4j7R5r+7PjA=;
        b=RddgydBBAwA23u0R7XFsyiS/swFDACwSiDIhY+eMxtaitQZvQ4LzWzjo3YhFhpHQYn
         RwK9SHot0pMRX/YRcNsdxicqYOWDqiR/N/g8HfCQGvIeToDG/dKtZVeBkkmqhN0W5Rpj
         w5MYx513bOxFximrF8Hxk+MXdKwX+t1ApoZh+NKhi2uO/doxfLqUr9Uld0JHcLwI4DNw
         Bapf1BjWZzzhOQmdtf+pTQraNdC5E/Dv9s5z8Ye5YnU+OeYq5DTouDn/T6KhmkZSrAv8
         Qs4D6cZgCr67A4wqvCMzds0wyAQBb2vQ4xyMn6TeqX14EznZIlEaDw800yvAtHp2rqCu
         GOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742105681; x=1742710481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzRabq+JRAZHa+fTrrP/kCJyvMZrxLIT4j7R5r+7PjA=;
        b=nvyweRoANfqPq7MxXZmmKnli8HpiIrUqDXbqGvltQSuxhujuEwrA9OdBhsRA3VZdaI
         iWdDBeW6sk5Jqiwi/h1Vv4iK4koapQLNttlo9j1lDWPJ1ZbQTHgJY0tWCjj0yUWdWkRe
         dj4vceTB939iy2myV+5DPPxhvm2VtJ46EvlRH4Gq+g3XBQcjGKs7EhnOf3MR2A2ExmMQ
         lpssMoM/Ov7LgOTOofCN6VCCZo0hkoPFzheAwGz/4AZfDi+aaRLdH4ziuRpoXjrMoVmz
         pxlgZJghbZz4fvXF0vEJixI1n011RwT+YXaKiR0JPF8ijOKoml26G8qlH2T2dldl0MqM
         gf2w==
X-Forwarded-Encrypted: i=1; AJvYcCWycDcXjYxO3L15Eg9wdrvWKKkUmt8FStpruG00K9xv7nj12c96knIuxpNtt+6r3qX9fVLg+65Wkn4gqROB7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjbO/wniliNAmyNdThFskixrAkdXC+0FJUN3kT5hi4fSFilnO8
	yU8s//Kd/mtc448ivi1obqvDnQxVdxb8gU7jgElxZ7CvFaG1sDk24aNmbz+Ajp4=
X-Gm-Gg: ASbGncvVr7OFh10yOrDiZg4Pw1Xn3sd1uQv8LAvy6DCYdK1OxCvGDqosb9sbc8hSRNN
	wzQrMNqDlDvWbXs4hjK+TPCBgFEau7cSUbiy90SRyaGVLhH+J42loRvcvibUi2Fc252g5eHn2bA
	7yGLv9UvbnOF/G/rfFFLoOiY34E97OeguOw09y1GSiDVJqf7zS9cLX7GqyZPtH40FVHo9TwyeZv
	Eb53cyW7yUE8ki0KebwtVgpmu42Xg0iWN/VlP1YB34/TANQgoZX68xeo1yURkfemE5S3QViThCg
	ADPDe9rh8iSF31eZMh3fK0d0xCMzYjS7L2EJnAeOMQPkR2wA95c+2O/cswXqnZ2mJiGmUyIVHkY
	qL651pgH6wisJJNI4IGVb0ZA5C2RVQA==
X-Google-Smtp-Source: AGHT+IH6H/U28LMJztWPJ5xu5SWVGIZ+c2rSeVVAg7jglluAwHtW33jb4ISUekJnZrrtOimVCG0+dA==
X-Received: by 2002:a05:6902:2011:b0:e5b:1b55:1325 with SMTP id 3f1490d57ef6-e63f652f73emr9880152276.25.1742105681183;
        Sat, 15 Mar 2025 23:14:41 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e63e53fd277sm1618673276.11.2025.03.15.23.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 23:14:40 -0700 (PDT)
From: Antonio Hickey <contact@byte-forge.io>
X-Google-Original-From: Antonio Hickey <contact@antoniohickey.com>
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
Subject: [PATCH v4 00/16] rust: refactor to utilize `&raw [const|mut]`
Date: Sun, 16 Mar 2025 02:14:09 -0400
Message-ID: <20250316061429.817126-1-contact@antoniohickey.com>
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

Changes in v4:
- Fix comment typo.
- Fix clippy issues.
- Add more context and link for disallowed macros with clippy.
- Seperate the patch replacing of `addr_of[_mut]!` macros with
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

---
Antonio Hickey (16):
  rust: enable `raw_ref_op` feature
  rust: init: refactor to use `&raw [const|mut]`
  rust: list: refactor to use `&raw [const|mut]`
  rust: task: refactor to use `&raw [const|mut]`
  rust: faux: refactor to use `&raw [const|mut]`
  rust: platform: refactor to use `&raw [const|mut]`
  rust: pci: refactor to use `&raw [const|mut]`
  rust: kunit: refactor to use `&raw [const|mut]`
  rust: workqueue: refactor to use `&raw [const|mut]`
  rust: rbtree: refactor to use `&raw [const|mut]`
  rust: net: phy: refactor to use `&raw [const|mut]`
  rust: sync: arc: refactor to use `&raw [const|mut]`
  rust: jump_label: refactor to use `&raw [const|mut]`
  rust: fs: file: refactor to use `&raw [const|mut]`
  rust: block: refactor to use `&raw [const|mut]`
  rust: clippy: disable `addr_of[_mut]!` macros

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
 rust/kernel/workqueue.rs               |  9 +++++----
 18 files changed, 61 insertions(+), 56 deletions(-)

-- 
2.48.1

