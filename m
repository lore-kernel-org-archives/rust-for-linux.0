Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728794A68BC;
	Thu,  1 Oct 2026 08:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843142; cv=none; b=jDpSth8dfpb+1Nkz1kby17DwRvRBKCF4X0AkCVL9CCXg5pBjWB9DNgHfFpj09l4LW0rzzKHX5Cw4LQpCfjLITZeusAGtieYCR6VbgxEJbK2drEJa7aahMojk+7ZB53S/HgS4lWJrOPHtLmmqeVHQpL0Hno+DRl018jLA4yG+2H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843142; c=relaxed/simple;
	bh=1p908kAj53x2JXFAE4DHGJA8un0ZhU7YEXyLoO/uAzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Csdpt+2iv+R1L7yYzu2jdiISRzhWMBhAVB9SDmd8uTpOf7NAvz4j8afc5TVyBiBs0GUjGE65CCFkybrM7ehflVD3FL6SiXMht2ZbFJJp1qiaSFottS9RNnJ0ZFqDf3BYBDEPjbIttXlC09uqdWEYcGxUGREVYtc+k+e6UqKAamo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Abbka+ln; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Abbka+ln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093F91F00899;
	Thu,  1 Oct 2026 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843136;
	bh=C/GDfs2kEm4IC7+5QfOrnPjUnzCryeGCVYnuvorUEOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Abbka+lnDheRb0x+jNMC/bF0CqWEblE1gX0QtKqgChYqgu0ckQL78j/KxcmKXuXSu
	 Vwd+0XGXdmmCJ5mqMRIOjpz6UrRk4xRAcFq5JXMOuKKMLwtVy9/qkBQy2yWXvxjSnn
	 p44pIv3rxamHmfp8ZOR0QVxYQ/u8qG6Q/WoIpyu/sAPiFH5dDXMk2x3NJnzLh2+p+m
	 8d6m5+Xl1bVhiPoNZbOiizywj92amhKYDb3Fz61/5cDfX61+Fy8IZmrI47tFyoV2V8
	 GNgZZlgtyFKRyqVpcDizV2GTppyyyCH8eAlmCrWtUkZS5A9cpvpbIMQ0SbNU6D6Noi
	 buBIKOw/RMHOg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2A6B4F40066;
	Thu,  1 Oct 2026 04:25:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 01 Oct 2026 04:25:35 -0400
X-ME-Sender: <xms:_xi-ajXoqJb2xckcjUoZnCnSLQysuqZMG88di8ZjWLAq6_BKsRfpbw>
    <xme:_xi-aqG67MyrHklpVp-N-bQLCENQQllCu1aKLNXIRexamTubPh9enM4cQXXs-fTpF
    FkTIA4P8eK7HAONzMtP7EstnRjvpYI-wXTXC0CQ3gQ64BYIIuKglCA>
X-ME-Received: <xmr:_xi-amM44BBYY5j3qmh7QQ1h4W5eValVWYJ5gxNCA0QYOYiKZqjZ0nlZ5BXl>
X-ME-Proxy-Cause: dmFkZTEOBUC+pHxGtIE/qFdlR+QeXl0dp7/vYN3LnEb9mNJr8cHDudba3rLf+c1wvZyOle
    aOvBQZjkiAbZt5uERWQqcwmqnj9JWqOyCsiDUS+8GfxxdH1aFho3OvarHEX4FnsS62Qvsm
    3pNdZnMfLSKeMrDw2F20jnNKlGhLh8ZsGBb7N40T+VBKVrlGr1+mz+AldlU1WdUHKUzoN3
    +C75jILvDhA3IYu6s4xrGVxo6HbL/PpIK7r5FLueT8lrZmFkZSQitZrzIxVPugrGuTILup
    bF0ugObAqh7GwjAKBlmju5bDj7zD20NWv1EaB+XI9FKq5fRXow0i4KN3vqMAZViBXn1Bq1
    ZCPfLZDAultRUQXZSiXEuknWseAGnIAUd6F9fFadxpUvy2A7cmMb35UR4FVhh/m0AryNiE
    +VNMsmgNugZFW2jrXKeFA8GM3qUAW5mW1hpV8Ib1O4H1YVWIf81JIM80eJE/p5gwgAzU3B
    M1Z6nuwuWOpf1rLLntCwCppthBjWo9FEcKijs6DEfSCQltvzUDEKKvGixGB76xFxvvDoZA
    KAvPOofEtTSKFNQ6WPtte32mb9TMOQ6vauOTLlNxKIinjq5NA1mLo7y07BVY5gOkwCADeA
    bew0qoffEjpCV0l1/6+kBai1SNJn7+Jio6DybzuD4VJ4tm/W8r2RTRyd66yg
X-ME-Proxy: <xmx:_xi-auU_y0hI7HgHtbhwpb879PgW-HmRC-H5_04JLF7hRcCaebPebw>
    <xmx:_xi-alwwDecqrG1s10v9zV6kwhc0NLtHtJe8fsvuCqjcRpqpvljFAQ>
    <xmx:_xi-amO9GNPZRxgxOeTdc-1ybsf2YWFhvpR-9-pHHXcK50VSA6R04w>
    <xmx:_xi-avqaoGtGXr-4jct80McHV61RyU7wa-d0_AwPlGXDlVbjwDfpUA>
    <xmx:_xi-al9imHYBP-w9VVIIgJseAONJ4TJ6vylFPugKaOFogjARXOlm_SBw>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 04:25:34 -0400 (EDT)
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
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v2 4/5] irq: Explain better on NMI_MASK overflow condition
Date: Thu,  1 Oct 2026 10:25:18 +0200
Message-ID: <20261001082519.16195-5-boqun@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261001082519.16195-1-boqun@kernel.org>
References: <20261001082519.16195-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently __preempt_count_nmi_enter() uses 15 as the maximum NMI nesting
level, and it's because 4 bits are used to represent the nesting level
of NMI. Replace the tautological comment with a more direct mention to
the 4 bits limitation to help readers understand this condition.

Suggested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 include/linux/hardirq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index 73b48dd9f135..2648c49cd8f6 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -108,7 +108,7 @@ DECLARE_PER_CPU(unsigned int, nmi_nesting);
 #define __preempt_count_nmi_enter()				\
 	do {							\
 		__preempt_count_add(HARDIRQ_OFFSET);		\
-		/* Maximum NMI nesting is 15. */		\
+		/* NMI nesting is represented in 4 bits. */	\
 		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
 		__this_cpu_inc(nmi_nesting);			\
 		preempt_count_set(preempt_count() | NMI_MASK);  \
-- 
2.51.0

