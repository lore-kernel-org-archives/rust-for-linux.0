Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDDE42B745
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 18:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780079840; cv=none; b=PiXWZUlhHur7I4NadZsRv5LeX5Oz8IBk+lBqdaDaeMU473Oz+0rKLIT29rhPmvl12EVOBb67/gdUxlEyGAPLb5jxiWQT2iyNb5904n9YELHzGUS40rhBzyNgMTQcbGdSL0iok3qFWixTawyrzRxyEU4lfq5oZQzGVaxRxnFBOCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780079840; c=relaxed/simple;
	bh=rEQoSq9IEEKZKygG/YbRuz243qjYKgg0W4HBMQTatF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=CoPyzKh2dLl5lOWCc61YIz+4hJMB2ZMXwciHuUoSGojCKH4hecTogiWaYxwZ2/XWcy2aW2phf8N5QfCPNQtlgwXy2F3fW6C9QGc64vT+pFnN8eYrFF8Buy/g/WfRS/ESHs4FIslwzpI997unLmILZxXP/GMPV/GpEAiXqu0Bdas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AWL719ZJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AWL719ZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780079837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ibOzZZ9MbBgPCsyeHLx7hx/XOPF768dDk7bOGh7vXek=;
	b=AWL719ZJT3mk1ARtRTH7xXY5+MH+0jRoutrZhOe0mrVrR5MuBtIvTJtmaiKl0qdqua3IkC
	F2H5loCn4ua47grgbEHxt/UnUiFM6D340w/Nd148uIUb2ER4a4DKEKiCT606dz/pdxPLsZ
	yudxKIOtjonG7zTMEv7RDlIb8OdCdFw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-N3PmdtkkNv6foI_0vejyiA-1; Fri,
 29 May 2026 14:37:13 -0400
X-MC-Unique: N3PmdtkkNv6foI_0vejyiA-1
X-Mimecast-MFC-AGG-ID: N3PmdtkkNv6foI_0vejyiA_1780079830
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81E7019560AE;
	Fri, 29 May 2026 18:37:09 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.101])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9C43B1688;
	Fri, 29 May 2026 18:37:05 +0000 (UTC)
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
Subject: [PATCH v15 0/6] Rust bindings for gem shmem
Date: Fri, 29 May 2026 14:33:58 -0400
Message-ID: <20260529183702.677677-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: uzf8vkX5SbU7RcbA6GjAVomfW-PBLgLRPgwYsunl_Rc_1780079830
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

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

	https://lore.kernel.org/rust-for-linux/20260529173137.303717-1-lyude@redhat.com/T/#t

Lyude Paul (6):
  rust: gem: shmem: Fix Default implementation for ObjectConfig
  rust: drm: gem/shmem: Add DmaResvGuard helper
  rust: drm: gem: Add vmap functions to shmem bindings
  rust: faux: Allow retrieving a bound Device
  drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
  rust: drm: gem: Introduce shmem::Object::sg_table()

 drivers/gpu/drm/drm_gem_shmem_helper.c |  32 +-
 include/drm/drm_gem_shmem_helper.h     |   1 +
 rust/kernel/drm/gem/shmem.rs           | 497 ++++++++++++++++++++++++-
 rust/kernel/faux.rs                    |   7 +-
 4 files changed, 512 insertions(+), 25 deletions(-)


base-commit: 0e42ec83d46ab8877d38d37493328ed7d1a24de8
prerequisite-patch-id: c8ade07eec6e9c9e875800b114137c459d362e4e
prerequisite-patch-id: c38da06dbc4cfd2589bf2e7e9f0ebaa4da521ddf
-- 
2.54.0

