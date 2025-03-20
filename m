Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766D01DE2CE
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436538; cv=none; b=a6klYyI6R6yq3KuplI8P8O7UtLYnYdydP6VdMhKmtNg2C9oQyPiDLl4ciF9uMEk2FOv7lNYBApMTzTdogiFIoAheg8iwL1JG5KgTqSiS7GzgsnCkFEVfs/p6viKUOFDMZzLxUfHnh7PclnH/S+t8kgdFemzevDdd8ZmcrCQOLZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436538; c=relaxed/simple;
	bh=Ei46/XSjgfzkcjSL5NbmSt9DgtmSmLVGDDGjD5wOnw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xeidv7U5K08Y9Z1cHBfQcpffSP+q0XXta4FefIE4lYLp3/3RX/DrVGm9GisXfRlNwBV49QotYUS1okWxtg7sS0nohSosh9D71Cj7CwJaNs+IFljpo5xhH4RqiYmF7T8rsH6qRoHqozNvCoR3BmxLMcfk9XoSZG/rljf4CcbIkLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=g0EuQedb; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="g0EuQedb"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f74b78df93so3404627b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436535; x=1743041335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9FHzui9Ab3LHBQvPmz9xI55DK1wU77PLMSFevFbEbg=;
        b=g0EuQedbkYXF6jLrAVInhGwSbXufC1Gtm6eioFieybJU6zQhd9jKz9vfxJJzTCsFkK
         dlFanuhWnCryNh2SY1wyCVrUuTa8jX7Md+Ti5ayHh92RNA/EMc6Y1F4sPjELlhpNwsQN
         97ZDUOvuaJMtaeyRpdFfmm7yN+ghhMGzdVAjB/02k2UkUg3seuNXsODWPOLmFeRJXSYg
         +B+RzrzHrlz9lMOHstD7wtfaeykHYln+z54T9mQ6aRijsTaMJQSXQo1q+TegjFYq+Ked
         3QbeXG0mUtGw8GhIg+W22KPWfQU9pA7Af2GQoRSO3ntMPHF2SMsLOpNs0qJOkiTtwbHe
         c1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436535; x=1743041335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9FHzui9Ab3LHBQvPmz9xI55DK1wU77PLMSFevFbEbg=;
        b=fZD8AVa0+TjQhgDZ2ir5V0xbP4MsTpAPqkkzY0tDtH3EYwS99ddmNrwKqJKYr6tQFc
         BwCkaiqiCDxfFj8qSvOpRs23SpZuA485hDG+6aGQohwo41eywLUAGdn9oH0GEKElYCWW
         37M5CHeJmQ7Zsp/vIBNfXCOKE25xHp7fypnwlPPDe6/sEcdJIDIHtKjwykOTEz6tWSBK
         GmcNv11NiMbtjyfjHND0s71owNChyJriTFjtwN3SpptslT1/GBnxau0Gq2DQvE+5co/X
         NUu8eclpXyDOpyyZCyZaCSQ12FcFnepTf/4AzRHF2eARNTEjZ4Dhl6dphe2InxJ6D0t+
         FHsg==
X-Forwarded-Encrypted: i=1; AJvYcCXlx7+OMqZMvbxLJ7GBNJ4FbTX8UfDzaRCHwMxcNvjOv3gvyz31d90YmC7P7mJRngUR2kFpWWUIhL0SxNr4qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3EGRA0TQEdTVxE8/t6FRoWwwRq3Y+LQn8g8c1s/5W+kMCcpOy
	GMCZY7CHJ0KpPbG0/8WkhWifXO5i40LziGrVjWZMno8iP3cZHEJkMMPoeuXaLxc=
X-Gm-Gg: ASbGncvE2XpQv/4Jlj+8YsLX3oVr/4I2ncFNnXx0kEmZHcwVVdxpdPCFvP8jJJYAsNH
	2jzTllpdxC2N/I80tePOIbNzGlnpwtN993N2wth7zcpGjTEmx37Ks5WAuyCcS3yfQKOk3QQ4kby
	IP+SK5Lo0ECAp3jEICHO1B/FFVqHgLcpOvR8MaH5l0zs/mVzTGtqsYjbVvIEZBnFN426nLGsKw9
	25FaZXlbkShPVR7wH+ZFKVxIsdqbMt2hUWUr+50ujK2GW+SOG2RsTWkILHnqBZOdnIIPa5p8n0k
	5pDOQMLHBrRaRDkKlSkQJQMwJgerrDsRTA2LzyFXJRcqfh7yp9dNEjLW4wd7dRpZTkzLvp2YyD2
	pc8kcaET2tyfV6P6ydx+GpNIbCrkN+mXsNALk3x+P
X-Google-Smtp-Source: AGHT+IHa6JKiYio8gKv8paGdcIO0IZzOY+f2BKAM9umcVjti6jZO+C9x6PaGEBUZlcxkLfGY6lbIQA==
X-Received: by 2002:a05:690c:6109:b0:6fd:dfcf:2b11 with SMTP id 00721157ae682-700ac6c670fmr18931267b3.24.1742436535429;
        Wed, 19 Mar 2025 19:08:55 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:08:55 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/17] rust: workqueue: refactor to use `&raw [const|mut]`
Date: Wed, 19 Mar 2025 22:07:28 -0400
Message-ID: <20250320020740.1631171-10-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` and `addr_of_mut!(place)`
with `&raw const place` and `&raw mut place` respectively.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are similar
to `&`, `&mut` making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/workqueue.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 0cd100d2aefb..4e27df324d26 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -401,9 +401,10 @@ pub fn new(name: &'static CStr, key: &'static LockClassKey) -> impl PinInit<Self
     pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
         // SAFETY: The caller promises that the pointer is aligned and not dangling.
         //
-        // A pointer cast would also be ok due to `#[repr(transparent)]`. We use `addr_of!` so that
-        // the compiler does not complain that the `work` field is unused.
-        unsafe { Opaque::raw_get(core::ptr::addr_of!((*ptr).work)) }
+        // A pointer cast would also be ok due to `#[repr(transparent)]`. We use
+        // `&raw const (*ptr).work` so that the compiler does not complain that the
+        // `work` field is unused.
+        unsafe { Opaque::raw_get(&raw const (*ptr).work) }
     }
 }
 
@@ -510,7 +511,7 @@ macro_rules! impl_has_work {
             unsafe fn raw_get_work(ptr: *mut Self) -> *mut $crate::workqueue::Work<$work_type $(, $id)?> {
                 // SAFETY: The caller promises that the pointer is not dangling.
                 unsafe {
-                    ::core::ptr::addr_of_mut!((*ptr).$field)
+                    &raw mut (*ptr).$field
                 }
             }
         }

