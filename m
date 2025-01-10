Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B624218591;
	Fri, 10 Jan 2025 20:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540273; cv=none; b=qpKqPpSJVByr/mfAXUTs7hz8bgetA6RrC/TwX3icbs5J2xleuKE1U7HL4+E+FH+DuR+f5t1zMK2OuZNXn2cW52XLVAAlmjvWhNojgsNvfRLM4ImhHtGLRcyQGVx7adR4zI2Vak2ViFtWf2F/a76b0/AimaSklyfflprGX/kxNwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540273; c=relaxed/simple;
	bh=tQDyXQBkG1q5qjeehMfyrhkTdqTA2BWMVmg+Cs7DewM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAolsiDN2tL6jWqmd5vP7Pf3q3Qi8n04RrLd4VyJrd/rHZoU17T3c/VqT0DgE0UaCXcuwBelBZTxjpbnqYuQbJfslo/ccM0kHs8b1i7f6s1vAbhCrmiltJ0tbVhuxzToaczG/chRSX8X/fEsbFmSB7wtnAuryqZGmGw738NfNWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n34ZU7Kq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n34ZU7Kq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3162C4CEDD;
	Fri, 10 Jan 2025 20:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540272;
	bh=tQDyXQBkG1q5qjeehMfyrhkTdqTA2BWMVmg+Cs7DewM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n34ZU7Kq3P1MBaOpwEDTfDSvv7WWjyaJdpaCwccYPzqJ4rVYAbgXQV8JKQiEZ36Hw
	 HBtELsuOrI6szk+4y+Ghvbz8F+fovwOiFltLfOjEzqk/FECYvdjH+/57f3/ZlbTL5v
	 brAMojToNmw62YRzex/sK0aqrokeF0TrodGSzlgjS5jTSN6QItkCHihLSGnPRhHopK
	 zkrUBiszzbY9/4IgjIzHDrW90/cAimVWHPV3/bKF2ZB6BdimGAcIyoJwHX9ZZiFMmQ
	 AmOzrrmj5MSAqd4nFUlIpqe9huYBVFFl97nF9Sue5nqRtCBTpgTt30iGwz2AD0zP2b
	 NpIDM9nVoMljg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:33 +0100
Subject: [PATCH v6 10/14] rust: alloc: add `Box::into_pin`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-10-f71d50f16482@kernel.org>
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=tQDyXQBkG1q5qjeehMfyrhkTdqTA2BWMVmg+Cs7DewM=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/oOsQNDhHkpQXDDPcdFRBxzT/F2wCQNzHEW
 H70jfLunpuJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/6AAKCRDhuBo+eShj
 d2bmD/0Xkf35dAsl4/d44U1yWTvbND7/B5ulUuD0nu47wpqDZGW9gRBKSSSvehQo3B49IhrN/vl
 c2OA+Kd3EPcpA+VpUcXxyOnZbHeKr4rrI55sf+WQ/q24yhNGD7NvR7dkShv/saGlxtYB1mAgyP9
 NgZRXH0Inj6kq3K/jz2m80Hj4ZcwrSkgNPESPTTYZ74SEgsq32Orq7cK5MiqX1fupphjOPUcIAZ
 u+Spsm2SNiiwuqoyZ9v8JdMMdyeAP/sxkBEIB36saGmbWV26hvGmfk2Sx/LbSN8P5BeQ9YvHMlV
 9pj+FAg8MsjWPJYIVKeviCQFelVF59O8vE/LGHdEdnxxzEQe9UwmfrUQkoJX//ISK8yfMwkG8Fn
 l5nbGoUwDk+JNpEP04RwoU6demSGLty0+1dnJyDvVyi4YhDA/2hZid/ttF7yKcdybJ2SLp5I+Js
 0Nk/P0dUXGH/weIzmSrq5l0wk6nPeXi3sSlVTxXE3ZGu2F6pvyiI9efUNxCgLlqw3fbsDAKjJyg
 1e450zNFKmeDcW8PsQt/0Bh9sO0FsbjjVvEvfleiAPBfN6nEdZck5cmcPcVyH1f1na80fts8pYf
 xtPGuYiWXnTYxc7mJ3PTJTp32dD8j/8UMi6gbCYAglUw1qG6YAqNItM+PZ+W7FXU/YLpkC2Q7Qk
 jULqMKo+Yinkqeg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add an associated function to convert a `Box<T>` into a `Pin<Box<T>>`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/alloc/kbox.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 9ce414361c2c6dd8eea09b11041f6c307cbc7864..76f29e2ac085e19871f18653cfddf11d2594682c 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -245,6 +245,12 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T, A>>, AllocError>
         Ok(Self::new(x, flags)?.into())
     }
 
+    /// Convert a [`Box<T,A>`] to a [`Pin<Box<T,A>>`]. If `T` does not implement
+    /// [`Unpin`], then `x` will be pinned in memory and can't be moved.
+    pub fn into_pin(boxed: Self) -> Pin<Self> {
+        boxed.into()
+    }
+
     /// Forgets the contents (does not run the destructor), but keeps the allocation.
     fn forget_contents(this: Self) -> Box<MaybeUninit<T>, A> {
         let ptr = Self::into_raw(this);

-- 
2.47.0


