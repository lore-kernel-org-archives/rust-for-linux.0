Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D162542F57C;
	Tue,  3 Mar 2026 20:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569050; cv=none; b=IaGDM0CsNDJzZ93qxua/9aPcZi0ab2DCB9y1PMT6kA0EdqKglGtjmZP/PcG+ydCpLXtGVIpXkUT1noXkep0tvycYQwvkEZvBrfSgKSzy/J6PbHwKJth/iIEnuFYArv2Y+X5M8vhABHHt+9a5jD4XwchEQMpu7l4XSeVJF5TcKPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569050; c=relaxed/simple;
	bh=6kKNudW1gJgGgJ9BpMFix/NIUUSMcOPE/nKLOWbaQYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pf1fFog52qy6owWpk2q56JSwlxR29fl6dmRJON6reiF02Bw06CpIkmiClnTsqRxvQFnXOX7Bg5Xb8nrA8p2DgHirOhzHqHJ3LZPUwpyelkCoertSpaVl8dz/AIUul1nnPgrFuja9Adc2B4aRowSbb8ttlKTGUHaanI0lGLAiDZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExuBhxx6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExuBhxx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3939CC4AF09;
	Tue,  3 Mar 2026 20:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569050;
	bh=6kKNudW1gJgGgJ9BpMFix/NIUUSMcOPE/nKLOWbaQYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ExuBhxx6z63Nfj89HtKwcFLl2SbPL48BW6DlIHDt2dl2yyQxvOUD5Cwh/9aqU47cG
	 q6BuBPBZ90dTX7cbosihOa9O2CMmxQ83FwbiYBmpKM3gIh13QNcNoub8urbESgjcMH
	 Lb0AC3raDpGM7pZF73qo4EL3mso037TNE39X/Izc561QIc6g735OdudxaqAb4N9KKA
	 xKuLLORcl29VSKF54XyNNcYbaBicvCA8CPJNkX2ZFxA7o4UHDfxVN+8fuj34Y69mE8
	 AOJfyyGkCAoJ3rje+mDS2xL8BSg88JalH9nm8ZNLh3xvOchcb/jMtWQ4umSSbonTCR
	 e5VlqgYHx3q6A==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5CD8FF40068;
	Tue,  3 Mar 2026 15:17:29 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 03 Mar 2026 15:17:29 -0500
X-ME-Sender: <xms:2UGnae0_kjcyxBAB6gwqQaZys2BaIW1kssan35S764P4cEaKekZM0g>
    <xme:2UGnaYr1wdkuHYuEYTXCokcjbA2SSaznDNZ1bYUf9EuziSaNPBtUZl43nQI8l1NsF
    vug4x35Ud_7hRUlnbU8Fuv528Ylo3j1ECrF7xLi0sXa01WX-fxSIoU>
X-ME-Received: <xmr:2UGnaWiSEhyQjx7YWwJQSGMjYiQXaiZuTx9wBxRd-TChjsTVGb8RkkPRdYW1hD_7hhy4qsk3CRJMHoMN-QlN7RGu7phsTzUt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekieffgeevhefgudffveffheettdfgkeeilefhhfduhedugedvhedtteegvdeugfenucff
    ohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepvdenucfrrg
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
X-ME-Proxy: <xmx:2UGnacklBX8TmQmiiXJlJP3pBl90NvFArtOdQ--1dJ1RWxMEWiryFw>
    <xmx:2UGnaXo0wewcXYU-rU7hLtlH4VDmB1NdBQ6Q8lJeFe_Ca3onvYr6vw>
    <xmx:2UGnaQIyZ2946G28rSMd4VgC3Bn8EbsJfEFKgApJl2Z4jzL8uy38ng>
    <xmx:2UGnabAysnH-sHTw-cOwiLWLI3HOFYDN1yOss0f2SDiQsaWFS_ydMg>
    <xmx:2UGnaa4AEK5a8ZPLmMExOe8fao5AyJV03oxEOAMzm22omrjGa1EWyhT8>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:28 -0500 (EST)
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
Subject: [PATCH 13/13] rust: atomic: Update a safety comment in impl of `fetch_add()`
Date: Tue,  3 Mar 2026 12:17:01 -0800
Message-ID: <20260303201701.12204-14-boqun@kernel.org>
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

The safety comment used in the implementation of `fetch_add()` could be
read as just saying something it is true without justifying it. Update
the safety comment to include justification.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260220-atomic-sub-v3-3-e63cbed1d2aa@kernel.org
---
 rust/kernel/sync/atomic/internal.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index b762dbdf6d18..ad810c2172ec 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -337,7 +337,7 @@ fn add[](a: &AtomicRepr<Self>, v: Self::Delta) {
         /// Atomically updates `*a` to `(*a).wrapping_add(v)`, and returns the value of `*a`
         /// before the update.
         fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) -> Self {
-            // SAFETY: `a.as_ptr()` is valid and properly aligned.
+            // SAFETY: `a.as_ptr()` guarantees the returned pointer is valid and properly aligned.
             unsafe { bindings::#call(v, a.as_ptr().cast()) }
         }
 
-- 
2.50.1 (Apple Git-155)

