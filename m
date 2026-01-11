Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8702433C19C
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132976; cv=none; b=cSRidGVkBYzFYf/MVPJs7YBtD+9avr9ygOM4otXfSa8VOCbXMaWx3/9khOzLe2vaa8M04OVGaNkyW+bQ7DdpqUTbQIa9rI5EJdwpH3E72Z1XYFygJ/HHRr4KnFJXhHkOnw/Zd4s8uQrbdWOmYFuUL+s5CTE7uDOVaCkW9LQoA9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132976; c=relaxed/simple;
	bh=FmDyzOXcTU5POPP/JHx0S/9TwcaGsgaz4CBznfJ6/lI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrNeih2A0fsWzDfjmg9CFyO9jsgGYV2VEF4xzDTwVSAYTwPf+eSXtLBfM+Pe+Xmj+GOTY65CmZvlsZJeNFfvSZjXU4c4xWFajswzALRKxEya0qFRgSn4L/M+XoeNeai7nR7wPREVAXDSorLyrgjmOQTPJKG8v7sMVbrnvjKfTko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSSCbpAG; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSSCbpAG"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4f1899960f0so61533691cf.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132970; x=1768737770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0f+LW0zk3ap56OkY+whB0wzRk/+8mav7B55FLLgc5Nk=;
        b=WSSCbpAGDHeLhJMe77CDlOlLXKOmIYBnDITD0V0N5cc0fjN5nQgwPdUjyH09gjxRID
         uzRd4s59iooymQSe7pBJm0MG1IhtOriuJmDnWq29qUpEtGfHAbuCqOEZNqP96tu0WmaC
         LplOW5L1YYLzuitu5iD1y6gm4OgXqqVkv8I8m4l8Lo1M5240Cqnv8ElwNJH0lpfWVAfQ
         7/Ks9i5jTGNrb73TBesamFBhpvb6/pqIEtH/d85mSoJCWGNdg57TKLxOqYTZmNwdilm5
         67fXRvFGF2ZHF/kv3syIo2nDo6CPH/TPYcd04o3TEMQ+0i3K5uFjTnrCTYT1/qlxdnNY
         up9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132970; x=1768737770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0f+LW0zk3ap56OkY+whB0wzRk/+8mav7B55FLLgc5Nk=;
        b=XZXfihJtbW8OaQwIvEGxgdReB3l2dLu7sHONz5dtSkqWWzGgr2W4AQqGb7Aj2iSk6f
         onOTdrKDq/+vK2VMzea000p1PEs/vuRjDXA+DKYTqIFhaIh+2uxF1gCDCngcQpNj5RY7
         +/tv6ZySsyi/huclQgSZ+pJOl6t19jFX2bYT3Q23izZbjyzOeY5QFQFj+EpmyBsO0u7Q
         HYucvIwi/nt85voXFK/sjh1FGhVfWiuK+bOSg8JvaFFq83+qwqk3l9PQmu7XQhRX6mpI
         XX+aaS7wobvapwPm9YdjD8s1vFyHPHOaMwRMu0j9QT2+Km+sMEjF1Yr6w03EPsSv4sZL
         Pf2A==
X-Gm-Message-State: AOJu0Yz4ESbyxeSg2obSO80MNsbiGwgYqVTD5DVAIbHtDtwP9WdWhiUt
	7cd5rl74Pp7pzv2zN0c94V4824nEMMYl3XIdAvjZFzBnPJaGF/AlyuvD
X-Gm-Gg: AY/fxX7qc8mA0xU9xrHVb3Gw5/332Q4dXt//aQx3QxQvuU6yyCcqt9HJd4c3J5uD+Zt
	GZXdJhxsk3AUtvCmy42O1f4bvs+NT50BDN6Sy4RYT1FtorKNbpLcJWoRvW9cYd91SIkzN+1ujS2
	ehGMuEQPL7BEV/UPQEpCuOATBxshR6JQ7FfrZR8vJVZ+Ye5a3jmENcdXCSdjSiPI9MVaUil6OVM
	/HkKq1T9UBhXs5VH34vF8onZnFkHtYmGkt/RNV/V/1ocSLxb8tyYymBB76mANsnD3ihTjlkqKv9
	mmtqu6MR0KKycNBDXQSrefeoKxMGQbfHileQ7Cr6lTbg3BytGhydMUn7Mof4nt6lZ3uD5yN0HTN
	tTuZcZ8bgA+oaszS51CflUGP6ds+IIn716hagVGZ5+PoTsp36E0RbcIINt6eT5sTGVO0rzKoSzQ
	oH8sThXLe6Wv3hqpzKhPVQriAR1J+Ex/Q1zkk9o3Cv6rJkqVR4WwgpW7iTHc8PwYmWC22SNMbGi
	CkRLukFkt22sso=
X-Google-Smtp-Source: AGHT+IEr/Vp1o08zusBXjIo4qMw5tEeuExxCEjLQjK96/QTAoGXQZnM8B2laSm3McAjxwCiE4JnUzQ==
X-Received: by 2002:a05:622a:144d:b0:4f1:b7a8:679c with SMTP id d75a77b69052e-4ffb49c7d6amr204831271cf.63.1768132970462;
        Sun, 11 Jan 2026 04:02:50 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e36232sm105541231cf.22.2026.01.11.04.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:49 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6CD81F40068;
	Sun, 11 Jan 2026 07:02:49 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 11 Jan 2026 07:02:49 -0500
X-ME-Sender: <xms:aZFjaWIpYWzqc7yAqIfXBMqqk1AYE2cLaFqC0hPeIplijoqR7om5pw>
    <xme:aZFjaYi_GRqkpscaGoX46QkO8tKrqvOmKl7hjtF2JgbqwEHRQ5X-yRnWvN_0CWf4q
    yDhEUiSKzGC90hTSWKrhCLkjq36i8BWz2TXXoju9GP8EzAXqCbpdQ>
X-ME-Received: <xmr:aZFjac1cMW3C8KxL1JqZH95QN3xVianurXy6NjfbVLIBeo2r0C6HH3na>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepud
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
X-ME-Proxy: <xmx:aZFjaWjVx0XEXufVXA95j82b0R7i_a6MC6bscP4C56HMzj9_0xp3sA>
    <xmx:aZFjaV9S3L-TjT7BvF-1v7-8_ngeKpeYYqR5NEKFLj_QwsOGQhd3FA>
    <xmx:aZFjaaLfDii-FnkwMTTaonb6DGbO1t6IpaNkw-lsLOsgKMwKzfdHwg>
    <xmx:aZFjaSw0fHHJMoT47MTDJuw9kdQ-Z6Q9TGtG2ngm_aPdP6yJvg1ChQ>
    <xmx:aZFjaV2O43_9EU02irZe2hSLWfZQmkFNv5Igd-_9As2pwqg0Jj96bp17>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:48 -0500 (EST)
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
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 14/36] rust: helpers: Add i8/i16 atomic try_cmpxchg_relaxed helpers
Date: Sun, 11 Jan 2026 20:01:47 +0800
Message-ID: <20260111120209.6133-12-boqun.feng@gmail.com>
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

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add i8/i16 atomic try_cmpxchg_relaxed helpers that call
try_cmpxchg_relaxed() macro implementing atomic try_cmpxchg_relaxed
using architecture-specific instructions.

[boqun: Use try_cmpxchg_relaxed() instead of raw_try_cmpxchg_relaxed()]

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251227115951.1424458-5-fujita.tomonori@gmail.com
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 962ea05dfb9c..7d0c2bd340da 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -127,3 +127,13 @@ __rust_helper bool rust_helper_atomic_i16_try_cmpxchg_release(s16 *ptr, s16 *old
 {
 	return try_cmpxchg_release(ptr, old, new);
 }
+
+__rust_helper bool rust_helper_atomic_i8_try_cmpxchg_relaxed(s8 *ptr, s8 *old, s8 new)
+{
+	return try_cmpxchg_relaxed(ptr, old, new);
+}
+
+__rust_helper bool rust_helper_atomic_i16_try_cmpxchg_relaxed(s16 *ptr, s16 *old, s16 new)
+{
+	return try_cmpxchg_relaxed(ptr, old, new);
+}
-- 
2.51.0

