Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012299;
	b=Mc7jCMY4od69EuME7UypL2ZCrsjJCnHb3rdgUP+rWSDOUngEdiGsvfgxSlfwPpw8ljfS
	 E0QOWTZbpoHNF2gkqf77wWm/HAKtxTVYfOHWiSTMEtPDIsCzgfBrJ14beLVHplvdabdW1
	 CyBZXPVjQ6DeZA425mSO9xWhn22/gd40+e+mdZIX5Prxx82Uybcw10ii+4+HwgiRc1pmW
	 nu2YoyH4ssLulbPrxDwlKSsKYDq5Kis871K7yf/bDHPpxZW9070aV8+K2bLiFrtWNPfvy
	 QXGvCh85dhETcNQR3KH6TkKBtlLDFc2J8TEroshnOfbotkxVTF6XG799ILwIBR/HC5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012299;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=sNrgUb2+kOIP5RtEqFOBFqWj/Ks95fM/CbzhImm3lc8=;
	b=l4aD/dNnD0q94z8VmrbhwaAyHZfL2bhxpTamaQbdE9uQim0AKtyOm+FJqeoneLZXJmOl
	 kazNNOOw/Z59hnfFx4ctEb+KEz+21UCkY/4/slyj8vVQdTLOhsrYPg9I5AXl3v3zEtosm
	 /DwnIccRVKBEYwvhSd30VNxagKzZBUEvF1ymdsJ/70ISpmDUxFoLYhP8XJnIEOsJ/wgU3
	 kY+Tm1nzhQhZOFq1yNOaEudgRNFiFxZ8bGA+UpFgaIC+cTIO4dLUTirDr2EUM+SJgzu39
	 geH72wHrkFd9OJQn5r7J3B5Vv6ukOuQj2YOmmTMbehGRvns1ztUoifFMviE1HwkOxQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCwNq2jT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9193C60A2602;
	Wed, 18 Nov 2026 14:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCwNq2jT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A208A1F000C7;
	Wed, 18 Nov 2026 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012299;
	bh=sNrgUb2+kOIP5RtEqFOBFqWj/Ks95fM/CbzhImm3lc8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SCwNq2jTJYp+3L4rFiuWb4h8fwH64jg0dQEbE3QsVaZ+0zGroszCzKVRus4JaOwzn
	 fVJs+KoyhMHKhhlONdokkXaWOXZoOV+Cp3/UdSSfbfZw+Fif0VipsugA9DjL5eebhJ
	 IkMj7heOwz8iXEqYpzei6aPH7X+MkhH4oAnA7evfPYKrr9nynVUV486B2FTuIm8siB
	 e9KpRgaiMPL4BgM8I+V6TG8wuyckUN2Gm3g8DX5fbJsgjWa10myly6VyHZk8FJD44V
	 2QvbyAsGcej2151VTfHoKMCN0zkjv7QqNeSjv/Xnjr7lZwIg4dnEdSkpObAbNbDOkY
	 SvOoCS2nRXRcw==
From: Gary Guo <gary@kernel.org>
Date: Wed, 18 Nov 2026 14:31:22 +0000
Subject: [PATCH 3/3] rust: pin-init: internal: hide `HasPinData` impl
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-dev-project-vis-v1-3-2a5f433bb516@garyguo.net>
References: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net>
In-Reply-To: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795012287; l=1052;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=HKVzZknJHNulxgGXD/v3bNlpQt5n3b0YntPGYdJBVMo=;
 b=H8hlyEDza0ywKHvNp1WsupZ2Qgc7s2DwIcjqfov8RLPlJ63oG+Ir4gQ4EiHzgaVw1ABkYmEPs
 4+EkmWySwf8CD0qJUiW5EgfsE8AgMAavsDvbRTBSKr9Jm2rDdBn5dGA
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=

From: Gary Guo <gary@garyguo.net>

`HasPinData` is an implementation detail of pin-init to communicate from
`#[pin_data]` macro to `pin_init!()` macro on how to initialize the struct.
Thus, `HasPinData` is marked as `#[doc(hidden)]`; however, Rustdoc still
renders the impl. Thus, also mark impl as `#[doc(hidden)]`

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index bcbdf33f65ae..df1de7b27e1b 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -2081,6 +2081,7 @@ impl #impl_generics __ThePinData #ty_generics
 
         // SAFETY: We have added the correct projection functions above to `__ThePinData` and
         // we also use the least restrictive generics possible.
+        #[doc(hidden)]
         unsafe impl #impl_generics ::pin_init::__internal::HasPinData for #struct_name #ty_generics
             #whr
         {

-- 
2.54.0

