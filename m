Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7952A10785;
	Thu, 12 Feb 2026 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770912177; cv=none; b=MkncXqvCczrGOIpue1i7iYaqmABVCwgsPWVQo/t6G4VDmmeIgoKOF/OK7KT6qw/t2ve/7eqNq7yEUGTPfkTOvvMuN+E7brWvNzAJZgVc02KnlZ7wn30fXy31zpDZ8Ryg5Mg87pLLqsCdyxRjUgtofXdI7dfh6ZsjcCkKOCbQFRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770912177; c=relaxed/simple;
	bh=XC3p1P7BMkYjsOT5tZwJX1LGomJSeE52sTQgFkz5rC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G0JLOjjFjpKsF8yO19Qt8kMRvtB4u5s6HfKrEQVvqpumOA4TXn/xmvKw68Fkoa65uPqeJ7KRmuUq/b+9ZURo58vhCyg37rMr00fCXfubv8Mbtn6PJxugnGIIIecgO/mEgPCyupWN6eK1SB3FdX9dM+EdBM4bEsKGfr6efWGQBJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aht+YxIV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aht+YxIV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D047BC4CEF7;
	Thu, 12 Feb 2026 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770912177;
	bh=XC3p1P7BMkYjsOT5tZwJX1LGomJSeE52sTQgFkz5rC4=;
	h=From:Date:Subject:To:Cc:From;
	b=Aht+YxIVvS/BIGkhsJTyn7N7HKoVprlRAtIAhjVII+hB7kTOBdRoDIjlH5RfC9CGL
	 4Xoe5+Rdt+L4bHnREI6jPMi/DresP0tJs2z3QQ0vj1xnWjtAvUh9jAFlMPlccOiFPP
	 zRRnr9Ytw/0j4CQxkHhcKxU+8zggav7Quh4RBqq2IwsoqGjrQsuznL4f02qcNTzQhR
	 HIkXEgRhbw0CDDMYihobxlMbDZHY00bwtkPF0XK7EIjjyVSVdqEI4u0iLBXn9fgao9
	 o4VKnJCYeLsctEJL4/+em0JEpRC/6kaYOgTMcaCjIOnYCS85C7Nm0OWhqka+mDRk5Q
	 0HtTTLFhd6ezA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 12 Feb 2026 17:02:24 +0100
Subject: [PATCH] rust: impl_flags: add method to return underlying integer
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-impl-flags-inner-v1-1-1e2edc96e470@kernel.org>
X-B4-Tracking: v=1; b=H4sIAI/5jWkC/x3MQQqAIBBA0avIrBvQIbK6SrQoG22gLBQiiO6et
 HyL/x/InIQz9OqBxJdkOWKBqRS4dYqBUZZiIE2NJkMo+7mh36aQUWLkhK4xna1nsrNpoWRnYi/
 3vxzG9/0ApIh+uGIAAAA=
X-Change-ID: 20260212-impl-flags-inner-c61974b27b18
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=XC3p1P7BMkYjsOT5tZwJX1LGomJSeE52sTQgFkz5rC4=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpjfmTLrsc3dOnM3K+ZiNNJTiBF4DYgKc5bF70f
 1Ufz1BZu8iJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaY35kwAKCRDhuBo+eShj
 d8D9EADA54G6Jl8u1pSCYR7SUV/yEkxRP4ffvKtr2ZQSBRy5cFGrh7adZCDZkqf5Q1nTPHlAKgP
 EDzcwZLoDw3KgXje0JFj2u6M/zI7NrmgKJTgXXoTolqKnynpR4QUPMzIGR7QFW9xl7O//zOeVqW
 mVEY3RbiJ46r8E+6vLCLl3BaSJp6FoUtuZZ9fMt6PgNJH3gl2/G5+qNhiiQ2z2qRC9rSzWtXmmv
 H6zHSmnyNdTi9WANZ7AleTORPRuo8uhNgZrOQzK+iE/DTzkG5zEyUnHs28PpSutfRdpDGbbCmrA
 FKxyoyh6bkIE4oPWIQ6ZzePiEv3PzUQFkjneV8E6qSHR0sJWueZrHB7m4WqhMe+iAOZGS3wP2jP
 uF3cfwKF89pYhDQFn36HGGG6GrnyMvfNsK3G4fPcIgmTb9d8Rb1I1KCXWDMvJP8HLc6LbWkLyQU
 G4Zu3AMXFhrfXxzT/bRDFfxT4QpMRzeweQ5Jjy4IpSlRgRENtWnPg3n/qqFZn1zeTd0exl2w45X
 jC8Q2qZzJNrKW5l7r7B/EgSmLnpx80SzDwo7nbacuJCIyF6NHIeyDfYnWt4NtAVhnbmHB05t3f4
 qJ/k2vMuqi5Mu4Pmgjv5kojh6u1bz/84Ouhc0BRVNKlcQAzC4KkLJqJPg7zFDTftSmIoFiC75mL
 nfgNs+u1ykucK3Q==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a method to return the underlying integer used for flags. This is
useful when using the flags with C APIs.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/impl_flags.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index e2bd7639da12e..951598497de1d 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -267,6 +267,12 @@ pub fn contains_any(self, flags: $flags) -> bool {
             pub fn contains_all(self, flags: $flags) -> bool {
                 (self.0 & flags.0) == flags.0
             }
+
+            /// Return a copy of the inner representation of the flags.
+            #[inline]
+            pub fn into_inner(self) -> $ty {
+                self.0
+            }
         }
     };
 }

---
base-commit: b8d687c7eeb52d0353ac27c4f71594a2e6aa365f
change-id: 20260212-impl-flags-inner-c61974b27b18

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


