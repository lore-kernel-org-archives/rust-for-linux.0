Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCB025B08D
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783758222; cv=none; b=PsDQSImmEJ1IuuslDIjh3vqoLIRoO8Mw8piqzeFRPUhQq17gHPLOmhZJhgraxdbvKQrYvvgJMPPgFrLbAPD9SmeuOlEQtA5I3fjHBJZ1+MqFqcR/dPb7K3lqFE9vpmlWgSuEcqE+HzDMeO/OIKQ4WFYOoPooQJdUUwN24RJC3vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783758222; c=relaxed/simple;
	bh=+sH05t+rkEcd4/AW+sYfGfdMMofZMJPsPdVovn3MPvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RQGK/nclkVDp2KD69TFGcjMCLkMokZx9/DvZcRH8S/2fzbm0QmfwmEk5M8V1a5xu0HkoAZNEZ4Ho2tknkzrFWb6pSQAPw2Bp8NIM9XdIukoEo1Uhia8Ywe9B4qwLTSp+nm3xYPjT3VGOsc6E1HB0V/ZMfa2EzaHgwtg7ZAJO828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etvOcVCJ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etvOcVCJ"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-920f33347f5so86563985a.3
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 01:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783758219; x=1784363019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CT+jeegMqPPBfzBF5Jjm/LQqdjJyp9HpRZbj0A6FnQk=;
        b=etvOcVCJebedyXulgp8OITQrFlNxw0Ji3tn5+oF9DBUK3IV2NV7vlCdq3lOr8NPnNM
         9PT0FHWjZP4Rt3pgRuU35G40JU8xwQRwa6B3SlZeAQXNO7zCLZcJr77QCdoG9C1yw9Kq
         9gHOrhSAH/6i/RVumo/WiP8mnomBjSA/ppLrsrbFQIvfy5xodsBF7WGB+yUXm+5go+Ih
         ixweWcfWUoL4XFFJ1qLQOrJn39V0cx1NIrQPY8pmaCkhi5fSch6T6BFdcEV/bY+6YHJu
         0TtuMaLCjYIsx+WZCLdfqwcJDT1nLlCB2OjetJig4FfHVzRrW2fxwGCfpeb83hfEst54
         IoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783758219; x=1784363019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CT+jeegMqPPBfzBF5Jjm/LQqdjJyp9HpRZbj0A6FnQk=;
        b=B02lmtFmY65vevBpEuByzQgaa0bC9NDjJyYoPe8/IOp571FZjqJOVevZNnqrAQi9rk
         G5VngUsc9edimict0Ij1XHQ+a9hXNoZriI+54k2C3LJe5ZPZJiohjvqamllte4/afYB5
         AtM7Jcs52EhNaSkQA0mrgABiR1TFBlyy89fJBhH793sFXUbjCs9SIV0BNBObIipbCNzA
         ZBo4ZVL0tgA5Eta539lG+rlLcVNYZyUoy5W1rYATC4pprQgKBDaSM7cPNMeLJBnuQ6UP
         bGTuBu9OKODTLPqxNqqd+FcHNFFjFCamhUlIVEIA0EX0JtbHZ81cYqSi9d4B/PWPD3RG
         6Hqw==
X-Forwarded-Encrypted: i=1; AHgh+RrH0z0rXkK+XKM0ML52h2vyHLzAw87w69INQcrpDYro6Q4t1BOdDaCtv8E6AMrI2/kjRXU6+lD1xY8STpD2Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQH7EGykNoBMcts3QWfCCiEsjNUi7AfzqvpKbGuIEWlqweuD+R
	eGFzlNMoxbzGoKOyKQnrbfAIkt6fkdoz4ZprSWsN39bZTWsI6yMcwqGj
X-Gm-Gg: AfdE7ck9/eUbzO/0Nzjapi0tFmQLVk5W41LIot1bzQAhQCqAEh7ICZf4wgPbX7D9vaW
	mYzdKK5VqOmxM9Oj+IIVDHUTjz5TCRzGNb4eyLtAgX5Ty0p/Avf2X8kawtiRlVKQ9uUXtfaHiAJ
	SeuonhXwz+ySUZpGvCkkd2Ls5tBLogcUZJDIGxbR4BICPL0Up7jxLf65dQmvsxwLugXqRANw+Ny
	eMPxd/n5SQGm3tJ38KxiBaVC4Nact2fnY3vD82hfFrbI9pQ7MoeERnfOkfJGjCblrf94+cPcV6o
	JUUlS+4+w5d/zjW/Xyi0M+qgBHSGO0fSN+ajyvvLt4wyDu9owtXYD1B4JXiwridmMavvU9v+8TF
	SE690DhqUkVOolEzGBjpazzzCPK4dZlfXiVpVb0pRJxYowR5rIJU42RHDLkGWfM6fZP18wUjbe8
	D/vo6MCOQBWHZPDi9ypjZK6ell5diNb1tUi1FcsQkG1/XcJDy4tkbcgz8qrnCmM+yLhUnC36SVY
	Pp3Ee7Wcy2U/FLSic8gg/c1SyZ3O5Nv7dXr0Zc+hqJfb2nypSmXI23JgAM=
X-Received: by 2002:a05:620a:4055:b0:92e:4927:1ff9 with SMTP id af79cd13be357-92ef2b7de3emr249926985a.40.1783758219332;
        Sat, 11 Jul 2026 01:23:39 -0700 (PDT)
Received: from oracle.tail79e65.ts.net ([129.153.156.79])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cfcb0dsm404629085a.25.2026.07.11.01.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 01:23:38 -0700 (PDT)
From: Kosumi Chan <chankocyo@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rust: impl_flags: use bit helper in example
Date: Sat, 11 Jul 2026 04:23:27 -0400
Message-ID: <20260711082327.3062227-1-chankocyo@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use bit_u32() instead of open-coding shifts in the impl_flags! example.
This demonstrates the checked bit helper and ensures that bit positions
remain within the underlying u32 type.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1244
Assisted-by: OpenCode:openai/gpt-5.6-sol
Signed-off-by: Kosumi Chan <chankocyo@gmail.com>
---
Changes in v2:
- Use a full name for the author and Signed-off-by identities.

v1: https://lore.kernel.org/rust-for-linux/20260711071551.3035420-1-chankocyo@gmail.com/

 rust/kernel/impl_flags.rs | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index e2bd7639d..fdf44d5ee 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -19,7 +19,10 @@
 /// # Examples
 ///
 /// ```
-/// use kernel::impl_flags;
+/// use kernel::{
+///     bits::bit_u32,
+///     impl_flags, //
+/// };
 ///
 /// impl_flags!(
 ///     /// Represents multiple permissions.
@@ -30,13 +33,13 @@
 ///     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 ///     pub enum Permission {
 ///         /// Read permission.
-///         Read = 1 << 0,
+///         Read = bit_u32(0),
 ///
 ///         /// Write permission.
-///         Write = 1 << 1,
+///         Write = bit_u32(1),
 ///
 ///         /// Execute permission.
-///         Execute = 1 << 2,
+///         Execute = bit_u32(2),
 ///     }
 /// );
 ///

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.54.0
