Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723C93AF668
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 09:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773307400; cv=none; b=ZOcuzBL3EMq43xuyd7JJTmZ5NaCOQCuoczULQ0sHLoPdbzXlvrrvfQgaKjH9VmnaH1yFUtn2iGBPtkq4l/Eqjr7/7isexiv55gKnqk1PEC1uqwUl6vzToaXk8jvq2woqgPuNrfQlE4ZrqoeKl9tRzhyhWWmbwDhd5jibiUeHf7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773307400; c=relaxed/simple;
	bh=Tr9+4ArZOZk2AagcvOQLIT+XXEMjOCbqhU+kgWpUMbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OleHOKUGKoBMqiYWKmhz9s4BBdtn7evdcUV4oh6x2YszouNcCrojdRhf792KAFRRQvZxpHqP2U8AKTpGAFd7VT5yMajI09k4o4lWVnT82/JikyYalD3PTlmiQIDIBB0PkbNWLtkkWYh6dPs5icgN39NCmPsu6m3p+L6v23XQ8Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M62tqwRN; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M62tqwRN"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-439c12269f3so490522f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 02:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773307398; x=1773912198; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UBg/zFi7SrjD963r+qA/oZ5mO1M8DDxmkcgZtBd+URk=;
        b=M62tqwRNUZx0XvNogaSicSXfoIqSmt7peoV6w9oQowqwNZpoAVx9ExTTFAHTMVecSe
         84gSY7hoin/1HZcg4U2eYkcGNK2cTnx1wei2j/cphcdTF8QZ3lKgKYNtxhKltYHvvAyr
         oV2VJ5s1wIK+WOGA4OJZQG/5ZkKbwIza0ygteYBicULCAteYzFbcDRZNEABnKmEwHc2b
         Vp/5C0h4Gxj3nsHs3orHBJ9NGK8AYuj6tQeNnmlPMkUiy2XPEjIsI6bKFMoYLrfyCDz2
         d6IIxJ3TqtMBqy5rZdFrLOg/7aTEH8r3RS1/gvABjB8WgkXjOI8qyjV7MvEjC0lGBrSx
         PSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773307398; x=1773912198;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBg/zFi7SrjD963r+qA/oZ5mO1M8DDxmkcgZtBd+URk=;
        b=L/Y1BtiaSI2TMITtkY5FlbuF+dwH+OpU5ueyerJjhL1BiFhwm7BOZw2ys1kk5GbT5T
         lLoc+UkKe0924Af80FpEfLup8cazTkAyGFTny8Q5opD3aaM2IcETqgg0Iy3i/NJr7O05
         36jWX7EtL1TfdoxwuNyUIHgwjOyeuEp2rMsEOqhJKxIM3RNNbU7bVPZ4hU42a7Olbgyq
         GFYMK1oTft6+NDm4UGN7bJ9SGc1C3UQcjBYnJH/wYw5v9QUQFP7P3HOaF86tGzKaCuMG
         p0YieIqCKWaeBApdSw/F5rL0E5zQgQ9jno+P6pO4+YkGneVX55qh6vO7rENa9XZdBbYs
         vcMw==
X-Forwarded-Encrypted: i=1; AJvYcCU5AtRyNJ6Jo+9X5jwK9n12NM1cxTApGmXntN6TJPvOgTZLBdeUyyDeb2p8Vyvt15Cf4qM5+kkP0PKORTy0rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFXi5/RL5dYVpwXXRTEJPTzNfTdNQdlQoXdf0fhbN+vCDatxoq
	uL+HPGpjD0K/Pf9iKdntyCA0fxxJCRi5+Z1tzmwQ+KPNGk07J/8QfymxJXD0Mf+05A6Zy5xGcJG
	Z1xRrVx2kKnVALtVZqQ==
X-Received: from wrbfy5.prod.google.com ([2002:a05:6000:2d85:b0:437:7338:c338])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:3112:b0:439:b744:c606 with SMTP id ffacd0b85a97d-439f8222e03mr10338047f8f.40.1773307397557;
 Thu, 12 Mar 2026 02:23:17 -0700 (PDT)
Date: Thu, 12 Mar 2026 09:23:03 +0000
In-Reply-To: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=947; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Tr9+4ArZOZk2AagcvOQLIT+XXEMjOCbqhU+kgWpUMbQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpsoYA9HEb7ZfNFFbmLOOPVm4+/zt0+YzwFUDuU
 hiDeNdGu7mJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCabKGAAAKCRAEWL7uWMY5
 Rv34EACJndARE/ruUcol5qzH+F8IpKEVped6mowz8jgFU61HotTB+NXlc/ayxK6RosgrrG2bpLp
 j3fmi5jjl8c0REYgwi4G6dCsyUBo3kn4RRG8xIjxkeHbjPFbPP+1GIVUG4SmwkDs0XIADqTGgUb
 7xt1pooJv/Rt7oa4/UChKtDs+OtAAT510wx7yDLKOHEFzwfkw2EXBTR514eEcffP8c8VYoVngSP
 ZI8FnxMHpS5npaJzMfcNWy51AWpGw4eouElv+O5EBbm4UOR8hwOpyuBwp6/j2RZ6+IS/g55OgqI
 lW44PJu88nposC2FaLkQUMPnzTGPefsGAArvAPzDB6/afWwwzHPnTP1cn/piley4gGaYlLGMF8k
 eDVCU8buWs4LOpHEeuzj+qUWtQPsrR5fOq3XAAbqWjYPRyNB6yVVbXwjR9Syf1oxUOZ9fJlSPBo
 4Q3zOywwdLsBHh94kJS/oj+rRVJ8W0OPQtymcvZgSj4vea5GiParLomoCe/dmjO/YtmtMgReKoA
 mO5YW3plDDfHcbkasAFU1ADSG7MzPptxr2YZL2NqMzhaJEXb1vKscbi5kp/eG4d/yyc8ECLjH5c
 GlAdSa/TCbJ5oLpd+8LNA6FdSKnRwrQigvKKkL0WaKKtTkK5ofoFy9y5rmZlWEufGBzQFsPEnoC DOhFFOHQtVW5FZg==
X-Mailer: b4 0.14.3
Message-ID: <20260312-create-workqueue-v4-2-ea39c351c38f@google.com>
Subject: [PATCH v4 2/3] rust: workqueue: create workqueue subdirectory
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="utf-8"

The following patch will implement a workqueue builder in a separate
file. To prepare for that, create a rust/kernel/workqueue subdirectory
and move the existing file.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                                    | 1 +
 rust/kernel/{workqueue.rs => workqueue/mod.rs} | 0
 2 files changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8fb7b70dfb47..8a12db6bd127 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28511,6 +28511,7 @@ F:	Documentation/core-api/workqueue.rst
 F:	include/linux/workqueue.h
 F:	kernel/workqueue.c
 F:	kernel/workqueue_internal.h
+F:	rust/kernel/workqueue/
 
 WWAN DRIVERS
 M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue/mod.rs
similarity index 100%
rename from rust/kernel/workqueue.rs
rename to rust/kernel/workqueue/mod.rs

-- 
2.53.0.473.g4a7958ca14-goog

