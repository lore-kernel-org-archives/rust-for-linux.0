Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C0E25B083
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 15:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871365; cv=none; b=UJoemJxp4ANmKq4vXssdaiV6iHqmzJMSXZVIPLAYqU58UY/S/UOKK8TFja06LYLhe99Kv497zKsq1Iv664sfUzs/4f0SGIPwZL2sk0ns2IDER5VR09seTlfvHiUCBFFb0dO7rlz6cT8waDEGCyJeuxvyp5HWK1AHISprRLzzP/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871365; c=relaxed/simple;
	bh=hWbRhZH2/ExHhSbV++KSjAbuk1/gQEjL0oR7v0HZxyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpD+yMFNgMJnkq4sv/igpjab13C23dg40CG5dJsLKvrEb/cbO7e86sMb++QylROytFteRReHJgLk6B65sOvz9fzyuUFlXp4geo8uetKRKo2qSgbKqA7/yTaHbEsizUpPABVrzOdU/oy1lNXQahMY/cr/rAPGlwGVN18PFucUDAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1cKlw8B; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1cKlw8B"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381216921aaso2643595a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 08:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783871364; x=1784476164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuV8hhyXMBSw35UwBV3Vw5b5QvmJJCKQBJkLO6Tuw2U=;
        b=j1cKlw8BohNouHDFfo7IPnccWx9q3Noo3QtU4nR7sSs7wuLMB/tcjoLjT/y9m+KqwP
         BLSQMWfeh+sfguzSZuhy3fu9b76xoIdYbn8w+F6fovxmLKpeCExerKPXrGr2xmcZA8oD
         +xIQkJgR38Wa0NIlfdO573kptO+vebUwZLx+MYtdSf/W/parSSkHKM3yYcr+YxHjJi1C
         PqckjsFw0lvVnHAMH/ah5KTQdF/0eNZeq2Y3AV3HP8/4K8Z2t7kx2ede5G1osWhUvfQ3
         Xp+8+0cKjFEsfMRU0vR81ZYNrOsHZrFjUirkTWVIyCisREnleACAi8CjIrlRGXwcERpF
         SOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871364; x=1784476164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuV8hhyXMBSw35UwBV3Vw5b5QvmJJCKQBJkLO6Tuw2U=;
        b=JMBHu2mM3WjiWAVdboNd0sG/apWEIru2sYcDxYyLcjVxiW47SfnhaBAs1tmRWGSHd3
         P1Vv8sXDbS0R+bTYq03do3LhbCLPPAB0LqhZWRj9QZ+6RO2gIOmC37cf0Vc0Vd1zYkHB
         vmqvCIl6Id8NlNCrwU4nS/9ATf7M/q7iTs2rNJCoOqaBWYt3S6t+f9gOiAoX9nYFe5MQ
         kFieCpnfn5U0WoTjZOkMP1VT1dsP5WmPT1zRyDWPN6UzrdHAk8rsqxhXOE+llo9trUOA
         eHqfyMaSo8wdCGmgD32QFwaBEfsWmAQlRzFB7rxLDXYJCZBHWw9WK9bYJoX9cyb9+ptq
         cdRw==
X-Forwarded-Encrypted: i=1; AHgh+RqjaQ+rkj9X7w3LUxEnN7/tPSD0SqpwumQ1zMeyGEi+QuYDAqCll5p72lwsz6Zif5acQOLZ3T3YUe3HnptrZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzWWyGSKHHvRSllmdZFnie/TQ3xfytprGHlyrYLsjtbKbl+6PS
	rDw1upB4hs4gzL30s80pQuX/HBd0zX4Cad0EYwj39gm+Dj2dHEI53pcJ
X-Gm-Gg: AfdE7clsx42ugRa5sgZTCcM0BxnDjtMxrgGvtdJGLXFKcz9a9D/cMEA6CLewvlG5gIe
	zuknzEUYH5kTm/+Z83k+BeMkcIlAHsZzDM5HeLOS+D+ZaxgJCSsu//nRH3QkkZZmBVRctDT61M3
	b8OqkmYMoLK6h44CYwele44dliGuNieGf6vbgQ4RN5APFxYEv/WuH8TuZ+4N2szJ40s6kYxx4/4
	8WVyCLonP316YObbhuUqNS95asnVYD5yzNBUjes/WIkfnw31aJB0uxx6/fhTW8vWlWuSzE77L4x
	lfKCHdZkHRjT28sjfiaQLRvKEwsUwa4Kl4N6Ul6zD6JD4LyrXtFwHZ1M/1QAe43iDLbC8TJu7BQ
	/2YfFpc71sLj7oAawUMSGjYcuNuC2VAZfojGikcK2GzvQ0oQJkhRTtp5JOu1bcQ67fFe9VAKreb
	YibEUmD04u7Ns7Xf787HdYPa1WP4yMnjYnO/WGjQ==
X-Received: by 2002:a17:90b:57c5:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-38dc75dc0fcmr5785697a91.16.1783871363754;
        Sun, 12 Jul 2026 08:49:23 -0700 (PDT)
Received: from Excalibur ([157.51.238.219])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm39268481eec.26.2026.07.12.08.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:49:23 -0700 (PDT)
From: christopherjoshy <christopherjoshy4@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	aliceryhl@google.com,
	lyude@redhat.com,
	daniel.almeida@collabora.com,
	work@onurozkan.dev,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@nvidia.com,
	acourbot@nvidia.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Christopher Joshy <christopherjoshy4@gmail.com>
Subject: [PATCH v3] rust: kernel: add SAFETY comments in aref doc example
Date: Sun, 12 Jul 2026 21:19:13 +0530
Message-ID: <20260712154913.1779-1-christopherjoshy4@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.2
In-Reply-To: <20260712153028.896-1-christopherjoshy4@gmail.com>
References: <20260712153028.896-1-christopherjoshy4@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christopher Joshy <christopherjoshy4@gmail.com>

Add the missing `// SAFETY` comments in the `ARef::into_raw` doc
example, replacing the `TODO` placeholders from issue #351.

For the `unsafe impl AlwaysRefCounted`, explain that `Empty` owns no
data and has no destructor, so the no-op `inc_ref`/`dec_ref` cannot
free or leak anything, and that this doc example keeps the backing
object alive for the `ARef`'s lifetime.

For the `ARef::from_raw` call, explain that `ptr` is derived from a
valid reference (so it is valid) and that the required refcount
increment is trivially owned because `Empty`'s `AlwaysRefCounted`
manages no actual refcount.

Link: https://github.com/Rust-for-Linux/linux/issues/351
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Christopher Joshy <christopherjoshy4@gmail.com>
---
 rust/kernel/sync/aref.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index b721b2e00..3cf7bc27f 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -124,7 +124,10 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// struct Empty {}
     ///
-    /// # // SAFETY: TODO.
+    /// // SAFETY: `Empty` owns no data and has no destructor, so its `inc_ref`/`dec_ref`
+    /// // are no-ops that cannot free or leak anything. This doc example keeps the backing
+    /// // `Empty` (`data`) alive for the whole lifetime of `data_ref`, so the `ARef` never
+    /// // dereferences freed memory.
     /// unsafe impl AlwaysRefCounted for Empty {
     ///     fn inc_ref(&self) {}
     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
@@ -132,7 +135,10 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// let mut data = Empty {};
     /// let ptr = NonNull::<Empty>::new(&mut data).unwrap();
-    /// # // SAFETY: TODO.
+    /// // SAFETY: `ptr` comes from a valid `&mut data` reference, hence it is non-null,
+    /// // aligned and points to a valid `Empty`. `ARef::from_raw` also requires owning a
+    /// // refcount increment; this is trivially met because `Empty`'s `AlwaysRefCounted` uses
+    /// // no-op `inc_ref`/`dec_ref` and so manages no actual refcount.
     /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
     /// let raw_ptr: NonNull<Empty> = ARef::into_raw(data_ref);
     ///
-- 
2.43.0

