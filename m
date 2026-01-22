Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFAE37107D
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769119866; cv=none; b=DCW1YPjvMd7cFgMaW5K7MSU1KjR+3spFazyw9p2E8Ez+SJ8lBcOprhkdi+0YFcEMFPAWG6EjxOPv7jZI1CXqQHF77KOV7k1vxVHNOz0tBsl8Vq4eqEMVr7MzI+azjawfDElzdIBezZmpgG/4eWLOtnazdN4rR6lkwMT46D1yv2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769119866; c=relaxed/simple;
	bh=Bghe/LHsIOtmWL69KUv9i/gZNxOQ8gSgG7QDM9CHwpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GgmYs5gt+cEV1sFyLVb4lPywGESUUQW/IpC7hnIz6pe3Sktrtd4p1yNY6TbUIbGQI6YB1fDsUxgTB4ZHRxseiPq4wGRe9k50R67Je9XE4Iqo7thQ5rY9TfYawptPcbGeB3mea7QHRbnmg9Jni1sJrnT1WtEHMZoNZimARzSKnEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bgkjhChM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bgkjhChM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769119852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sNviksuh25+5lQE2BUp1QrgnN7wcP+X7oJ6GwJF6NYY=;
	b=bgkjhChMKfbP97lkLOOKvLtfYtM2g07HXa7VN7CrpHY8zhGTqdqKipkHDt4gQMdRLvn60h
	rFKsDtxDwPIOyqp3C57/Is5ogPqwjXgKpCoO07vMjn8TeFv4jN9cZ7IASqOiFKJ+P7sHOW
	P5O8FCe0i5apdxn4ZqDUN1qMNjtWAuc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-487-1wilEl0INgGh_FIT1SjC8g-1; Thu,
 22 Jan 2026 17:10:43 -0500
X-MC-Unique: 1wilEl0INgGh_FIT1SjC8g-1
X-Mimecast-MFC-AGG-ID: 1wilEl0INgGh_FIT1SjC8g_1769119841
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89E8618005B4;
	Thu, 22 Jan 2026 22:10:41 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 182481800665;
	Thu, 22 Jan 2026 22:10:39 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"David Airlie" <airlied@gmail.com>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH] rust/drm: Fix Registration::{new,new_foreign_owned}() docs
Date: Thu, 22 Jan 2026 17:10:37 -0500
Message-ID: <20260122221037.3462081-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Looks like we've actually had a malformed rustdoc reference in the rustdocs
for Registration::new_foreign_owned() for a while that, when fixed, still
couldn't resolve properly because it refers to a private item.

This is probably leftover from when Registration::new() was public, so drop
the documentation from that function and fixup the documentation for
Registration::new_foreign_owned().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/driver.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index f30ee4c6245cd..e09f977b5b519 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -121,7 +121,6 @@ pub trait Driver {
 pub struct Registration<T: Driver>(ARef<drm::Device<T>>);
 
 impl<T: Driver> Registration<T> {
-    /// Creates a new [`Registration`] and registers it.
     fn new(drm: &drm::Device<T>, flags: usize) -> Result<Self> {
         // SAFETY: `drm.as_raw()` is valid by the invariants of `drm::Device`.
         to_result(unsafe { bindings::drm_dev_register(drm.as_raw(), flags) })?;
@@ -129,8 +128,9 @@ fn new(drm: &drm::Device<T>, flags: usize) -> Result<Self> {
         Ok(Self(drm.into()))
     }
 
-    /// Same as [`Registration::new`}, but transfers ownership of the [`Registration`] to
-    /// [`devres::register`].
+    /// Registers a new [`Device`](drm::Device) with userspace.
+    ///
+    /// Ownership of the [`Registration`] object is passed to [`devres::register`].
     pub fn new_foreign_owned(
         drm: &drm::Device<T>,
         dev: &device::Device<device::Bound>,

base-commit: 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
-- 
2.52.0

