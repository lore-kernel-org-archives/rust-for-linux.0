Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A812FFF8F
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 19:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773258794; cv=none; b=KT2WH2KDM37UXGuSFavh8+Ker+AsK2vD1bLDG4b1GGNJSJuvU+pPeW1PVewFibF3RauAewihKYxM28thtVFhSb9GvOJ0Hf6aW0agH3uhd5c12lD9TXaq6UywB3mCeQBTU1Kg7CrcyttoOs19DopHrgH4//rfzGKbxQDygi2NeGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773258794; c=relaxed/simple;
	bh=T+zlK84yelQFztPwwT4F2Z6NRCKEKEEcXyEa2DLFMjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dBuzCFdjgDnzRqg0F2p1DtNi6nhPvTEvqrGThExTOfrP86x0LY5BNr9mm1ijx54EoK5Etf2zpvmzY1v2Se/IbwsclJy3yErfqdwFuZZ2R9IwkAD+pXAe6WHbXNzNmqj5TI8sDDjEs5/ldBVrBWgei4IzlM4UpJlriPtnPPay9Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=grtfgG4P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="grtfgG4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773258789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cs7bLtTBbYmL95yXvFnRiSueazNnWtAyWdEJ3cgm1SY=;
	b=grtfgG4P7kTFbA1BygEs7uEDt54BpGGO/Ylh1cY1Z5zyGhvzaV+6DkfBnUc6wd8Vvmp8MM
	o7z5xvixaXnXzNbu7NYkwlbHlOXdCCGyN+c6qd6Y7tFztwm2s2UXcq52SY+XDhzjZLmlsk
	rU1rwfSbihaIwRBh4WOXB0IasJrJp1k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-128-CnHhYyvtMMqBe7-M2RCZhw-1; Wed,
 11 Mar 2026 15:53:06 -0400
X-MC-Unique: CnHhYyvtMMqBe7-M2RCZhw-1
X-Mimecast-MFC-AGG-ID: CnHhYyvtMMqBe7-M2RCZhw_1773258783
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BF55D19560A7;
	Wed, 11 Mar 2026 19:53:02 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.81.64])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2769A30030E9;
	Wed, 11 Mar 2026 19:52:57 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org
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
Subject: [PATCH v8 0/7] Rust bindings for gem shmem + iosys_map
Date: Wed, 11 Mar 2026 15:52:39 -0400
Message-ID: <20260311195246.2439593-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: dktMuHJrmI18_bqtHEeWZmBfEAUus46ItMx-qfW50Tc_1773258783
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
  rust: drm: Add gem::impl_aref_for_gem_obj!
  rust: drm: gem: Add raw_dma_resv() function
  rust: gem: Introduce DriverObject::Args
  rust: drm: gem: Introduce shmem::SGTable
  rust: drm/gem: Add vmap functions to shmem bindings

 drivers/gpu/drm/nova/gem.rs     |   5 +-
 drivers/gpu/drm/tyr/gem.rs      |   3 +-
 rust/bindings/bindings_helper.h |   3 +
 rust/helpers/dma-resv.c         |  13 +
 rust/helpers/drm.c              |  56 +++-
 rust/helpers/helpers.c          |   1 +
 rust/kernel/drm/gem/mod.rs      |  79 +++--
 rust/kernel/drm/gem/shmem.rs    | 529 ++++++++++++++++++++++++++++++++
 8 files changed, 667 insertions(+), 22 deletions(-)
 create mode 100644 rust/helpers/dma-resv.c
 create mode 100644 rust/kernel/drm/gem/shmem.rs

-- 
2.53.0

