Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456FB3D5661
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 20:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569049; cv=none; b=XLUBIxQlWAhWitURtMhqY/Kr/IppG52kHXQ+l+1eIa7TtooZgPp6kB7nPvTXcR4hglNW+vNgvbr+jYdr8Ton2Pey+C6L36BhE1LhtuFYe3ygr/CuVK6kq1GV0kVrWFF0yv56vY3h8SiOq1hEN9yiM60aZZY2Z+QCz5WCwl5bmfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569049; c=relaxed/simple;
	bh=45m0CJiBLXF5Mo1YFzO2suUGnf1ICyutZtmKXGX4zRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxofwDn3Mi3NsaWx16CD3aFrJIWFCAS7P7MoR1ypLsUyxMl7HA5QK5cuDRHYZrj0cn3yblzoGayR1GS8Y5KyO5o8XBHAvdvTOAHA5JZT8DJmUm0eTm9Wthjn4r1m7v/++n7X3BLXih6z8zSUjEUQzzBz4VGQYcE0HSFqpAQbbWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRoXlFQc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRoXlFQc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF03C2BC87;
	Tue,  3 Mar 2026 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569049;
	bh=45m0CJiBLXF5Mo1YFzO2suUGnf1ICyutZtmKXGX4zRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRoXlFQc42wRBb+tZgNqdnGN6sdFLOnbmDpqXZ2xjoWlP7FVJBiNRGWQFD79bUt1I
	 pWC5hHzaJOEqMYJe/ZTnI9Gr2MaNSyAIOK7FGwRN562ciraV2evZ1vvLtP7xRIXRuu
	 lQOTcNQ6m4HvbsDy9n4fxi9GOSKm7Wl6lK0jz+jpsTQXxFUJFJSyrw/TBn5sD8LmxF
	 9S26ozEgodVc+J0cKLQfWWkkGLU3ldqucyDyQFV4D9yOpoEipZBfUgUgjgf1EHNpFY
	 B2XIU2OIjGe3aHOr4AlDywZAIr1P3pQEj9LC52S3KDm1cugjc77E9aYXP982RET0A1
	 FmOqRHSfTzbsQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id DC0EEF40068;
	Tue,  3 Mar 2026 15:17:27 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 03 Mar 2026 15:17:27 -0500
X-ME-Sender: <xms:10GnaR3RS9mj5uFu-rnVfoKz9I11OlUwb27Sm56eySp_oiN9dtKYPQ>
    <xme:10GnafrmdeYSkIgriFwz9dspqEhT1ehyhUnTITQJUEI3M0Pyml0bEV8f7vwcj2HJE
    pFngKHoE_7Sz984qn1qYkXc9JsiZxQxOalbllazyrM6MOT8N-K4Bg>
X-ME-Received: <xmr:10GnaRj_2uLBwM6OJxIUpi3XSrbrgeC5cmq7MLvhrxIGsdtlgax1isuqq_5EcXwtSR6za6iX0SahZTBdmX1XZhm-depvIW9N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekieffgeevhefgudffveffheettdfgkeeilefhhfduhedugedvhedtteegvdeugfenucff
    ohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    rhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpg
    hghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:10GnabmMQQarWIFV2FjDaUzGGED5yL-9eA5IOpNe7J_aRI5vF7b7CA>
    <xmx:10GnaaqoNMvNbFwWoTQfM6QYYBdDJY5sRAO6vauB2Sk-VAum5NKnAQ>
    <xmx:10GnaXLKMp2kM5KDeYOn0qBA2rkEPcbGfovxz2L3pL8ejnx7lzBmvQ>
    <xmx:10GnaWC6loMoTSUoFf5s600pWsqWyftWnyzBWMZiloTc0dpbQjMBlw>
    <xmx:10GnaZ7mhVS9tgdthP-oXvURk7er6UIhVAE282KFZ2kAfkdSgy4f6akA>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:27 -0500 (EST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] rust: sync: atomic: Update documentation for `fetch_add()`
Date: Tue,  3 Mar 2026 12:17:00 -0800
Message-ID: <20260303201701.12204-13-boqun@kernel.org>
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

From: Andreas Hindborg <a.hindborg@kernel.org>

The documentation for `fetch_add()` does not indicate that the original
value is returned by `fetch_add()`. Update the documentation so this is
clear.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260220-atomic-sub-v3-2-e63cbed1d2aa@kernel.org
---
 rust/kernel/sync/atomic.rs | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 545a8d37ba78..9cd009d57e35 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -545,16 +545,14 @@ pub fn add<Rhs>(&self, v: Rhs, _: ordering::Relaxed)
     /// use kernel::sync::atomic::{Atomic, Acquire, Full, Relaxed};
     ///
     /// let x = Atomic::new(42);
-    ///
     /// assert_eq!(42, x.load(Relaxed));
-    ///
-    /// assert_eq!(54, { x.fetch_add(12, Acquire); x.load(Relaxed) });
+    /// assert_eq!(42, x.fetch_add(12, Acquire));
+    /// assert_eq!(54, x.load(Relaxed));
     ///
     /// let x = Atomic::new(42);
-    ///
     /// assert_eq!(42, x.load(Relaxed));
-    ///
-    /// assert_eq!(54, { x.fetch_add(12, Full); x.load(Relaxed) } );
+    /// assert_eq!(42, x.fetch_add(12, Full));
+    /// assert_eq!(54, x.load(Relaxed));
     /// ```
     #[inline(always)]
     pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering) -> T
-- 
2.50.1 (Apple Git-155)

