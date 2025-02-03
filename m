Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DBE1FDA78
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Feb 2025 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590359; cv=pass; b=VUCowXlImpUVXtAuxM/3goC+BdiEh/oloFxdljqtDmQI+2n1nIpyap3ArVbqzCKxqNbKbxLR+1okw+4c0t2H1t/3OBZhZmzs6QfysDOcOo6bqzIU9PD8+jLkM5oalLkBj8+Wu7uf7Ggr1BFg9C/PH4hnQPCDLLEQcB3Wq6aAV+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590359; c=relaxed/simple;
	bh=7yVn+X220mqAzr++njqeukxJJHoMpAZbRdznsgNCeUQ=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=aLzSReUv5i+vGDIU6QBzsNzyDiK+T0cLuooER+ZfxUr89m1gunHZsC7cvrpMRlKipqg2fmnitFoWwAz5uaq3/6RYnzeyIl5jbbCtzsPVfoi6Usgzr+3kYX75wLBPFPUvfunvFBhz2mpl/PBSchGHaxcePXkVGMd/wePELGJqtQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=nCiQtjcK reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.218.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="nCiQtjcK"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5A5772C4836;
	Mon,  3 Feb 2025 13:37:26 +0000 (UTC)
Received: from fr-int-smtpout4.hostinger.io (trex-6.trex.outbound.svc.cluster.local [100.126.223.123])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6EA732C1B7A;
	Mon,  3 Feb 2025 13:37:21 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738589841; a=rsa-sha256;
	cv=none;
	b=CONxSNV8yrclgMkRN3sH38zHIMQTPjSCDuaVeT0RcX1Zmi7DlL2jmi6KvZA/7eOTs236se
	8bj0C5jGCPuWXt/YuNTUVIAWgOSNkLEj8VB0xkRFUaqB9cRdi/S7O0vapBLOHFlGQgjMXN
	e4wF9PZ2KtcOhUPOGFTlefB4iXE/nutBfdT9zNqLwV32qTCZorl2OYjeyRcnDW9qs539nR
	Eef5RVDrUL4GU5tSqXWtxOtlTEs+i7ltONrD7Otq5zIv5zPVjlLonQOudepiHdVZTSTgba
	p+V6JVxvY7EgQAMIQWUS22StVxHalmuNAf5I+9uT3G9sQYWtZnAQT1/dsmpYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738589841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=oytPgXEwPJrOTLwq5qk1T2t5czkNHjhnfboT29qq2Ks=;
	b=VrF/mYxDC/94xq3QkHxPUp+G/xU2Q0qk0FZB2LMoBOcJIwqOPIhoyhJ1NLRRYHg88yv6X6
	44n7lS7+w2/eFW5NRJ5Tp2fFR4JG6bHh2QI4fnknpnHGgEf1e2KX3xSrUPfWpBc7J7Khfx
	rEAeQWPlrGW4OVfoT+d8xKQcM148osSOhyXvLMqvZocTUrk8lKr8Mf6GSDLwbyFi8+7Qq0
	2kyq9QznYoRKMqBW8Ve7toKDu6YSBfyqh85L/YzGqJYhBxuKohbSFJv0dosuf3OcZQ5GjO
	6T8Xn2uQqm0bovIpeRhYs+MnxpA80FaPcewQIqlTmqlJ3Szbz8csAHG4akP3LA==
ARC-Authentication-Results: i=1;
	rspamd-8586946c78-nrtrz;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Well-Made-Quick: 336cc15733ab2817_1738589846103_1250276306
X-MC-Loop-Signature: 1738589846102:4128927352
X-MC-Ingress-Time: 1738589846102
Received: from fr-int-smtpout4.hostinger.io (fr-int-smtpout4.hostinger.io
 [89.116.146.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.126.223.123 (trex/7.0.2);
	Mon, 03 Feb 2025 13:37:26 +0000
Received: from ak.localdomain (unknown [62.182.99.47])
	(Authenticated sender: kurti@invicto.ai)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPA id 4Ymnby614Cz2Sf4q;
	Mon, 03 Feb 2025 13:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738589839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oytPgXEwPJrOTLwq5qk1T2t5czkNHjhnfboT29qq2Ks=;
	b=nCiQtjcKehMfBd0UVYs0xYQmzVLzLNxtXs8ZN6BoVlCTP0WGMyRHbMo2YJjg/LnllF3u5X
	WeYx9RY31bQXMX1/hVvyQu0QaHH+6lpxa3Z/F3Fm72IAzN20ld8xRlqGM2TKdeXhoBaf1D
	errAbzXjavG+Xgayf768UM1J4gOenO4UDhglOAvCvLPTlbmOD6YhQnUxu1gVpWWL7F38j3
	/vi78JR1qunenG2iCe66GRwvUd3ai3eVSe9kne+aPA6ciB9epLMgT5YbtHHPnz9zbvWrNN
	uGM/GQNnQ1YdMROEbuVYLKxeCMyBD4OpYbC4DDGlNSWVg4wgOU5c/6nkS0fLDA==
From: albankurti <kurti@invicto.ai>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org
Subject: [PATCH] rust: printing macros sample: add missing newlines
Message-ID: <20250203133717.264522-1-kurti@invicto.ai>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Mon, 03 Feb 2025 13:37:18 +0000 (UTC)
X-CM-Envelope: MS4xfCQQgtDrk/tXOSOd1YIawWFAJcr4Pky72le02lKSq0Z3Oaal8/KrTH+/I6kkf8GMi9vnVTGcvonVaZI+f6xZdCbkGWawk8tc9Uy3QpDNRosnZLGK/HLO zAeIXc0PjnKYSyTr9hCAx6fiz3ovv2yf33701ueD6mLDG7NSwGNlmT6UmhMmaPGGpdb652XwfuXm7U73dJZXskcufgwWfcdlaTUR1SXv41E+9KSQ//hEJXKm
X-CM-Analysis: v=2.4 cv=PMNd+uqC c=1 sm=1 tr=0 ts=67a0c68f a=lYFjNvm/SGFeYHipu1NBKA==:117 a=lYFjNvm/SGFeYHipu1NBKA==:17 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=ej7u1ndXoedFt1_pqf4A:9
X-AuthUser: kurti@invicto.ai

Fixes calls to pr_*! to include \n

Reported-by: ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: albankurti <kurti@invicto.ai>
---
 samples/rust/rust_print_main.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index 7e8af5f176a3..7ef3cecc65a1 100644
--- a/samples/rust/rust_print_main.rs
+++ b/samples/rust/rust_print_main.rs
@@ -23,10 +23,10 @@ fn arc_print() -> Result {
     let b = UniqueArc::new("hello, world", GFP_KERNEL)?;
 
     // Prints the value of data in `a`.
-    pr_info!("{}", a);
+    pr_info!("{}\n", a);
 
     // Uses ":?" to print debug fmt of `b`.
-    pr_info!("{:?}", b);
+    pr_info!("{:?}\n", b);
 
     let a: Arc<&str> = b.into();
     let c = a.clone();
@@ -42,7 +42,7 @@ fn arc_print() -> Result {
 
         use core::fmt::Display;
         fn arc_dyn_print(arc: &Arc<dyn Display>) {
-            pr_info!("Arc<dyn Display> says {arc}");
+            pr_info!("Arc<dyn Display> says {arc}\n");
         }
 
         let a_i32_display: Arc<dyn Display> = Arc::new(42i32, GFP_KERNEL)?;
@@ -53,7 +53,7 @@ fn arc_dyn_print(arc: &Arc<dyn Display>) {
     }
 
     // Pretty-prints the debug formatting with lower-case hexadecimal integers.
-    pr_info!("{:#x?}", a);
+    pr_info!("{:#x?}\n", a);
 
     Ok(())
 }
-- 
2.48.1

