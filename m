Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950443CBE75;
	Thu,  4 Jun 2026 20:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603203; cv=none; b=jGGV6ErFVAFpK4uWxpV26ltjV5nbnPl0xtji65qQVEfXO2emyFIhXdvCks8Ypx4Dm4fOH9/xBzU1qGxXR1J1O9JQ3QSBuENeOf1hfLqugqZc1Zcs4AYJu/h3r60AZtQx8OQvpS9GokxLmcGdfcQUhr9TfTO3VD6Yi3TzQ1B1r+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603203; c=relaxed/simple;
	bh=l0CwU5Ulb0y9mTSS9KkZDum+7qeUfx4uMpAmUgVECbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LqlTQw1ImRU5oVEXfxVlWeUNmc7zTf7Wtxuk3Om9ITFsbWk8VDd5YiU7wVRVTACTOTA8+grHog6YXLKwce9GOS5LkUnOVrOpxCqYPStOyiqJZ0ZHtYrok0FKEAug4DXfY/tpy0zIT4ISedarH9Je7d2hlZflAWqPwpC1LKE0vm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YO/iaCXs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YO/iaCXs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D10D1F00893;
	Thu,  4 Jun 2026 19:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780603201;
	bh=0nBF57LRsWrMEo8iN2euSSytrxyB+R/0oRMmaelTwQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YO/iaCXs1ZU63nZVH1a43zbW8BPeEPyW7LFZCDDd5aVO0JXVJTt/1OW0VvZuvisiW
	 TJlHfnUzpTJxFgNyVRQjDc9WNCg5gvwTxlj96TNDApW5aOAFjFIrrRbHSkFWMifdUu
	 i0pT8C0EpBz5CqaV296YpJaGTWF4MHkz3khQmEMFsyGmOMfQj7jnRszGL/OPKeFbs7
	 KECsJiYIyKv8ieP81f7zerO+8Dyn7RESVDAsSHQOKk4DHYZKbqdzWpL5FSwnPqBKQw
	 qm/zy69GWjTXKAbjAZPq8pyWhCzr8yZqaUTyQHcR1JssnixZdcZw1T7J8E5hXhrAjM
	 8J4uN7fBuaSmQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 04 Jun 2026 21:58:08 +0200
Subject: [PATCH v4 02/11] rust: xarray: add debug format for `StoreError`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-xarray-entry-send-v4-2-965f6028790e@kernel.org>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
In-Reply-To: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Tamir Duberstein <tamird@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Harry Yoo <harry@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=l0CwU5Ulb0y9mTSS9KkZDum+7qeUfx4uMpAmUgVECbw=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIdjrzorzq+4T6PurdpmkIUWDjVZ/tEBb8myon
 5d/0/v7XIqJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiHY6wAKCRD6UCkIqsW9
 0EfUD/9OWWqFNFIktQfpK1Hyle/LSAjmNlESK91BK2sb65VFLfMXyoTm67fb3PbbhdLRKbEkrN8
 Cmf/q4f9mPWpw5IZXPdvpE6COADtszfD/KLvrYr+fgFA16tWnvXtjpxp2Sy+SWI02uLkeOO3YYU
 6lln3/eE5N9bc4aMSJHSFGXFOWQUbPnqy3NYMONVbnZuBUd+nQdSE9iX67mmCZINedr9HMVKdpe
 SmDNlTDHEEyfCRUn6bwv9VEARI3o2Vm8HOhMaLbmPqRm2h3WCa6DpRqQbyVDa5lnsRR/UNLJ6Ky
 gF9D/p/gAu66ru+R26U0G13ri+7ntEggShXuRw6SKs44stEdanQk/P+BnTs0ap6R6eI6a8wnnbx
 +jFNpn5TgiXEWqTPXZwn7LAQYbuBsr8K6bmC3qhDypfzYg2kJJq0k+Fnk1kPOrNT0FiwDg+pw0N
 JBdHH3RkypHidqpglHSixmYT/p4ggHiD/osQLnLyHsjjOuXS7yXxmfkwBCqfZmRf7W/RDniTy2i
 cuz2hcNkOaEPrH5oEwGuWi4o6V/oYIKLq8RISJViVqVr4z9TfRI0hrQVRkot4v8PuOI2Abl8QoB
 +HOJ0ZrYUPLbqm880J95kzG6gBV3JFxPGpPPxQSJoBcYFyK0BH1nEPSdJGZkiUx21JcbCpmM1p4
 frYqT+ng6G3oPrw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a `Debug` implementation for `StoreError<T>` to enable better error
reporting and debugging. The implementation only displays the `error`
field and omits the `value` field, as `T` may not implement `Debug`.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Gomez <da.gomez@samsung.com>
Acked-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index b80fb7a262d0..d54942aeb201 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -193,6 +193,14 @@ pub struct StoreError<T> {
     pub value: T,
 }
 
+impl<T> kernel::fmt::Debug for StoreError<T> {
+    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
+        f.debug_struct("StoreError")
+            .field("error", &self.error)
+            .finish()
+    }
+}
+
 impl<T> From<StoreError<T>> for Error {
     #[inline]
     fn from(value: StoreError<T>) -> Self {

-- 
2.51.2


