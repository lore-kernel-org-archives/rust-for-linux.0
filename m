Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1074037C922;
	Fri, 31 Jul 2026 20:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529859; cv=none; b=mM0jNTdEryEnepNQ9RWdfqfBI+RTdAMyldjUTjMcYAYKnCQJUw9P1LeD1i6XlacZEMxyhqUBNKCxfHEy9LnT9es9K1ce+/MfuGOxwlM2pre0/6VSrFBsiaYVPlGQNK9muuUI/Rj1p4+neWkhpaTAJivaYXEQkrx7quBohw+ODTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529859; c=relaxed/simple;
	bh=yofG9RF80NQjUze7PJ8mZv/CsasdVwXyT7Se9I6pjwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbWtV1s6MUAnrrtDzKt+L/oIk9Qn0pTO6KP2R1ApblbNWqyau6zAvE/ARq7kn1hmpAj8pyCoNSo9qulVJ7OB5PbGuApaZ/mXSum6bvag15IBOU2Mdpw6E3fw0hCcIWC2vrE5zlXSEBggldNVq85+Ci+FSP8iedahz1ZSP29Fo0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyoP+f18; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyoP+f18"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBAE1F00ACA;
	Fri, 31 Jul 2026 20:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529856;
	bh=9stI0iersWJs4iyjIhDsa1iyfFyNlTFSbpf6Xl0dIso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IyoP+f18s9yEW8PiSUAazUwEcJG2FyZuRtsBtWlqM4KdYUhe75FdTl6g4lhaDUGPH
	 2PbgN6aZ73KKO/dGruTA6LJReT/jM8Jb9zGxd2xrjTFwWMJMg3gYBQgsWalKo/8CLo
	 jC+LbmhmnLIigmGUD5jhlc9W/G92SX/51lNnS2QxaW3rMgECjbMvELAgM5LLEku4SM
	 25GE/HaXLdt5YP8X+LvmH3NyVDE+N25uxzhaxW/Qk6nH1yDFbJSs+EPfMjVCAapEdY
	 OJrD2lfTMsJTABE1/ONuTFOMPf6R5JEy1ycIA+0OX++x6xBxrKxekOn+cszSjEAsjJ
	 U8/8h4mRvrFUw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 89703F40077;
	Fri, 31 Jul 2026 16:30:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 31 Jul 2026 16:30:55 -0400
X-ME-Sender: <xms:_wVtajkX9e_cHeypAqTJP1Tp1o9fk01e1te65EodS5pOYi2h0P_ORQ>
    <xme:_wVtasBgRGWUobOCXRyBtn6T_S7rtbq1eb_iXxfECZMThs-7aLdjQpumigQIfVxrz
    9pe-e8Ea2SBthFsZmGmxIT5w1Z8tIf-KqoyTWvTyazHkVmtKEyxaPQ>
X-ME-Received: <xmr:_wVtatA5dF3wIDTWl3Bj1qGNWwXmDdHwz_aJEgLvhaBzOuFACvGpNzhm38UR1sdhV95yTcszSg94cTq5lqD3njbipIM9m6Ea>
X-ME-Proxy-Cause: dmFkZTFIC2VVTLK13uDkALWshPgkkwS9DC5Q8ljHaA42IPRnmgkrxQSeK5HYsDRhN4GhLk
    6Lg9dLbHgT0DH+qVaNoW+UUFxptAXHUIdqGwEJPczm0ywmTmF9/CSNIQrGZfaA0/SYDXt9
    FCHeSX4ZePBeVl3Top6EjJd42yXsFqp+L0LPuLnabUXIo8fT3yX5hMg5WmOramFVWkXrXb
    dtjJi0qTpjt7TXVawGUwOyoJ/Q6jP1wNaVQH+6xYGS7UXVpHVglHDWcX7SjmpbiByeHS7C
    oLMM3JHkGXdP7WkAt31sGvl3IAmYfCODupTHvovIO6+oDBZmEBw2YefLw5AUKyninHXIXy
    0ZXO16SKIuDo5nyOIq7d02biZVmbCBmXHXP05KiV1qIcjo5kZWDDRtfU2ASUo8X7LGFrIt
    Tpix6SzsCRWNcrMnGj2rB1DUUCKAM62wzNVK4Yj95qqbVu2uELV5lMIkIIptJKJJjrI2oO
    0Aatr1LV4heqtjommZRtFmfYM4czdD+mNtbkrRWol37ObifjxcHzaXXzKIyrc+8OuxBarn
    dbi6PPzLgBHZGTQWAutr7TSuZcpwvdrEGtzH8A68YThDJgA0kmk2WLvjQIkgqjZBBP4iuP
    hv9pil5GY75sR6yTDxqgWm1CJwPEKUEqxqOv+IjzfQjjMvxzC1leg5J7ds7A
X-ME-Proxy: <xmx:_wVtarG8S4DHOEMKDdlCWx6PItgB6N3ih0kcZHKqhzP-Cr61XUxoPg>
    <xmx:_wVtas7wbf9NIkkZfSy6ZjfMf6wDKNMZY3fvXC7La3GSZYol6-fEBA>
    <xmx:_wVtaqQb8Wo0EhYwLbj0nLhgj5Agyw-NPpqMc0r7s16GU-wAdWv7KA>
    <xmx:_wVtav6taR1YO9qYEsTRQIwAiyi97U-Vf7o20b2HE4vtPjr_mifHeQ>
    <xmx:_wVtavRdrqlPPWgIADv3WMBIj7TPbzL3VkBqYn9YTZvJUDQCzdPHzg8S>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:54 -0400 (EDT)
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
Subject: [PATCH 11/24] arm64: sched/preempt: Enable HAS_SEPARATE_PREEMPT_RESCHED_BITS
Date: Fri, 31 Jul 2026 13:30:12 -0700
Message-ID: <20260731203031.13679-12-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203031.13679-1-boqun@kernel.org>
References: <20260731203031.13679-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM64 already uses 64bit preempt count and the need reschedule bit is
maintained in a separate 32bit than the preempt count. Therefore preempt
count has enough bits to represent 16 level of NMI nesting, hence enable
it for ARM64. This saves a per-CPU variable and additional instructions
in the NMI path.

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

