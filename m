Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD3F2DAFDF
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 06:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763100129; cv=none; b=acHzuScxMZYWzOuz/ILpdZc+xUmBLpeuzZ2x988Guc4KFowg9h9XhLfIb8vrjF1i6LXQgjQA5aR8175nI1pGoGOggfmfeXh89yDvd1nH4IO7aJZ73i/5PQZeA+AuYrYDt428noHy0p66fy/5ANkgtrKwikGXTJUpmlddwCi93oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763100129; c=relaxed/simple;
	bh=EnkI5JjdWIMaZagJI90MH776/v4LdDCj+FBGdPp4PCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TqZedLt8FkUSgVd12jzCgGyGCHDVFmY7BclJWspQQS2U4GemwCCpiWrmeKptw7Ygd+CH9wvXGEhviBDFQffjWQ1NVmbpNGwgaQ0BZsdXQUnziqYjmM+UKhIC6dtZVsLgxr6zpRHMRQ6GxZrzPRu5ArOUcQ20WGai/uRu4Te3660=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLu4Pnh/; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLu4Pnh/"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8738c6fdbe8so16316326d6.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 22:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763100126; x=1763704926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a+232ksQ0H/2VtPMqeUqckJQdfTHKn8qYr0CZzrNZ0w=;
        b=NLu4Pnh/fHFcOjPmvgSnZa+idRYiM56gBHHp8649WC7X0ShYH+4NHYBdb+xeAeTP6q
         00L0Encx7+cyP0djmmWEx1DvmxEK31+37O5zccZ/WBsAiHrAuE8Poqaw8OzNYLgc2cx2
         zexfx8OVhNngeJS2onZ8nolyrljcalvm8h34S7jNS/lo4uaXAa64697l1aBf1vtYhzaN
         6tMzRO6+MnLZfPj5DaAqu/IXJRwuhuJl8eztCZNuP0ufZANBKmHZBUpZSoVLlMURyvbX
         B/+ATaFS7DDxFHEr/YUsYcGGXI6AKkDUk+LftIs0nXAHKqkhMO82P110GGiiBYDsec7s
         rSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763100126; x=1763704926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+232ksQ0H/2VtPMqeUqckJQdfTHKn8qYr0CZzrNZ0w=;
        b=IZMhQQJ10b5sk+RfDWCkGYsod6N5iimp51bKMSMevNDq9z2kOqkJKa08BOolTswIHY
         bBhyEOsiox8hMMQDYe7MtnZbB/P8hfwJSqCaSklrNKgBN9+9Ajkl+ByZHUCye0br10+9
         CfZ3+CaJJgLusMX/Ciw6/OEMbre4Tpls6u59B6B9BZ4ndmbsFvJvfHOH7BcDKr+2RFiJ
         SYPLOUJLmtn0EYT+cRKHLamnfZo3PRQeySGnFSiWFIVr2UjkQRyjpc4o7eDO0dgwdRAT
         tvvkXwL8/IOAq8pgZHF9Th24FaFub134mH/koPSXAgp5/fUKL/bSxP9dxMIEb1qvoPNx
         bnTw==
X-Forwarded-Encrypted: i=1; AJvYcCXx27iyP7KN/utKBqe5PMp+jX+1U16R6WN8EPlSNTlI5z0wCqY8avhxXzmKRUA1NaymvnGWqBrF+HSjFdi83w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFP/bNm+EzK5T+6Ht3LDc0r0xDqFtKr7I47ZuxBnc4cUydjwF0
	/JkP8boIFSiz25W1X950Sb+fdnIIX+zZZB9fVwTEbj1+l6bp8kNSlac4
X-Gm-Gg: ASbGnctNSJJuO4EK9eABm/V7lpLyJr4Yk76ipudNZQsCkigcS+MddrBspoeuqfIy4+v
	dVLXV8GeoyW9918Sqs9BTIqvQ/eM4eNKnjAL03FzJ6V0HbHuQwqMh95hVoJp5jTzCy8SopauUF5
	lxMFIhDQDxkhdAQGuRxODMuXMZ/G49iY+3R4f6WH85D0vUOSiF3tNz8WQq6ZCETZZIDEX/Kxi2o
	2kEZTLUsEg2LFAJYfTf390mjM9PRuxZ6r/5HG8tSBrzznld2/5uUbEK11UKPjHVKdEIQtu6TlMU
	tBhB9BHx3XrpW39ZbiSiB2vEtAGrZNHtnFKmuDCZNszhaBhYNGvm0DahLqu/mZhcVIbmdft/coj
	ka05J37aqZdj5cTEZdkzMFXtPb5mSkPPKgA5K6g3mNPtrOlzM1YYsdmwR9qTdJCpAQgx+ocgY/j
	JgVcwrEjYs7038hTVfce7EAoptv70Z8DqAk60d3DweZyNPr1EDcfWgt8s80WRy51j9oCCLgMo/D
	YMMLaLPzUxWLIA=
X-Google-Smtp-Source: AGHT+IFIjWZsRYUO4bHseBkrJUFq8odY93vLJY35vB+BNKbufDIPgB8TyCxOv3l89ZDlUVee/FaMCQ==
X-Received: by 2002:ad4:5764:0:b0:882:36d6:e5c1 with SMTP id 6a1803df08f44-88290fb06b7mr31264156d6.29.1763100125958;
        Thu, 13 Nov 2025 22:02:05 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828652c882sm26094556d6.32.2025.11.13.22.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 22:02:05 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1D52EF4007E;
	Fri, 14 Nov 2025 01:02:05 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 14 Nov 2025 01:02:05 -0500
X-ME-Sender: <xms:3MUWaR_y5DCif6rfiFYKQVEDiWTcoclIIxYmsXY7Ly9v-XvKu5ifFQ>
    <xme:3MUWaU8pTb4RWQ3tssdqX5IoywD_lpGSRTSO5NpWUiiMCYVhemfVyq_zHwX-W4l7Y
    Vl8nJZZ1eYfBj8uHqCcpw52UODv4CcsdO-QznyoPgww0_cNn1LK>
X-ME-Received: <xmr:3MUWaR2FKgs2g8hiLpA2f1DqzbsIekJkURM3VNvNJxIP9a-4qDNki9tWqG7dqKcaL1tyip0fMzEUjEl-rLJf6gINgtgjnLl6>
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
X-ME-Proxy: <xmx:3MUWac-SQE6BXT8oVL28FRoalHzrgMrc8pER9JkjK1AH4QFA5Z2n7Q>
    <xmx:3MUWaafEhGGByErzwMJPbSjtFpnojJ1LYQ9hmYJWwyQyk3o-GmSf3Q>
    <xmx:3MUWaQEULcbkUbV3vvDKWSjWMqefphl_41v7xb4wxBHoGyBu1_54hA>
    <xmx:3MUWaXBRKjmzID92BtPYrGtIvaTq8XXwwF7-cP80SleSnb5Qe9v3vA>
    <xmx:3cUWab424uInUkVpuGzuQC-BD5LkjjBIll3u0f-yQp7CmqLKEo2tigOR>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Nov 2025 01:02:04 -0500 (EST)
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
Subject: [PATCH 1/4] rust: sync: atomic: Make Atomic*Ops pub(crate)
Date: Thu, 13 Nov 2025 22:01:57 -0800
Message-ID: <20251114060200.12982-2-boqun.feng@gmail.com>
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

In order to write code over a generate Atomic<T> we need to make
Atomic*Ops public so that functions like `.load()` and `.store()` are
available. Make these pub(crate) at the beginning so the usage in kernel
crate is supported.

Tested-by: David Gow <davidgow@google.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251022035324.70785-2-boqun.feng@gmail.com
---
 rust/kernel/sync/atomic.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 016a6bcaf080..0bc6e7b04d67 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -22,9 +22,10 @@
 
 pub use internal::AtomicImpl;
 pub use ordering::{Acquire, Full, Relaxed, Release};
+pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
 
 use crate::build_error;
-use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps, AtomicRepr};
+use internal::AtomicRepr;
 use ordering::OrderingType;
 
 /// A memory location which can be safely modified from multiple execution contexts.
-- 
2.50.1 (Apple Git-155)

