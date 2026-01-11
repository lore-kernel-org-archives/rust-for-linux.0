Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E92AD20
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132980; cv=none; b=smz9YXNQLAph7wIxrIxENJdmPQxEfSV3Ks0Q9CqS2AYhSXsu8b2qxEOc/SchJ+1/CCr1tqPqXrcLeOItOn98cjWXspsrCFq69euoXxMs66ybfjlmgpiobqDFjwvvS27WaNfUi/8Cfr+1ExDsAdjUiAOfHUlqrB+63oDgheyGhCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132980; c=relaxed/simple;
	bh=fhzedC7uJM5Ld8NwmRGVWumGET+uWyNdd6a9QqCsqNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YmmHGG0ew/NCWCQ94VNm6NCKDNshP1YEM2YgHBDG4zzvplURK02v4Z5w4oDOdv+9RodV8XASLqEfhgNPoyDOezh8FVysG/DJhLyD9Yky106DqFO3UDHNA1atnyX7LVp247m+yhjRqUffLW7mCY+NRNzojDcCZqcykOlYJFgljrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5648ama; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5648ama"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b2ea2b9631so645544985a.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132977; x=1768737777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4gZtYE9fw1Aa4B5A549wNrRO7BPPn1Rw+0fhpLFE5RI=;
        b=Z5648amaqyCdtgNPGUICPgTgD8PXHODpemqM4q6PA9EYyAlV2Xq3hZkXBfAhiIYqb1
         ydkfEd6atbOk6/miKOSyz1xsf+mlxk+8oJ2AFNE9oFrd/V1Ag90dNlkV+nxwNPbanj9m
         cO/PILlrc+qa2l2hcOd88UoGKWa6fCy8urc5rPXLOKRLpJ32Yev2iLI3bMHtYcglyeHC
         SAFEnNb2Wz3piCuU0J4sDpf8gCmxSATUEGCYfpeURso8yXCuy777enfT3LKzIHqEcXiZ
         WyDOaWjAoStO3IO+A0ZivFWbpOEVOMH6DZGczUHy+MrK01gNjGNIoCF5ywrJgnInNNw1
         Wtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132977; x=1768737777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gZtYE9fw1Aa4B5A549wNrRO7BPPn1Rw+0fhpLFE5RI=;
        b=AX4+Yp8qgYL1gU8IJm1g8UCYqLIiV4ki6P0x/YTbg7fUoBxFTmy9AT7ntGBOB5dBZE
         Z5LRdzYfvIrrZb0xeBIL/VO4ICEv5CdVOLWIyWhXAyS9AgDRwyFRBgdjass2YUU8Acag
         JXRzvsIniWF9xmVxj8CXib2qAlbNqbMvUtdP8oxstKjqCDMshBgCm51KBr4iM16P5ycU
         C4ij40yYMQ38bPie0JFqAjQTmxjvtZ1mFJqr5f1kxBQ3v71OXJqHuRW8kQr7h5DQkkSX
         1QRKMD6SuKp9ton50+YYKMUtDdt8MdWT0P4d/J+mia23m0lt40hL/XmEvB03A1DJF+cM
         k1qw==
X-Gm-Message-State: AOJu0YwbzCUcRfFAA5GrfRVNDKf/QEKoCa/Pn8Dtg58qUa+d5VPndflO
	mPokON6CKxvDIDGsjLMsKwKYIJWFc97kW7+hJ/4SCRv6XbCzMF37s4Pa
X-Gm-Gg: AY/fxX4nnH6jYT0mov/8EJnRwNTU/8e/GYkCJqIikpP9TxkVFEhEQhVefCASwt1vVSA
	8nwyethueQyJWz24DPdZf36xj7EzI2/mhO1VANIDzJbHdJGft6UHRZqAHDxOMbWd0GgX93ZcWR9
	fUxBRvI2yIK53Y8h1Scw6fk9dK4v5QIZj14R75yaHdqD+8Zaoa4F29CRB5A8L+tfLEqAAeKm13G
	ZqWVBIognmcUwKANwVxKQK6ulIbdyUJoVfhGQ6Cm80xN29TNGJBTogIOCW8ZzXBPvrxYMMWGxGp
	5icokkS66svvY6JG+OcQfEPOE15rc7boznuF5zUOwM7zTrcNax9LZ7qPxmLp8LpaodW8QF5snYs
	sKdtPy0fah4uVHFYncDmK3zyFtJOqpQAb9e79Drx1D4IKRbn5nqQNcIljUMRC8nWEbUhK83OZ8/
	l3GPxatOFDWm/LvNcCR2vTtt3kBtuzqknCxFQCOje4L1roKTPpvw4NNf4j79NvpssAAkTLGQfxz
	ixqc1B0+J0AadM=
X-Google-Smtp-Source: AGHT+IE6eGnDXi9hvHQ3FNQJ2WT8qEGJnOixWf9kI1lFue/5Wo/GQRdASNbZBm+cv8Np5pWGRhsbPQ==
X-Received: by 2002:a05:620a:711c:b0:8c0:cca6:8522 with SMTP id af79cd13be357-8c38939ce29mr2095022485a.37.1768132976926;
        Sun, 11 Jan 2026 04:02:56 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f5433b9sm1275881185a.49.2026.01.11.04.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:56 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7212FF40068;
	Sun, 11 Jan 2026 07:02:54 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sun, 11 Jan 2026 07:02:54 -0500
X-ME-Sender: <xms:bpFjaelrQ7SE7fpMoDOq3PZIpbgfmpLQUntR8icnY4nMd89SssXW_g>
    <xme:bpFjadYXBjOofPKloYFYWy7QpJUYXjnFdZ5MFq521oLHp3e03C0gVMW8KyLD3Lpre
    a1wRl8bfbVBwY8ex6BBQDkbCgpkzm_1V-SA572DOhd40PeNLcdL>
X-ME-Received: <xmr:bpFjacR09doV5bOIWond0FRJoWt4cEIpcLVv69qyOjmqEszSI7GviDL_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudegheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptd
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
X-ME-Proxy: <xmx:bpFjafUuzhGqqpA4DxTZsa-XLEzAZXgeYHz_-s31pTkmKmMd0NMlGA>
    <xmx:bpFjaTakJ6eXuTs4JP9119rPwv3G2fPPwFyvFK8_8b74wwHeFMADDw>
    <xmx:bpFjaQ6tt9433EWESLk8r_18oRnFN5ryb6UBImbmB-C31WfRGpfDcQ>
    <xmx:bpFjacxek_zCGmlOnBKXtw8C8C_zL2JJpTf81zJ3de1YTceBJF7Liw>
    <xmx:bpFjaZrwYA8XnpGewlWzGsn31yW79Kd9OjeLjs4dipQGKxyxTjpbXLJn>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:53 -0500 (EST)
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
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 16/36] arch: um/x86: Select ARCH_SUPPORTS_ATOMIC_RMW for UML_X86
Date: Sun, 11 Jan 2026 20:01:49 +0800
Message-ID: <20260111120209.6133-14-boqun.feng@gmail.com>
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

x86 atomic instructions are used for um on UML_X86, therefore atomics
on UML_X86 support native atomic RmW as x86 does, hence select
ARCH_SUPPORTS_ATOMIC_RMW.

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Acked-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260106034034.60074-1-boqun.feng@gmail.com
---
 arch/x86/um/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
index bdd7c8e39b01..44b12e45f9a0 100644
--- a/arch/x86/um/Kconfig
+++ b/arch/x86/um/Kconfig
@@ -9,6 +9,7 @@ endmenu
 config UML_X86
 	def_bool y
 	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select DCACHE_WORD_ACCESS
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
-- 
2.51.0

