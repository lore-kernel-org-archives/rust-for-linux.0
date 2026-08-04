Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A760F4749D5
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 16:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860119; cv=none; b=VeRbSBO5FsQuP/B6GUUswfVBLJcW84cOArKkCO+z4sTV/btmdKoAY3Fw9K2HLfmxvM0od+C6jnvZzNRxsFp+q1G00ANf0nsRljf+Yb7YJTTgdOjoOyxcyz4iTftjp+2mSgz76V9gtx3Zq5fiLXBnBSdZXv+AT6Kfs+ti6iSAAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860119; c=relaxed/simple;
	bh=gdX2/8yO0N7n17FlM8ctDDZ1lMRo6f/CFk/F/ffOAD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXDaDQnouQGd/obHB3oO/uaBHiOU+Nm5IfekaHrFfCONJZa5gd/eVSGzmCJ+DEN4x7WurxbdW4TO8q9WmpsFcDM2piTMct4JmEdwfvRpdnUFjhUbKHHsrDT/DD61Bn3QZ1BOdTZ1v4XNBtjVmgjS0O1uZoLErkpyqsQRCXhR5TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vbo5Fc3x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vbo5Fc3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1CA1F00ACF;
	Tue,  4 Aug 2026 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860111;
	bh=uaMiBt5vafGBdINwxuR8k+kc9W7/u2yo8z9BluwAE/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vbo5Fc3xiyvVNnXaKZYLgOJiD573SdOdZCCuIzEH9LpoMIwFdiKCxYGEzj6zk2uah
	 DMoJV8OStdVhObep1NyOcQfcAtDyUm8pleq9M9Pyrijy4AwlXZwfiCv2TTBptlI/YH
	 FdA821vuw9v9hs2qDZfC2HS/Do8t6+u5BE1frMOduSov3DvAHkejg6MvY6TmXVtvmq
	 FL92vzxQhWN/7vWa4lHB3LggTqWeJ6X5ydTyr+QMHOIBmXSw9INCLgqkD4cSoYjacq
	 Eu9EMEJmbcnDtWGisRYgxiunE3Na6BG/HnFmN4sD/pGCeKVEN/zoXQGpjRzS41/vyy
	 WjYAj6qyjo/sA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 78A21F40066;
	Tue,  4 Aug 2026 12:15:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 04 Aug 2026 12:15:10 -0400
X-ME-Sender: <xms:DhByapUX_xiPtM12M7V66zzj8cxKrCxhzdzFUL4gf4GWNyibLUme9g>
    <xme:DhByauwvqffrcmXezddYf5A0qRaEqPg9Zz8AZ2iTn4oWPtTq-l29I36FGdcLtvTuD
    RvGP2VvTLOB4HSEkpQb8oYeGKTfQ2GS_ULUYflStQucjGASptUCVw>
X-ME-Received: <xmr:DhByaoz3EWkFjSGPmfQjHGNoQ3W2RG_8SLS0Hl4Y-oQ6e_hVREv8T7BIdxh8RncSfbcfKFWM69D2geqfsXrrW2f9pj2-fZNO>
X-ME-Proxy-Cause: dmFkZTFdfHSt+dGlSIgweIKZqd43ZIr2UVwMz+DLCV7Uxtqr2tWdjT0gNVbLG23y/ntMNr
    yg2u9xNueu4ZlCPesc7IGVMS6ZqisyNG2Hp2kDVIfbBL9QFp1F1pvbwsQcrNmamnsGJsZY
    AmMncETOYZEkhlG6T7JDS64AVGc7Ln4zXY6x3T0lHgb+OYvht9swwTIGsG7Xot0GJG9bWc
    fhVx9JgcfYh5ECBMh98FFx1XWl/VnjhK7S6I+ssCNmeXl+D6Do6MWM72zOvrRuLzi3YdIE
    +uwF6SMc7tQqt75yJIKNoQF+R4TbmXy2JAxyIWDxHsQYaXIqpYC7ilWb/r9+jjwAD2JcNX
    ZHW6YG9QXu50mMhrSTuVu5sHfh2gb0c7rW3JeGWGaD/0HvmORg07SFbFbH3Ybq6WCUTkJv
    LPQlEkSTsZlPCfG8f45vVU0jlIX/gCp5dSSXCj4KlsKgeEdVj7uHtnsXYoAhhrAOyNL4W5
    ofxD+1xC6EXrxGrggTEvjUX7WwhHRdQp8w9lnfdBuSUUC5uExYHswUHnY+1r05+0BXad2v
    fwz23DqRQpz9LCzZ8dndZPpgWnOyjaMbcRH+O88Q6ZMgV+Ws7MiH02fUoXK4V9UITeX0Dd
    bqWIfGhEg7xuDLV1rff26bPb9TAoiD/tVo6qdsAm15Db8f8qfl1MXBwIwKMA
X-ME-Proxy: <xmx:DhByar1tPBxavTRGuXvzSEpW-dDJyIq82loO-hgYRdwYloY29CwnLQ>
    <xmx:DhByauoaCkO7P_ZkTuHa05GMvOj_LOlXiQmjcnJNcS_-wd4LrjHefw>
    <xmx:DhByapAxFJyIX-zueCVJgstYuhGhMGtQL9GsPSr4-nxWGYfATx70mQ>
    <xmx:DhByanoLnGzXey1nYFmdEu8E5MQxNRX7iXhbP1jEFu4thwlkgA96tg>
    <xmx:DhByasCTbVhno4vXX_eOQG0NiynzRCGpZT3DcBoCbLlj916-uK2zI3hz>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:15:09 -0400 (EDT)
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
Subject: [PATCH v4 09/17] sched: Avoid signed comparison of preempt_count() in __cant_migrate()
Date: Tue,  4 Aug 2026 09:14:31 -0700
Message-ID: <20260804161447.84806-10-boqun@kernel.org>
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

