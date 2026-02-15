Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03732690C0;
	Sun, 15 Feb 2026 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771186460; cv=none; b=qOeE0dMJE4pNdLjhrDxLxMoACAx3WT/bVpuSiwGXjLke10Eyg8SJJCSG1yOxLs8R75y2lcMnta87k5yRbG1LoJ7SBeh6gwBPyt81VCeqzheHd7IG/Kjw7yMI43oXt+oB4pi5+negOdue3P4mNzoZRVrgEGZ9zfKCYe4IbFTCDqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771186460; c=relaxed/simple;
	bh=hYArApEYjS9b442dFeDpNLqxGdEaVQnTgszVKpt+EOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d3J4NT450xY+88/8lv+xVtNk9yP8iA2sKlVINq19Ty8ZMvICNjq5f3zRCjKfOnc2eu1BsxusQBfrSqJOOocE8GHvq0QLceSFBuq9knLPKqwLYwcx14TswNOin3XT4+GF4fr0x8rcRAhkLNnUequuIb9FsPJP6iolln29FIOejYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usfo4IWa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usfo4IWa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F63C4CEF7;
	Sun, 15 Feb 2026 20:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771186459;
	bh=hYArApEYjS9b442dFeDpNLqxGdEaVQnTgszVKpt+EOA=;
	h=From:Date:Subject:To:Cc:From;
	b=usfo4IWaQYRfrLquQsyaVHSopwPvPm7UaeTkDP5XqJMBxfbPjuNc3/tH9XDQSHXoj
	 4H4P/4JMaVo8GnSml1DavZtcIFGcgAZvUxAYsqv4JxvKj887TsQjYlKJ2M28Tj31Ad
	 1d5gD+JpRIjkQmbMz7lTeHsc0cBLQqakHXgzrsgaV6i29cbD6b6l/wjXPxgHzAtv2x
	 otwfzLhtd7AdksxySS7ADbedTb0sryYxpZlFv6CwBgyrt4m0JlEFJKqt88DrTAhkMn
	 rSuMUjHIoIA+GEcIKFRA5/JPRCDeOiwAc7s7Ta2SJoE4P3J3sT2sWCbBDujkt0drY0
	 Xiw1nSu9DV8iQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:12:04 +0100
Subject: [PATCH] rust: time: add `Delta::from_nanos`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-time-from-nanos-v1-1-48c61b15ab4c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJMokmkC/x3MQQqAIBBA0avIrBvQoSK6SrTQGmsWaWhEEN49a
 fkW/7+QOQlnGNULiW/JEkOFaRQsuw0bo6zVQJp6TabDSw5Gn+KBwYaYcej94Ix23FqCWp2JvTz
 /cZpL+QAN+46HYQAAAA==
X-Change-ID: 20260215-time-from-nanos-86f8b10be4a2
To: Boqun Feng <boqun.feng@gmail.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=981; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=hYArApEYjS9b442dFeDpNLqxGdEaVQnTgszVKpt+EOA=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkiiXi7O0c1J6LefLCJ04xAa/hGvoEI5jGyODF
 +LtJ5WOiYGJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIolwAKCRDhuBo+eShj
 d+meD/kB7bzcgnAb7vuwq1Elglbgj1R6Sdi73P/hbzkyY5OIxrY+4TH0+jsCF9k4splrgy9MgcD
 xpXivuwwC9por5VtPza7u9EXNjqnAvCXViWuAsrCVVTkw/tTd5R7EFYjugOBNKI+prnpWTa962Q
 EbNRRqHfWkMZuLzB5iCLt9Ah3eH/ZR1IxYpszbTyTGkpdOeZFvNfPD8HE9Xzle+diuS+t/xyPn2
 mWXyB3ho+aGhSntN8xmJZ6APKNxFYaZcyeHa8zGrKDlqQu6mTpsOIUYJQ9RlzMpNaadliI1tXck
 NkXkbUJ7yzpusXb7Z1MUgQ+W36Nc+2wP+w0TPzCVvs2ai4+2EfyHSlZCx7fMcrNUy5q60DH4q7z
 dNwTZWK0yEg6TOxv9EFJ7YLXsrxJEQrZ3WZX0+y2Pm0qaQNjSKMZ83GzaqBKy8eQQHX1gkRIa0/
 TlISNmQ+Bs5h0YZFwEAB10SxS94WRNnTeGTPq5zDaSxKMbZ0Ltj6P5Un57GVxybn8ApifyRXtSu
 I9fyK55H9sI3Q4MJA16W1FVxoPK5WsqXP4VJ7Vt4Wec6z+TDKdZs7ATFPm058/sgezBmSWX2rV1
 gkKHvOWJc0Y1sUcJj8qmdH6+NiPWnG4oemw+ZCzaooSFc5c3PRNtIeOtQYp8lO9FbPdb0Rbo3JX
 hVI7rNxia8+0D2w==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a method to create a `Delta` from an amount of nanoseconds.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 6ea98dfcd0278..2b096e5a61cda 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -363,6 +363,12 @@ impl Delta {
     /// A span of time equal to zero.
     pub const ZERO: Self = Self { nanos: 0 };
 
+    /// Create a new [`Delta`] from a number of nanoseconds.
+    #[inline]
+    pub const fn from_nanos(nanos: i64) -> Self {
+        Self { nanos }
+    }
+
     /// Create a new [`Delta`] from a number of microseconds.
     ///
     /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260215-time-from-nanos-86f8b10be4a2

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


