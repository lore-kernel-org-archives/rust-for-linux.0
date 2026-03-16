Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CCF372ECB
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 21:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773695847; cv=none; b=OSnD889KNWbzMSh6Q3SrA78g8NIt5OEAsY1zcUI2nr6oGtyvE9KkQ8ttKapaS++rFRjdsTRBdAwfyNgIqe0XbjIg7S6KaQMOzyZeG2rr/r1O5bEo/w10oFnq9gpuOGbg59voOM62bOOmkOVgs49ADld29+eJATqTMpBxDd6nxG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773695847; c=relaxed/simple;
	bh=oR+Gd4HXIUMKIiocjNfH+bDx/uKucau76EEwPmmgc2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ZnozCgyGHcpuMeWIHLyh9r4NlTg9uejRRwrVKyvAgrA8YKN81OuKMPk9OggSgEaA8rnWNIHU5jxt5b8dhC1Jbs61exB18mjYMKTgPDIfDLA1Md7Or6+SXk0QxD3sZx3HLUIfNRuhJWfqap8TsBIhUsydSmEdQGEZdOfjX4tOaC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XIp/qegj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XIp/qegj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773695843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7S/uR9ozwiVC4WmMtOdIUN9BDHxLQ9/UoGXCMpn4OAg=;
	b=XIp/qegjn+jcFvV10MXNH/XMhb+/CiSFBBN/ZD6XvE8oWHiL0xhnx/+M1x4LpfBxnVmK4g
	6BMrCdsj/wF2dzY9/o4j1ozb/ZQ9b3UA70UkRBrt93nOuy2oSr1a/uVZq31l5x55UUoFOr
	KJEQzPmuAW6cx5DD53SaDEszd4f4L9o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-DHCs_K8ZM7OC2TguFla4_g-1; Mon,
 16 Mar 2026 17:17:19 -0400
X-MC-Unique: DHCs_K8ZM7OC2TguFla4_g-1
X-Mimecast-MFC-AGG-ID: DHCs_K8ZM7OC2TguFla4_g_1773695835
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F9121956062;
	Mon, 16 Mar 2026 21:17:15 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D1D12180035F;
	Mon, 16 Mar 2026 21:17:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
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
Subject: [PATCH v9 6/7] rust: drm: gem: Introduce shmem::SGTable
Date: Mon, 16 Mar 2026 17:16:14 -0400
Message-ID: <20260316211646.650074-7-lyude@redhat.com>
In-Reply-To: <20260316211646.650074-1-lyude@redhat.com>
References: <20260316211646.650074-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 0sW4SyP10X_8Zqc56tTjZME1TVrV_qrB8-kIo87dWi4_1773695835
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Currently we expose the ability to retrieve an SGTable for an shmem gem
object using gem::shmem::Object::<T>::sg_table(). However, this only gives
us a borrowed reference. This being said - retrieving an SGTable is a
fallible operation, and as such it's reasonable that a driver may want to
hold onto an SGTable for longer then a reference would allow in order to
avoid having to deal with fallibility every time they want to access the
SGTable. One such driver with this usecase is the Asahi driver.

So to support this, let's introduce shmem::SGTable - which both holds a
pointer to the SGTable and a reference to its respective GEM object in
order to keep the GEM object alive for as long as the shmem::SGTable. The
type can be used identically to a normal SGTable.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Janne Grunau <j@jananu.net>

---
V3:
* Rename OwnedSGTable to shmem::SGTable. Since the current version of the
  SGTable abstractions now has a `Owned` and `Borrowed` variant, I think
  renaming this to shmem::SGTable makes things less confusing.
  We do however, keep the name of owned_sg_table() as-is.
V4:
* Clarify safety comments for SGTable to explain why the object is
  thread-safe.
* Rename from SGTableRef to SGTable

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/shmem.rs | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 6c77ace05d30a..3fab5d76c197b 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -198,6 +198,25 @@ pub fn sg_table(&self) -> Result<&scatterlist::SGTable> {
         // pointer to a scatterlist
         Ok(unsafe { scatterlist::SGTable::from_raw(sgt) })
     }
+
+    /// Creates (if necessary) and returns an owned reference to a scatter-gather table of DMA pages
+    /// for this object.
+    ///
+    /// This is the same as [`sg_table`](Self::sg_table), except that it instead returns an
+    /// [`shmem::SGTable`] which holds a reference to the associated gem object, instead of a
+    /// reference to an [`scatterlist::SGTable`].
+    ///
+    /// This will pin the object in memory.
+    ///
+    /// [`shmem::SGTable`]: SGTable
+    pub fn owned_sg_table(&self) -> Result<SGTable<T>> {
+        Ok(SGTable {
+            sgt: self.sg_table()?.into(),
+            // INVARIANT: We take an owned refcount to `self` here, ensuring that `sgt` remains
+            // valid for as long as this `SGTable`.
+            _owner: self.into(),
+        })
+    }
 }
 
 impl<T: DriverObject> Deref for Object<T> {
@@ -248,3 +267,34 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
         dumb_map_offset: None,
     };
 }
+
+/// An owned reference to a scatter-gather table of DMA address spans for a GEM shmem object.
+///
+/// This object holds an owned reference to the underlying GEM shmem object, ensuring that the
+/// [`scatterlist::SGTable`] referenced by this type remains valid for the lifetime of this object.
+///
+/// # Invariants
+///
+/// - `sgt` is kept alive by `_owner`, ensuring it remains valid for as long as `Self`.
+/// - `sgt` corresponds to the owned object in `_owner`.
+/// - This object is only exposed in situations where we know the underlying `SGTable` will not be
+///   modified for the lifetime of this object. Thus, it is safe to send/access this type across
+///   threads.
+pub struct SGTable<T: DriverObject> {
+    sgt: NonNull<scatterlist::SGTable>,
+    _owner: ARef<Object<T>>,
+}
+
+// SAFETY: This object is thread-safe via our type invariants.
+unsafe impl<T: DriverObject> Send for SGTable<T> {}
+// SAFETY: This object is thread-safe via our type invariants.
+unsafe impl<T: DriverObject> Sync for SGTable<T> {}
+
+impl<T: DriverObject> Deref for SGTable<T> {
+    type Target = scatterlist::SGTable;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Creating an immutable reference to this is safe via our type invariants.
+        unsafe { self.sgt.as_ref() }
+    }
+}
-- 
2.53.0

