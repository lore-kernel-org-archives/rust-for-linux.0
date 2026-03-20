Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D463A1C5F11
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 23:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774049828; cv=none; b=kLwwlxV7uLtFXY5PybXLeSE82QBU+o77ZWPJSWQNaVkC6M2Nm1c1Ew3fJDpPL1NwUhkShFCWbHhx6Ta4snGOfUZXQY90wkD4Te8KCVuy1GMvK1dieKiswKJSFbZ+hbWwsVVl2a0Y8Vrl+Hln3seZls0MlPoBxLFliNb17vZqg4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774049828; c=relaxed/simple;
	bh=Lq/Ga7NNTFEu6sXu9geeqc+kiBT/8M36TEJ943bRBsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=UxlaRZi2i+a7ZBCcbLkF4leQl3RLkLc1HoJWScYZXB1IjP9YUlHQmkZe0pOcBmVcxYiQYfByjXdMEoR6+eJB+8wX5AntY/CFaPIl1Wc+FzPR2HGzkvh3shIgMI2iivufjb8AlWUL30xA4l47uJoCAoPpxPIosriOffwcTLuWCZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eHHvUst4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eHHvUst4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774049824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eGS+bPTCCnx2OfxFYkphRjFLuxpr51ULITK831fZk4E=;
	b=eHHvUst4RtOubo1tw+JZQBARmuPZTaeexYKv1qw9djz1buQgBeA86IJK6pcJ0FeZ9F6jbJ
	X01WR3TGtT1TdBUopuocmPmVF718g8CdEXQnEwr4TvQb6n1pevaVYQcLmuLafa6bCh3xBA
	cAOQMZbR1O+Y2q6A4VjSGh1qarRMWm4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-364-MdSbmsTyP_ipftwrgNCuOw-1; Fri,
 20 Mar 2026 19:37:01 -0400
X-MC-Unique: MdSbmsTyP_ipftwrgNCuOw-1
X-Mimecast-MFC-AGG-ID: MdSbmsTyP_ipftwrgNCuOw_1774049818
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E7C04195608C;
	Fri, 20 Mar 2026 23:36:57 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 38C4B18001FE;
	Fri, 20 Mar 2026 23:36:55 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	"Gary Guo" <gary@garyguo.net>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Shankari Anand" <shankari.ak0208@gmail.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"David Airlie" <airlied@gmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Asahi Lina" <lina+kernel@asahilina.net>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v6 0/5] Introduce DeviceContext
Date: Fri, 20 Mar 2026 19:34:25 -0400
Message-ID: <20260320233645.950190-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: k1pXFTM7qlitWTYOm_MQR4g4JgX9hy5iSC0TPAXv6-M_1774049818
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Previous version of this patch series:
  https://patchwork.freedesktop.org/series/160217/#rev5

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
V4:
* Split out DriverAllocImpl into it's own patch

More changes described in each patch description.

Lyude Paul (5):
  rust/drm: Fix potential drop of uninitialized driver data
  rust/drm: Introduce DeviceContext
  rust/drm: Don't setup private driver data until registration
  rust/drm/gem: Add DriverAllocImpl type alias
  rust/drm/gem: Use DeviceContext with GEM objects

 drivers/gpu/drm/nova/driver.rs |  10 +-
 drivers/gpu/drm/nova/gem.rs    |  11 +-
 drivers/gpu/drm/tyr/driver.rs  |  12 +-
 drivers/gpu/drm/tyr/gem.rs     |  10 +-
 rust/kernel/drm/device.rs      | 252 +++++++++++++++++++++++++--------
 rust/kernel/drm/driver.rs      |  52 +++++--
 rust/kernel/drm/gem/mod.rs     |  64 ++++++---
 rust/kernel/drm/mod.rs         |   4 +
 8 files changed, 312 insertions(+), 103 deletions(-)


base-commit: d19ab42867ae7c68be84ed957d95712b7934773f
-- 
2.53.0

