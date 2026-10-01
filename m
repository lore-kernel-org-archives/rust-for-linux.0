Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001CB4BB268
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843140; cv=none; b=dS5tBB9MLzequH7MQtCU8JSQU6Erx0WezjMrUZWSPaPI2tRgkkItI2u3dAIux7G9XCBw/P0TxbUWK4grWh+4B251t9/HWRw0hzZeUKgcefRtc1/kwseX9dwoJrIT46lzuY2Rbty68dQ91Kp2DeK8W8RELM409vYKjwfY6zSZyFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843140; c=relaxed/simple;
	bh=epFo68DRO5HO03uyGogPfBRRkcxs6U0wYGl3of+7i+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5pGLnbgpzSv/Rf7J4IHgJXP2xRiz1xR6/oTE+04djiBL3Phgel4DneewvFF4f26ji4DMjB8/Gj9pjBsNI1OBEJ9O/C8DLu+Wv9j0czu/sqEzKkwm6jLkHeMZ4sA/kL6o4Nq4dMgrRn0kklQ2HykDs6M7sJo91qkgC37FJLQFPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+wCV3SV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+wCV3SV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6887D1F0089E;
	Thu,  1 Oct 2026 08:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843135;
	bh=QG6EMhK7f31Zipc8Za8yi9V5CKNrwVi5K1KKEswjybA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C+wCV3SV2kJOjEnkfvk8bkcXxRv8DoRhi8h7qWgifAyZ+hp+Lx5P0p1hACFilxsys
	 KV4YbzxkCbmOJZ6UPqnOzP+/wk3NOtmXFucxA1WknU5x3BjTajGWJjKIZdrjq/xS2G
	 Ah4TjgKBUFfGu9Z+9FIDfiTMoJ3/Pao6sidXa698zLUn2hJ3IuroDBVH3hcxBLkSdd
	 4m3//nPWTn1Vae4q3HhWiKRM/s/aqfCobDoep2W4Dfb2z498Ypum6zXJi0ORVyxeaF
	 CF9HQIDJGO8yq0nuyPZgaW2GzvfiJsf/AlgtkDj1WEPXFMmD9SbebKxF0T5H7oSj+/
	 holEtQCHTPc0w==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 83A29F40066;
	Thu,  1 Oct 2026 04:25:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 01 Oct 2026 04:25:33 -0400
X-ME-Sender: <xms:_Ri-aooTy5-qSJTKBoJCWvnwlKfmsbFfBbbFFtNSGJv0jkDOYuCRwg>
    <xme:_Ri-akOt8N9tIkszG4vNAR6edS6L84ghRAcazRLLHMKZ1AMJddgC1GCcsOdc0gMu0
    fItFD68dsGvWdiTlflGZd2qY2ExC1x9paMlw9FdpZ2ootaMsjNraHw>
X-ME-Received: <xmr:_Ri-amx_OX1CddR3a4Xw9O5_7awEbKKXnd4yX_nalZy66coeLX7Re41SgV_8>
X-ME-Proxy-Cause: dmFkZTFTtZ9e+AEXGyH/UMNFNKx7GWX00fXAsakj+PulafEHjbIKBMQx7Xnly6B3nqNRyA
    VpoObhA1Qhfd5N42FAzO0sTBGw4yFG6PnLFuaeM1bW97EfiTCSnufadyR4ojJhWoPi2Orp
    Nw2JMX8opnwBw/C+wIQG8nb1UCGojK0rMbXtCocQAaV/C59AWyi9HRGVAloGTrFNLENSW6
    18Nhy0c76z6pdAWuM1RbSN8pspZwRgkcin1hWylWhTZJTEMyJuzlL76xznqewDQePbxkmp
    OZxFI4a4FQttqB7KZKggwQOHJeTyNiNl9FbtOJ+hzXoyQwWY84px4TyS7SR9tfVXrM6gBZ
    aIwIKi/ed+3ot85pAQxX8josllyS7aSY2PiOI6OrDP6Wn2CEsYG+IKR8JFeMeJoBpEw+wQ
    XttPdIXLBDAhoA+XAzJXP/xXqSu2y4jrSxftiG2ISdvtM5jaAXAsXsrxEzHuS2PqD4ZhLZ
    pomAeTXUr1V3srUvPUKbUBV4wYPf8h/2JrgLA0hmzIemQgZ6SDOJIgzaPMBSLNiQuG0nkb
    tCVnhEfpm7Em/Rcu2VX291sJVVO6xdHlDuaAiRaJd7g1/kAVWnUiCwBuU8oteIZ0irZpa6
    bmhk9VX+QBVZFrCmFRGe+KY8HSPE6AUIqErIKOSWMG2Ilxoven5zamfkGd0A
X-ME-Proxy: <xmx:_Ri-agyHDPnQGBg2twNEtq8K-s_Zl-EkBmLUvaF1urq-qpNO-6Q7xg>
    <xmx:_Ri-avJjtqh5nQxXfzsuypfjiuqHmQIzUJ2Y0z7nCf_xqz3_bs6NlQ>
    <xmx:_Ri-ashF8oO7CJdsCwS1SdQzqy_XLB0ygbejDZ2D9BmEsL5hV1cImQ>
    <xmx:_Ri-agOkOG0e1UXtiUD0dFdueQtQl76lj9gR4iCCrixzIruyGZYW0A>
    <xmx:_Ri-an4FdW2sld98aw7SZRUOmKsHOUt5Dg0ZK1b_3cl7SgHa8ztDjcaO>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 04:25:33 -0400 (EDT)
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
Subject: [PATCH v2 3/5] selftests/bpf: Use the new NMI_BITS definition
Date: Thu,  1 Oct 2026 10:25:17 +0200
Message-ID: <20261001082519.16195-4-boqun@kernel.org>
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

The definition of NMI_BITS was out of sync after the introduction of
HAS_SEPARATE_PREEMPT_RESCHED_BITS, hence adjust it.

Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 tools/testing/selftests/bpf/bpf_experimental.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 2893bf06ff25..4bf7390994bf 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -371,7 +371,7 @@ extern int bpf_sock_read_xattr(struct socket *sock, const char *name__str,
 #define SOFTIRQ_BITS	8
 #define HARDIRQ_DISABLE_BITS	8
 #define HARDIRQ_BITS	4
-#define NMI_BITS	1
+#define NMI_BITS	(1 + 3*IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
-- 
2.51.0

