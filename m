Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00484190064
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 23:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739538; cv=none; b=sQEfIOrq2wV8lJp4hbUkRF6G7agPnndSBvA7AZiPQwXUV3Szxe6dH1RCnIGjDBh2JFaxjIW/uFXva+bmYFpgXHQ6tdfRBjUTk/QgoA6GtgqZO9L/qNbk6wm/lPZDhnSmqWUXiYKuoyBj4MOVPybzLgRQOdH0WaPiRmeGk5/nh0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739538; c=relaxed/simple;
	bh=XjEuLy4yYwBI886t84WJ9mM0PIrMc11fzv2jPkEjj0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/eaaJwxz+mgpwB5i7jAa7B8beYCuyRwKFcXFMZ1GWMxVmmTDVMKllipM2hEO6wgDbUFWXKhfS2f5Fv8/XakAqM0uv6ppIDIWOQS7h20r/BeubnbFOmaiRc9Xy+ps9yBQM4xT1GJEC3+GbolvrGcD4B2zCgC1mH+GIVUnPUYYMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CE9qjxoa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CE9qjxoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727739536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jWkQB1pyBirQ1KP5U86Ct+4qpRkAEhXPzsNN9WOdD3Q=;
	b=CE9qjxoaW4/GT4zkRUO1VMBrrJfofxHXEbGcLkLcTcDP7+L52HLrj+wHfA04nq61d5to4G
	C1qcD1A+4skSpVi5rXSId2BgHsQ8VPItII/kYxX5lKWIWa7ss8LiowQQMrMFBsDf/JQpXn
	dp/u2cPvb9oHKMFp0IaSXWdzQhrXPxQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-tXS1bctpM0iGvAUk1iodGg-1; Mon,
 30 Sep 2024 19:38:50 -0400
X-MC-Unique: tXS1bctpM0iGvAUk1iodGg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5983B1955D47;
	Mon, 30 Sep 2024 23:38:48 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 993753003DEC;
	Mon, 30 Sep 2024 23:38:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>,
	Danilo Krummrich <dakr@kernel.org>,
	mcanal@igalia.com,
	airlied@redhat.com,
	zhiw@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@redhat.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 11/35] rust: drm/kms: Add ConnectorGuard::add_modes_noedid()
Date: Mon, 30 Sep 2024 19:09:54 -0400
Message-ID: <20240930233257.1189730-12-lyude@redhat.com>
In-Reply-To: <20240930233257.1189730-1-lyude@redhat.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

A simple binding for drm_add_modes_noedid() using the ConnectorGuard type
we just added.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h  |  2 ++
 rust/kernel/drm/kms/connector.rs | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ba1871b05b7fa..7695f11f4363c 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_fbdev_dma.h>
@@ -19,6 +20,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_probe_helper.h>
 #include <kunit/test.h>
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 57ab29473c344..7d0f67c3bdaf8 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -378,6 +378,17 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+impl<'a, T: DriverConnector> ConnectorGuard<'a, T> {
+    /// Add modes for a [`ConnectorGuard`] without an EDID.
+    ///
+    /// Add the specified modes to the connector's mode list up to the given maximum resultion.
+    /// Returns how many modes were added.
+    pub fn add_modes_noedid(&self, (max_h, max_v): (i32, i32)) -> i32 {
+        // SAFETY: We hold the locks required to call this via our type invariants.
+        unsafe { bindings::drm_add_modes_noedid(self.as_raw(), max_h, max_v) }
+    }
+}
+
 // SAFETY: DRM expects this struct to be zero-initialized
 unsafe impl Zeroable for bindings::drm_connector_state {}
 
-- 
2.46.1

