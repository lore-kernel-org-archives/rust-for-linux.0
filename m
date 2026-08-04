Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5E746AA81
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860119; cv=none; b=bqEa3xVqYmIrVHOVwMD6H2DjrUSruwxDire39ZG/6MRYvF5b0pII0xRcMUz43C4kWI5U8daSYlvHHmfVWZ+aE1p1iwFJdwMPeYJIl4pmaHLpnbQWyIOKpqemSz34O1vFk4ZsR0E5ebqc9xZ2EUaoYK5vQAianJlW3KvRA8sGqP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860119; c=relaxed/simple;
	bh=JqcH/mibcR84zB0h7wBnVEuD0X2zbft/81pdfe10n0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSja3KT0TYkywnbBFXhFTeMe2FCwYhPIp8bLPplbepVVDGVojWvjO3BeaF6LUtqeuaP+6/Vgr8D5xoxa2msfLuFPxOlsChtpwLQ/ztqDRv259zwS1HBfFSn52Q3RxjGG2V5J9zYa42Ts7rgSd/zfa+QY8vJkjnuVMsX5lXDi+E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkF7ch6E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkF7ch6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672D01F00A3F;
	Tue,  4 Aug 2026 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860114;
	bh=3WjTSvvh4sYtO98lql8YoYHvCvWGaUwBwCoDwXD+M1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hkF7ch6EqHcD3DxZeXyGIrGIfxtKs5a5SjwBImofctXGh0sIrin6ePge8iHymLwEG
	 CBXvUw0PhvfyKBZ67abkKQsDJkrTVeAPLx1tdnEoihq7pGdNJKv5o2tL6CTkiZNG0m
	 ks73mFk9ZzLdL031rZRNmSzKMd89ZBcJiT5QHGx1rqHMmd/Z4fzjBsk0j8X9OjvVds
	 jj24VXVgFGMsIA9BJAtH6kCnR5iFlFTBdlfMvLjtBsi/UEfhtWNU8unlBwTR1S39+P
	 JNHx1df49oIYuOP6JHhXCGwlpVEM6oi2qUfE57wfXZEQ/euJlYUeDP15pXiXOENHsb
	 v5CaWsxnzRamw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 97ED7F40066;
	Tue,  4 Aug 2026 12:15:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 04 Aug 2026 12:15:13 -0400
X-ME-Sender: <xms:ERByakxet0CPjdTZ1zC-UVouir9lKWej6-kimq_DaSHZY6ZZa6KmHg>
    <xme:ERByate1W1M9Pg8y3iaCndH5eIUyGqd0HP-LvFjNom7AdB8JAAqxhB_Whd1G7x1hd
    WqSDM944QZkqdJ0XuGUyvas7FT9Sjm4hg5QwaWySf_qYVWsoxCXKQ>
X-ME-Received: <xmr:ERByapseChfLkl5b4AnHRfdnQqG67eYao0tuxTZkMM-uf2RlnD7nSrzYhfQJ2tUjLre0KD0592AZdSSpEUlWns9r3DO-eJ1K>
X-ME-Proxy-Cause: dmFkZTFdfHSt+dGlSIgweIKZqd43ZIr2UVwMz+DLCV7Uxtqr2tWdjT0gNVbLG23y/ntMNr
    yg2u9xNueu4ZlCPesc7IGVMS6ZqisyNG2Hp2kDVIfbBL9QFp1F1pvbwsQcrNmamnsGJsZY
    AmMncETOYZEkhlG6T7JDS64AVGc7Ln4zXY6x3T0lHgb+OYvht9swwTIGsG7Xot0GJG9bWc
    fhVx9JgcfYh5ECBMh98FFx1XWl/VnjhK7S6I+ssCNmeXl+D6Do6MWM72zOvrRuLzi3YdIE
    +uwF6SMc7tQqt75yJIKNoQF+R4TbmXy2JAxyIWDxHsQYaXIqpYC7ilWb/r9+jjwAD2Jci2
    WW/2rfk53B+6wqOwUkWkBX9tZzueTv2kVzVRGOnJreZsSVxqrC2VfDfnWJWc3kFBQBrBvj
    GnMlgil+/02b948U4F3se/vAZsftBNigbl8vTbnvWdDwnZBtnARN9k66R+h+WIj/cGMG32
    z6558YZyvCiAUckAWMR5NSg5L/qUiMWOT65zKUtubM4T61cA21re5BJUNfIBuaHNK4uzQs
    szkHjosaXLoy/MvsbDxSc7cJhI5RqgqpeVf57hgZ9AQ9lKZcaC40R38llGNX4aTDr02aXh
    RFxm1XY4TlXQo9xEZMQDDKVkfLth3aVp7mLi+2BbP63ZjKPKdxMQfEeUi1RA
X-ME-Proxy: <xmx:ERByaiCJ0CXVSbX7xR50sQo-MjJfRBQ6nkhPdO0DnwEgBQjHNuSpyQ>
    <xmx:ERByahG2-IAQ0Vhunt3yIAg5O97263xKCnqPGunXj0p56P2ahegaNA>
    <xmx:ERByaitLBTQeO7Xp9uM4OkBEszqE16sg_fmWfoYoQyrifWcdYS7sTA>
    <xmx:ERByank0KcAqaBP2IkrZUrQaOoHX7YUWJJtcsyvkGJG8qU8D6QBKUg>
    <xmx:ERByalMicas1mGNN9RRYNChDdPkcg03SeKuVGaQnJ44m3X0DiAQmT1s4>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:15:13 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 11/17] arm64: sched/preempt: Enable HAS_SEPARATE_PREEMPT_RESCHED_BITS
Date: Tue,  4 Aug 2026 09:14:33 -0700
Message-ID: <20260804161447.84806-12-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260804161447.84806-1-boqun@kernel.org>
References: <20260804161447.84806-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Arm64 already uses 64-bit preempt count and the need reschedule bit is
maintained in a separate 32-bit word from the preempt count. Therefore
preempt count has enough bits to represent 16 levels of NMI nesting,
hence enable it for arm64. This saves a per-CPU variable and additional
instructions in the NMI path.

Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..349c3533cd1e 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -247,6 +247,7 @@ config ARM64
 	select PCI_SYSCALL if PCI
 	select POWER_RESET
 	select POWER_SUPPLY
+	select HAS_SEPARATE_PREEMPT_RESCHED_BITS
 	select SPARSE_IRQ
 	select SWIOTLB
 	select SYSCTL_EXCEPTION_TRACE
-- 
2.50.1 (Apple Git-155)

