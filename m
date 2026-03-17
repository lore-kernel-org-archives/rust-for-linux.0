Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1091B2DECDF
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 21:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773783142; cv=none; b=H4A/H7PBAYx//0JcJQqy9q/I94zt6HqEvI3h1UCYVNSiFjlBM81MXJfHtowli+rRH9XqOP4jNtxMclckmfPsoNmv/bRhV7t4sILC8/U6JwTZqhj94ggOubnwIi6INySaThAy/HcL+JLl2a8s/UxPk4uHNAT22OcaQmSBbDDkKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773783142; c=relaxed/simple;
	bh=eRLzK0sMt29IWHEpwaqgFvyvC4h67c3DJlRjJnWISgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=oj7oRq3mZYBDBH8qSoyXoUdys+2k2uIH7RkJPNEMVYMigg16x/Y2EPxSvO3OUTBtXLmLaskyIynhnwNhZDVyhnIrkHZWPzpeLEQSY3lwX4l0FS06vmG+g+jvTc1VoI2Bf8BCg+8lyON3fbf1LHX1BYW7SKvd82CJtfkn54KNEYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LHkXync9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LHkXync9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773783140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ij1yQntSvQFt7/RHVuQLId2L2krPhGO2KVctxdDPVP4=;
	b=LHkXync9TK9G14I76wZKgs7MuV0ogNK6jv27Xkhcq6uoC992vCBxYkSk5AUn0OqHqAjhyD
	wc3CLXWJFUhsyh5JaYVLothBf5AtFGChXocrZ4OnpNm+ry6g8SAWyREfR4OBxXDqURuae+
	Wzhn/HTdD6hKeblaU/OeYRWCo64CatM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-wj7QIJHgNdybYpTePyw_Tg-1; Tue,
 17 Mar 2026 17:32:14 -0400
X-MC-Unique: wj7QIJHgNdybYpTePyw_Tg-1
X-Mimecast-MFC-AGG-ID: wj7QIJHgNdybYpTePyw_Tg_1773783132
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CC691956048;
	Tue, 17 Mar 2026 21:32:12 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.56])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AFB5D1800576;
	Tue, 17 Mar 2026 21:32:09 +0000 (UTC)
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
	"David Airlie" <airlied@gmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Asahi Lina" <lina+kernel@asahilina.net>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v5 0/4] Introduce DeviceContext
Date: Tue, 17 Mar 2026 17:28:29 -0400
Message-ID: <20260317213003.606088-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: TxyYF9F6ccGiqqoSLV6Gni7tVqZl_16ffKLXBUWj4OU_1773783132
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Previous version of this patch series:
  https://patchwork.freedesktop.org/series/160217/#rev4

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
Lyude Paul (4):
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

-- 
2.53.0

