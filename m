Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B962E5B09
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Feb 2026 21:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770498520; cv=none; b=KwVlWyIgdAvlNfFKD34bppPU8+VYG+PCC55+WXRRDYDoaLHYdBSQfP81PJPtPURgpglo5ByaviVvNUbEE4B8UUjBEKZGlLCom1l4CiraK5QOa3ZnsrZ7LkK+NCywkuJWUNf3FyvMpE8ewWtHQixABHSfMviC3UqzFuTtPacZiFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770498520; c=relaxed/simple;
	bh=AunIjG+WvPw3jaoOCt9Td/J+fOTkDCvMfl+8Ss01jVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SKiW4xGDXSLa3i8eDSujSjOXGa/Uo5yGcH9Qf25nQXsSCH8SzBduTQ9QzZMJ/LhOQ05iEPR6SN8rAQdkx3eTmLcEjE2GSgNBQxjcWS0gGjydY56WpCfrVac2C6gSKc7GJl9ERhVyP/8nUY2Mgq/AavgMTr9oZnFmAfdRz97hCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=in7e8IMx; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="in7e8IMx"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-124afd03fd1so2490511c88.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 13:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770498519; x=1771103319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jN8gIxAIY/WkY3mj0CU+KMW5LDh07gG6C2pZFbFuGHM=;
        b=in7e8IMxjFZXNujY+mItUXdu3KMdbTNdcx/qbRF4NSFtnzUtQjWD02PkI/aSF6wZm6
         NK5msY4TlWY/1wu7cwKRWGVUJPr8FaypB1XrDQO+/hW4goCJSzoaSnJztQujocxsmYhQ
         0HuyP5JAxHnBu1hR/qdlf07X/Qo8LzN3zVZt4vpi9owAkWfkgn8NAAPYteBx0Z6lZ9p4
         KvrhTNpLVPAw3v9TsWV1kiE3tJ09hlEwjDi6OF0RRKOVjCfqnLEUyBrIqAR7Z2icvr7B
         0e0CWLxYwmwU+6C+fO1jCcDQNZXSvh/TfxV1KRDyXVZvO9EdBepyJ959KkcU4qtdQPYH
         xj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770498519; x=1771103319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jN8gIxAIY/WkY3mj0CU+KMW5LDh07gG6C2pZFbFuGHM=;
        b=qrlCHwGwIh6cpwx2GZfT5tmiShi/3deBAEtKrWr2QX80s0h2j5aWuQdxtrATFFrG9X
         w5BcsBf0Ukud4xnveKiZNVfLzckR9Z/MC0lpni6GN9LJyjNxshtd/tOnDUVpfuh1BVXr
         TkuPrFIzcdkS4rz8NBLHJtm2nKBCEcyyC0wKNrc8VIDYAzF5ZX3HCRg1aK61VTvd48Gf
         JOErvlg1RjQdv/ilNE6AaTs9ITGSMjd6Lx3ZZeHYgmtcXxcL00zp5zbaQjZM/IxO/9iZ
         KhZSWGCeSOZT3rI/dXg2diocnIxv16sP8Nz2HuaZd+X82Eg3pMgqg7SZ3wr4EzkcGzM4
         qcwg==
X-Gm-Message-State: AOJu0YyozDjoNQCkDyAzctqJHY52o8vlHikbo40UzEYVWNrkyQeFDhtM
	QlEy4sBfNdMfB7crPZw3cwFnKh6K5pPsgZmWFOzbruWVcCptq/nGUBGd
X-Gm-Gg: AZuq6aLyORm+GtsN+u9bbC9egWZtciusf6MZcRj9oo/EvUN3SXyTLY+e1lgy4Xm0DzZ
	B5wl2ZahK9Jev/+kStg2lm1qp0MSllc6hPA1vdVvjiwbRdGiu/gh7sMRwxZjZ9bFFa/kunKBC+x
	WER8mcadgUKMJhEnsMql2IxeTQFMaAPqYgt2szpKqdJm/jRv+Q1xmd6Yd+kKvepaVVhvEi2Htk1
	4qxvubjqhSrS6R/SREGujgzQNHeUu7Z0VYNwsGYyi8aiQbbReMHGPn8uMppqSFIfWkoiYsGatAi
	zhb10u43FemLb/78ygq2jqoPm1mcgzZZgRwCWm+w0KHNEjb9CImiLmHfZmw6diW9jzSTK4J/5qE
	Qi090183MDF7BuOLerc5HSGA7rwp2iQdS+TeyAE/fIWR+fmKpV915g2YOizKetLwMYbqq/WmIqQ
	Dz2G+r8CBb7FMAAmY1jFjg8kPs5jzie2TkN7Zr9n5XBWe/tQYDgRmg8gWD4AfBnbmB
X-Received: by 2002:a05:693c:3105:b0:2b8:1d16:9728 with SMTP id 5a478bee46e88-2b85644edbemr2980689eec.5.1770498518864;
        Sat, 07 Feb 2026 13:08:38 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:987e:6d8e:7cd5:6e71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855afdbfbsm4504628eec.11.2026.02.07.13.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 13:08:38 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Joe Perches <joe@perches.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn.roy.baron@gmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakru@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jason Hall <jason.kei.hall@gmail.com>
Subject: [PATCH v8 1/2] scripts: checkpatch: move Rust-specific lints to separate file
Date: Sat,  7 Feb 2026 14:07:45 -0700
Message-ID: <20260207210805.196759-2-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260207210805.196759-1-jason.kei.hall@gmail.com>
References: <CANiq72kXaFkL34g0V3isOp39VqfN5Oaj9O_A0o1ipERFWhWi2w@mail.gmail.com>
 <20260207210805.196759-1-jason.kei.hall@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Create scripts/rust_checkpatch.pl for Rust-specific linting logic.
Add a conditional loading hook in scripts/checkpatch.pl to call it.
This will allow Rust linting logic to be maintained independently.

Add a new entry to the MAINTAINERS file to track this new file.

Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>
---
 MAINTAINERS                | 22 ++++++++++++++--------
 scripts/checkpatch.pl      | 14 ++++++++++++++
 scripts/rust_checkpatch.pl | 16 ++++++++++++++++
 3 files changed, 44 insertions(+), 8 deletions(-)
 create mode 100644 scripts/rust_checkpatch.pl

diff --git a/MAINTAINERS b/MAINTAINERS
index f6bc65de83c7..57831dc30e6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4109,7 +4109,7 @@ F:	drivers/input/touchscreen/atmel_mxt_ts.c
 ATOMIC INFRASTRUCTURE
 M:	Will Deacon <will@kernel.org>
 M:	Peter Zijlstra <peterz@infradead.org>
-M:	Boqun Feng <boqun.feng@gmail.com>
+M:	Boqun Feng <boqun@kernel.org>
 R:	Mark Rutland <mark.rutland@arm.com>
 R:	Gary Guo <gary@garyguo.net>
 L:	linux-kernel@vger.kernel.org
@@ -4500,7 +4500,7 @@ F:	lib/sbitmap.c
 
 BLOCK LAYER DEVICE DRIVER API [RUST]
 M:	Andreas Hindborg <a.hindborg@kernel.org>
-R:	Boqun Feng <boqun.feng@gmail.com>
+R:	Boqun Feng <boqun@kernel.org>
 L:	linux-block@vger.kernel.org
 L:	rust-for-linux@vger.kernel.org
 S:	Supported
@@ -5880,6 +5880,12 @@ R:	Lukas Bulwahn <lukas.bulwahn@gmail.com>
 S:	Maintained
 F:	scripts/checkpatch.pl
 
+CHECKPATCH RUST LINTS
+M:	Jason Hall <jason.kei.hall@gmail.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	scripts/rust_checkpatch.pl
+
 CHECKPATCH DOCUMENTATION
 M:	Dwaipayan Ray <dwaipayanray1@gmail.com>
 M:	Lukas Bulwahn <lukas.bulwahn@gmail.com>
@@ -11264,7 +11270,7 @@ F:	tools/testing/selftests/timers/
 
 DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST]
 M:	Andreas Hindborg <a.hindborg@kernel.org>
-R:	Boqun Feng <boqun.feng@gmail.com>
+R:	Boqun Feng <boqun@kernel.org>
 R:	FUJITA Tomonori <fujita.tomonori@gmail.com>
 R:	Frederic Weisbecker <frederic@kernel.org>
 R:	Lyude Paul <lyude@redhat.com>
@@ -14559,7 +14565,7 @@ M:	Alan Stern <stern@rowland.harvard.edu>
 M:	Andrea Parri <parri.andrea@gmail.com>
 M:	Will Deacon <will@kernel.org>
 M:	Peter Zijlstra <peterz@infradead.org>
-M:	Boqun Feng <boqun.feng@gmail.com>
+M:	Boqun Feng <boqun@kernel.org>
 M:	Nicholas Piggin <npiggin@gmail.com>
 M:	David Howells <dhowells@redhat.com>
 M:	Jade Alglave <j.alglave@ucl.ac.uk>
@@ -14718,7 +14724,7 @@ LOCKING PRIMITIVES
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Ingo Molnar <mingo@redhat.com>
 M:	Will Deacon <will@kernel.org>
-M:	Boqun Feng <boqun.feng@gmail.com> (LOCKDEP & RUST)
+M:	Boqun Feng <boqun@kernel.org> (LOCKDEP & RUST)
 R:	Waiman Long <longman@redhat.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
@@ -21912,7 +21918,7 @@ M:	Frederic Weisbecker <frederic@kernel.org> (kernel/rcu/tree_nocb.h)
 M:	Neeraj Upadhyay <neeraj.upadhyay@kernel.org> (kernel/rcu/tasks.h)
 M:	Joel Fernandes <joelagnelf@nvidia.com>
 M:	Josh Triplett <josh@joshtriplett.org>
-M:	Boqun Feng <boqun.feng@gmail.com>
+M:	Boqun Feng <boqun@kernel.org>
 M:	Uladzislau Rezki <urezki@gmail.com>
 R:	Steven Rostedt <rostedt@goodmis.org>
 R:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
@@ -22362,7 +22368,7 @@ RESTARTABLE SEQUENCES SUPPORT
 M:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
-M:	Boqun Feng <boqun.feng@gmail.com>
+M:	Boqun Feng <boqun@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	include/trace/events/rseq.h
@@ -22885,7 +22891,7 @@ F:	tools/verification/
 
 RUST
 M:	Miguel Ojeda <ojeda@kernel.org>
-R:	Boqun Feng <boqun.feng@gmail.com>
+R:	Boqun Feng <boqun@kernel.org>
 R:	Gary Guo <gary@garyguo.net>
 R:	Björn Roy Baron <bjorn3_gh@protonmail.com>
 R:	Benno Lossin <lossin@kernel.org>
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c0250244cf7a..f75cb70ad0dd 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -20,6 +20,12 @@ my $D = dirname(abs_path($P));
 
 my $V = '0.32';
 
+my $rust_checkpatch_available = 0;
+if (-e "$D/rust_checkpatch.pl") {
+	require "$D/rust_checkpatch.pl";
+	$rust_checkpatch_available = 1;
+}
+
 use Getopt::Long qw(:config no_auto_abbrev);
 
 my $quiet = 0;
@@ -2947,6 +2953,14 @@ sub process {
 
 		$cnt_lines++ if ($realcnt != 0);
 
+# Check for Rust-specific lints
+		if ($rust_checkpatch_available && $realfile =~ /\.rs$/) {
+			my ($type, $msg) = process_rust($line, $rawline, $herecurr);
+			if ($type) {
+				WARN($type, $msg);
+			}
+		}
+
 # Verify the existence of a commit log if appropriate
 # 2 is used because a $signature is counted in $commit_log_lines
 		if ($in_commit_log) {
diff --git a/scripts/rust_checkpatch.pl b/scripts/rust_checkpatch.pl
new file mode 100644
index 000000000000..56c1bc29d3f2
--- /dev/null
+++ b/scripts/rust_checkpatch.pl
@@ -0,0 +1,16 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0
+#
+# (c) 2026, Jason Hall <jason.kei.hall@gmail.com>
+
+use strict;
+use warnings;
+
+sub process_rust {
+    my ($line, $rawline, $herecurr) = @_;
+
+    # Reserve for future Rust-specific lints
+    return ();
+}
+
+1;
-- 
2.43.0

