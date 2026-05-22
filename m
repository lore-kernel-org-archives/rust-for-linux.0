Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E80047DF9D;
	Fri, 22 May 2026 17:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779469987; cv=none; b=Z86afOB1hlg+w9XkYdPAshZ4NArxp7FNbaX/BwEqjg1alrKAHpEvElhE+AvPhzTQw+dzyBlwmwfMv3KGlTKhCnmMc3MP9QCR6kcwJlVp+jqIBZu2S37nMJWP+uhH7XAw/5rR8TkJCpkA1NiDHofMh3rTNzbqKmc4pJ4CpCip8Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779469987; c=relaxed/simple;
	bh=Nhy3JJ2+K5iB9IH5eVa3djc247xyKWGSx7pz3YeeHEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRWKhtzod1Q/G4zt2WHS9sUVKp15lKqAGe1M9Cem2SrhSVR6ZpsA4u+MWh8NYRwdAX5dnczuUMb3GM3YxQh0llxszofHF0Jk1SarpCr0bfb686pFwX0GbcvaEWjdwV9JomUdHWB8u1ecN+z7qjyI+Y6ZosTgDx/btD0Nm8BKc38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjSY2arL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjSY2arL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCC81F000E9;
	Fri, 22 May 2026 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779469986;
	bh=du1sgdEdfbbUsPXXtvPNFg4wpVTG1J3WsnClKpPTu5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mjSY2arLKdCn4XvqLyEP0YheVm9pFfCcKNgXUe3z0x+br5/PP3qs9Jp484BfkhLdV
	 fOwqqg9JpwRm8ViBV7sgD/q3NIRBrsDA+/55v9Bwzq1V10eHPH8L276B1Fnb/PBVJ/
	 2DN/IkLmdzWDM5hJ/Ycd3baXF282IpKWPQn9VpCLrN+XlBQhXcd83WzAY5/vdNYkLc
	 b4Fi7OMlRiaPY3tp0njj8SRe6/XZI7hamlcsy/A+sbeaNMh9v4iIhtSUGLc7QRqMK/
	 FepE/qGNfQynyUrAD3aTtsw+ETJCEBwqwUcrgfNLubhO45rBdQFUA+XtgZ3S1uZJbU
	 ebCIfQlaSOb/Q==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 22 May 2026 19:12:47 +0200
Subject: [PATCH 2/6] rust: binder: transmute transaction data
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-binder-strict-provenance-v1-2-3d6e9406e864@kernel.org>
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
In-Reply-To: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=tamird@kernel.org;
 h=from:subject:message-id; bh=Nhy3JJ2+K5iB9IH5eVa3djc247xyKWGSx7pz3YeeHEE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFkCfdMve/2Zv9nWXaYgasu0zyeVgvKYldKX6kkmygpbh
 h+SulnbMZGFQYyLwVJMkSVR9NDe9NTbe2Qz3x2HmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXQMdIwZuDgFYKqPezD8r85gUla6MMNJ13DhGkbB69Ws09bWzDwYduRBN6th7NI//YwMuxZIinD
 euxZ1w3ne9ZNuW31OCfJqZ1i6+xU/ffZaYcspBgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

`BinderTransactionData` is a transparent wrapper around
`binder_transaction_data`. Use a transmute to view the transaction data in
`BinderTransactionDataSecctx` through that wrapper, matching the safety
argument at the conversion site and avoiding the raw pointer round trip.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 drivers/android/binder/defs.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/android/binder/defs.rs b/drivers/android/binder/defs.rs
index 33f51b4139c7..fd0ef3f9ebd1 100644
--- a/drivers/android/binder/defs.rs
+++ b/drivers/android/binder/defs.rs
@@ -164,10 +164,7 @@ impl BinderTransactionDataSecctx {
     /// View the inner data as wrapped in `BinderTransactionData`.
     pub(crate) fn tr_data(&mut self) -> &mut BinderTransactionData {
         // SAFETY: Transparent wrapper is safe to transmute.
-        unsafe {
-            &mut *(&mut self.transaction_data as *mut uapi::binder_transaction_data
-                as *mut BinderTransactionData)
-        }
+        unsafe { core::mem::transmute(&mut self.transaction_data) }
     }
 }
 

-- 
2.54.0

