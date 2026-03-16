Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4719037267C
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773695826; cv=none; b=rKnHLmCECXQfW1Y7UtE8T2Zm3fuudb/JPRzzflJ9t5gmXDDEQ3u3eAqJtCbNiA96cTjz0o7BBxcnDXcbao+KN+bZQZqu1+zGiIdGUoDRKI60vqbMwfraCPFtgKiTyw3cN/ktkav+IzPTVg1vSY1mTcO7y8XtcNWKypniAFOSjEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773695826; c=relaxed/simple;
	bh=49yO5ePeQ6jTQYAQ+pAJAHztGpJfhw3XjlHpkfT+z9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cU96leYi0YQYcH8DsExBpc1Dvw0w80ool+y+QEFBv+E1MpQCK6qD8fTDkhUfgINzwryNK5Wcn4R9+6YD5EpXQm+Cz74PaHcXaO4GOawv1l41VciIPNuB4FcHkg2J8iqQ5D8SQ8y/NLIlC+kw5NJMJwhX4GK6xG/w6vQ3PxFWRbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WEmH+pkK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WEmH+pkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773695822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FK2SRYWUs8F1o4n/OCWFgYAf27vjExpMLrN5boT+rxU=;
	b=WEmH+pkKqGm2IXpxaoNkY7gAgIdfGq/ZSSvN4qlsf1k+pou/iK9vP6GqNYPujGpzpmUDPg
	b5wBtnf+LC1Hb9t2Ft0HxOHMluReYtn85l46nNSq5CZKufSZDcd56OZwDog3puUweqGwxu
	MTEpY1lC0ur57+qvFU1ThaHbS43t5Nk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-244-IJaCFJjyPQ2OhhmKNwgyTg-1; Mon,
 16 Mar 2026 17:16:56 -0400
X-MC-Unique: IJaCFJjyPQ2OhhmKNwgyTg-1
X-Mimecast-MFC-AGG-ID: IJaCFJjyPQ2OhhmKNwgyTg_1773695813
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CDCE719560AE;
	Mon, 16 Mar 2026 21:16:52 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E1B0B1800361;
	Mon, 16 Mar 2026 21:16:48 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
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
Subject: [PATCH v9 0/7] Rust bindings for gem shmem
Date: Mon, 16 Mar 2026 17:16:08 -0400
Message-ID: <20260316211646.650074-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: AzqMnzV2Szvq6mM9JcsKynqClHAFKTdbC0k7Gi7OHmw_1773695813
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the next version of the shmem backed GEM objects series
originally from Asahi, previously posted by Daniel Almeida.

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
  rust: drm: Add gem::impl_aref_for_gem_obj!
  rust: drm: gem: Add raw_dma_resv() function
  rust: gem: Introduce DriverObject::Args
  rust: drm: gem: Introduce shmem::SGTable
  rust: drm/gem: Add vmap functions to shmem bindings

 drivers/gpu/drm/nova/gem.rs     |   5 +-
 drivers/gpu/drm/tyr/gem.rs      |   3 +-
 rust/bindings/bindings_helper.h |   3 +
 rust/helpers/dma-resv.c         |  13 +
 rust/helpers/drm.c              |  56 ++-
 rust/helpers/helpers.c          |   1 +
 rust/kernel/drm/gem/mod.rs      |  79 +++-
 rust/kernel/drm/gem/shmem.rs    | 654 ++++++++++++++++++++++++++++++++
 8 files changed, 792 insertions(+), 22 deletions(-)
 create mode 100644 rust/helpers/dma-resv.c
 create mode 100644 rust/kernel/drm/gem/shmem.rs


base-commit: dc33ae50d32b509af5ae61030912fa20c79ef112
prerequisite-patch-id: c631986f96e2073263e97e82a65b96fc5ada6924
prerequisite-patch-id: ae853e8eb8d58c77881371960be4ae92755e83c6
prerequisite-patch-id: 0ab78b50648c7d8f66b83c32ed2af0ec3ede42a3
prerequisite-patch-id: 636ec7f913f4047e5e1a1788f3e835b7259698c2
prerequisite-patch-id: d75e4d7140eadeeed8017af8cd093bfd2766ee8e
prerequisite-patch-id: 67a8010c1bc95bca1d2cf6b246c67bc79d24e766
-- 
2.53.0

