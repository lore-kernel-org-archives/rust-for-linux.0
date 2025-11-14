Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8D02D2491
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 06:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763100131; cv=none; b=JaBadUk3URZLr50kn7RN0ipvOVjRox7itASlvNwXXwR4tlyAzZ7RHX4lBmKHlnRmjfTLqM/5wYmtAN70s76QdnLgWjDGIct/LB0jrCdGsbydwkjwnFVK35n3Aq4YZOnv+KzfH5Odm0RUKejM5NfZVt30ky3WZY7htvGtDLkMoB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763100131; c=relaxed/simple;
	bh=iZ4cPmYA2+8V5qcGQjfx9Po9PCA1wLtfbp/OFY1PDx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sBLHxtkUQkmTDcpCBFRGuQkC4pHldQjzVHzK6MG7JLdmihTkTXV8ZTnyJ1iKH4VuMFV7wtGn/tGCtZ/qoj3Qf9KjS/H18HxFJosioniFzW9s4EuNtLz2F77QlefmYMZNJYiERlKw/r2D7GTjdI2jEIEkeoFH4/yrfKnyN4qonxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loVkSTLp; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loVkSTLp"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88246676008so19518996d6.3
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 22:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763100128; x=1763704928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4BP2B1SN7gVt1S3llOP1WdFk5pHpVnzOC6VjnnmKhCs=;
        b=loVkSTLpZpiV9Ofw5c141ML14oEAvRHOU5qZbb2PGyiZq5Nm5S7uDEVqcWQVyKnatM
         SLu3PjqwmksSzToy5P8OTfMP1fvjsQXoxvOIX036gSKvWSmqADsBbsjOO5353J9gOye4
         YsRFH7Rb3CLIjBU8YSjlOPL9pUMstBjwuZpNfFJz8ZQ8dc17LHT2yF98RIlFAtzgy/d8
         0qM1ICcdB5XyINi/f+b9ErhUqzm9OOwh0ZoZkOa6+pNXhcGB5oh4NMoUVN8XS0cMxEnY
         7ypkhbIpL32aPdGDKZ/vbf+xb5ql99e42gI7rEx3mPFTP9I8iUgOX2yQSqoSIaGO1Zi3
         rq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763100128; x=1763704928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4BP2B1SN7gVt1S3llOP1WdFk5pHpVnzOC6VjnnmKhCs=;
        b=pT+wzD49q6wQgZqNoaOvmZcGWB0RqWYgOxc+ssPjuEdB89Z/vDF3HHjEJDiAhaxaQS
         vca58vx0QyEs3jrjsUjazN7DkcGlisjOX7jeoiJ12uNOb1VGXwgDrE8KI9CCJBrL3u4n
         R9dKe22VokkoBEqxZEhY3H4Sq8T/STGn7lqAQUnMnuv032830tgrO2JskWP9t3JogOr8
         Mf7tsfpFWf3t0KmS5MSZBcAaZOuwjihMdyR+lyQQ1r3tA3LcSWS9lAkYLZulBS4QDaTx
         FZvF8oaYi31bel7bnKq51qflZGw1Ck+Hs98nU6GdoufyEFDJC0WMmB+VWTSbFO3ilDvN
         EnyA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7ahbpkinakVwKHb8vqrQv6BnLPLl5IiRBZGPzpyNroyyhm+Dixxja5HIyZYSCepFyzfTj/IhmkxLRISE4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1P1ZcrnZX5KgIyTEYUg5nY55m4093AfafThad+IVoqfxsxpLd
	njFRrHgKhCSFS7QzjPDun/3dM1ld2L3mtcUGQoHO65ZDkc33uMKw/Afp
X-Gm-Gg: ASbGncu4ktHG59i5xydvdE0HTcUNJsiGYh6U0XESVuU6jmqre5FiTM3EGbkBBrrEcDT
	lhrEbX7/Ql5gflKWzbqTMol2Ez/+4xK1jKbeog595XK0KrTOrFM2+qX1jEQyukr0vJLMs1mywL+
	yU4PPMsQj/sXZEatp4YSiQ1RQwuIbGN+psMO9/VofQ/SmBFjPd9ii55rDeF1u8ZZoPMKyQ5AxTU
	DZJQG27fpOX9zP5c/0/Zy4yxu287lYF8oldt4S5uU7lNIgaq2MBEZP/e1UyIbH/PQ3D7xordCxr
	1TT08R3s8/YMwvQRq7dMd77TsAvkJit4xU2/zaGpg7fPQbbULCYBdVrCp0WwVQBCf6gkdbRrT6H
	r6O7XMzvf09VT5HQ8uTypwXZVcVdsY09/PFx26yxl+yalMMskrj4bQTvqfsaRJWk0Yjsp4bhLA5
	SsJjbmSbiZUKrbv73MAkowXE+5I+eic3TKcaCvETD3yph4Abl9bywyV/XMT2XChiqtSZhZHWgKR
	3LqIMu4YQBH1oe0XPBE660AvA==
X-Google-Smtp-Source: AGHT+IGDS18z19yWXEX3Hi/VSyJpMEaEnoKNUfZIqDgc7fC0EfHmhSV00zlkDby0gyAHCi5M9RVoaQ==
X-Received: by 2002:a05:6214:21c7:b0:880:854:908f with SMTP id 6a1803df08f44-8829267c529mr26495416d6.38.1763100127825;
        Thu, 13 Nov 2025 22:02:07 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aecd1709sm276717185a.0.2025.11.13.22.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 22:02:07 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id CBCF4F4007E;
	Fri, 14 Nov 2025 01:02:06 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 14 Nov 2025 01:02:06 -0500
X-ME-Sender: <xms:3sUWaeHWQyIpu6qQBk6PlVSz6IGJYGVxtnHBEq69UyatVN1gg5OPZw>
    <xme:3sUWaenbEuRL9UT0uFAWkbsd1ZUQOJt7Nt_ADu87Py5PXPwfujeniCgBdg4BjEoz9
    FqwQFL-AFTXhU5oi7AU0JOwwRrHUQ9fbwgtVRxk4OwM0eiRsCv_2Q>
X-ME-Received: <xmr:3sUWaa_sxfAIznHwXESClzBiC1oJXggoGMvgvxwAN4XJUdM_QVBW38YQQsNeRw19XL9ZNue4xJ6wAWI96gr11OjGW3akbuek>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdeltdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhnghhmrg
    hnsehrvgguhhgrthdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhu
    nhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgv
    uggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmh
    grihhlrdgtohhm
X-ME-Proxy: <xmx:3sUWafnXEMdi1d3mk1eyBClbDnYuUV5exjBCmh35TwVJLD_zmryGKA>
    <xmx:3sUWaYnzDR-LGJMPVkZaK7f1ArOESZJaKGw-3RL1nkp22-yCokEI_w>
    <xmx:3sUWaTsWDe436i1QadmDO_VJm5xrt-SQFwfhhS97rCAPluwpbI4H1Q>
    <xmx:3sUWaSJgA895_fgSa1v9DeZ2xqgUARY5UsVk1olf8aD4x7Qo422VZQ>
    <xmx:3sUWaYhkmZtrwzRBQKLRgOyUu-ZjiHjev8DN1I-tMqy8AxIFKcLHH1LJ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Nov 2025 01:02:06 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: "Will Deacon" <will@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	reg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	David Gow <davidgow@google.com>
Subject: [PATCH 2/4] rust: sync: atomic: Implement Debug for Atomic<Debug>
Date: Thu, 13 Nov 2025 22:01:58 -0800
Message-ID: <20251114060200.12982-3-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251114060200.12982-1-boqun.feng@gmail.com>
References: <20251114060200.12982-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If `Atomic<T>` is `Debug` then it's a `debugfs::Writer`, therefore make
it so since 1) debugfs needs to support `Atomic<T>` and 2) it's rather
trivial to implement `Debug` for `Atomic<Debug>`.

Tested-by: David Gow <davidgow@google.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251022035324.70785-3-boqun.feng@gmail.com
---
 rust/kernel/sync/atomic.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 0bc6e7b04d67..3afc376be42d 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -307,6 +307,15 @@ pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
     }
 }
 
+impl<T: AtomicType + core::fmt::Debug> core::fmt::Debug for Atomic<T>
+where
+    T::Repr: AtomicBasicOps,
+{
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        core::fmt::Debug::fmt(&self.load(Relaxed), f)
+    }
+}
+
 impl<T: AtomicType> Atomic<T>
 where
     T::Repr: AtomicExchangeOps,
-- 
2.50.1 (Apple Git-155)

