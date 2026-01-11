Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4DD33D6CE
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133005; cv=none; b=gH4JzAZ85FEJIQRmlijzpbZgLWlYz5/p4Ep5+YnS5lr88iTFnPImPcYsiph0zl+v6XmoerBunvkO7HAs7l8YF1dYP6/BLZbTC3Q4RvR/4MIu8uVpsqUnhfm+Vdp5XlztFMp14E7Pyjj5aUhxVC6bsFfpsa3BOFG32iC4Pajqg9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133005; c=relaxed/simple;
	bh=iu1AnlmYLDFwDcq0kZil9Xiqcd3S3IIAaiV6D4qtZk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQJSLd+GaDsN+F5S4NC0ZD6XR/riGiEAavAmW0Jx7RhZDhmNfDIZGnV446tYkABPChkpb+QZ71hi1aaUyzxMmmz//VlK4TctCfu1jtAxqxZSWh9w44V4S1+Dr0y05mm+BpJy0hGGpC5GPd4QNvICWZWOcIDnGToexNuldQmyESw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8s+kU3R; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8s+kU3R"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ed82ee9e57so73447001cf.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768133002; x=1768737802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9H+/c4jC0sxEgufMt1aREJ19pV0dmr3Vzxdxi1WqWZ0=;
        b=P8s+kU3RFCJ7sZJaHIWgTA/f3XunPpmzLOAGRRuqvzPwwJyCjmFqcOUZNN3oIPj8j1
         XIZ3XHMVJN77ddk/xeEHm/DY+wUUoPOfbOLOUoH3HRbOv18kzMZ4yUMPBO/ORiQ6Z+Uh
         bUmGwlHk/PIlbfS8VnDD063Ag93zHec/ZbDT/0sMUBxYLMzsQEgE+op09ph2UNFCWzCo
         fSa2yeaR+sxNL4hxCLNYZt6sa4HL3m++lvqXVsd334E+H0R07YUP2dU5sr0B2eXH23NK
         I/c6fPYYGUrDaNkbATc8eU7IGAgZ4Mt4vjhqtNSLpvrAiNoqhQdlWabf0IcBo4EO+dJZ
         C4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768133002; x=1768737802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9H+/c4jC0sxEgufMt1aREJ19pV0dmr3Vzxdxi1WqWZ0=;
        b=O6G9nBRFEVcXCvW9k+CyNGNMYno9+SPHPG4uyn/rLgiwQt6sSkgkAUm1OPDLKFhnHv
         s4+wyAUbwEofjV9DO+USOlqdu2yAFZhZ0CRR46yaY8ArKWqTbtwGxmMq8LtB+N5VlbdA
         k6L+DvA88CmueHF/psLkmkBHTCumLMWVfNN0fRvHJrk9wMGD0Qyr79Yed3FIe+MHkc5p
         5VXua9FkYkE5hjr4ZaSM+7ckXcheqONaZpNtCMvk9fNvf8KzxnESGhmGgS3THpd7CrsF
         NjbqKFbblasJQ6Iv1OWGEzPU/iYTEZmKPYmPh1XdMSwFO3T5tBuVbuehxT1pVQa+zw7+
         VJlQ==
X-Gm-Message-State: AOJu0Yx5rAjpuCnkcyg3WKXVLrxXZMzKHSjyy6PMGpR0HW4DiaqUVcv5
	DaVkLTciKnUE6BF9Xge9iK2CQ5Ci/7lcvjSKFnsmpLsrta6tfTHkACwD
X-Gm-Gg: AY/fxX6MFZPxvVMSJQ3ZJ6nmr6UbdWziVjwXs7e0O9jjpK26IxYHImt8OIdi9UtrWoB
	uZqwVjYln19+TJN/puC0bwwqqiIY1eBHXOfuYfaH0MWnMGV3SQcQ6yawdleul6o6f4bPufG7Rwd
	s3GYN8hcOkdX5Re6TcFARPhN5jbEIfuKSJKkJ89CoEcv2AkY1xB7otYeN8iD1WbWglo90elQIxk
	R7VMfgr9gvdnZqdwDtGZxxjkZ9WPhWDKGT2sZpiooOlB8aiIsNQ94XsKR2BxBcax9y/zO2J4ojD
	yfqwio+qAQZAvo4/FHzM2FmshA/pFz0AWqwy12Ce4t/xU8RnOuX2GzE82RPXOFsi/xUa9UbPOyZ
	bdAHe6jjvqkvb6KPV+lhLTuFFBkga6obsXnQDQ4ZZ3rllOUFhl5G1eNU1+nPjJ7NuPaCtwkdFhi
	E29q5jgkuyBqk6TZgsPo3JjtmiQE5P+6eDxImTHXnZvjmqntIYlxX3C/Vf/DeKy4cUgL3j34Pea
	hEieK2QdvV6a2c=
X-Google-Smtp-Source: AGHT+IF7fx+nTJN8qH2KLMvXbLzjz1uNACaJ7vix4n+vNY0n2YDfz8LX3ClkI61OZN+HjQgjqVMeLw==
X-Received: by 2002:ac8:7fd6:0:b0:4ed:bad6:9fa9 with SMTP id d75a77b69052e-4ffb47f0f28mr215547961cf.6.1768133002360;
        Sun, 11 Jan 2026 04:03:22 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51bf8csm1275122485a.28.2026.01.11.04.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:21 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 62730F40068;
	Sun, 11 Jan 2026 07:03:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 11 Jan 2026 07:03:21 -0500
X-ME-Sender: <xms:iZFjaRvqKt49eueNMM5npOpmDTctzBoV9yKgqjNpa2VVjvwkND8pMQ>
    <xme:iZFjafo2_pFvcVlxmv3o6EqzCihbxTGlGM3gH4k0LBTFt-D0Qu7Ysw5DJOmIqz4m8
    XgWfDc9L0g0d8Q8Dg4uByIR6Y1N7kmZxME1zxiUbCUMsrfFvjKBZys>
X-ME-Received: <xmr:iZFjaYKMhCjcDMqxw2xUK_q7De86Os4r96_tVoz8mD1DYd0RiU_yEce->
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
    pedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:iZFjaXveojhd2TNqJ4Y6KK6xXgbfqX9Z-pSRLvw0Gp5kJKm1zRaCHg>
    <xmx:iZFjadDPGheY1WaMdRtZ3nHzOw2D5lUCtKl8WcZ9E8or4hYmmmJQrA>
    <xmx:iZFjaX7bvyExc2c7xEdc3A_KmMAkjsujfIVE0VdX4AiTlajspxVAQg>
    <xmx:iZFjadA5x5wuro5f2-bnzU2f1wNw3P4CfLk3sW7WnGGWpePX6gtGRw>
    <xmx:iZFjaV6SufGxmKsQ6ZZp_DLyvLpn6ZJYFCU6LxiCvdMHX1d8uzybUsaw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:20 -0500 (EST)
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
Subject: [PATCH 26/36] rust: completion: Add __rust_helper to helpers
Date: Sun, 11 Jan 2026 20:01:59 +0800
Message-ID: <20260111120209.6133-24-boqun.feng@gmail.com>
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
Link: https://patch.msgid.link/20260105-define-rust-helper-v2-5-51da5f454a67@google.com
---
 rust/helpers/completion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/completion.c b/rust/helpers/completion.c
index b2443262a2ae..0126767cc3be 100644
--- a/rust/helpers/completion.c
+++ b/rust/helpers/completion.c
@@ -2,7 +2,7 @@
 
 #include <linux/completion.h>
 
-void rust_helper_init_completion(struct completion *x)
+__rust_helper void rust_helper_init_completion(struct completion *x)
 {
 	init_completion(x);
 }
-- 
2.51.0

