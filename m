Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50623A1E84
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 21:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007891; cv=none; b=ma1V1m1Ysvd2at0SAST8zXLj1HxiCRW/DndG5IwE/+/fTkrO80n7yMZ8BpIIfBNm0nYoNIJHpzznBfk5athPAxBxCif0jyvAyoVdG6tExwD9S07G0IFFvRIUMjYEpk/wjFy3/yNRhD2YwdpYGZgdZiNThlat6JHudyDnTYKgjLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007891; c=relaxed/simple;
	bh=/hQM4GHCSr6VcOBhLDOEv5vQ5mrMtq8WBiFs7pSfoo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7n36DKYtNQ2KPfdPA2jF506hvqYKOBVNT3julop55stWUUBk20iEq7Vp3HP7xs+81814aRjh3ndIMrVNZhav+LkZhLMN6Qac4l29vIk+xY+7eUHQnf8xiSxZyPYIsgwYbWYpyr8jVbPbnwt2AiUmGatq0wJPe0mu6Aoz3xKyTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ry1IPlHh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ry1IPlHh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0834769f0so49469975ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 13:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766007889; x=1766612689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG4vuuyfM8LMyBZ4jMkoGBElRhqAyu5vYGrKJZnQxzI=;
        b=Ry1IPlHhHFkWTCdW7M2rlbqEBp/d3O9XqblwEqjEIIHvwQ3tZ3H+NckHTDGajkHdah
         n1gTeV8YqPm+ke6AcDDrZtxUjKF2uTHZ6Ln84eJdemkSHwg+d074Y9BulRJiNmR+cd0k
         7rRlo3dtEGeWghmdEiKU8GhmM1zKXT1Pi5ZjaNFbyO9o0eCBK/1Y8WlwxBj4fFGpIFej
         QN+uVF3okNHX10M3VyxU0pTOKzJaXgqFwVi7HfK0Uz+25j1fopxvAIlz0SnQkyj/Bg91
         U1mY110Y1CEyQjL3aCILdb+GULBom4AVXtsNG7EUZXs7cL0FLYl45g9bZjmAJ3+18ErG
         mS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766007889; x=1766612689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iG4vuuyfM8LMyBZ4jMkoGBElRhqAyu5vYGrKJZnQxzI=;
        b=sawlCd5IIXn1/xkf8dV7lwHcosNGI9zO0GGq1e9ZJV8RdTLkvkLFDjsz0MCP5IgSH/
         8uoSE2gv41KKv2aKOqMVi/uozKBsU4JwmmulG52Loy0ppxtHM8QjBkJcLlx9LS7LgTkU
         gL1wBS5u+GidntBpppuB0QGCz2sUlyyB5Cq44XBY3ahWQrwCS+z28KHSmiEzRuXoKJjL
         IFpp+lZvDcRo1exzi7xyxwMuoqc8BaCwxM9tkZN9PyBUXxwRdOch+9DoYgnxkEEeg7id
         0RTcQSi3acL+c+DfMbCWPWRsz647qxZnDRI08XXOv+Y156OkJnGmdtj0u29NB6RzHUH2
         4RUg==
X-Forwarded-Encrypted: i=1; AJvYcCXwGgS0xMmg9m/b3cODS0NiQ5dV8zbhj/1XNaYwKrIYeVhzSPHMYGsOBLtqRjHQ6KcQHOBIHUIATjHChQYN2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqfZ4mwgW0dy5Iddv0vF+Gs0QOVrCODpZ3/VF2bJCrTsBjV8Gi
	4Rrvr7Bo/3UQ5xeRz+51eCG/0gNL/+vCv3Rc231hr7FdB+VSaFkO5xYv
X-Gm-Gg: AY/fxX6sQaFWr8MzEieQPpoJGy6ElrAYvLPaJrVnTszR7Bcradz1/kGJSmJL3vK+Oa+
	aWdSXsN2oJsKAwCMnfp2b6dTEtYPZ1ksfqeQZ5DdkWc1fi2kszNlKzwAE4BV+gSLQ6AIotIfU+Q
	ixHP4rHn3lX4Sdp6+TXCTgbfySgWHMQftATFGjlmRwH4g+RUEc2emcrmta/RIkEKZIkI+HOBTxV
	60EkCIWI0nLNS2q8CydiAJCibK/gXITPRNvWyEMba2BgTuwmuGp4ZrKG0xt9WCNYdJwLMU0Ep5n
	vvYLHaz+felCWfyqNs/UVVarFpb/Y4XKGjE6LFd8j5fxba8aTKISsfCRgpd40P2azsKn8o8xfU8
	o8ZfewqhOJnyGwdbvl/WngjYg5JvuUdSWqL3dzGPNIyBzBiBSY+9ki6UzXAJL1oq+bOzjGb1C+e
	L0JXQUmz9w6w3NfczJgTOkfYi/TpsmYSktpNZRCUCYpDjyiG1fDtP+mQwRDJid6Q==
X-Google-Smtp-Source: AGHT+IFTSunz5AmLaX8ye2HYr+YnSVqEQN8/xtoSDjd39n/204pu0rwbU8dk5GL0kS11jf8lk/mFjw==
X-Received: by 2002:a17:903:18c:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a097d2a4eemr166864995ad.37.1766007889033;
        Wed, 17 Dec 2025 13:44:49 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d0888fc8sm3050905ad.26.2025.12.17.13.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 13:44:48 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: acourbot@nvidia.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 3/4] rust: helpers: Add i8/i16 atomic xchg_release helpers
Date: Thu, 18 Dec 2025 06:37:41 +0900
Message-ID: <20251217213742.639812-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217213742.639812-1-fujita.tomonori@gmail.com>
References: <20251217213742.639812-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i8/i16 atomic xchg_release helpers that call raw_xchg_release()
macro implementing atomic xchg_release using architecture-specific
instructions.

x86_64 and loongarch use full-ordering xchg.

arm64 and riscv implement release-ordering xchg.

arm v7 only supports relaxed-ordering xchg; __atomic_op_release()
macro is used to add barriers before the relaxed xchg.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 1de75dc0ef90..dcd115091c91 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -63,3 +63,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg_acquire(s16 *ptr, s16 new)
 {
 	return raw_xchg_acquire(ptr, new);
 }
+
+__rust_helper s8 rust_helper_atomic_i8_xchg_release(s8 *ptr, s8 new)
+{
+	return raw_xchg_release(ptr, new);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_xchg_release(s16 *ptr, s16 new)
+{
+	return raw_xchg_release(ptr, new);
+}
-- 
2.43.0

