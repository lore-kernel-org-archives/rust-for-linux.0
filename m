Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="ljbribNl"
X-Greylist: delayed 239 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Nov 2023 17:45:02 PST
Received: from lively-olwen.relay-egress.a.mail.umich.edu (relay-egress-host.us-east-2.a.mail.umich.edu [18.216.144.57])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BFDD79;
	Fri, 17 Nov 2023 17:45:01 -0800 (PST)
Received: from mammoth-yacaruna.authn-relay.a.mail.umich.edu (ip-10-0-73-60.us-east-2.compute.internal [10.0.73.60])
	by lively-olwen.relay-egress.a.mail.umich.edu with ESMTPS
	id 6558162C.23A596CC.5D730AC5.3305047;
	Fri, 17 Nov 2023 20:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2018-08-29; t=1700271660;
	bh=Vh/HaZa7HJvFyuyNB0eCPpU6WqUM0OIvSvSE9/ugphQ=;
	h=From:To:Cc:Subject:Date;
	b=ljbribNlOeIV8shwVqGZXICcLSBQPNxKk4dzNUHAmgQVoZcblQZ1OJNT9Mq9FgoF2
	 odq54YYb1D/lc2Q2Ww+6GYIx9UkCmxT5PRSj7oC+7BBkz2+pjiE6RHh+1C12SUg3FT
	 dR+p67yKXBpUve03zv847pldxjYbcZTOn5yGm6uhsR9dtUKLi72C2AXD3tdn3Dh3o3
	 8U/NtRlijVneAAXcRhfiITXyGVddmeaGc8t61OVFXNLD4mQpKeBdQk2jiSoMRIoOwZ
	 UL8+mS99Sl1jvImA1v4Yqywo9+m3MoQ2mzcJvGJGyI3YMoTv0wIKxexEM7+eAJVRfx
	 bJXZbkG7YgoPg==
Authentication-Results: mammoth-yacaruna.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=76.141.129.158 (c-76-141-129-158.hsd1.il.comcast.net);
	auth=pass smtp.auth=tmgross
Received: from localhost.localdomain (c-76-141-129-158.hsd1.il.comcast.net [76.141.129.158])
	by mammoth-yacaruna.authn-relay.a.mail.umich.edu with ESMTPSA
	id 6558162B.22539A90.1E7385F2.2183879;
	Fri, 17 Nov 2023 20:40:59 -0500
From: Trevor Gross <tmgross@umich.edu>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v2] rust: macros: update 'paste!' macro to accept string literals
Date: Fri, 17 Nov 2023 20:39:59 -0500
Message-Id: <20231118013959.37384-1-tmgross@umich.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable combining identifiers with literals in the 'paste!' macro. This
allows combining user-specified strings with affixes to create
namespaced identifiers.

This sample code:

    macro_rules! m {
        ($name:lit) => {
            paste!(struct [<_some_ $name _struct_>] {})
        }
    }

    m!("foo_bar");

Would previously cause a compilation error. It will now generate:

    struct _some_foo_bar_struct_ {}

Signed-off-by: Trevor Gross <tmgross@umich.edu>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Gary Guo <gary@garyguo.net>
---

Changes since v1: correct documentation and add an example. I added the
reviewed-bys since the only change is in documentation, not
functionality.

v1: https://lore.kernel.org/rust-for-linux/20231008094816.320424-1-tmgross@umich.edu/

 rust/macros/lib.rs   | 22 ++++++++++++++++++++--
 rust/macros/paste.rs | 10 +++++++++-
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index c42105c2ff96..51d1f8836667 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -254,8 +254,8 @@ pub fn pinned_drop(args: TokenStream, input: TokenStream) -> TokenStream {
 /// Within the `paste!` macro, identifiers inside `[<` and `>]` are concatenated together to form a
 /// single identifier.
 ///
-/// This is similar to the [`paste`] crate, but with pasting feature limited to identifiers
-/// (literals, lifetimes and documentation strings are not supported). There is a difference in
+/// This is similar to the [`paste`] crate, but with pasting feature limited to identifiers and
+/// literals (lifetimes and documentation strings are not supported). There is a difference in
 /// supported modifiers as well.
 ///
 /// # Example
@@ -337,6 +337,24 @@ pub fn pinned_drop(args: TokenStream, input: TokenStream) -> TokenStream {
 /// assert_eq!(br_ok(), binder_driver_return_protocol_BR_OK);
 /// ```
 ///
+/// # Literals
+///
+/// Literals can also be concatenated with other identifiers
+///
+/// ```ignore
+/// macro_rules! create_numbered_fn {
+///     ($name:literal, $val:literal) => {
+///         kernel::macros::paste! {
+///             fn [<some_ $name _fn $val>]() -> u32 { $val }
+///         }
+///     };
+/// }
+///
+/// create_numbered_fn!("foo", 100);
+///
+/// assert_eq!(some_foo_fn100(), 100)
+/// ```
+///
 /// [`paste`]: https://docs.rs/paste/
 #[proc_macro]
 pub fn paste(input: TokenStream) -> TokenStream {
diff --git a/rust/macros/paste.rs b/rust/macros/paste.rs
index 385a78434224..f40d42b35b58 100644
--- a/rust/macros/paste.rs
+++ b/rust/macros/paste.rs
@@ -9,7 +9,15 @@ fn concat(tokens: &[TokenTree], group_span: Span) -> TokenTree {
     loop {
         match tokens.next() {
             None => break,
-            Some(TokenTree::Literal(lit)) => segments.push((lit.to_string(), lit.span())),
+            Some(TokenTree::Literal(lit)) => {
+                // Allow us to concat string literals by stripping quotes
+                let mut value = lit.to_string();
+                if value.starts_with('"') && value.ends_with('"') {
+                    value.remove(0);
+                    value.pop();
+                }
+                segments.push((value, lit.span()));
+            }
             Some(TokenTree::Ident(ident)) => {
                 let mut value = ident.to_string();
                 if value.starts_with("r#") {
-- 
2.34.1

