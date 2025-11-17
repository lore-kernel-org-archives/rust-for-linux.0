Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBCC1367
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 00:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763338274; cv=none; b=albMWKjsa6ayYrO72V/w2VUNzx6aR6TTU6XXw/BGWG1/AuTAujVBwAgQsw/DEFRhmidJFcTBgEO/iOoj6UbNJxkTCJOhbCCJ5rl/MDTKQtZ7apU8r2SmFaTAhixU7Tycn1tdW5t532l88qiD1mOGoOrXpgJr/TaZ+vNU4a/WwgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763338274; c=relaxed/simple;
	bh=nYdNHQcvSPrgTjuenMnowxbvcPJhJpSE/evE4hVypIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1u2KLkFiz+H2bYhj0cnf6ZVae0NLNZh5qbLAYVuJPzxvxbbccjL6DmZo6TrQIEjxMBOonYIuiHpQamwtMOBq7ER7e74TUDAwFkyEkcwc6FGLQ2r+AqJ3n9hTbOEXLfj/ksHWjntV1uqeziEa4070WR63Lwsqffck5XdYCdWxFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7YZzNWn; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7YZzNWn"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2957850c63bso38303305ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 16:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763338272; x=1763943072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0sO96BNN76x3/RgDvYu8ryX2ZAnoCQGtIVSgEyiJCI=;
        b=V7YZzNWnDn7cOYFthWGokcouBurnMpWhAcVvt5fydESP2u4+YIvvdSZOrmqcN1ELwj
         CLqHkHmj9EAx6B/Bpq5nxIWzDR3JTxsN2+29xbUUJ0KzsL982BxBR9V4l2Zc5+EnLDVO
         PDxqyxjdH5LkytdW+Ru/Av5muMG45H436rSnVwVHQkHWy1Mk+amLRsdKUeOs9Ezh9PSR
         vpgJwGch0dFTj4WETnkIhJPsaSipsOmiJTEja9pNd7NoTJ25t3oqHSN+yCZQj+VF07Of
         O3zHlsF3ymHOws2q8FyygLLHlNmtlgWJQIhJUvi/79Py/CHQ9CNA/R8VsHNS9N/TdjHE
         oAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763338272; x=1763943072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V0sO96BNN76x3/RgDvYu8ryX2ZAnoCQGtIVSgEyiJCI=;
        b=GJxOuyS7AypIEa/JDGj6o6pOtJ2EhrxHuNf1q/4MrBMND+Iob7hbf3NzK6tXRyKkVq
         f+XheSkGmddE9o7LSeZMdIOQca1CHh3E35UfqQ2ggGcBfBphbUOwYtj3bzlQOUVJHFkU
         XMUi+Q2RzehSwnLbBVCAM/S891b/OUP/gb5a2lb5ppJ3Gvxv1sxtKb/iSSN7nG/acWN3
         JzNBAnVvxDefvAS+/j9KQCHqVMiRXyC7bke2z2UuSoS8AIOotaqptJ9L/oeZRb/g+6iS
         ylfhmBQKbqdTT29vF8UPtnoYy3XOF4ipMPa2QyhTvJCDKsGvyc4G6oWwyR1MlgcsmSOS
         cSog==
X-Forwarded-Encrypted: i=1; AJvYcCXOyowG3+N51BjyT+BZxe6bhnaVzKvpUPJmCXrNcGQXF5fJ+f3RQlpC3wr6/e/mbh2mE1zw2m9hce0FCA2aFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM8Ni6tL7FocTsaPO0gcwj5kZYtadnKLRijhUxFEpl1sj8tBN8
	p5WiyzQJNoIZdnqfy/1/upwK/X6Jhy6CiZy+2Y00aILdrn1U7kvbr5ku
X-Gm-Gg: ASbGncuqrIi080WfuFb/ZMOrUEZxDkgy8vymxRLITyNBR89M40jConeR84d2lGDrqkc
	qRdiFZnPCcK8Zu26tXeOlNAXPVH2ghIICPsQ+CG8w4QocM7X3DIf5bvVB0JchnGx9SeTr62ZI+9
	/zu9tDIwrG8jtFlUW2bXO7lgCr6z0UC6700I/w5xD2dI5cJA19TKQNMITUOsvko8zt1x0SlmLIW
	3o0CPPkxZ7iDCc9IEBZT+4jbmqhhPz/GZ8F6trdpFEI0e2CeOI1yzvPC3DYsDpMfPerpwesY69c
	ljcEJUhJyd9tsaucsZ0Jmyni4p7auH8N2S0BKS2qB9pWa+cAEmA9B1ra6WS4QH8+lSj0BOQAZpF
	/YOfeIEIwrZ8YY4xXGsPpeojzW/nYuMqUPRT9IZRtlGguwtfdkY1G2EpGg6oNUBUzhYoboAyH1Y
	Q3ztFptErEPaN6uDO2vq/Hnc2X7KFw4gFRvvFgPyYLnrTgPbPvplHCdECikWc=
X-Google-Smtp-Source: AGHT+IFpwLxp0XoU8N4AJHzF5CCtibH8sI+jS5u2Th+A/+Jo/JCbEbPIoWMPrBr3KBoUyR4hb3tBFA==
X-Received: by 2002:a17:902:cccc:b0:298:639b:a64f with SMTP id d9443c01a7336-29867ec961dmr128186415ad.6.1763338272104;
        Sun, 16 Nov 2025 16:11:12 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf0f8sm118374365ad.89.2025.11.16.16.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 16:11:11 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v2 2/4] rust: helpers: Add i8/i16 relaxed atomic helpers
Date: Mon, 17 Nov 2025 09:10:33 +0900
Message-ID: <20251117001035.4068507-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add READ_ONCE/WRITE_ONCE based helpers for i8 and i16 types to support
relaxed atomic operations in Rust.

While relaxed operations could be implemented purely in Rust using
read_volatile() and write_volatile(), using C's READ_ONCE() and
WRITE_ONCE() macros ensures complete consistency with the kernel
memory model.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index d05f6f7ba10c..ca22f57f37a4 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -1,22 +1,43 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <asm/barrier.h>
+#include <asm/rwonce.h>
+
+s8 rust_helper_atomic_i8_load(s8 *ptr)
+{
+	return READ_ONCE(*ptr);
+}
 
 s8 rust_helper_atomic_i8_load_acquire(s8 *ptr)
 {
 	return smp_load_acquire(ptr);
 }
 
+s16 rust_helper_atomic_i16_load(s16 *ptr)
+{
+	return READ_ONCE(*ptr);
+}
+
 s16 rust_helper_atomic_i16_load_acquire(s16 *ptr)
 {
 	return smp_load_acquire(ptr);
 }
 
+void rust_helper_atomic_i8_store(s8 *ptr, s8 val)
+{
+	WRITE_ONCE(*ptr, val);
+}
+
 void rust_helper_atomic_i8_store_release(s8 *ptr, s8 val)
 {
 	smp_store_release(ptr, val);
 }
 
+void rust_helper_atomic_i16_store(s16 *ptr, s16 val)
+{
+	WRITE_ONCE(*ptr, val);
+}
+
 void rust_helper_atomic_i16_store_release(s16 *ptr, s16 val)
 {
 	smp_store_release(ptr, val);
-- 
2.43.0

