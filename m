Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340DE2222AC
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Apr 2026 00:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775693831; cv=none; b=W5O17VBFUXqS9avQMZ/Maa1um/aRfR6wK5QbVBr/YBf+K/pkVVIaXi1KqoAhfxYhRm2UAU5R40DFfPWGjLqLg5aqDJlndySkFH/Q8FBgL7wmktkf//Zex41AU23gH8qa1SGlm6aI9ps551Hd91LFx58WchF48m54aIT5xi2GcRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775693831; c=relaxed/simple;
	bh=yZvlJ3nFaOryiBpVtZP7dWH2mPj7IGAOa/ruFR+z/k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=N1KYMZJCtMrTWWHPHcPfwVwD1EMnTisUhQyL2ky0mMGAseAvGhfZLWnM/IYakiZ24JNbrgRbQYfj0hn3ybqzZKx6XKzjDhfr18SDiSIJcECCVRxJpv7opov4q768fBAJ5Aal2eKuid93E/T4a+L5pWDoSGKiDROg6e2i1WQZ6kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=doeQLIlJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="doeQLIlJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775693829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v84/L+49ZA1uAG2yI2PO3Lh2LKOCLvufu7qPSjG196s=;
	b=doeQLIlJHCJFdMyKJp/p9qJKC5qZ+cLM7C7q8mavzp+ZN9e5zQMCaMO8zYFpNf7gpmO/2w
	h0hPKbEW3O5+5hu9j6n/TGl/OnasNoqpH9P0O9PyqDVrbZcNdODWpzsmTFlUu82AgmMyym
	p1BIrUwq1WJlgS18VGo8ssve+PUkxXo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-KkHRVFXjPYO75nkp0m6NmA-1; Wed,
 08 Apr 2026 20:16:17 -0400
X-MC-Unique: KkHRVFXjPYO75nkp0m6NmA-1
X-Mimecast-MFC-AGG-ID: KkHRVFXjPYO75nkp0m6NmA_1775693773
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1FA8219560B0;
	Thu,  9 Apr 2026 00:16:13 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.49])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5AC653000203;
	Thu,  9 Apr 2026 00:16:07 +0000 (UTC)
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
Subject: [PATCH v10 1/5] rust: drm: gem: s/device::Device/Device/ for shmem.rs
Date: Wed,  8 Apr 2026 20:12:47 -0400
Message-ID: <20260409001559.622026-2-lyude@redhat.com>
In-Reply-To: <20260409001559.622026-1-lyude@redhat.com>
References: <20260409001559.622026-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: _s3yTidYXIvjgOyChZHC9bM-ABpqzMRcHGfMU7zXD5w_1775693773
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

We're about to start explicitly mentioning kernel devices as well in this
file, so this makes it easier to differentiate the two by allowing us to
import `device` as `kernel::device`.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/shmem.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index d025fb0351954..c643f18b20838 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -12,10 +12,10 @@
 use crate::{
     container_of,
     drm::{
-        device,
         driver,
         gem,
         private::Sealed, //
+        Device,
     },
     error::to_result,
     prelude::*,
@@ -108,7 +108,7 @@ fn as_raw_shmem(&self) -> *mut bindings::drm_gem_shmem_object {
     ///
     /// Additional config options can be specified using `config`.
     pub fn new(
-        dev: &device::Device<T::Driver>,
+        dev: &Device<T::Driver>,
         size: usize,
         config: ObjectConfig<'_, T>,
         args: T::Args,
@@ -150,9 +150,9 @@ pub fn new(
     }
 
     /// Returns the `Device` that owns this GEM object.
-    pub fn dev(&self) -> &device::Device<T::Driver> {
+    pub fn dev(&self) -> &Device<T::Driver> {
         // SAFETY: `dev` will have been initialized in `Self::new()` by `drm_gem_shmem_init()`.
-        unsafe { device::Device::from_raw((*self.as_raw()).dev) }
+        unsafe { Device::from_raw((*self.as_raw()).dev) }
     }
 
     extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
-- 
2.53.0

