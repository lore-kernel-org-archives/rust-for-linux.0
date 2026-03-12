Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AB53AF675
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773307398; cv=none; b=rwxsTp8oCtfuY1Hz9JE/9xU7JuH041/MH76R7qWUTYpfXzqDoijX85t6GYG7FwMMtanhUWcy0JeOBi3Mi6NwzKWIc6N8OUkfEEpUBACZFBBqkkPnHmDDKPAH6I1n8tczyjBmIKvNAvRzFzPcsfq1jOmMsdsa2APTTjMJK6DuCfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773307398; c=relaxed/simple;
	bh=HGRaRGYIp/2I1VCTP2/AvId3YATUkkj6n4gXWOYzK4A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XlJP/6QAbZZNQDvEevEJp5V23QjeKTRujdWN1WyYOKtydPSpzL/4Q28i1nkF3Ml6MulQPbqLrJU3q2RzoF4Fa3xTkfYRBFS7ghu01O8kTcnS8nBK79yJmSDbrle12vjr7O+5SQRnIDDDr6Jlc+Uz7bqmL/FwGj8gpzgIk0OhUl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eniJemST; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eniJemST"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-66379b3bfa8so472679a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773307396; x=1773912196; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g0tQd8FbPi346llSLS3fx1+p0t2zeeyNV0n8zJlO0zs=;
        b=eniJemST2Gsmooqqc7041e53b5huuLXPL4hpRcrysLW4+f/fgI17dgx0srlWkfkmrd
         wzI3M8ZuzyhZCcgNbup4rzfL1nb6nO+kolYYvVTWD0QWHestWSf16ga9BQWKdp0x7REO
         TdyfbiYe+c0KrPH7kKgOMssRO5Ajft3b4yVZM9NpLvyPnNPUfVwMR+VgT4UpbMasMXa6
         F48lIHbYhltj+GZSliY+XAU2Yer5Op6Hz5UsksQeigu2c4kQPDDK871q+PwscJAyVgHB
         Niv3QUvS/1V0hXFn5Cj9cmkp3efTR/TPywnFlozOlH8EJgAceOETSDwssnCWe5hzNcH5
         daJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773307396; x=1773912196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0tQd8FbPi346llSLS3fx1+p0t2zeeyNV0n8zJlO0zs=;
        b=W1MFDTpnIEZT2dEVIwfCa+z2sANCVAMdTpHynjkPS1lDyt5DXBigh5GMsx1HPbbiM0
         7+IxMnDl/iZ4JV/y17izruiSlA+/VehS4yZqBr+kdY8tgjISGvin5N4zNv+pdE631ZmS
         IeSJJkfYN4cQ6phSWLQUIN5g1R5hrF8Me2RnAtvqxUzWoeMYBKX5uU9E9uLXKNZTzly4
         qoq73xQVMsPE+QccvN0bXvX0onnv7q9efSkjQWqPSHqbltortyq9Ln8nlVeyjg1Cv2Gj
         0X5N1UOha4jmdfbX27/xq1HpcZe7atGPxh3Zm5dwpo0uWd963GEczF4KMfwHr6uQQbrd
         adeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYKzmx6OuAPStbhYeSCWx3VJ+U+dmDzJXSV9lAO2CX53+R2bfvU2ANV367HAmp9CUbnQztRRfd9/0Vq1uR+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykg1r3TMYqpmfv4iDfchJiJniBOccs6zxHSr1jKhUyugylWxr+
	aOSL7Q7V5jN0POu5mPAerjaq+hZVf5EMd4XxMJxHfwVoIvgeoHgfDMS3mgf74J7vuYGfvvF1N9Y
	TmFlkFpRrp5XLTv1Wpg==
X-Received: from edsr1.prod.google.com ([2002:aa7:da01:0:b0:660:a402:c93b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3552:b0:662:ac65:19e1 with SMTP id 4fb4d7f45d1cf-66319bc7dc5mr3072407a12.12.1773307395717;
 Thu, 12 Mar 2026 02:23:15 -0700 (PDT)
Date: Thu, 12 Mar 2026 09:23:02 +0000
In-Reply-To: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=HGRaRGYIp/2I1VCTP2/AvId3YATUkkj6n4gXWOYzK4A=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpsoYA0cmDxCYMoHbbLy2sfHV5bUhhXB6n5BYTs
 mh0uOrhrLmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCabKGAAAKCRAEWL7uWMY5
 RjrsEACqk+IzvK1DPpswLCFP86Y69YbF8A/IaxxZ1r/SHlssFKn6BWjIO1fkaSbN63iqosgZsLd
 DHrmnuRegh1mEFjpQV4rL1GwUGtjja2A1+dZwbFrQLIAqfD95ZbDsCktBFRKlZFX8+qYObi+sjq
 wMgxpSad4Y9S4zInE76l0FMTkpLLB0oVYms3nysnpeALtcmfNwfy2FfcYVXUcwVX7/R7Tc/S8jf
 DHwG9ivrVB/UNwSa+alahlMhfdhy8HcJ1DgstbV94+ktLB5rdHjuZPhGPvjbNJStfyX1IzHt+u9
 0Cc+beAZ+UPQG6i5c862V6KrtnNZo+Vw0VhU+vnH0EUPc4FELdZHXSYlxg116BWLa3sC6GCGEAf
 TW8uFtcIr3/RI/kCqxzQDwY8V1f+A83PVMxdJNCGZg+T/JAOLxvEjXyCJnfncd5b7yLeu2DWb2z
 3fcTX2FH9xAgJcjF92vXN/zbbMVtY0MpQW2hp3NBD0wHfQLu2zWw/1LA1E50a+2w1pGZdMB+U3n
 k1liSerLDb1+dv7BtqxNqxqMRy/+h4aChYHn+3Ci2FnDBZrixrdL6U5TiIMIf+RBwMlZx7n1i8I
 16Xw+2q13GpvS6VQe1tK0CzyvKcz5AV1toUtw6f1yO2uMvEQysreXRQriGqhygnvSq9Npi6T1zQ g6IXLDMPrNHjPSw==
X-Mailer: b4 0.14.3
Message-ID: <20260312-create-workqueue-v4-1-ea39c351c38f@google.com>
Subject: [PATCH v4 1/3] rust: workqueue: restrict delayed work to global wqs
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, stable@vger.kernel.org
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
Link: https://lore.kernel.org/r/20250423-destroy-workqueue-flush-v1-1-3d74820780a5@google.com [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/workqueue.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 706e833e9702..1acd113c04ee 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -296,8 +296,15 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
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
2.53.0.473.g4a7958ca14-goog

