Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075D6276046
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 22:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764713431; cv=none; b=pT1J4vEyhsmqwPXDgzjaeJQwAzU1fR2seyEG7sbCN3vGLK7FNyETEGEWXU+AW99mszHhhWduGU+GpzkgF2uh+G5eVpwL8OdmHeHuM6Zj4AmCxo5lH4LH61HkTehZCDhdP0mAh7hZni5p/5DT7eGGUIn/6LHTJssCNCbZKyeKKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764713431; c=relaxed/simple;
	bh=n+AmEjLFa0RYgRKfWioXsk12mdCesX6j6Vn7LuAiFgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YFnnbvqMBoQ3l9BgQVDpbGK87vrXwk9mlBM589J0T7e+pHy2FS+mqBRNdpOEsZGaepRJrjs+Le2BmtsLRd8zeWOYL3VRxHKWpMZ9uKYJzLsFxCbpx5gBmeJaevHEGEv94BMXangQc8fiz4q+7GOC/2Va2E0h70Bh3lVODPt/MCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZV8gpOsb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZV8gpOsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764713429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iUFrhP519EvipONKiVuX1EHszYLnKOuk9ivDQa2B8u0=;
	b=ZV8gpOsbB5tKLudIIoB1Gm0kjcKzv8TMHA+JulM8uEuuBTKuW/jIXv8o+nSNrAHH7Ti+Dn
	rOhqnnxGZenxAfSPlXFiy7jR5bkyKCI5DKxUVLhPK+7aze8Bw9mknGHdapOxU+qyH6VASN
	YSS3HZ8IwtwAA7FME5b6hr+IQFb+5Pg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-74FFu1UWNZqLw1-bks9bXA-1; Tue,
 02 Dec 2025 17:10:23 -0500
X-MC-Unique: 74FFu1UWNZqLw1-bks9bXA-1
X-Mimecast-MFC-AGG-ID: 74FFu1UWNZqLw1-bks9bXA_1764713419
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C8DD418001D1;
	Tue,  2 Dec 2025 22:10:18 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.109])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8979119560A7;
	Tue,  2 Dec 2025 22:10:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v6 0/8] Rust bindings for gem shmem + iosys_map
Date: Tue,  2 Dec 2025 17:03:26 -0500
Message-ID: <20251202220924.520644-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

This is the next version of the shmem backed GEM objects series
originally from Asahi, previously posted by Daniel Almeida.

One of the major changes in this patch series is a much better interface
around vmaps, which we achieve by introducing a new set of rust bindings
for iosys_map.

The previous version of the patch series can be found here:

https://patchwork.freedesktop.org/series/156093/

Changelogs are per-patch

Asahi Lina (2):
  rust: helpers: Add bindings/wrappers for dma_resv_lock
  rust: drm: gem: shmem: Add DRM shmem helper abstraction

Lyude Paul (6):
  rust/drm: Add gem::impl_aref_for_gem_obj!
  rust: drm: gem: Add raw_dma_resv() function
  rust: gem: Introduce DriverObject::Args
  rust: drm: gem: Introduce shmem::SGTable
  rust: Introduce iosys_map bindings
  rust: drm/gem: Add vmap functions to shmem bindings

 drivers/gpu/drm/nova/gem.rs     |   5 +-
 drivers/gpu/drm/tyr/gem.rs      |   3 +-
 rust/bindings/bindings_helper.h |   3 +
 rust/helpers/dma-resv.c         |  13 +
 rust/helpers/drm.c              |  48 ++-
 rust/helpers/helpers.c          |   2 +
 rust/helpers/iosys_map.c        |  15 +
 rust/kernel/drm/gem/mod.rs      |  79 +++-
 rust/kernel/drm/gem/shmem.rs    | 433 ++++++++++++++++++++++
 rust/kernel/iosys_map.rs        | 614 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 11 files changed, 1194 insertions(+), 22 deletions(-)
 create mode 100644 rust/helpers/dma-resv.c
 create mode 100644 rust/helpers/iosys_map.c
 create mode 100644 rust/kernel/drm/gem/shmem.rs
 create mode 100644 rust/kernel/iosys_map.rs


base-commit: 57dc2ea0b7bdb828c5d966d9135c28fe854933a4
-- 
2.52.0

