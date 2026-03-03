Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA3538654B
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 20:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569040; cv=none; b=FVRFnrT7ntSRNjkfPypDXysMii/6ZXfcyxx3vIw5gomKI+tdhTAtNt32KKHMVTHNDhDPU3h2KicXqzwdn8FONSbIC32k2YPxoFrcAaytjrL3tjsPXRDfNWzILZkgti48ZKsT8sNNj1mlc551N/jL8msJR3NVftaQfHiO/6bYm70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569040; c=relaxed/simple;
	bh=4d6Hvpn10gbAYRt+sutMoUGNvahQ/QqGBeB/pqThwS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nw1zyMuXqZH0YJd4WqtYtaaFT0cIewuCotHsS9SJZGKbtJ3TcAy8JlNQL5qO/eUaa8cqKu6ug2FX1A5Q62V9i3jzyio4CqENmEGg9aw1xQn6vBd26qrL++QRkAgFv3ggI9Undo6wveFLq1q6zorw0UpJlBc3Ze07E5Xs93HNjU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byd4LJIw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byd4LJIw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029E2C4AF0C;
	Tue,  3 Mar 2026 20:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569040;
	bh=4d6Hvpn10gbAYRt+sutMoUGNvahQ/QqGBeB/pqThwS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=byd4LJIwboGO5J5Lg+mWYX9XYgKz+0u2aFyVl9mHqHm9yuxoTUqMLmJykh4uiRTE+
	 DvyvOsrhNa4Z9XOW65SyAdkzJE/ROAiwAUUHFlOrLHzGs2pCkKmwW5RMMU94a4bh5m
	 nYvWA97wC7NGOt7wARx194FVUVL9KHZLBgSHOZVCmd+9iGE8kfnTa5ZR9mKA3BigIU
	 g8CciFRcEZno62NvBeqAR2JZWfw0z7omINGJddX3vHSHMFKi88EdqtVReOLOL11D7+
	 r8h6pNt5XFaSzW5sfYMRxYxkEs2H03WRwMPBgro+lFtuOk6nl+WFmXf6Uf8wl1MTDr
	 9OpOxfdph1hkA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2F85BF40069;
	Tue,  3 Mar 2026 15:17:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 03 Mar 2026 15:17:19 -0500
X-ME-Sender: <xms:z0Gnadp0NaKQMtlsn583ZCilCclOURmC05oWqoSqedQG_vI4aD9o_Q>
    <xme:z0Gnablb-yVBAmWqC0K2SXCL5NcCLBCk5xhq3n-cKtfLiqoAExfpIxUkN0NBeUd6p
    NucLa_7wfmyLF1wMf_H5aVU_XdZdVkYeVXCpiv4SIEMQMEeJBQ3YQ>
X-ME-Received: <xmr:z0GnaQXg279o9OFQDFFhGhCXiGDiYTBu7Of7NEOWMprH8qjMKNkUv899mrBL7-MzDtvEP5xh5kLznMRnvIMcMOdtqlsl0pFF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekieffgeevhefgudffveffheettdfgkeeilefhhfduhedugedvhedtteegvdeugfenucff
    ohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepudenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudekpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    rhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpg
    hghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:z0GnafS4JDnkgOePZrUrsAwmFnMrTRz6gucunHfVZaPhk18g1_gxoQ>
    <xmx:z0GnabCqfXizFKuFDW8y9tYcHkHKceMX47VccYHExGkvNn0u5g_Qog>
    <xmx:z0GnaaRoRMyh5aLhxCrbz_Ro-UI0uXd1mvotqXtpQ3dA5DUFdzS47w>
    <xmx:z0GnaVQF82joDTq1L9xG87-iqJplDhTLYBt3oAv-HP8q2PmxtP7fQg>
    <xmx:z0GnaQJUzSnofOmfYxtqCoqWoLLuYPwEeiTnqMMJmj7m0kA-A6WM76pt>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:18 -0500 (EST)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH 06/13] rust: sync: atomic: Clarify the need of CONFIG_ARCH_SUPPORTS_ATOMIC_RMW
Date: Tue,  3 Mar 2026 12:16:54 -0800
Message-ID: <20260303201701.12204-7-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260303201701.12204-1-boqun@kernel.org>
References: <20260303201701.12204-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Boqun Feng <boqun.feng@gmail.com>

Currently, since all the architectures that support Rust all have
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW selected, the helpers of atomic
load/store on i8 and i16 relies on CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y.
It's generally fine since most of architectures support that.

The plan for CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=n architectures is adding
their (probably lock-based) atomic load/store for i8 and i16 as their
atomic_{read,set}() and atomic64_{read,set}() counterpart when they
plans to support Rust.

Hence use a statis_assert!() to check this and remind the future us the
need of the helpers. This is more clear than the #[cfg] on impl blocks
of i8 and i16.

Suggested-by: Dirk Behme <dirk.behme@gmail.com>
Suggested-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260120140503.62804-2-boqun.feng@gmail.com
---
 rust/kernel/sync/atomic/internal.rs | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 0dac58bca2b3..ef516bcb02ee 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -37,16 +37,23 @@ pub trait AtomicImpl: Sized + Send + Copy + private::Sealed {
     type Delta;
 }
 
-// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
-// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
-#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
+// The current helpers of load/store of atomic `i8` and `i16` use `{WRITE,READ}_ONCE()` hence the
+// atomicity is only guaranteed against read-modify-write operations if the architecture supports
+// native atomic RmW.
+//
+// In the future when a CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=n architecture plans to support Rust, the
+// load/store helpers that guarantee atomicity against RmW operations (usually via a lock) need to
+// be added.
+crate::static_assert!(
+    cfg!(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW),
+    "The current implementation of atomic i8/i16/ptr relies on the architecure being \
+    ARCH_SUPPORTS_ATOMIC_RMW"
+);
+
 impl AtomicImpl for i8 {
     type Delta = Self;
 }
 
-// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
-// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
-#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
 impl AtomicImpl for i16 {
     type Delta = Self;
 }
-- 
2.50.1 (Apple Git-155)

