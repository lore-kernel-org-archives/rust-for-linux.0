Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7022342500
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133007; cv=none; b=G8lYCNsHfPvEiK1GzNXHm3qU8RTnreN6VRLdgxbE0WNGJ4w6+wRpY/3XzmLgkbtx0xCW4C4/PsUniDUmCqTvM+rcloDLY5cjDdzv1anDVF7q/kMObBpyd5ZMb6+iFIoeUhCBQY3pwCb9sUfJH4t1jKfN93zE2V9xZccgPXRggww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133007; c=relaxed/simple;
	bh=kJKasEAFj84dR5wBMR7hAsb1gZPHMfMTle0IPRuSTBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrqYB2t6TmUvxtIIreiYCBfqBDh+w0i9ueyEETHAU16Bqhr/xbLfJY1ecw3oV+smRv7vI0lWnOG5F64r/TcNXJw+nQETWVAmlt7iNE7QQ//egM5Yip3DGEWZHCFb0tKPyTCXmzUlwqIeL/i/AzNkb92HH/v2TxbmERiuxRxlKVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXdI41uD; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXdI41uD"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c30365ac43so532312285a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768133005; x=1768737805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dm7kd5FD4vzwylJuPMYsuhhiFfKxe4Rck6c6NQoV/Ag=;
        b=mXdI41uDEgVRCW92TAruR7P6sBX2zFWzbY5U6wGXm5C3W+LYOkjqnKPoRQuFzIodU8
         r5pYAwLSNkWX5VFAi0NXV58apntCzo4ZSRUlMR3BXWLUIGEmbOdhSeCygXEPQQXuAoF8
         WyzYnt4IMladCk9/Yi/iLgD+hdI4/z+ARj76ACxr2rlJTea2KqKLhcI5yLAPRowVA0FG
         bx36afeRc7lX5PkkqBdBwub66c+dT1caeSTckaUCDrkjWaAn4a3G4lTJDdaIca013edJ
         c1B+3L23f5YeDrCpjmmbeBFg0u0rATCqtYqrYnDvV10Vtk+cmB+q7EKwA7Y5EaLjEDBu
         D8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768133005; x=1768737805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dm7kd5FD4vzwylJuPMYsuhhiFfKxe4Rck6c6NQoV/Ag=;
        b=iFyc24t+GMu6EiZktXe6Vbc08q3GZGIBgjLYeccNQRJ8ijlSjwR865dzi18Ouhgtw3
         zkVHeNRJh9xXsQOemjLMGozm04DXghQGHq6CImJ/dUrccoAXLxX/xf1zJXU99G1G8YOc
         cVCCYnMwUC7ReOob/Xs++uzKqZdPWJfNgE7DSE3vPpTLJuhgWqUI1pCKBVfgQNAVhEFh
         aolPbgqswFJ/SodA0SAb/1RDJ2admX5VtsmH7PFCtuJTLJZ3O2jh5ao2INJ7plmE5T1u
         bP2335uyZ6v9YFMOiEPIDg+MA2INuOEvKm1eB+QlklFUSqxrv620RJ+U+3bxb+FQwyce
         tYSA==
X-Gm-Message-State: AOJu0YxIjyNp0Ktb5PKXvQcllsnemoyYSOAw/O4m7iRVAvbSGSituxdC
	/M/mWL7Yv/6mQJ7isJmBQU6AWDjOnNW4gE52GiORxCquRTrOUXeoC/T9
X-Gm-Gg: AY/fxX6coyIrqpTUxNQnyMIVytmMIUYhTxad/BX7SeiFNUJeKu8ngTPTAETzLOs5Uhr
	HZKUuiKhEZfeDeXZCRs5ir5X8KYkFBwLrBbQhC/Ci4rUtsuV6UjbS5spP+6qyIEZBRX/5Fk4Bl3
	alvoBhwkUoJ9oOXsnobWw/i/XPQoGG43HrO9+sC8XwpVHsQnhrdC+RMMoZRgWEEDhIK+wc7RGgJ
	EIsb8XA0xDbWSKi8EhyQeYhKWvT3n9FWfKaLdwp1Ser6cCFXOCW/OmnzLEWGXL/2C/p8PqMZRJf
	u6RB3/8kSGKASPz5wfJxfIP8Tcm2TM0RxIjnMe4SEvghSf5pgyWCS4UkMIZXPloCEl05JRtAMcJ
	wa2ydU165qQzFERCLgimF5oRTtLVL29F9EAo2kshGf8yczh1aCajUEjTdx6bbkAkyyAAKuED3+h
	kSOA09/YlykMBnuPNf6C3hPZDUracAvynO/3A7XHY+Oil04AP2R5QtGoEVm6cL8lwCi3CtrWHZw
	zZVM94ouknB5EUWc8YCEq9/lw==
X-Google-Smtp-Source: AGHT+IGHoczuufjq42hPjBR0bm6/EhDrRhK1Zh7AAOHXeCXwUqoUIh3H/iZAQo/xe0F6qI2LQg7g/w==
X-Received: by 2002:a05:620a:480c:b0:8bb:ac44:bd58 with SMTP id af79cd13be357-8c38937183cmr1946656385a.13.1768133004736;
        Sun, 11 Jan 2026 04:03:24 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6b4fsm1276058585a.2.2026.01.11.04.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:24 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id CFAABF40068;
	Sun, 11 Jan 2026 07:03:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 11 Jan 2026 07:03:23 -0500
X-ME-Sender: <xms:i5FjaclS8Cef4DvEZ0Fyyvu51W5jWdnf-T3Bs67EQZoawyoKX1dy9Q>
    <xme:i5FjaRAdgLtNdzpA_UqVrG8pipstq7N_xrFf7sLT4AG0rPc8d6hiAnEp3XHTyyLV-
    Qy6ywU4V0bbDk1InGp1vNNZwvK5cDfwxA8FQPGKxW9hAaSk8ZuvbQ>
X-ME-Received: <xmr:i5FjaeBH07nbuiPUiNGGLn0H4WIKb8puYutVibroMGM4GReDsKGSsTIo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepge
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
X-ME-Proxy: <xmx:i5FjaYEZJxJXFcGP2I_ZycsfK9okkL09hB1La2FRLQq7tCIbxlQWfw>
    <xmx:i5FjaV5V9x6Eip9P7o8Ax5tsibde8_0XQ8MyScGvMdp-Nh4ZZafJXQ>
    <xmx:i5FjafRMit3QOHGtittmPB83NJas2w8aH0G-pzLZq1VAEc9sryucFw>
    <xmx:i5FjaQ6NsWDFsewAnSPxCdNK74_THT7wUUQXFkmfmmuMLa3ZDXl6CA>
    <xmx:i5FjacS3cGS31QLKjnmVZp0vgDGgJ6alYQo99IvQSVlCO5hThpeY6hlY>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:23 -0500 (EST)
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
Subject: [PATCH 27/36] rust: cpu: Add __rust_helper to helpers
Date: Sun, 11 Jan 2026 20:02:00 +0800
Message-ID: <20260111120209.6133-25-boqun.feng@gmail.com>
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
Link: https://patch.msgid.link/20260105-define-rust-helper-v2-6-51da5f454a67@google.com
---
 rust/helpers/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/cpu.c b/rust/helpers/cpu.c
index 824e0adb19d4..5759349b2c88 100644
--- a/rust/helpers/cpu.c
+++ b/rust/helpers/cpu.c
@@ -2,7 +2,7 @@
 
 #include <linux/smp.h>
 
-unsigned int rust_helper_raw_smp_processor_id(void)
+__rust_helper unsigned int rust_helper_raw_smp_processor_id(void)
 {
 	return raw_smp_processor_id();
 }
-- 
2.51.0

