Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9142A384251
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569036; cv=none; b=hlwlimks6Pe8oPONmopgPsCtgCQk7zH9NlAI8fN11Yr7mupcbFFWOnyuTVVy47RD/bl66uKQ3Ov46cwAwZpPnFs0OGti8OFzbOctMzQsX1nrdmoiGrjnpY+xRCai1sGuxPkYX4bgDZoPIYsUOOAgax0G+CsWtj4nGAdgbXRCyjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569036; c=relaxed/simple;
	bh=AKPWmh4rrmUMnmPi7iqjv6GVZwNv+zZVTWNcBuZTt+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUJT9MywXyLv+pGOPjo1VD5pPN1NAk6Ydy+E4QBSD0WNjIDdfHnyFLk1olFRP6NDwPaPnQ41OcyYKfoJPDTwWGma8UpND5sAInytbDiyLiLF3fhrQgeVQ3hCLm1RXt/ggm8eCwKogS6cYYQ5e+8x/4vN4Ol3Ni72lP3YoHKcdN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o9w59Va0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9w59Va0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E02C116C6;
	Tue,  3 Mar 2026 20:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569036;
	bh=AKPWmh4rrmUMnmPi7iqjv6GVZwNv+zZVTWNcBuZTt+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o9w59Va0ExVnBDTZuef08TBp5gJmdQhTz4EE/vMYsrtZRPSLTFm15gZtXSxncZVn4
	 iZMVpbs96rk01CgoJ3E76jUM0p9xPdK/84fb1rJYDTJMP4o8muHZU4r7bqTxp0KU5w
	 uK3rrjaOqOdOcAe9sk8HNOztMI+mJNmXpt4ixRoAtqCRAb57x1PJVO+HUMxEhugGcX
	 RxlWTGrWf4GosqtZJDZ/vouzJU9I/iaFALIBy3ZgkJRuqh3IZ0iUSOMoX071DejJf7
	 qSUZtvcJI6xAFsrxsAc0W9y2/4axoAQXpy54QL7awLPO7w7pxnlDTCiPuCJGskuz60
	 QAXdVXBycnY+g==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id DD49BF40068;
	Tue,  3 Mar 2026 15:17:14 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 03 Mar 2026 15:17:14 -0500
X-ME-Sender: <xms:ykGnaYHsfeYARqrC-27u7mTbHj23DyPoxWiVGGxKe3m78I0s51CPJg>
    <xme:ykGnaavka_xcVTUBiMqusGdKgktpH1CmQVPoecVMDTpu8qI7nNy1TBaJ04ea9bOrM
    vP-8SoDgEaNVJpqDQSjSqvp8ZWoFQzliPFSWbFYI3lAPC0gpK565Q>
X-ME-Received: <xmr:ykGnaao8BVGIRkG3znRY67dbUnOexy7RxH82UWFYb56CR_SsSQKgFkhQ0rVCN_6ouiRa0vNHhAwJB-eaIWdKjvvL8yy8aWhf>
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
X-ME-Proxy: <xmx:ykGnaZkOrMgBnje84cVaP2-tBfiqAaBDWwuDcVII4PLlDrYmCeM-rg>
    <xmx:ykGnafiyGAg6CxOtfCJ6oXO6NR0zKwsn26pHKzB6DvY7Hc8BPA9AFw>
    <xmx:ykGnaYXNcF2pzQmVlMvlCJS3P1B5HwK-BRFsKVmfhRboAi84OyYnew>
    <xmx:ykGnaQuiPqityh0u7XgX0Hv4Q5Az_z7ONEd-dvY2zNX_UlaIPS6wvg>
    <xmx:ykGnaZafqR2ZslxvcnmJQcuY04Gviqa97LvNtUr9-b8DFdxltZL_nX7q>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:14 -0500 (EST)
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
Subject: [PATCH 03/13] rust: helpers: Generify the definitions of rust_helper_*_{read,set}*
Date: Tue,  3 Mar 2026 12:16:51 -0800
Message-ID: <20260303201701.12204-4-boqun@kernel.org>
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

To support atomic pointers, more {read,set} helpers will be introduced,
hence define macros to generate these helpers to ease the introduction
of the future helpers.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260117122243.24404-2-boqun.feng@gmail.com
---
 rust/helpers/atomic_ext.c | 53 +++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 7d0c2bd340da..f471c1ff123d 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -4,45 +4,38 @@
 #include <asm/rwonce.h>
 #include <linux/atomic.h>
 
-__rust_helper s8 rust_helper_atomic_i8_read(s8 *ptr)
-{
-	return READ_ONCE(*ptr);
-}
-
-__rust_helper s8 rust_helper_atomic_i8_read_acquire(s8 *ptr)
-{
-	return smp_load_acquire(ptr);
-}
-
-__rust_helper s16 rust_helper_atomic_i16_read(s16 *ptr)
-{
-	return READ_ONCE(*ptr);
+#define GEN_READ_HELPER(tname, type)						\
+__rust_helper type rust_helper_atomic_##tname##_read(type *ptr)			\
+{										\
+	return READ_ONCE(*ptr);							\
 }
 
-__rust_helper s16 rust_helper_atomic_i16_read_acquire(s16 *ptr)
-{
-	return smp_load_acquire(ptr);
+#define GEN_SET_HELPER(tname, type)						\
+__rust_helper void rust_helper_atomic_##tname##_set(type *ptr, type val)	\
+{										\
+	WRITE_ONCE(*ptr, val);							\
 }
 
-__rust_helper void rust_helper_atomic_i8_set(s8 *ptr, s8 val)
-{
-	WRITE_ONCE(*ptr, val);
+#define GEN_READ_ACQUIRE_HELPER(tname, type)					\
+__rust_helper type rust_helper_atomic_##tname##_read_acquire(type *ptr)		\
+{										\
+	return smp_load_acquire(ptr);						\
 }
 
-__rust_helper void rust_helper_atomic_i8_set_release(s8 *ptr, s8 val)
-{
-	smp_store_release(ptr, val);
+#define GEN_SET_RELEASE_HELPER(tname, type)					\
+__rust_helper void rust_helper_atomic_##tname##_set_release(type *ptr, type val)\
+{										\
+	smp_store_release(ptr, val);						\
 }
 
-__rust_helper void rust_helper_atomic_i16_set(s16 *ptr, s16 val)
-{
-	WRITE_ONCE(*ptr, val);
-}
+#define GEN_READ_SET_HELPERS(tname, type)					\
+	GEN_READ_HELPER(tname, type)						\
+	GEN_SET_HELPER(tname, type)						\
+	GEN_READ_ACQUIRE_HELPER(tname, type)					\
+	GEN_SET_RELEASE_HELPER(tname, type)					\
 
-__rust_helper void rust_helper_atomic_i16_set_release(s16 *ptr, s16 val)
-{
-	smp_store_release(ptr, val);
-}
+GEN_READ_SET_HELPERS(i8, s8)
+GEN_READ_SET_HELPERS(i16, s16)
 
 /*
  * xchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
-- 
2.50.1 (Apple Git-155)

