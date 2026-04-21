Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B6A282F04
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 23:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776814974; cv=none; b=KMKsh4nF9HtCiD/n5qTMk7iHpjvB8tZuDtYNKiPI7eNmH47VsBi9VolRY84foez/LrPfULAtO6EG6en9wAOJkTKzrN+3SHh09oNWYKalHLoqKpbklaPzYGpYUFfQr1OrIZO3iIyarAZMjkYZ2RJggdFRIIDrMjIgje6deGmn+Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776814974; c=relaxed/simple;
	bh=z6PA2VkpLZ+WOv7tkqw2YKZEFPYPRBGHMg/sJsUUxmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=kVvHJT0vmhz8I4vpW/m24+dLEKlKXQftLVG5hxDc8/YT2Le3n2/QKhkAdfgNyt9d4q0lohhQj+SojGMDNM2c5Bq6homi+SUrNSrFMKQzEtlIQd7ELHYza+uz6+E3roUcS3uFw4MWJAldoM9250/T35NQ1vcwkj+YKBYsQBuxdH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D1YUGPl7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D1YUGPl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776814972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oqhU59Gz5v6faIGUOxDc3K6Gyrpk7Nle6UXoLaHqK3o=;
	b=D1YUGPl7OE7inqUXyTZ5nLLhUfd5ik7+awWPXR6RCOsDGfZyO/Rlu4A/8+qaGAG/ydJ0Bo
	fX2dC0hBA1xA7gxPLbDXaOeCpDEETl7vEMCpxuSYUl6+L5uAxy8igb2T6aBB8TsGtTsVHi
	zCGn2zqu8FW0M0eiiyj7GeEM5eFH1A4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-144-RBsNdtxFMcWVaeJL4WEyrQ-1; Tue,
 21 Apr 2026 19:42:48 -0400
X-MC-Unique: RBsNdtxFMcWVaeJL4WEyrQ-1
X-Mimecast-MFC-AGG-ID: RBsNdtxFMcWVaeJL4WEyrQ_1776814965
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D6742180049F;
	Tue, 21 Apr 2026 23:42:44 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.14])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C66601800352;
	Tue, 21 Apr 2026 23:42:40 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Cc: Matthew Maurer <mmaurer@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	christian.koenig@amd.com,
	Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	linux-media@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	Asahi Lina <lina+kernel@asahilina.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@vger.kernel.org
Subject: [PATCH v11 0/5] Rust bindings for gem shmem
Date: Tue, 21 Apr 2026 19:40:36 -0400
Message-ID: <20260421234234.638503-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: OloVuu3LvH8j3jE7Q36Aa_0i5pCRQAeaYL5_GwNrPrA_1776814965
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

Branch with patches applied available here (+ a hack required to make
sure this builds:

	https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust/gem-shmem

This patch series applies on top of drm-rust-next

Lyude Paul (5):
  rust: drm: gem: s/device::Device/Device/ for shmem.rs
  drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
  drm/gem/shmem: Export drm_gem_shmem_get_pages_sgt_locked()
  rust: drm: gem: Introduce shmem::SGTable
  rust: drm: gem: Add vmap functions to shmem bindings

 drivers/gpu/drm/drm_gem_shmem_helper.c |  48 ++-
 include/drm/drm_gem_shmem_helper.h     |   2 +
 rust/kernel/drm/gem/shmem.rs           | 557 ++++++++++++++++++++++++-
 3 files changed, 593 insertions(+), 14 deletions(-)


base-commit: a7a080bb4236ebe577b6776d940d1717912ff6dd
-- 
2.53.0

