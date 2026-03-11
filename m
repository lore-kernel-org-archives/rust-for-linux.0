Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28864336ED1
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 19:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773258808; cv=none; b=T52xFR9sZNUptUpj3aQnngdFuuxzy5yyKxpefRh4GvrkXe3u8s096lVKO35CHHjuVgUtdmgsf/GpEpKGvQrMuNQ5aaxVLRfpezymwHcQGM4OzpLeE8AKJ1a5qPiqUfP3ICNmhD1/WpfgAX/UOzgj5HDhsvrjSWqhnLVXx40Vd3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773258808; c=relaxed/simple;
	bh=yL3TycTJXsCqPKAGWgsWC/cvzljhsXBJ8YKdz//PIZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=L6S0QYckEsWYIjGOobtVxbCbzZ8+bh8sRZmGnrjXO2QKwaNSA5vTcY4LY6AIH8JjNZxevFBGQBPbmhD3GVizl2+kRQZKAbhut/ZJCIYLxNruYy7TINShs3ZUwg3KVlTMUQocxOaz/UL6jm4PjKPlEVuUcYvMTOvsdLI6P3wll+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xo4bGm6O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xo4bGm6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773258804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kw/CChfMYazflyPqG/1L5aluivgViQKC8HGD+SI/7m8=;
	b=Xo4bGm6Oz79wRJ0Bv3ZalH4+WxElGikQHj3RfMxGK9utlrkQt0eM7+GYBfsSiQL1kERFLa
	7VbRwTklGvC/kYy7k8H8fsQVPBtmHHt2SinVseO+ksMZXAHNT8ODR4N2oqRZHnFG5mrTVA
	O3u1cKPjesP74IWcz3fIchB/dd02DPk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-547-tmXfS2JNPeCgd0fV1h0oOA-1; Wed,
 11 Mar 2026 15:53:17 -0400
X-MC-Unique: tmXfS2JNPeCgd0fV1h0oOA-1
X-Mimecast-MFC-AGG-ID: tmXfS2JNPeCgd0fV1h0oOA_1773258794
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1F0FF1956059;
	Wed, 11 Mar 2026 19:53:14 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.81.64])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 18B0E3002D0E;
	Wed, 11 Mar 2026 19:53:09 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org
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
Subject: [PATCH v8 2/7] rust: drm: gem: Add raw_dma_resv() function
Date: Wed, 11 Mar 2026 15:52:41 -0400
Message-ID: <20260311195246.2439593-3-lyude@redhat.com>
In-Reply-To: <20260311195246.2439593-1-lyude@redhat.com>
References: <20260311195246.2439593-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: KJUWC9ydOkUck0VIandn1vR32vf0ZVQD76q8Nekl-MI_1773258794
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

For retrieving a pointer to the struct dma_resv for a given GEM object. We
also introduce it in a new trait, BaseObjectPrivate, which we automatically
implement for all gem objects and don't expose to users outside of the
crate.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Janne Grunau <j@jananu.net>
---
 rust/kernel/drm/gem/mod.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 94e7c2a7293d0..bcec62155c02d 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -197,6 +197,18 @@ fn create_mmap_offset(&self) -> Result<u64> {
 
 impl<T: IntoGEMObject> BaseObject for T {}
 
+/// Crate-private base operations shared by all GEM object classes.
+#[expect(unused)]
+pub(crate) trait BaseObjectPrivate: IntoGEMObject {
+    /// Return a pointer to this object's dma_resv.
+    fn raw_dma_resv(&self) -> *mut bindings::dma_resv {
+        // SAFETY: `as_gem_obj()` always returns a valid pointer to the base DRM gem object
+        unsafe { (*self.as_raw()).resv }
+    }
+}
+
+impl<T: IntoGEMObject> BaseObjectPrivate for T {}
+
 /// A base GEM object.
 ///
 /// # Invariants
-- 
2.53.0

