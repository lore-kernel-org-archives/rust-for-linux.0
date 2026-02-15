Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDB517B506;
	Sun, 15 Feb 2026 20:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771186235; cv=none; b=CsELfhc/TUDlJfs/N9X+WG743l8dZ5zhSCzqVOsrL9gFtk0d51ZimXesx2KMfEgBU1wEHHEeZRAmUe3A9O478z9XVbX+Spc33EzRr+ifLrukSRZsPgALaI45/J5nUcS3y+uV8i1uPR2/Ay6Bff24K3yZaLYCfv9h+pPumBmqU2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771186235; c=relaxed/simple;
	bh=aWwB4RXiXswh0DbIl35jCLOm/mhyw1DKxXB/kcdstU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATaurdy59jOuHDUoWAD7F9BO1KZgGzM0YQs+vbOCgvIig4mVc/9FfajJ9l6ZM28viCXvqrSbrah20yYRCMHXwkynLohJ6kByufIRc8YqKZsiP3kXadWy1WD1UCSdkNlHsUVI/WTzP3/U/dhDFkBKocQEpMpbFQsRARBI11wz5Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqX1Y4lL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqX1Y4lL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA28C4CEF7;
	Sun, 15 Feb 2026 20:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771186234;
	bh=aWwB4RXiXswh0DbIl35jCLOm/mhyw1DKxXB/kcdstU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qqX1Y4lLNWLJx5hm2aSIGLgXswxseo/pjo6mYUieRxJiVT9HG37ns/Z8lV7lFWvtI
	 LfXqpH71Kpgy2q/qWXR8J0xmI7vzeL0fxW43lANwkmRVRvViQJVt253qzjgdLNJlSD
	 T3WVYxyIaleGdxNAvIyhLhSlwgHq/4y7+sofIIAiy3WQVLEzbzVX7AXUGwzT2ZNSKB
	 4gcHe4W7/u+adsjVQMcjGtm7mStCd5QkRLPnUnzHY2x4zX0fELCh4HIQWaEEUJREsy
	 JlotEn9+QknlmcoZZOX1QAo12vKfzITVS0MAuooJnUpEItcSEfNW6t8B2js9NW4SId
	 AF6uwVYGqVcqw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:10:16 +0100
Subject: [PATCH 2/2] rust: add a wrapper for the `nr_online_nodes` C
 function
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-cpu-helpers-v1-2-fab13d817a5e@kernel.org>
References: <20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org>
In-Reply-To: <20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=aWwB4RXiXswh0DbIl35jCLOm/mhyw1DKxXB/kcdstU0=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkigq9JW7GqCPq2nmWx5vNvNSPOvGzbR0MTu3B
 BukgwCH9uqJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIoKgAKCRDhuBo+eShj
 dySPD/9kThpRe4Iid3JsJKomh+6gLXQY5B0TyF51B5Z3x4uW45Il09a05w6NsFcPQiQdcKjwPxP
 FJpvYTOPYU3n4JNBQc0CocaJ4ZX0j+XSf8LQHMgbGFexN+v3CYuWiG22P2VHml7FZtGbwl0y5wp
 d2Q6tul19RpVO9BKTE63kfTtmY222r+mwMIlxBPQNRndfJbt/dbKqGm5ky5sQG7OPRnkGZlDaC+
 zyDyyaJZnz/R3CGT+T/uErdtxdhZ8JiEHEhpwpwP/2gny5VCdm20p46YHOZiViIjhGfzCdAVKch
 sbkCBZXWRRQFtHf15BpwPUWnM/D5Aazynk3irtzy5QZY96B6Td3RUHgXBKA8hcJRJownO6UOtmq
 37x17n3ysTOraFAYCz4M36PMdroisxBk/ywf29b+v6+5CKQlaDFnidpffOIkiq5iils1gXx5bK4
 W6zN8PlMWgQ85HtHZEFHcRqg+NMHYJrEQ1OEJe9R2NdiZqNLXqD1207XS4dMsWWo/VXxs/YWLvK
 hXYg5njPncXwoAJ5dyAq+XpCpXPmhGAM6LqNCQr4YD5upcuB+wNt6vag3Sonmz8Kj1rF/B3qDB5
 OLC07iHXGp1P6jk8KdT3atn0TXCF3Fo3iDjvUD9w8R7hRlLa4ARDchkRuEbuqFoVibjloPcsjpH
 yKH+RrKlo7OTCDw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This function returns the number of online numa nodes.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/lib.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 7040e105dd3b9..4e9f97f03adf2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -372,3 +372,14 @@ pub fn num_possible_cpus() -> u32 {
     // SAFETY: FFI call with no additional requirements.
     unsafe { bindings::num_possible_cpus() }
 }
+
+/// Returns the number of online numa nodes.
+pub fn num_online_nodes() -> u32 {
+    // NOTE: In some configurations, we can read this variable without an unsafe block.
+    // SAFETY: When numa is enabled, this is a global mutable static. We do as C and just read it,
+    // even though it might race.
+    #[allow(unused_unsafe)]
+    unsafe {
+        bindings::nr_online_nodes
+    }
+}

-- 
2.51.2


