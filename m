Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA513AEB39;
	Fri,  7 Aug 2026 07:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086163; cv=none; b=FHgwaVoC57PL36vjV+sTCPP52JKMmpbuiHEgygpTDTtX3Q5BkcHAtmxcNrD7vxIyWFnxmfvx44ZAB1EYvOI5N5DbJqc8jCKiSVjEZ8Y4ETckr4ziduUm2xI95S6e/FXLZheKl+0g9HcqRt2aht3ehKRbr+hcOTmcVaq/qrdr1SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086163; c=relaxed/simple;
	bh=gdX2/8yO0N7n17FlM8ctDDZ1lMRo6f/CFk/F/ffOAD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVD1Act8Pc2pgIgApAH1/JKm2esCl5Xd2s6UoJuL5D4u/UDXfeGNRO/LDeNl8BIq8n73ZSnzG3Tp6TqTknFwgJ5YRQjE6lYFU3JHu7FxjqEx993E9XeuaJDa1552Gs58ARq81DixGh7L1Dzo4oCyNjycf+zbM48Ns1ajYS3XIkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXSD/zU9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXSD/zU9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51831F00A3E;
	Fri,  7 Aug 2026 07:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086161;
	bh=uaMiBt5vafGBdINwxuR8k+kc9W7/u2yo8z9BluwAE/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QXSD/zU97RwBX3Lrlw7N20fDBja0RoYiJjj7gQN1voUUXR65U01/SZ0uY1LkgYSJp
	 QTjg2Ce2a40AI/nTSdecYgJLNUo+8Av341U4CLq7A/ngyW2hrr0okiDWFsp8VfXz8y
	 CFZPob1PEGbuyjl46dVjO+Dr4cRdBRtuLwvdnP+Ghvf1brJOvU80mROkfKcm3GBlRu
	 dIf+bOavJeLvQAjr610RBVbuh+My6dBkeDkx1ELMz4TfAgGZSSo0zQ8+vUOae9IyJj
	 CK6Aenlq81c1rK7B7d1Mex6xP31pxvP9QzZx40sgKkVCmsAAddLhRnY68KZuq/4Vs0
	 IqwMyDpLBsjmQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id BD546F40066;
	Fri,  7 Aug 2026 03:02:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 07 Aug 2026 03:02:39 -0400
X-ME-Sender: <xms:D4N1au9sPvixR2nUJ91dWY6NEahMA6hCDmoQpImKRQAK25sZXdyNgg>
    <xme:D4N1arDlSCT2xJd_79RwUy0tDLODFV1W1MS7_ZH9pMZtvKbHFMV1WcWhvWwcdbQt1
    E5I5lLFVyu2x0uJdk1NXKOYX_dYd15xGFI_hbUvk5JpBvAaGfAFMSw>
X-ME-Received: <xmr:D4N1alqOmwn0hf1VKEXe6YiQV0cmU0c3sqVF0Yb1FZF4STyBdZZndc5ozzXuSbrCqCMzfU7NZIb4Um-Qq2DoKzKo7QX7qb_j>
X-ME-Proxy-Cause: dmFkZTGyvHdDd1GzGWN1VJTYexoeLWbYipFw83SRb2uXMsYl+KFTYaUEpOTqk5K+My00CP
    NgJOi8LOILsVWSxl4ccyvtrBefkjyfVln7ypRQ+bh49utynffTDp/Bsg/I+mtxl14w83ED
    50tRYjk+o0iP8mpu+QvCT+Dk+0ekkSaH2jaUkhQ2IGs7hn31QTDC3HO568nJzP+sCzaxl0
    cNxOjeFWag8Xux4s5MnrVTP/LpOs6EV32l4U2+8ipe5mhbLBKcn8VxJg/bq9Q7Ww63Su+/
    gyrSa0CaL2q4j6exaTekIVpxNJMTqSgpye9e2bSA0gixFi8opX6xU3WPxpol6ShOOMsGSJ
    TIFJHz5UjPAmTocBXDfuX6BnJxjXkyNuTC0AfP877O4xwTlb1iVbYyNH9CcfuQA7lxNjAr
    IYKBi6vkpSerJnDbHb2jDR7BKiuaaSL4Ue854SiC1TQdz22L8jPTlIRzH3ufjlROAiWH9o
    jDTsOSv9d6JQw4GfBGaVUlWQn+Aeu52IIGGI4F9QLJx42aYIgoMBT8yKz//peoTcsW+460
    OUCZO9QRhIvqIzKqtw199oPBHocIFaOgxzen4mDu3We82/RgxcrawJ2K0vHA2Wg5V6/iCq
    1GhCoX9D28EbDjv7zRScpIfWDCS5RStje5XkJ+zWJjYs6gJ75odaLDUsM4+Q
X-ME-Proxy: <xmx:D4N1ajk3XWlM_Hi_R15tgRIbDxGnxSHFshg0HwuZZz-r5Ppms2GjMQ>
    <xmx:D4N1aoVVu7XHkx_jb7NxE2ktnSo1F-cUpBrO4u561ExnnDWYV-CUIg>
    <xmx:D4N1anTA2v5kWJVQnxsvQaaBZzbNqiIyev3bGSTxRt0hVz85LdYD1g>
    <xmx:D4N1ajDcuxtrcm3n2uOWJKA7Z__VcX_y7GHcB-LrIocVmiIm81EfXA>
    <xmx:D4N1aiR8ONC8yYnW6vzLJt4hT6_TJxySyMFPuoAgJ0GjcHkNRA7e6Md->
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:39 -0400 (EDT)
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
Subject: [PATCH v5 10/18] sched: Avoid signed comparison of preempt_count() in __cant_migrate()
Date: Fri,  7 Aug 2026 00:02:07 -0700
Message-ID: <20260807070218.27144-11-boqun@kernel.org>
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

Currently preempt_count() is always a non-negative int on all archs
(PREEMPT_NEED_RESCHED archs will mask out the MSB when returning
preempt_count()), hence the checking in __cant_migrate() is in fact just
checking whether preempt_count() is 0 or not. In a future change, we are
going to use all the 32 bits of preempt_count(), which would make
negative int values possible from preempt_count(). Therefore convert the
"> 0" comparison into a zero check to prepare for the future change.
No functional changes are intended.

Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index aa116daf21bd..9b3f1764fa9e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9241,7 +9241,7 @@ void __cant_migrate(const char *file, int line)
 	if (!IS_ENABLED(CONFIG_PREEMPT_COUNT))
 		return;
 
-	if (preempt_count() > 0)
+	if (preempt_count())
 		return;
 
 	if (time_before(jiffies, prev_jiffy + HZ) && prev_jiffy)
-- 
2.50.1 (Apple Git-155)

