Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A6937A851
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529847; cv=none; b=h1+DBhIR9TkldIjZktG7aZLARY5w5U66Mgsu0wDCDUpzH5s/yKeqdoMpWPEVacv34z//F+8XcJ2ZrRFZsuf9JfcjvEy4uqviMsJycYGYBVfjI40k2niddD0QgRfL7xdBPyPe9u41K45wxcyvKIUwpTTzwxNT3oDCac8FG5RwD7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529847; c=relaxed/simple;
	bh=55TqpUfuAIhEFzsbKnTQx5nQGw2qkRdYWCbViSHl+0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRRETagfD2VyCi4hzuC3Lc30CfPH/r6P7DmHH7AwlmPKoYX6loJt4H7+YoYt9yvJBZ7Lyfy3tFXd3tXa0ctmi5jF8URxqCG0VQ2ZWemVZBoVTehruuhFm3O2w7LamNb4oNdSO4xMcckIT2C8+XYcPRgPSyKhcktmtV0By8q+8DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgxmzQoT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgxmzQoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0DE1F00ACA;
	Fri, 31 Jul 2026 20:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529843;
	bh=IgBCAm+kcVy0fow8SEhw7v0Haj3+xluBY+91XG57AmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NgxmzQoTwdQihVpjAZZb36FRT+W0eHXxoVe1aFqJ5wsvmfLZqOnqAfUbeiUN5aA9J
	 R8TAGTUucWxcSCgn4PR8OfLYIbnATxybVqF1FpWcMuOuopstbfrTSaXHNGQcCE0nm4
	 KvAqnE4W7jQY/aVgAqTZ0f58eLWGJUhprfcVDDbch9EwFrn6A9xICBwPEgEMIo8sQt
	 k79YiKA7q3X9+gcXxPzsOowyiE5Rjd9wlrqrkAoQyBImATqGT8vsulq0MkZHqdyQ1M
	 Tn14/1FTVjW+56l7cDoFUVxr7kQwydFJX2ZDUfxnfo7sgTBc7EDEh+tyDX5+w28aEy
	 eJ9GknW+R+ufg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5D3D9F40077;
	Fri, 31 Jul 2026 16:30:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 31 Jul 2026 16:30:42 -0400
X-ME-Sender: <xms:8gVtanrQ3ieeHB16ovt30ZlmR6EckZobUsvBXPyavquyM29VPvSdPw>
    <xme:8gVtatf_atL_gOv_Nn3z9uZ0qQhPn0zWMR_xiiRokgs9PqsQXj3XtGjZTLzSmaAJV
    0jMc3L8FEkM4-hsAgD-a5-PhmTNUN7D0UsaLBzQfJx3saaHeElbdT4>
X-ME-Received: <xmr:8gVtaqo8BSFk1L4BJch6KLDBAL_WzNn2U0COoDY6WjTU3vND-jhijDM01judZ5qe045ZMP7GwH-PRtrt5qevBAyUsZDCjFvM>
X-ME-Proxy-Cause: dmFkZTFps7Fcl2lDQN8QuKjkQ2Twray9XFETCWlSba0KMthHKuWpzT2QuJsxYlE+Jfwxxk
    r4LumXM/JVSIx3esVw1aDMeAJaVHLr+c+QoTtbKWA/cjowqeMJQoXkNExL9SUShkGISMJN
    I4Jxy+s/E1/lkenAlXh9Q30vQuf9rA/PbrkWD4pKxMAkC+U6f3km0ithIr0S+TXfbV+4FM
    rMsII+vjt3nbbUrqTbYDv01BF1FGDJ2EkkIzsv92rcLPomBtS/DYv0HD/S/dv1En38CiLr
    u6+5RUMJmyRxjeZZwQND0Q2Cx0WP3XHFSY1h6xZNSfNwcAc/Ongt++m0x7heb8YD7Irwtn
    n4ZmWIflfBfwnLrvNSPJ6Jm4qPa2HoOoW5+9HICFMytbPxOT26ncADgDDkbfLhNQltB3J2
    iMn0N73tbWkOyDEqOXFaJV8OaAdTDtvFLbdGjfGOsDB6X3BX9k/xrk/KDUqkIiMYVKcQF/
    8KFInmvGqihV/8tOVBGy9TS5dyCMYbpmEwoE1BoXzBxnU+RjSF7KZCSNTnADBPolzcK1rL
    Q3RMphBXAyhjwCHwrJoeXX7Kgz/MazHkro9i5pm8tg0J+anvYQpL8tQM01ivv77xFtE2j7
    XmjgLzNkgkyS4YPpEl4pVsfzTV4m8pBHeQ5vYECPGiMT0FQEiDY9yfZZ/wCg
X-ME-Proxy: <xmx:8gVtanmVnrBdaZPmk50lrrg900zCiwJlGm3c8EQVBqYONvquqlQjbA>
    <xmx:8gVtarTNBpt92jeNcsKBWYq0gWrPsyDz3Bl9Hfvbw_qHQCotDRsyYw>
    <xmx:8gVtata9iDmPn46rs-XceKNEAR0p6_qdxnJjeffFs4oyg7bFn3eKPg>
    <xmx:8gVtar_noEU6BBAFBbl3-lhtVQTEYo81u2RRNAunw72Ad0pZYpGsww>
    <xmx:8gVtavlQd5aVTbuoLQty_UA9nWXjXN0KWpkfKf2x7Wp3e2gaVbmHwT33>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:41 -0400 (EDT)
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
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 02/24] preempt: Introduce HARDIRQ_DISABLE_BITS
Date: Fri, 31 Jul 2026 13:30:03 -0700
Message-ID: <20260731203031.13679-3-boqun@kernel.org>
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

From: Boqun Feng <boqun.feng@gmail.com>

In order to support preempt_disable()-like interrupt disabling, that is,
using part of preempt_count() to track interrupt disabling nested level,
change the preempt_count() layout to contain 8-bit HARDIRQ_DISABLE
count.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260121223933.1568682-2-lyude@redhat.com
---
 include/linux/preempt.h                        | 16 +++++++++++-----
 tools/testing/selftests/bpf/bpf_experimental.h |  5 ++++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 586f96688325..e2d3079d3f5f 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -17,8 +17,9 @@
  *
  * - bits 0-7 are the preemption count (max preemption depth: 256)
  * - bits 8-15 are the softirq count (max # of softirqs: 256)
- * - bits 16-19 are the hardirq count (max # of hardirqs: 16)
- * - bit 20 is the NMI flag (no nesting count, tracked separately)
+ * - bits 16-23 are the hardirq disable count (max # of hardirq disable: 256)
+ * - bits 24-27 are the hardirq count (max # of hardirqs: 16)
+ * - bit 28 is the NMI flag (no nesting count, tracked separately)
  *
  * The hardirq count could in theory be the same as the number of
  * interrupts in the system, but we run all interrupt handlers with
@@ -31,29 +32,34 @@
  *
  *         PREEMPT_MASK:	0x000000ff
  *         SOFTIRQ_MASK:	0x0000ff00
- *         HARDIRQ_MASK:	0x000f0000
- *             NMI_MASK:	0x00100000
+ * HARDIRQ_DISABLE_MASK:	0x00ff0000
+ *         HARDIRQ_MASK:	0x0f000000
+ *             NMI_MASK:	0x10000000
  * PREEMPT_NEED_RESCHED:	0x80000000
  */
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
+#define HARDIRQ_DISABLE_BITS	8
 #define HARDIRQ_BITS	4
 #define NMI_BITS	1
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
-#define HARDIRQ_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
+#define HARDIRQ_DISABLE_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
+#define HARDIRQ_SHIFT	(HARDIRQ_DISABLE_SHIFT + HARDIRQ_DISABLE_BITS)
 #define NMI_SHIFT	(HARDIRQ_SHIFT + HARDIRQ_BITS)
 
 #define __IRQ_MASK(x)	((1UL << (x))-1)
 
 #define PREEMPT_MASK	(__IRQ_MASK(PREEMPT_BITS) << PREEMPT_SHIFT)
 #define SOFTIRQ_MASK	(__IRQ_MASK(SOFTIRQ_BITS) << SOFTIRQ_SHIFT)
+#define HARDIRQ_DISABLE_MASK	(__IRQ_MASK(HARDIRQ_DISABLE_BITS) << HARDIRQ_DISABLE_SHIFT)
 #define HARDIRQ_MASK	(__IRQ_MASK(HARDIRQ_BITS) << HARDIRQ_SHIFT)
 #define NMI_MASK	(__IRQ_MASK(NMI_BITS)     << NMI_SHIFT)
 
 #define PREEMPT_OFFSET	(1UL << PREEMPT_SHIFT)
 #define SOFTIRQ_OFFSET	(1UL << SOFTIRQ_SHIFT)
+#define HARDIRQ_DISABLE_OFFSET	(1UL << HARDIRQ_DISABLE_SHIFT)
 #define HARDIRQ_OFFSET	(1UL << HARDIRQ_SHIFT)
 #define NMI_OFFSET	(1UL << NMI_SHIFT)
 
diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index e4e12001fce9..0159a3d365c8 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -366,17 +366,20 @@ extern int bpf_cgroup_read_xattr(struct cgroup *cgroup, const char *name__str,
 
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
+#define HARDIRQ_DISABLE_BITS	8
 #define HARDIRQ_BITS	4
 #define NMI_BITS	1
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
-#define HARDIRQ_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
+#define HARDIRQ_DISABLE_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
+#define HARDIRQ_SHIFT	(HARDIRQ_DISABLE_SHIFT + HARDIRQ_DISABLE_BITS)
 #define NMI_SHIFT	(HARDIRQ_SHIFT + HARDIRQ_BITS)
 
 #define __IRQ_MASK(x)	((1UL << (x))-1)
 
 #define SOFTIRQ_MASK	(__IRQ_MASK(SOFTIRQ_BITS) << SOFTIRQ_SHIFT)
+#define HARDIRQ_DISABLE_MASK	(__IRQ_MASK(HARDIRQ_DISABLE_BITS) << HARDIRQ_DISABLE_SHIFT)
 #define HARDIRQ_MASK	(__IRQ_MASK(HARDIRQ_BITS) << HARDIRQ_SHIFT)
 #define NMI_MASK	(__IRQ_MASK(NMI_BITS)     << NMI_SHIFT)
 
-- 
2.50.1 (Apple Git-155)

