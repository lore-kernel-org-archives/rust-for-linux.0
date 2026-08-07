Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2338AC96;
	Fri,  7 Aug 2026 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086170; cv=none; b=d/1KU+P//oZXX5ZpudObviqke9OjPGFvOY9MlKtd48MHthwseOaRnJFXq/l7VBGhr4VshwPqcwGa6Hi+ROqGI2oRLrZAMubZdwjws4ewhMKSkxmuADqdo2082thale2+2ImBhjxGYgJwfmA3fwOyQ9/6apVSOBAkCI53aATcnR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086170; c=relaxed/simple;
	bh=F7Y7A/nUkO50uzCj7ZdwiNWURz04OlYPwgBgKCWJjsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqQsIPQ3pHLBIj8cr1tQTxwMWhsmprwTWvNUf+rEmzzHX+AaUezGNmcAU6skCLb1NSwUzAzfqci9dmykuQV2/kr37OLQs1pe4SNGrXoWPpeQ5ZBWBkM3jBTmoF/65VviIPSGYd0ZQG+JOemDW9YzKotSb1ba0JNMa/UtojXyMpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5ID1OU6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5ID1OU6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE71D1F000E9;
	Fri,  7 Aug 2026 07:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086168;
	bh=36qEnnu+VHFxkCyChMu3DL672ehrfvpUeGwqcHC+BuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z5ID1OU6kP+6S/iAeLO/uJKoZkn7EcBTK2uhUtCL76ZXrViheYcsOS/Kp5UpBH7vp
	 KxOgVRPQoobacMMfN2YYdSQc7YpbKJMUopt+gvS5dcX1CcwiD+3l6GeKUOBzMR44ET
	 KANoRR2i+Tko6mvB7wO6mvAG7ZySdklciGQla7oMi9D9Z8z4pOTEtbeIIl2go/Fj9B
	 TNva/XUBPgdOGBX86rsLHxqAjjiQXL/aX13YOMy7kbCkEAYaSKRbHFwxl3iIVnMCX7
	 RJyvTGd7arJL/yCts8FR1fuWDgAUvlCWU7vaWrWa/e4axiMDOpBx3KQklo188V328K
	 HwAueFVfoTjSQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 13B37F40067;
	Fri,  7 Aug 2026 03:02:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 07 Aug 2026 03:02:47 -0400
X-ME-Sender: <xms:F4N1as85QdzXw_ld7sTlWW2thgvL0g_Z1ehBoKoqXacHR2K5wDwBWw>
    <xme:F4N1atcysssI7BbLc6AwX2YxDsmi3XwnDnMW75VZCroQaZ3SShl2jiSCBYrsGUxjG
    v6ZhIklzVpIQtfJ5lCZJwBf_hDRQz1R4Rc77JQS5v8HYLOvk3VwyQ>
X-ME-Received: <xmr:F4N1agvvX2_99hJfuubNQV9G_MYVqWOLcedIDPsLKYXJrtOisiWLn9NUP7ziAYEQee8kFW8VdXdwKTYFfRy-sq2h-2Q-2vVK>
X-ME-Proxy-Cause: dmFkZTGyvHdDd1GzGWN1VJTYexoeLWbYipFw83SRb2uXMsYl+KFTYaUEpOTqk5K+My00CP
    NgJOi8LOILsVWSxl4ccyvtrBefkjyfVln7ypRQ+bh49utynffTDp/Bsg/I+mtxl14w83ED
    50tRYjk+o0iP8mpu+QvCT+Dk+0ekkSaH2jaUkhQ2IGs7hn31QTDC3HO568nJzP+sCzaxl0
    cNxOjeFWag8Xux4s5MnrVTP/LpOs6EV32l4U2+8ipe5mhbLBKcn8VxJg/bq9Q7Ww63Su+/
    gyrSa0CaL2q4j6exaTekIVpxNJMTqSgpye9e2bSA0gixFi8opX6xU3WPxpol6ShOOMsGrt
    6gzwPSi6T7H1uW+B/yrgtkMJ+wD0G7q1QB8MLS7UXfwKHFjnkiGmFisZv08J9LTkNQj90h
    8hfDi44+hrzFZSTCLEzh4cXaCFeDccGt36BDaIIdCl+32me0HAa7rIkXqlrctIZDCsLIMu
    Vp6RoxfvX3X4g1lDNio8Pm7svQTVKh6QM3v8vWDfww9NE7obY+XX3EfZ/Ap7hybAOSAREQ
    L6111351Vjp0aPkHgUCs7NQqL8u353LQ2PYiSFZVJM7pUixDrcIlVUcwt779VRfr7fGlvF
    o+1CtZQwCFHg2a/qyhHZn8b8G0AmaTWw4hqvUqWGNxbl201YZMP0BZbAnJdw
X-ME-Proxy: <xmx:F4N1au1A2-Ywu6fidFIsie27YBp4M60V6yjzIcZs9_spnkb_o-gejw>
    <xmx:F4N1alBS4kO4EGRtrfrhset14AgWcVG4rQFoqrM5oy3dvPvp0Sjg4g>
    <xmx:F4N1areiB4NGxi3e7f7QXA-SR9CGK4M0rxXvJDl5sX-ohL_1tnVdKg>
    <xmx:F4N1any7ym5UpI4B620KpF0ZBFARmBhN_oH2KweYrjpHkG_d_vkRBw>
    <xmx:F4N1amOZ9sMKu6i7Ej--S8806H5xuw17ierAwR_42qBeKyJLnyX-jPHv>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:46 -0400 (EDT)
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
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v5 15/18] rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
Date: Fri,  7 Aug 2026 00:02:12 -0700
Message-ID: <20260807070218.27144-16-boqun@kernel.org>
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

spin_lock_irq_disable() and spin_unlock_irq_enable() are inline
functions, to use them in Rust helpers are introduced. This is for
interrupt disabling lock abstraction in Rust.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 rust/helpers/spinlock.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
index 4d13062cf253..d53400c15022 100644
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -36,3 +36,18 @@ __rust_helper void rust_helper_spin_assert_is_held(spinlock_t *lock)
 {
 	lockdep_assert_held(lock);
 }
+
+__rust_helper void rust_helper_spin_lock_irq_disable(spinlock_t *lock)
+{
+	spin_lock_irq_disable(lock);
+}
+
+__rust_helper void rust_helper_spin_unlock_irq_enable(spinlock_t *lock)
+{
+	spin_unlock_irq_enable(lock);
+}
+
+__rust_helper int rust_helper_spin_trylock_irq_disable(spinlock_t *lock)
+{
+	return spin_trylock_irq_disable(lock);
+}
-- 
2.50.1 (Apple Git-155)

