Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5859B2F066D
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 23:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762383751; cv=none; b=LhPlDJayJeAZLWCjU4dHLyMUjNCQIaaEWQ9smEog94+tOdUEmRp7Sz9EwY20cuxKng9/Y0xYwnKe8nGBX3R//vkoTP68c3grzWIRxYxn9LyPcaPe4uwafCLqRyEpMvkrHVQyuVBvC0NeAKXQBaP0lSH702mT2x/Aeo2HX/Z+qrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762383751; c=relaxed/simple;
	bh=RzgX0CxF7lpE2xBLdNMOZqdleGvbOwroWvnQQx0XUzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRkoIvf82BhzZ0ALtZMjIUaXFS0/uYHExEPcx9ptEOABQ3kamQowz50N5C77Yk0afL64HcwJ8mKb/4/pIObd542lADPY5GBWLlFSOSuyEZzOHBrOjHFVBshKt8OSeMBQk2qGtoiiMHXkgQ8FjcRmEpFwbCNLD1I8Mf9tS5t/m3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xurdhus7; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xurdhus7"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b62e7221351so271425a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 15:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762383750; x=1762988550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tDmiGouP/lZqmqIQ4xLpqbP6meWUNvUiS6WQT0r7JQ=;
        b=Xurdhus7wqBhpTZcVHR93kfwVS1H+7KsZWpsGgxkOAkdu9lACI3zr74u0+YTjuT+ys
         +2W8p5ou8jJRooQeg3djL18LayhG7izB7+47B6z+f83dEkvT7ZvnE9Zfj81Rj38zRwmk
         J7rVfXLuUKym2sN72RUZyH+MxP06gs/VSE+wu6cBSbzVSVJjFnCC/E/qaC91lq9yKr/7
         Zy5pGjDt3689V4Om3uLBTO3y8XnGOSL0KOg/4iDuoONYPpYjU5dsdWKDNnnw0SXDopR9
         S/rPJ3hokmoCB2evS9JrerCaJuUi+jLXolYA016U2BC0y9lN10ER4onGttsU6yrgxdBy
         7Jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762383750; x=1762988550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tDmiGouP/lZqmqIQ4xLpqbP6meWUNvUiS6WQT0r7JQ=;
        b=dwgolbWJyArYIlYeie22rZdsu+DhT9fkGHaWeKXoiYElN6/bBwBqqmgyQy3F3Guimk
         a8/5PpbvYJHLXRamvVWXiVQIg6ZYdqpBN5kmuV1eBHth9VWebEL9trmlk3Fo0Lr2sAwg
         xTcm1Maidhnes3fcEj1p/HpZmlZbBWUFoUM5Zn144RCLx3zi2g62K1WO+queBuJvgGig
         vr7C2Svuku6uRGUxsIVyo2scy9j61Uwd01loVtB5ukGn3+Zrrds0YizaorYye+RFZBp7
         CrKJeoWKW0xTrrVQBT/IYQZjmpIFBASRDBkFemCZABqX1stuykrb4cvd/dDGmgooJRc0
         iUhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/xZ5kWBaVa/QArSekNsproiygyGMmzJB5dLJ72D3ST9evbhb4ifxxTmrCGCPAXXdTkeo8WxrobRQC7CsCTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy16YvgjQfgb1UX/kvBgSwdOufhN3ES1Sh3lCrCOdor9rAlFhGf
	yKZJcpqTZ8fzKSwpF/n1wnq3sx9yrxDguZ98Z75ftsCb7kfvIrf9Piob
X-Gm-Gg: ASbGncudj7El4mi2LSeDg6rMEZozErLylPmfBLexwC47vsu+gqMCuG51JCxYHRn8r6L
	xTRynx96rmgTXKAK2RH1qe7E5+/gG5B8MV/m/bxzZJdC/T3NDwbhypOVcb6mLMkN3YSKgLO3oGx
	ksRZKFSismvvomeuJanfCHbQUSsJHsyt5Lzh6fBoaa2zFOSvoAEQ8kVe9CqoXnbjMtR0v7l7Xf1
	xBiIHDU92dGeXrD8GCZB/WwZaoSe1UMj8xUrdVxgpYB8bkud5taoyVciu/kseaHTN51jFNejLjF
	DdKvgtqJ3ShpVkSHO0CvqqH6yyrs7s6ZTqtnfKNCYOSb/QgmhyI1GrxNXZMjuGm7XNUPtXwpn6q
	ypQleoinE4xL0cSyWCZMlL9NNEvyLHedqjxyqmpUMQFyru3zFO71xjSm0hDVb71aq6U1Jd6jQOF
	EXnq/hFiPVAk5/+fmpBBQStgc=
X-Google-Smtp-Source: AGHT+IE8H0NdUg/c/thzQbZRKZeZtzM2gt17e0QQN2RbXKr1KgVctPF1CYPo5o3JzV+1jhxViXCLvA==
X-Received: by 2002:a17:902:d501:b0:295:34ba:7b0b with SMTP id d9443c01a7336-2962ae0fba9mr72522505ad.35.1762383749590;
        Wed, 05 Nov 2025 15:02:29 -0800 (PST)
Received: from mitchelllevy.localdomain ([131.107.147.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096839asm6325645ad.13.2025.11.05.15.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:02:29 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Wed, 05 Nov 2025 15:01:15 -0800
Subject: [PATCH v4 3/9] rust: percpu: Add C bindings for per-CPU variable
 API
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-rust-percpu-v4-3-984b1470adcb@gmail.com>
References: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
In-Reply-To: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Tyler Hicks <code@tyhicks.com>, Allen Pais <apais@linux.microsoft.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762383744; l=1564;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=RzgX0CxF7lpE2xBLdNMOZqdleGvbOwroWvnQQx0XUzQ=;
 b=BeCtd9F7suE7Dhq3+o6ebU7TlEj99UaBn9HqDmYOGvEIlw2BwbjQ9A9aTMEUtVsnUSdALbpNh
 qiE95luFKqoDYzljVg+qh0guvKUgr5gg+ZhgEeKyQjxdMCVh5yTgo9e
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add bindings necessary to implement a Rust per-CPU variable API,
specifically per-CPU variable allocation and management of CPU
preemption.

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/helpers/helpers.c |  2 ++
 rust/helpers/percpu.c  |  9 +++++++++
 rust/helpers/preempt.c | 14 ++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 7cf7fe95e41d..2fc8d26cfe66 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -31,9 +31,11 @@
 #include "of.c"
 #include "page.c"
 #include "pci.c"
+#include "percpu.c"
 #include "pid_namespace.c"
 #include "platform.c"
 #include "poll.c"
+#include "preempt.c"
 #include "property.c"
 #include "rbtree.c"
 #include "rcu.c"
diff --git a/rust/helpers/percpu.c b/rust/helpers/percpu.c
new file mode 100644
index 000000000000..a091389f730f
--- /dev/null
+++ b/rust/helpers/percpu.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/percpu.h>
+
+void __percpu *rust_helper_alloc_percpu(size_t sz, size_t align)
+{
+	return __alloc_percpu(sz, align);
+}
+
diff --git a/rust/helpers/preempt.c b/rust/helpers/preempt.c
new file mode 100644
index 000000000000..2c7529528ddd
--- /dev/null
+++ b/rust/helpers/preempt.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/preempt.h>
+
+void rust_helper_preempt_disable(void)
+{
+	preempt_disable();
+}
+
+void rust_helper_preempt_enable(void)
+{
+	preempt_enable();
+}
+

-- 
2.34.1

