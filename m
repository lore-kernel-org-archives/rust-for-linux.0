Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EAA3A5E65
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 20:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569034; cv=none; b=ZMDkqRGvG7bHjxPUq4cDcR0feJUhehrAgqt5A5r6eo2gC2886OoGeQYUXNXfbZW2DYLrRTABKeW+dtGbvduhrNJEgmXA094x+5lFeFRgYSwaYxxn4Tz1+t6POcKQeGIbwfP0zx3c5u7ZLwDCRkPDZR+nzn/ono+zTuzR6U+CBaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569034; c=relaxed/simple;
	bh=Z1tKkFOpyqvATYfskTsH6WPac+YzXa67OCKt6VLZh1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZaFrS0AwxrrEvlgDOroqVs/QHwsAXeH++AxwediuF6VmCtz4KKx7QNwX74LTDcm7+BzMgffiuaQk51fMiOnRJzyjOJQrwkumeiAF30I9V9+eeT9rxEnmXvtG0sN4Xo9Yz0wJTQ9PBqBkTYiccFLzuq9JXeT1noFPPA50gmZELw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1Iy+ReC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1Iy+ReC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F48DC4AF0B;
	Tue,  3 Mar 2026 20:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569034;
	bh=Z1tKkFOpyqvATYfskTsH6WPac+YzXa67OCKt6VLZh1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D1Iy+ReC1pSuxZNR4MKkkWiiJJ/Zh4cH/7B1nsvDBQ081uBJmsTF2dv2E97JwUHDk
	 AxULJlKs8AiJ9Rg72Vm5n6bdH+iANzSaTXwFHWD6oggt4TcAaKHerc9OsMG6BFItDm
	 KJg4tEQOoGeGOqUsP5ftPBKnxEg4nD3zM2juRHIwWLFTtfAs77EdBPNaNxZWLSATRo
	 QqPmKWpFZA1S3QJZsKFo188+gtK8LMxauNjbWlB+c5Rfq5VHKUjsicwavs5tsYu7Tk
	 xKDd48e3OeaFzvCB8eWAtRJ5UgV707hn4Sq+KBo8gQHfi2W+BgXspNx6Y9dLBBLCxg
	 toYuUiZjYUfCg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7B28BF40069;
	Tue,  3 Mar 2026 15:17:13 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 03 Mar 2026 15:17:13 -0500
X-ME-Sender: <xms:yUGnaa1m_K7L_hW02ocRHBsBmRoS-4Yp0EmGjlNgWSYYUgxJhBJIqw>
    <xme:yUGnaWdxmcTS8i4y3OyjwTbaZjFTJUyul-tCBabQjDAqaqPB237NOt5gnn0oPd5PD
    PRh5-anhnnKiZCxHnsdG5VlbmSuJ-GP8hUzvogUm4y9Za9mhmFWVw>
X-ME-Received: <xmr:yUGnabYQKz4fs4Exo2j0B-kqzY7Cgr94otG4PH-lMrUTwP-IdVJCsYSPpXOk6aIHqtwTgkwtAAaf4NPVm6di3sUqz09-GakF>
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
X-ME-Proxy: <xmx:yUGnabUfWqH2yZJcGH0_BtdzsgModC_CI_o4WxQivu05v2nTw1ozdA>
    <xmx:yUGnaeQjZbvacgQyLVu2UQjZD4IWZ16gfTNu1ls-9k5OKRZ1bsc-VQ>
    <xmx:yUGnaQHqACR9u_G09_-51Dt4wpLn1HSd4mA4ASlRPyRr-XLE4Bfq-w>
    <xmx:yUGnadcqgncConn54zqQHhxRip-2kWJT5kDqtEcTxU0o0qLNWyq-iA>
    <xmx:yUGnaXImYg6bpJh6F_Fz47FQhlHgMK6hQOY10TZiA0KOa55Yy0fO6OQi>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:13 -0500 (EST)
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
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 02/13] rust: sync: atomic: Add example for Atomic::get_mut()
Date: Tue,  3 Mar 2026 12:16:50 -0800
Message-ID: <20260303201701.12204-3-boqun@kernel.org>
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

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add an example for Atomic::get_mut(). No functional change.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260128123313.3850604-1-tomo@aliasing.net
---
 rust/kernel/sync/atomic.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 296b25e83bbb..e262b0cb53ae 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -232,6 +232,17 @@ pub const fn as_ptr(&self) -> *mut T {
     /// Returns a mutable reference to the underlying atomic `T`.
     ///
     /// This is safe because the mutable reference of the atomic `T` guarantees exclusive access.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::sync::atomic::{Atomic, Relaxed};
+    ///
+    /// let mut atomic_val = Atomic::new(0u32);
+    /// let val_mut = atomic_val.get_mut();
+    /// *val_mut = 101;
+    /// assert_eq!(101, atomic_val.load(Relaxed));
+    /// ```
     pub fn get_mut(&mut self) -> &mut T {
         // CAST: `T` and `T::Repr` has the same size and alignment per the safety requirement of
         // `AtomicType`, and per the type invariants `self.0` is a valid `T`, therefore the casting
-- 
2.50.1 (Apple Git-155)

