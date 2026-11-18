Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045080;
	b=tZAxu3608BYapdEcjAepXyCIhSqF3j6kC5Yp/J666xLId4jiPNsiieX0trMlxN2Q+RtI
	 8PxIc9k8QnpMepcjAoCcTcnIzl4HVu80sUx91S5EvT/jrpXBMx8UzH2x013u6QwdqSgF4
	 BgdqL83/qpXrVYav+oA3WHz1va8y7CqMFZVDtA71NGgy2jGw/8dabKdsBTLF/HeeeZLBZ
	 2C2ifyvlxd8xVwy1txIRS9P33uYT3Q0uCTAE1Qt9AzVVuWauPqdGBNq54IljYSGLJW8Ob
	 06Z6COoaKa6dDaEETzpwmIrBD+upwEMgrYN+H9+sJaNNuOytQxY4hfKB33U8HFbwWjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045080;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qIoKrmdClUA5c865x/Ce9F4h+U2S1uTOxXSnJVpEh9U=;
	b=w+TnLCCmCFvRgB544hIhbIPbCWLyU1S3lnZPQHp0nIbIsFhB0FoZDyXiD9b3UVP6viOf
	 ni/qZb4qnBaKrrHwcROWxOe4Yr5pLXIaLX8TCz1CWhUiY47b4WDKj/+Vyz7wPBPfkB60x
	 qfsmYG6B3Rcsv7nX3RQNQRv8anvr4cF92lKSKbPjvla5gNNCoXeWFkxMhK3rxu9LLeYEm
	 C0ZtOtoDCN4XSncwOyI1f00LNsxwu77Kgps/Hnd2MRyhyu16s+5LKqJvnsdPIPKjG2krX
	 KFPpaH4wsvcyMLyZVhZAlwYL7kZYfOgjm9IOZxEb37g5hrtvIQrt6P8N8qv1O9ZWaTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJ1u1P1R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C084B606A337;
	Wed, 18 Nov 2026 23:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJ1u1P1R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6D51F000C4;
	Wed, 18 Nov 2026 23:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795045080;
	bh=qIoKrmdClUA5c865x/Ce9F4h+U2S1uTOxXSnJVpEh9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fJ1u1P1RpUtvgnKu+y+bqQmxIFc+y5bNhaguN89w6lsnyDZHAEK2pwhniW0xxNB48
	 JbQZtXdrz8bOUFnuUKN0qV8GHVSMMWjNm3fGF5X6tSHheltQWKN/BK6BV1R7pdJc+j
	 8p6+yE7SX2jPU83tZm2o0prCI9MdYKminueZ3TjKg4UF16DiXqo8YwxNx5DV8EH+e+
	 AnZf+HTTHK8EgJnLZ+HGbDePwUwAJ13lLeRqVmTf9kw37QtbZDK/20Cmh8FrJscw9b
	 /K87E+jjH/P6efnKLw0inPaqID26Hh2EDaiq2SqPcV43Fr6slnBAlCijJXGike9hP+
	 2OkobLPw2Dtmg==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	lossin@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org,
	boqun@kernel.org,
	bjorn3_gh@protonmail.com,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] rust: pin-init: internal: suppress multiple_bound_locations
Date: Thu, 19 Nov 2026 00:37:03 +0100
Message-ID: <20261118233727.3147222-3-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118233727.3147222-1-dakr@kernel.org>
References: <20261118233727.3147222-1-dakr@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generated __drop_order_check() combines existential lifetime bounds
with inferred field outlives bounds.

For instance, for Tyr's Firmware, this places 'res: 'fw in the generic
parameter list and 'res: 'vm in the where clause, triggering Clippy's
multiple_bound_locations lint at the struct declaration.

Allow this style lint on the generated drop-order check. This preserves
all generated bounds and leaves the lint enabled for user-written code.

Cc: Gary Guo <gary@garyguo.net>
Fixes: 73cf61724648 ("rust: pin-init: internal: pin_data: support existential lifetimes")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/pin-init/internal/src/pin_data.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 08e11128d353..b3c487999270 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -1246,7 +1246,8 @@ fn generate_drop_order_check(dcx: &mut DiagCtxt, info: &StructInfo) -> TokenStre
 
     let struct_span = struct_name.span().resolved_at(Span::mixed_site());
     quote_spanned! {struct_span =>
-        #[allow(non_snake_case, unused)]
+        // Generated bounds can appear both on lifetime parameters and in the where clause.
+        #[allow(non_snake_case, unused, clippy::multiple_bound_locations)]
         fn __drop_order_check #impl_generics_with_field_lt (
             // This must be present so the function can *assume* the implied bounds on the erased
             // struct. For example, if the struct has `&'a T`, Rust will infer `T: 'a`; we still
-- 
2.56.1

