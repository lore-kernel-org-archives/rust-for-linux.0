Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CC8224240
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 23:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748906937; cv=none; b=LSjv6DnDsGLRJk6fVlANAvN3FsL4OcaS6nddIKEwUIcAz6kJbQuhpRx59T0SLIu5lv3eknUe9f5zFtIaTRTTZ2JxCEEEhJPjaVdHyoo/TLGdWGTyDlUNI1DfAgoaGJYC44w7fGuATCTbdYSkKRzDWg6bjaxP/Z70JMMr7Aq2J8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748906937; c=relaxed/simple;
	bh=cUH/AggEuguei7YgUl376puy8XlQF0imPcYcuFixUO8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIsum9r14nVCdw+eHzgr3wxdA+LZEmvLmSIb44xRuOPzx9VceASYD44KSZHqdSDKTSTvx4adFxtE3k9nCTwKQo9svkk+ymbZXlmaIbxz8vybDuEjNaKLL7Ow8tmadU1EsH4mJWPuqvqcd22p3msCeArVVbGBadt018T0if5mpi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiLSIe+t; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiLSIe+t"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-530807a856fso2635807e0c.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Jun 2025 16:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748906935; x=1749511735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpTW2A6QYa5jp5Fjr59g12q6ycrS0TTsu5uhRgEbA0U=;
        b=BiLSIe+tbGJJboCP8zodlP2TBUVwnmesLy3IaYSnZGkwDvykM0jaunkDQrQAj+yZXx
         FYl2tBpoDjAge/1W/XTfpbdRsDgxn3Ba1GnHV+/0wbuaFK4oa8DRB26rKlWwZZDXVPRg
         EOX2K2LkMB3JCHKbfDIWwFItjeHlzfg0fmMg+Xlu1CdtEaAlLNWtmxMohuYWV976abXf
         LhXcPHEAd7gBVwClM1jHhuop/e/PIRzyssqJhahZAvFAveMfKvtMe9mZPE9Cp6FgJ4Kg
         iXsvThdk/ed4AHwO5jmpoEpkiIXTHkRv3h8ZZxp0UzKkT55BapxDzqm4TFUSWK/6hIzw
         9ukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748906935; x=1749511735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpTW2A6QYa5jp5Fjr59g12q6ycrS0TTsu5uhRgEbA0U=;
        b=eUBO3gY50HmPlT9RuXS36S+y1zb5xEGpF+yy8A4Muv80wrO7dEs4rVtZMAytM5WJ5i
         WzzObC5nW9hlkx5rs6IVu+ijWxuLOBu1zGF07JVHSOrDCAV11THPcZcuBlddxfxKVozN
         swmNC/7tPDsCDzFWyqzmazdWboAclwbIWGg5qdzZHMEvvHeNNGZhltOC4HqL8yuL2IUr
         4v+yEN5HA8R7Ue6h+WNEgCzj4CJamp3RYSXkXfVS5A4UzEJ49VhE/j4fdzhJWikR0AMY
         8N25ZbuHBk9qVM6SUzVQlUNxzhGkA8mjXflAKu/KQYB8S/A4GTXpNcEu1VVRY7hugtW8
         HzEw==
X-Forwarded-Encrypted: i=1; AJvYcCU87HJbba36URoGdJhhBmlVCTZfu+8lAElAsy8SyR9/MoQQ5ge1UvoTFUeyCQcpkQJEH89pZTvm4w/Ft8WHKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6PeMMzDNANmglx2ifKyoMU4cfZGTU3svp1RwKLyonX21wP3J
	uTlu9keAz9Ui9+z2UuMv65Vx+1d2QXp3abYlVXq5F6TAlQcwxqNpaH3ES8izBg==
X-Gm-Gg: ASbGncvyv5p6bfMIl9shek5nINx40XRv4psGvZjn1nyCEflvILsJAwCAcUHqm+61nat
	VqiC/mkIhv4TeuwJ9JhBFhb9iM4VemREtSf4DGtDOo7mTaqmVcPS+wjEJ5F8Ib0k8eaFe68nfFR
	4FiS4wTeH70k/0qKnldAACN6Pd3P5sczW0pTxYtJ6ZLhaKwYjEKH0vIbox97a/6nTVm0FK+/CQn
	ARwta8kxCbO4AB1YOb6KlMKcpxBfM1ZBABSd7vDFpgMg6q5GAHP0UYxWidKk2lLTgkWP97AdjAW
	aNJrqNf6bMgpUnQOWOnqCqwRgsNGg/0OoPEYFyiLWz41kIQfIaU=
X-Google-Smtp-Source: AGHT+IEt6eR98+k2gQETrOsrJM7L9HuU47B8V402rBSRz8MEaVtG/eiWx/hj9sNtGn0grnNQFvBRkA==
X-Received: by 2002:a05:6122:3389:b0:530:5cf0:8187 with SMTP id 71dfb90a1353d-530ba081aecmr527816e0c.0.1748906934694;
        Mon, 02 Jun 2025 16:28:54 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a39014csm6891262241.24.2025.06.02.16.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 16:28:54 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v4 3/3] rust: revocable: split revoke_internal into revoke and revoke_nosync
Date: Mon,  2 Jun 2025 20:26:24 -0300
Message-ID: <20250602232842.144304-4-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit refactors the revocation mechanism by removing the generic
`revoke_internal` function. Its logic is now directly integrated into
two distinct public functions: `revoke()` and `revoke_nosync()`.

`revoke_nosync()` is an `unsafe` function that requires the caller to
guarantee no concurrent users, thus avoiding an RCU grace period.
`revoke()` is a safe function that internally waits for the RCU grace
period to ensure all concurrent accesses have completed before dropping
the wrapped object.

This change improves API clarity and simplifies associated `SAFETY`
comments by making the synchronization behavior explicit in the function
signatures.

Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 43cc9bdc94f4..daf22e3a7d20 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -126,22 +126,6 @@ pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a
         }
     }
 
-    /// # Safety
-    ///
-    /// Callers must ensure that there are no more concurrent users of the revocable object.
-    unsafe fn revoke_internal<const SYNC: bool>(&self) {
-        if self.is_available.swap(false, Ordering::Relaxed) {
-            if SYNC {
-                // SAFETY: Just an FFI call, there are no further requirements.
-                unsafe { bindings::synchronize_rcu() };
-            }
-
-            // SAFETY: We know `self.data` is valid because only one CPU can succeed the
-            // `compare_exchange` above that takes `is_available` from `true` to `false`.
-            unsafe { drop_in_place(self.data.get()) };
-        }
-    }
-
     /// Revokes access to and drops the wrapped object.
     ///
     /// Access to the object is revoked immediately to new callers of [`Revocable::try_access`],
@@ -151,10 +135,12 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) {
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
     pub unsafe fn revoke_nosync(&self) {
-        // SAFETY: By the safety requirement of this function, the caller ensures that nobody is
-        // accessing the data anymore and hence we don't have to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<false>() }
+        if self.is_available.swap(false, Ordering::Relaxed) {
+            // SAFETY: `Self::data` is valid for writes because of `Self`'s type invariants,
+            // as `Self::is_available` is false due to the atomic swap, and by the safety
+            // requirements of this function, no thread is accessing `data` anymore.
+            unsafe { drop_in_place(self.data.get()) };
+        }
     }
 
     /// Revokes access to and drops the wrapped object.
@@ -165,9 +151,15 @@ pub unsafe fn revoke_nosync(&self) {
     /// [`Revocable::try_access`] beforehand and still haven't dropped the returned guard), this
     /// function waits for the concurrent access to complete before dropping the wrapped object.
     pub fn revoke(&self) {
-        // SAFETY: By passing `true` we ask `revoke_internal` to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<true>() }
+        if self.is_available.swap(false, Ordering::Relaxed) {
+            // SAFETY: Just an FFI call, there are no further requirements.
+            unsafe { bindings::synchronize_rcu() };
+
+            // SAFETY: `Self::data` is valid for writes because of `Self`'s type invariants,
+            // as `Self::is_available` is false due to the atomic swap, and `synchronize_rcu`
+            // ensures all prior RCU read-side critical sections have completed.
+            unsafe { drop_in_place(self.data.get()) };
+        }
     }
 }
 
-- 
2.49.0

