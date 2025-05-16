Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFC327584E
	for <rust-for-linux@vger.kernel.org>; Fri, 16 May 2025 17:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747415461; cv=none; b=mXg1bpHnHpMjhyfqOFtXryWZXYuX2qQ291yol4waJZpxeuooKF1wKO1/ZMh7GYFhKmnOupf5zQ2zmy0LccHGqKf94zTjbTbiAeCY5F5RPTAP2m5gX8B0dqts9hywrbdBr86Dezn51KIl8DXca0zPDc3YtKY0Hw513QE3QtQLkLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747415461; c=relaxed/simple;
	bh=GsSp7CFVeu8zzsF3uZLc5tYEaNZFpTnOe6qGcvHvQR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJc7DpHtwMGDIGxNPzRwJDBgcTPTLmr06tM0gJ4yCXOzQJBCbDc4m4kj3PiuqXJT2llKAtOpCaTqXUETjDAAcqd0w7pnB0fq5f3h+662nPKb8BS0dmMRasKhb33QiGlM/lCOr4StanFE1RqHF3dqqXsQ7q5keMRo22iwiwBTmAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y5uNfAji; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y5uNfAji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747415458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsCGIYqEtmWNiDyyK2E4AEh2cY6xEg1Ay56+xO7ycmE=;
	b=Y5uNfAji+64dGPC75r8ec53XgZHF2xgCfwbIAuBeEHwtIHMP1AUnTLytlf9LugDFpfAI5I
	ZG0ImPlQDopeYLESic0Kg3zbXwgHn5AB8VtMGfUtEGDaDHjKtWhj7sK44akaPmqbOnVlYa
	A/1dkvwLhoCoBSfH+dsDGLqIf1GqoY4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-275-KNAcHhlNOQi2VTioV2gkmg-1; Fri,
 16 May 2025 13:10:55 -0400
X-MC-Unique: KNAcHhlNOQi2VTioV2gkmg-1
X-Mimecast-MFC-AGG-ID: KNAcHhlNOQi2VTioV2gkmg_1747415453
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1130195608B;
	Fri, 16 May 2025 17:10:52 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.82.40])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9327419560AE;
	Fri, 16 May 2025 17:10:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Asahi Lina <lina@asahilina.net>
Subject: [PATCH v2 2/4] rust: drm: gem: Add DriverObject type alias
Date: Fri, 16 May 2025 13:09:17 -0400
Message-ID: <20250516171030.776924-3-lyude@redhat.com>
In-Reply-To: <20250516171030.776924-1-lyude@redhat.com>
References: <20250516171030.776924-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Now that we've cleaned up the generics for gem objects a bit, we're still
left with a bit of generic soup around referring to the Object
implementation for a given driver. Let's clean this up a bit by re-using
the DriverObject identifier we just freed up and turning it into a type
alias for referring to a driver's gem object implementation.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index f0455cc2aff2d..c17b36948bae3 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -14,6 +14,9 @@
 };
 use core::{mem, ops::Deref, ptr::NonNull};
 
+/// A type alias for the Object type in use by a [`drm::Driver`].
+pub type DriverObject<T> = <<T as BaseDriverObject>::Driver as drm::Driver>::Object;
+
 /// GEM object functions, which must be implemented by drivers.
 pub trait BaseDriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
@@ -24,18 +27,14 @@ pub trait BaseDriverObject: Sync + Send + Sized {
 
     /// Open a new handle to an existing object, associated with a File.
     fn open(
-        _obj: &<Self::Driver as drm::Driver>::Object,
+        _obj: &DriverObject<Self>,
         _file: &drm::File<<Self::Driver as drm::Driver>::File>,
     ) -> Result {
         Ok(())
     }
 
     /// Close a handle to an existing object, associated with a File.
-    fn close(
-        _obj: &<Self::Driver as drm::Driver>::Object,
-        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
-    ) {
-    }
+    fn close(_obj: &DriverObject<Self>, _file: &drm::File<<Self::Driver as drm::Driver>::File>) {}
 }
 
 /// Trait that represents a GEM object subtype
@@ -82,7 +81,7 @@ extern "C" fn open_callback<T: BaseDriverObject>(
     let file = unsafe { drm::File::<<T::Driver as drm::Driver>::File>::as_ref(raw_file) };
     // SAFETY: `open_callback` is specified in the AllocOps structure for `DriverObject<T>`,
     // ensuring that `raw_obj` is contained within a `DriverObject<T>`
-    let obj = unsafe { <<T::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj) };
+    let obj = unsafe { DriverObject::<T>::as_ref(raw_obj) };
 
     match T::open(obj, file) {
         Err(e) => e.to_errno(),
@@ -99,7 +98,7 @@ extern "C" fn close_callback<T: BaseDriverObject>(
 
     // SAFETY: `close_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
     // that `raw_obj` is indeed contained within a `Object<T>`.
-    let obj = unsafe { <<T::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj) };
+    let obj = unsafe { DriverObject::<T>::as_ref(raw_obj) };
 
     T::close(obj, file);
 }
-- 
2.49.0

