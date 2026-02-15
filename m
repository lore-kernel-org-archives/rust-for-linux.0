Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38C42690C0;
	Sun, 15 Feb 2026 20:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771186463; cv=none; b=cV/mXBmlli6tIVJzk2MxqMQeU5stGQ/U5QY39T+Jas8hgiFxCj8d1QlACtSwvikhUZUlXot3b4pDVaI7Wf7RZSz1SrfRE8dLZAqLsljX0lEayQF6riVUqX6WSkqjYfIb3f0sXZHretVl/KBisLLApLhaigZrdyCI4HesTHiUAqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771186463; c=relaxed/simple;
	bh=bPtb8YE+uve5c+5cjqya4PEMcSWM8XewlKSTR4Ps1b8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hqak3BSnxHT+iZYvBJFC1/4GhpbE8vMaWvu+iE5/5iHe6i+Yk6W5+Qi47L+qGeRWjHkDw2+56mH38UWODM/OngmNNPSthg7Bog/NbSKzSX5IYQV7bqEmah/zf4uozRX3i2f2YCuTxdsX1WOoYbe+5/6DVXAHGL7rsOOhrGdjVKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfaI8d1F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfaI8d1F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22C9C2BC86;
	Sun, 15 Feb 2026 20:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771186463;
	bh=bPtb8YE+uve5c+5cjqya4PEMcSWM8XewlKSTR4Ps1b8=;
	h=From:Date:Subject:To:Cc:From;
	b=kfaI8d1FPMEzHaVv0do5Wpyph8pnMAgFz/Sty44OyGe00yHne4aA1ijrJLN/lpi1x
	 iikzF3wO18UY1GEy+/rbjve2uJKd/zARCY7Wx+4PbcI6d+CYeOHiDQi5Dd9iO2PcQw
	 foPS99IJ2q0kI5g7Mc0DGqLfh2uUxpnpN8LQqPvTMrW5XR1JUQCOq2cAdxpxUIyfKJ
	 0Hwtnnb7cp651LWLGgroGK4Z7gvum32uJnTlkPDib/tg2MUIoRLJ0E/VeaTFSBfDne
	 CRIBsB+Xsk+iTiL/Q3KgQtT6zCD2x14wD5Cj1Y/jGocDJwXotGgkpW9nCs1cefTUlz
	 bp8A/cF3xgn8w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:14:05 +0100
Subject: [PATCH] rust: time: implement `Display` for `Delta`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-time-delta-display-v1-1-bdd2d6e98ebf@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAwpkmkC/x3MSwqAMAwA0auUrA3UgFa8irgoJmrAT2lFFPHuF
 pdvMfNAkqiSoDUPRDk16b5llIWBYfbbJKicDWSptlRWeOgqyLIcHllTWPyN7CyJc03DxJDDEGX
 U6592/ft+DvcvPmQAAAA=
X-Change-ID: 20260215-time-delta-display-d702e7788d2d
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=850; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=bPtb8YE+uve5c+5cjqya4PEMcSWM8XewlKSTR4Ps1b8=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkikNhnFqe6SM91qwG1xdDkNjB/m4H99qHWXNZ
 hbk9TcIFMyJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIpDQAKCRDhuBo+eShj
 d3nqD/oCwM+g+iEbjg0VTALDHWBG0Gxfz0vKg+L6kP2IoK31X6o+Sw4yNSjoGt1NZJxVklCzNFV
 6UW/3QEeA/2E4ppDDOCXnO1I23h2dYVanv46jQTuPv9ojtmFl2Cz+Fv6hMlNGXlYnGj4rMp9q0V
 Fme2g5LzucCKzwwaHoqPaIdMTVTmVEy0wq06yteKCEje/u0lMuzYcLGnvVYFef9oI8smJZ2u74k
 dIMRB6F5miuUURPgA1irZZ+NZWNVwpTdwZn41RZ56N25jNKqd9FaAxYIoGvrO68X1Whrx9sjLaF
 xywzhteJagf5Y0hK50TaYnrx7sPqXG8EvbLQit2Qd1C/5OZNXdW6DlwBTLV14VT9gzVeuGmtBwP
 +IaGvstcK/90aZppfLip4pUgbsALJ/Dqy2WpO3fu3pn7zRspzLsyer7jTgEKOGS8fhBpR/yNmwp
 P2pXHSeCyaSfplLDVzhkp/d0Uy5e1bhB3rtob5ajj3lVcXUXn2zL+sitQCv/ejueCAqMpYNXIA3
 +ioaREoXD3eNn4EXUb8AClCtCGRqIGJahn0LcfeQn1adzwe8RECQD3dN7fDQiwd/PL41BCnXW2Q
 eQO6IyLToXD6zyZ8lHmccBaqaHJANluIwDWNfYFLUovfy6n/l1hkMbGXXut26h8Ss6/2A9vSBOZ
 c9MXH/46B+idzVQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement the `Display` trait for `Delta` so that it can be displayed by a
formatter.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 6ea98dfcd0278..e18fd17f38c5a 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -474,3 +474,9 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
         }
     }
 }
+
+impl kernel::fmt::Display for Delta {
+    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
+        f.write_fmt(kernel::prelude::fmt!("{}", self.as_nanos()))
+    }
+}

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260215-time-delta-display-d702e7788d2d

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


