Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A8A3A9632
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 19:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293512; cv=none; b=hqrusz3JzxCmqsyIfD8NBY3EsLw78q9V5+rljR5KF20TJjLKcnAtzP7KYmxJlTOlfpvesBMcm9D73V0K/gy2+YFFMjZDIJFYUKR5LTU4QdO6IB2nFwuDWGO2dfiBl5/s2NNaIKEAaQ4AJW436fIBaSk8rV8vhYnv/VMYtrc3x+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293512; c=relaxed/simple;
	bh=Q72QyC8esGhSP+quoWONN2DRPUvwuRRV5BTLr5CxHa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=gjb8VTs/ycSHkZGic4blWS5zwn9vyTxqZa6Dc/AyHIGxgfALhGxHJXSvY+RYlJyozD+mLE3RvkMKW8beVLm1URN7xmVDItpS1SXRxDVfGCgL9SWa1FSINgxsiE249kE+ntUSWcCxT+jAAs1MdNsReey3VpGZPPeHh7lDIgNZnV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y6RUs8AE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y6RUs8AE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781293509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=44xdXI8SKKWzRa/eVahYHkFDmVs61VmyxUZfkAjitOE=;
	b=Y6RUs8AECBoY5g8xOElrPQ1ev/tgLCxHteghtYqR7eXCcl+d/S+84cS0LBgpdLJS9TAA3B
	qwdIy9RPXCEfWzT9eFTdzfXh9ZSf1RFrV7bqNzlGvfnvUWixrEJ7xi/sR98BcNDOWCUt2u
	A9B9HTvKD8ryROvokvVP7/x4NvHWLkk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-NqhQHcMjMTiRR_MmED_QZg-1; Fri,
 12 Jun 2026 15:45:03 -0400
X-MC-Unique: NqhQHcMjMTiRR_MmED_QZg-1
X-Mimecast-MFC-AGG-ID: NqhQHcMjMTiRR_MmED_QZg_1781293500
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A87351956062;
	Fri, 12 Jun 2026 19:44:59 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.21])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E3C7F1686;
	Fri, 12 Jun 2026 19:44:55 +0000 (UTC)
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
Subject: [PATCH v21 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
Date: Fri, 12 Jun 2026 15:43:33 -0400
Message-ID: <20260612194436.585385-2-lyude@redhat.com>
In-Reply-To: <20260612194436.585385-1-lyude@redhat.com>
References: <20260612194436.585385-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: EUF2px-nQjDmF15F1y13uKpjoihVoKUGmjXzGGPsKsM_1781293500
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Just a temporary holdover to make locking/unlocking the dma_resv lock much
easier.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>

---
V17:
* Fix format of commit message title
V19:
* Add NotThreadSafe to DmaResvGuard
V20:
* s/inline(always)/inline/

 rust/kernel/drm/gem/shmem.rs | 39 ++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 084b798ce795b..090c5d869fdb7 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -22,7 +22,10 @@
     error::to_result,
     prelude::*,
     sync::aref::ARef,
-    types::Opaque, //
+    types::{
+        NotThreadSafe,
+        Opaque, //
+    },
 };
 use core::{
     marker::PhantomData,
@@ -30,7 +33,10 @@
         Deref,
         DerefMut, //
     },
-    ptr::NonNull, //
+    ptr::{
+        self,
+        NonNull, //
+    },
 };
 use gem::{
     BaseObjectPrivate,
@@ -244,3 +250,32 @@ impl<T: DriverObject, C: DeviceContext> driver::AllocImpl for Object<T, C> {
         dumb_map_offset: None,
     };
 }
+
+/// Private helper-type for holding the `dma_resv` object for a GEM shmem object.
+///
+/// When this is dropped, the `dma_resv` lock is dropped as well.
+///
+// TODO: This should be replace with a WwMutex equivalent once we have such bindings in the kernel.
+struct DmaResvGuard<'a, T: DriverObject, C: DeviceContext = Registered>(
+    &'a Object<T, C>,
+    NotThreadSafe,
+);
+
+impl<'a, T: DriverObject, C: DeviceContext> DmaResvGuard<'a, T, C> {
+    #[inline]
+    #[expect(unused)]
+    fn new(obj: &'a Object<T, C>) -> Self {
+        // SAFETY: This lock is initialized throughout the lifetime of `object`.
+        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
+
+        Self(obj, NotThreadSafe)
+    }
+}
+
+impl<'a, T: DriverObject, C: DeviceContext> Drop for DmaResvGuard<'a, T, C> {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: We are releasing the lock grabbed during the creation of this object.
+        unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
+    }
+}
-- 
2.54.0

