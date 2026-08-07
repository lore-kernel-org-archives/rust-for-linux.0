Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD6C3B27DB;
	Fri,  7 Aug 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086165; cv=none; b=Tb1sOxoJjSeI684nVHoVxjFSQwBPNLijAJv49xjlO53lIjGosLzZuxFQ9NOConwVL27kG+fADAHB9bEd6iijp08NfehnPYyljNIq+EoQ442IWz/bg9+TBK4M+BAeKWB6FUJKOkICMcMc+MDOyW0uFhzQb4xlg3IyZtQ+v8M2u8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086165; c=relaxed/simple;
	bh=JqcH/mibcR84zB0h7wBnVEuD0X2zbft/81pdfe10n0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkF3BSgHc0NcjZCj3WXicbG6tGJNFoTXWmXbcHGPQ0C0RwAXRf6LXdgykDlJkurC+8s+KFOxuYhffEtqe/Hj3uJi92FkJdS2tnhbk7ufEu1Jw9dqlTNJ6FudcI8cnD1ppAjOGK3fxPAj7S3sJZRw5gRHhoI9jR3KuCd4hilkKbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivsHK4Z9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivsHK4Z9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9737B1F00AC4;
	Fri,  7 Aug 2026 07:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086164;
	bh=3WjTSvvh4sYtO98lql8YoYHvCvWGaUwBwCoDwXD+M1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ivsHK4Z9C6tCQcYjd0aALisTfGCNfCctoAru3oB/uKfT21wLo8SUgiyxVg/iPot1j
	 epSVsJiJXiaZISkJ9TxjIOtHVof2UzVA3UmZt3bKlqIzgiBOAqyNg5AC0DRO7vFoGP
	 uYZg99r1LqDiXWrNbjVMY4saJ6MMDSgyts8xaXOyhL6fV67lyv9nDuM6VuKT+6Yjnm
	 wWXVDdhM1rmHdp5JSo73ds7s7i/TXVu1mehK6XD8CJZ17DaDAlr1k3Y/F2gws1nFst
	 GDa1mfDMmksUklpEsB03GcHqwVxMhDsjnEJTUPgDdL/dt4gmDpbEzIaeCPqxn6i/Nw
	 6bG0G55SgRHbg==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id ADBF9F40066;
	Fri,  7 Aug 2026 03:02:42 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 07 Aug 2026 03:02:42 -0400
X-ME-Sender: <xms:EoN1avR3y6u7adjzpQY_Cjir3WUMN_ZhJDDAPoCtqWt2Tv59cAq3Vw>
    <xme:EoN1atEU2c3TGhjVYzG2wNuVflkue8gyuO8WeQzw9l3OitBNsf5knkzc3qaZ-8ixw
    85_4KH1WsflMe6MZ2kS0co05eyhaTX6rnE5N6AtU9xyt7avDX7zYSY>
X-ME-Received: <xmr:EoN1amdFw9b_tJmySs-IJ358haew8KwrobGZ4gcMr9VE1R0xYWYmygSkCO-HC6Yu-zHgrcT1jpPf2cbDAdw1vdCEKpL_G4sV>
X-ME-Proxy-Cause: dmFkZTELsVbnxrvhPb2j61weS49pxhnQ59QQ/kkvzVAF7RfvMFBahj3W+J/ZYvUaUDGUKL
    rkIpWI9Kqh7tdFeNxTw91APFY2yZOuGFzh0R7L9linn/K/VkHskzHhqZIAbhz+FzEI2/39
    p/Gf/98yNPd7kqv7ASor+gx/DK4WZv4tGUkwpXImaVpTVn9yjG8Hsrc4m1zuPGR3jPjYfV
    aGaWr2EDt/5hU/phchzQPFGxTjKWqqv3f39Pht190FqbXj8fyXB6xLi7X5zcPt/Liyw23y
    b+4UgNbRpkgjQlqdkJa7EiS5FEj8Oxro36Xe5RlI+SlnX1fghWIXGuRondD8d1wH6SlNdT
    xHO4wfmaw0ezJNYMhR6VbkkU1ajglv6ZQAghdGVVEVMSJJXM8aEuszcfSu8tH3Hc+ljaIs
    5bQYjkyvC4nkOcJIH9R5cwGnHgv5onGcUvsX76hhsRdGO5NB8JdZ0xUv0R6X2EBtWQ9MDU
    PjmG7MuTJ5zYr7OJmUkMIq/Da61KK3s5OtYUNQUhj0q31x3FciuzDIuVMvBlu6aIVaNWZy
    kAysyC6LVN2MZokAVWQlQA8+Hj+4BIyMOVxNsFv2nUR2EKxqMHDGjoHwT/OW0cG3sRe+nH
    4ZBrQBOQZT8SWBVVvfBPIyxcb81iWhtx1st3PHVE9KI6q14tHEdz48wB0UMA
X-ME-Proxy: <xmx:EoN1asLVt3cui5JGVYArewRcnA708UxkK2wO33usoP6xSUhooqcuTQ>
    <xmx:EoN1atrrCzHgNbLYP03dqMmV8s2WwTxP2h0WXnUxCgQ33aShiEyaeg>
    <xmx:EoN1aqUglzN647BLnxi5XrHVJvAcq1K4kNzHUa0YD_VHOCykrLwvHA>
    <xmx:EoN1ag3XiPlgtsA7-C-du2mE-aup9S79fs16iYZ7-5l49o_XkoI0EQ>
    <xmx:EoN1aj3anVM5zDAivRMCORpVVUqc6UCwRCxHmRDpQ-QtlvCkSjfLEZgP>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:42 -0400 (EDT)
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
	rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [PATCH v5 12/18] arm64: sched/preempt: Enable HAS_SEPARATE_PREEMPT_RESCHED_BITS
Date: Fri,  7 Aug 2026 00:02:09 -0700
Message-ID: <20260807070218.27144-13-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260807070218.27144-1-boqun@kernel.org>
References: <20260807070218.27144-1-boqun@kernel.org>
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

