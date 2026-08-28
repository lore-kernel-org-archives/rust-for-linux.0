Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E29371880;
	Fri, 28 Aug 2026 15:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932256; cv=none; b=QIzdIJqoTeoBMjmG0y6xdgorc0bOj/E75jgm2PJXDe/FfrAr6mqr3PsTkKff88K88nC+gguilX4vvWq0hvX9U/H//U68GKNGknCOWgEN49I/09P46PlXeplppxUzfuWsEQoBCutCPbpc3+WaDY6ZwGPrYh4f/2h+rVB+dZDh7gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932256; c=relaxed/simple;
	bh=P7ZCLAaXAG3/NyRXbAuz8A+tupicIM33n0HuPH/y48E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KG1MderOcZh+iVcavVy9hNLnwH8PcFzXnsqPzSlkhTpBfGMeulHACONu6uIStMRTbGt8chGmiElsvkV9uWkoVRcJ+VoJafUGrT32qutrTFqzwrItnx9KL2ifPZTllRDRLAO7DWUXThsDikbm+jRd0eTUyVUwNOoTpS3rHrG8EcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxofOtDE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxofOtDE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E171F000E9;
	Fri, 28 Aug 2026 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787932252;
	bh=FTvxU32r/rdXNTSlsj0pEx05Mjg1DOVuBW2u62RxZjE=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=NxofOtDE3cEFclURMvg3pZrO5hXJGCvNAFhH2BmfQRBWwib6Ywkkxru8QuLghGtJQ
	 2h4AMLCvjjm/mbgKdiWzaTz7rRMI0Q4wmGCFAztKb8Wvjjr/IiaJjN9E7Cne6ebej5
	 g4JB6cfmvZ/1BEuHbcQ2zu8VkjAcylTrzmegTuspW2CjsGrbyqFWkyxIEuqWmuefbo
	 SbM7D950PVjVvYKOETV9qlRSmYIG9VeisThuSu3216vPaoCEKV2cdiIXNGVKAl6vA3
	 YrbvihWNzCyg1RKCa+VyH0APy3/yu2ACtHAsRy1tXXaheRMYDJDyNOllOMSleoGsOR
	 Dt6Xiw0nTsWrw==
From: Gary Guo <gary@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: Mohamad Alsadhan <mo@sdhn.cc>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: pin-init: use irrefutable pattern for `stack_pin_init`
Date: Fri, 28 Aug 2026 16:50:33 +0100
Message-ID: <20260828155033.2101924-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

In Rust 1.100.0, `Infallible` will become an alias of `!`. The let
binding in `stack_pin_init` will thus become unreachable and produce a
"unreachable expression" warning for subsequent match, and thus will fail
`-Dwarnings` build. For this macro, all we need to know is that the error
type is uninhabited, so replace this with a irrefutable pattern instead.

Reported-by: Mohamad Alsadhan <mo@sdhn.cc>
Closes: https://github.com/Rust-for-Linux/pin-init/pull/171
Signed-off-by: Gary Guo <gary@garyguo.net>
---
Miguel, given that we're very early in the cycle and this effect
upcoming nightly compiler, I'd prefer to route this via rust-fixes
instead of pin-init-next. Thanks.
---
 rust/pin-init/src/lib.rs | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 7600cdbbbf98..f1463be9479d 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -490,13 +490,7 @@ macro_rules! stack_pin_init {
     (let $var:ident $(: $t:ty)? = $val:expr) => {
         let val = $val;
         let mut $var = ::core::pin::pin!($crate::__internal::StackInit$(::<$t>)?::uninit());
-        let mut $var = match $crate::__internal::StackInit::init($var, val) {
-            Ok(res) => res,
-            Err(x) => {
-                let x: ::core::convert::Infallible = x;
-                match x {}
-            }
-        };
+        let Ok(mut $var) = $crate::__internal::StackInit::init($var, val);
     };
 }
 

base-commit: d8aa025c1cd5908eb454e48af031370f23d3c559
-- 
2.54.0

