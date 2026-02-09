Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA8F36BCE2;
	Mon,  9 Feb 2026 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647933; cv=none; b=D6159vZS5t6nhuyTcLGwiMTd5Od2CixP5M+cgUkAN8xnltg1gdQMsPxTHDUSDA979e9ukpeXR8uK16pu/QuNYg/PHouzJ1L6Lmw3njT1MfN5ALK51k3CK/nUxRm/2b3ZIBIDexziPe4PVUW1tS9eVZ5kEArSoW3RqXaHqyfaROo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647933; c=relaxed/simple;
	bh=PrcApbk7BCNSPsQwnef2I6IdaZ2i07Y2ln8fzlwV9sQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJo40/Fp2hmRhBdR3UrFV7A/RsL75Upz255wj4/CT9nR7TGsx6/zQkcJrQrtBV/UFXqK+BixQ8jngwu23L10/UyNxHCN1GGORxuQGXxcNDQ3IIsPsIRl5EmppwrwUClqyPedMCWOsTsoV8nnyWnOM0ZRe0C61kecMvAUA88h/v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgUYcmvE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgUYcmvE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F823C19422;
	Mon,  9 Feb 2026 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647933;
	bh=PrcApbk7BCNSPsQwnef2I6IdaZ2i07Y2ln8fzlwV9sQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MgUYcmvEUQ9An1F2rMEYfu+G6E7UYw7TRPeZBzGLNjCdhoccnuiCKATj05xiNBIa5
	 WW2426/lh800d7CPoGN7MiYWSKlcZbPxcVOUrE18x56MH2iZ21Pz55+lqdDDsaWTCj
	 djG0guEOEV7aSvbwvUkJvz7AM7lJv0ioRrrY86rkFuNoK2Z5nSuN5nMJrkky1Kz5Ty
	 01oT52B0DvivieFrqElBXFDR5fOB1rpoleTMhAC8zZM8oqL81S3qez8nBVEgR7wHin
	 HdNgoc3Sh59DHy47BYeSBYtXUQEsmpjB799aAYCZuF3sI5CcWKy1/3JTmUOq4fZEG9
	 XYJYElhzXAdNQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 09 Feb 2026 15:38:08 +0100
Subject: [PATCH v3 03/12] rust: xarray: add `contains_index` method
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
In-Reply-To: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=PrcApbk7BCNSPsQwnef2I6IdaZ2i07Y2ln8fzlwV9sQ=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpifFXwEdzwCsucoKq2KE54BrulAwrQmBpO4yTF
 HcVvqk8u0uJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYnxVwAKCRDhuBo+eShj
 d3PQD/oDY7iFQvP7waZGcxclTVtbgYcbDsPw2BXqzs4G4r0nEmsZ/bc3z3fctpmk5Eu4QBQBSmz
 GquJbOx7DS+XXhyisG/lSfDSZTcjM3B7djaHs6kv2X2GpCaUTA1D7we6YKiCLNQKKWSz8rPBedH
 AS0WmyqMBJGsnjNcTB6ho2HB80mJuc87vpqgnong594U46aZH98gBMZjCR3WL+eFNZlbl2hFTQZ
 Yxi8R/7glxzu6qhJhL1OVS2sNimeBM2TsYuj5g0a8QJCrRnNqOJum1BMAeieTDDW0j+3gnn1IOp
 k4kdrK3jzQ6DLIQiKbLvV/dsCJ1qX8+wny8gwKWuB4f19wSKV55RUPzmUnlH/qMQdKK0ucjZEH0
 yXg1X/DtCzjDdp4cTqS90gIquSlMVVcyZurN06hK/O8WdYHh/crxpDtb7Wtq3HHrsxnMTppHeK+
 H5iFzc0pNaUVCFYuMEDzDv3EnVGt2uGtkQE37lz8ttk2jGr2WdhUnR0ARFRLItdTm5SXRml0ayX
 cwBs5jBKuS70hr93mo9OvR/zboRwQUqq18WdAk5owQSaAEiwN0H5I49xml/jOydbTFc5S1udD5D
 QbYxPkEFxloK1KgcD15RJX98bVmLwNWlICo9n9iBiD+TPmMsnMIkqWVNHgThONOrkFG1q6/6SO/
 7naUgNlrGsokBFA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a convenience method `contains_index` to check whether an element
exists at a given index in the XArray. This method provides a more
ergonomic API compared to calling `get` and checking for `Some`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index d9762c6bef19c..ede48b5e1dba3 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -218,6 +218,27 @@ fn load<F, U>(&self, index: usize, f: F) -> Option<U>
         Some(f(ptr))
     }
 
+    /// Checks if the XArray contains an element at the specified index.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{alloc::{flags::GFP_KERNEL, kbox::KBox}, xarray::{AllocKind, XArray}};
+    /// let xa = KBox::pin_init(XArray::new(AllocKind::Alloc), GFP_KERNEL)?;
+    ///
+    /// let mut guard = xa.lock();
+    /// assert_eq!(guard.contains_index(42), false);
+    ///
+    /// guard.store(42, KBox::new(0u32, GFP_KERNEL)?, GFP_KERNEL)?;
+    ///
+    /// assert_eq!(guard.contains_index(42), true);
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn contains_index(&self, index: usize) -> bool {
+        self.get(index).is_some()
+    }
+
     /// Provides a reference to the element at the given index.
     pub fn get(&self, index: usize) -> Option<T::Borrowed<'_>> {
         self.load(index, |ptr| {

-- 
2.51.2


