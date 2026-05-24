Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44E5399019
	for <rust-for-linux@vger.kernel.org>; Sun, 24 May 2026 15:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779637304; cv=none; b=doU4UZ5siZ0Cpr7Q/TyL+Ty0uQNsZF7yFJyQIn0Tc1bKc2JYt5Y4Dw4XW4JV3W5lYNnMLXSgvv7BhthBodLJwPmm6DXvHkv8GKlTjwTZgU41w/ZDM7PhvEeRDV0htKvi83/noCO9UR60BoLyT/GBUPshM1YXiAfkKDND7N8n8c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779637304; c=relaxed/simple;
	bh=LP+8poHVh9zbjYuek8fKJ279TAcL7jm45h440IQz+Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XGgTbZdkdmYPV8tFRw9Ouz6iuMNaqrFM7WFlMfU/5yPSIgTneD/0pp9CbD7BTCTGiKZL+zlTnzxrO3HU6lyy1zgJst+m6wBJjmdoSH5VbL8xu6K+3MLmgwGJQ7IOCkIMMHk4h4uczjbTfPmn5dz82GZeplR8w670JvMZCmg/ja4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=id43rStp; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="id43rStp"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5873983d19eso2164906e0c.2
        for <rust-for-linux@vger.kernel.org>; Sun, 24 May 2026 08:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779637302; x=1780242102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QETOjP8nSu5eBP6GGmjCPAaYCLzkQOtWRPWzeg//2ZU=;
        b=id43rStpdcOaLZcDNy37UfEr59a42gmeG3VVvLGcTa8S6Ov6zd3YrWH9sxvqVRkUO0
         +OT3aCELIfz31AEniedNby/stq8YxBErjI8YHBLBwMUHoWopqOlizn59AOiiQdXNtljB
         LLwUDRpBiaN3llpORk7+Zbe62Brv5UdubSix/t8rmpsj7VWshNToFy4DNuSKbxStLLnP
         KSrJFn9PZlawILud6319J5FP38nB6hPM5r5KsiUEGiBFNr4TUSB+MowYslexAJazVHWz
         UzSACBGJz0SuJne6njsaVIKYX9dNIcbEWMoiXLX+rOENabJTUqbwX2KgBPJddU6vH3Us
         q/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779637302; x=1780242102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QETOjP8nSu5eBP6GGmjCPAaYCLzkQOtWRPWzeg//2ZU=;
        b=B+gJAxiC2QbsigGgBzeS9+3QSNFwxtCTjdAiiosSZwj5ULKtIk2xiYM6KQFU2o11Hx
         XIgembDP8IBAVjld2dtf6eOT48aYoGECM3WXymUR2GaWLAx2AFHIESiX8zbCe7cU3AHW
         sDDoQFn0kH97OtS5OB69ev6X6dacR0YBNx/zrcTwzKbv2b7M97zdGsFqO/DJS0YzRXX1
         4hORGh/Hod2+79vJc1go0SVtPrmUiZ04P4E42d1Od/jmRzcpQFxJ4mFgCQpcHBd5GJtQ
         I3mH6JSO5NZ26DA76nLGjdwZPmZFk3JUdWlLh5l6v0pKXTzjg+BiNIc5NMZ8hljqDJmS
         OhvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aXVRlK3rkKL2eIsSIaagCajM4X5kCNOOJ8Gmzp1nqdPqLI7PinQly89f2KAnSucVqMjDzG+PNRkU6lZ6KeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ6ASUkTPVNCrCE9drL6HXuWyVoj1CeuuPE1bwiepTR/YYK2QJ
	MrweSHRgM5ddNsMdGP284Ci/0c5LhGSKHrRSVH5ysbe3J4ZgwYgsVAM=
X-Gm-Gg: Acq92OG1ppdA2Au8O+fCvv31HIf57UzhHfZ+PMsBlldp5bIlzoupiQLIUpwue8be6B6
	Al5zj5RCq8a+NwEV27fIV152xM0Bp74WI4fItmOcfPbQI0VOEyz0hno6UBcUMCrA1kajqxv1vut
	3LS1npap/YgslikAIzftx9hm8A8svzjrzJBYdkyPEwn9T+XtriSNtB7vqE+Pt+cl+2PQ3rkKMVO
	7YakUx0ro5xOMjg47t7jr3shkDxuLc0THsJl2hNPWyLB0Xp11VKLUcDqzZMPxlQY6H4F9dT8n6m
	6GnhtqXNUc8FWM1DbCPr27hbR8cYwRaouy5GZpOy+dqwUWofucKUt2R/rLLd/ycPl2vSdBtxi4U
	ex9iLiunV/3HPEekVV/WYiRAZXVj1TZpVMQ/qNPd4yvxt1FbU1bh7XjdIsfg0l7tufJUZ2gUR61
	kD9Sm9cOPoFRrbxhZ0aBR3ZAo3hiH5pQEMX2jm85HESJfWnqG0yCzlRS4d8k/U
X-Received: by 2002:a05:6122:4317:b0:576:1a8d:8989 with SMTP id 71dfb90a1353d-58658a3d6f0mr6262665e0c.0.1779637300919;
        Sun, 24 May 2026 08:41:40 -0700 (PDT)
Received: from linux-dev ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f23ee48esm9115364e0c.3.2026.05.24.08.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:41:40 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] opp: rust: mark OPP methods as inline
Date: Sun, 24 May 2026 12:40:16 -0300
Message-ID: <20260524154021.34096-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building the kernel using llvm-19.1.7-rust-1.85.0-x86_64, the
following symbols are generated:

$ nm vmlinux | grep ' _R'.*OPP | rustfilt
ffffffff81801560 T <kernel::opp::OPP>::freq
ffffffff81801540 T <kernel::opp::OPP as kernel::sync::aref::AlwaysRefCounted>::dec_ref
ffffffff81801520 T <kernel::opp::OPP as kernel::sync::aref::AlwaysRefCounted>::inc_ref

However, these Rust symbols are trivial wrappers around the
`dev_pm_opp_get`, `dev_pm_opp_put` and `dev_pm_opp_get_freq_indexed`
functions. It doesn't make sense to go through a trivial wrapper for
these functions.

After applying this patch, the above command will produce no output.

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/opp.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index a760fac28765..62e44676125d 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -1042,11 +1042,13 @@ unsafe impl Sync for OPP {}
 
 /// SAFETY: The type invariants guarantee that [`OPP`] is always refcounted.
 unsafe impl AlwaysRefCounted for OPP {
+    #[inline]
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refcount is nonzero.
         unsafe { bindings::dev_pm_opp_get(self.0.get()) };
     }
 
+    #[inline]
     unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
         // SAFETY: The safety requirements guarantee that the refcount is nonzero.
         unsafe { bindings::dev_pm_opp_put(obj.cast().as_ptr()) }
@@ -1095,6 +1097,7 @@ fn as_raw(&self) -> *mut bindings::dev_pm_opp {
     }
 
     /// Returns the frequency of an [`OPP`].
+    #[inline]
     pub fn freq(&self, index: Option<u32>) -> Hertz {
         let index = index.unwrap_or(0);
 
-- 
2.53.0

