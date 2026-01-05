Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9603A238C3B
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 00:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767573060; cv=none; b=aVToC0EB3swhlwuPEY59WuUzy+KQoTZydOTzeJpP1U+nr+p3PymauwIdJx9AvB4L9aY00HFxIAOn75hSWLJP5lw7+xcv8ZGK+o7ZsH7rNtJAB/Iaci8Srcv8lfuTq/tfROQwte2sOcjolIvC+YJDQKpOvviH+ekuDKdhEVSs59Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767573060; c=relaxed/simple;
	bh=4VtYblT4HVRoWu4jaDLopVPALPaC+zSFUE4twq/MOW0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G922FgyoZvr6jVWXdeYlFQZlI2lNz1q5E6mhzV7JbwBxMbHnZSgdahdpbCp3pM/Zd0lBiB9JkiJ8um2xYwnuls+ZWy/IrMy+BPrNxGZoIMlbOukZOSEq2dRrLGlzUQRV0IKzcGtydWNZCTWp/+/urNlJTAeAI6rXQnp8Ek/Ic5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=X3pwuzL8; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="X3pwuzL8"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c0224fd2a92so12580431a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 16:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1767573058; x=1768177858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XCOUHvaAPVBQlsZFB5UXzqWiXysSXr09nQwBmvYSu6k=;
        b=X3pwuzL8pfXYi10MKc3OzSZ0hzqxt84gp78LfQhXkVnYnqAO1x8ArggCzeQ0EB2JA5
         jzZSy95Jnxnz5m1jBXG3vRTIgvwvcDN2Vv58j47Hjtbfi8LeWV0rD6W9kSPft/ivbZt7
         9+t2R/Jr2ZNxOqe9GKF5Kb9qcdzN5qSEFsUQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767573058; x=1768177858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCOUHvaAPVBQlsZFB5UXzqWiXysSXr09nQwBmvYSu6k=;
        b=VvDq0sx7r4Z2TnkeWvt2eedchKwQYxPZibuaFWpyksojiDkWeEuWyeMXyEMj9n4Sbi
         D6kHwFkpkcysD0BpnAky7GzcVQpGu5m4w/mKgb2bmaGbR+TNZaHie0rMVe/jSF13LWPT
         ei8jCmgzIq2WkbyMNmkbvcU48HBUSKAyVxjrRDeIGgCJvb+WKiUak5eVSNrMQv3eeKjI
         yZ25CnGPhZnVuXyoiBtrxAz1iZe7ffrPm7TN3qzfMn5UOm+3ma1nceufDB2YsnmelCIl
         wU/6SZYbrRnJzV5L55e7qLkNv21B1zUrYvNATmVO445wUsxSOv6L/UaaC5hRt1gz9W5k
         +0Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVi6d+CSMnYbGzJIpMuVooPznmiXCduF9l6CIaUur5QrKTa+/39oY3cGzngVxjborn/mb1kHW9QCwG8TrK5kA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhF4uRKS/G7n8ULXo+iX80JiZwwmw8w5bnsjxyrlQyUDbFknS0
	bPRT+BDc5hPvyvnMV5yDb2ZH4rIDDZ4D40PZwprkUJX0pTiL1t7eY2rdbxLZpOc1Ob1oHusL9x2
	bpAP6Wew=
X-Gm-Gg: AY/fxX55RtLBEDURLlTHkygaBEdCdXRCOHJA83KfHI5G1YfIkElQGsGJ0dH26fLeY6d
	W7+tstwawqhuIhAUBIEAcnVkIiAF0eflDSPYsWOtMW78JqDwMLNzz/vbYYfwKwza102ZJNcCSae
	m8cH48nCr3HZak9EBKo8asR6fImslTsRvs+TR8a0ewNCFWc02A1HTryVKmQ+FA/rzFjBmjn0zXS
	EShVdi9WJ0aLk0QycmtN8CLv4b9Jp9btemkykb+U4HMaf3Q1o94swnMZPqAbeUCzxwxUO0DNNT8
	fGheGoR76cz04V+yZnHEO5TKkLfRn8zwynLjCoN61kVMsQ4mpLzhWpXVwpEwtkBshxFsVyly46q
	PCEOFQzdM3AP5eGqSWxg8umrjocsO7NkI7FtoxxPPEAy5BwMiW2QiJhEWcMW13FSDphw3i+mM4s
	aeYlHf5h79
X-Google-Smtp-Source: AGHT+IE9449FQ7FOHazIKXgDJtnuRLaIjG3nv4UMuI5rLRSQ8cHnSvTHqKM2sCHKw//28dbTJ7gQJA==
X-Received: by 2002:a05:7300:fb0f:b0:2b0:5b8f:1c5a with SMTP id 5a478bee46e88-2b05eca8ba2mr37694992eec.31.1767573057787;
        Sun, 04 Jan 2026 16:30:57 -0800 (PST)
Received: from localhost ([71.219.3.177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b140c42d9esm9551321eec.11.2026.01.04.16.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:30:57 -0800 (PST)
From: Joel Fernandes <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Cc: rcu@vger.kernel.org,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	"nouveau @ lists . freedesktop . org" <nouveau@lists.freedesktop.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>
Subject: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
Date: Sun,  4 Jan 2026 19:30:51 -0500
Message-Id: <20260105003051.122076-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joel Fernandes (NVIDIA) <joel@joelfernandes.org>

Update my email address from joelagnelf@nvidia.com to joel@joelfernandes.org,
which I will be using for community email going forward.

Signed-off-by: Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
---
Boqun, could we take it through the RCU tree for 7.0? Thanks!

 .mailmap    | 1 +
 MAINTAINERS | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 84309a39d329..279f8fb223e2 100644
--- a/.mailmap
+++ b/.mailmap
@@ -389,6 +389,7 @@ Jiri Slaby <jirislaby@kernel.org> <xslaby@fi.muni.cz>
 Jisheng Zhang <jszhang@kernel.org> <jszhang@marvell.com>
 Jisheng Zhang <jszhang@kernel.org> <Jisheng.Zhang@synaptics.com>
 Jishnu Prakash <quic_jprakash@quicinc.com> <jprakash@codeaurora.org>
+Joel Fernandes <joel@joelfernandes.org> <joelagnelf@nvidia.com>
 Joel Granados <joel.granados@kernel.org> <j.granados@samsung.com>
 Johan Hovold <johan@kernel.org> <jhovold@gmail.com>
 Johan Hovold <johan@kernel.org> <johan@hovoldconsulting.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 12f49de7fe03..43bbf12e2c80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14558,7 +14558,7 @@ M:	Luc Maranget <luc.maranget@inria.fr>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
 R:	Akira Yokosawa <akiyks@gmail.com>
 R:	Daniel Lustig <dlustig@nvidia.com>
-R:	Joel Fernandes <joelagnelf@nvidia.com>
+R:	Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-arch@vger.kernel.org
 L:	lkmm@lists.linux.dev
@@ -21895,7 +21895,7 @@ READ-COPY UPDATE (RCU)
 M:	"Paul E. McKenney" <paulmck@kernel.org>
 M:	Frederic Weisbecker <frederic@kernel.org> (kernel/rcu/tree_nocb.h)
 M:	Neeraj Upadhyay <neeraj.upadhyay@kernel.org> (kernel/rcu/tasks.h)
-M:	Joel Fernandes <joelagnelf@nvidia.com>
+M:	Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
 M:	Josh Triplett <josh@joshtriplett.org>
 M:	Boqun Feng <boqun.feng@gmail.com>
 M:	Uladzislau Rezki <urezki@gmail.com>
-- 
2.34.1

