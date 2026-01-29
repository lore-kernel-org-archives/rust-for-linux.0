Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F5E3803D0
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677886; cv=none; b=CQ/LsQfEKYBaNzbbRPo1xg/D0V3HLIiyKijsUMOzBjxffIBHQZ9IxsVfdHby9twdMTJSZu0vstYtI3sfmpqq3ZEwP6V0oVRNaIVyjAGorsKtlZ/5eSsdDJooLpaKqLBIFx4+OJ4ebWArWANeKbO9dT0H7OOOwNhqCRm1PtBxrtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677886; c=relaxed/simple;
	bh=CwKVhHO0R1SNfCWd/igsxlE3mHzRC/PqqP5ZsjgJkvs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ht5wAb21KA5YIJ+quZHk+pdp5WdnkbyWFTR9RkTTpYl+sDaVLH+wUgZ0hdMuVnm+kfi2h+0EAYcva13YiydERF2QU4oBmbMbK8eo+KW3tySEeBVg8k/XqPLKzh6KtYBt860ROzNTXBs2P+PleccdIcvn6d3cbWFH6D/FMFysbFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 29 Jan 2026 17:41:21 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.48)
	by 156.147.1.127 with ESMTP; 29 Jan 2026 17:41:21 +0900
X-Original-SENDERIP: 10.159.44.48
X-Original-MAILFROM: jongan.kim@lge.com
From: jongan.kim@lge.com
To: aliceryhl@google.com,
	arve@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org,
	tkjos@android.com,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	yury.norov@gmail.com,
	vitaly.wool@konsulko.se,
	tamird@gmail.com,
	viresh.kumar@linaro.org,
	daniel.almeida@collabora.com
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	jongan.kim@lge.com,
	heesu0025.kim@lge.com,
	ht.hong@lge.com,
	jungsu.hwang@lge.com,
	kernel-team@android.com,
	sanghun.lee@lge.com,
	seulgi.lee@lge.com,
	sunghoon.kim@lge.com
Subject: [PATCH v2 0/3] binder: handle PID namespace conversion for freeze operation
Date: Thu, 29 Jan 2026 17:41:16 +0900
Message-Id: <20260129084119.32994-1-jongan.kim@lge.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: JongAn Kim <jongan.kim@lge.com>

This patch series fixes PID namespace handling in binder's freeze operation
for both C and Rust implementations.

This series addresses the issue by:

1. Patch 1/3: Fixes the C binder implementation by adding PID namespace
   conversion logic. It converts the caller's PID from their namespace to
   the init namespace before matching against binder_proc->pid, ensuring
   correct process identification.

2. Patch 2/3: Adds Rust abstractions for PID handling, including:
   - New Pid abstraction wrapping kernel's struct pid
   - find_vpid_with_guard() and pid_task_with_guard() functions with RCU
     protection
   - init_pid_ns() helper to access the init PID namespace
   These abstractions provide safe Rust interfaces with lifetime-bounded
   references tied to RCU guards for memory safety.

3. Patch 3/3: Ports the PID namespace conversion logic to the Rust binder
   implementation, using the new abstractions to ensure freeze operations
   from non-init namespaces target the correct process.

This ensures consistent and correct PID handling across both C and Rust
binder implementations when freeze operations occur in containerized
environments.

v1 : https://lore.kernel.org/lkml/20251203024140.175952-1-jongan.kim@lge.com/T/#u

v1 -> v2 changes:
- add two more patches to implement the same logic in Rust binder

HeeSu Kim (2):
  rust: pid: add Pid abstraction and init_pid_ns helper
  rust_binder: handle PID namespace conversion for freeze operation

JongAn Kim (1):
  binder: handle PID namespace conversion for freeze operation

 drivers/android/binder.c          |  52 +++++++++++++++-
 drivers/android/binder/process.rs |  40 +++++++++++-
 rust/kernel/lib.rs                |   1 +
 rust/kernel/pid.rs                | 100 ++++++++++++++++++++++++++++++
 rust/kernel/pid_namespace.rs      |   9 +++
 5 files changed, 196 insertions(+), 6 deletions(-)
 create mode 100644 rust/kernel/pid.rs

-- 
2.25.1

