Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470FB33C18C
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132984; cv=none; b=J94i7qWBQO2EWgBqNYlNocN+5cfd2wkMKASecJ7ke/aJlxHoMzzGALtq3IYHmzbjA6zkYeIN0JgsjUhnaRe3vLW0wkPPbiRJ5Aw5/3fwSIoKkzvVNBBltWiooUBgPTOS2o1t4X1jOjkzn1ONMVETqJvulZm6j4dlv86JnKp3pvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132984; c=relaxed/simple;
	bh=Kq1fMj6eVSQYWHZaozFzhTTjS85OKTGRooxcVJdYPx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qq8pJCHZtvMeF7pMORG4avzuesZPC2sSSpzt1q8osnIEGJxqZ4bO7uc8MlbIB+Zq7dXWkX9voGRL4JSSOkXTmJmcCmY7MpRMqLGixpuXKv/OIep8fiWiJUE5F32WzwPwg7ITAqAjiW9H+EtSYGAfn8BQjvCTUrgaAy1ttXjcBa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMNbLWOW; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMNbLWOW"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4f1ab2ea5c1so82089901cf.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132981; x=1768737781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yNFfPEAZIM2+3dm2rFI+JnI34sj1BqwBrey2RFIKPoU=;
        b=HMNbLWOWbobdXEkTAsoa9Cr5eYPi+0y0z+OIM/BO6Dhmix+eBc7JOa8a5KJnSMv5L2
         DmWTby5YHt1fJ2VpP5w85qNp2P/EOma12WeGdE1+ZFSGO/vYkmwPKHQCA2/0QZN9U81l
         kZ+3oko5qIe2cqxPhEmctFAdUBP8/NQhxszYxd8GgJU+cHalumo8R81PEzH+oryaal2X
         t7Z4pP5FC53XT+NmHXuBpELJq27ZvRZ8BfurRpGQyhEbOyQYck78UOO3sGqXPRc+UNSP
         5iXRv8zNJhIAh3sgEl0Q4Min+3u4exk++6Qo/i8+EjPeT5GN9jur6hwmR2Pdfsk5hNf3
         b+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132981; x=1768737781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yNFfPEAZIM2+3dm2rFI+JnI34sj1BqwBrey2RFIKPoU=;
        b=gFuIm1yxhtQKR8N4IMf7hFVIrYmeFc9Xqn736Cfg9ZSdxnBiUzoYtPCxa+NjPgAH0p
         poAr8aFtZc9SlSYiTQamNQ844qKLJAgY/fzHldizK1SBB0EPgpVXCr7C7ti8O1zUOFQH
         rV9jPvlBYdKDw3sbiw8ZedP1MMqr+Irb4FS58NAV5juvnhc9OObsTuNwbDYKlHaxEUnT
         FXn0Yo9fo2GyiZk7mIKFQhtGd01MBDKib+P2qeReV84OjJQScXoU7KukWQ10JkaAIG6G
         E1BUuDbFuBHqPkBPPmfbHDyhrksqTiiF7F0L+GBK+NsEaAy24j3e652hV405b/dF9hY2
         X0Bg==
X-Gm-Message-State: AOJu0YxwMmcHRK7iuJkoOzn/RVh4ODYbwC+P4EXa06G1ve4SZ/QXp/9Q
	fdAQblNm/d6VC+aiiwx47EaUh/ad3zFzx3tTYHWkgVQqJklhpehr/R4H
X-Gm-Gg: AY/fxX6n3SLBWuR/+/sf9xH58BhRwxfwv+ugJ0tX/FsRclbThBPLLdEV5k1n8FO7KPh
	UXJdc4jiMacN6HCQAKF+3kMLIgAmQPBP4F2Z1VYayzJsIY1f3/vdRs7wIf+SoF4ls5IFlWFgJX4
	GaaAFcYTRiSd1HfafXY/Fyg2QE6aKMpn5xOaYCPbiADB/P7Sl8Ij2ufu+MqJHP95FvPQ6UeeuWN
	9KDUxgxqJQd+NrsUbXf3QKE1I2CCQA2haBSKInRw2ehoAek9gQQLc3JKO7O2voOFcniRWI9Bn/8
	VQE7IrXgq4VaNMYMyRWAjEomVK41UrXJU7fc7y8xeBmkFoFC3iNZOLjXkfFkE7y0Clo9RJnzClu
	MHbnIoI8NJJgMFX/6m9zpCKyW6AhR2DBlPPbOB6Mpa1pWOCBtn7mwOl15DcE/uBtkQ5yZETPdB6
	d9ClWfuQYktS9w9eqTMM/MA8Bh0cqlSg88XDE5cCHXSXiXN5mrl0zLYUN9d0OlsovGyTJijdf1q
	N4kEvuRZnD3Bv0=
X-Google-Smtp-Source: AGHT+IHvlV6qqpuX7OMCjtZfMDtFyjW/4hg/hkajXbAw7UHTqNFKox4AznNxxWl7PCYJXmhfjscE7A==
X-Received: by 2002:a05:622a:199b:b0:4f0:2b7e:c5b6 with SMTP id d75a77b69052e-4ffb4a55808mr196502241cf.71.1768132980778;
        Sun, 11 Jan 2026 04:03:00 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cdfb0sm117019026d6.6.2026.01.11.04.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:00 -0800 (PST)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id DC1C6F40068;
	Sun, 11 Jan 2026 07:02:59 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 11 Jan 2026 07:02:59 -0500
X-ME-Sender: <xms:c5FjaWaxfm1YoHclVmTyvnQSX_7P6aQ6vYVui1NIgtrivOPrDki4jA>
    <xme:c5FjaQ_87Mbo57QfpXWdvMd1aSjjW4Y_Vw2k_YMMsWJQs89fLi7K3lRVUUvagLpOG
    cdAVpErGLkrWPG7nEqnjFkNHvLXjvzeZ1n5VJD0YjkMOFrKUktOaUc>
X-ME-Received: <xmr:c5FjaQnX2xdZbK8yJP9qWH57uDEit0cSbfewFgpWw3EpsC_cbfXs2F-c>
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
    peduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:c5FjaVYEzGk1gSbNV0qXS1a0CeSMu6qyR5Pnao-M9ldfM3CNRDnmtw>
    <xmx:c5FjaYOkXP8Zk9JLPlEiks3Z9oFote1osZCJQSaMM7fTC2w3S8vkbQ>
    <xmx:c5Fjadf7iRiafHbvqV8k3rm2MA8SWDKIK4GSqUtNngHKbLLWG-qSTQ>
    <xmx:c5FjaWGAM31Q-4IDD3OwB2wDhUl7g-l5SNFE9xQ2rJEJNJTWJPiJpQ>
    <xmx:c5FjaQsbF90oseVjOz29ZMBEDr05fZd9uXPoT4fDc16UNEZ-E7NHsLrb>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:59 -0500 (EST)
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
	Joel Fernandes <joelagnelf@nvidia.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 18/36] rust: sync: atomic: Add store_release/load_acquire tests
Date: Sun, 11 Jan 2026 20:01:51 +0800
Message-ID: <20260111120209.6133-16-boqun.feng@gmail.com>
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

Add minimum store_release/load_acquire tests.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251211113826.1299077-5-fujita.tomonori@gmail.com
---
 rust/kernel/sync/atomic/predefine.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 09b357be59b8..51e9df0cf56e 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -137,6 +137,16 @@ fn atomic_basic_tests() {
         });
     }
 
+    #[test]
+    fn atomic_acquire_release_tests() {
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
+            let x = Atomic::new(0);
+
+            x.store(v, Release);
+            assert_eq!(v, x.load(Acquire));
+        });
+    }
+
     #[test]
     fn atomic_xchg_tests() {
         for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
-- 
2.51.0

