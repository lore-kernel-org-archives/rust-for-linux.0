Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1CF16FF28
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 23:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718753635; cv=none; b=LmKmgVmsq45lMMr15gMAFSIYoPpha0eR55po1uTt8tEvQ2lMNkZiTMMCi3pK15GVcBqu0abmaQaCbiQb/cbu2Czhzu0ET/IvKd6SQuFWobK3fBkI0fY+XAjfkY7d2rDtzwGUhLA33Zi7O93UQsM/wTw4FN4hUymXwUVQQA0QaOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718753635; c=relaxed/simple;
	bh=jkaUxjeSkyYtLzO9rwb7+OsSpLjhaS698oTqC22JboA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V4igjUstkpirzoV0AqY6b5nrEMTu+7xQQOcMbZonDTPdqzSYmZtnqnS51B0ZDHR4ZSfKUoe0b5DevwCYKmiMgk5PuHk0PaGx4aMrI4XSYBpy2orOMAyK3TxXJrLFWwGzBF8C97OVgYp8QdckwQThu2Hs79dKA2l4oOwXOBDKlRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=InI+7fkg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="InI+7fkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718753633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NqSGu/f2yD5TNl1pw8ZmNP+UDvwFAhTgkcVL/JJamjQ=;
	b=InI+7fkgfMZFmEE2zcj3zT1GReBg2Vv311Qa5bSO+3x+Jot0LtjdImhWYCe/tP/YQw+y8c
	+M4Z+Xav7YYU3LXwNjeIopzoBrOalA5Z06mCXSfV27I+ColZaNpyfn3CANTOaa+HnCYg5A
	u5Wy/E3ahdUTPkQijDzLF83BrPIWTgI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-jUQa8P04NwighLuO6qojcw-1; Tue, 18 Jun 2024 19:33:51 -0400
X-MC-Unique: jUQa8P04NwighLuO6qojcw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4210d151c5bso44327215e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 16:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718753631; x=1719358431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqSGu/f2yD5TNl1pw8ZmNP+UDvwFAhTgkcVL/JJamjQ=;
        b=hxnUkCuXMjYWhNFiuzY0mUTOvQe1CLeLrZLSbAL53fMjm24IMgMb8E8kPJEiTh5zt1
         n+1fkrxI6+pohpfzXw4VZ0yqNeP9302jaPM3L+2TpOi8QbpxhDccJMv1cYk9yKHcEDuB
         mWP89Fpm/LvRICHCoxeciJ7n0L+AVOdjO0lNTyv+YxeQPOQKaRB/K6aLqQfI4UM/fmJF
         WAbuoKjbw19gukQTctdCfUyotsk7QMXKrQtlvysG9dmHh73zfgnj3KQOqtyoBOUCdI6n
         zCI1exhEIOTvi7eyxoUsUpqJ96hRunPFM9BbpkGFJGs2yMQYGLMRJPKBMsf0znBWnICK
         egyA==
X-Gm-Message-State: AOJu0YwDGXdMjmg25+ApEg2IRFon1D4qPVFB0uCv2JLAe1K1RLPgi7hG
	hYIzQuXTAv+DlsV1bdbJeFDqlmZKjct09VX616yXZchkbscoEW/mDkSs3zooaOTO4DjM+MeHOSI
	+vvITrZiNBnKScZOn0HsPf1vHWtpOW9pO8PBwiUJ0b476lU4Ge5hBI9kngAGKocYo
X-Received: by 2002:a05:600c:430c:b0:422:760c:e8b9 with SMTP id 5b1f17b1804b1-4247529bc39mr5321845e9.35.1718753630736;
        Tue, 18 Jun 2024 16:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKcfqrCVLwgzl14jHwarSezwQ95FwnJewLnM1dqT+dP6InaU41TBqdzpeoc4as3zeDlqe6aA==
X-Received: by 2002:a05:600c:430c:b0:422:760c:e8b9 with SMTP id 5b1f17b1804b1-4247529bc39mr5321695e9.35.1718753630483;
        Tue, 18 Jun 2024 16:33:50 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4246bddc59bsm68246815e9.5.2024.06.18.16.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 16:33:50 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	lina@asahilina.net,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 5/8] rust: drm: add DRM driver registration
Date: Wed, 19 Jun 2024 01:31:41 +0200
Message-ID: <20240618233324.14217-6-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
References: <20240618233324.14217-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Implement the DRM driver `Registration`.

The `Registration` structure is responsible to register and unregister a
DRM driver. It makes use of the `Devres` container in order to allow the
`Registration` to be owned by devres, such that it is automatically
dropped (and the DRM driver unregistered) once the parent device is
unbound.

Co-developed-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/drm/drv.rs | 57 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
index cd594a32f9e4..ebb79a8c90ee 100644
--- a/rust/kernel/drm/drv.rs
+++ b/rust/kernel/drm/drv.rs
@@ -4,7 +4,16 @@
 //!
 //! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/drm_drv.h)
 
-use crate::{bindings, drm, private::Sealed, str::CStr, types::ForeignOwnable};
+use crate::{
+    alloc::flags::*,
+    bindings,
+    devres::Devres,
+    drm,
+    error::{Error, Result},
+    private::Sealed,
+    str::CStr,
+    types::{ARef, ForeignOwnable},
+};
 use macros::vtable;
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
@@ -139,3 +148,49 @@ pub trait Driver {
     /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
     const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
 }
+
+/// The registration type of a `drm::device::Device`.
+///
+/// Once the `Registration` structure is dropped, the device is unregistered.
+pub struct Registration<T: Driver>(ARef<drm::device::Device<T>>);
+
+impl<T: Driver> Registration<T> {
+    /// Creates a new [`Registration`] and registers it.
+    pub fn new(drm: ARef<drm::device::Device<T>>, flags: usize) -> Result<Self> {
+        // SAFETY: Safe by the invariants of `drm::device::Device`.
+        let ret = unsafe { bindings::drm_dev_register(drm.as_raw(), flags as u64) };
+        if ret < 0 {
+            return Err(Error::from_errno(ret));
+        }
+
+        Ok(Self(drm))
+    }
+
+    /// Same as [`Registration::new`}, but transfers ownership of the [`Registration`] to `Devres`.
+    pub fn new_foreign_owned(drm: ARef<drm::device::Device<T>>, flags: usize) -> Result {
+        let reg = Registration::<T>::new(drm.clone(), flags)?;
+
+        Devres::new_foreign_owned(drm.as_ref(), reg, GFP_KERNEL)
+    }
+
+    /// Returns a reference to the `Device` instance for this registration.
+    pub fn device(&self) -> &drm::device::Device<T> {
+        &self.0
+    }
+}
+
+// SAFETY: `Registration` doesn't offer any methods or access to fields when shared between
+// threads, hence it's safe to share it.
+unsafe impl<T: Driver> Sync for Registration<T> {}
+
+// SAFETY: Registration with and unregistration from the DRM subsystem can happen from any thread.
+unsafe impl<T: Driver> Send for Registration<T> {}
+
+impl<T: Driver> Drop for Registration<T> {
+    /// Removes the registration from the kernel if it has completed successfully before.
+    fn drop(&mut self) {
+        // SAFETY: Safe by the invariant of `ARef<drm::device::Device<T>>`. The existance of this
+        // `Registration` also guarantees the this `drm::device::Device` is actually registered.
+        unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
+    }
+}
-- 
2.45.1

