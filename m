Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A167E2F9D83;
	Sun,  4 Jan 2026 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767531632; cv=none; b=cjB6JtVhnEAVeBTrOGM8C1HneESaFomYARg9uJz0r7BISpqgC2ATz1+yECmJMPMnjwhzGc98th/OwsrTWgckCAUj686Krp27ZVrvRGmGc7f8IVXPXlX3v/bgAeF0wLHCn8jAjFypTzeeAe0Bwl5cI5OEbOy9sqa0uC0AA28X9o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767531632; c=relaxed/simple;
	bh=K+kNsv8o6x0iOPBJRR3v6JMwqc86TQCtbTpDbFBGH+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FO3ouDcsrgW7AjqpIqbe+D5GFUN8tFrXfqbAJxzJuZIawTWNskCVNGGBkJ/Ic8VdN0Bt2ag4M7jFdyOSZpgfvHaZmSN9GESlTRSCBPvbZBvyTzgelQN5ReZxU1MdTwSylf/6r9q14LXiCll5crLMdTY6+eIDFUTbGQ8YAlMfphw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JszAJsKV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JszAJsKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1B4C4CEF7;
	Sun,  4 Jan 2026 13:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767531632;
	bh=K+kNsv8o6x0iOPBJRR3v6JMwqc86TQCtbTpDbFBGH+0=;
	h=From:Date:Subject:To:Cc:From;
	b=JszAJsKVFpGWdpzVfhk1oEW9DGY/NCntfvpncRiUzK5XHyuFLmvGovVMgb90CKj3p
	 Kknv0hyyZtRgDfXeGuL5HH7FclWEJrTw6uZzfDjmoiK1dsC13ny3oQpSyboWY43CcD
	 Td61facr9nMHCjRbvLdaxRsACLHHN1Tqm8yWMYLb4aM0yHUHP08k7WJIuV42YKueiE
	 xEocP02qKihtV5GQx3VcjQNXvMQxLrMdzDlTQz0BpjicfbQYmp5JwBVLMLrffrWq5W
	 iegbmehf8xq6sfjNxwCuNdii0bmpU8LoP6IYpJeBQDZ74JSBm9f5cT4RZRPfXoTL7f
	 tGA0VdhDLWxHw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 04 Jan 2026 08:00:27 -0500
Subject: [PATCH] rust: fix formatting expressions
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260104-fmt-paren-v1-1-6b84bc0da78f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMBAF0atIrw3EEES9yuCizXy1BaMkKgPi3
 Y3j8kFRJ0UEQaQmOyngkCiLTyjyjNzIfoCSbzIZbUpdaKv6eVMrB3iF2qCrtGXLTKlfA3r5/V+
 f9nXcuwluewZ0XTdbTHWlbQAAAA==
X-Change-ID: 20260104-fmt-paren-e92eb804a4aa
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1767531630; l=1168;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=WY9k2R2e0dpWQ9kNLHGorA9lvENNqS2m8CnGqhmODN8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCNz+7cDHCtpGpbCdhsNmTH3p0x5seYvOzhcKz8OuDgKN8zRi8jmEbS0gqjDhzb5qoPEC6apB2x
 0xnWmblyUlQU=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

Allow usage like `pr_info!("one + 1 = {}", one + 1)` to compile by
ensuring that a reference is taken to the entire expression.

Fixes: c5cf01ba8dfe ("rust: support formatting of foreign types")
Reported-by: Janne Grunau <j@jannau.net>
Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Custom.20formatting/near/566219493
---
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/macros/fmt.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
index 2f4b9f6e2211..8354abd54502 100644
--- a/rust/macros/fmt.rs
+++ b/rust/macros/fmt.rs
@@ -67,7 +67,7 @@ pub(crate) fn fmt(input: TokenStream) -> TokenStream {
                     }
                     (None, acc)
                 })();
-                args.extend(quote_spanned!(first_span => #lhs #adapter(&#rhs)));
+                args.extend(quote_spanned!(first_span => #lhs #adapter(&(#rhs))));
             }
         };
 

---
base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
change-id: 20260104-fmt-paren-e92eb804a4aa

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

