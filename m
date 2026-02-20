Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A502F6927;
	Fri, 20 Feb 2026 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771574806; cv=none; b=Rk0jfuZuOUuenvwbo1NKexwUpVkwGk1MuhnpSvJ+looZ2lF4y0AN/0a7FoNGqkOS8nhk7IPIQBekjQiwRpg5J1hJH5XRcpnjRYIL3Lm57xIozn6z3n7XCKmK52UfFx7Gqzk10uWBxkw7RD6fpSF7upOApEC5LYUMWHX3XqPZbJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771574806; c=relaxed/simple;
	bh=2xTHOlWr31QAPFvE26x1G4TiGMnWNURjAWsjr0nfT3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igQScU2R9q6Xmh4YS1wW2Wji1TWMxkr9MNWKNhxWAZBDFogPnlVxi/Q3MJ76nJ61FDAEAJQDNCgauQgFP2ceZn1cR28oGrfie+zu13PyrVLARiT+CW7DoCmEbPviyWBjZK+HDUSYjShRiOrHfZ0I/E/PdW/NqP6n+v0jJFi52PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HE7yDnNT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HE7yDnNT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F238C116C6;
	Fri, 20 Feb 2026 08:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771574805;
	bh=2xTHOlWr31QAPFvE26x1G4TiGMnWNURjAWsjr0nfT3k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HE7yDnNTVU+DFOt6Re1WUUFyDutFM5ETIUtEZmVGn+Ohk0nkcBe0k/3UsCTaD6vfm
	 gHcDUPtG1N0W5Ts2FAz/lfBFUm3revy0p91IIb+R7at7RhRShLFqKInnteCT2KjAb6
	 g9z+jVpWPsMRjIFYKNQvExYJhWJOz3LYmp+10W5YTChGZvNy41MDOMbDbWXdwYpbJP
	 pOPbAhXQdLi8VgoBZd7b0x8SFg5xhPEB49br3JMFb/iLv8eAsU9dg/9zc60RdVVzE2
	 sGjJ4r5FRbSTUZe6XkhLZONM03xsQF3M3yRzucgUbK95XyooTi2SVAd36pdMQb0Xoj
	 AplI36hHfdq/A==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Feb 2026 09:06:22 +0100
Subject: [PATCH v3 3/3] rust: atomic: update a safety comment in impl of
 `fetch_add`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-atomic-sub-v3-3-e63cbed1d2aa@kernel.org>
References: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org>
In-Reply-To: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org>
To: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=2xTHOlWr31QAPFvE26x1G4TiGMnWNURjAWsjr0nfT3k=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpmBYCYcaOIm5kl9Zip0pZyUcr61FdwwqyYS95F
 l3juD1PfWGJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZgWAgAKCRDhuBo+eShj
 dzHWEADE5I787KaoIw+oHa3aQtYtq48eA71sY7faJMMySw0B3lJyOCPnOrdsUAZDoWvDnpLZDWV
 CRsASmw4rkFAOkVRhE4kn6887uBZZDjg8htXAeRdBOBT+ZcECAuwxEodCByCNrmrvIzxUZZ5hKE
 XxyCHQqH2s00JX84AKgPg4YzaBH8yH2ptpIS5fgmKH7hsGNhtBrbjfeNmModcowTFc3fu5T2Wyk
 JF38E9ihJDJbU6AW7ovv5OqFWvaS7Sc9ZAf2gjQBT0TpGtzid9yJpSbLsqA9SuGM977y+tCkYE8
 7Ikza1yA/Ahhe/J56z36bXc8/W1cOYYfT6hSmLO5rCEsmm9PMMWT6RbVBisqBeT0Ahdlq0SXOB5
 pwZsEEnqx3fM5oEaYaiw6LIBsDSZ/qmFm6jYEqhJrS3+yn0cZbS6UZQfuqs7BIUJ831kaY7g1Bt
 OVMAr1HG7+XFhfwcYGXQUvWQzP50pB5weJlR3IA6aBwfDb8wZZzyVdexdrVIphdSMkqaoW0IIsX
 nXbUQO1n+IMBI+KVglpJu8Fwu+UeCDDmtvsfpshd4+Squ1wlxDZQTxKp9QtSj4FwInkwoL37rhI
 IuHemGO/yJkOQNHqayHgSecv6iYjfNp/WU7TbTZMr4uz3o69CNGbyAOJt+2aom/mN+rXCr8wn3u
 4EHZkZtikfwd1Mg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The safety comment used in the implementation of `fetch_add` could be read
as just saying something it is true without justifying it. Update the
safety comment to include justification.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/atomic/internal.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index a094f704be0ce..67745c44e710b 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -258,7 +258,7 @@ fn add[](a: &AtomicRepr<Self>, v: Self::Delta) {
         /// Atomically updates `*a` to `(*a).wrapping_add(v)`, and returns the value of `*a`
         /// before the update.
         fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) -> Self {
-            // SAFETY: `a.as_ptr()` is valid and properly aligned.
+            // SAFETY: `a.as_ptr()` guarantees the returned pointer is valid and properly aligned.
             unsafe { bindings::#call(v, a.as_ptr().cast()) }
         }
 

-- 
2.51.2


