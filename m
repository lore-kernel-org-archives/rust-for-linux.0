Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D12F33F363
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132988; cv=none; b=RMAO8I/ho6RFUMm5Nau+y3Jbay8h7Q5O//uNoU1cKDVthHeiKXwbVhA59IwRjBBap44kx8BhIb4bVgEOWAXOWrd6p3edsHa4MFC4GWcDbECdSHfmWEX9xE/At81TIuqa7+6ieu+OaxaDe8ypPjVEcLdX1cqcu9Jc25VcdzaEuGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132988; c=relaxed/simple;
	bh=0EiOCad/0iahZFXGit6viqNibJ8cZwA7aNvJK+JqCvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mngv2YKydcc90NTPa6Y1a+iq3SBlQqRQloc1En0eQqLA8z7E5uQ0dtmK6Ws/Ei5JmHsHRb0dSk0cPJfd6Hp9lFDkiW0GH651+LLlfpjGGyRji1JMkvxspqRwMhWgCmEs39C8iTP4p6T0lc3ekuR/eHzefFQSjPu1ehtpW5GnACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mV+QNWC6; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV+QNWC6"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8ba0d6c68a8so653048785a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132986; x=1768737786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9SQRus9N1l0oW/BlsGyuY8NlkMtk38CZlHP1cvkuZa4=;
        b=mV+QNWC6NF210P///h9YoX86o1haIfaxjW3s+PD8wgKNoAkcKZZ7FORcwNbNuX+eNy
         KU3mRKcT5sAn0IrRIDrxxnEbfnfnbADZeIB/t6U/n47+HrK9OB77h0Q0B7i8+F2ksKKK
         5WfEzJAHnBzMC3uOGVlZJOT8PaR8gqaqO8EfMEDAmu3/ws25BvtzIfCFhBVfGtx59eWD
         Z3EXso6Z1PzktMIHedXZpewHqEQzvfzZEIHikhoX3iwkK5xMnbq437/cSUL5FLsLH+wC
         0sbiBSPf3bEYUKgat0ffn0CHCqjpvdqmfTuPkHot4NUP20mypa+B/S4BJLcxnUqIctM9
         1NGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132986; x=1768737786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SQRus9N1l0oW/BlsGyuY8NlkMtk38CZlHP1cvkuZa4=;
        b=vo3z+IItaYGIyJiWpIhza80KEwHuf4mdrC+R85kGUZ2s2qUmBNu8qs81DkMDN5LCPl
         eVubQnp+Ovhfuycf9axiLC3zGaLnHFBd3cc1jeOazKB2weGHO6HTaQx3Vfjpc/GipIWT
         bcRRBqdARrVup3BDYpIYMA5FUeUMvdPjX3vyn6/lSTl3rnSl1Nry5sezCO/EcI7iSkMd
         fg8ZYICD4fuh6HL8KZd+6utdGvOW+ZkwrOfbMZb+jq1lrT7JVkGbIUyDCVYFB2yQDFv4
         p9boVs/H+1nrDhMqHWsqsZKoUh7gX0VUpA5X26VMeu/ZUOBWqK6hlS6DrtrNaADD8nkV
         Pk5Q==
X-Gm-Message-State: AOJu0YzkFW9N/b7cnryymI8TVVyLDMSre4brE49jHTobO/RqC5yg5QdP
	kMdC1+RV0quSswolSfwsK4sywseorkOGfSGaon8LKXasV1dMWf1zb00K
X-Gm-Gg: AY/fxX5eERvHuurbF7nAQDuMEx597+cpZukhUEaD0e2TEjJJOtxTJ8l3wprHFI+AAnI
	flZJJYOyxy2B9UmCV4umiF1/tTD9ATv0Kx1+JgGBaKI5S12Erbcpi5jQYELDeXY02JP9lMQFBCD
	8uPUs80bhw0mguGM2VtVE8sECKEKJlJ8ComBmF5IdVoMhocj/7SpuUUPRNnaW9K6Nx8VA6gGmhy
	bhox8sujNBJfFakWa7a3a+/gGzEePyYeoOIXqdAIVq4QkcVtCzcaNIxMszPUdnlym40tL0k5CEa
	9txakswvndeLlAAqCi+SElJlW8qdwKJnZLtc3MLO9Ceqccj1HbYB6/vumDlRK6V1aPJtmrQIQom
	cXETG613XN0GqoYC7UASe7MixTsQ64xsKNf6Qao+Xuij49Szc+BatmXeqXguq/Sh6tz6olMVrIn
	5wY9PleEE3nUNOnRrBuppKWVr2mCJrprgeWO7YymcBeg64rj50NPZwmJhIUD0PZljGheeXLwvGY
	vSg0y7QjRrhTKg=
X-Google-Smtp-Source: AGHT+IHYjlfZKHNU/myT685ElnK3JaqQ/8BKEX6HmUbVaxkdS9niIT1tXnyhq8UzFKoHNHOrrVWgeA==
X-Received: by 2002:a05:622a:2c3:b0:4ec:f56c:afa5 with SMTP id d75a77b69052e-4ffb4825cbbmr224410431cf.22.1768132986188;
        Sun, 11 Jan 2026 04:03:06 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907710632asm115216876d6.24.2026.01.11.04.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:05 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 591BDF40068;
	Sun, 11 Jan 2026 07:03:05 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 11 Jan 2026 07:03:05 -0500
X-ME-Sender: <xms:eZFjaZh38q_N-WJss10OoSwfOPIZd5IO1UCtEwOnrTJbsWS6Dh61dw>
    <xme:eZFjaYaQBFkrvpk7Spv5xfyAf5mvq45lVG9DK5dwakiaOdPrpkYa2YdowMq06YhnR
    guBEWzet8oTGUZ6qBdlkMOQJ3HpyqxvtFo8-PNEhlPoOlmzh3Ue>
X-ME-Received: <xmr:eZFjafOMGB10oZulKDsPeJYXSZ1UNhEyCtlGqIA7KEFGN79RkGUdur4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudegheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejgeeitefgtdeuieefudefhefhhfdtvdejhedvveduvdehgeehuefhgfeiteff
    vdenucffohhmrghinheprhhushhtqdhlrghnghdrohhrghdpmhhsghhiugdrlhhinhhkne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhg
    oheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgt
    phhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehojhgvug
    grsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgv
    th
X-ME-Proxy: <xmx:eZFjaZZ5gTfpF6BYZ3bY1DKkxnot6vOIYp38gynskeDzGGNWgbfjrw>
    <xmx:eZFjafWN0LPNP9Lm8DZCe1UImVQ9obvBVrs1DKXTkP2xaCAUFckHBQ>
    <xmx:eZFjaYAC3XbqrWabeU5IWsrp8SclJnEHO7yhApp9M-Jbo5vc-eF2Xw>
    <xmx:eZFjabKAPNtXsuUhcmBpeuGpfDXWg-4zvQaAMdwWn9hMIVncwNl32w>
    <xmx:eZFjaWuHDAuyPjUDisBmwtlRkIKAgTn2fAN9CBpAulDiQq2Ui3_qq5eV>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:04 -0500 (EST)
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
Subject: [PATCH 20/36] rust: sync: atomic: Add atomic bool support via i8 representation
Date: Sun, 11 Jan 2026 20:01:53 +0800
Message-ID: <20260111120209.6133-18-boqun.feng@gmail.com>
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

Add `bool` support, `Atomic<bool>` by using `i8` as its underlying
representation.

Rust specifies that `bool` has size 1 and alignment 1 [1], so it
matches `i8` on layout; keep `static_assert!()` checks to enforce this
assumption at build time.

[boqun: Remove the unnecessary impl AtomicImpl for bool]

Link: https://doc.rust-lang.org/reference/types/boolean.html [1]
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260101034922.2020334-2-fujita.tomonori@gmail.com
---
 rust/kernel/sync/atomic/predefine.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 248d26555ccf..3fc99174b086 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -5,6 +5,17 @@
 use crate::static_assert;
 use core::mem::{align_of, size_of};
 
+// Ensure size and alignment requirements are checked.
+static_assert!(size_of::<bool>() == size_of::<i8>());
+static_assert!(align_of::<bool>() == align_of::<i8>());
+
+// SAFETY: `bool` has the same size and alignment as `i8`, and Rust guarantees that `bool` has
+// only two valid bit patterns: 0 (false) and 1 (true). Those are valid `i8` values, so `bool` is
+// round-trip transmutable to `i8`.
+unsafe impl super::AtomicType for bool {
+    type Repr = i8;
+}
+
 // SAFETY: `i8` has the same size and alignment with itself, and is round-trip transmutable to
 // itself.
 unsafe impl super::AtomicType for i8 {
-- 
2.51.0

