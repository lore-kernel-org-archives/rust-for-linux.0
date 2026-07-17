Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E344F3F1ADB;
	Fri, 17 Jul 2026 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288664; cv=none; b=P6P3QeoI7tqmp6MoJJxyTMvwUk0KbuMxxr5SqHqhf6Qr3oXowgaXHP+4NZB0QQua3jkgDZV2wfbW6BDqRkOcP4LmDSKeg5kIReJCIna/LmtRjBeg19GCjBV44wF7Fktl/HSPR2gMN16XNCeS0GrwVhlxMiWuufsLfT4OxaBAXkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288664; c=relaxed/simple;
	bh=p9TVbpcXB/XFwME8bF/7/pxTNZtHJBolmoalS+5f1mY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mj4Q6ppqRhYYlYvuNjmtUrGvBzVOQlAYykKq5XXO6BpIU+Xj0DjhwIkptJSaChKJGjiZmn0aRlMQLhbDU831f9N2BlqDpeJ7VfqHe/FjcKsXyGNVaByMuO3dTQFv+en8OlTAUQpGYJX9IhZwJkPtAZ/tkOnsC1wlfWBWE3EV4Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKVJopIp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKVJopIp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EAEEC2BCB8;
	Fri, 17 Jul 2026 11:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784288663;
	bh=p9TVbpcXB/XFwME8bF/7/pxTNZtHJBolmoalS+5f1mY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=jKVJopIpx0CQ/OQsxoxRLPnSlMseyNEMX63TVNzL60VGPxE2WMhfc6ozQ08czZSFs
	 cMz/LDW9NGJ9RUecw7P80u+vOiILC5zbUogf0iPRxdWcEpziOORlXPz7K1KpapPYjd
	 4ZF54SMMc/0W1XdP52HtLQFxD+f36+YUrJJSB8G5PKrUsX7rW6eYL4itNLO0DVuEpt
	 Gmmj62Z4Ba5WILABwlAg6BIVQYlr1jj/7wGcYo3izsWKrsP69ljxsDWv9ioiPiBOUF
	 Nw2oTkdulXuCSyoGBpK3LyAL5CnYpUrC3quOlPQsNzJv5rlNvnCCC5mKfkF9QZiFtE
	 9rqlP2pwpccuQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00EAC44520;
	Fri, 17 Jul 2026 11:44:22 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Fri, 17 Jul 2026 13:44:06 +0200
Subject: [PATCH] rust: print: fix broken `_printk` Rustdoc link
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-docs-printk-rustdoc-link-v1-1-892074948f75@younes.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAyF4auQrm0EVDBexbiYGSpUTCHtYEgId
 3dGl1/T929gpEwGt2IDpQ8bT5JQHQoIg5OekLtkqMu6KduqxW4KhrOyxBF1sZiMb5YRXdOcL76
 +tifvIM1npSevv/T98bct/kUh5l7+8M4IvToJQz5Nyj3LMUdRaI2w719iLLKonwAAAA==
X-Change-ID: 20260717-docs-printk-rustdoc-link-a6645b2873ba
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784288662; l=1057;
 i=git@younes.io; s=20260712; h=from:subject:message-id;
 bh=zVBY86ITmj7s9gCecJMwnv88MyaOS9NDh+38YeC1HUQ=;
 b=Y69z8bNr2eF2LQ5NVbtZul9RUSg0T7ydyAYco/TMOtrICmgT07DGC4Gfd4eAJ+TdSx2vR7PTD
 5qeHIf+BhNsDTJz0eqZ5hBobnwy9kPcBuve4Y117NGKyWqVhUV9saRQ
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=1DRfzPrQ04RQHHgGK28t+vjIAPv5oISPiAdLMU6J5dE=
X-Endpoint-Received: by B4 Relay for git@younes.io/20260712 with
 auth_id=866
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io

From: Younes Akhouayri <git@younes.io>

The Rustdoc link for `_printk` points to `include/linux/_printk.h`,
which does not exist. Point it to `include/linux/printk.h`, where
`_printk` is declared.

Fixes: 247b365dc8dc ("rust: add `kernel` crate")
Signed-off-by: Younes Akhouayri <git@younes.io>
---
 rust/kernel/print.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 6fd84389a858..0d62beeedca5 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -99,7 +99,7 @@ pub mod format_strings {
 /// The format string must be one of the ones in [`format_strings`], and
 /// the module name must be null-terminated.
 ///
-/// [`_printk`]: srctree/include/linux/_printk.h
+/// [`_printk`]: srctree/include/linux/printk.h
 #[doc(hidden)]
 #[cfg_attr(not(CONFIG_PRINTK), allow(unused_variables))]
 pub unsafe fn call_printk(

---
base-commit: 7059bdf4f04a3e14f4fafb3ac35fdca913e3e21a
change-id: 20260717-docs-printk-rustdoc-link-a6645b2873ba

Best regards,
--  
Younes Akhouayri <git@younes.io>


