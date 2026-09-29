Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC5152CCE9;
	Tue, 29 Sep 2026 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695135; cv=none; b=tvsZ3TCVYUDRFXLUM7riB9IsQ0GseQQXk42x5rTIh3+TEl7LYsueDfK3VN+7jkgtqidawgZVCc8mJwrHD55c4tkn6h9Uq/JIkN8SVOq/qS2f+yWgfGLKBcaBEAsRTrTxC8R8XZxJThtWnYb67Q15TwMX7bbDRSICify/qIFHMvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695135; c=relaxed/simple;
	bh=oBj5Yu8w2iEWWfxvsxr2NEQAQz2qCEzmexFZus/wUyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pv5bvLUWq4yy1lcUgZBHHAHQpM6VI/lcVU0URYEPHvcMj5TvPORVJAvyZ84///egGtMGwauqjh/Tmftdn30clhinuJHUWSw2XyKR0PRzwqD8L9vuy/HEYu64DZyNynWmQkMy4kw7SZu+pzuaixoQFHs6AP8nJ8pPRxyjBksd/mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeJXqgC1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeJXqgC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2621F000FF;
	Tue, 29 Sep 2026 15:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790695122;
	bh=AJ6Z4727fOuS+yFzADXB/MFpBMOLyk72k+p3cxIjYXI=;
	h=From:Date:Subject:To:Cc;
	b=CeJXqgC1xfYrcS7VdNOfFseDCL+hAwO0OOE9tLkbyY1vf8WaGVoW65pAdgx6bslFZ
	 Hr0rwXz3nXRKU6O2xeTopmxbbUavOAsPXdhZhiIQXUKioAv77lzvBSBCTnIRd7ev9H
	 RaQwpYnXpgCBrgjHjorumOypNtpkUGFIAb/voxTDd/BuDwAAtFy1MsYSmbviqcJtYw
	 jMCFCZ8PbF1EvgE4TlKv8rBhBNmUSPUc73aTeJfZIUzaGkvO/weOisi4mSshnQYHkI
	 JO/Gv7hhERjf8c1UUPznthD8LG5EP7iU6ZLtkoQdu3cMTqyFLeWhdRkgotRjrqL8Wo
	 8hbOv1WaQS0VQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 29 Sep 2026 17:18:24 +0200
Subject: [PATCH v2] rust: alloc: add `NumaNode::id()` accessor
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-numa-node-id-v2-1-fdd2c0a49412@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL/Wu2oC/3WNyw7CIBREf6W5a6+hpCJ11f8wXVS4tvgAAy3RN
 Py7UNcuT2bmzAqBvKEAp2oFT9EE42wGvqtATYMdCY3ODJxxwQSTaJfngNbpEqA8aDoyqRuSGvL
 k5elq3pvu3P84LJcbqbk4SmMyYXb+s/3FuvT+qGONNXLZSMbbVgmuuzt5S4+98yP0KaUvoyoyn
 rsAAAA=
X-Change-ID: 20260608-numa-node-id-85de708d4e8d
To: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=oBj5Yu8w2iEWWfxvsxr2NEQAQz2qCEzmexFZus/wUyk=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqu9bE5OxWjAoXXVEWvkG9MxVgoKVcAtsRL/1kx
 jVIVC1Fff6JAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCarvWxAAKCRD6UCkIqsW9
 0DgGEACGAmDnMRmM0UP7mQIMMlsp4urX7G/ySz1sT6U77GIICNlaj6O/iJzDhJFW2N5OyyUUIgC
 eVIDf7mbwELz1CkXPH3BcVtbEq7MPHu9kIVL7MiyMWxQ9hxbkD54cSSXesf6suVPKIqNux/Jj1e
 6KmjUUr3JrJzRFLxInrM6o8CTtUgRbw7SwGHei8ms/sLBXpuHLL6+ArI8cn/bidmBGtZCymUdie
 OvwSmaIlY74a5nKpGAxmYpFM+jlJgf4Jk37ecq1r33TFVrKCJmuLz4iDrq1LlnkY7fztEWxOPH4
 Sj+JcuL3t3aMYLEkGdJawsMwRRBMvROaLIH0EkhQYaphyqhlAmn2+T/lyiLA0U8RWrPk1scRxOQ
 ZxouoB34InP2svbaSm1F0w/FVtzoxpSK8MjriPXZImCWRLbsAqLyoAbbJz+c7/Zhfp+iYgseSmM
 tBWdJU2/RJoutOMvRkdSg3b9WWHroxJhY16jEQyXykEYWENHwwGu/eodsEzvTOLIYqzypfG1Ayq
 bz1yv1wyqyzW0Touu8wsMLlYMlUdbdW8nflQ+uK72PWkE+l1sQcwLN0rSrCifbiEP/55eCkgQOw
 fUqpxibWi3ADqvLD6bKPC3lTc8DK6mtkI6ADP2g/x2XFAN801MPKFtcKFOYYwbAC5osZsD9rh+E
 YI1xIohkx2S74gw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`NumaNode` wraps an `i32` but offers no way to read it back. Add a
trivial `id()` getter so callers that need to pass the node id to a
C binding can recover the underlying `c_int` without reaching into
the private field.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Rebase on v7.3-rc5.
- Add `#[inline]` attribute (Alice, Gary).
- Link to v1: https://msgid.link/20260608-numa-node-id-v1-1-28480299c62d@kernel.org
---
This will be used by an upcoming change that adds a home node parameter to
the block layer `TagSet::new()` constructor.
---
 rust/kernel/alloc.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 21067bde6860..68d80f3fa6c8 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -130,6 +130,12 @@ pub fn new(node: i32) -> Result<Self> {
         }
         Ok(Self(node))
     }
+
+    /// Returns the raw NUMA node identifier as an `i32`.
+    #[inline]
+    pub fn id(&self) -> i32 {
+        self.0
+    }
 }
 
 /// Specify necessary constant to pass the information to Allocator that the caller doesn't care

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260608-numa-node-id-85de708d4e8d

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


