Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D940343D83
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133012; cv=none; b=lBNdElvridnxbls3jcji6LswiS4JWFB1XQW+59YJ/yCKRe+tQxUzosxl+ELkUXO37fp+wVb6cjrLGCIAICoesrHV97eK8aQjf761uLjI4JcvJzYDa8jOIJboimfNMbgiW0mrf4akF6VECWByjEl/0rNo83xGfvsX2mMXLm3M1bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133012; c=relaxed/simple;
	bh=zFvlNiWsGFavWqUF5eO/ewZONYVI7BPPZ6bd9UR237U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3pHx5VmhPXCF9yM8Gd37mNRvni77rZtpSBozfRqD77nXWTP7yFCA/34JcDLPAjdKzvFlyAIA7hAnmisGXSLuO3USflH0GqAJXPEldWXoTkmCdo7sfoA8ecKo3y022wOymbc00PeGmaTCke4tQ8hRb95f72A8x+89BKK4nKASSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUQISKEB; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUQISKEB"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c15e8b2f1aso576801585a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768133010; x=1768737810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uGQh0Ci4qHJuenJQS4UY5CJSqOW5cHeWXPgPxWzhXc4=;
        b=MUQISKEBSTrW6JS3IqAkdkks9LccN4C96kzqo9Xff0MXC+6Wj64vkmIv7SLLR2yHW6
         h5K9m43su+1NEH62GqGD5rkAfBVe31xwobO4kzUmr0VxlqG+XaYk2ObaANKclerNmCyF
         xswAZevpibz1XDTLqB1WFDl6hxWRUNyl7SqaYQoS9EpAZ+ni8cUFRVM9nu/wI4QnUdNn
         mZhVZbZIqCWRLSJRVP1JLR5K+RSKX0oHrWU88BAGDjgZwTgRuLxK1OeI9mSnqvC2jlMs
         RvRjJfUEwt4qKHQRsQUZX8mry2Qtg/M3Bd8jgRBiklWR4lqaw8TDroZ/zrZdS855RUo3
         DN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768133010; x=1768737810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGQh0Ci4qHJuenJQS4UY5CJSqOW5cHeWXPgPxWzhXc4=;
        b=PXTj9+fLE/BwO2EIdRrzZwvnJt0zpYlPQ8/qQwROYNfJte2wuSJrnR4DYKBuxFkzGr
         gq5J1Idwhg9WNRO+mECcgEl20Mke/cT374UwFa43CDGjwlbUsqDlEEINZlN7R6QT5fMu
         2jgi1cPR02UInqEnwYmhHTccq0+MpqjBQ98BKvgwoIxnyKMYpmT7HOpa1VTUC/cd1Vvq
         6TTAMkhglSs+JW+0V7UMXxLX6kGlO9ZPJB1RD+3Ivukk9sGTFef5ORSTc/aT6dU+7wRK
         vU9c1AeHYE0OtqZp2b2xd4ugaqTgisSVrHnp55iluAXSJ5X9P/D7dL9oRH1M1JWsuvaC
         /naA==
X-Gm-Message-State: AOJu0YxqYpzGvw3TSj+aeCsRdIJyQzed8mJgM/NX3JjJ7wHkP5qzKAK/
	ulzTDa5XyIeMSo+I2k0zHSqm+IRqE7tnfeWDQ4n6OaWOser/C68Y6uHf
X-Gm-Gg: AY/fxX5U58P11hw//AFmmmBETD9Al35fIKYMLqII1Q2aJkkochbL7tg0udTK8KILsxb
	XIMZDmenUoOaUFnuOK50vfr5qrbwILJAIdOTas9zrDdEa8J1MwDrVSYWc5Cgg6Niu9FfO81iNZ0
	bZavqeXXouWRg3lcVYJWHp19agbDFxF5IILmyZj7b8It69p7SqCiNOViIqNAUVeaH3A9o+xw+2p
	uWPWE6CzvkdRomS4AaDM+N3NXVDr7pFDxFfqSe60YzvTSgknxk7c1Yoh64S6+3za/8uIWNeJjDb
	BF7pJshytduh7xsCTR6OJG1LXdh8KJDV6zev2rgMfZD+AWJtU0uZzu793LX0P0M2L8XG5z7kL3r
	/zjlzqVymFTLW+2/VG7R0DJjvjUHeNKEI000/I9NkWa3XaDxSWDhIt2+/+RfJxWX9H/boVFAYBy
	bFZbWETJWC5Uc01iH0+1KoNtqukwazodGyyI52n55F12+/21jia77kRhXXOc41qvEGptlk9SdwO
	dQbaWJsLzqz6copCE/l8NSOZQ==
X-Google-Smtp-Source: AGHT+IFekaKlXQCbYtbG2TPV2v7cy9K3Jwy+nEC8iysUZGVYcU9b5XnQVxnZfaTiVcM29v0TIzTN3A==
X-Received: by 2002:a05:620a:290c:b0:8b2:ef70:64e9 with SMTP id af79cd13be357-8c38940915emr2129278385a.51.1768133010053;
        Sun, 11 Jan 2026 04:03:30 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b9373sm1259953985a.15.2026.01.11.04.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:29 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 266F1F40068;
	Sun, 11 Jan 2026 07:03:29 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 11 Jan 2026 07:03:29 -0500
X-ME-Sender: <xms:kZFjaQUmGGZg_SB9zvJvzyKHvveHO6yhH4mzbrI6EPms195jTe2weA>
    <xme:kZFjae_CQRSafhdZXqPYgT35THTesQF6ggK2Kng7pfBHmLVIKRRPyngcAvF0UaOus
    YQlnU8339F37h9LeUAepM_42T5cD6SB6sSjWdKVLm-0EdLAWqMi-w>
X-ME-Received: <xmr:kZFjaahZPVg83kuQMPa8GQiYLGWeYESHwsDISuFVUEGRa7NfG4itkADq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepvd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:kZFjaadA8yJHgD1bgtXdbu1b5G3gxMSI_hRP6s_Qd8w7BIEr5lLB_Q>
    <xmx:kZFjaTKWx23L4NKtK73oxK_TOcJvJoUKwsHWRvtrlz2BeLNDchMmdw>
    <xmx:kZFjaXlSrhSrozgDRk01UMBz9lvGMz5RJl6y4smcq7a1VCwm0M8DcQ>
    <xmx:kZFjabdDwcKn2DEzNN42V5WSnjaeRpKugGzZavMUOQ5-b0WDuG-1BA>
    <xmx:kZFjaYwOZgRB62Uq9HtFX516pC-cxIO2MK60fYHfXmzcGK7iDZPMWeoV>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:28 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
	"Ingo Molnar" <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Will Deacon" <will@kernel.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	"Joel Fernandes (NVIDIA)" <joel@joelfernandes.org>
Subject: [PATCH 29/36] rust: rcu: Add __rust_helper to helpers
Date: Sun, 11 Jan 2026 20:02:02 +0800
Message-ID: <20260111120209.6133-27-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111120209.6133-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
 <20260111120209.6133-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Ryhl <aliceryhl@google.com>

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260105-define-rust-helper-v2-16-51da5f454a67@google.com
---
 rust/helpers/rcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/helpers/rcu.c b/rust/helpers/rcu.c
index f1cec6583513..481274c05857 100644
--- a/rust/helpers/rcu.c
+++ b/rust/helpers/rcu.c
@@ -2,12 +2,12 @@
 
 #include <linux/rcupdate.h>
 
-void rust_helper_rcu_read_lock(void)
+__rust_helper void rust_helper_rcu_read_lock(void)
 {
 	rcu_read_lock();
 }
 
-void rust_helper_rcu_read_unlock(void)
+__rust_helper void rust_helper_rcu_read_unlock(void)
 {
 	rcu_read_unlock();
 }
-- 
2.51.0

