Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E268D33ADBA
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132950; cv=none; b=OsNEzit5JMA1mMghoQ2gSyYpQ3qr2IZ9Mve7sxpEAiR5HZUaT8SmdJaqxZm5BMLhILqVb16jz9bovuftJj82805RrluvpWMwVABWswb6TDulDSaKnYvXt1y+KeV1PcsGb0XLZqzv9T5PyxUhNZX7T1FQuXMdb904Ap0VzSiB1ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132950; c=relaxed/simple;
	bh=tA8WSnFev3PqsJMCN28WcDg8n5GCieuM0ZLEg+l/zQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FFIbpyT/IU8o3g6KnfS7zFh4uCSMl/mGpu68nr7NSbBlUDJyuyPMEiBTxEo+mUXMocMZosMxYL7CNoIvqBExSNVFJEuzeamAygPHXO+7DHBEdtTgOs5J0yqjFO8XyICP6zNOyjsdofmEEOCbfMu8kxv+3RspXO8OqbB4/8dUNuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krrqhczq; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krrqhczq"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88a2d21427dso57568286d6.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132948; x=1768737748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fbl+ZOYOSkLBAoxkQYcc6P4fQm3wpIW6+HUNF874534=;
        b=krrqhczqRrFr5J3aXn7oSRIUFO6QFWDYhvW8j92klE++O8FXu6LSKq6hMagBav24tD
         L9Ii4/OKGRkIDCKgRufJaMNqz6oZpP0pAJu5GWeb37ZOLpqg9r5/YG+4fYLDA0AszlkC
         5kIQMyEjUcTZq7Ly5KMeDsjxVz7B9Z19EZdDNvRM091bHvPvVT8x/l5Y1e5MxzkCbHwk
         JkxxE+EJb2erGP/wvQ0N75dPoW1Vrg2XmIl68hSqMNr8okcBga0JpJ/UblLICTFHfde4
         J8fHHmydVuXbhGsDQTje81khh16sajyVr2vF2uSl+QTEQppXN98nRbkNMDQbarM4kKhf
         bP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132948; x=1768737748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbl+ZOYOSkLBAoxkQYcc6P4fQm3wpIW6+HUNF874534=;
        b=AdPog7EdoTzKAvt0N4idTw163KOnEcvb6xwPijpDW2t5bbRNB3ZnnLhtT6knsFPbIY
         v4psjNvbwQBvXMeV1f1U1ycIRxpVqUyxjKQXsCZztbVz60ehM0epic3HbODLNr+JkXNX
         U+3nYO0hKhUcwgKD3taXvMdEYeQhvMmAlxRBNZj2FUXT5BpkBvXQcWXymKYwQaGvv7f6
         UcL+izSsjGY/+SqYupdKBhBXsMtaqotFDafhex/JkKzBRHFwNVdueGcI/mnzEhSXI6jL
         GE+DeH6Apfz1WXrySwW0OEGMmHg0aY/WapjnVSmLtEN4xdV0df685v8md66rSEHFUSye
         x9Jw==
X-Gm-Message-State: AOJu0YzCcygFNlioTI32PKcDAn2KFDCzCOff6n2xJ5TV70jTU2cri/LJ
	UW8+tKD8MiQMcsX5LERQ3NQ7KvSZIqyi41s0DEfDmdf5X9nozUUWeIFt
X-Gm-Gg: AY/fxX52XnRyvPhOmlMfE4axouH7B7CKDDH6Xxcat1Oipsllgm5JQ7UX2zAHVYH7k7A
	xi0Xp5ZL/2syRbYwCdKI5M8PDreMSisqzCA9TVRc3peUXJwsvukqyq1LHh3YoNA/QNl9u+HI6Mz
	HNOHuwD1WhwEmJ/UDaqN5+qRkSuRZS/xvX3lFNyFz+T8CQCq15TBumUKSPXyXF/Us1E6yrEbzgr
	4NhoxUffI7++qNuCbtnQ1wlhWpcq+hgQ7YWqZFhEPjUB3cBE39caqevNbKG8z8C8DxpSqmvQUmZ
	XibnAAncnzKMgKQyFD+TPAMWIHRN2OPkgoqLPukzY+jxfzwcEs19UFij2TUBr0TW7pCGfItpgR8
	GRsyC+hvCD43SWUF80H6PGVFKqDxZ8ltQ+h12+uzJDFg4y9oqnJIoL+3xAZ3OCqf5A/nw2/eqgJ
	aWpbYpxQGvgPg0GXEZRRE8vG+5gwQbwnt9IoMh4RCMK0dc6lBpVnBZVoB0LBbhmDJhEkJ4yDDEH
	bTfyouIrYzhnu8=
X-Google-Smtp-Source: AGHT+IHkzElXUUJuscQ/wDDpK92Hh4txXMepRXC/UngYSNhWXXGPfBZwtZ5jPxjFCa5XmtTe+6dw+g==
X-Received: by 2002:a05:6214:492:b0:890:60f:f8ed with SMTP id 6a1803df08f44-8908418eefemr221418256d6.19.1768132947658;
        Sun, 11 Jan 2026 04:02:27 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907724ef14sm116797236d6.38.2026.01.11.04.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:27 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id B1D3AF40068;
	Sun, 11 Jan 2026 07:02:26 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 11 Jan 2026 07:02:26 -0500
X-ME-Sender: <xms:UpFjaRm6YFmfDK0UFedM-7wBGgtWqsV2rz-RtGCtGfOqrS94y5FdFQ>
    <xme:UpFjaUu9GE0OnNxEqDnrGy0GVArC5DqCZYMqBTsye7FWCXOEvay4A0GNaW603owtB
    TGvWHYUHGqzhu8_1WrqkQFLBwKxWHwIFXtxtaLLHliL8K-Mwnao>
X-ME-Received: <xmr:UpFjaXBacUwYDHaAds4cy65qg-SCIAcLjh8Oj7hIAZc0rftJT6gN57F8>
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
X-ME-Proxy: <xmx:UpFjaZWpFfdb3r2gZ0ybVOqKRZI2tC6PCha8SkeE1YJT3rw877Itbw>
    <xmx:UpFjaYFQdxVplOz8gFXixRHm8kCqUGdzEeo8FKDv1FH1aoPdGRLhEA>
    <xmx:UpFjacNICeEswx6n7IQGdoROEHJYotIoBmlhWWO8CjhnL8kfqR5GnQ>
    <xmx:UpFjacV4fSeO6NZK9ZSdfgu4ISz2sufcH_Xx1yJoWGoanp3WCuOi2Q>
    <xmx:UpFjabyniIaj8B9oXpqN7IoQ-e6B7ysEoiDYecUAcI-3KCGgUOpm1bPI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:26 -0500 (EST)
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
Subject: [PATCH 06/36] rust: helpers: Add i8/i16 relaxed atomic helpers
Date: Sun, 11 Jan 2026 20:01:39 +0800
Message-ID: <20260111120209.6133-4-boqun.feng@gmail.com>
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

Add READ_ONCE/WRITE_ONCE based helpers for i8 and i16 types to support
relaxed atomic operations in Rust.

While relaxed operations could be implemented purely in Rust using
read_volatile() and write_volatile(), using C's READ_ONCE() and
WRITE_ONCE() macros ensures complete consistency with the kernel
memory model.

These helpers expose different symbol names than their C counterparts
so they are split into atomic_ext.c instead of atomic.c. The symbol
names; the names make the interface Rust/C clear, consistent with
i32/i64.

[boqun: Rename the functions from {load,store} to {read,set} to avoid
future adjustment]

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251211113826.1299077-3-fujita.tomonori@gmail.com
---
 rust/helpers/atomic_ext.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 1fb624147aa4..02e05b4246ae 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -1,22 +1,43 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <asm/barrier.h>
+#include <asm/rwonce.h>
+
+__rust_helper s8 rust_helper_atomic_i8_read(s8 *ptr)
+{
+	return READ_ONCE(*ptr);
+}
 
 __rust_helper s8 rust_helper_atomic_i8_read_acquire(s8 *ptr)
 {
 	return smp_load_acquire(ptr);
 }
 
+__rust_helper s16 rust_helper_atomic_i16_read(s16 *ptr)
+{
+	return READ_ONCE(*ptr);
+}
+
 __rust_helper s16 rust_helper_atomic_i16_read_acquire(s16 *ptr)
 {
 	return smp_load_acquire(ptr);
 }
 
+__rust_helper void rust_helper_atomic_i8_set(s8 *ptr, s8 val)
+{
+	WRITE_ONCE(*ptr, val);
+}
+
 __rust_helper void rust_helper_atomic_i8_set_release(s8 *ptr, s8 val)
 {
 	smp_store_release(ptr, val);
 }
 
+__rust_helper void rust_helper_atomic_i16_set(s16 *ptr, s16 val)
+{
+	WRITE_ONCE(*ptr, val);
+}
+
 __rust_helper void rust_helper_atomic_i16_set_release(s16 *ptr, s16 val)
 {
 	smp_store_release(ptr, val);
-- 
2.51.0

