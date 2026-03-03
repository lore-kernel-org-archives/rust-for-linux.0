Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F773A6EF2
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569038; cv=none; b=pfYoqxRx6DZ+oVNCTNy8cBSXqHYq3qysRd+lRxb0L1Y4f/scUo3vgogTIEBvMqCVxqcuRx5FlHOmmDYJYqXGtSgCTcapw6Vgv8ITnIS8GuzkYJgkVQXnTyo3PHuknGIq9W+IZIFPrrG+C+28tG1OAH+JHQivZjd1iCVZ1yIEMjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569038; c=relaxed/simple;
	bh=qdfmW8DYUAW7xx4/j+eFiei8zD7czndjnF2gt63ecJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcovzlgujI9eD916gG1usQoeAVYJZHqJuLaIJ/h0q+k1dZbf+ptUM30SyMmL07SmamlISYxW//Z3zcasvZcMBe3cCQTlUGiXW6r+fW4CsiEvPHH5/v8xm4L/qlP/ZaXigHmh70uVO/A7IC9WxvMIErmrrO3c98Lr94WRnCQ67Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ohsshmhp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ohsshmhp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222FDC2BCB4;
	Tue,  3 Mar 2026 20:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569037;
	bh=qdfmW8DYUAW7xx4/j+eFiei8zD7czndjnF2gt63ecJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ohsshmhp0O4glida5hYhCAWllkgnp/6WjEGSh9wBKDU3x9r5iFsvpENW6BNRUlANE
	 smCN6A+6V436D/mZ+nyvCNJZsitPc+i+HqUuyhJ+jlIIuDF2VCRERUCzL77m7nuYz5
	 ticwXhBNCwFsVhXyDyq6TxKISIM2T4HXCjKNVoaa5qR38CpVDhBUto1ntsl8b+/WSt
	 sIlWImPVXn6RnY41fvOi6ymSID2uh+0xbqxdQROwJCG4ZWJwkGJDt/1XkuICKc0oid
	 1eBfNY9r+nahCzPkYSz82XwdVA1eLpkOYtRGI0uyP6Kds3rmiz2zB+w8WximwL2k+Q
	 izRLsJ8RQn2OQ==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4B55EF40069;
	Tue,  3 Mar 2026 15:17:16 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 03 Mar 2026 15:17:16 -0500
X-ME-Sender: <xms:zEGnadslmCuFrWYOzVfgfylUvsIYaRDVGy5r7wG5-WGRvFxf4biNfQ>
    <xme:zEGnaf0rFeM9k-OlHa9lXiHRRbSo3Wt45WyF7cAhJRXemZ8cn1JBbuz_pFc_wND57
    Cfj8YSRn_3k5w748novKJ5g46rFxiWloYd1oPEmL1q0b13aIXOyrw>
X-ME-Received: <xmr:zEGnaZRGxHiQggu-Al2F700cCVC5dgZ0WxWymcK-r8HZtgSerOhxlncJajY4az9oHRY3CoM9hUj7IpOTKkba42SGFwJotMR9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekieffgeevhefgudffveffheettdfgkeeilefhhfduhedugedvhedtteegvdeugfenucff
    ohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    rhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpg
    hghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:zEGnaTuDo2dqbpQBZnunO1p8mjg2XxG21-9G36use3G8sZPBzJ_cjg>
    <xmx:zEGnafLnlgtszOu83G8BFizje8LeHnfqbrKACyvaAWF8W6m0XSYwlw>
    <xmx:zEGnaff3PeBrplLTrxOT9zjGNiI8rmLA1rhWH2OWkHqg0dC-ar0Scw>
    <xmx:zEGnaZUg1Kp40K57wvmmjGKisvsgEJOUry-jjtOh1uQusgwtDAtioQ>
    <xmx:zEGnaVh8ONrZJkdwCpAqdBAT7FdeqiHbMtIDdjm9dxhV3Jlr4g0WFanm>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:15 -0500 (EST)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 04/13] rust: helpers: Generify the definitions of rust_helper_*_xchg*
Date: Tue,  3 Mar 2026 12:16:52 -0800
Message-ID: <20260303201701.12204-5-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260303201701.12204-1-boqun@kernel.org>
References: <20260303201701.12204-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Boqun Feng <boqun.feng@gmail.com>

To support atomic pointers, more xchg helpers will be introduced, hence
define macros to generate these helpers to ease the introduction of the
future helpers.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260117122243.24404-3-boqun.feng@gmail.com
---
 rust/helpers/atomic_ext.c | 48 ++++++++++-----------------------------
 1 file changed, 12 insertions(+), 36 deletions(-)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index f471c1ff123d..c5f665bbe785 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -44,45 +44,21 @@ GEN_READ_SET_HELPERS(i16, s16)
  * The architectures that currently support Rust (x86_64, armv7,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
-__rust_helper s8 rust_helper_atomic_i8_xchg(s8 *ptr, s8 new)
-{
-	return xchg(ptr, new);
-}
-
-__rust_helper s16 rust_helper_atomic_i16_xchg(s16 *ptr, s16 new)
-{
-	return xchg(ptr, new);
-}
-
-__rust_helper s8 rust_helper_atomic_i8_xchg_acquire(s8 *ptr, s8 new)
-{
-	return xchg_acquire(ptr, new);
-}
-
-__rust_helper s16 rust_helper_atomic_i16_xchg_acquire(s16 *ptr, s16 new)
-{
-	return xchg_acquire(ptr, new);
-}
-
-__rust_helper s8 rust_helper_atomic_i8_xchg_release(s8 *ptr, s8 new)
-{
-	return xchg_release(ptr, new);
-}
-
-__rust_helper s16 rust_helper_atomic_i16_xchg_release(s16 *ptr, s16 new)
-{
-	return xchg_release(ptr, new);
+#define GEN_XCHG_HELPER(tname, type, suffix)					\
+__rust_helper type								\
+rust_helper_atomic_##tname##_xchg##suffix(type *ptr, type new)			\
+{										\
+	return xchg##suffix(ptr, new);					\
 }
 
-__rust_helper s8 rust_helper_atomic_i8_xchg_relaxed(s8 *ptr, s8 new)
-{
-	return xchg_relaxed(ptr, new);
-}
+#define GEN_XCHG_HELPERS(tname, type)						\
+	GEN_XCHG_HELPER(tname, type, )						\
+	GEN_XCHG_HELPER(tname, type, _acquire)					\
+	GEN_XCHG_HELPER(tname, type, _release)					\
+	GEN_XCHG_HELPER(tname, type, _relaxed)					\
 
-__rust_helper s16 rust_helper_atomic_i16_xchg_relaxed(s16 *ptr, s16 new)
-{
-	return xchg_relaxed(ptr, new);
-}
+GEN_XCHG_HELPERS(i8, s8)
+GEN_XCHG_HELPERS(i16, s16)
 
 /*
  * try_cmpxchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
-- 
2.50.1 (Apple Git-155)

