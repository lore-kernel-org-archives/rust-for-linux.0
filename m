Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802341B3F2A
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112903; cv=none; b=YchsLJp9rIR8L5fZzspc1Btcp7Uitnx/C6iu/ZWjVPTTsVM6NnD7l2jyypM4kuwBXbzijIqUy52WFZhUtJRB2wVKkmwZsO7uly3k8P8H3tn2SQECwjcAd9+uv4Ak8miXRfmR9/tFpWsBXLWUJVkTLPOE420ODpnCQOFCE1PgGFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112903; c=relaxed/simple;
	bh=U4aI2Fw151R0hgG/sWSZALpaq3wkC6dEsk6KR/u8YMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FrUiybjFgHFViulipuEVsjqDkDGamxBaLovaEdXFAfY/NTuDosPkvcpFgtHuIoD/cQ4c9OXUukXQ8wEfMr3/Sr2GKojfa4++15uCMXSWPTz4exxHxdxsZwgwaP2BQfWeuck8MtitD0IrH2sbeWVql4HaLbqlq4brFlnXRSk60Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ER9MkwUl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ER9MkwUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9Dx4Yd3rp515xHPB0odOvS14xUDbZuuALCi/43WF61E=;
	b=ER9MkwUly96u0ccWJSNnHymMHt2wARBuF+H+QcTrKJJYICZMhH54Xo8cbD3alnWam+Are7
	i4Kxm6lRRbcPND73kMuL2bAKFXVDQtuKmoDNoS579x8Yfc6q5aNsT8pyLh1zZ7Y6Aga2ns
	O3gxVWArRSVy1xVt2OuhOt2K3Eyy5Ic=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-LM97qUqWPtmGJ-y2Psj6Kg-1; Thu, 04 Jul 2024 13:08:15 -0400
X-MC-Unique: LM97qUqWPtmGJ-y2Psj6Kg-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52e96ca162dso733004e87.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112894; x=1720717694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Dx4Yd3rp515xHPB0odOvS14xUDbZuuALCi/43WF61E=;
        b=kUtA3Hg+nSV29b/Fhyoq+lkX0XhxEOY2AS1b2JoNtz/QTUpjfpCpqPrkbG0vyRPbz3
         alAM4qFQtlFomMqay6l8tlWSQsSCaFvP+t2tJBrTmq2SU8ARVQYaJcwGAu2s6EbebJyy
         wYmyA7w0N8uK+K47p6n34imPv04ceVDBWyZqMsoV5iY+emxHR75of+c4end671fyyj+l
         rjdmk+Rqo4/qMzaKgIHKD1Q63yngQhHfOjGXOu/OWYqjMoG80QwaaSuA0mAEoApln1HH
         G/7vOb6mRketa7Sp3TJg0mr2xtfvSnnb722P8M/G7ButkGz8bNZnbLKK8CWlvie1MEc7
         lkjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmixc65b9j2qwHO6YppFKktDhvEuugtPWSnFBvCyW9WWX1+MURHovJz5XFkStH0xzInVGmKmXlz0/HFBhUEmlnyt7goxy+SbpE0hCmtJg=
X-Gm-Message-State: AOJu0YzuyAxBIZtoOG/prpLUtHRjjSpxZGvS3LI1K1BkCY/mKFbhU/R1
	6Br/zFeL76RDzRLQHt0SvSfvDFrI+njpgKJ0DCFHpQjjhZA6L+C8ws6XVJGs9gPQd4+NVF8Up4o
	DRBvDZJFNHcmE4ImMhgzUO6H2xqU/4SnxdJos5DZ/92gifE26cPDATJ8FMiQTzohY
X-Received: by 2002:a19:5e1a:0:b0:52e:99fd:e3d2 with SMTP id 2adb3069b0e04-52ea06de234mr1381878e87.66.1720112894308;
        Thu, 04 Jul 2024 10:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFnYte4aJcYpwixpiOxylyZNgxkQHSVsC4h2pAHitvCPf3Gav0iFNOeK65HzurCDgna6WqiA==
X-Received: by 2002:a19:5e1a:0:b0:52e:99fd:e3d2 with SMTP id 2adb3069b0e04-52ea06de234mr1381860e87.66.1720112893870;
        Thu, 04 Jul 2024 10:08:13 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36797718618sm3589884f8f.31.2024.07.04.10.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:08:13 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com
Cc: daniel.almeida@collabora.com,
	faith.ekstrand@collabora.com,
	boris.brezillon@collabora.com,
	lina@asahilina.net,
	mcanal@igalia.com,
	zhiw@nvidia.com,
	acurrid@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	airlied@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 00/20] Generic `Allocator` support for Rust
Date: Thu,  4 Jul 2024 19:06:28 +0200
Message-ID: <20240704170738.3621-1-dakr@redhat.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

This patch series adds generic kernel allocator support for Rust, which so far
is limited to `kmalloc` allocations.

In order to abstain from (re-)adding unstable Rust features to the kernel, this
patch series does not extend the `Allocator` trait from Rust's `alloc` crate,
nor does it extend the `BoxExt` and `VecExt` extensions.

Instead, this series introduces a kernel specific `Allocator` trait, which is
implemented by the `Kmalloc`, `Vmalloc` and `KVmalloc` allocators, also
implemented in the context of this series.

As a consequence we need our own `Box` and `Vec` types, which are implemented by
this series as `KBox` and `KVec`.

With that, we can start using `KBox` and `KVec` throughout the tree and remove
the now obolete extensions `BoxExt` and `VecExt`.

For a final cleanup, this series removes the last minor dependencies to Rust's
`alloc` crate and removes it from the entire kernel build.

The series ensures not to break the `rusttest` make target by implementing the
`allocator_test` module providing a stub implementation for all kernel
`Allocator`s.

This patch series passes all KUnit tests, including the ones added by this
series. Additionally, the tests were run with `kmemleak` and `KASAN` enabled,
without any issues.

This series is also available in [1].

[1] https://gitlab.freedesktop.org/drm/nova/-/tree/topic/allocator

Danilo Krummrich (20):
  rust: alloc: add `Allocator` trait
  rust: alloc: separate `aligned_size` from `krealloc_aligned`
  rust: alloc: rename `KernelAllocator` to `Kmalloc`
  rust: alloc: implement `Allocator` for `Kmalloc`
  rust: alloc: add module `allocator_test`
  rust: alloc: remove `krealloc_aligned`
  rust: alloc: implement `Vmalloc` allocator
  rust: alloc: implement `KVmalloc` allocator
  rust: types: implement `Unique<T>`
  rust: alloc: implement `KBox`
  rust: treewide: switch to `KBox`
  rust: alloc: remove `BoxExt` extension
  rust: alloc: implement `KVec`
  rust: alloc: implement `IntoIterator` for `KVec`
  rust: alloc: implement `collect` for `IntoIter`
  rust: treewide: switch to `KVec`
  rust: alloc: remove `VecExt` extension
  rust: error: use `core::alloc::LayoutError`
  rust: str: test: replace `alloc::format`
  kbuild: rust: remove the `alloc` crate

 rust/Makefile                       |  44 +-
 rust/bindings/bindings_helper.h     |   1 +
 rust/exports.c                      |   1 -
 rust/kernel/alloc.rs                |  92 ++-
 rust/kernel/alloc/allocator.rs      | 177 +++++-
 rust/kernel/alloc/allocator_test.rs |  23 +
 rust/kernel/alloc/box_ext.rs        |  56 --
 rust/kernel/alloc/kbox.rs           | 333 +++++++++++
 rust/kernel/alloc/kvec.rs           | 861 ++++++++++++++++++++++++++++
 rust/kernel/alloc/vec_ext.rs        | 182 ------
 rust/kernel/error.rs                |   2 +-
 rust/kernel/init.rs                 |  72 +--
 rust/kernel/init/__internal.rs      |   2 +-
 rust/kernel/lib.rs                  |   1 -
 rust/kernel/prelude.rs              |   5 +-
 rust/kernel/str.rs                  |  78 ++-
 rust/kernel/sync/arc.rs             |  17 +-
 rust/kernel/sync/condvar.rs         |   5 +-
 rust/kernel/sync/lock/mutex.rs      |   3 +-
 rust/kernel/sync/lock/spinlock.rs   |   3 +-
 rust/kernel/sync/locked_by.rs       |   2 +-
 rust/kernel/types.rs                | 186 +++++-
 rust/kernel/workqueue.rs            |  22 +-
 samples/rust/rust_minimal.rs        |   4 +-
 scripts/Makefile.build              |   7 +-
 25 files changed, 1769 insertions(+), 410 deletions(-)
 create mode 100644 rust/kernel/alloc/allocator_test.rs
 delete mode 100644 rust/kernel/alloc/box_ext.rs
 create mode 100644 rust/kernel/alloc/kbox.rs
 create mode 100644 rust/kernel/alloc/kvec.rs
 delete mode 100644 rust/kernel/alloc/vec_ext.rs


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.45.2

