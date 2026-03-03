Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A363BED7C;
	Tue,  3 Mar 2026 20:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569033; cv=none; b=D5uJoXwbGJkjsVGDYjB3OAGU7Wre7QJQyyLgb3bhhTK/Kx2KCvKttPVv4ENPRukUv40lbiBSEi96ysGerqzpeFDrRjF4nAZj0SaFg1MK5+hjJp4eTSIURKGorOmRmxdMrQpAq+1OnyWtCh8W7qq4pvEGWuULAOFuG478Q5po/q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569033; c=relaxed/simple;
	bh=0fAFRF8LQB1wnhaK5eJ+c8k946n+9prIfxKuchRjLdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGxfam0TN/W5dkhvuvguwSn0WMZSHPYVVumKKZ2d26Sq0j2XbOdOJL2H3YnCq/AOw5nH7cpCFZBFAD/uHAg9+ETzEJ03I0xPa3siwTuFsmrn687e1/V60YVXOVe5qDBvwwq2nayIYKQ8EleCu3WK4kg+3qba47GE7kWlkJ5a5C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vP/tIf3d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vP/tIf3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C14C116C6;
	Tue,  3 Mar 2026 20:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569033;
	bh=0fAFRF8LQB1wnhaK5eJ+c8k946n+9prIfxKuchRjLdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vP/tIf3dddTPAkRwq2atr6mJAM63NC7bZp2M/3uXc5XcVpk/SrWLk5u2/zYLxRXEM
	 9gYovdeZ48yTzLBBdiDFgwguTLhk8uUgEpErZZv5iAencJ/6kiDHpcKXo5wlTDYxT+
	 coL9uqivOiT7sNSxefUBIw3b7eze4zVTvQ14HlA7Kyd17ol4Sc3K/pkuPXykLkBcr8
	 iUyTmqth6RvwxLPOp2+5wzyq/Q1wY1H0aGYRPjjwQkmZ/aO89EVo8EKJkshG8Okhey
	 glZ+o1YBhlSWDZv3frvtSgPsxYvXZPCBn02V+FYIpIq9FU+RhcaVIjqLjjpG9Jn+6G
	 giEVqXVtzpFSQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 00C53F40069;
	Tue,  3 Mar 2026 15:17:12 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 03 Mar 2026 15:17:12 -0500
X-ME-Sender: <xms:x0GnaXaF4W7D9QGAC0Ftvtb_UBHFHHTzSUJ9S678FZrRcfk4DhRScw>
    <xme:x0GnafwiHAIyWFfa_-Uk9wYdYWnf2PoIGXKHcmQawdmgHEA3ICljl9IjjqPgUnbCC
    Yaom5lwlXzcxsnzyB4T55ALMPM_Tbcov7u4ETCtXLvExZzL9sDOQg>
X-ME-Received: <xmr:x0GnaSeLuMVj4QjsAI3xjjOH3ft_YOpKUIYprOaF0evWvrxztGhHPpfKESYCrgEezZVrIgwqVb-4v_E8cn1SEYFNuphJZjF5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekieffgeevhefgudffveffheettdfgkeeilefhhfduhedugedvhedtteegvdeugfenucff
    ohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    rhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpg
    hghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:x0GnadLHxFJQHcjrS8ENjoVYjjJ_dWMG4vZeRMYioo8v7Byfk2c9zQ>
    <xmx:x0GnaT3GlDlUAxlMHadsVpvFFJhKz9ee88LkXAVajg7lPhSk27XgHg>
    <xmx:x0Gnaeb_MIK-TFW60W7AQpILaDeb9FDu_StvWefYxYNny7SUNs72Rg>
    <xmx:x0GnaVg7w4osTMRSTMWiyYHKsz7kv1NdF08SLqDG_-mFKzLLPFZAeQ>
    <xmx:x0GnaV8T1srmyYphvTMXTNGkLRGsSwelYkHcdkgaBNLNZtgtjTug87sS>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:11 -0500 (EST)
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
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 01/13] rust: sync: atomic: Remove bound `T: Sync` for `Atomic::from_ptr()`
Date: Tue,  3 Mar 2026 12:16:49 -0800
Message-ID: <20260303201701.12204-2-boqun@kernel.org>
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

Originally, `Atomic::from_ptr()` requires `T` being a `Sync` because I
thought having the ability to do `from_ptr()` meant multiplle
`&Atomic<T>`s shared by different threads, which was identical (or
similar) to multiple `&T`s shared by different threads. Hence `T` was
required to be `Sync`. However this is not true, since `&Atomic<T>` is
not the same at `&T`. Moreover, having this bound makes `Atomic::<*mut
T>::from_ptr()` impossible, which is definitely not intended. Therefore
remove the `T: Sync` bound.

[boqun: Fix title typo spotted by Alice & Gary]

Fixes: 29c32c405e53 ("rust: sync: atomic: Add generic atomics")
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260120115207.55318-2-boqun.feng@gmail.com
---
 rust/kernel/sync/atomic.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4aebeacb961a..296b25e83bbb 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -204,10 +204,7 @@ pub const fn new(v: T) -> Self {
     /// // no data race.
     /// unsafe { Atomic::from_ptr(foo_a_ptr) }.store(2, Release);
     /// ```
-    pub unsafe fn from_ptr<'a>(ptr: *mut T) -> &'a Self
-    where
-        T: Sync,
-    {
+    pub unsafe fn from_ptr<'a>(ptr: *mut T) -> &'a Self {
         // CAST: `T` and `Atomic<T>` have the same size, alignment and bit validity.
         // SAFETY: Per function safety requirement, `ptr` is a valid pointer and the object will
         // live long enough. It's safe to return a `&Atomic<T>` because function safety requirement
-- 
2.50.1 (Apple Git-155)

