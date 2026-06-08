Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBB5358378;
	Mon,  8 Jun 2026 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921938; cv=none; b=hefZm9eGv2W2U2g7/DFZRgQAkaF4C5LpKkj4YRolgfNP44HDzn8PCcAFs5OeoNcSW970Vf16ssoF5lPkYqsGi5Gl5vUnhgY9eNHoP/UdL83JPMmXeJlT6ZdJM9gKcxf4kn8brn4ouLJ94lvek+/817D11h4mvhFJuUfqXq5baMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921938; c=relaxed/simple;
	bh=kPOTXTKnl460Ii8RfyW6MsYTthLSFS+wyU/pN1huC9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QG0pitcHTx2U5DI77sVuxWObpFqMt8n7ICUXuDldTct8xs+hrzO5/3yiETZmRzmH1hPNGhfZJVokXa6REpDnYS9299w/2+0YW/JBKE/9WHz8ZG8Vo3PcFfw3IMrrAqQVjAFZNF0S4/ZoCsdXzwM7mRAZ5j07p2FSG8FXqiY0tSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdK9jd9g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdK9jd9g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FBB1F00893;
	Mon,  8 Jun 2026 12:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780921936;
	bh=j7x/Kfzq7zmeP1i8u/9nPfI7UxiHMv1BODqsz+IBXss=;
	h=From:Date:Subject:To:Cc;
	b=RdK9jd9g6JFAai3EZDTKPp3OYm8PQqHBN0RIeOR5ZQC1P6CSlg+y4RL55F4zU4tz5
	 TOkwqjhhTViAQMlq9pAvoEIcP2S6lX26OvZezqtwMl7Q0S4X50qPSy0mzBTpX4LKw9
	 aAoktV249iPxaR7dI+nX5iPKCiGI3oXyaqXDxSVKRWfZhmsLC0q0TfAh8sX7Nw4Unk
	 M8z9Zv/hRn0yHPb1wyI2Lo7Fi+BBg7sWJ2nNB+8gLkPuPOYBLVAfHmlRp469ATCEY/
	 CsE4LWsS5xqP+bA1NEbeBmLAa8lnjsAyg0eEzGag8UUhGW0sp2Q7ruUTPufgyYKFV3
	 EkSH8GVC8e01g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 08 Jun 2026 14:32:00 +0200
Subject: [PATCH] rust: configfs: fix data offset calculation for subsystem
 callbacks
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-configfs-fix-offset-v1-1-7f01b8fb9e5f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAD+2JmoC/yXMQQ6CQAyF4auQrmkyhTiCVyEsYGyxLmbMFIwJ4
 e4Ouvzy8v4djLOywa3aIfNbTVMsoLqC8Jjiwqj3Ymhc4513HYYURRcxFP1gEjFe0c8t0ZUuXe8
 IyvOVuay/6jD+bdv85LCeKTiOLyaY/XJ3AAAA
X-Change-ID: 20260608-configfs-fix-offset-6b3117158901
To: Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4245; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=kPOTXTKnl460Ii8RfyW6MsYTthLSFS+wyU/pN1huC9g=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqJrZFJ07ZQEWMpSr/9m9+xt4hELLB4PwWuMpiJ
 IAwtC38wSCJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaia2RQAKCRD6UCkIqsW9
 0L06D/9dr5xppBI42jjQLyr7DDPeCsib72mMmfhNwa9H3/0EoaV1i3wP+agl9v6JnHX5nDV+UUc
 K1xTU+jgQkcYflRCwsxJRj8WpP/TllJKUn8keEaLMqno6wSalWdtxFpIy42P1fTRPBQlpeU364D
 Fr/9e4DXq47653MSCGh8vfrLcete4ow/goE49nOURDTu5kmncW6xcHSsB6XsvdXocf4I+n+CBdj
 uKwz2/wSp+4nkd6tqjiAkWM2/56Lgihjvbyynh/E2RG7q2ye9WAD1dULiVilQ+NR9LWXNV+pZ+P
 EzMpB2Zqrng958A6c7GWuiczl7/x3EOeXk//ugddbkUPjKgWshUQ6B022jtgmXVaXpacJ1kUJXB
 kmLLExkBKedwIuB1Jzt0keRIjXDnmWGhCu6A28B3m5qrPlk6gm0vXHBr/n04WUKxttuS0XWgtLz
 JJTjtSvewy2XfBcwpEFZhyQoJTtv1kgG/wbhjegH+9XMvM1K60sEPk22gsuJ2073hOf6P4rvunB
 76sOaqD2Gh9Jk37Ca0EBCTfeBmOfvmIj7AjrqyUzDcW6GsZACu0Bzzo5ZwXC9J7mX1GwkZhkUgE
 a+iJ97+dndqqkcJxTNbvj8SaeytaT9NAJQM05elD1Aa17H6vcoae0VtnylyfofDngD+GJGbxaFG
 6VCtulQdSVl3VYw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`get_group_data()` chooses between `Group::<Parent>::container_of()` and
`Subsystem::<Parent>::container_of()` based on whether `this` represents
the root group of a configfs subsystem. It detects this by checking
`(*this).cg_subsys.is_null()`, but `link_group()` in `fs/configfs/dir.c`
unconditionally sets `cg_subsys` for every `config_group` attached anywhere
in a registered subsystem, including the subsystem's own `su_group`. The
only `config_group` with a NULL `cg_subsys` is the configfs root, on which
userspace cannot trigger callbacks. The check is therefore always false at
runtime, and the `Subsystem` branch is dead. Subsystem-level callbacks
reach the `Group` branch and may read `data` at the wrong offset.

Thus change the `is_root` check to correctly identify whether a group is a
root group by comparing `this` to `subsys.su_group`.

Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/configfs.rs | 42 ++++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 2339c6467325..eb1316154890 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -297,26 +297,36 @@ unsafe fn container_of(group: *const bindings::config_group) -> *const Self {
 ///
 /// `this` must be a valid pointer.
 ///
-/// If `this` does not represent the root group of a configfs subsystem,
-/// `this` must be a pointer to a `bindings::config_group` embedded in a
-/// `Group<Parent>`.
+/// If `this` is the `su_group` field of a `bindings::configfs_subsystem`, that
+/// `configfs_subsystem` must be embedded in a `Subsystem<Parent>`.
 ///
-/// Otherwise, `this` must be a pointer to a `bindings::config_group` that
-/// is embedded in a `bindings::configfs_subsystem` that is embedded in a
-/// `Subsystem<Parent>`.
+/// Otherwise, `this` must be a pointer to a `bindings::config_group` embedded
+/// in a `Group<Parent>`.
 unsafe fn get_group_data<'a, Parent>(this: *mut bindings::config_group) -> &'a Parent {
     // SAFETY: `this` is a valid pointer.
-    let is_root = unsafe { (*this).cg_subsys.is_null() };
-
-    if !is_root {
-        // SAFETY: By C API contact,`this` was returned from a call to
-        // `make_group`. The pointer is known to be embedded within a
-        // `Group<Parent>`.
-        unsafe { &(*Group::<Parent>::container_of(this)).data }
-    } else {
-        // SAFETY: By C API contract, `this` is a pointer to the
-        // `bindings::config_group` field within a `Subsystem<Parent>`.
+    let subsys = unsafe { (*this).cg_subsys };
+    // `link_group()` in `fs/configfs/dir.c` assigns `cg_subsys` for every
+    // `config_group` attached anywhere in a registered subsystem, including
+    // the subsystem's own `su_group` (which gets a pointer to itself). The
+    // only `config_group` with a NULL `cg_subsys` is the configfs root, and
+    // userspace cannot trigger callbacks on it. The group is therefore the
+    // subsystem's `su_group` iff it equals `&cg_subsys->su_group`.
+    //
+    // SAFETY: For every `config_group` the configfs core dispatches a
+    // callback on, `cg_subsys` was set by `link_group()` at registration time
+    // and points to a valid `configfs_subsystem` that outlives the callback.
+    let is_root = !subsys.is_null()
+        && core::ptr::eq(this.cast_const(), unsafe { &raw const (*subsys).su_group });
+
+    if is_root {
+        // SAFETY: By the above, `this` is the `su_group` field of a
+        // `configfs_subsystem` that, by function safety requirements, is
+        // embedded in a `Subsystem<Parent>`.
         unsafe { &(*Subsystem::container_of(this)).data }
+    } else {
+        // SAFETY: By function safety requirements, `this` is a
+        // `config_group` embedded in a `Group<Parent>`.
+        unsafe { &(*Group::<Parent>::container_of(this)).data }
     }
 }
 

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260608-configfs-fix-offset-6b3117158901

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


