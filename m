Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EA03DCDA4
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856985; cv=none; b=NjCgTCFdiM6+Bzt40i3T5Pjp//dh40G4VfAbebdMPHxfCtBJP9KBCckHebZRdVli0+x2b2sDSjlRDzjE/ae9rxbuCbCrqkHm+ddtaUtI1Xj9WY8xULF6s1y5uSEgFn+PNG+bo0yBtqRc/pOfB3AaqSqPe/GZqTxbIt+0P/eqk5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856985; c=relaxed/simple;
	bh=LiqeN21hmlSzqeftoSl/GLCyPQV5RGEp+g7qmLBlTQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mK0lEx4w44rYJiU4VvifVpufyCkQkoiSk7I7IKe9dvuBamZon4qmWpGuxHS5FXezS1lkUVIlVCBygYVJ1Sf+DprkaJFrlQFST852DVNaF/UoS1Fp9imkg6rTEAvwMh7rvlLkD/GK6M3yhjRPJSI2hYS6CNVwXZCDLYKT0lYsLLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkbSpYJX; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkbSpYJX"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c70c112cb61so1595126a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 14:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775856983; x=1776461783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+v45jw94JRi1dGGjjK8/w5xNCSncG1F0hGpE1jyeuw=;
        b=pkbSpYJXMWNg9DxqVm1BknGvL/jGfYBVdr9n6aAf+bAS67/PbwQK/5DbhiRMsMSSGl
         sTeskc/I+vbidZBKQ0CnRGCdvZOvbjy5TCDnVLeWMtZU70cGv6cL2gPNSIA/vok0BokC
         tHiddl6L9/ZZhmAY2UVxqgjuPm6aJhb0X/SLNeS4udtWFjlEp4u0vk02oSjid5Yt4HT4
         OeThRKXEcZ2MCwlmpo2uZSwc5Rap0k8ZGs9trieYf25Ez/DJdT4HlOpY59HtYFU4urMN
         buuzb8aYkLjzYW1dpgH/uzQLbGoFsng9vJfq5C0AmFE6EpL059pLDVpt4amNPHIJVQxL
         IeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856983; x=1776461783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F+v45jw94JRi1dGGjjK8/w5xNCSncG1F0hGpE1jyeuw=;
        b=WklQ62V+1Jp/3GGvZRl9B1TSgbH7y3oAxyd+ji00mY5zE58aLlnijG/7voTDfL+ceE
         Ixi/mbtvr0Xhae33zqQTT2+X8Cj4aMyT5xyII8wb9lULdEgs3Xj2t5I5NTdgST7UYu8g
         nI5B2Jgn5xUvrna5PtdgjJxu+SrTA5lZAmsG2qb8kIQts3NInUVuJISKPKxnD4wlfw4I
         qwuxTntrYqYK7NcfEFyD8y8VmcfChrVcQURBYQnZdKxqygYYVDcVp/kG2uA7W1tJOT6y
         ZJfh18Qrojs2DNaeqcNWGuWQ3SbXFoaLIyYcBS/P1sDm+qfU1AGMxC5+ZtKBt22kSP7v
         2+vA==
X-Forwarded-Encrypted: i=1; AJvYcCUO4XpUdwtvZz/Sve8k/0QxmZRdx8Z56h9fzjF/n/OYJOGHLSIVsDK4mcLnvtFR5dimHAhL+VXt33pj2ST+PA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9/keK9KEh9drHKWG+jFM390/baFAPRJ1Xl1rSziMlc1nbCIQQ
	O990uskgdXKIccuz0ue7C5TpRwyhyR5iTC/eCKXVQqbe0j3d2pc6Rx+L
X-Gm-Gg: AeBDies6qR4gkhko5Gz+M/wmXCn8hVGmgtLg2F38MXpG7qaObqisFA9Pkk7PQS9Gjd5
	GRqcH619qogMA1b6jiVn6eesQwr98R45geKfI1QuUzRgJNG7kA/X5dWjJMJ8cqYaWb0qXdAbd75
	gH5NEpAGg958xbJhyy1UKFilZeJDRLBjcgVJ8aW66ett6f3DB8WyeniB5wp5LC/3kJsqTae31fQ
	ujlfChmhrxkDe7WFu7bH8t+GccAQVGFfnmtmpMEdfdbCe8NW776OAyLExsmJxlSWaWJKhScc4ET
	P3Eb3RUGWP4p2up3EaYqDFuhMOM9hyS+kNyQdARLP1sOZpBwnduT2vkkCli1yagpTBy7NmdwNEq
	UAuSUVII6W6FkDzONlpocFogP+w6ivk2dVN0N2sH9XPmamfJpJ1CrY1uOftH/sDFMeCc+Fxfrom
	ppqg79Pdwyud3O+u66rEbiuiTxQhzx4rTFIwwuCYLAQoI1
X-Received: by 2002:a05:6a00:2d1c:b0:82c:9897:70e0 with SMTP id d2e1a72fcca58-82f0c37f54bmr5055454b3a.47.1775856983472;
        Fri, 10 Apr 2026 14:36:23 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.1.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e3d41sm5111551b3a.48.2026.04.10.14.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:36:22 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Fri, 10 Apr 2026 14:35:33 -0700
Subject: [PATCH v5 3/8] rust: percpu: Add C bindings for per-CPU variable
 API
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rust-percpu-v5-3-4292380d7a41@gmail.com>
References: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
In-Reply-To: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Boqun Feng <boqun@kernel.org>
Cc: Tyler Hicks <code@tyhicks.com>, Allen Pais <apais@linux.microsoft.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775856978; l=1610;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=LiqeN21hmlSzqeftoSl/GLCyPQV5RGEp+g7qmLBlTQE=;
 b=iUFnR3cUvYb+VI/DXA9Z3DypclDwajbL3MjM2j/sG8C8YCvKAUERXgFjlgI8fe1xS0FPR8yPj
 FaOyoJZfdzvBlVouoUriBmn4xf9cq/lvTRJ74Z9sbo/4C+GjPyslY/f
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add bindings necessary to implement a Rust per-CPU variable API,
specifically per-CPU variable allocation and management of CPU
preemption.

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/helpers/helpers.c |  2 ++
 rust/helpers/percpu.c  |  9 +++++++++
 rust/helpers/preempt.c | 15 +++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index e05c6e7e4abb..af661bb9be34 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -70,9 +70,11 @@
 #include "of.c"
 #include "page.c"
 #include "pci.c"
+#include "percpu.c"
 #include "pid_namespace.c"
 #include "platform.c"
 #include "poll.c"
+#include "preempt.c"
 #include "processor.c"
 #include "property.c"
 #include "pwm.c"
diff --git a/rust/helpers/percpu.c b/rust/helpers/percpu.c
new file mode 100644
index 000000000000..463186b8af9d
--- /dev/null
+++ b/rust/helpers/percpu.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/percpu.h>
+
+__rust_helper
+void __percpu *rust_helper_alloc_percpu(size_t sz, size_t align)
+{
+	return __alloc_percpu(sz, align);
+}
diff --git a/rust/helpers/preempt.c b/rust/helpers/preempt.c
new file mode 100644
index 000000000000..77dd5f10d8dc
--- /dev/null
+++ b/rust/helpers/preempt.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/preempt.h>
+
+__rust_helper
+void rust_helper_preempt_disable(void)
+{
+	preempt_disable();
+}
+
+__rust_helper
+void rust_helper_preempt_enable(void)
+{
+	preempt_enable();
+}

-- 
2.34.1

