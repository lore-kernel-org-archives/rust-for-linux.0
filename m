Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A1F125B2
	for <rust-for-linux@vger.kernel.org>; Sat,  3 May 2025 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746283993; cv=none; b=kW7ffCrcFVV1lYKI7s7LTQz1W+5FIgtJKwdmKrsBFMKnIFxeafLIAS9PBjvCDjdTNkKhdqtdqIyHOe6pK3Lg2T3j/B4GTwv7bcATOSrnuPZ4VMDBxuJJqK9MjwYssniPhvrKlW7WEAVnOGnT1+UDcfkJ5iO2vTY5Z0ZxQgdPEDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746283993; c=relaxed/simple;
	bh=j3Ud/OYibTVSOiEsYG8LwGXRbxDePGGcZqGoPPGYliE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nMrpIb54aUC8JjqUkf57gCkINHUjzJd6gT3xV5RbAPQqXs7WlnguP+Qq9FZYIH9Bx7W3q+hB0LJU+rm/HE7437mZKSuQYRj5TqdrWl03YjpxdJPamb9MIDSg+qWP2i1mzcnFsPHF+bv2+NdQ+1tbKWJ1O8+ojfIur/fW3s9j7n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQlu/LY3; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQlu/LY3"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22c336fcdaaso36607835ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 03 May 2025 07:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746283991; x=1746888791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rkcV4FXqVYw5sHKdG12V8QpgsgJTWs8KJsxOjdw9VFo=;
        b=GQlu/LY3D8xrv78vdXuCuCl7elGQ7QBZMszjCEiS9bYZ/qh1OPoKmmmGzCrPPGJHlL
         edHFcj6uiGQKJ7Ifv908fQbTHcT7ax1w34iFMHoPXtKJ8plSYPR37qnOQtWxQpyqLKNq
         BbmucWfOsjELFaKSkC2vUtrj1orZZMbbnsTwHpj61+aGeRcimjI9ww8sKms3mLwhpl9X
         mX86tentEWatEAMm1WH9Y/kG8y2kf7jagJU4wmDKbQ0vTCRm0LX23wMlicjE129NmBxM
         11oR+jHd7nAW7ZyTEfiwSJ8LUH7KK1nCHdUvdxGqbIr7xjn9LNRu4OtLuRLw1notoB2p
         BtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746283991; x=1746888791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkcV4FXqVYw5sHKdG12V8QpgsgJTWs8KJsxOjdw9VFo=;
        b=mgkyvEBRgtvKuTKQcl8CwsA3N72BRdPt/X3vEAkJTQf3z0gqcDVIuo0mizhTrFy8kJ
         wCChgKSTFg94gT9MVm4CMKVThCr8XwFVV9uOQ9UJq1nLheP712FOVXMCRFAVybMSPChF
         x1ChXlHUtavrd2aoqOsqRR3jHZxnN+t+00GoLyka8Ar/P4t+RibhGNuQXcsTQ+0CQDOC
         fVE2vmZrwKTZs8LY3gx5AhDQn5w2mrnnMKCvCEbsBfqGTJMPL0u4cmnfkzbrX3m+Tgec
         HhMpO4pOm+AcmH9CoJnAOnb6hM5mM/srfQwHUn4JGDqEVSXRK3mWVNTVMerfXnIIStaw
         9q5g==
X-Forwarded-Encrypted: i=1; AJvYcCVQJ/fl5U25HUPubKuqVnqywk2oMMOabiqQU4rl3ihHLlRmXurpXOp+ybSaEcOtB6wPmu+PwddjQ6qI4Kl7Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8a5WerG2kB0q3ZIdwn0A3mlGBB2CP2EQ55h4q0mWh5kixuSpY
	J5sNpqOoxcoTC95DoBgCceh/74sFBz2r6efSqp7Js4l7GgvDwOcs
X-Gm-Gg: ASbGncsd/bZsjQO0xO2f8rBtLYtllO7ADFXQsQLQK9DB9d+J9TDZYQgFYE3yU4sBKJv
	Q2fTWHxkC2sSDNbhC/gaxIiByZbWQUtdBgFARlXcP2i4TT1iFZF6hRNV54INKGhBTWs9Ls2gQ2T
	+dyiMPvKR3VVK4mzuq6S33CpfsZkuRrNSG0BofEE22QGIGCKEf1ghPtNCCLfW3TMJTOz5kZLTDA
	+E32CxryNqk9GfB+NI21mpDWMXLZAlPHyUbe3B83mD4HMRLpO9AzO3WBpLbKzsV4yPb1kbSLe56
	SMTpXe9bX8rUTLDYh7GvfZxVYzOTxw==
X-Google-Smtp-Source: AGHT+IFJTnRAgVFbelIKA9hrnKaBnDNBkYYLt2bGra0Z3uL+Z0O6ZpLND/Va0fkQMrGemqaZQVKseQ==
X-Received: by 2002:a17:903:2446:b0:21f:507b:9ad7 with SMTP id d9443c01a7336-22e1e91463fmr16344825ad.25.1746283991297;
        Sat, 03 May 2025 07:53:11 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522fa16sm24815715ad.239.2025.05.03.07.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 07:53:10 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: benno.lossin@proton.me,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2] rust: doc: Clarify safety invariants for Revocable type
Date: Sat,  3 May 2025 11:53:07 -0300
Message-ID: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Revocable type in rust/kernel/revocable.rs lacked a comprehensive
documentation of its safety invariants, specifically regarding the
validity of the wrapped data and the necessity of holding the RCU
read-side lock for access. This patch addresses this by:

- Adding an '# Invariants' section to the documentation of `Revocable<T>`
  clarifying that `data` is valid if and only if `is_available` is true,
  and that access to `data` requires holding the RCU read-side lock.
- Adding '// INVARIANT:' comments in `try_access` and `try_access_with_guard`
  to explicitly refer to these invariants before accessing the underlying data.
- Adding an '# Invariants' section to the documentation of `RevocableGuard<'_, T>`
  documenting that the RCU read-side lock is held for the lifetime of the guard
  and that `data_ref` points to valid data during this time.
- Updating the safety comment in the `Deref` implementation of `RevocableGuard`
  to explicitly mention the relevant invariants.

Changes in v2:

- Refined the wording of the invariants in `Revocable<T>` to be more direct
  and address feedback regarding the phrase 'must occur'.
- Added '// INVARIANT:' comments in `try_access` and `try_access_with_guard`
  as suggested by reviewers.
- Added the missing invariant for `RevocableGuard<'_, T>` regarding the
  validity of `data_ref`.
- Updated the safety comment in the `Deref` implementation of `RevocableGuard`
  to refer to the new invariant.

Reported-by: Benno Lossin <benno.lossin@proton.me>
Closes: https://github.com/Rust-for-Linux/linux/issues/1160
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 2da3e9460c07..7ef2f34782b4 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -64,12 +64,11 @@
 ///
 /// # Invariants
 ///
-/// - The wrapped object `data` is valid if and only if `is_available` is `true`.
-/// - Access to `data` must occur only while holding the RCU read-side lock (e.g., via
-///   [`Revocable::try_access`] or [`Revocable::try_access_with_guard`]).
-/// - Once `is_available` is set to `false`, further access to `data` is disallowed,
-///   and the object is dropped either after an RCU grace period (in [`revoke`]),
-///   or immediately (in [`revoke_nosync`]).
+/// - `data` is valid if and only if `is_available` is true.
+/// - Access to `data` requires holding the RCU read-side lock.
+/// - Once is_available is set to false, further access to data is disallowed,
+///   and the object is dropped either after an RCU grace period (in [revoke]),
+///   or immediately (in [revoke_nosync]).
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
     is_available: AtomicBool,
@@ -106,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
         if self.is_available.load(Ordering::Relaxed) {
-            // Since `self.is_available` is true, data is initialised and has to remain valid
-            // because the RCU read side lock prevents it from being dropped.
+            // INVARIANT: Since `self.is_available` is true, `self.data` is valid. The
+            // RCU read-side lock held by `guard` ensures that `self.data` remains valid for
+            // the lifetime of the guard.
             Some(RevocableGuard::new(self.data.get(), guard))
         } else {
             None
@@ -124,8 +124,10 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
         if self.is_available.load(Ordering::Relaxed) {
-            // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
-            // valid because the RCU read side lock prevents it from being dropped.
+            // SAFETY:
+            // INVARIANT: Since `self.is_available` is true, `self.data` is valid. The
+            // RCU read-side lock held by `_guard` ensures that `self.data` remains valid for
+            // the lifetime of the returned reference.
             Some(unsafe { &*self.data.get() })
         } else {
             None
@@ -200,7 +202,8 @@ fn drop(self: Pin<&mut Self>) {
 ///
 /// # Invariants
 ///
-/// The RCU read-side lock is held while the guard is alive.
+/// The RCU read-side lock is held for the lifetime of this guard.
+/// `data_ref` points to valid data for the lifetime of this guard.
 pub struct RevocableGuard<'a, T> {
     data_ref: *const T,
     _rcu_guard: rcu::Guard,
@@ -221,8 +224,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
     type Target = T;
 
     fn deref(&self) -> &Self::Target {
-        // SAFETY: By the type invariants, we hold the rcu read-side lock, so the object is
-        // guaranteed to remain valid.
+        // SAFETY: By the invariant of `Revocable`, `self.data_ref` is valid because the
+        // RCU read-side lock is held for the lifetime of this guard.
         unsafe { &*self.data_ref }
     }
 }
-- 
2.49.0

