Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A78330E828
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 04:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421845; cv=none; b=fcCMzjZWDWBDVq12Kc5MaY+9x+UktY7aOc+/YVQBUM+wxpLIEh5CWFZW+/75/ftO1IHI4C1xelDMTnYZc1fX8w2unPjp++A27MUp+uEFiwdIzCnjzwCMcsjTbZebKqLs6v6y8YbUVrn9I2JC67usZmN+7Q2eTDQ+L2XGG3aUluU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421845; c=relaxed/simple;
	bh=2zTDO5pvXwmT2tTWBLKnTCTKM9AeLo2GSvrt00GJGi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aArFpFAOQBTYP9K2hvoMEhA/mCvxlUQAoI4ozzNjBJqzzMzZ/CTKBGyjVw9vBHGM+MWdD4aWDP7kCn1j3mk89O76z5NGUDjU8f+i+xbHM46tz3waB+k8wgM/Tpj8iPYo20/jH+vmMabSAL5FsEIyTRPc7BnACQUDxPkJvg27qm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPt98KhB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPt98KhB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9614E1F00A3F;
	Tue, 11 Aug 2026 04:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786421843;
	bh=GiTDOurHXzQV/rUXpeQ1nvGDkmPVLov3VrBqxGeXDRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IPt98KhBU9zEG2u5YtgSmroejALuc0Yc2ccCifAfE4aZtvN+DEl4MXmngBZ4qP51X
	 OGLMdD8p7IDC3U7KUXl820dliv1R61f/gDSGyRZ36PL9UqdmI0BW57e5asbxH4kpHT
	 /pKhLRsHtnbbhNUxNYaJNIiGkdg8HrudLRr7keDrPmNaNJ6/on66AVNP2cxucsx3PL
	 Tw6l9JG9zrSksKX05XWTLE9LC+uXwSLAnIFHwq8KH135p8UJ6bO8ssF2vQcVzFj+0y
	 qG4ld+X/BdfYjkRe3ijnQZdUyS36QwznuvfscieiCx0p0iH3tAa00PERkjHNwfQMLu
	 tP2CLhOA9ph2Q==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id D3047F40066;
	Tue, 11 Aug 2026 00:17:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 11 Aug 2026 00:17:22 -0400
X-ME-Sender: <xms:UqJ6ao0cikJf-R8tdyN5viimwJItVrxHk107t9Sq2JjmvEr1qzh05g>
    <xme:UqJ6aij61x08NUTv3PYrf8YgOwvHn8jyTi_u9Owh1O4gdLKXY4oYF1Qv-DcJ9zwTC
    Xs9deEkZFdYSmyik2MEdBdWO2IwFTSeLuVmqIDvERY1UGAVCgw>
X-ME-Received: <xmr:UqJ6ah94wKBWSjtG-Lr6WYMfWDaP6VXHV3198i1-PQNqn9cIlL7BWE56Fwi14MawDCJjhOGvdZhhtzOL8Gk5qVlsKGsiXdaU>
X-ME-Proxy-Cause: dmFkZTGhPmSJ2utFx5D+CERYZNZI0lWwnPoWtdGm1Q24HJV4wHGzzwHlMIG+Ha5+CXwcMV
    A4Y9FRkPx4iKSOEUD0o2bsQuhlyU9EriC9Wg14EdheA+ghP28LE9/AWvwFlpxSSeaugzOB
    7cy4mIL1Zm7HiOC+SZefKLt12lBqjCbJwen8IDKEhCYWwgAOLbn6601jx3eoTsUn+elAvW
    +Nb62Q3PknpJ5JS/PGcU8W3OZCAnD6uTdZFXZQ5gjZYvJftgWnEBjoe2o4DqsJ8oOzcaMy
    Yz2rdDjTzptNIY6+Mw8UVdo8kkEkZUhr3Jhp99XO6QkjjOLjPFF2Am+c3dLYLr4j2hpojL
    1OhSERuh4PlXLvvr3orFzPfCfKcWhE4dyZIZTDsPeypdODACpHSQqhtnecTIOBprHsx/Ts
    UFyh457VfpGKHE7O774W2JK8+AlRz1Xr3qipN4LX3a8AEQQSXLETBH6mOd0Y5q8LXB1lEp
    20veH+pS2ngIoC86Pz8byXBGatmpabzyHrRSMgMqmXZtW0evLRp3NtG9XhgGgkkmYOylhb
    VxnnjkArcz4xsGtMUkBwh26jnN8P/IN9fqgnqpxJuMpHYoQ4+1a+1oAiEe0Y4s2Tcl6UJn
    /bhu0dNESydnecyqfras5DBRSBVoS0yLQsD39E4zXlyHMO0n8RQmnMG9sStQ
X-ME-Proxy: <xmx:UqJ6amJyHTARvS_diWq8tIT7D2Xa7zoxKUGTMouilBoggjRI8O_y0Q>
    <xmx:UqJ6auwvicA-88hfCZW4eGcADRHq0Iwy5OLbohNQ25m8GNj5f5RBGQ>
    <xmx:UqJ6ah0_mWf0cMYQx7gnMhMtfChOvxC5YRkH_jbJAMOHWbM6xSrw4A>
    <xmx:UqJ6av_3WjrS_GjGDkGOu5g1PChJCpCOyGc6cUmxdTHULt8H6z9gsQ>
    <xmx:UqJ6ahQRUgj0wK3Yk1S96MsAB3ajeNkQj4pevOLCSBSiR1g2go0LCFmH>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 00:17:22 -0400 (EDT)
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
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH 3/4] irq: Explain better on NMI_MASK overflow condition
Date: Mon, 10 Aug 2026 21:17:13 -0700
Message-ID: <20260811041714.27679-4-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260811041714.27679-1-boqun@kernel.org>
References: <20260810085255.GE1642880@noisy.programming.kicks-ass.net>
 <20260811041714.27679-1-boqun@kernel.org>
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
2.50.1 (Apple Git-155)

