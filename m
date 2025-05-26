Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4E7323D
	for <rust-for-linux@vger.kernel.org>; Mon, 26 May 2025 02:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748224893; cv=none; b=DmFqdOnVfoz81o7t/bksjdjj2yvPA/ObjDGCZf2MZ9SQg7fCmpI0qcytJUf3WO+XRyzVG3PF2l9UNfbWPfmWi05BYEuwgRPBcjW11UXIyhrIoyjsoZN7byaHfEyZvd9V2S4NcJHrJdW9dlL1DLIsRi9KbRfrjZyGW9DMPXkY0xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748224893; c=relaxed/simple;
	bh=a2nuGC0rCuZOzA0MZt1pK4Z3n1GP/kvD9YGK9n5cfuc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ut97c7SetkAOCSZo9qHkX2zygzXQN6SwCMsNDOHGLl0meWXzTj6OyGaCJXQX62krJri2pTbcsjBmmJPqA7FDLuuhXBQYaXR41qMX9JyXZunTTfpdn4AUoEN15Tbgc3h4Sfr5eP1bysz6txZ/x9Mhq3HKkbGLUCXi945Lg52CHMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLr1srAk; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLr1srAk"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52d9a275c27so1121118e0c.0
        for <rust-for-linux@vger.kernel.org>; Sun, 25 May 2025 19:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748224890; x=1748829690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W2idn+Je11xe0LAzHjMSYfTJffcLHWxrXV/l94n57A8=;
        b=SLr1srAkX/lk41+zyOjlJoOibrnlbzFhfYNYHUz8ZrM7d3Pc2aw90fknNO8FfL6qBU
         Se1LcZc5pR4n2ZpE6QPrAOSoSud4/VgBa5CErZkbq5qvkOPiQh2ZGetEFvXJf/M5/+jF
         3PcvfiVAFv4Pg2ZVoc2l/VanvVNIhdqkUTK/29J8p1friRH0BtFHmuS/dA9JksQO1yPh
         eZPiHJK7ym9LFbtRQ051StKopgE42LkWzYV6PK/F7Zy8MIQzhZi+zhbcM581/easRjzu
         iTkDwtmZ60aIXoQdGtCgnborpjkbMtPKN0sEMDRit0dn9hzZ1bAugwlacax+++i5EGa4
         ++qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748224890; x=1748829690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2idn+Je11xe0LAzHjMSYfTJffcLHWxrXV/l94n57A8=;
        b=g7C2g1VF6D6jSV037wbsgdsO+YVisYG6Yj5Ywf8MsrCH3yJpNV/266vi9FkMoL8VkW
         7q8r2vuQOkhq8mnJfwEzn2Qq+no4mskhiSysXnbkEqDLxWCaif/B//1DOczg/crGpe7V
         3uoNlhKx9oqslavD1ag+jpvAWLF/HDlPO7p9DwARKJ+p46lNKaO8BZdxEHNW/jAV4gmu
         7IBZXNqaGeIxkgNLAqm21/dlVFAyzu9Jv3fXtz4PRtuMlN7X42xslypaVdvi0fhmvmPf
         1DqAsg5GgmfktSakSQ4ebhSqDHfdTQivmVLOhQ3DDwWz78n4HhwZ8BL+Jz0Cd6sS1Sgi
         RSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgGTQH0gmSq5b+s/6E0Tv9q6snmgE9Gyo+k9Cccpd/OHxRhIwp5Rk718L4EedyDdk/M1iAjCkQ3Rx/Z14H+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1o/yE4gAmZNSBTFi/dIWkBRn2njFRl9i+CNjbu4/pi470MbOm
	cFRSRNF3cNUkBYqkQTvwAMHhzVBi8/p3omvANGXpnyDV8SuYoTgf8ezCoxE8kgH0
X-Gm-Gg: ASbGncuFFE7KiNwpBt9buYDDi4io7ulycn9XpUj7usXgCfZSG4zcGUuINnr+YeZcBsR
	J6J4S0L3C7l0eGubbXXO5PAaRHqxfIbm8k4umj3ROAKZYL5jHDyAtEfJlZxoURYA4VdfIFqOm1z
	jHZ88VLf3Vrivt9+zWosKe1f4w1JUIKN8ty07xwRy4uxiyPuugkdtebvAxhqUjFN1PETK+P7t/Y
	Ebzgxg5CBKKwECdZpvxB1I8PRD2Uh6ndLGZJ/SH8DinU8m7FNc23ggA7uD9QQiJG0gteCYSiFfH
	TTfdj1brbinkByBRb3oVbWZxiB05prhy/fnlIh7Y
X-Google-Smtp-Source: AGHT+IFg5mnXaQM1st8Ie193wgHG+/Bvq/zbelNHV+I0KxxjJ4sgXrzyHYoDd9iKl+C2UPERS0uJrw==
X-Received: by 2002:a05:6122:1d48:b0:520:4996:7cf2 with SMTP id 71dfb90a1353d-52f2c5c84cfmr5638910e0c.10.1748224890357;
        Sun, 25 May 2025 19:01:30 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec027524sm15720329241.0.2025.05.25.19.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 19:01:29 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v3] rust: revocable: Correct safety comments and add invariants
Date: Sun, 25 May 2025 23:01:25 -0300
Message-ID: <20250526020125.382976-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introducing a comprehensive `# Invariants` section for the `Revocable<T>`
type. This new documentation details the validity conditions of the `data`
field concerning `is_available` and RCU read-side locks.

The safety comments in `Revocable::try_access`,
`Revocable::try_access_with_guard`, and the `PinnedDrop` implementation
for `Revocable<T>` have been updated to explicitly reference these newly
defined invariants, ensuring that the justification for unsafe operations
is clear and directly tied to the type's guaranteed properties.

Reported-by: Benno Lossin <lossin@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1160
Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
Changes in v3:
- Refined the wording of the `Revocable<T>` invariants to be more precise
  about read and write validity conditions, specifically including RCU
  read-side lock acquisition timing for reads and RCU grace period for writes.
- Simplified the `try_access_with_guard` safety comment for better conciseness.
- Removed changes related to `RevocableGuard` invariants and its `Deref`
  implementation, as these are planned for a separate, future patch.
- Reverted `revoke_internal` changes (like `else` block for `revoke_nosync`
  and `swap` correction) to be part of a separate refactoring patch.
---
 rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 1e5a9d25c21b..fed860ad2e60 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -61,6 +61,14 @@
 /// v.revoke();
 /// assert_eq!(add_two(&v), None);
 /// ```
+/// # Invariants
+///
+/// - `data` is valid for reads in two cases:
+///   - while `is_available` is true, or
+///   - while the RCU read-side lock is taken and it was acquired while `is_available` was `true`.
+/// - `data` is valid for writes when `is_available` was atomically changed from `true` to `false`
+///   and no thread is holding an RCU read-side lock that was acquired prior to the change in
+///   `is_available`.
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
     is_available: AtomicBool,
@@ -97,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
         if self.is_available.load(Ordering::Relaxed) {
-            // Since `self.is_available` is true, data is initialised and has to remain valid
-            // because the RCU read side lock prevents it from being dropped.
+            // INVARIANT: `self.data` is valid for reads because `self.is_available` is true,
+            // and the RCU read-side lock held by `guard` ensures this condition is maintained
+            // during access.
             Some(RevocableGuard::new(self.data.get(), guard))
         } else {
             None
@@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
         if self.is_available.load(Ordering::Relaxed) {
-            // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
-            // valid because the RCU read side lock prevents it from being dropped.
+            // SAFETY: `self.data` is valid for reads as `is_available` is true and `_guard`
+            // holds the RCU read-side lock, adhering to `Revocable<T>`'s invariants.
             Some(unsafe { &*self.data.get() })
         } else {
             None
@@ -176,9 +185,11 @@ fn drop(self: Pin<&mut Self>) {
         // SAFETY: We are not moving out of `p`, only dropping in place
         let p = unsafe { self.get_unchecked_mut() };
         if *p.is_available.get_mut() {
-            // SAFETY: We know `self.data` is valid because no other CPU has changed
-            // `is_available` to `false` yet, and no other CPU can do it anymore because this CPU
-            // holds the only reference (mutable) to `self` now.
+            // INVARIANT: `is_available` is true, so `data` is valid for reads.
+            // SAFETY: `self.data` is valid for writes because `is_available` is true, and
+            // this `PinnedDrop` context (having `&mut self`) guarantees exclusive access,
+            // ensuring no other thread can concurrently access or revoke `data`.
+            // This ensures `data` is valid for `drop_in_place`.
             unsafe { drop_in_place(p.data.get()) };
         }
     }
-- 
2.49.0

