Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C020137C110
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 19:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773258804; cv=none; b=a9U1471T7/dLdQBqxzkBO2bkrq5RoItg3sZiH718cYuDn2NN5clBF8OuDwzkwfWe9u9aRYfA2hxE+eDOoq/wLl/PFYyvnIiqmQdVAlUlrTggt/d3ElHVOqo+AVBHJhsc4W8arCuCFn+qNiQJaR6fiZcM7FACwmzYeouKumEhvu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773258804; c=relaxed/simple;
	bh=3rRLpLHEcLcLjHD1EAL4ZgUuI7Xca94iAdD2CyWO18s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=cYncEs4ugfnsnd3rTBbGoGjKL0lCcwMsF346GhYolTkUDc0etR1GQM2W72tFps04NvpiPxnbuhtw5GvAdgc0/ChvFDZ5rwA29OJWwDveq1OvffPk+YT4fWdUVDawRwb6LTlht4vnoCXFJIRrnZ+YhMDu3ZF2mjapxe9xA30505k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fI7Ce0+x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fI7Ce0+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773258799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unREvLOUjwRDGBct59IFXrTD0Zg4yOdfOEeqAJflr4Y=;
	b=fI7Ce0+xwa+6G84D3y99Kslpa1cCwlmb6+uoNUF71r4ij9NiQnxjhbxVFlVJpquY4cZE9x
	p9pQpJQEHrC8sOyrRkjo3D4BFwi/AonZDHcnL63xfuzdmdRgHESXDtitsPkQs5H6U2x50F
	/e+FwzURPHS8yB0LUp0X9WFMRY9wo34=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-298-CSGDEoH3PuiYgnepiMnhew-1; Wed,
 11 Mar 2026 15:53:14 -0400
X-MC-Unique: CSGDEoH3PuiYgnepiMnhew-1
X-Mimecast-MFC-AGG-ID: CSGDEoH3PuiYgnepiMnhew_1773258790
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D05C2195605C;
	Wed, 11 Mar 2026 19:53:09 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.81.64])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3011E30002D2;
	Wed, 11 Mar 2026 19:53:02 +0000 (UTC)
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
Subject: [PATCH v8 1/7] rust: drm: Add gem::impl_aref_for_gem_obj!
Date: Wed, 11 Mar 2026 15:52:40 -0400
Message-ID: <20260311195246.2439593-2-lyude@redhat.com>
In-Reply-To: <20260311195246.2439593-1-lyude@redhat.com>
References: <20260311195246.2439593-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: OmX_QQzOmhua_5qD-WlCSqqpV1UOqjWyFrIpjUzQl1A_1773258790
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

In the future we're going to be introducing more GEM object types in rust
then just gem::Object<T>. Since all types of GEM objects have refcounting,
let's introduce a macro that we can use in the gem crate in order to copy
this boilerplate implementation for each type: impl_aref_for_gem_obj!().

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Janne Grunau <j@jananu.net>

---
V5:
* Move .as_raw() call to `let obj` in dec_ref, to ensure that the reference
  to object is not live by the time that we call drm_gem_object_put().
* Add missing #[macro_export] annotation
V6:
* Add missing IntoGEMObject trait bound

 rust/kernel/drm/gem/mod.rs | 51 +++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index d49a9ba026356..94e7c2a7293d0 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -15,6 +15,41 @@
 };
 use core::{ops::Deref, ptr::NonNull};
 
+/// A macro for implementing [`AlwaysRefCounted`] for any GEM object type.
+///
+/// Since all GEM objects use the same refcounting scheme.
+#[macro_export]
+macro_rules! impl_aref_for_gem_obj {
+    (
+        impl $( <$( $tparam_id:ident ),+> )? for $type:ty
+        $(
+            where
+                $( $bind_param:path : $bind_trait:path ),+
+        )?
+    ) => {
+        // SAFETY: All gem objects are refcounted
+        unsafe impl $( <$( $tparam_id ),+> )? $crate::types::AlwaysRefCounted for $type
+        where
+            Self: IntoGEMObject,
+            $( $( $bind_param : $bind_trait ),+ )?
+        {
+            fn inc_ref(&self) {
+                // SAFETY: The existence of a shared reference guarantees that the refcount is
+                // non-zero.
+                unsafe { bindings::drm_gem_object_get(self.as_raw()) };
+            }
+
+            unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
+                // SAFETY: `obj` is a valid pointer to an `Object<T>`.
+                let obj = unsafe { obj.as_ref() }.as_raw();
+
+                // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+                unsafe { bindings::drm_gem_object_put(obj) };
+            }
+        }
+    };
+}
+
 /// A type alias for retrieving a [`Driver`]s [`DriverFile`] implementation from its
 /// [`DriverObject`] implementation.
 ///
@@ -252,21 +287,7 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
     }
 }
 
-// SAFETY: Instances of `Object<T>` are always reference-counted.
-unsafe impl<T: DriverObject> crate::sync::aref::AlwaysRefCounted for Object<T> {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
-    }
-
-    unsafe fn dec_ref(obj: NonNull<Self>) {
-        // SAFETY: `obj` is a valid pointer to an `Object<T>`.
-        let obj = unsafe { obj.as_ref() };
-
-        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
-        unsafe { bindings::drm_gem_object_put(obj.as_raw()) }
-    }
-}
+impl_aref_for_gem_obj!(impl<T> for Object<T> where T: DriverObject);
 
 impl<T: DriverObject> super::private::Sealed for Object<T> {}
 
-- 
2.53.0

