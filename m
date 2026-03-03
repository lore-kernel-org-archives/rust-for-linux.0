Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA1B48A2B2;
	Tue,  3 Mar 2026 20:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569045; cv=none; b=iH1A/nQyCM4O7G7NIHILINwnuQkdRXbdEEXx9c4wxDzUfoAICXMvvA3YN5+m8visaX5yvsZWCH/AY5w16TJ2n6Bo82AA/g8RnDZGzi5hH7ciEiJo/Vy8s/CYEpAzZS3j0PUINoxwQAFpS62zfbCWeLIx8pAHjLIEP2r/VZrG84M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569045; c=relaxed/simple;
	bh=I+LdWH6GEDuniBtO1nwtn3nzkGl1DvaM9Bc5RT7vdoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETGJY9QAelEbL+d9ZdF0OA1LEAPEirWQ0ZDNv6yEzidLi8jQ7H7JRNOQOazwBoMG81+w8XwJ6c+g0Ni64p6cRzhZhAenUh/S6tTM5DxEIYR1vp9Ijx+N86RnmSYz8r6He7j4oxslOCR3p7jhRSrRi89YmzL6J9ccRhsKmtcoSs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6RgMGld; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6RgMGld"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597E9C4AF0B;
	Tue,  3 Mar 2026 20:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569044;
	bh=I+LdWH6GEDuniBtO1nwtn3nzkGl1DvaM9Bc5RT7vdoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T6RgMGldM8jxDuhWmYfwvYlu8sQVReXICMThTDo5X44x6BO1NRFKMlrylAfNcG2qO
	 cycwdZq51awWkQDgNenKcqHBVwLM+ZkAoPcVIpHRYfkVodGoZl7+6EN5EZEwK6Agt3
	 VqLhdJeqDosZUb82BcSoeYfL7UiHvX9037F1Rd2SJgYGI7iXZ+JiYaIFvqRJh4L0YH
	 yXhqSYXNS71thlD1dQ/3pQz2evQ6xpLrW1cQxrqO6laGHsXjOC7xbOHf505qPWmNVX
	 zqfU+KjDZgprKkuf725BMxklpGHlhm7pJQqKHIC+2MFqTLcgRUVjBir3Wotj11M7h2
	 FEGulcFrNJJrQ==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 88675F40068;
	Tue,  3 Mar 2026 15:17:23 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 03 Mar 2026 15:17:23 -0500
X-ME-Sender: <xms:00GnaZYB0FXwbEgBvykomWICVNA5mdcDEKlizXQVvy_ltqeIGj-Smw>
    <xme:00GnaZy8q8Yo2IrpEXHT-Ypnofow4JGpeTZltCsfRX45XgdOiXkPgnuOZ_SY84or5
    8g5OUVXbUdIcTds2k9vgyOrnw-_UQN90IOndDQGGZ3_DkcV_uUTPg>
X-ME-Received: <xmr:00GnaUe0YtoyBEdSjHikWi3TcQkkQgWzmZ6L3Ocuwz-aq7IVx7-KO-McpKPWeSA1mCaeGWMehGCDTO55U4GDUrQDRzrYBs-L>
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
X-ME-Proxy: <xmx:00GnaXIKq6m88e-IOgLtglp7zzbHdf9FuXlPIjyhLMCzrqjS6CgG2w>
    <xmx:00GnaV3k-kQMfDtbW5pfrB5TnpGlEBpO12U9wQdrGH5g6kB6S2aBDA>
    <xmx:00GnaYaTPKEm4eRzqIQ7UKRtUUfJzagovp2qbgOg4s9NW816pXQ2SA>
    <xmx:00GnaXjW0gBGA4708xfLIHcB-6HaC418juVsTdkUt4_hKudpPl5ITQ>
    <xmx:00Gnaf_fWdb_jdyWYli2KvEnlEc_nuu8dNOHiMQS3AM2m7ws8UdXH1qt>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:23 -0500 (EST)
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
Subject: [PATCH 09/13] rust: list: Use AtomicFlag in AtomicTracker
Date: Tue,  3 Mar 2026 12:16:57 -0800
Message-ID: <20260303201701.12204-10-boqun@kernel.org>
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

Make AtomicTracker use AtomicFlag instead of Atomic<bool> to avoid
slow byte-sized RMWs on architectures that don't support them.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260129122622.3896144-3-tomo@aliasing.net
---
 rust/kernel/list/arc.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index 2282f33913ee..5e84f500a3fe 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -6,7 +6,7 @@
 
 use crate::alloc::{AllocError, Flags};
 use crate::prelude::*;
-use crate::sync::atomic::{ordering, Atomic};
+use crate::sync::atomic::{ordering, AtomicFlag};
 use crate::sync::{Arc, ArcBorrow, UniqueArc};
 use core::marker::PhantomPinned;
 use core::ops::Deref;
@@ -469,7 +469,7 @@ impl<T, U, const ID: u64> core::ops::DispatchFromDyn<ListArc<U, ID>> for ListArc
 /// If the boolean is `false`, then there is no [`ListArc`] for this value.
 #[repr(transparent)]
 pub struct AtomicTracker<const ID: u64 = 0> {
-    inner: Atomic<bool>,
+    inner: AtomicFlag,
     // This value needs to be pinned to justify the INVARIANT: comment in `AtomicTracker::new`.
     _pin: PhantomPinned,
 }
@@ -480,12 +480,12 @@ pub fn new() -> impl PinInit<Self> {
         // INVARIANT: Pin-init initializers can't be used on an existing `Arc`, so this value will
         // not be constructed in an `Arc` that already has a `ListArc`.
         Self {
-            inner: Atomic::new(false),
+            inner: AtomicFlag::new(false),
             _pin: PhantomPinned,
         }
     }
 
-    fn project_inner(self: Pin<&mut Self>) -> &mut Atomic<bool> {
+    fn project_inner(self: Pin<&mut Self>) -> &mut AtomicFlag {
         // SAFETY: The `inner` field is not structurally pinned, so we may obtain a mutable
         // reference to it even if we only have a pinned reference to `self`.
         unsafe { &mut Pin::into_inner_unchecked(self).inner }
-- 
2.50.1 (Apple Git-155)

