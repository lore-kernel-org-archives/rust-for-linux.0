Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A676A3C2BB0
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 21:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779830962; cv=none; b=U788U8yKFkR0zpniwW+SZu2My7sDyH61FGhm8W6VbEcV29dC2c5tX/PXbxYkkY1brKK+xySYIQlwR2jq3g3yffxMam2MprNXqmoOvjHcHUy8wGsxHZD8j4fvPfdqqfN/e8DBSAX8dVzwZMITENPraV0ZNdGzZHlTvdrBkvKHeS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779830962; c=relaxed/simple;
	bh=91N+57rUR1pWbGR8nhj2bpJrpWtcapPBXOCxGh0W5F0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=ExLFowKB1o0fO6ZBL094MiHV3ZvBSHjvvUAjg1sO8OVdN0XK/87zUgFa8P1SYt5Wkl2bg9mdNz8TR14A+yPeFRsICjTOfnvtKszpnSscdvxnoUNNoM+FjUbySHxnohmbHeJFTl0jlvCn9wpEtUvsdfAsHc3gcqe8eeZqP59iM9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RXH/dmAI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RXH/dmAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779830958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UeKDht6hynwmyvVnnx2NrDn4vXJFoG7xglLiWdTdkKo=;
	b=RXH/dmAIWT8I5B9teT3nW5P1lbihDJf9hSKopWwF1hgPQA9BPoUe/by+phoQ+KgoOn91wg
	HGpzp5bJSEXF7JB0jUH3g5BndKF6mUAQ5ruR8V8+CtORbMewFRz4XfvCmLRdlwZn180Qcj
	u89yAk29Q93tIzlKXfaJwEJ85qhZMdM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-380-fu2eY1SLOO-o5GiefNWvRg-1; Tue,
 26 May 2026 17:29:12 -0400
X-MC-Unique: fu2eY1SLOO-o5GiefNWvRg-1
X-Mimecast-MFC-AGG-ID: fu2eY1SLOO-o5GiefNWvRg_1779830949
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9DBEB19560AE;
	Tue, 26 May 2026 21:29:08 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D130A30001BB;
	Tue, 26 May 2026 21:29:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lyude Paul <lyude@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v14 0/6] rust: drm: gem: shmem: Add sg_table() function
Date: Tue, 26 May 2026 17:28:51 -0400
Message-ID: <20260526212857.1158294-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: GbWDKRafFWW7yB-xEB49PrILtfQoUp6FZKyWFc7bVD4_1779830949
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

(was previously Rust bindings for gem shmem)

Most of this patch series has already been pushed upstream, this is just
the second half of the patch series that has not been pushed yet + some
additional changes which were required to implement changes requested by
the mailing list. This patch series is originally from Asahi, previously
posted by Daniel Almeida.

The previous version of the patch series can be found here:

	https://patchwork.freedesktop.org/series/164580/

Branch with patches applied available here:

	https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust/gem-shmem

This patch series applies on top of drm-rust-next with the following
dependencies applied:

	https://lkml.org/lkml/2026/5/26/1960

Lyude Paul (6):
  rust: faux: Allow retrieving a bound Device
  rust: gem: shmem: Fix Default implementation for ObjectConfig
  rust: drm: gem: s/device::Device/Device/ for shmem.rs
  drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
  rust: drm: gem/shmem: Add DmaResvGuard helper
  rust: drm: gem: Introduce shmem::Object::sg_table()

 drivers/gpu/drm/drm_gem_shmem_helper.c |  32 ++-
 include/drm/drm_gem_shmem_helper.h     |   1 +
 rust/kernel/drm/gem/shmem.rs           | 264 +++++++++++++++++++++++--
 rust/kernel/faux.rs                    |   7 +-
 4 files changed, 279 insertions(+), 25 deletions(-)


base-commit: 2cf1840b0fa7637b6731fd554529f8d57ea34c04
prerequisite-patch-id: c8ade07eec6e9c9e875800b114137c459d362e4e
prerequisite-patch-id: dc4f750bc885b867842587b994261f43602bc6a8
-- 
2.54.0

