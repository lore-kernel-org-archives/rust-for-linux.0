Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A0635B646
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 23:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776814984; cv=none; b=bAQUP/S7JWjxbM2xDbOQ36zcR+GAi1kdSYX9Keq8AjA5agzMlLe/B9CFQsGlc3Qj2Raqo7rP3OWKM1loSJJwVxSpFYo/qCamMMOj6/QRRxY5R4h4kCNGKmm5c41XNAg5Mo0N4B3HmYUUBw3fcHjfEqkvFZTZSAKlEtFlCG+9dAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776814984; c=relaxed/simple;
	bh=LIF9mwZCfgdZkdJWAlJTMsdxgoRgAfZ+LtCsvWZ+CC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=sW0bd81ym0FN8E0uUH7FVgud9uLwUyd42zSJq67IEH0yC4+pN0LiYOUULy14zlvWMF4Zsv7ho3OsYht3w8RiGL38HSIdet/wnUk6+q1cqdho6+DTOQMc+3VMLfwYANTRMSpMJESfp/QeHHN3NbZRxiRlqFrz9rqS4RUgd5/iVwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BwpCFcHr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BwpCFcHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776814982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jpiw4NbDlnr2VDVswPGwDPVhLnXvWCUe2RwuNRF/TFk=;
	b=BwpCFcHrcDzmokTO7vCAAGPsiTGXxvNMjM2OQzjlmWDEHOy/mfjTEjpj3JFYryzaJk5InZ
	3/RbGGkyQkeU+z/CcJb2JN3JdvMgGqZGz7s2/uEHCwW1XcvFrqOh2J3Pz9PCeDdLLCY8+b
	2/mxh7Go5RgPVok7u+ig8pGGPmmZRVQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-376-O_rB290LNym1inC3GixdfA-1; Tue,
 21 Apr 2026 19:42:55 -0400
X-MC-Unique: O_rB290LNym1inC3GixdfA-1
X-Mimecast-MFC-AGG-ID: O_rB290LNym1inC3GixdfA_1776814972
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B792B1800367;
	Tue, 21 Apr 2026 23:42:52 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.14])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D004180045E;
	Tue, 21 Apr 2026 23:42:48 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
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
Subject: [PATCH v11 2/5] drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
Date: Tue, 21 Apr 2026 19:40:38 -0400
Message-ID: <20260421234234.638503-3-lyude@redhat.com>
In-Reply-To: <20260421234234.638503-1-lyude@redhat.com>
References: <20260421234234.638503-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: HeK2Jq7mOIszD0hqyuA-gNysWgvVezNV8OMTXtEeJIA_1776814972
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

One of the complications of trying to use the shmem helpers to create a
scatterlist for shmem objects is that we need to be able to provide a
guarantee that the driver cannot be unbound for the lifetime of the
scatterlist.

The easiest way of handling this seems to be just hooking up an unmap
operation to devres the first time we create a scatterlist, which allows us
to still take advantage of gem shmem facilities without breaking that
guarantee. To allow for this, we extract __drm_gem_shmem_free_sgt_locked()
- which allows a caller (e.g. the rust bindings) to manually unmap the sgt
for a gem object as needed.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

---
V10:
* Fix incorrect function name in documentation for
  __drm_gem_shmem_release_sgt_locked()

 drivers/gpu/drm/drm_gem_shmem_helper.c | 32 +++++++++++++++++++++-----
 include/drm/drm_gem_shmem_helper.h     |  1 +
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 4500deef41278..d2c34a0e573a1 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -158,6 +158,30 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
+/**
+ * __drm_gem_shmem_release_sgt_locked - Unpin and DMA unmap pages, and release the
+ * cached scatter/gather table for an shmem GEM object.
+ * @shmem: shmem GEM object
+ *
+ * If the passed shmem object has an active scatter/gather table for driver
+ * usage, this function will unmap it and release the memory associated with it.
+ * It is the responsibility of the caller to ensure it holds the dma_resv_lock
+ * for this object.
+ *
+ * Drivers should not need to call this function themselves, it is mainly
+ * intended for usage in the Rust shmem bindings.
+ */
+void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object *shmem)
+{
+	dma_resv_assert_held(shmem->base.resv);
+
+	dma_unmap_sgtable(shmem->base.dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	sg_free_table(shmem->sgt);
+	kfree(shmem->sgt);
+	shmem->sgt = NULL;
+}
+EXPORT_SYMBOL_GPL(__drm_gem_shmem_free_sgt_locked);
+
 /**
  * drm_gem_shmem_release - Release resources associated with a shmem GEM object.
  * @shmem: shmem GEM object
@@ -176,12 +200,8 @@ void drm_gem_shmem_release(struct drm_gem_shmem_object *shmem)
 
 		drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
 
-		if (shmem->sgt) {
-			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
-					  DMA_BIDIRECTIONAL, 0);
-			sg_free_table(shmem->sgt);
-			kfree(shmem->sgt);
-		}
+		if (shmem->sgt)
+			__drm_gem_shmem_free_sgt_locked(shmem);
 		if (shmem->pages)
 			drm_gem_shmem_put_pages_locked(shmem);
 
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 5ccdae21b94a9..b2c23af628e1a 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -111,6 +111,7 @@ int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shme
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 void drm_gem_shmem_release(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
+void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object *shmem);
 
 void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
-- 
2.53.0

