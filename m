Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0403D8071
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769122294; cv=none; b=H8i8Vg+TR48i3YiuMpQPZllsfOwc4m269PmqdSj7phyw+qyY0E2kdD4hCMt7WrzbIsOJkejUAw+7FDzhZPLe2OGwMI5+pyyoIY1AUBbxv6RFHcaPx2WtlcqeaVFQuvSmt2ws3izozmTOElSFcHwmzlpK5Zy0JxRSs+OEIuIG6dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769122294; c=relaxed/simple;
	bh=PDEnRwc/Rfmks2s6nyHmr77ZNYxxxcaJBqQOxhcWP5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PW0TIyme6wIAfQWO0PfapjW8ThcCqvvSiGhLPHmj/zEJiCTudYQYgoKZVPa9fsDsZqNMimfE6mZRLKNyx5LcrGgcjsT0qPWq9oJPfC50JNS1eyroOWcjJBO8EvichZUebrJfPzUl9Fg/FBVIc0HkLY/vAKEcxe1euv7DmxxMqq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dWNaIML9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dWNaIML9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769122284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UCysTo7OMV2/jfbYw2YK22A1cPCErwIaomCVQtYlQaE=;
	b=dWNaIML92uqUgje4E7klKRvVrAJ1nhhK5bJDVo365m4ra76nIqbrpEghiwtr8d/opxf0p/
	OVv8jco+MiMvKxWe3pOVgfsWsEEDjYIkpmo+QhQMux2xoo1Taa53rZ/tpNZ6CggujIU+5y
	a0DWqW0Kur0GVTq8ksOyznNiD6F75t4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-66iMN1VCOG61fk1WMto-bA-1; Thu,
 22 Jan 2026 17:51:21 -0500
X-MC-Unique: 66iMN1VCOG61fk1WMto-bA-1
X-Mimecast-MFC-AGG-ID: 66iMN1VCOG61fk1WMto-bA_1769122279
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E8C918005B9;
	Thu, 22 Jan 2026 22:51:19 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B69A30002D8;
	Thu, 22 Jan 2026 22:51:16 +0000 (UTC)
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
Subject: [PATCH v3 0/3] Introduce DeviceContext
Date: Thu, 22 Jan 2026 17:46:35 -0500
Message-ID: <20260122225057.3589500-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Previous version of this patch series:
  https://patchwork.freedesktop.org/series/160217/#rev1

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
* https://patchwork.freedesktop.org/series/160525/

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
 rust/kernel/drm/device.rs      | 246 +++++++++++++++++++++++++--------
 rust/kernel/drm/driver.rs      |  55 ++++++--
 rust/kernel/drm/gem/mod.rs     |  64 ++++++---
 rust/kernel/drm/mod.rs         |   4 +
 8 files changed, 303 insertions(+), 102 deletions(-)


base-commit: 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
prerequisite-patch-id: d596b2a5a81fb067cb267fe30b6e2d8fd47fddad
prerequisite-patch-id: 32f09c643498c714d92a6a87b3de220b5d37b41e
prerequisite-patch-id: 28f11c925aab9ed9d4fa70dbbf2c4a7accb5c05d
-- 
2.52.0

