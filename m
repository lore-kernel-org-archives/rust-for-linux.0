Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B831352F;
	Fri,  6 Feb 2026 21:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412296; cv=none; b=LdQBme4gdpNRixI1XskuOqonCFTEU+FnNJ5YS+lXxYtL4VF8AR0B0+x7funzCaCFL7niKZOO/WUMk5adTqaTYWDSz4KhMjlnKw3IHyzNsL9gCYXChpTCm+s1tkr8CaPvRiVkaQfKI0X+4PhFICFk5/eR4IC/wdbGDpl1qNDl6/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412296; c=relaxed/simple;
	bh=PrcApbk7BCNSPsQwnef2I6IdaZ2i07Y2ln8fzlwV9sQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cV/tsSjP6jauulWv5E8ePYT8o64dqje4gz4ooUO91tRUXhclnwbk1mc6+8uRdCBi9CFlKW5EWld8p4QlSNOE/sDOAIofvUZ9wWGA6EAlSGBWiHugmWA9W52MjPjtTYpeua8IyyswQ0VjSlnfuexnl8pS2i2qU/HGbaSTdkCrTaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQqlC174; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQqlC174"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3089EC16AAE;
	Fri,  6 Feb 2026 21:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770412295;
	bh=PrcApbk7BCNSPsQwnef2I6IdaZ2i07Y2ln8fzlwV9sQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HQqlC174WwKjwtjLP1BUTMoxieROheLgxdft+OGqysEcip0EvNQ1MMicLZBsg6Ygl
	 0iHMxOT9CHUgO55F77L5XNmNSzdo81rEEkzGE8xd5XuR6dcrtxvo41iJmz0jZbvVi/
	 /FmqFiqb4mU+1saT1ogpOGPmK9eg+Wcu12rbxKwb/QuDF6Z0bdlVNhtRICOa91zibI
	 AIIEZ1BL3GbaC1kvTZ2uVx1GtrsSirEUpeT+AWr9yXPjeC/cU67gaWt6VMSh06H69b
	 KgYPNteuFvt6eYQY5iRbMOTdIXUD5GbtjQlWL4kd1XifwIFIYNRcae9LeIdBkEE6kW
	 JUi5yQkVOrlvw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 06 Feb 2026 22:10:49 +0100
Subject: [PATCH v2 03/11] rust: xarray: add `contains_index` method
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-xarray-entry-send-v2-3-91c41673fd30@kernel.org>
References: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
In-Reply-To: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
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
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBphljjynnLtfrU8Iiz9Gm5FPAFGgN+NLu89L3zu
 FUdyPDQUsCJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYZY4wAKCRDhuBo+eShj
 d1WtD/0dSV1caS9hKFf19rq5n4cibJ7yErP+DuvjTNfhG+cx9BGtQf/Ivg9WhmB6dKF1/Ff/ZNE
 fD7LuuYM708jMZ/Ag3QLJ6bZhYFCBVFMXU7uc1O6puBKeYx/LAuPoocpO5LcFPP/bt1ZEw8WUF0
 m7zzmtHnXb+6ujkjd2gl6hBhGgSgOGhvdJyYX3ULUUkVXe8vN5TpwXq/IlUw+Os6dWO0Z8QNI9L
 49N/R7i9NuiZ19l2L7xKVsv9nEZmAAA6gJmAdAoeINuz0Q+e9PxyqMi9Ew1aBErPXVPOxMOchq7
 4ohQLw/lItGvp12xabHAIbxlKUV9FMDxccovc/mki8TucfkGlQtmlMhLwGS+iQtmMw6havc9ndR
 Pf5qTpoqj69CNxpXyvsSUWI+xc49m7weMQ8a5zeIO/g2XlBsFrLQwnVtrhsHGKtxqg4Qo02NclV
 CmO6qLnLmsf4hNzCsYGRhK5mdwew7WujEbd5hlufx+YNqZ6a8kGCXRhAvh0c2OPAgDXd0RCHtnG
 Qy4kA65FWIqUx5woBVUWuCup53T3cNzSUyNmaXvwWMoXZyaDn7aJaQ+HLJyHHR3bZ7tqvodt018
 KGZAdtO2i563HF4hHXqFw6msci9S/h4ojJZJCwvUaxYItpXWU1zcyOWq3rFcLZwLhGoZnQSJbel
 nenKo4yG1+Wh9Yw==
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


