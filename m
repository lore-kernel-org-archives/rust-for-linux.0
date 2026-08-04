Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C883A4749DA;
	Tue,  4 Aug 2026 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860126; cv=none; b=j1s2TGvNcd27bpeyRqiZjYIC5X+7iIuQbkNU29eD9orstX46UMDNnW2WKOWi3AbgJ1RyHpe4dhmH7m4pi1rVpWCJr8HSLsFHvXJQ52R8TM5k3FuiYBS85VasDWSte13VIeBoRI1sDIs9zH/mcWOdd3w6GCx1Pm56E8WE9/4SFac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860126; c=relaxed/simple;
	bh=F7Y7A/nUkO50uzCj7ZdwiNWURz04OlYPwgBgKCWJjsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mD2xjd16bKWnn7rDNcBxO0U7plD0NPMq04ALg4VnJQKWTs3kzpaspALeDGVkVa3rfyIwG/hg5xf9Nr06NscI9A0GroUfkCIPhSiDpCE78Yo47C0Hwbbg0hu1e4DZQ8NjAYvlrYjVTBAFvVXnUT0sLZ9bNx8RV68YG40/MBns4Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYFWZjyl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYFWZjyl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7A41F00A3E;
	Tue,  4 Aug 2026 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860119;
	bh=36qEnnu+VHFxkCyChMu3DL672ehrfvpUeGwqcHC+BuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KYFWZjylIU206KPJQHAouWrO2zaoUAK27PgJtqD1nt9WFANanrgO9fhZSmWoKBaLo
	 wrqcoCVfWeyW7XLpUdK3jD4jvwUxYDrsSqDEwtSMrt3xieKVcdWgD/hPm8R+HtfGog
	 hwQ1yK7wUuPTufKocA+lmwMV+p57vkFa4bGdEoq4giev536YO11AgG6odSxz+0knGZ
	 kTGNAttDinyQOJTX/5iNgalCnnPN5NISsGSeak1lHDlObMRixqQIQzLDWD3o0f6PgT
	 /AGH09Xtp8QOrgCSH2vTZrMeBNZNUGxp/bbDH2CFSDZ/foziDVVDS0eEQ9H5+6l+SN
	 xK5+4f0lCcnhw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7810CF40067;
	Tue,  4 Aug 2026 12:15:18 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 04 Aug 2026 12:15:18 -0400
X-ME-Sender: <xms:FhByal1TmKLRaKnOKUhBng89epFE0q-3btpRKc9DZOPUyOk2qOk21A>
    <xme:FhByan6sQ0LbIkZH4Hbil-0dbCw5KiuEW9jSqhcrgVDYKWdvQttBppKlxF28BvB79
    lhP97lRH4Nvt1raS3Ojn_IjOIFXHaOjmsABZuhLwdMNErsGzFBRVw>
X-ME-Received: <xmr:FhByasXJWGflG18eQgLkJsZy7duWP3Xp6MRwYcAhDGzrBZMXlzu3d2IwaeoPS-3hlG-ageY2iRSFsqaOyPR_8ejtcCiKjQR0>
X-ME-Proxy-Cause: dmFkZTEjNALs/vHMOloma/FioWgq38LEDphqLbi/MDKjZ+skyek9CBm72qNR6fF0uZPdGp
    TNcnAR4AQwTabPyqXb4b8VVQVFCNoT48fsLJV/4jNEVJ0A9eFv0ovpeauV2dgztP0aY1Y0
    jIaZAzpZKJmSr5bjx5yubrqLJ++dH6uDgWLI4XXVkSa8jJqAXQgEQlXOv7WGccuHPTRlER
    Ylu8rJket0jbyQhGWZ+weYiCIeD4wr9LDagDzAHrKU27qzYbzXZIXOYWeFfQKFS5QVbMSU
    NlfDPJ2QDHkDrdBA1iUAq2dsmA2mOrsNEsIEQsqJKBWsANZHLO8XMG8BasrOULdBqAdbXI
    DriopieP6f4X5f5dlxaM/ucjKy5utE+zF0SNby58ScV/dtasTk8xN9P0Qztpku5lS5RjAV
    sqzv7ML67P+yf/Wqz5iSuX+nRwqvrW5Uyh9RWCv30nllzYNVl+I/uWvPwTKDsB582AN+90
    Nsk1NWWF3Eri+QGYJC8hQqtSFkn03UPOdXGNbrK1P4WsBtVOn0mGhw7OjcwD2NwaZ2cyng
    MIJPyTYGbvcuWfgM2L7d5U0NxhFS8ctpq3qYsWu+6uAlVRbAYpFXOyWR6C7N7wO8Luf9JA
    IyjfOd7r8Ve2T69ogVZduBtxD8YcimcgtJa1CFzAojZNLtpnp8sIt10UxxNw
X-ME-Proxy: <xmx:FhByavjr2zHPEbGtKt6rxQrt3K3sRBYK_w7C3v40Edhk2COb1XYrcQ>
    <xmx:FhByase77pzgkneA36EYbI-jKNWBzjnfq5-iaD1zbasj2m7dO7DMzQ>
    <xmx:FhByau0tslzvHaaqGW09XYCNAoRes8dtU7yjzYQ-K_y4E-FZu8s0_g>
    <xmx:FhByaopLLsCu_joUs0NG7dTuVZqMfTta6uESfibD_XPWx1Y5IVW-cw>
    <xmx:FhByamgwd9W4RLpn38aHArKenZNiRQvVuGoRfnis6Pt8TEBgVbFbciq->
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:15:17 -0400 (EDT)
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
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v4 14/17] rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
Date: Tue,  4 Aug 2026 09:14:36 -0700
Message-ID: <20260804161447.84806-15-boqun@kernel.org>
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

