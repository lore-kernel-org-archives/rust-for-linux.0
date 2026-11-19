Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097580;
	b=J8Lm2biEYfUKLfu2KAfelvjah84dwPGSu5fnyyJiqhLuyqYTkIhzZwsan0LVzE6ggq2J
	 AP+vCf3VOgFI5MRKPceUykSl9q6KrITtK9Na6oy8rrk/ujfNIu7JaPlSZHFKAcfAV8/xH
	 0fmqgD2spVWSyVXl3P0WOw6rjc9uOPuS4Sv+78ElnRFEczOEkUNBRRJwA9NFrsYoWAt7A
	 hD+Blsn/5bLLYPPuL82J9+OD33P+qe7pP33/JHhRhsKyt+1BSxRb/EepCm/DBpqNhiGTM
	 pEgPkrGL6vZCqA5pbeN3PHdJ9v/U+pUVvRg1QVQPZPTnXT+3UW/0Pw7sY2e6JwCridA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=h4XtWA1ZlEFtabMN7MuXGTzxwKlfoTdqYE31n0Pgw94=;
	b=vNOC1LajiivtGWJJd+vqPOVQo3v+TPCxUGc1i9eQmemO7UouPukTL215BGW3yPt0FGYG
	 TW2mirJ1IWKfeG4O9JC87mFJ3R+GzgwcRTTaMUgFACRcUihAQYqdNtsluK0bjQIi7O7Cn
	 Kg8ZSLGuj1uraNUhgdhdoL5Dhq9SVaJjoX0boKUEjk35lCbaxvoS4lUMJJVpuN2D3kiDE
	 ChiTx5IM4U5074B37sghxaW6PSDGgCpfqiW1UNA5BbYWBUifmp0ItOtE5UyKWhq8P7bYM
	 VPkLq9LPALNxyEBHPFKqjQdLlM7gtqftRBKAbGswBfomEcaNZrHt2CNgPAQSxYo+tHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TBjlJK4O;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F37606A339
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 14:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F37606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TBjlJK4O
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0af48c18so1557889f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 06:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795097578; x=1795702378; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4XtWA1ZlEFtabMN7MuXGTzxwKlfoTdqYE31n0Pgw94=;
        b=TBjlJK4Oepa4hYJjmEkXhxlwuQK/XzPFcJwRyi3RUEU0RAghTY+cOqC/OXwSfUeoq2
         fonhszHYQ4RGc3Q17eS9kekGeEwkHjtj5C6p8rLLzJ/YJxDhtcpaOQgzg76mCTxL2A5q
         DHfdgtpdqZq3TDvaSpCEwSru4e01jiXtI/pw5OeQ+xA7fiuqv8aA+JUqVRORETzy8ytV
         FTp1dsRCwz8xpWuCbDODIKLeNjI7D4rHhMO3TjxS/N0LyRMZIf81hdOpVloEkj1mReUd
         ilTEp7x/glMlCcHaWZedJIdBSPeG2h3qaA78+CF80kcq/PrN8CkdLPbE3kN6RWpTrPZv
         0E6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097578; x=1795702378;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4XtWA1ZlEFtabMN7MuXGTzxwKlfoTdqYE31n0Pgw94=;
        b=b24lPmHWrpbfgT4sxvhTSbqBFZMaTD8Izy63ORdlnAAo13jplRBqq7AzGw+uNY4xla
         MvMRfRwHKlIqI/IdWsVBxEWX40Hjg0Spqpcmx9lG2R/RWM5b7vhdC6kBGiiSgSyhytHD
         eImXb/RVRUu+eVJYSv3T1UIL+wvXL53HCfxl2jxKMd7qpZRT8J2EYhDgs6OQywyI6z43
         nIK3TFfLBN0YD0ybBpykEw0Ko5GIc/IJagpIm18tI8T/0aVfjrgGkDzVIbamR96mrtl1
         UqkLaABN73uDbx/KoSPf9i6b4U2xWr1oIcETYmtHKiCF+iHGhm0/Kc/CLliv34b97bRA
         NPww==
X-Forwarded-Encrypted: i=1; AL+hErEXXEq/SIjoob7v9PROG8B9S9f98sUloaPskHO9/AV0E2ztZsY6tGgvg0S3ooKpf4YogLET7COFLS74IP8htQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8tn62NwtsvryuViuzl3p3WSbOQAeeYniCthNLlz+mtlU3tFvYW
	WwDrpDRS1fjXEaJyrGkctkn9trKY2Ad0/QbZTNY0RmWB+PCqKZUduAcK2CFJWno5+h59YMozdlz
	d5WHtTTuXxP7rrIioeA==
X-Received: from wroc4.prod.google.com ([2002:adf:ed84:0:b0:4a3:2cb4:4f6a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2602:b0:48e:824:f0b9 with SMTP id ffacd0b85a97d-4a63ae5678fmr11825158f8f.45.1795097578307;
 Thu, 19 Nov 2026 06:12:58 -0800 (PST)
Date: Thu, 19 Nov 2026 14:12:43 +0000
In-Reply-To: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=5sQiayq21AJaQOqbklWWBdtbINqEna/wJifMJMxolCI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/wPjTLxLRE6bF8To20FERIvaafMs+3+IlhPd9
 VF/U38MG1mJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav8D4wAKCRAEWL7uWMY5
 RqWrD/9saTvcm0dmVaK6ZU6wMav3kkCa8+lP25N7dtJPuKanuA8Z+vpFUw2cmuir67lB089fACL
 maBtektbUuhdKLtwyN1t+KQlERluM/9OL7C3M47uzuevqBg0IObtB7MpUBXpYzO0EdsVUwH0vlm
 8M78WlElwh0vjDLil0VID04Mif/W47fXKczY22Wi6XptBS0VE2Fg3dhzvGJ8O45s1v4e89DtOSJ
 zLzjPIw30AHbGP0YGflcjDoT1qhRjpx6jgV/r2AlLZt+29YdPe/JGON1DO793nknP9fdsGlrzB2
 hLg5jvgvirAttTeS4RlecETf+LbmhwuECmoV9HM23tArEA70h4fypQa8Ivas7a2KOwzrDLQgEMn
 PBDGIXKPTSHGYz5JI0Uy8YnUDZfR05t+hfeX7PD3lAtrxxVngwWSbilRl5keJEHdFQVNE2vkXoO
 sZAN6ZCd9p8Y57gVOcdDsItZZXCNW2kvFF4TV2UkZE9oX5ykwilAFMTcOjOQNiws+HC+xKgnZeo
 VwYLm1QThwHzk1TXq9B0zLQlopICV+i0iOIyY9kZui/9Rm5QqUu0pSkuzhF7wp/nHfLUmJC4YAH
 csOFHqyicA5dNtRAOInOoQ5E1v9EQxh/PwLX10x2Ao1WIGBjZoye8mPJZwtuttOSQuqd/y+9W4q ah0e6zGJ5zyUPBA==
X-Mailer: b4 0.14.3
Message-ID: <20261119-rust-workqueue-v4-2-707c68994940@google.com>
Subject: [PATCH v4 2/5] rust: workqueue: restrict delayed work to global wqs
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

When a workqueue is shut down, delayed work that is pending but not
scheduled does not get properly cleaned up, so it's not safe to use
`enqueue_delayed` on a workqueue that might be destroyed. To fix this,
restricted `enqueue_delayed` to static queues.

This may be fixed in the future by an approach along the lines of [1].

Cc: stable@vger.kernel.org
Fixes: 7c098cd5eaae ("workqueue: rust: add delayed work items")
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Link: https://lore.kernel.org/r/20250423-destroy-workqueue-flush-v1-1-3d74820780a5@google.com [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/workqueue.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 6eb6c40138f2..5ef807ed6a33 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -302,8 +302,15 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
     ///
     /// This may fail if the work item is already enqueued in a workqueue.
     ///
+    /// This is only valid for global workqueues (with static lifetimes) because those are the only
+    /// ones that outlive all possible delayed work items.
+    ///
     /// The work item will be submitted using `WORK_CPU_UNBOUND`.
-    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::EnqueueOutput
+    pub fn enqueue_delayed<W, const ID: u64>(
+        &'static self,
+        w: W,
+        delay: Jiffies,
+    ) -> W::EnqueueOutput
     where
         W: RawDelayedWorkItem<ID> + Send + 'static,
     {

-- 
2.56.1.708.g77570a6a1d-goog

