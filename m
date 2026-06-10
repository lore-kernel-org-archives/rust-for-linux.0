Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FCB3148A3
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 16:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108691; cv=none; b=OZR4050SyHfHU3YIfUHC8++XngHVu/cmNZ6xgfTY4H01QA1BOONx8hkjLvR+eKdiumDB52T9FeA1bGGDBgaTA1zYuEZ7h5zSFfpFgIL4iGPLzxbzI86uM0qyMR3d2C8IEjNuaumCiWhnvEJoMx9VF3N0Y6En6thV5IN0JDYqw5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108691; c=relaxed/simple;
	bh=zYx08x2eZiw8ZZqqoTKT0emY7CYhmD+1FzA1TC1CyHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=LhS12+WmShxhI0nuDuFMbJgJJZ2P/AlOfHB+5TRTrAebZqa8fA6UFTIXSRy5meACzkECvIOSYKqFWnWVulOjbkn8u6GeqHmBV4n2ZTUapelGUPeX60XEbEFmEdnU+4wgCy0p9j7WPvG0y0tqdSqQ6jHO10EBo3XpirtDCeC9uz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mk8/sTiP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mk8/sTiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781108688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aJZSLKFmwdVxL+9TcEJu6Qfawm5t/bukKEPwYVEKRRQ=;
	b=Mk8/sTiP93gzKzADX7wP0zwHWsDWeQC3Q9tsiyePfLAraK5XbTU0KLC+ZbYcz8C3KKrQZG
	2XPIu21a0iFS7NslzzjKFZLUnUH+QVPwRT4N5u1hyJXicmcKmVOs/356PH+eXyKjO/6zFk
	qQz8tHRyqQAxOITExsdybbNeslYtfi0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-g2kUAiG7PSW8nIaPg6uKmg-1; Wed,
 10 Jun 2026 12:24:45 -0400
X-MC-Unique: g2kUAiG7PSW8nIaPg6uKmg-1
X-Mimecast-MFC-AGG-ID: g2kUAiG7PSW8nIaPg6uKmg_1781108682
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C937195FE08;
	Wed, 10 Jun 2026 16:24:41 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.69])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5696F3008DC3;
	Wed, 10 Jun 2026 16:24:37 +0000 (UTC)
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
Subject: [PATCH v20 0/4] Rust bindings for gem shmem
Date: Wed, 10 Jun 2026 12:21:27 -0400
Message-ID: <20260610162433.923550-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: ZEdR-TVHqcds3Kw_IEM6ACU3Czt69ei4j_aF8-2ORN8_1781108682
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

This patch series applies on top of drm-rust-next

Patch-series wide changes since V15:
* Fix some major rebasing errors I somehow didn't notice :(
* Drop the dependency on LazyInit, use the trick that Alice suggested
  instead.
* Fix dependency ordering so that Tyr can get the vmap stuff first
  without the other bits.
Patch-series wide changes since V16:
* Fix ordering one more time (SetOnce::reset() doesn't need to come
  before adding vmap functions)
* Rebase against the latest DeviceContext changes from me that got
  pushed.
Patch-series wide changes since V20:
* Lots of Sashiko fixes, excluding the comments that I couldn't prove
  weren't just bogus.

Lyude Paul (4):
  rust: drm: gem: shmem: Add DmaResvGuard helper
  rust: drm: gem: shmem: Add vmap functions
  rust: faux: Allow retrieving a bound Device
  rust: drm: gem: Introduce shmem::Object::sg_table()

 rust/kernel/drm/gem/shmem.rs | 546 ++++++++++++++++++++++++++++++++++-
 rust/kernel/faux.rs          |  16 +-
 2 files changed, 546 insertions(+), 16 deletions(-)


base-commit: 848bf57e98e1678ce7a49eb4e0bf0502da95dc07
-- 
2.54.0

