Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C18F137C34
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Feb 2024 15:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708097249; cv=none; b=MqiFZVm0rYGsCR0YMHYauSbdNLxIHANxladjf3Jclmt58VayHg0h8odN/yCMkvdnpt6nQj+tk9BR7EdG6tckHynAkLre1zD4u9OoO1XFJIGmmg1A0yBpu0NXwQsDNeN+G+ETZJ2U1P6jyj1mOjGzogrNEZZ/7ODWffslTgy/JdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708097249; c=relaxed/simple;
	bh=RNK2sG5wfKabRr6Yw0QR0l1RTAQkSx4Vv5t39pJ+j8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M6KwsQq995qE+exvMkybY6np/hrOHwL5OKLNt5R+3NNtK78ph4qsSmdyp3VU2RJYj1mQOETc7ZY+Zy1m6NOqe2f7DewGpTsVd/w1BlgtpDyb0xGZETAa+hWqeR1K2/nuKkYuqptkcME+yb6G0jtIDDUqyTGA9XxH6WCS/331mCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTpg+5xh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTpg+5xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708097248; x=1739633248;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RNK2sG5wfKabRr6Yw0QR0l1RTAQkSx4Vv5t39pJ+j8U=;
  b=DTpg+5xhxv2lbdsVEnIxvcjauVFZsD1oNBzCQePx0A8HIQvl59OjNNy6
   HEH7rGJWgP7yMGIHKJMPGSYoGEjfQyoYGKZsgDTnKX67BM8Ml93SpAXWP
   aELUjU636QKDYIu61od3DNr7L0miQazXcsJXXU29B2Fg2x2Izo6e6vl7n
   oUE1sy+IgzCCw0r1J+FQEu2xNLI68y8xhIzfsUQSzWKUO1BOADTGAB3fy
   nofgwBUsxOrlnwDwwhYAqFJflGv7zayfEXp6BKSv19YG9eQaphsOIybbS
   f9v1UR++MkmBIxxKcQ7h999xxtcsDteD/+Klkt7DyDcIWHIYsxzEoaBqE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="13621503"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="13621503"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 07:27:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="935860021"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="935860021"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2024 07:27:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 87C8C2DC; Fri, 16 Feb 2024 17:27:23 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] rust: bindings: Order headers alphabetically
Date: Fri, 16 Feb 2024 17:27:23 +0200
Message-ID: <20240216152723.993445-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the comment on top of the file suggests, sort the headers
alphabetically.

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 rust/bindings/bindings_helper.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 936651110c39..65b98831b975 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -12,10 +12,10 @@
 #include <linux/jiffies.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
-#include <linux/slab.h>
 #include <linux/refcount.h>
-#include <linux/wait.h>
 #include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/wait.h>
 #include <linux/workqueue.h>
 
 /* `bindgen` gets confused at certain things. */
-- 
2.40.1

