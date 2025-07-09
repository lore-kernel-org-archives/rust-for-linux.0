Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FBC23ED63
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Jul 2025 19:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088188; cv=none; b=KpiBVEEd5/XvBxO8+5ZhOr8UeQbDAElEjZrmWHZ/A0tdVEHaWgE7nc4WkI09/e8JeL9WtM9JKrwuo85h2g/qoY/9SJQHFl1SUDov+I/MNaSX1YBUCB7/HVKrXq9H5y6FXGWTo6ZzhvPBU86r2N+EXNN650dkVTyl7tqlpbE6oIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088188; c=relaxed/simple;
	bh=RQ6WlSJ5huRIlq7brHPoei5H/RzfutY8mWggxP7frgc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZyFtWhn1LiauGD0sE9HE0YtQDdMb+i0ZKq+dEB56GJBBLeny5joF2xpWK2OaEBcaPrz8FPFkJ+s7m7VbF+jakg4N9gRhfMnyKRR/XVN0MtW3WmThPgQ6TLoUBq9dJ3k9Q/r8e2Cgna5Ct5NWyozSNV+nEGbgGcZ5Q39pcIihNws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3vd2pBn2; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3vd2pBn2"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748d96b974cso135380b3a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Jul 2025 12:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752088185; x=1752692985; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VNAElYoeZ//XwlLTtUYFDMEB3pxtENpE+6ocThKiP9w=;
        b=3vd2pBn2uR4acd+cSpjq/Axo39svtf0JX4/vwIiL9i42Dod39UFi8sBu/dip+4rZIh
         yKyl7UTnTIzFAToF2lc4FVIsJD6Hyq/iyEye2JMGt9vZ7P+i5dC1Gx+EpA4qsPAF3QKa
         zxXqy7XdzgjyYd7rq6awAj07xtsDduT6JkrobVHBjGau37UXf6N1yDzMww20iEUleQ8/
         rLkmYGnPA68dYsU0JetCAfwpG7K8LYk359DTBj2g7IsJ1wn1uSae257jN35gAHn82QcC
         GtHq+SZnjULeWJ/e9x7EQdo8iKJroHrFv/+EREJjOcA/TFnlinqkfnNVeNcFwl57DBdO
         ACyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088185; x=1752692985;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNAElYoeZ//XwlLTtUYFDMEB3pxtENpE+6ocThKiP9w=;
        b=FNey/eE3wk26j3wOFEhKvYMsmH3EEBl4FfTnUF78LqWNdtpDlsSorb3+dLX06cp8nC
         yYgF3BEPDhR2LKMbudZoyEfwv+iG+p85a+LveQr1vSP+LDq42tuRyFMgAms0FXeXs4YI
         Ni/xpENSkHIn4W9JQmzogBFbOKR2NhFNGyzhCj+Dq91pQSVU1C0cSqGnEUEsYut+0+Vv
         mZPTdB2HGUeAZpML6BBYbGDR8uV1KqFueSbedqUw/Uo7TRA49lKdNrhtILnIqQmn5uID
         zDoCS7rQUeEF0wQiDEbO0yWt9+MjTKe8pim4jxZR/XAyMp9esgsBjSCshMNsr/VKUwI6
         COmw==
X-Forwarded-Encrypted: i=1; AJvYcCV+p0iErly5CpzBo5O6MgCDkNAAQq6ZzRTMFZXjWdFj4EUBsC8kGkpcSgXhjOfj0W1Jvh8hdNeAsCy1Dpu3sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeISdKCQ54CLPIosysqEZCHcrOYXRziq7qOYsjZRPzmHZd23IR
	78i9fcT/xW9yCoW/iJMXIXxBxHIuAe9uX0aRv+7bZn9g+U3gQ/tjbGz/CWaQLgJTSwpASjh7duS
	hR+TbVCddbA==
X-Google-Smtp-Source: AGHT+IE5vRO3Q3eFARbezu5DXeGqmMT1wM6O0/smswHpoXmYxUGOFfc7aAnR8SkyJrPWJdB98kY2RQmYgCJS
X-Received: from pfbg22.prod.google.com ([2002:a05:6a00:ae16:b0:746:2d8f:cac1])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4516:b0:74e:ab26:aa81
 with SMTP id d2e1a72fcca58-74eab26ad4dmr4449406b3a.13.1752088184824; Wed, 09
 Jul 2025 12:09:44 -0700 (PDT)
Date: Wed, 09 Jul 2025 19:09:27 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGi+bmgC/2XSy27DIBAF0F+JWJcWBvPKqv9RdcFj7CA1cQuOl
 SrKv5ckquLgHRd0LtJozqRgTljIdnMmGedU0niowb5sSNi5w4A0xZoJMJCsA0Mj+uPQF5qPZaI
 iRBmsRq8jJ5V8Z+zT6Vb38VnzLpVpzL+39plfb/+L7HPRzCmjyivUwWsLtn8fxnH4wtcw7sm1a
 YaFFqzRUDWgicIaaTj4lRYPLRlvtKjaSGaU7Z1XGla6W2podFe1NsbZoAKg1istl1o2WlYt0Iq
 A2nutcKXVQyvejH9W178hOATOPRdipfVCQ9doXbUNxgjptAO2nrlZat1oU3VQEhR2XMSOPenLf Rky/hzrSk33jSDeFaT1fZ+m7SbmNGOuMePb4kwPeJpqweUPVyqay5sCAAA=
X-Change-Id: 20250428-debugfs-rust-3cd5c97eb7d1
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752088183; l=5227;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=RQ6WlSJ5huRIlq7brHPoei5H/RzfutY8mWggxP7frgc=; b=MCsonrHNemnUNxWIXxJtxnYsrLWXWN1R7U6v6Oqy0JmnTY2cMPbO+6bbH+DVG/WO6kIMqCs3R
 ct5ADTZYEgjAPOW+J0PQtCvV1QPKycKZlmHZP7Bv1Sg2DJb6go6+r9W
X-Mailer: b4 0.14.2
Message-ID: <20250709-debugfs-rust-v9-0-92b9eab5a951@google.com>
Subject: [PATCH v9 0/5] rust: DebugFS Bindings
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This series provides safe DebugFS bindings for Rust, with a sample
module using them.

Example interaction with the sample driver:
~ # mount -t debugfs debugfs /debug
~ # cat /debug/sample_debugfs/*
"sample-debugfs"
0
0
Inner { x: 3, y: 10 }
~ # cat /debug/sample_debugfs/inc_counter
1
~ # cat /debug/sample_debugfs/inc_counter
2
~ # cat /debug/sample_debugfs/inc_counter
3
~ # cat /debug/sample_debugfs/*
"sample-debugfs"
4
4
Inner { x: 3, y: 10 }
~ # cat /debug/sample_control/swap
Swapped!
~ # cat /debug/sample_debugfs/*
"sample-debugfs"
5
5
Inner { x: 10, y: 3 }
~ # cat /debug/sample_control/add_counter 
Counter added!
~ # cat /debug/sample_debugfs/*
"sample-debugfs"
6
6
Inner { x: 16, y: 3 }
~ # 

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Changes in v9:
- Switched to `PinInit` backing instead of `ForeignOwnable`
- Changed sample to be a platform driver
- Exported a static property
- Demonstrated runtime mutation in platform driver (`inc_counter`)
- Demonstrated how driver code would interact with data structures
  exported through DebugFS (`Wrapper`)
- Link to v8: https://lore.kernel.org/r/20250627-debugfs-rust-v8-0-c6526e413d40@google.com

Changes in v8:
- Switched from casts to `core::from_{ref, mut}` in type change
- Link to v7: https://lore.kernel.org/r/20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com

Changes in v7:
- Rewrote `entry::Entry` -> `Entry`
- Use `c_int` and `c_void` from kernel prelude rather than core
- Removed unnecessary `display_open` cast
- Switched from `Deref` + an explicit box to `ForeignOwnable` for
  attaching owned data.
- Made `&'static` and `&'static mut` implement `ForeignOwnable`
- Swapped "driver" to "module" in sample code
- Link to v6: https://lore.kernel.org/r/20250618-debugfs-rust-v6-0-72cae211b133@google.com

Changes in v6:
- Replaced explicit lifetimes with children keeping their parents alive.
- Added support for attaching owned data.
- Removed recomendation to only keep root handles and handles you want
  to delete around.
- Refactored some code into separate files to improve clarity.
- Link to v5: https://lore.kernel.org/r/20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com

Changes in v5:
- Made Dir + File wrappers around Entry
- All functions return owning handles. To discard without drop, use
  `forget`. To keep a handle without drop, use `ManuallyDrop`.
- Fixed bugs around `not(CONFIG_DEBUG_FS)`
- Removed unnecessary `addr_of!`
- Link to v4: https://lore.kernel.org/r/20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com

Changes in v4:
- Remove SubDir, replace with type-level constant.
- Add lifetime to Dir to prevent subdirectories and files from outliving
  their parents and triggering an Oops when accessed.
- Split unsafe blocks with two calls into two blocks
- Access `private` field through direct pointer dereference, avoiding
  creation of a reference to it.
- Notably not changed - owning/non-owning handle defaults. The best read
  I had from the thread was to continue with this mode, but I'm willing
  to change if need be.
- Comment changes
  - More comment markdown
  - Remove scopes from examples
  - Put `as_ptr` properties into a `# Guarantees` section.
- Link to v3: https://lore.kernel.org/r/20250501-debugfs-rust-v3-0-850869fab672@google.com

Changes in v3:
- Split `Dir` into `Dir`/`SubDir`/`File` to improve API.
- Add "." to end of all comments.
- Convert INVARIANT to # Invariants on types.
- Add backticks everywhere I found variables/types in my comments.
- Promoted invariant comment to doc comment.
- Extended sample commenting to make it clearer what is happening.
- Link to v2: https://lore.kernel.org/r/20250430-debugfs-rust-v2-0-2e8d3985812b@google.com

Changes in v2:
- Drop support for builder / pinned bindings in initial series
- Remove `ARef` usage to abstract the dentry nature of handles
- Remove error handling to discourage users from caring whether DebugFS
  is enabled.
- Support CONFIG_DEBUG_FS=n while leaving the API available
- Fixed mistaken decimal/octal mixup
- Doc/comment cleanup
- Link to v1: https://lore.kernel.org/r/20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com

---
Matthew Maurer (5):
      rust: debugfs: Bind DebugFS directory creation
      rust: debugfs: Bind file creation for long-lived Display
      rust: debugfs: Support `PinInit` backing for `File`s.
      rust: debugfs: Support format hooks
      rust: samples: Add debugfs sample

 MAINTAINERS                         |   3 +
 rust/bindings/bindings_helper.h     |   1 +
 rust/kernel/debugfs.rs              | 286 ++++++++++++++++++++++++++++++++++++
 rust/kernel/debugfs/display_file.rs | 100 +++++++++++++
 rust/kernel/debugfs/entry.rs        |  66 +++++++++
 rust/kernel/lib.rs                  |   1 +
 samples/rust/Kconfig                |  11 ++
 samples/rust/Makefile               |   1 +
 samples/rust/rust_debugfs.rs        | 182 +++++++++++++++++++++++
 9 files changed, 651 insertions(+)
---
base-commit: 6d16cd5769bbb5eb62974e8eddb97fca830b49fd
change-id: 20250428-debugfs-rust-3cd5c97eb7d1

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

