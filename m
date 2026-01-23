Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9B423BD17
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 23:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769209964; cv=none; b=rG/qJXaIUfEgHdzBm8e+SzIN0c6CigZ0C591xKCTetjsmevGsiGyrJQr8dM0Wz0Tr3Zb/TUVMYumDD5lBnyUC6mtH3HFMWeNzc54m4JZrXiDcxd4lAg6ovsdHtHuxZJWn1yOcZtSjK80hHvRXH8lf1f+YHpKe9cvImoFFcMhePY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769209964; c=relaxed/simple;
	bh=64mXrIypsqELuidG6/QdOaI4qfl7c/REsvPJT3dyB8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DOoJK2NebhTOx7+gCUgdm8h6RMXjmzfaUUzxmzs1bNUC5Do6pibFr4hMOIQLZkOn8d2/00uRzes0zdMW9joijEtjOcPUWpoEC7R7Lwlr4DOwIDbHvY0wPuqf/45VvYXW8AK6DIYNX3nx8oJN/gUEApql/gQDAOz8pYWUco71XtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XWSMMurI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XWSMMurI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769209962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q3EQGPwM17ahHgggCnLwM/epN4ehtW+OIYvbEeIxdv8=;
	b=XWSMMurIXo8PxJRyOoYCru7tIuY5eEt63Z4hDXtEYFfa/5GZqm/LmLWpuEQRSTiIVDFr3Z
	bvP/+5Icm5mmgP0ZeLgfXyuvop/hIduFr7kDeEPb8y0m8kAi2FIqjL7QVZP8ROn9akaB7e
	KxH4nJuzsZAuRDucxhyM9kJrPdzn9Js=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-tpzwDz1ZM7OmPHgWxAyfjQ-1; Fri,
 23 Jan 2026 18:12:38 -0500
X-MC-Unique: tpzwDz1ZM7OmPHgWxAyfjQ-1
X-Mimecast-MFC-AGG-ID: tpzwDz1ZM7OmPHgWxAyfjQ_1769209956
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6FEEE1956054;
	Fri, 23 Jan 2026 23:12:36 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E0F581958DC4;
	Fri, 23 Jan 2026 23:12:33 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Shankari Anand" <shankari.ak0208@gmail.com>,
	"David Airlie" <airlied@gmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Asahi Lina" <lina+kernel@asahilina.net>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v4 0/3] Introduce DeviceContext
Date: Fri, 23 Jan 2026 18:10:12 -0500
Message-ID: <20260123231230.248500-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Previous version of this patch series:
  https://patchwork.freedesktop.org/series/160217/#rev2

One of the unsolved issues we still have with the rust DRM bindings is
the ability to limit certain Device operations to contexts where we can
guarantee that a Device has been fully initialized and registered with
userspace, or vice-versa (e.g. must be unregistered).

While the previous solution for this that I had was simply not exposing
drm::Device at all until the device has been registered with userspace,
unfortunately this isn't enough since:

* As we found out with Tyr, drivers occasionally need to be able to
  create GEM objects before device registration
* We would still need to be able to handle KMS callbacks which could be
  invoked after KMS init but before userspace registration (not handled
  in this series specifically, but DeviceContext will be required for
  handling this).

This patch series provides a pretty nice solution to this, by
implementing a very similar solution to kernel::device::DeviceContext:
introducing our own DeviceContext type state.

This patch series depends on the two pre-requisite patch series:

* https://patchwork.freedesktop.org/series/160523/

                          Series-wide changes

V2:
* s/DeviceCtx/DeviceContext/ for consistency
* Move private driver-data availability to the Registration
  DeviceContext
* s/AnyCtx/Init/

More changes described in each patch description.

Lyude Paul (3):
  rust/drm: Introduce DeviceContext
  rust/drm: Don't setup private driver data until registration
  rust/drm/gem: Use DeviceContext with GEM objects

 drivers/gpu/drm/nova/driver.rs |  10 +-
 drivers/gpu/drm/nova/gem.rs    |  11 +-
 drivers/gpu/drm/tyr/driver.rs  |  12 +-
 drivers/gpu/drm/tyr/gem.rs     |   3 +-
 rust/kernel/drm/device.rs      | 250 +++++++++++++++++++++++++--------
 rust/kernel/drm/driver.rs      |  52 +++++--
 rust/kernel/drm/gem/mod.rs     |  64 ++++++---
 rust/kernel/drm/mod.rs         |   4 +
 8 files changed, 305 insertions(+), 101 deletions(-)


base-commit: 5ec66bbc74883b73d169ceb25dcb7a5cb22e275b
prerequisite-patch-id: ddb20be75c8fc92ba2d48a5c4aa8e724202de1ff
prerequisite-patch-id: 87e69cd89a806392d3275b19fbfb160d44d957c9
-- 
2.52.0

