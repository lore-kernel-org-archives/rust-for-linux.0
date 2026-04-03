Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75663362128
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217154; cv=none; b=rJfXtoSsLcK30fAEEv2XWSIkMxLgqs+HqneP9+3pSUM/s6cXTGOmz7gB8Xt/n0zHc8yMA8+6eW7gGfNkYv4MkkQ690GR5/SFfZZdp1GVIeBubQm3ieOfPdNIMmWjURkkfCs+PjnSgowTivJwC67t3jh4M7r4Us5CSvfdAMhDtj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217154; c=relaxed/simple;
	bh=CgCFO3JFO6pJapD8t3XCiCnCZYFfbQQ74297gLSn9w4=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Md+0gu5cH8l1lEGzNq+BOeL4AADzfQRa6YcHJDMrXdxdQC7gMDMHC4zFOBLoAGX9MvxlgiKtag1MMgouXMTrI1SRJU4m4PlrBAPVs1eX4hI58kn876m3jxxZPKQ6Eefe/SUIVU8raWNul4sn9eHAu1V5cI88qZZ70wAcKWvc27g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=EltK9blX; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="EltK9blX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1775217142;
	bh=QMBVUwr3pvMl+EPL99ZbAehJfxny5eY4Nq1qsJCKJX0=;
	h=From:To:Cc:Subject:Date;
	b=EltK9blXMPpq4rQ/jYsJ6KboVswxgcFy8qGRRXGD+t70yPgLPLbXJ6TXXnMikIr8A
	 z9CtsdFMbY6rS0JcDgJKITE4hJ32+dEewvT7XKoWQGSqbI5hhmWAwpXYoJGTzeqgSC
	 CAqljI10iUcoJimmEgSp967+1vvbzIYbbz8LBGCA=
Received: from archlinux ([221.207.153.26])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id D1382C39; Fri, 03 Apr 2026 19:52:19 +0800
X-QQ-mid: xmsmtpt1775217139t8j4j04q7
Message-ID: <tencent_847C6CC7A95F9DB83F0D371CC97F4DD46C08@qq.com>
X-QQ-XMAILINFO: NuGpsYW8pZ+AHgRhai5XLsnQ0f4f32kran+fBO88TDx3jjS62puXg3CoeRmWmQ
	 Hqdd1EMsl3rOMHr3EJ3bM0WWPYgqVcU9+zbvJA3fmaQKmE8Pzx+fT7k2Se3QCgUAkTTXIpVb3iGT
	 7WgAXKqDA2Hb9B6Lw76TbUMXDiV4roiKb6UyH278RdQbXqYRnpXMaxBeM7K7NlwKpT/wpKeTvSKj
	 YW3OFO4ekb4N38QdvKyI4/t58itJGjSJl2rWW0KtA4jvD5oFDL+htUurGeKyshcsYc68oDyIMPK9
	 w+gHtbkdjkD2i+1czQ0Mt282Vs078HEx5jRB5/bczlTR06gLOaSu/i6DniSN4cUo6tRePCJdq3DZ
	 9Wrfyi4GOXz/kFIfOVS2j8AD2J9/PNtaJZ0MEb3DobYL8Dk3fXi6VmI3DcE7lhTMdkXPscBqrz65
	 I7wq6u7nej14I4Ev2GQRc5IZ3HNUDqFNcP8vr93eHLrjRzj9JPXz5V9ddqJVJHC9TU2yjbnEnm2R
	 BmHBbHv2vcUjj6+b2jMS0YzCQOSjp/8QsyXkm0J9JJuHK+9tmEHGArZ9IA3V6HJ8vTbjffwdIP0h
	 os3DlipFNHujeDenqpnPKGyO+p88C2coVYkYcs/Lkwy3iIa1lhK/5yd2wZkFCEh8N9ZXh3zYDJDq
	 uZZXDBgMZ+SwaOMad7eMLyh+d6vtEHngQqiyFEFCL4L3WO+StiDQyzspB6Dr3iTl5t1bNmtbF75L
	 JGxdyiHwm4lh8GNcpxfOO1pCLbIAlZzjHzhpUdFNJBwwiGRYogl4galzH/NCxnUmeGyDxUBz2TkY
	 0WA5CiXsmXoW4XTxvsJRcakU8WkHQQl0J0TUoPx9XQvKkiJYUDrJ7FMEnxCxYFCnZmil97BWtN2E
	 o5+BFxfXEX+YGBlvygFVCB1RJ/uXfSFXY5dSomSfaIuPaOHo8MTpIAuqcZgVI+Y6CcYEX06xwi9v
	 pIQFetqrsy9VjxLmwPWtn3iv/gI26abCk93h7UPi6qx1lATlHZmkILRlqKVRTZyAA+7uMj9JlkMM
	 rcn/2EOa9xXbfj83dlhfRAKulhlqHwUDoS1kSIwA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Pengheng Wang <pengheng.wang@foxmail.com>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	lossin@kernel.org,
	Pengheng Wang <pengheng.wang@foxmail.com>
Subject: [PATCH] rust: pin-init: Add missing SAFETY comments in internal/init.rs
Date: Fri,  3 Apr 2026 19:52:19 +0800
X-OQ-MSGID: <20260403115219.1393988-1-pengheng.wang@foxmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace "// SAFETY: TODO" placeholders with proper safety explanations
for the unsafe blocks in the proc-macro initialization code.

Each unsafe block now has a clear explanation of why the operation is
safe:

- Line 152: Type implements HasPinData/HasInitData trait guaranteeing
  correct data structure for field initialization
- Line 175: Closure correctly initializes all fields and handles
  errors/panics properly
- Lines 255, 261, 269, 297, 315: slot pointer validity and proper
  alignment guarantees for field access and projection

Suggested-by: https://github.com/Rust-for-Linux/linux/issues/351
Link: https://github.com/Rust-for-Linux/linux/issues/351
Signed-off-by: Pengheng Wang <pengheng.wang@foxmail.com>
---
 rust/pin-init/internal/src/init.rs | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 2fe918f4d82a..4121e21e01e1 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -149,7 +149,8 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
     let field_check = make_field_check(&fields, init_kind, &path);
     Ok(quote! {{
         // Get the data about fields from the supplied type.
-        // SAFETY: TODO
+        // SAFETY: The type implements `#has_data_trait`, guaranteeing that `#get_data` returns the
+        // correct `#data_trait` type for initializing the struct's fields.
         let #data = unsafe {
             use ::pin_init::__internal::#has_data_trait;
             // Can't use `<#path as #has_data_trait>::#get_data`, since the user is able to omit
@@ -171,7 +172,8 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
         let init = move |slot| -> ::core::result::Result<(), #error> {
             init(slot).map(|__InitOk| ())
         };
-        // SAFETY: TODO
+        // SAFETY: the closure passed to `#init_from_closure` correctly initializes all fields of the
+        // struct and returns `Ok(())` on success; it handles errors/panics correctly.
         let init = unsafe { ::pin_init::#init_from_closure::<_, #error>(init) };
         init
     }})
@@ -250,12 +252,13 @@ fn init_fields(
                 let accessor = if pinned {
                     let project_ident = format_ident!("__project_{ident}");
                     quote! {
-                        // SAFETY: TODO
+                        // SAFETY: `slot` is a valid pointer to the struct being initialized, and `#data`
+                        // provides the correct projection function through the `#project_ident` method.
                         unsafe { #data.#project_ident(&mut (*#slot).#ident) }
                     }
                 } else {
                     quote! {
-                        // SAFETY: TODO
+                        // SAFETY: `slot` is a valid pointer to the struct being initialized.
                         unsafe { &mut (*#slot).#ident }
                     }
                 };
@@ -263,7 +266,8 @@ fn init_fields(
                     #(#attrs)*
                     {
                         #value_prep
-                        // SAFETY: TODO
+                        // SAFETY: `slot` is a valid pointer to the struct being initialized, and the
+                        // field is properly aligned (enforced by the field accessor).
                         unsafe { #write(::core::ptr::addr_of_mut!((*#slot).#ident), #value_ident) };
                     }
                     #(#cfgs)*
@@ -290,7 +294,8 @@ fn init_fields(
                             unsafe { #data.#ident(::core::ptr::addr_of_mut!((*#slot).#ident), #init)? };
                         },
                         quote! {
-                            // SAFETY: TODO
+                            // SAFETY: `slot` is a valid pointer to the struct being initialized, and `#data`
+                            // provides the correct projection function through the `#project_ident` method.
                             unsafe { #data.#project_ident(&mut (*#slot).#ident) }
                         },
                     )
@@ -307,7 +312,7 @@ fn init_fields(
                             };
                         },
                         quote! {
-                            // SAFETY: TODO
+                            // SAFETY: `slot` is a valid pointer to the struct being initialized.
                             unsafe { &mut (*#slot).#ident }
                         },
                     )
-- 
2.53.0

