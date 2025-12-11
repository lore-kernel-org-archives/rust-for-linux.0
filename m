Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70EC2D5408
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 21:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765489004; cv=none; b=DP2QQc9XgPcV1XbTpCIJSWtDr9f3XKJdb8yqNiEKaDrpxLEOUfol7mh1lDH73zNpfSroodlreV1ZysWfnS4whpkaVLBRd0wM/0rdN/pDKgrjWb6lkGUxwYkl0I4ygxVXw5uaHUcTwXYvRAl9iuZOFBqcP+d4uf7fOElFeomSuCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765489004; c=relaxed/simple;
	bh=l2ZXWkQDIfA9Dt7Hl/cXCZ8sZq3WOa1qqsoaPRfk3T0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zue8kx2rHPsBloTXjo8GlTEretIhKYWh1yumc1+Y8637lB0t4BLvp1ZSQVwBC9ueoXlqvFXN1yjNNEgIyhfKm2ZaIhGoDF+1nEwkoaqTLa3jMwwoWdJsZN4kZbE+qLeKrDp2tiPL2ac/RAm5xcTKoOr2wcHb7MqNcXrA2rKt+zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMVhhEw9; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMVhhEw9"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so593102b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 13:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765489002; x=1766093802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cJqGO28Xxc8TBpnClCDYfkauobrL81pYhNEz/oYr5ag=;
        b=mMVhhEw9IukCnJVGr18/CyHqJWuzKIr8OflATqZnSQlFuQvPwKDzMgXwVEiPHY5k6b
         QZ5bu9sGFPCw28VgO91BChK0yXQF5aiky56fG1z8JvCZqDztIcCo5wiOsN1eYdQFtQou
         2RW7KObWs56J3zn0a4XEzrv1GAZX/joFyRl+cMykNwO1mJC9x8c91XZdECNbMM5d/5C3
         znCrIz69vvkMx+BhST2u8lyLQ6t+meo51yyECdN1Pse145spWU4GxpSgvhpB8tyrjC4K
         Ydrk02yU5DiNOTUlJa/R4eGudTD++aVx2gnKAO5j+gWWqYTEBqZwg5DRZSFCS9/ND/QX
         Cdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765489002; x=1766093802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJqGO28Xxc8TBpnClCDYfkauobrL81pYhNEz/oYr5ag=;
        b=DAyNBitR3ImqIiGZXOVZrlJECzhRHYehaXvwnMdkVVddIziDOlpoe0ECwHKW+bLTz0
         bsJosnOw0EpRbgxtgD+Y8skoAnOyeHU1b8da5RLiqPik7vkee4+RbAKV3fZupu+MPub9
         q+pzooxVb4srZFB8Ac27GgHeadQ3I6hcBICp+ycRPTWhcwpJzefsBuwk1xeNTqQQ7Rp3
         nQfSMP9l26PXp7dQEIHvdhsVFv0LXD7o5yoAmq7wq/cyFBGyI7N+2M/XLarZAZ4PXNMW
         lHzFfViXBvJLWyr0I0DJtVbyukvRvtXFkCCo6kgcpIZ9ig4Wux+whuXz1fBWCURIA5pd
         MZLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo26DaTO0ZfeQt4tI1fT0qcpoQSeRB06nUW/ZOUWf/aoqgrg14Rllu7TK0B5k0m7gewiNBi/tMKE2dXxUsCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxletlK/bDUJcen/KDwQMhFKlA8lYxEI3CrkEccWcuVfIb2pEg
	GC41s3QMS/UzvbVI4MCwectegH5k7mRHjrSe3k+C7TQx1H58iDXzOb4n
X-Gm-Gg: AY/fxX4nGKviG1XIOGBwk+odIq2ABvceyN9HP/Km9bVMMWyoqiEGX7sdajNoGhVZbkt
	TMrvTYStxgMHPBES+1SC/d70EsZkG4EjSH12npvR5RWObfpWEoFSK5ks0o+BbtxWH7zq7VyBHwc
	Yg6F1Uhc/kA/X7d326hG1awuqr8dOAuWboaYEwxH3mL+4MntdovVKm5zydsGQ+DZpmM81gutzfQ
	lOb5zDRHKPGiCRtSR1jEVr6aup8JeB1IoJZt//3xFSv7Quix4RE2jIZaqKrHLJX9T7/YhWsxeWQ
	k9XbSk4HPmJc5REK2kKN9qhAdNNeYSiM/TssLlHjybOxH3zPmdkKKqAt8EQABUqhk8LcRAP1Jhc
	xeH5dDePa1faBqa2yzIj13A5gui5fNg5Db4TMiIdWIBmOtzbgMUg4vgjTyPRg/G0r32XMAONh9T
	h8P4/q5IKSqUGS9kwEln1vLp1mwWDAwnbUjyo/eFE7CjmPwyJ8XN0cdSlzx0Z4dQ==
X-Google-Smtp-Source: AGHT+IFgIp3A76xDtV2l5GWRjjVbyolg/qxh9g1UJNgVsoo34f3Lb0dd4R/sYriiFJ1evaC8VzICYA==
X-Received: by 2002:a05:6a00:8c4:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-7f22ce24228mr6461766b3a.20.1765489002116;
        Thu, 11 Dec 2025 13:36:42 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2772a51sm3374242b3a.17.2025.12.11.13.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 13:36:41 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1] rust: time: Add missing hrtimer example
Date: Fri, 12 Dec 2025 06:36:08 +0900
Message-ID: <20251211213608.1302051-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The impl_has_hr_timer macro docs says that "see module documentation
for an example" but there wasn't one. This adds an example usage of
the macro.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a00..be0cae7a7da1 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -66,6 +66,41 @@
 //!
 //! A `restart` operation on a timer in the **stopped** state is equivalent to a
 //! `start` operation.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::sync::{Arc, ArcBorrow};
+//! use kernel::time::hrtimer::{
+//!     AbsoluteMode, HrTimer, HrTimerCallback, HrTimerCallbackContext, HrTimerRestart,
+//! };
+//! use kernel::{impl_has_hr_timer, prelude::*};
+//!
+//! #[pin_data]
+//! struct MyDriver {
+//!     #[pin]
+//!     timer: HrTimer<Self>,
+//! }
+//!
+//! impl HrTimerCallback for MyDriver {
+//!     type Pointer<'a> = Arc<Self>;
+//!
+//!     fn run<'a>(
+//!         _this: ArcBorrow<'a, MyDriver>,
+//!         _ctx: HrTimerCallbackContext<'a, Self>,
+//!     ) -> HrTimerRestart {
+//!         // Timer callback logic here
+//!         HrTimerRestart::NoRestart
+//!     }
+//! }
+//!
+//! impl_has_hr_timer! {
+//!     impl HasHrTimer<Self> for MyDriver {
+//!         mode : AbsoluteMode<kernel::time::Monotonic>,
+//!         field : self.timer
+//!     }
+//! }
+//! ```
 
 use super::{ClockSource, Delta, Instant};
 use crate::{prelude::*, types::Opaque};

base-commit: 0048fbb4011ec55c32d3148b2cda56433f273375
-- 
2.43.0

