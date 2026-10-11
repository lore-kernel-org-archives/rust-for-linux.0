Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46344371D15;
	Sun, 11 Oct 2026 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791725963; cv=none; b=JhkIVrDpamc6iwUXGfv/5wGC9tUmbdeMXc8o31HBZf0rd3Mrl0YJMQksQCjl9wY6CjlOBYp2uxJ1/mmyojDEYVwSL7Yen0zcY2Kmn4RUS2FzjmDAf0batd4xKdgTcNi2wzBOJO0cwnc2YIo0kPUytnNXpu+AzmkVWjaXu0E63gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791725963; c=relaxed/simple;
	bh=snVzn1qjOxpDuSQ/Kfc+K6uPCCoWS6E4Np1M0Tc1/wE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cc8PLyQI2wruJCzm4mTZIsHmv79r6zQJOuCfWasYOd0CgZIww/evt+Wcl3LoQxYak8zMxRGft7TRn0lS/f2UVLX8wcBMgI3brtQBOaTyX2iPo5nHnRqx55Hf283qNU/hRO9b78VMYWBNhe1Hdcs8mApxyDhMOr6SymML3zS1PUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPX6vVj3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPX6vVj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A6C1F0089C;
	Sun, 11 Oct 2026 13:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791725961;
	bh=47pZ49V2BYDxvTFXjq7z5WfHC+G+9R4pRHaaWkr7Mcs=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=VPX6vVj3OVbViZhcNb/EqnSIT8W8hjwnQ/c51CO9oqQmGXWqeVPnfVyyvih0+xwGx
	 4NW872tTRsSiLDW1n5fmOQ5VaK/doPnGRx2lkLXLlco0TQukCzsPp0xksty7O6R9gC
	 EoHUfJ0aO4dHme4Ka6WS5k9k3IzWTz4PanJmA3glb2ktBwohZX0+WMxpj3gbyx8ADG
	 crOVK1YB+gSOk1WJa0dYPG9dG8li+jrSwukeRBeGDsb3bE/Y+n3Oam2t53LAmoamYn
	 /27Hp5n8anbO4uq0+dnjTZuBRkuMAhvix99rEjhnXNbiQSVtY6rfx6SuOL/GtEALCp
	 mwnBPbUkPQTGQ==
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
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: pin-init: internal: suppress `explicit_outlives_requirements`
Date: Sun, 11 Oct 2026 14:39:04 +0100
Message-ID: <20261011133904.600785-1-gary@kernel.org>
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

`#[pin_data]` inserts outlive bounds between lifetimes to allow closure
callbacks to rely on their relationship. In some cases, these relations are
implied by fields, and Rust generates `explicit_outlives_requirements`
allow-by-default lint, which is turned out by kernel as part of
rust-2018-idioms lint group.

As `#[pin_data]` is a proc macro and it cannot know if the bounds are
already implied, suppress such lints for generated code.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index dbf9084bfd22..08e11128d353 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -1792,13 +1792,13 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         #[doc = #docs]
         // Allow `non_snake_case` since the same warning will be emitted on
         // the struct definition.
-        #[allow(dead_code, non_snake_case)]
+        #[allow(dead_code, non_snake_case, explicit_outlives_requirements)]
         #[doc(hidden)]
         #projection_lt_def
 
         // Allow `non_snake_case` since the same warning will be emitted on
         // the struct definition.
-        #[allow(dead_code, non_snake_case)]
+        #[allow(dead_code, non_snake_case, explicit_outlives_requirements)]
         #[doc(hidden)]
         #projection_ref_lt_def
 
@@ -2000,7 +2000,7 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
     quote! {
         // We declare this struct which will host all of the projection function for our type.
         #[doc(hidden)]
-        #[allow(non_snake_case)]
+        #[allow(non_snake_case, explicit_outlives_requirements)]
         #vis struct __PinDataLt #generics_with_field_lt
             #whr_with_field_lt
         {

base-commit: 73cf61724648ad57dd5664a0e2915e20fd304650
-- 
2.54.0

