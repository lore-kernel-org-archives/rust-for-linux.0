Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B80F28371
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 12:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766836840; cv=none; b=upThCixYtdKou0HQ8+EbIblSAr3cBdEWYExwOpaoYa0FlyzgWhEZbJPAGPdRnjsU/jhVY9lqrIXQTQHhpYonLnG9Tf3pMcYSaTeR0i78Z5lJ3kTt37s80y1wFKNZ9nmr/GYuKutjkua7ltdwyUX5S9fl9HjdQaYmLfgiuAcf8M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766836840; c=relaxed/simple;
	bh=2+gojjXC5489gStc9Vf4UCwASb7aFcNsuLLVuV8mSCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2okLvMV4a+LnGQ0bQ1htINYNKpzmHaq1iUxF3Rk2gaLSgqu/iQl9vT3hM5ggrEXNOMlLbHOVpi44y9L5rkDDqnorqs+evujRA/h3xlfUGFy3awQ29LOirqig4XZVDOAYx+uE0hat4bUBJG3RxuJLFKt7stjuMDBjqd6xlAjX2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctOWTegx; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctOWTegx"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29f30233d8aso92693885ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 04:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766836837; x=1767441637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+LlPF9KPxuFFiQuNb5zRw123ChrQq6zb7ixGx9xwBI=;
        b=ctOWTegx1w5/D489MWuC4c9YtfJTtyffyRqCzAqSArSwVj3qiHeoivtyXWhHlSfmuY
         oHcLrxmPlH0ipnX4EaljIF6eD+kDk8cO0Ve8ptGkl8Bho6SO8DgAW3QfadKihASwW5SX
         T2RUCvrXZCC25xz9c1rus4m1oFz2AV3ng1h6JqaaVwkB1If9uV0EDbwHM5xPAgiN7dc9
         3gHRfQvFWxuhUZ/5FnWc3rQUZW/8cTazETaP0NlUwxn4FPZ1b8HnI4hnyymop7oBY2p5
         mJgLk1VGqXro0wvyHm7adTRvLwPVPyEsybnkN580PbjVObXMEJXD4teBUBEKT+kd9YQo
         W6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766836837; x=1767441637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+LlPF9KPxuFFiQuNb5zRw123ChrQq6zb7ixGx9xwBI=;
        b=XjsSTvdAu0RAEyEhnzjSt0oe4SEZ7Xq7QjQm9NtbYHNATO0w1auvBbYAehKetqUzFb
         62uUJEpSedEuRmPsmp+AC11yiB37slbCURohk66D5ll+fKlyWN1LiszzXcUdYK10CIyc
         pICh5CqAAyo0xd/d981q1s8XXABtoLEurZJE5euqDxPdgTXihCnFOf44KONe/HN/zQXm
         qnjgyCjV5EskOND4NYTYFX43DDfyjMMOciLD3ekmdtZHrHrdxtKzBVQa8eFehykEF3Rv
         +SU0sqLhbVQbLiWve2KI//Su3VcQw1RVE6UfH49eu/nl2hU4xAfHe0WmdkzahrMRepwW
         Cuwg==
X-Forwarded-Encrypted: i=1; AJvYcCWnbphMext8CQooj7DJq9n+ByqoC4lDF4DtbGyG/3cPmj9cDUzx9gJYxA5+pP77ihwSpNd/aVcWL5GhGz4eYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM7yk5EVYAw05SpcMi0Ca+BXAKXxB963HsYdVs2VI8+xDIBYxT
	B1FJYF1J1Iksnk1tGUvQeUWW+W7v+HGD0sG5jyC0suQj1wVxdBt+HVde
X-Gm-Gg: AY/fxX6DvTraZo7t6U3N1+TUTZfqKcdSCdlOd4vZY54PWYVIfLrupkekTu4D9d4jhkI
	nEScw0n2t0LZrfw5jCNPRBPFmD8Gfl6SNOW1xxtQ4vNmoMuogy/YVG+WH9wfAI7P8KFSY8EeQbc
	j6bFKZpfAjTnQiczC/6i15WZldcdt8oQ8G7YQYeTkc2A+ct/uWyLnk8ZMZdrV3vWf1U2QNVC9Hf
	JlmR94PI+TdDUSPPXeHs3UYDra+nynU3eWVvW9eFYy8PBjXRuNmNMOsVSK5EapNuEhjZVzoLqOn
	i4MLhna+8rHYy15cDOjPPEzIEmRQXQU59+nqO9nJzJikHqfKBJxVUWTo4C929XttIfSl2076nOp
	f5BoWTth0/5tdZEMVbqUH7pHJZs5sHprv+Ez9IlF2lXIoEXgqOcivjOJCinT3xhY9LGkKwkpexL
	cmyiaz+RL1yH4SXZMczxX4/PW9U2+Dxrx1CkQH9EnfTH/KzotaI7l/0zIhKjSwxw==
X-Google-Smtp-Source: AGHT+IGg4GXny48XkuPAKbQUa4NfxQCd6QV2NeuR0YiaRH+Y9p9r1rs466sAvQQY/Rn4POhBOpPbKQ==
X-Received: by 2002:a17:903:249:b0:2a1:4293:beb9 with SMTP id d9443c01a7336-2a2f293e220mr190872155ad.58.1766836837525;
        Sat, 27 Dec 2025 04:00:37 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbcfsm231033165ad.50.2025.12.27.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:00:37 -0800 (PST)
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
Subject: [PATCH v1 4/4] rust: helpers: Add i8/i16 atomic try_cmpxchg_relaxed helpers
Date: Sat, 27 Dec 2025 20:59:51 +0900
Message-ID: <20251227115951.1424458-5-fujita.tomonori@gmail.com>
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

Add i8/i16 atomic try_cmpxchg_relaxed helpers that call
raw_try_cmpxchg_relaxed() macro implementing atomic
try_cmpxchg_relaxed using architecture-specific instructions.

x86_64 uses full-ordering try_cmpxchg().

On other architectures, try_cmpxchg_relaxed() isn't implemented; so
calling try_cmpxchg_relaxed() ends up using cmpxchg_relaxed()
implementation.

arm64, riscv, and arm v7 implement relaxed-ordering cmpxchg.

loongarch uses full-ordering cmpxchg().

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 589c070f589b..3a5ef6bb2776 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -120,3 +120,13 @@ __rust_helper bool rust_helper_atomic_i16_try_cmpxchg_release(s16 *ptr, s16 *old
 {
 	return raw_try_cmpxchg_release(ptr, old, new);
 }
+
+__rust_helper bool rust_helper_atomic_i8_try_cmpxchg_relaxed(s8 *ptr, s8 *old, s8 new)
+{
+	return raw_try_cmpxchg_relaxed(ptr, old, new);
+}
+
+__rust_helper bool rust_helper_atomic_i16_try_cmpxchg_relaxed(s16 *ptr, s16 *old, s16 new)
+{
+	return raw_try_cmpxchg_relaxed(ptr, old, new);
+}
-- 
2.43.0

