Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00362E5B05
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 08:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770368029; cv=none; b=SpHQpqZALHf4IWEplkUzjNh4jcEY5/EOZGr5i5WpXzmL7MadaTUWNNRLKkf5IG4lVNuAIu1/ec62yNAhWxB1SRl7sCP2BTNWljihUy31ArqbE1G+lfB9M55o4yk7u4wS0bsaysI2PD4nwcQGRbB8GChKrUqtdk3Nl4Z3sK+wOjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770368029; c=relaxed/simple;
	bh=ShzomdxBrpJeTEiFmPpDgH7zlEKYEh67fPxQhThNYHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LJU+/grojni+nyMiKqahJ+UeKJ6wCl4VMD5CwfnTUNENJHCrpYE9d6kO5opUxkRONgGzAEywHRJfieSlTccvCCycdVHUrBJl5Rn0SOwBEWJUP6A0zW5tGp8cqjcODniNcoJVl7uzyOSuYnJueOUaoSBlYvVIyz7rIdEASo3ofc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 6 Feb 2026 17:53:45 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.57)
	by 156.147.1.121 with ESMTP; 6 Feb 2026 17:53:45 +0900
X-Original-SENDERIP: 10.159.44.57
X-Original-MAILFROM: jongan.kim@lge.com
From: jongan.kim@lge.com
To: aliceryhl@google.com,
	a.hindborg@kernel.org,
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
	ojeda@kernel.org,
	lossin@kernel.org
Cc: heesu0025.kim@lge.com,
	ht.hong@lge.com,
	jongan.kim@lge.com,
	jungsu.hwang@lge.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	sanghun.lee@lge.com,
	seulgi.lee@lge.com,
	sunghoon.kim@lge.com
Subject: [PATCH v4 0/3] binder: handle PID namespace conversion for freeze operation
Date: Fri,  6 Feb 2026 17:53:33 +0900
Message-Id: <20260206085336.32819-1-jongan.kim@lge.com>
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

Changes in v4

1. Patch 1/3
- change subject name more clearly
- comapre task_struct pointers directly instead of PID.

2. Patch 2/3
- Add __rust_helper annotation to rust_helper_get_pid

3. Patch 3/3
- change subject name more clearly
- Use Task pointer comparison instead of PID number comparison (Gary, Alice)
- Remove PidNamespace dependency entirely
- Use &mut KVec parameter to avoid intermediate allocation (Gary)
- Merge context.rs and process.rs changes into single patch

History

v1 : https://lore.kernel.org/lkml/20251203024140.175952-1-jongan.kim@lge.com/T/#u

v2 : https://lore.kernel.org/lkml/20260129084119.32994-1-jongan.kim@lge.com/T/#u
- add two more patches to implement the same logic in Rust binder

v3 : https://lore.kernel.org/lkml/20260203065928.4736-2-jongan.kim@lge.com/

Test
- basic binder freeze test : OK
- binder freeze collision test in seperated namespace : OK

HeeSu Kim (2):
  rust: pid: add Pid abstraction and init_ns helper
  rust_binder: handle PID namespace conversion for freeze operation

JongAn Kim (1):
  binder: handle PID namespace conversion for freeze operation

 drivers/android/binder.c          |  22 ++++-
 drivers/android/binder/context.rs |  16 +++-
 drivers/android/binder/process.rs |  25 ++++--
 rust/helpers/helpers.c            |   1 +
 rust/helpers/pid.c                |  13 +++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/pid.rs                | 138 ++++++++++++++++++++++++++++++
 rust/kernel/pid_namespace.rs      |  17 ++++
 rust/kernel/task.rs               |  13 +++
 9 files changed, 236 insertions(+), 10 deletions(-)
 create mode 100644 rust/helpers/pid.c
 create mode 100644 rust/kernel/pid.rs

-- 
2.25.1

