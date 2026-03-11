Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9B238947C
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 19:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773258825; cv=none; b=Fvq4rfGi5BXTKu+9+b5AGAwzkNCiOVyv3eKMduzW4xz0Yvb55hCGY0XNLCJWXUGU76nQ1aHELX6z3xPEu0Q+wEYIbHXmmsu4TJoP0FGU+cpv3G5O9LBm698mBnLEQ4FgMvyE9UhK25+g2VmHgJ0pG1KAPdidSw7cEUq+eMQKIlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773258825; c=relaxed/simple;
	bh=FGH1a41Jcyjz1EqBKRdylnOVMtU7odWvFrDJTSk6lPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=gtzYAv2gfPbnzIXL/gkjgqubRCcZTLRudbLe2nl9GK68FSwcYyzt/FcLM0N8024UwQx/anfrUgUc46R4te4jzlG8YWVoU7JFu2hJnUVssx5fqSFt0ZRyaxJtRJll1FJH0kGcJ8gvFXb6NQB9/rHZYbdV8ww5WkNI4ious8DYlN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F6E/eH8L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F6E/eH8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773258820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FG9FxoLtllYIPasCAeUbW5zSc38stvmaMt9mwhoaTHs=;
	b=F6E/eH8L+/ai53d/hyGFKtpkCfc8Te6xEIGekbG6blIuAXW0XC+Z6hJtRdKzyl5RPnDc08
	n1jy8GzZyx1oKN+leaPDs5bCn7fBfSpWKlLVKsA4DiFGX2V9lfabnj7zHlxOkSAY944FHx
	3EdRZfaeM5luHHe256OwY7yMwHUh60g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-_eDyQWfEOnSYgQoXbyRNAg-1; Wed,
 11 Mar 2026 15:53:35 -0400
X-MC-Unique: _eDyQWfEOnSYgQoXbyRNAg-1
X-Mimecast-MFC-AGG-ID: _eDyQWfEOnSYgQoXbyRNAg_1773258812
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0DB3B19560A7;
	Wed, 11 Mar 2026 19:53:32 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.81.64])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1856830002D2;
	Wed, 11 Mar 2026 19:53:27 +0000 (UTC)
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
Subject: [PATCH v8 6/7] rust: drm: gem: Introduce shmem::SGTable
Date: Wed, 11 Mar 2026 15:52:45 -0400
Message-ID: <20260311195246.2439593-7-lyude@redhat.com>
In-Reply-To: <20260311195246.2439593-1-lyude@redhat.com>
References: <20260311195246.2439593-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: YUw6JtaXpSUUZQoYPL8ktDz3bOsqlhMYRKlV0PGPzpQ_1773258812
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

