Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E687D2E54AA
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 22:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770417333; cv=none; b=aaIEq2tzHi+qmceixMxAQxJL3uN/NcUyMTA/lqNkJFaIqpOkLMmRsFFUp8YwzURoPVi4Jga5GL6mHunRvGN6gymvjoVVu1oUJKNyALPq+xkKbZC+Rjnw2MkP9f5/USROwH2ZSCuP//w6CKF5v3lKsgFB7tFSrLM4GZwt5LCFD/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770417333; c=relaxed/simple;
	bh=hgvNMTRXd/FXFTBRwHn6ZpZgLxMMBaAxd3nsMmMNjoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aY3vNR6qRtuGGmWKifNsvCeiS5fBPz2acAxushHsBnb8rrdE7NB19FGgXrDDf3ZXTWrFUMrEhKWF+5NZYtYYHAO3mgIFtE1VGpFJiEURQ8JbsUgXTfZ41aBFReu05GNigj62dTO8jiuhbz+QZhDfrWkeb2dzfizp4sy2+ImTBGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EsCUwntX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EsCUwntX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770417331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Le3aiYwi9QA3jxc/i9wr8UlZrE+EEzProIFjlbUe4qA=;
	b=EsCUwntX++G3DledkA4SlF7w6QV2ZbMQuTXn8WVPPI1kLh3JSZJf1J0ZyFOpeR+Rf83hft
	2pHcFj71i9698Fd9tg5PQ81gf+av30bBpVOvw0OOdyaFMAqtwbixYyssqkGiyFi68EOUXq
	ShYD5ZLKcGlkZOwr8WxSZg9F8CQMs00=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-4jPKyixaMymbbkTAC_xJwA-1; Fri,
 06 Feb 2026 17:35:28 -0500
X-MC-Unique: 4jPKyixaMymbbkTAC_xJwA-1
X-Mimecast-MFC-AGG-ID: 4jPKyixaMymbbkTAC_xJwA_1770417327
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 800E41955F27;
	Fri,  6 Feb 2026 22:35:26 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.226])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D357619373D8;
	Fri,  6 Feb 2026 22:35:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Benno Lossin <lossin@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Janne Grunau <j@jannau.net>
Subject: [PATCH v7 0/7] Rust bindings for gem shmem + iosys_map
Date: Fri,  6 Feb 2026 17:34:24 -0500
Message-ID: <20260206223431.693765-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: LcuKWnXb0YiXeYFL9KRaq5AX_coPeq-ro7Ke6JHyLUE_1770417327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the next version of the shmem backed GEM objects series
originally from Asahi, previously posted by Daniel Almeida.

One of the major changes in this patch series is a much better interface
around vmaps, which we achieve by introducing a new set of rust bindings
for iosys_map.

The previous version of the patch series can be found here:

https://patchwork.freedesktop.org/series/156093/

This patch series may be applied on top of the
driver-core/driver-core-testing branch:

https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/log/?h=driver-core-testing

Changelogs are per-patch

Asahi Lina (2):
  rust: helpers: Add bindings/wrappers for dma_resv_lock
  rust: drm: gem: shmem: Add DRM shmem helper abstraction

Lyude Paul (5):
  rust: drm: gem: Add raw_dma_resv() function
  rust: gem: Introduce DriverObject::Args
  rust: drm: gem: Introduce shmem::SGTable
  rust: Introduce iosys_map bindings
  rust: drm/gem: Add vmap functions to shmem bindings

 drivers/gpu/drm/nova/gem.rs     |   5 +-
 drivers/gpu/drm/tyr/gem.rs      |   3 +-
 rust/bindings/bindings_helper.h |   3 +
 rust/helpers/dma-resv.c         |  13 +
 rust/helpers/drm.c              |  56 +++-
 rust/helpers/helpers.c          |   2 +
 rust/helpers/iosys_map.c        |  34 +++
 rust/kernel/drm/gem/mod.rs      |  28 +-
 rust/kernel/drm/gem/shmem.rs    | 467 ++++++++++++++++++++++++++++++++
 rust/kernel/iosys_map.rs        | 210 ++++++++++++++
 rust/kernel/lib.rs              |   1 +
 11 files changed, 815 insertions(+), 7 deletions(-)
 create mode 100644 rust/helpers/dma-resv.c
 create mode 100644 rust/helpers/iosys_map.c
 create mode 100644 rust/kernel/drm/gem/shmem.rs
 create mode 100644 rust/kernel/iosys_map.rs


base-commit: 21bab791346e5b7902a04709231c0642ff6d69bc
prerequisite-patch-id: c631986f96e2073263e97e82a65b96fc5ada6924
prerequisite-patch-id: ae853e8eb8d58c77881371960be4ae92755e83c6
prerequisite-patch-id: 0ab78b50648c7d8f66b83c32ed2af0ec3ede42a3
prerequisite-patch-id: 8d20a8db8cf4660c682ee91f3db04e640c144e33
prerequisite-patch-id: 299de9cd2789c19c22e2816f7c817d80d5a4f1db
prerequisite-patch-id: 661ee334905f359daa8fb8d808ed5f4a8085f5c9
prerequisite-patch-id: 05aef545e564948160354e498a3d3c5fd5bbfacb
-- 
2.53.0

