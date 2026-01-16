Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8952DE6F8
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 20:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596521; cv=none; b=glGRjsxoSnwacav0m8LtVCXbywyc/eYtzY2g7+93LFxpNlxMRzf/vg73L29Gwf3z+JInmzS0rNKzQ+50rGmGdGN5YL5MngjGuOdflPNRd7CUeVHEsTGt5YAwJnnqlAvWCzU8lnuslVCvKYgm0IqzaPTjCdgzOgaXn4RZUwcSvXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596521; c=relaxed/simple;
	bh=NNPJDSSd3baw1lvRHSBRMxOwNHQqNM5ueqH1dIDgSz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cHRC+8icAJfih88zj6GlU3XbKYdQwUzw7oUyhBZMv2K3gp1IYEw/MNqMNuo+JM0VpByFVXjDz0Fk+7k9E4dFIc799vqhBV48FVTEzqOPDjQwuXhL4/fQBeEbAUENYStSd1HqPCsk6jK58j5ZtSm9AbYfHXsm6zREzuXkqSoFAXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PmVmG+xh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PmVmG+xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768596518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CLsnGGgzFwX5I4axGZAFw6qRM7D95WrDoUBgXffWh40=;
	b=PmVmG+xhlULXo1dYXS82vwWbYmaVbmib9gsE6sjZbzjeYdxFA8hOi9fs2ur2IHukTDVhMS
	LPm8k0Q1xVucpFBhj7OkDm/kV22ddYQ55upt7cD9VBqbIuJ51o5Cjv/iSA68OnW5vNSPCO
	C9mIrYqHKKItRuU7pF4q18wcuFkcn+s=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-58-AfUrJ1WxPliM80U5W-_gCQ-1; Fri,
 16 Jan 2026 15:48:34 -0500
X-MC-Unique: AfUrJ1WxPliM80U5W-_gCQ-1
X-Mimecast-MFC-AGG-ID: AfUrJ1WxPliM80U5W-_gCQ_1768596512
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 325E218005B0;
	Fri, 16 Jan 2026 20:48:32 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.63])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 665FE19560A7;
	Fri, 16 Jan 2026 20:48:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org,
	"Ewan Chorynski" <ewan.chorynski@ik.me>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Shankari Anand" <shankari.ak0208@gmail.com>,
	"David Airlie" <airlied@gmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Asahi Lina" <lina+kernel@asahilina.net>,
	"Atharv Dubey" <atharvd440@gmail.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v2 0/3] Introduce DeviceContext
Date: Fri, 16 Jan 2026 15:41:40 -0500
Message-ID: <20260116204728.725579-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Previous version of this patch series:
  https://lists.freedesktop.org/archives/dri-devel/2025-November/535387.html

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
 rust/kernel/drm/device.rs      | 231 +++++++++++++++++++++++++--------
 rust/kernel/drm/driver.rs      |  56 ++++++--
 rust/kernel/drm/gem/mod.rs     |  66 ++++++----
 rust/kernel/drm/mod.rs         |   4 +
 8 files changed, 292 insertions(+), 101 deletions(-)


base-commit: 086714bbb96f63785da251e1f8d1ce3e716a6e42
-- 
2.52.0

