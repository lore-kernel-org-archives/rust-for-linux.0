Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D589A3A63F9
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 23:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776814978; cv=none; b=fcGR9vXvJmZYi0zK8U7nG2B78l1M3LD5IJhwUwZgtffEqrhVf9r8ib7jtvp6TBDBWfHaTe2iaLBVyXrGdwnzG3B2VVMOMnkHokz1uNkP2MGKsuyOJz5iJfanFRYVCyMBSp14eRViTccqAzJY2UY7HqOIDZjvbKS0+RatmB3Lz0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776814978; c=relaxed/simple;
	bh=cHbwv+JJ2FaLMasgp7iSMgD+2it0nY3kq0U9gePp7yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ZQRhZoQdXU8+r80u21TB3SQ7NbWfDQOJmncxFB4hgpr5QuPdI3f7wQopWckb2Uy4Pvq5mP1qWvj3EJFfULk1inXfKik1DW4t4YAIPmZUHuAIjiHuKAfpbFnf2qjU+01bSAUvZiQWe2bmALpDC4S9SHw50bLwXVNEk3W/e2M1Kqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gERfEgE9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gERfEgE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776814976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WX8GF8QjZYpTHNcCIWqfIkVacO9JeuGdxARtANDN6u8=;
	b=gERfEgE96GubCzvllMs2PvXKZn+j7JfAk+7ZhxZuWrWJMGNH7B/OBXUUYfWsqDgFsmtzn9
	SXkzJs5Ted/5eOltJg7YKZDuqA91CaSLnrcbGWLpmIku9HdzHgwMKQ1KSLW9oiviBPb6If
	+yWpvzVkb9RhOu+n1Ikfk6DRBzjEzco=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-97-b8tNv6ojN6uyujB6V__tuw-1; Tue,
 21 Apr 2026 19:42:52 -0400
X-MC-Unique: b8tNv6ojN6uyujB6V__tuw-1
X-Mimecast-MFC-AGG-ID: b8tNv6ojN6uyujB6V__tuw_1776814969
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C61061956048;
	Tue, 21 Apr 2026 23:42:48 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.14])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 19A041800660;
	Tue, 21 Apr 2026 23:42:44 +0000 (UTC)
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
Subject: [PATCH v11 1/5] rust: drm: gem: s/device::Device/Device/ for shmem.rs
Date: Tue, 21 Apr 2026 19:40:37 -0400
Message-ID: <20260421234234.638503-2-lyude@redhat.com>
In-Reply-To: <20260421234234.638503-1-lyude@redhat.com>
References: <20260421234234.638503-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: X9G55Xclm38jzCqx8-r6BTNFPh9aM2W6qkB4oYo4X5o_1776814969
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

We're about to start explicitly mentioning kernel devices as well in this
file, so this makes it easier to differentiate the two by allowing us to
import `device` as `kernel::device`.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

---
V11:
* Fix location of //

 rust/kernel/drm/gem/shmem.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index d025fb0351954..11749c36e8695 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -12,10 +12,10 @@
 use crate::{
     container_of,
     drm::{
-        device,
         driver,
         gem,
-        private::Sealed, //
+        private::Sealed,
+        Device, //
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

