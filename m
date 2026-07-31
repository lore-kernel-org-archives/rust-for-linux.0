Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39FB3890E5
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529866; cv=none; b=L3JrhjhqBDqUKG6UBpIpdzruTp0PuRa/z+k243CcaYcfU8+eqcr5eOuVIOE7+Ii2TbqQfcYRwhJfIhJ1Ktq4IjfOiNtlmThbczk65WgnGFxRh2UzA96cOL60RVH4/SW7m7FgdZk5lBqNQ7PhraYu85ygMzruUby1UZ7r5BXZbrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529866; c=relaxed/simple;
	bh=Csl9FgamiuSComdT0LtWtXb5pp+wvqtY2ufh6bHEU2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWydIrKMh+2/XSZiNKbjIQuCdjX5+q4QWW59P13JB+HMLU9SsMn0quYMmJivXKMOTHKv5Gv95TqmFp8QTpdzYhg93QjgRYIl7J7N/I3sUztPXg4dzzTlTN81JS0oxBSZEmoinZuaNF8ktegB/yAn46hrfVkprKzJEx1uBFnEAZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0Qg1Kut; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0Qg1Kut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FA21F00ACA;
	Fri, 31 Jul 2026 20:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529862;
	bh=3o90b4YG5/hZO8lKJFzVklS8W3bEmVD2nkuEFaNhGQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T0Qg1KutNufk2IM+RhITSkqTqAR85QpK/qRVkMBSYQHLwUxyNed17dolBRIZ86dos
	 TMPBAZy63Nxbt8bzo+cKEztCTXDm3Cr9vDUvPaWjJoCq2lXH0Fg/y3NZswpK84PMMW
	 hlmad5pXPRnoBRBsksZRO3k8cz9HdqFqiorkgIvWks3f2bVb2orqYD0jNTXJEz3zFK
	 GFZNhP1cOo8J4vuyvYew3mBzSU8d4knmbPuyQu6BTHMVU/Nz2axWGtNZZPgfVmDZrx
	 uAgZTfFdZ8vr8+7D8BlkUhnIrSSujQ9yosAqjKuazwT1Jojv7pBgL/IsHTtWP6yKJS
	 tHObw0pgZc5BA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9D335F40077;
	Fri, 31 Jul 2026 16:31:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 31 Jul 2026 16:31:01 -0400
X-ME-Sender: <xms:BQZtaijf8ByPkYDHBBQbrMFJMpIbjWIvmGSGX-LCSrFakaX3VK1Qbw>
    <xme:BQZtaqnDfnoA7ZRZO__7CUtOcp8bOFVQkdckIQKJ_78_Jkao5mmlH0p-rloOMB_uM
    iHQsmyNHJxn8x8Jw_Fgu7nYZ-KoWavV0KoRFkuQjRwyzoJR4mSDaFI>
X-ME-Received: <xmr:BQZtapsvOhQdauC27O-ei0oL38W8-gKRZmdGr21r5Ui3MsTCvK3DoLRsOGKlEBFbO8jGw6X1KG2ILlL852v6F5V_oc0NfRgW>
X-ME-Proxy-Cause: dmFkZTFdRdBIF8ZH/aPs2g1lRw7GATpB3kPZdHQ9SRq3TCfYELIaqSZraFLrXlLQvfZ+Zw
    L2FnPfSJd952oWr+y28mIfAsYcvh2g32U0J8iwTV49f0k9Q8hXOe/2BgVhInUEnjhmC2lX
    03vYTAlN0bq9NjF03uLbRgPGL4766SVn/XbgM9h+YDdXpmZY+TYoTPsYcygLFMbtetKCiX
    MKKxau189OoX/tBJGac9kkLntk5lYAb6ORV5iOKO0UE2KpFdBfn5cZVhjAZINCJF+DQAjd
    IJX9TqJvKbTOKjLKBWundtWMSfFqKbkgkDYizysOgKGZkbbhOs1gMmPcuy0Gf54a13j8K8
    mI1S5bYopVWBYIR1xGaeBPsUryTbk45qIhTI0o6U7pv9ryWs4sNkkTY7H7XAuo5/irB2Mi
    hKevcJm6KEswSYN0jAOu4XPNKtOjhTEn6wMNgsjyRNRwnBQZgKo2gtalJ9j36BiwxGQPhu
    nIeLdUOLGZHND1yhAJa3vwRzT99ITV1KjmUfaEunbNQug1I0OpHwPvgOyTCO2Tyd72aprq
    NU7sJhb1jNVK0eFEvzZj8wfsUlUQ4Szc6f4Doha44ZvIyQml/VZ1TT56FFtl64zh9SvvCp
    tEjZ1reC8QiYxkZl7OjxWRB+Cn71sxvD+/nmwRibTeoH65jmmwPR+VvtfLTg
X-ME-Proxy: <xmx:BQZtaoDmIuTeBz2mhEcs1K4WTuZDXK0Dk5fe3EHs9C_VFWZmUL3fQA>
    <xmx:BQZtamWsRBB_GhWfBfS6ictcojoDLqMb2P4rE1dPZAZhiYKVmvYpqg>
    <xmx:BQZtahFjwgLZxdODl6ZGcAgVRvDpE1gEyYQccsXuPcfxy3iUyJobdQ>
    <xmx:BQZtahOQbVlXfqapU-sYfrRFExGqmZ5K75UQBkhFLz5KjJId1sTKVA>
    <xmx:BQZtatW1AaAY7U_B3dHemYc5QLtruk5aqvzBzN07rXpjZmFzfpAZ2U1a>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:31:00 -0400 (EDT)
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
	Boqun Feng <boqun.feng@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH 15/24] rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
Date: Fri, 31 Jul 2026 13:30:16 -0700
Message-ID: <20260731203031.13679-16-boqun@kernel.org>
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

spin_lock_irq_disable() and spin_unlock_irq_enable() are inline
functions, to use them in Rust, helpers are introduced. This is for
interrupt disabling lock abstraction in Rust.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Link: https://patch.msgid.link/20260302232154.861916-3-lyude@redhat.com
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

