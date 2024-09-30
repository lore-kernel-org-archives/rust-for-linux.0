Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AA71A3045
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739650; cv=none; b=f1j70nDRKU3E8IizNdlAABxIgoN+IYqa6Nf/Uf2FHpCeONEO2beWfdpblNbseLe4sjpfSSmAzGHe2DtPkyL2JGWIqhXDI7sz5sTpsICnSFMdu/9m60UTGjL7VGdZ6KmoSopXrkq6gShKTMHWxevb8OG1eCI4TQoGODDtAJTOn50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739650; c=relaxed/simple;
	bh=8Gy2EvSvWd770balBZF1QEDDsL9x1cn4XZHt/qO0WII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPhhXq/hDCmf2H4t/WOw/g/K0lOogwu1fIu0UtKhOyFR1G5f7PjbrJHPbTN47s2+dgUniJqMp5+cpb/o8gy21+4pU8rVP9RLTYrE/NLqQJY4mulNTDUwruuKMFeoeE9WG3Nlgyz9e435AM4cSXbgL6ZT5PGZBaTtt9fCwrRnVgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F0GOGQ29; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F0GOGQ29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727739648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r65mS9fGP6QHa8ZJthkFLot5TCFWUe3W7tgNCeGtS+Y=;
	b=F0GOGQ29xIbjmYXouXhz8f95JeEkrPPplbRgue4Hj97qK+xzZFvfdSSu0ZufwIGlxVD+FH
	xyBTWYWopdOQjcQghIoMV8yeXUrbTeewZEtN2foqB3U/QlKXHL0t8QnqbCXoFHLcGjXukz
	1hP1OhD0ljDMiP/7Ze42Ywm8ETCIoos=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-375-YGuzUkxzNLKTlLsoR2qN7w-1; Mon,
 30 Sep 2024 19:40:47 -0400
X-MC-Unique: YGuzUkxzNLKTlLsoR2qN7w-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC143196A433;
	Mon, 30 Sep 2024 23:40:44 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C03833003DEC;
	Mon, 30 Sep 2024 23:40:40 +0000 (UTC)
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
	linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 26/35] WIP: rust: drm/kms: Add RawPlaneState::atomic_helper_check()
Date: Mon, 30 Sep 2024 19:10:09 -0400
Message-ID: <20240930233257.1189730-27-lyude@redhat.com>
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

Add a binding for drm_atomic_helper_check_plane_state(). Since we want to
make sure that the user is passing in the new state for a Crtc instead of
an old state, we explicitly ask for a reference to a BorrowedCrtcState.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

TODO:
* Add support for scaling options

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/plane.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 4d16d53179fca..cd5167e6441f1 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -496,6 +496,31 @@ fn crtc<'a, 'b: 'a>(&'a self) -> Option<&'b OpaqueCrtc<<Self::Plane as ModeObjec
         // SAFETY: This cast is guaranteed safe by `OpaqueCrtc`s invariants.
         NonNull::new(self.as_raw().crtc).map(|c| unsafe { OpaqueCrtc::from_raw(c.as_ptr()) })
     }
+
+    /// Run the atomic check helper for this plane and the given CRTC state
+    fn atomic_helper_check<S>(
+        &mut self,
+        crtc_state: &BorrowedCrtcState<'_, S>,
+        can_position: bool,
+        can_update_disabled: bool
+    ) -> Result
+    where
+        S: FromRawCrtcState,
+        S::Crtc: AsRawCrtc<Driver = <Self::Plane as ModeObject>::Driver>
+    {
+        // SAFETY: We're passing the mutable reference from `self.as_raw_mut()` directly to DRM,
+        // which is safe.
+        to_result(unsafe {
+            bindings::drm_atomic_helper_check_plane_state(
+                self.as_raw_mut(),
+                crtc_state.as_raw(),
+                bindings::DRM_PLANE_NO_SCALING as _, // TODO: add parameters for scaling
+                bindings::DRM_PLANE_NO_SCALING as _,
+                can_position,
+                can_update_disabled
+            )
+        })
+    }
 }
 impl<T: AsRawPlaneState + ?Sized> RawPlaneState for T {}
 
-- 
2.46.1

