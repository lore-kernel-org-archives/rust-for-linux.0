Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1478E340A4D
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133002; cv=none; b=HzpCz/d67eFG2RW2FQfStQ2Uo7vC0QdTBz3olgL8Kt9DR0BU2Wk+Xeel1ieMY522/oxT+NaHVpwFOyUUR96zGHLx2MeUmqp8r8AVUn+VsBeCU4yKVkLy7B4omWysLMv5z+ubFrmV446kLaPFXbqfiiDZLzUHZQYGLkU38r3fTGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133002; c=relaxed/simple;
	bh=M80jBmKkPYqUSjoR+QDu7SaFJqkV2R3CXZEi2mLcB/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptmWjeMnC2m0k+rXwORKSf58X6xfUUN0WC1SWA6vzlrmbqWlhWvVrcFwxYXAnHY9MEPRzXQFJ125ptG978IRUVRxdEcyX+ioZ8XlyvjQLEe1zOCORizHSjHihHQu3xDydFo2WzeyXwkMdEjVO5PDJWY7N5THrjRMfxDyGpmXThk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BggDEv1u; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BggDEv1u"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88888c41a13so72393556d6.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132997; x=1768737797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tWg5kPBwQFfG0TfyxE5KXjxOz01l6aNNTXMt/N+w1Z4=;
        b=BggDEv1uRVJZPkgY4o0esN+burGe3hZfrQFG9pflnBujR/A7w1v5aW4Dzo2dazEGBN
         2UXIZrQP/cEUCovZTRZvAeGrRJjiUJ6i/KA1dM1KUikR1WoGDK91XvLC8M4DQ66rHK3b
         imALU7u0Tylc8yUNRGUox0FebeDz9ECCMlyRtdyTieWQJfiGb434mTntq+R8yZEuv0/S
         H0w1ZmQAzOzLcCU5lcSIvzYUWUDZPkGiRpRgPvNdl9D+cY8VDUn7eD1tONXvzOypeNF2
         SrPy1v5mT4AY2gZqpQPJ8ZtpwuFJzbDbKNfU5pq6JjY2lc+6tK5ckK033R7A4BG9SO1h
         PciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132997; x=1768737797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tWg5kPBwQFfG0TfyxE5KXjxOz01l6aNNTXMt/N+w1Z4=;
        b=uxvyGJSdWpE4Dp6w3lJLF83On8GN/dcUtf4btnI0whzl9Xo9sR/gk4A92dgVfMusC3
         gnDZ0+PFO3hfY+9V7VCoM4P/QVhZ8+2mxgST0aC4dTvcL1+HrjMsbdsjDLjbC8wixhJX
         kmEbWYdv2EsDW0Y0RmWW+yjeYy5YGxHad0dfm5v30mOuCBp8ooqND3+xK/jNW3V8rPki
         AvAIccTjJLMweKEKvGpVNhcVvW9WhEKBiLF6G78ni40tgnJCCx/DOhr/ElST+9ns3Rei
         gDy1z67OgwTQLCC1i6Gm6VtXum3KaI4tXYhstCmqX5SCCEbYKjF3G/stVpKbeOquB4X/
         gD+Q==
X-Gm-Message-State: AOJu0YwhWHSN0Joe2yRLboWPnlMrvWoCURiLRDgZMk7jecbLXOt27yFO
	m9r+xVcYmegWETeBwO8UEanK2NrpUwOT8lSlEcUlnireT+16K61fD5iQ
X-Gm-Gg: AY/fxX4Z654/EVdFgTyUkzC0drtZgZQoJZ+CHRO3fFpXRyjtNDno1qofG2UefxzPPZi
	MFrnn1on4h7bACx0QcW54q8WMCxEMm4vk7GX8tn9AizRmYHcJ7Oh4OtUumuBl2HnCHKpI/X/Fu9
	s3NMfxHcLaTM1++uLB8veys3LEfj5FGYhzeiSg3eZUmeNV7Aq373SVYjeqlcFYIRTB9OrOZ3hS3
	JSmcZvA5Htg7b+1vSoCqudONILmi9gDTP6cLufxMvQPShoT+Vg/4guSRiXrUaGS63RGMiOkqDg5
	Juw9FPqowcqWu6SddD8BQI0zDZw7gb4h3/AjxavBN38NkywzoI3D1OPbSUelOjzSF4yM+hdIszt
	IPQd85tEGZm35ZsAip74eaHpXzYcxDqUKrhojayRHXQiE1P92O5Tvx5wE9wkFgd9gM5YPSNDZXk
	tcFxLgFwDAj5SfcwRjJ1bwrPaL6vjf/OvPxtUj9pxvvgX3eZBTfd+1qKXKFALCKr6QJZvl3vYca
	Lc38zA1Gsyf5fU=
X-Google-Smtp-Source: AGHT+IF+iJvhsk7oCm6krIVtMzNskYmh8J6KKa5eliufpm0oJCYETo1f6F0kPTfxUjzasSzv0uvaIw==
X-Received: by 2002:a05:6214:4a8e:b0:890:7fc7:8839 with SMTP id 6a1803df08f44-890841cb8f9mr210015336d6.25.1768132996927;
        Sun, 11 Jan 2026 04:03:16 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cdfb0sm117022396d6.6.2026.01.11.04.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:16 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1300DF40068;
	Sun, 11 Jan 2026 07:03:16 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 11 Jan 2026 07:03:16 -0500
X-ME-Sender: <xms:hJFjadfLh19_LwjDLc1XuO1GfP2hA8d1013kd_Mo_bOXNJgCvOD-Sg>
    <xme:hJFjaQY8qTrxPpMDj6Jequ_FockTY4-FJsLp607CcLq2ykAveaHL_PQV6Fyh9e7XC
    3FQP2D4-ExOeGBB2W3ke8C0uQTJQs1bxEVeul1bWdstrg-nHij8Mg>
X-ME-Received: <xmr:hJFjaZ567q6J9rjrTPM9OQwVsu8snMJ7BC6xbJmy2P1UjsOg6kx-K-5->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepfe
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
X-ME-Proxy: <xmx:hJFjaWdoemnEmW9f_1GIQHrhxbjWvcL2Ve3XpI_cQ7R3p_b1vUdT9w>
    <xmx:hJFjaUyRWlZeaw0qQd8v0W05x0qupnSX5Gr1JZgFGXsx0GIHjG8BrQ>
    <xmx:hJFjaUqlCj5xst0Ap3cIKox-CgXLr4ON1vcGWlM23exWTrW_mRwHdQ>
    <xmx:hJFjaaxt_MmR1ajtbVEso8xS-b7oSgvM04YANEWmzuMyH0hUNBuJkg>
    <xmx:hJFjaQpPyJRs5ir1VcEADwO6LH2jhi8LbHArCJDTnzI1beymUD_K0nG8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:15 -0500 (EST)
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
Subject: [PATCH 24/36] rust: barrier: Add __rust_helper to helpers
Date: Sun, 11 Jan 2026 20:01:57 +0800
Message-ID: <20260111120209.6133-22-boqun.feng@gmail.com>
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
Link: https://patch.msgid.link/20260105-define-rust-helper-v2-1-51da5f454a67@google.com
---
 rust/helpers/barrier.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c
index cdf28ce8e511..fed8853745c8 100644
--- a/rust/helpers/barrier.c
+++ b/rust/helpers/barrier.c
@@ -2,17 +2,17 @@
 
 #include <asm/barrier.h>
 
-void rust_helper_smp_mb(void)
+__rust_helper void rust_helper_smp_mb(void)
 {
 	smp_mb();
 }
 
-void rust_helper_smp_wmb(void)
+__rust_helper void rust_helper_smp_wmb(void)
 {
 	smp_wmb();
 }
 
-void rust_helper_smp_rmb(void)
+__rust_helper void rust_helper_smp_rmb(void)
 {
 	smp_rmb();
 }
-- 
2.51.0

