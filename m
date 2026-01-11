Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7EF342CA1
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133009; cv=none; b=YFi7ARuyK9PZI1LnFoniC1pyCdp7ipLexwZsUgxecPex5iJCqH8HFJtZQ/Dtu1Ipt89R9J2baVQlX1Q7dHO9SZ1AiddnZXAjSoXkALMhhZNVBrNH9W3+B4FbX1ZtJ5anrX2wO6mwh7O3uDHFf5ZTLuF5UmcP9nkv/xmPuZkzNak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133009; c=relaxed/simple;
	bh=WKc4i4v80tMsJkenSfj02FR/kGNrvayAalCg1TZJJIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QA5aivrLRTTn8B4MM/gG76Qkt6cwCpbMIlVfn5eoyz9vI6gw4QIWLFtQ4tkGnlkhInmdM34/SPMKwkxyS4fONPy7JSjKDGZTihawwmYyEgm7n1IM639rLb88PJ3YMV6Og87rWk2P/8GOxKjxYETWFplU96fjyfMZYTOz5NZt2xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQViB6HI; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQViB6HI"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8888546d570so72639066d6.2
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768133007; x=1768737807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z7yCC1H8Wlgvqnhz5fJtpl2qjxmqYPYGt+wUVIjeMpY=;
        b=fQViB6HIVSyI2LlwTQCJFPxYJlFs6G10UZ2ZwosdonXkZq8KoSXFwQ3gZ59UjiiRr4
         MV5k13AYvm330/2H+fMOXJTrK+gFT6fRXzuUI5CVjvTi95fMzeSfo7c2rT7Ex6720Uni
         f8Cz8dUO9StmZwcp05jmTHwrg3XXTk5qUsYFRnRzYYKwpNwS31EX/DPczhXapsrQLexy
         tpNQnJ7tHihKmFGCJsSdbJfqZUZOfNbTosK+8EmRbZdI9KLpPseNHD+czS73/JHbeAgi
         XpxUeNL6CBmpzusjxLGgBdB6+CVLk/NtSIlLFSW1WVOUH9Xtcfm8RYc0CgogBSROTzSL
         O0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768133007; x=1768737807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7yCC1H8Wlgvqnhz5fJtpl2qjxmqYPYGt+wUVIjeMpY=;
        b=l37BSWtn4ZxAXkd2TdcBSuNeKc2buw2II9kdWm0nFiitJGcluM0V0fXi4f7d+O21cP
         gvK6l9UtbkbNE8SAYSrGLFmJecbmBoA5l9QCFCzRErc8qJlMPtmHNkat5rvpAFszrzz4
         w1WTEeL4tC9KYNEn+2qJ8E7zCOhoAi7zEAb0FugsSxOA1f/BWiXR7Ayb5KXt2qrJNHav
         Zcxu0++T8R8zzQduqXXugwtCsbIy4J3JB1wDvHxXA6UTC14ccAaTs0s0gkucC2FNm1m8
         qBZLh0cYR2rz3WHDRp7BoCbsw7Uob4inQ+2fJ8mmIlUuBhQGoNJ0xh0ORszK1MSWzCtj
         Jt/A==
X-Gm-Message-State: AOJu0YyMt+nVJcGLZj9iqHTPr0Bx9sEjbcTJUFSOwOn7AYWAe++mFhja
	6KpEomhnsTjhIT2usvtAPigt8rGDHqnCDD9ev/rXKGR66F4M2ajCesnc
X-Gm-Gg: AY/fxX4YotowJAX1klyntOpwzZ56mdTT38/gY/u598nuwrRqMef3/nzYfAZ1RNDG3+8
	ZMARP/iXDiw5SE6uhFHzoK+GUcIeBB0m+CsB3P1Xp71RGxfNj1e1KALwGrSHIHlh5G7iDyOySrR
	25PVp6zbB31MbNUQWvLzCIuBVZu9lGTdaahjQU8LYySPXhkUrh3a1GM5Dc8jHepV742DKE/+RYw
	FMML6BHMVgLq3a1tcKguJuqSdvki77WlY8fzT/1k+JNMHz3jMYIp5stQ9vf4rsuMXk/lyZREuY8
	+YjE/rfU1cZE5muLb7QP0NtdFp6tDpgEBDlFZsIMtqTSmGXM6+w2EPEnsDVG8v0RGmKGv1MQWuU
	Ah/XpAu6ZUS8IcLyjM1u2Y3oMvPWu+aqIZj6VkwCD+ixVhCvwLuKQvn1r2rLmG63ocBTRDMCFNL
	6V3sCpNUCqNBmhJGVZcZUb3ZCmP4L6kCh3Y1cvhAGt4hmmi5zO9E/GHw8wTUdpQAiDs9c7fUam7
	ZG7hi2ksHMEA3QbBA8QHf5C8Q==
X-Google-Smtp-Source: AGHT+IHxYJfqNCbcHNqdnOnoO8dstTPoSYVFucIBip5DgJ3c8b2IVvcgo9aAQg6ObU01hjWBlaa4Lg==
X-Received: by 2002:a05:6214:338a:b0:882:3704:3028 with SMTP id 6a1803df08f44-890841d0ad7mr200387456d6.30.1768133007135;
        Sun, 11 Jan 2026 04:03:27 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm115665516d6.2.2026.01.11.04.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:26 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 53C5EF40068;
	Sun, 11 Jan 2026 07:03:26 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 11 Jan 2026 07:03:26 -0500
X-ME-Sender: <xms:jpFjaYaOcgQQcR_Mv0SEwSJkT55tME07-1Brcr6-EOXqzC-57hEEjQ>
    <xme:jpFjaYla25gzrKOnfQtQOODE6GQQ9B-2Bp85pHVhY_YqDGbs0Oh0TKAlZzWGwddcu
    _4gBZWnC_-DTh_uhTZOHex-rHpwGPB0Md4wr47sUE49POFZru6CqA>
X-ME-Received: <xmr:jpFjaWUqc4w8iRVHUCX26lhEH4pMl2L_PuTesrdwxRyY4sdRHy1UlABd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgephe
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:jpFjaSIKWo4WltdWADbXuHCB02h7Yo9yeMtVm0ZTZNpVtGLh5kUnAA>
    <xmx:jpFjaetvRDchntGW0HHJ_w88TFWVTVzyLnDA9TU4iKDoNTO3uIvlbw>
    <xmx:jpFjaf1INTx2SMZmokoqlQPLI1K0rw5E-OZXgQn8gf1ja5peqec47Q>
    <xmx:jpFjaePyOnTl2nfFKqD7AepjhIOFGgaUkN9dNJ1IbrIK0ZBIpySx2Q>
    <xmx:jpFjaXVxyr1kFtPcG30gTNzl7_AaIN8tuaf3xFMy9d6OUfGZiV4NHm8y>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:25 -0500 (EST)
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
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 28/36] rust: processor: Add __rust_helper to helpers
Date: Sun, 11 Jan 2026 20:02:01 +0800
Message-ID: <20260111120209.6133-26-boqun.feng@gmail.com>
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
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260105-define-rust-helper-v2-13-51da5f454a67@google.com
---
 rust/helpers/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/processor.c b/rust/helpers/processor.c
index d41355e14d6e..76fadbb647c5 100644
--- a/rust/helpers/processor.c
+++ b/rust/helpers/processor.c
@@ -2,7 +2,7 @@
 
 #include <linux/processor.h>
 
-void rust_helper_cpu_relax(void)
+__rust_helper void rust_helper_cpu_relax(void)
 {
 	cpu_relax();
 }
-- 
2.51.0

