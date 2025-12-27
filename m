Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA221A073F
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766836833; cv=none; b=Bkb62wjPB8UyE4PdJSw4URF6dJIGHIG1XPg2m2P1dfEpACyRMMrOsskn0amEF8OGpYukVVJ8pHthAIq6SC0K3zMvoLVPcnGIeq9kYQ5/n+JpMXyb6cpiZSuCL2QsLWLir/+7H50xq4/0Gelha0DOJSqa7WpPqL4CuCBLXA447vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766836833; c=relaxed/simple;
	bh=NBPN+y91sKNZcaVYaS97cuL5mgiLSQVqWs78lHNDxXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvDJX1TYH9fhU80NvSmoU3++56c4JUh7Bz6l+fVuihTrJmeatCFJl+5jfWM55xchmuLTHfRUWf+PkCRx2nuMj3aYhaEOJvalqi1E9hMlSgtzAGi5IpIJBWyvlwFupDPPblEorMo+E2kCBHa1KAkC3laHKdt8P6z/O1hJdiAEsU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbsQ/fNy; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbsQ/fNy"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a07fac8aa1so83622985ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 04:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766836832; x=1767441632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCzDGurgT3NnrlDgTv+wtsy6PG3zYK67/4czNPTH8/I=;
        b=JbsQ/fNyuVELk95M45FdRUs6IDSl7ILFpCuWOJZHINW1hYeLWD+TJhSLWY74hU3Ji3
         2I9QgI9cqnZZhgv7G9fsRioX7qNBOcLwHm45YDSOaK1bVtT995R26Do5H1w3zoiL9I2r
         F+rpCGVQ10jXNGcm9ldewvS9yCuGO1P4wwbUtnRFgDqlF5w64lde4qHdX8B4b7IwRDoQ
         po9X7NyWFmk/x3ZzdO6Uz5YKCuHK3L+V9AiDQteVUdPjQaYjAZm6ydr4m8HHLSCgjch/
         ONibWqJKNdeRwwfF5or+rsqNn0zsMWEBYuqdHPvkpxPF3nfkzt4qW6Wk7ma4yVHu4nn6
         ug+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766836832; x=1767441632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hCzDGurgT3NnrlDgTv+wtsy6PG3zYK67/4czNPTH8/I=;
        b=AfZyxd4/o87a2lwCCzWvoB1ZG76SyhKLisdWQrqQnKu8Iy4ppPk4SHQY5OgY9XhiwT
         SfQGMC8OqnjP1xInAA2Mj7LSWQ5lTXFVON9tzjKj0dZEj5W3TpJ2m1ThLoBH+w1yIXAW
         EFcqW+Wf3QCM3Q9FHBHBJVdBLco9oKbtsjSuX0XqsFc92GAdRm+hRa+YGTa8OqkUPUck
         SyZpkPOe6cIqBJgqnGyRVLEvR/eSLVXNcScE7X42SmhgVkcBTPza5KKuxmVjFbRtcZEk
         hQiBeSs2G/pZoi5dMwdsjKAt+yAzjQSlQTt0wNGPPsTu15Vs6f59Nwvgl01ZqWHpKIzG
         xLaw==
X-Forwarded-Encrypted: i=1; AJvYcCW4XHahEOhAp68ACymz9bINKFI5hU6BT3OSVW3EaFbdyL7EYN9732Gei/d5YfzMVQ1buP5kYlO6BCm1MY8lqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkFbKIyFXnB4DR5Yk02zkpo7aBJ0GUflK+wSy2VsOkoXVFsz/B
	5ttiAbrvXXOp7OTDrn5asiy1ttWsW+Btf4vQyBmvkweVjOuRTeDDVI2o
X-Gm-Gg: AY/fxX4mTt34c8UhNplY2lVkWN/mC/JX/w+VXDuCsRaKOYxkcGmV2wYibz83+K7+YS6
	L6/3S4RdYxzt16/kZakn3aUVpYks1miiWpOpPI4eC0lx2sNZqVrI/mbO8/WXPxXXnT81wFZUHxU
	sueVrGuwY1Zt3Tbu7wkdh4VPHZL7A1Sb+S+7q/BMOkNJYWtZR93VTzQdIufkDBnGqqmMMVlcIiS
	KUW1wF5vYLoy/RfLgmEJhSkZ6QnXZUWQZqg7y9WBqU6Rg9pdVF1MtFHISqUW0fK2JKrr1cL/fiy
	A8nRybuJtW4ryXIHgbtPomC0GTkGuakvNTIdrSR7dp2J9omazp9drzltqpZTCojFcdlbot8IpOB
	sdPecTdEqoeZKp2L6CSYj7Q5/+wY8/rNOrG5npQDs8rmraf7hFFvYdTG9EcYxxMdeRuPv9eowFW
	9uIHzSSY5+DZTNpxScHEpGwkVNTT0Ty1vDWUMM76ZbNhdqTmX8bfAs8V5+DxgVYw==
X-Google-Smtp-Source: AGHT+IHqqGP9aJCyf1v+AkR3JBOeT81xZsuW5irTGZbouwmiPTzcSDJoLmZ36jJsbEr/FWa2YTtDRw==
X-Received: by 2002:a17:902:f68b:b0:2a0:afeb:fbb6 with SMTP id d9443c01a7336-2a2f2202efbmr224735055ad.8.1766836831684;
        Sat, 27 Dec 2025 04:00:31 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbcfsm231033165ad.50.2025.12.27.04.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:00:31 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v1 2/4] rust: helpers: Add i8/i16 atomic try_cmpxchg_acquire helpers
Date: Sat, 27 Dec 2025 20:59:49 +0900
Message-ID: <20251227115951.1424458-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227115951.1424458-1-fujita.tomonori@gmail.com>
References: <20251227115951.1424458-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add i8/i16 atomic try_cmpxchg_acquire helpers that call
raw_try_cmpxchg_acquire() macro implementing atomic
try_cmpxchg_acquire using architecture-specific instructions.

x86_64 uses full-ordering try_cmpxchg().

On other architectures, try_cmpxchg_acquire() isn't implemented; so
calling try_cmpxchg_acquire() ends up using cmpxchg_acquire()
implementation.

arm64 and riscv implement acquire-ordering cmpxchg.

loongarch uses full-ordering cmpxchg().

arm v7 only supports relaxed-ordering cmpxchg; __atomic_op_fence()
macro is used to add barriers after the relaxed cmpxchg.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 9d62f659c8d2..69a258ebbfa0 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -100,3 +100,13 @@ __rust_helper bool rust_helper_atomic_i16_try_cmpxchg(s16 *ptr, s16 *old, s16 ne
 {
 	return raw_try_cmpxchg(ptr, old, new);
 }
+
+__rust_helper bool rust_helper_atomic_i8_try_cmpxchg_acquire(s8 *ptr, s8 *old, s8 new)
+{
+	return raw_try_cmpxchg_acquire(ptr, old, new);
+}
+
+__rust_helper bool rust_helper_atomic_i16_try_cmpxchg_acquire(s16 *ptr, s16 *old, s16 new)
+{
+	return raw_try_cmpxchg_acquire(ptr, old, new);
+}
-- 
2.43.0

