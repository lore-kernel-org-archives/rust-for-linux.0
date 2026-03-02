Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93FA359A99
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 23:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772495907; cv=none; b=W5Ugo+u5klvWcuV4zdMj4N1exl7MX9O6mwseOJCXHkK0ZxyvyxDJ2SFcVre7kK+a6G8AiEmbD7vI5FP+Hu3bumyQe4wEfACb7CmVVJ4iRrXQCB6O4QLoXBt7nV8rompvv76w+mLndVSIkejZRMpCYQUob8dRf33DvOLHDWx9774=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772495907; c=relaxed/simple;
	bh=dLPS21rhotZsClGCyEhOGzY3/6PtbWLrIcPK+TMyZh0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ouxt9LV8iRN0BlSDCI0+IsAtF80Ub1dzo1HlhFmbbd0GLx+tWbX2CjwZCYQ6easdidDr99vcsmRl5z54FhcfzjAMtkk7xgloYowZZ7juHoNCqvn0HDOi5vXV0U+/4Dn3wxXQzfggwDsRcNWccWCrVmhtlaEjSZ//6PAM8vQ5cBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QhNzglLG; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QhNzglLG"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1270dcd11c1so6679857c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 15:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772495906; x=1773100706; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yfIfOmIXwQ7nZr2XqRPaUJWDnxnqMi80a3YRLRf5U3w=;
        b=QhNzglLG8N60Fit6Qbu7DEmzIYgsHfDkldWCk07ORnHsZhu2OLw8hpS5gS37A4WWfb
         MqEivFIQoGvRMxDRM8nrtRxYK52Y0p5FU+L7zcgiwnpXg4/jErtMIxKUuAyoNmLL6W9A
         D7b4ysC7N/L7ZKIOKzt/GgKAkIBwbEesnIu3O98L0zSIIJp6MHt0nDTlylVSZzv7m7DA
         rzYhlS4LNfxg2uyiO1/aNkHLr+InnndcXLeqMTO+EBKKPF43LLJZAe7WycJDQMTrfVNl
         YA818u5TdxLevhHkLuaWpYG4I3u4SUgO+bYGuDAWChAxhFLjHoRWXJ26skdYAIwAv2zM
         8Y9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772495906; x=1773100706;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yfIfOmIXwQ7nZr2XqRPaUJWDnxnqMi80a3YRLRf5U3w=;
        b=ZasaKHXi4vms3bnUoEc+2xBkzB2Ge8Qk1UFT+WyBD0LTfk7rmPsSEpLRdK9YlCPtsK
         eIyBrlRhpMLHhVYTj2jheXIt0BrrXu5pCqFIG6kHBjcOrnpSGmAiroT8WQCav6eeQ7w0
         iu6xEXWmhaOnlwvi72X1beyAqI9DOM+LV4hoCABkGn5VYIhEB67B6k/VoTixo/IV9+24
         GxgITEjrFdPcjHqiANsHACdHFbp/QkTzinNdxWvcX1iisGHfx671E0V9Cthx1wMszKFp
         V39Md/+5HaRpb7BFQrsD5PuyyydvuBqM5GjQw2MIzHAMIuw2abtzMszWHFnXj04l0DZV
         3ilw==
X-Forwarded-Encrypted: i=1; AJvYcCXy5eY+k/fN2LWbJDqtJTB/Fc2ERQdBqWc8vGdJTPpvjimKrR86qzWGYiYXLJZ/tK4UZnOQzmK7KXfsP/jcnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3o9bUKg9nLt+raQLVUSTycj/dOWQWKCAjWVrVenvvV1vTJGHE
	MAOc+akjbp/lbuOBUIgwB0FoBZi2svhfQUrkZXGTdZ1HhGJohO2+IC/q7EmRVS53VrvGL0hXAQC
	5Dv8T4UCnvQ==
X-Received: from dlbsj2-n2.prod.google.com ([2002:a05:7022:f902:20b0:11d:cd2a:4c1b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:128f:b0:124:9acd:328e
 with SMTP id a92af1059eb24-1278fcb60bdmr5859046c88.27.1772495905544; Mon, 02
 Mar 2026 15:58:25 -0800 (PST)
Date: Mon,  2 Mar 2026 15:58:21 -0800
In-Reply-To: <jiwt5mjma2puv7kjbgploxx2l5tankjm4zu2tsa75qkckwnwjk@f7mz5vlvzpjz>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <jiwt5mjma2puv7kjbgploxx2l5tankjm4zu2tsa75qkckwnwjk@f7mz5vlvzpjz>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260302235821.588686-1-irogers@google.com>
Subject: [PATCH v1] perf test type profiling: Remote typedef on struct
From: Ian Rogers <irogers@google.com>
To: 9erthalion6@gmail.com
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org, acme@kernel.org, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, gary@garyguo.net, irogers@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	lossin@kernel.org, namhyung@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"

The typedef creates an issue where the struct or the typedef may
appear in the output and cause the "perf data type profiling tests" to
fail. Let's remove the typedef to keep the test passing.

Fixes: 335047109d7d ("perf tests: Test annotate with data type profiling and C")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/data_type_profiling.sh | 2 +-
 tools/perf/tests/workloads/datasym.c          | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/data_type_profiling.sh b/tools/perf/tests/shell/data_type_profiling.sh
index 2a7f8f7c42d0..fb47b7213b33 100755
--- a/tools/perf/tests/shell/data_type_profiling.sh
+++ b/tools/perf/tests/shell/data_type_profiling.sh
@@ -8,7 +8,7 @@ set -e
 # data type profiling manifestation
 
 # Values in testtypes and testprogs should match
-testtypes=("# data-type: struct Buf" "# data-type: struct _buf")
+testtypes=("# data-type: struct Buf" "# data-type: struct buf")
 testprogs=("perf test -w code_with_type" "perf test -w datasym")
 
 err=0
diff --git a/tools/perf/tests/workloads/datasym.c b/tools/perf/tests/workloads/datasym.c
index 1d0b7d64e1ba..19242c7255c0 100644
--- a/tools/perf/tests/workloads/datasym.c
+++ b/tools/perf/tests/workloads/datasym.c
@@ -4,14 +4,14 @@
 #include <linux/compiler.h>
 #include "../tests.h"
 
-typedef struct _buf {
+struct buf {
 	char data1;
 	char reserved[55];
 	char data2;
-} buf __attribute__((aligned(64)));
+} __attribute__((aligned(64)));
 
 /* volatile to try to avoid the compiler seeing reserved as unused. */
-static volatile buf workload_datasym_buf1 = {
+static volatile struct buf workload_datasym_buf1 = {
 	/* to have this in the data section */
 	.reserved[0] = 1,
 };
-- 
2.53.0.473.g4a7958ca14-goog

