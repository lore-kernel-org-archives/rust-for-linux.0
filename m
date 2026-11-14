Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662523;
	b=bKpmaSiMQlw6DOOikAi7xvosAfy6hNFwKqBQvq5nLVCLXYwyoLKLblRPQpva2HhlRwEh
	 qhAFyz7j5xKm3D8ebWh4XrIQS7my+WUJrac7HnDsmI8eYyd5wZymOdUDwIvPfz1y/KlEv
	 s342aWcNlaE2ZII3Yo2pmkenrkp5WfKn5CVJA5k42YmhjrVrCwAeEKc/WFVLRgfTdGxci
	 bk6eik66XjXsN16xJkGDcMBma2SDCNjWVUZkhQ4e8ml7Op2+fLUoJ68CxtrmJQmYPymW0
	 5KRvntOOkjW2h1hSNqPIU+LnPpMLmvSuE+1AXgAdVfT1F7d8eEyndGsvzF6xQW8UX/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9h8JQm53JFkss3jpRTcSkvq9+LBsANnwMRLoN5htXjc=;
	b=o7BfyNJmYc10b48A5n57MloEzOcreiQue4hVBcB/PS5Y7OXwJG0ml6bdwUKRv4KA41TC
	 CUwsUJHO0P13HV2PWUcU+Y3dcr1+UfmAK9gr3erLtmDhtvOedq6dj2iE321gPZ1q2cpbo
	 HX4j3/DNpGadQK6oJepEyTjC1ghoXcA5pWRVogq1sYJgworphW9TVhLHTEJktNDj5SPQI
	 Y2v4XQH6JNCjFGmXcEzHhqNmGxxPXaHt4cN0bTN6gwNufS/9P/V5JBLM82iWr9RXXVi6m
	 L/ie8GUj2xzBKUPumos6uw7IQEYjff2l+2NHS8IKUpt3LL9KHR3VKNdw4Wfyypn9HGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpSG+rPv;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAE3606A32D
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 13:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCAE3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpSG+rPv
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10283565e9.2
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 05:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662521; x=1795267321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h8JQm53JFkss3jpRTcSkvq9+LBsANnwMRLoN5htXjc=;
        b=MpSG+rPvvT7+YpUToJscWnj9fgICL5h92bHI5OxRpjsFXH37Y3Q+Bq2Xat3cM3rZG6
         vfiP/luagPV/9giV2yZgF/Tc+j+zpfs5cABUrcWoLDpGFCImrlKGepVskqOe0Qb1i92Q
         G8jD9/nADscOHLE6LbZ8tEB5ZG9r1k9NOSKNQ077829TXNAc+OgHVAac4a9FzerRJZXE
         3HnUDquaX6xjsmEQZLmpnyh6C0lB2bcYPafRVEHfJYpspbIubx697mSJmSIDbV0n19Z8
         0KvkS7f/fOszh3uqsy+lfxxeQA/y3sNXqZBDQvF6P9VzEr5fjO75m8pLq3gwDfsYvVeJ
         oAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662521; x=1795267321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h8JQm53JFkss3jpRTcSkvq9+LBsANnwMRLoN5htXjc=;
        b=qjtRa9tA1+NbDcVpBgBtkD6/0XkOIGreUnAw5QzAnTzTAbNdqUmk2g5BGbigdoU0eS
         OTGHYXmjGur4FawzUSJqXewObGnmSJI/K2YnGwFBDCp+mybWZNDZU2Zs3kxApsdNkr09
         lPTU3L+fyykCTnQUodB6N4UVgmxsUr4Hr46V74xSduGB32wdMy43b4EGbvy1U60LvsHT
         7HYqvuWXTDR7QgmKFYxzwEqH9y/3I+IJqgVgaop3zhxVwzIGcSdC7aP8b97REHhNcU7U
         pANM0aTmROBbcsmIMpNvO80nU76/4m4lOV+o5Fx8Kc5jdLhtLEEfAIppiCMipkYV1b6z
         SDEw==
X-Gm-Message-State: APuU4Z8t17b7NBllk2/zmvDE7a6rlyUXbEkHmjj05Pjysax2V28hY1hl
	xejd/PuSOtnHeqjemFqLTaiHRyEr60zvhACA+kY8w/oQB2lNlNCfgq1y
X-Gm-Gg: AYBFou3UXs1E3QhBvRGzOUoUeeDQfNWLDLDGevy3Hu9xtVpHC8kcHgWTzwbGaBPNYgu
	m9B4OtIQiyi8SYZzHU+zsjTXXF9x3a5lhLFP8HJeBwCDZWubj755B4cuv5LN5wuFotn+tF5q4BT
	E5b1GKYAQoZdt3tRb5AETu6NVf3VRO29l71AeIfL1b2E2DwNZsT7/H3CDok3BP/XjEsFCR4UnGi
	uADw/Ky6yqQz38I3fIhYHLWabQT85S82q1M1P8ghSx9AeMonGXAJNKLX0jAFGQ/JMCrMNxAYGaL
	sCinSZBZP6URWKC3Fmx8Kuevxc0vfjDaRD3r9RU5mekpFOiBUTmTP/7AQMd1Io9p8fr2AHvubul
	Bp1M3ljrjLsHNQUx/CcRZdB6JDnzf3ixvwrr5snhIHOgp98MCkzQ/k2gsKgnGeobxrXefr4Y16O
	mDCX/g4a/lDs9NCEtV1IoNzeP2Jqm9FG4RO2srIvFWNzF/KGUoEmlYMORAFEVntSaOXiOzezQU1
	KLYXOKX8IITaxm5DKtNK1A/OK6UGNXAd5iYsAQa5+2kDaMHrqiQTyj5prVtl778tKgHnKJBKQyO
	eN7tpGhUAnFBtF/1A1QChZ5l4TPXPs/FNEkDN3MTITdfPqDVFhQeeIPfdVkd3SCOBoEeYm5tyZD
	1YZrTStIWLLkH4ZQ8JiFmoEN1UXF+1hiqz4s70D67INsoZRsZotHOPZRXt4ff7sLNALYBsys3Bv
	x1A/fVdQ+BfW5xcZc7hduOgTMGsfrPwpr276Ujr3KYoSvo4SHJcbcOhKf38UNkVfZoXbk5tDRgk
	2D3u+4=
X-Received: by 2002:a05:600c:6092:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb55a44be7mr107658985e9.8.1794662520855;
        Sat, 14 Nov 2026 05:22:00 -0800 (PST)
Received: from martell.martell0x1 ([156.211.252.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm379872675e9.1.2026.11.14.05.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:22:00 -0800 (PST)
From: Marwan Mohamed Zein <marawanzein222@gmail.com>
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamir@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	Marwan Mohamed Zein <marawanzein222@gmail.com>,
	spidermana <xuyiwen14@gmail.com>
Subject: [PATCH v2] rust: kernel: fix lifetime of copy_from_iter_raw
Date: Sat, 14 Nov 2026 15:21:55 +0200
Message-ID: <20261114132156.49243-1-marawanzein222@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CANiq72mnB8cMmaMWaC-7pJj29JqqumBOSygnM9zA+8eHikm1Kg@mail.gmail.com>
References: <CANiq72mnB8cMmaMWaC-7pJj29JqqumBOSygnM9zA+8eHikm1Kg@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The returned slice is derived from `out`, but lifetime elision
ties it to `self` because this is a method. Explicitly bind the
return lifetime to `out` so the returned slice cannot outlive
its backing buffer.

Fixes: 06cb58b310ea ("rust: iov: add iov_iter abstractions for ITER_SOURCE")
Cc: stable@vger.kernel.org
Reported-by: spidermana <xuyiwen14@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1265
Signed-off-by: Marwan Mohamed Zein <marawanzein222@gmail.com>
---
 v2:
- Use full name in author and sign-off.
- Add Fixes and Cc: stable tags as suggested by Miguel Ojeda.

 rust/kernel/iov.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/iov.rs b/rust/kernel/iov.rs
index 43bae8923..8caf04518 100644
--- a/rust/kernel/iov.rs
+++ b/rust/kernel/iov.rs
@@ -161,7 +161,7 @@ pub fn copy_from_iter_vec<A: Allocator>(
     ///
     /// This will never write uninitialized bytes to the provided buffer.
     #[inline]
-    pub fn copy_from_iter_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> &mut [u8] {
+    pub fn copy_from_iter_raw<'a>(&mut self, out: &'a mut [MaybeUninit<u8>]) -> &'a mut [u8] {
         let capacity = out.len();
         let out = out.as_mut_ptr().cast::<u8>();
 

base-commit: ee83899302a0457a3ba47464a13e8682bd7ba27d
-- 
2.47.3

