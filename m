Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB9A13C81B
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 01:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753059799; cv=none; b=Lx6Gl9MivUMhD/89A3H/d4a5bysHSKW9LYJW8OeQOzkGOzeMTRba5vp1HL2BaQQGqLNIpyEc8CTyHlRxoDAXnThf9L2LOfGDwTvVC8mevJQRyeuC5sRXWXNvC/ClLPaceRiRm7Sagf49LvV/NyP8o2pHrEMDEdsoTRqAMR4k4Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753059799; c=relaxed/simple;
	bh=1JLaltb09ETI01fMju65A7uQX9JQAkcTCKyIvzLpeKE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSIPXyg/J/FXsgf0BcVHqdH9s8tod71kSzN2vi6jOA46uYw1p6n0hyLCMil8QLosYYfW/t/YHxzAay4fTBZRlguKaarbNyFUCw7GUDohfpi6kqhqLgplK6pRjvKBj+LMpAN+4brprJ49Gur8QjHSixtlO/GtbQ2puWduuceKZTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3LJ5v3a; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3LJ5v3a"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-610cbca60cdso2044304eaf.0
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 18:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753059797; x=1753664597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clkCERaiIbD8OK3WKxEVZxh1uP4F7c7KKvTuaOqAtJI=;
        b=c3LJ5v3aJX5IN68PitXhNR80iq/8wvUgkEzM7GQReNRxjbPK183V6R2qE0O0w7hhHk
         Fq02JQpYgvjhNsGHvv8uw/RrJ0IOG26inFXA3ZEGlKUiGbyNh0UhLNpIOq6NdUbZlV5C
         mm4oZhvOqZLzrHFGOZtnmFyUpeTFYVxH0WT4V86+ic00LCdCSNR0EBKodrnaRSVdkxY8
         kBP/p//gNdV7tJEG/De7Zsqct42R7GLz/lDBzmvpLLlQuj28kmkx9A44QfkJDDCb+KM5
         GH0BWgG2Vc8VBU5K9iUgBim5kYxG+nIhlINd6JIHH2DsD/m7+uCIZV4awvOHyg10rjju
         abHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753059797; x=1753664597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clkCERaiIbD8OK3WKxEVZxh1uP4F7c7KKvTuaOqAtJI=;
        b=w0gd1prctBW4+tVVgLwgRDctjkAW39cgdFZ7H4nkSGNMJuch2rgu8oYONVGwsV4Cpj
         m8ZVwtaGk0YH1hg2HhnnPdRczkHlpn2OiiMsyPMwUBWNNde2veBhobSV365qHRI2bnA2
         feLlpadAC8YvWnw85oCUlcdGAowlhPSkZl4IzO4ifpLWmJZo6IZMwke5bd7CEbYiwuA/
         MU5t94aeP+CEuv1JfmBckJUsCKa7F6AUlaZsAC6JN4rzRibce9MMC+2y11gOFBzKLmEA
         rTOlH2aCO6OtByYv4df5ymqMSH+VxFbKc5Np9L9WbF29ItD7CcekZlt9lWz47/3DcVq1
         Yubw==
X-Forwarded-Encrypted: i=1; AJvYcCW03a49AbXDkxH/EbrlpP+fRWp7UNz2JaLk2DzAeS3QJUe/sicxSq0Q7qQCifnDWk+yCHz2IBbvz10JcbeeLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLKReArVZpQZOgIlBHBKDXnd+irdaJVHov64CpKKWMykaAekBx
	OxS+mpS9i2azSUfzAVLGfJD7T15eiYGCFNl3JpwGiH1yQY1Tv7OxD5/K
X-Gm-Gg: ASbGncsdKwGnLkxjENIZz86wTUMUt7LjO6iaPRhCHgw6kRsavxyDDyuE+vQA9M2eS2H
	I9b6dFI+Cc/XHf3D3LObaWx0U1sr4FFbD/oV6ecL0V7zyog1rDlJqOYqah6LpQEbMesz9a0eAam
	sfrxzYNUQr1zYg8RQ03NwooAUh/BnRVEQXQnmEO1vijY5z9Y9IKG4jVKk2sJPZcbQWKf15hcxwj
	ijoxZTuna2AA0We6lbnAAxvR8NgVB6SCt1prEJqTQ5g/am6ywckDqmMKjqBi9O8H5QVVLwBq5Z/
	9lkNRywsJ29lxv4BPnjCdztSnSjoY5IVgu5IF+eB1P5y4o2iGqXvT4H6wljknopWhUDHdwVyC3E
	br/a4lzqZ
X-Google-Smtp-Source: AGHT+IHHaBjV0MrDnOSgRcDQYhvt3oaN/IiwUh/HCgcTWpXCkLnAjEZt94pL6oB5xBGzB0Xk6HM7QA==
X-Received: by 2002:a4a:edcc:0:b0:615:9673:ab6c with SMTP id 006d021491bc7-615a1ee0386mr14457028eaf.1.1753059796831;
        Sun, 20 Jul 2025 18:03:16 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-615bcc8c2dbsm1436959eaf.20.2025.07.20.18.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:03:16 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v7 2/3] rust: revocable: Refactor revocation mechanism to remove generic revoke_internal
Date: Sun, 20 Jul 2025 22:01:54 -0300
Message-ID: <20250721010258.70567-3-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The revocation mechanism is refactored by removing the generic
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
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 48 ++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 2dfee25240a0..6d8e9237dbdf 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -160,26 +160,6 @@ pub unsafe fn access(&self) -> &T {
         unsafe { &*self.data.get() }
     }
 
-    /// # Safety
-    ///
-    /// Callers must ensure that there are no more concurrent users of the revocable object.
-    unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
-        let revoke = self.is_available.swap(false, Ordering::Relaxed);
-
-        if revoke {
-            if SYNC {
-                // SAFETY: Just an FFI call, there are no further requirements.
-                unsafe { bindings::synchronize_rcu() };
-            }
-
-            // SAFETY: We know `self.data` is valid because only one CPU can succeed the
-            // `compare_exchange` above that takes `is_available` from `true` to `false`.
-            unsafe { drop_in_place(self.data.get()) };
-        }
-
-        revoke
-    }
-
     /// Revokes access to and drops the wrapped object.
     ///
     /// Access to the object is revoked immediately to new callers of [`Revocable::try_access`],
@@ -192,10 +172,15 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
     pub unsafe fn revoke_nosync(&self) -> bool {
-        // SAFETY: By the safety requirement of this function, the caller ensures that nobody is
-        // accessing the data anymore and hence we don't have to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<false>() }
+        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+
+        if revoke {
+            // SAFETY: `self.data` is valid for writes because of `Self`'s type invariants,
+            // as `self.is_available` is false due to the atomic swap, and by the safety
+            // requirements of this function, no thread is accessing `data` anymore.
+            unsafe { drop_in_place(self.data.get()) };
+        }
+        revoke
     }
 
     /// Revokes access to and drops the wrapped object.
@@ -209,9 +194,18 @@ pub unsafe fn revoke_nosync(&self) -> bool {
     /// Returns `true` if `&self` has been revoked with this call, `false` if it was revoked
     /// already.
     pub fn revoke(&self) -> bool {
-        // SAFETY: By passing `true` we ask `revoke_internal` to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<true>() }
+        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+
+        if revoke {
+            // SAFETY: Just an FFI call, there are no further requirements.
+            unsafe { bindings::synchronize_rcu() };
+
+            // SAFETY: `self.data` is valid for writes because of `Self`'s type invariants,
+            // as `self.is_available` is false due to the atomic swap, and `synchronize_rcu`
+            // ensures all prior RCU read-side critical sections have completed.
+            unsafe { drop_in_place(self.data.get()) };
+        }
+        revoke
     }
 }
 
-- 
2.50.1

