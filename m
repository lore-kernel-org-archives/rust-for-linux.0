Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E268D38F250
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 06:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770101994; cv=none; b=Tzg4Sqk8DSILMUxDRiGd6p3qh1q+QENysPkL8tY+Ietf02t/chDc8OXJvKh2GFjz8v5DWO9SVHEw15Kbn/CwnFtiKTsmhAzXZrhAe4Mdpnfq+dPSUVwa6Va6rauAQZow9rfYqP/D5ss9SOM/iTJmb6nfiPTA04CBY3f2WFogZao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770101994; c=relaxed/simple;
	bh=9G9DrXeATMpIREFZyCuNEP08tqdRUpt15rMak3jGC8I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zv5/kVzoa1aWO/XG7IXevY14RFSe1Jw/8EiQacXwzItaSjTZ5QDcSYTbqzEwnOF8WC5JucSli8Il2q6wzxYV3MTT8w918oZUsyK4I5nstgN7C4K99U+8G96eMpIuY080w7tuN/c16CsLxFgUVYPtC07svQpXcYv9++68mY1Vxps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 3 Feb 2026 15:59:45 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.48)
	by 156.147.1.121 with ESMTP; 3 Feb 2026 15:59:45 +0900
X-Original-SENDERIP: 10.159.44.48
X-Original-MAILFROM: jongan.kim@lge.com
From: jongan.kim@lge.com
To: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	brauner@kernel.org,
	cmllamas@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	tamird@gmail.com,
	tkjos@android.com,
	tmgross@umich.edu,
	viresh.kumar@linaro.org,
	vitaly.wool@konsulko.se,
	yury.norov@gmail.com,
	lossin@kernel.org,
	ojeda@kernel.org
Cc: jongan.kim@lge.com,
	heesu0025.kim@lge.com,
	ht.hong@lge.com,
	jungsu.hwang@lge.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	sanghun.lee@lge.com,
	seulgi.lee@lge.com,
	sunghoon.kim@lge.com
Subject: [PATCH v3 0/3] binder: handle PID namespace conversion for freeze operation
Date: Tue,  3 Feb 2026 15:59:25 +0900
Message-Id: <20260203065928.4736-1-jongan.kim@lge.com>
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

Changes in v3

1. Patch 1/3
- change to use task->tgid instead of task_tgid_nr_ns()

2. Patch 2/3
- Add Send/Sync traits for Pid
- Add AlwaysRefCounted for Pid with rust_helper_get_pid
- Add from_raw() constructor to Pid and Task
- Rename find_vpid_with_guard -> find_vpid
- Rename pid_task_with_guard -> pid_task 
- Convert init_pid_ns() to PidNamespace::init_ns()
- Add PartialEq/Eq for PidNamespace (Alice)
- Add rust/helpers/pid.c for get_pid() wrapper

3. Patch 3/3
- Use task::Pid typedef instead of u32/i32
- Use PidNamespace::init_ns() instead of init_pid_ns() 
- Compare PidNamespace directly with == instead of raw pointers
- Use Pid::find_vpid() and pid.pid_task() (dropped _with_guard suffix)
- Fix rustfmt import ordering (rcu before Arc)
- Rename TaskPid alias to PidT for clearer pid_t type indication
- Use task.group_leader().pid() instead of tgid_nr_ns() for consistency 
  with C

History

v1 : https://lore.kernel.org/lkml/20251203024140.175952-1-jongan.kim@lge.com/T/#u

v2 : https://lore.kernel.org/lkml/20260129084119.32994-1-jongan.kim@lge.com/T/#u
- add two more patches to implement the same logic in Rust binder


HeeSu Kim (2):
  rust: pid: add Pid abstraction and init_ns helper
  rust_binder: handle PID namespace conversion for freeze operation

JongAn Kim (1):
  binder: handle PID namespace conversion for freeze operation

 drivers/android/binder.c          |  53 +++++++++++-
 drivers/android/binder/process.rs |  37 +++++++-
 rust/helpers/helpers.c            |   1 +
 rust/helpers/pid.c                |   9 ++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/pid.rs                | 138 ++++++++++++++++++++++++++++++
 rust/kernel/pid_namespace.rs      |  17 ++++
 rust/kernel/task.rs               |  13 +++
 8 files changed, 262 insertions(+), 7 deletions(-)
 create mode 100644 rust/helpers/pid.c
 create mode 100644 rust/kernel/pid.rs

-- 
2.25.1

