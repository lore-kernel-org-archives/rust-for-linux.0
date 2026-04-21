Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611884502A
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 23:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776815645; cv=none; b=sWLAZw/47tlK6d05+6P3Xb6mTsk9lKmfJesZ2WrsWDaYfl4ANd0sgeos2Z1rkhqOte5lBk6robnpJuAjwtrVn2x5HEfhdgS+cXRKuRK8BsePxTwPImWnBit0WfkmzLYakjYNvLGdIrPeEPOFbLwwj0pIZsFT72rkvgLAUjEgUBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776815645; c=relaxed/simple;
	bh=uQUtbQJcg0Wmc7SSvl7Z9v+Kia6zeylfY5eI6AEXVyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=rYsoNPRzgszHuzGjXTfL53uDxsFXVcjdEUHUXMj0DRUGpkR8tjVjDHvy1NdH2pfBUsInLs4j78ZIiOPgx0TNirgn7L47wYq5+oR2ljP1xrEnt+vnuukIG3dXx6eDw39/W3hfMQbacJMylC9iyZp4mTL5NOIejATkjVawXQTeJlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fwMShc/u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fwMShc/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776815643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+BYMBbkpws+Rj/0scMeX8uDdxWKOZ93iimn7i+E8GpA=;
	b=fwMShc/uYLMD3kysKX6aTV7e8tvtghwC858HQMghdvSc6p4WWTbGz+274/3ZuCWSMv3jfX
	5ikb4+FWDNFNhEaK+AkAj3YwDYeALRhmzqtf0WuOIFn1pYTXAPwlDTqjbAbWV8PpuY2pxU
	EX2BExerAfrf6iCdmO1DU2mdNhdM55s=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581-N9uCqpu1OdOzIC0jHt74LQ-1; Tue,
 21 Apr 2026 19:54:01 -0400
X-MC-Unique: N9uCqpu1OdOzIC0jHt74LQ-1
X-Mimecast-MFC-AGG-ID: N9uCqpu1OdOzIC0jHt74LQ_1776815638
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E913B1956089;
	Tue, 21 Apr 2026 23:53:57 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.14])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2551219560AB;
	Tue, 21 Apr 2026 23:53:54 +0000 (UTC)
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
Subject: [PATCH v12 0/5] Rust bindings for gem shmem
Date: Tue, 21 Apr 2026 19:52:12 -0400
Message-ID: <20260421235346.672794-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: GEjTQqmeI-IrJ1U_egGjQ1mGDQZi2NgPkekxHAJlRwo_1776815638
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

Branch with patches applied available here
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

