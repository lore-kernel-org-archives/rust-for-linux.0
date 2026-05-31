Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A51E520A
	for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780234172; cv=none; b=qJ+STQ5mpxRKm/a6/k6SUfV14jn5SIyA0bpue3dlL9fPWxe3CCBpu5GB/tOZ1Yj8aJJgFufw6m7IUyMFHyUxnNWSwvBPxpafuITrMeVJde2XUUycCM5EsB+K2iSDJCdg4TWbo6CaYuNLvrQS2tdQaDw6FsO30J5psob8UciNDOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780234172; c=relaxed/simple;
	bh=0qrAIbvC63IS8BEjtZEusW7k5lHdMo7Dalz14xMeN2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eyHTxnnO0glH3nhnxcYzVN4GCtKz8iF7UQ8TaxoUQkqIIrJWWxJ3kIT/Kkq4FILxx1yIj8DUJzZMOY/e9ixrwD0NIl3pp+khFPidjyFpL1olKLNkr/rf9J2Zo6ZGbyZowMqeG7lj54NQ63VVbLo2fklqnKoFTdhPx6d8+0wEz+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTuxJuzc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTuxJuzc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36d9f91a336so182054a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780234170; x=1780838970; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuDSgqRRHkSSjLap3TemoZOIyfRnlWdOQPsLTnhdd8k=;
        b=dTuxJuzcUVaycmZ7W8Lh45z3SsNU81ThBGIDEfMcbSVIxyGLMRiLiO7O3LqhF5cC88
         7f6fXNHUXL+DDYKFVxc8+f3V1HPZisCZCA46YzKtlzZDYEkF7XIVgmPbCbNAH6RGblUX
         QU9NuiXkR0HZFiISpwybk9WQYtwT93uWiRt4f/uIxrzmvbHKn0B7hW51ejoc6BsnafGz
         xXzNwWKUByQVUr13+Aa6kDi9948CwdIg7ySgX8lTq9JNzMLX46YeiZsIZsqaeifdVlji
         1eLXJQCVz9p0dzD919rtDbq0Xgp0Jx5iY+M7SuJoYyJbMDWV/9nvmA4ayaeR/i1kq6Yp
         WryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780234170; x=1780838970;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuDSgqRRHkSSjLap3TemoZOIyfRnlWdOQPsLTnhdd8k=;
        b=SbXSK1kMtY7pCng+5fpWGj9F0AFHv9y087HbpRn90OgBypyMrqyGfiAQM7ZmJwCt5n
         Hg0Pyh51jhr446HC3GznO3Nzt6eqZTSQDtX9VdA9nijLlGCZmHPz1l2f+xB8kEjRcZtQ
         +Pa/NkWZ1dsWRbEuQPy4qdz3uz3ZDGCj2PFkZ2RN92PCpISZD+3YMlNSDUWxFRsz9LOD
         f/LNXl0Ic9FVgqtYEVgwnd5tnkAIRMrCSS8P+rNQGrqKuG0+OhgyVx3FKMkQshi5Yo62
         DRuvooW4SKHg0nCYJCh6QX9uSauf03U8KNBrwwdtcLARiPnkAwgGeTMvZYbgQJ/cjRSF
         YrqA==
X-Forwarded-Encrypted: i=1; AFNElJ9sWJ6gh+fy+d41XJackkMa/DdJ2dlZjxRGdfE8nBIagvBkg5MIeRmKMkXwBAVx6kolOJmdJ7SnFOIzYDVryQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxndq5E1Jim08SeGOwPJg8qHwJWGEDh2KX4KMR00SCyTc4FJIqs
	JNkhT64ydtUuvG3GMXOHoLNzB0rXAc9DRduGPz9Ajzkvd3pPSgrlbViC
X-Gm-Gg: Acq92OH5DqaPARKUaxXpBbLcsibE2txCeIQyMxMmKBf93raulxLzkMXNHtopcA1nk1x
	zgMySVu3x4dCEi8t2TVBfWzyu/QqRzK0wkiyv46g6zwt+OS5F9Z6P9c73TMdbB1+qu+5gKrEgwI
	6q/OIy16UgrZaSuEW7ycP9u/f2IVaKeftOJaJ59SrLq9VAiwfChERj9vAIbKR8JFSxmWXYnkBai
	hDAauxf+5izAsW2AKJDNOw6obcso/6Y0sLMir95wLPFNIXGtUHCxAf/BUp0eMNoOXbBm2YDJhff
	UDp6cBtAVgjqHpfJif4NVxyQAzm57BSXCxXVwekumBowgQwbUgdt4nwqwCxhxEF8jxPo6cFY+wZ
	DDKo9nlhMyxDabYNMyIrTI2sATL4RNazVhFyjn/og6s9PwY0pA4f+KIthnuY7ybH2Ck9D+8tI5T
	9jhHmN26bLpvuPyLQdHs4IL+8vUnh/j+bO1MntE9J86J+o/Lq1i3hJwA==
X-Received: by 2002:a17:90b:1981:b0:36d:86a5:5b8 with SMTP id 98e67ed59e1d1-36d86a50739mr2020494a91.11.1780234170380;
        Sun, 31 May 2026 06:29:30 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdd1a855sm3477044a91.6.2026.05.31.06.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 06:29:29 -0700 (PDT)
Date: Sun, 31 May 2026 22:29:24 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	brauner@kernel.org, cmllamas@google.com, aliceryhl@google.com,
	mo@sdhn.cc, wedsonaf@gmail.com, Liam.Howlett@oracle.com
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org, imv4bel@gmail.com
Subject: [PATCH v2] rust_binder: use a u64 stride when cleaning up the
 offsets array
Message-ID: <ahw3tFhLz9bMMJAO@v4bel>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Allocation's Drop walks the offsets array (binder_size_t = u64 entries),
cleaning up the objects, but it used usize instead of u64 for both the
stride and the per-entry read.

On 64-bit kernels (usize == u64) this is harmless, but on 32-bit kernels
it walks the 8-byte entries in 4-byte steps, iterating an N-entry array
2N times, and reads the always-zero high word as offset 0, cleaning up
the object at offset 0 N extra times. As a result the referenced node or
handle ends up with a lower reference count than it actually has (a
refcount over-decrement), and binder's reference accounting is corrupted;
for example, the owner can be notified of a strong reference release
(BR_RELEASE) even though references still remain.

Change the stride to u64, and read each entry as a u64, narrowing it to
usize with try_into().

On 32-bit ARM, when this over-decrement would drive a count below zero,
the driver's existing refcount guard refuses it and fires:

  rust_binder: Failure: refcount underflow!

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
Changes in v2:
- reformat to satisfy rustfmt, as pointed out by the kernel test robot
- v1: https://lore.kernel.org/all/ahjpn-3WQTywTdyj@v4bel/
---
 drivers/android/binder/allocation.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index b7b05e72970a..ea5846e4da16 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -259,7 +259,7 @@ fn drop(&mut self) {
 
             if let Some(offsets) = info.offsets.clone() {
                 let view = AllocationView::new(self, offsets.start);
-                for i in offsets.step_by(size_of::<usize>()) {
+                for i in offsets.step_by(size_of::<u64>()) {
                     if view.cleanup_object(i).is_err() {
                         pr_warn!("Error cleaning up object at offset {}\n", i)
                     }
@@ -420,7 +420,8 @@ pub(crate) fn transfer_binder_object(
     }
 
     fn cleanup_object(&self, index_offset: usize) -> Result {
-        let offset = self.alloc.read(index_offset)?;
+        let offset = self.alloc.read::<u64>(index_offset)?;
+        let offset: usize = offset.try_into().map_err(|_| EINVAL)?;
         let header = self.read::<BinderObjectHeader>(offset)?;
         match header.type_ {
             BINDER_TYPE_WEAK_BINDER | BINDER_TYPE_BINDER => {
-- 
2.43.0

