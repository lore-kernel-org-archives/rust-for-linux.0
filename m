Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA84C47042C
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762177; cv=none; b=qN5X7hJTScYhSdDX8+2Zszql0adXnTvnTuT8JTxL45xN5JxygJMv6etIiqxnpV1ebDV8I941hrMWmCg3ujkru4A/S7FNf3xnED6tcLYeCGCWLH43v/gNEnX0GUa6t31mTF9YBz1p3DcMaELKQSEVHrOhCU0SqbCn8w3yVgNAzWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762177; c=relaxed/simple;
	bh=Vs381P+yDLBEfeWg9LKiEiD4QqJMYspL8zkTd4AUo3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cY7XboCtvpjXfxQPB/Ek0KNQ8/e8b/46jEI/QM40PsK+x+yre8OtD4htecGbMU+Au68DMOS7ZY+CRN8WMJfFNpoRkmKOtBmhMgHeateSbZ2Seu5c8j+iDuBSlwTdGzkD8+vVH8C06qiKiyMV7TBJRpA5sJ8vCWWdf9K0cDgkJPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=06haMXJ8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="06haMXJ8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so394045e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762163; x=1788366963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3EL6Jw26lW1z9BDf8CloPoJWlkDCbIL/77zIh+v+UO4=;
        b=06haMXJ8gW4Z9s9lZ165sObzthnmwgaDG4cJTOQ29Ybpu44+eMFBbGMSds4ZD25yfF
         7bv3Xh+E4bnByWP5UT+3M9QBTaX5GjHvudjhSWy9hhQ/dpb7G6wKKSlhHUMFLQKDjRMc
         7I5KBEVRIDI3F/6I7xcria/OLykGtisLQO8zbmNAH9MM+sB6xeuM26lSKygJdbe6JdhG
         idvrGFhlUmOVVsAAX/lVeqihcHnZNcTv3ipy4WEfcRphCNHTxabCLnB3MuXzcsRix7TJ
         sWLESginLUNNVaRhXmp2qT0QyHNvxSjGVk26L5lOsHNBiPxsQDVemY4gZlJSuJPTqN6W
         KMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762163; x=1788366963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3EL6Jw26lW1z9BDf8CloPoJWlkDCbIL/77zIh+v+UO4=;
        b=nodIxEIOdh6cdqC3bJuqrgcHvN6gwA3jGEbFExTiIpFlF0+gUl4Rb+DcmV1NzFWP3J
         eLyUkkLozRIjp105X5v/NWNinvTqhJ1S722ZQGhfR4Z9sXXZG5f39drmV/t1tFH0qVDy
         Ck5ampTNR75J9u3w2MQZ4travRGQm+fWJOn43hx0ELaYn2HInwW5DgWQAVkiRcEetP6y
         3+da5K+vSYtoceT1tskaRSuiIrfKrqwCV4FWGDYzm0IB/+gUgVNAT+Ys/MH3ydX4qvC0
         +eiE6A2JSMoeH6lzxiEEriS9MJ2cWZgGJsYbAeZX0a8IkR2Scok0m2RkcqVvvS5EpxjF
         YqeA==
X-Forwarded-Encrypted: i=1; AHgh+Rq28PA+UxdDJDdfl3T+Kx9xMgkFlw+FZNrsmrWvy0692m539vKxqicZw7gVC/G+IhgmHr4wqj91ElH2btIWfA==@vger.kernel.org
X-Gm-Message-State: AFuF++myKRXMHZ+xW1czztEXkQgTYR7dpUF0LN9K8HjBy58EFI0ylRFE
	LyyJcroqDVdo5N1f377hlyGKRA7WXMEwtHkDllTVY9t/x+8mN9mwK7KHMRvAY04hBw==
X-Gm-Gg: AR+sD13h9QCpKwXG1XAYuZkqGiBYfJODIpX5MTPBkdW7vwJtufJZARX8kVs7SzC44LD
	ksXsS1KSsADNRS5Tso77DZEg6FMug5kwCOrchCuM2fqqIHzu4JVXH33K5oNyF5Ff4Kor8L4HcB2
	ZVa7IC20tqDzFaEq2vLU4if73f4upVWwX/hipCG48MLr6CmW0BPd4jeYGSCXS5njD2o/kg+Urii
	0Gvq9xCXjZQX6A7141bLbNFP8njOOFPwDnRv3vI3rEvkaqAOkytY0Pk08RnOIlOqu+l8R0MfxPy
	ZW4qDpEMAGih5Y4qMr605hZCYuuC/+hYN4VG47FWbonc0OL5swW6tzdZ1+k7jHylTDsoZqnLFgJ
	d0B61QOdQKYoZDA4gJpBBkzlZEtGXS3tphKJB6/Cxl1geSKPEKMgoFhl2SwO3sZJ2CMuNP7iYq+
	icGiQg0NUfh/DQXwMVFzR4rqJPUCh1X/lPaHDOSSfTO2N5Sb7M04tAeRCZaSpyZ7IB57c+xk/NH
	4Im3JVlLfue5dC0eQePWUbpDTkuNOoAKiy3
X-Received: by 2002:a05:600c:800f:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49b0dea9491mr4564165e9.1.1787762162730;
        Wed, 26 Aug 2026 09:36:02 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:01 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/23] rust: drm: add a safe constructor for owned registration data
Date: Wed, 26 Aug 2026 17:31:45 +0100
Message-ID: <20260826163359.4998-15-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A DRM registration whose associated data is 'static cannot outlive any
references held by that data. Add a safe constructor for this common
case so drivers do not have to promise manually that their registration
will never be forgotten.

Keep the existing unsafe constructor for registration data which
genuinely borrows from the bus binding.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/driver.rs | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 356be329a2b6..2e7987a71a7a 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -169,7 +169,8 @@ pub struct Registration<'a, T: Driver> {
 }
 
 impl<'a, T: Driver> Registration<'a, T> {
-    /// Register a new [`UnregisteredDevice`](drm::UnregisteredDevice) with userspace.
+    /// Registers a new [`UnregisteredDevice`](drm::UnregisteredDevice) with borrowed
+    /// registration data.
     ///
     /// # Safety
     ///
@@ -177,7 +178,7 @@ impl<'a, T: Driver> Registration<'a, T> {
     /// [`Drop`] implementation from running, since the registration data may contain borrowed
     /// references that become invalid after `'a` ends.
     pub unsafe fn new<E>(
-        dev: &'a device::Device<device::Bound>,
+        dev: &device::Device<device::Bound>,
         drm: drm::UnregisteredDevice<T>,
         reg_data: impl PinInit<T::RegistrationData<'a>, E>,
         flags: usize,
@@ -243,6 +244,29 @@ pub fn device(&self) -> &drm::Device<T> {
     }
 }
 
+impl<T: Driver> Registration<'static, T> {
+    /// Registers a new [`UnregisteredDevice`](drm::UnregisteredDevice) with owned registration
+    /// data.
+    ///
+    /// Unlike [`Registration::new`], this constructor is safe because its registration
+    /// data cannot contain non-static references. Forgetting the returned registration can leak
+    /// the DRM device and its parent reference, but cannot leave a live registration referring to
+    /// expired data.
+    pub fn new_static<E>(
+        dev: &device::Device<device::Bound>,
+        drm: drm::UnregisteredDevice<T>,
+        reg_data: impl PinInit<T::RegistrationData<'static>, E>,
+        flags: usize,
+    ) -> Result<Self>
+    where
+        Error: From<E>,
+    {
+        // SAFETY: `RegistrationData<'static>` cannot borrow data that expires while a forgotten
+        // registration remains accessible.
+        unsafe { Self::new(dev, drm, reg_data, flags) }
+    }
+}
+
 // SAFETY: `Registration` doesn't offer any methods or access to fields when shared between
 // threads, hence it's safe to share it.
 unsafe impl<T: Driver> Sync for Registration<'_, T> {}
