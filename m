Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA9E2F25E6
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704296; cv=none; b=A+BsD/kZ5SlOEId9P/QxyRT1/ZMvxtp2S4VaBw0h0EkbFojZvcPxIfEN21L+ZUdgFxDB5GbSMjNH75hYtdQm75+48WyFBa5mR3P0B1n0cQOT9l6LWRzmqOTYWXeTIEI10ujEp5yYjAecmAtL95zHxqgUFcK+lTXMtJASlwPI04E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704296; c=relaxed/simple;
	bh=EUE4K5iTzfGORdv4PT/xu4tqe2/2Ya5xo9yL3tcaod4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cBpcENiZLiUTp+vzOWURCmjMJCmfoN6h8cABZdHPZORaDUYmPF10/dvnSWi4i5ql3Gfd3F723do74pqiI3CABMJ1s07EFgLaf2OjKHt8KFPXFXzWP8FNCNpBPu/okAMVDEDypKmNpswmlS04UOmt1A7NWgjC453ref0WinyUH6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P3zhdPYQ; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P3zhdPYQ"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-640789adcd2so5693283a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704292; x=1765309092; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9DFLJh1k6KKFA37WMPtagQLHJcdlMyeYXxcT/it0y+w=;
        b=P3zhdPYQRgTaQOKGVoOqEuGyjMbRNK71LJgQyLzC+lYpMNJ4JXETL0Kh2K6T6dxbBI
         yt8At23nzyqwFBe6wgsIvExrTxt6J9K3uq7jT4D80KoAQhiH+lJXUmdWLpuAeGfygJ/V
         gYPRfb8edHvfLdrAB3ycQcqUDdMjxKnO2mwPA3TLmHbrCGy9J6ZQOoyzI9cTvPDpKEud
         Uy6rRGHNkxxL5dgIcPiqMSoTdfygeyVlUy0rDAOhk+jH8Jg77s6OkIYm3zKFm0C3bfmR
         vXGxJ8Rggxu62cLfTdSCKe+gkhU5HcUhy0FXKCvpsZf0F/K6JohM75Ef7L0CoBc+tI/w
         1nEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704292; x=1765309092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9DFLJh1k6KKFA37WMPtagQLHJcdlMyeYXxcT/it0y+w=;
        b=a/utTQ2q8SVCdJf9iFEELkL4iBCYoxMfL051vMEZ6RLE0GXkQbdV2Jh9DMeym44r4Z
         nUCzzzPIFK6+zYeQNvKUymmP1NplMPv7O8awE3QXz2Mz2PYMiUVmPUQtbkK1iqrJ/Zy+
         +dgaeyH0IvKB7BdrT2W+EwIEe9avZvjQrTSk9sxdYkQ2KOSB0sJSRSuoyYVxteke5cG6
         6xrJoN/kHQmE7qu1i53kDxLn9oZhYAuQDZcbkMjmk3hpF7raHtV1Us+HUfA7hHbTpP0r
         OC5ETQjH5eShp9K3SOvMEBRJxUOYuJwJSeqqmpr4LFYEqGWeOWZAueSc9LLZSD30vxq1
         PDxw==
X-Gm-Message-State: AOJu0YxkFuBKKVf8okPWhUGYDQnXtIx7OD78sgRqZ9/RMRf7r+grw5G3
	2TkNnnTi0Agx2pGRyZ0IZKml6VLdi6yYwzuzgl5UpkhJx9unnjNUmj6/+AWXJ0af+QDSNoomtOC
	zgRj7wx9Us+Mhsna0Gj/b8alfC4lJWs55vzCiFjJTeqWx9EL8DuMnvi3Y4+bydcynilC1BXJr95
	70Hz3FJbl4o9sNJV8EBrMtUkz15/Pi3edeZ4tLeWDMl0IG+TaVuSR1luIhjmT0xFk=
X-Google-Smtp-Source: AGHT+IGvCYhHLfd5PiXEMOtAZu6u6Msjnyya9KsDHQQAbr9JB/sBWhFYX8ywgw5aA+Nx8s8Pprq8YSMLMyDysSE=
X-Received: from edh5.prod.google.com ([2002:a05:6402:5045:b0:641:8485:70cf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2714:b0:641:3b4f:4dc8 with SMTP id 4fb4d7f45d1cf-645eb799fc5mr25540339a12.31.1764704292466;
 Tue, 02 Dec 2025 11:38:12 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:43 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5731; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=EUE4K5iTzfGORdv4PT/xu4tqe2/2Ya5xo9yL3tcaod4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AIhX9T8SHriDk55CZBWAv+QkdQBmRI9aOiW
 HJY21M1bb2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACAAKCRAEWL7uWMY5
 RslQEACO7EQYN7HRbMUuIcppgXdikB0p8J3GW3ZPfvQaebKpVPDvfLvA76xUny4AsLISOKX57Eg
 7dvXJsRFtifOssx9VmccRgpql9MibS+aSNE/MQ+CylnUasgVAQ+Dc+FdkmMFv/Z5gHOk2a87YI2
 RuP6jrCwUykym81awqdAE1nWMPwjIlbyn9ExmRlYbe8GbRhVq1yeboprkchfXkBH/I9104PsoLF
 mfOS8w2l09thGFSYD5vbTgYer1dWZRmFkXHCFa2vhDg2vYaRY2mel28ere985c1K81gLuD2GWeZ
 q7ILcgbI0WhBIEiv5sL9CK0cRHHU8zNO+V2TB9OawN2QRFoXqEhcJP42om7OFolkdicFRpqn/Ww
 tNmR1l+6nlDxHc/UsXsy0FZkCZa1Z5ZH5vQrMNxcgBxhAOwXOF38ilGH869dzdA4aQNLvSA3mXg
 YtThNa2nWp6pTDOpwcV5JCDmkgdrUOVjD552uwo+gnDqb4um+WrpIyLYlU71meDA9gd6F8FXf+r
 3M3qBkD1wTQ3hlkfdLGwtR8BqOd3wFrulkiLiKbonz85LUOEtfqLgN7E54ScS0xfy0j6wYJvrRJ
 SvKtPh3s8j5tv24XF9Zf05T6D7Rnp5FdcQvQ5I3Pu2P1Mr53vZ03LYnZ+/cCmN/GMGLhZRscvrr xcd3kvtxei209iA==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-19-a2e13cbc17a6@google.com>
Subject: [PATCH 19/46] rust: io: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/io.c | 64 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index c475913c69e647b1042e8e7d66b9148d892947a1..397810864a243958b23c0a6f530e2705ca5e909c 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -3,140 +3,144 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 
-void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
+__rust_helper void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
 {
 	return ioremap(offset, size);
 }
 
-void __iomem *rust_helper_ioremap_np(phys_addr_t offset, size_t size)
+__rust_helper void __iomem *rust_helper_ioremap_np(phys_addr_t offset,
+						   size_t size)
 {
 	return ioremap_np(offset, size);
 }
 
-void rust_helper_iounmap(void __iomem *addr)
+__rust_helper void rust_helper_iounmap(void __iomem *addr)
 {
 	iounmap(addr);
 }
 
-u8 rust_helper_readb(const void __iomem *addr)
+__rust_helper u8 rust_helper_readb(const void __iomem *addr)
 {
 	return readb(addr);
 }
 
-u16 rust_helper_readw(const void __iomem *addr)
+__rust_helper u16 rust_helper_readw(const void __iomem *addr)
 {
 	return readw(addr);
 }
 
-u32 rust_helper_readl(const void __iomem *addr)
+__rust_helper u32 rust_helper_readl(const void __iomem *addr)
 {
 	return readl(addr);
 }
 
 #ifdef CONFIG_64BIT
-u64 rust_helper_readq(const void __iomem *addr)
+__rust_helper u64 rust_helper_readq(const void __iomem *addr)
 {
 	return readq(addr);
 }
 #endif
 
-void rust_helper_writeb(u8 value, void __iomem *addr)
+__rust_helper void rust_helper_writeb(u8 value, void __iomem *addr)
 {
 	writeb(value, addr);
 }
 
-void rust_helper_writew(u16 value, void __iomem *addr)
+__rust_helper void rust_helper_writew(u16 value, void __iomem *addr)
 {
 	writew(value, addr);
 }
 
-void rust_helper_writel(u32 value, void __iomem *addr)
+__rust_helper void rust_helper_writel(u32 value, void __iomem *addr)
 {
 	writel(value, addr);
 }
 
 #ifdef CONFIG_64BIT
-void rust_helper_writeq(u64 value, void __iomem *addr)
+__rust_helper void rust_helper_writeq(u64 value, void __iomem *addr)
 {
 	writeq(value, addr);
 }
 #endif
 
-u8 rust_helper_readb_relaxed(const void __iomem *addr)
+__rust_helper u8 rust_helper_readb_relaxed(const void __iomem *addr)
 {
 	return readb_relaxed(addr);
 }
 
-u16 rust_helper_readw_relaxed(const void __iomem *addr)
+__rust_helper u16 rust_helper_readw_relaxed(const void __iomem *addr)
 {
 	return readw_relaxed(addr);
 }
 
-u32 rust_helper_readl_relaxed(const void __iomem *addr)
+__rust_helper u32 rust_helper_readl_relaxed(const void __iomem *addr)
 {
 	return readl_relaxed(addr);
 }
 
 #ifdef CONFIG_64BIT
-u64 rust_helper_readq_relaxed(const void __iomem *addr)
+__rust_helper u64 rust_helper_readq_relaxed(const void __iomem *addr)
 {
 	return readq_relaxed(addr);
 }
 #endif
 
-void rust_helper_writeb_relaxed(u8 value, void __iomem *addr)
+__rust_helper void rust_helper_writeb_relaxed(u8 value, void __iomem *addr)
 {
 	writeb_relaxed(value, addr);
 }
 
-void rust_helper_writew_relaxed(u16 value, void __iomem *addr)
+__rust_helper void rust_helper_writew_relaxed(u16 value, void __iomem *addr)
 {
 	writew_relaxed(value, addr);
 }
 
-void rust_helper_writel_relaxed(u32 value, void __iomem *addr)
+__rust_helper void rust_helper_writel_relaxed(u32 value, void __iomem *addr)
 {
 	writel_relaxed(value, addr);
 }
 
 #ifdef CONFIG_64BIT
-void rust_helper_writeq_relaxed(u64 value, void __iomem *addr)
+__rust_helper void rust_helper_writeq_relaxed(u64 value, void __iomem *addr)
 {
 	writeq_relaxed(value, addr);
 }
 #endif
 
-resource_size_t rust_helper_resource_size(struct resource *res)
+__rust_helper resource_size_t rust_helper_resource_size(struct resource *res)
 {
 	return resource_size(res);
 }
 
-struct resource *rust_helper_request_mem_region(resource_size_t start,
-						resource_size_t n,
-						const char *name)
+__rust_helper struct resource *
+rust_helper_request_mem_region(resource_size_t start, resource_size_t n,
+			       const char *name)
 {
 	return request_mem_region(start, n, name);
 }
 
-void rust_helper_release_mem_region(resource_size_t start, resource_size_t n)
+__rust_helper void rust_helper_release_mem_region(resource_size_t start,
+						  resource_size_t n)
 {
 	release_mem_region(start, n);
 }
 
-struct resource *rust_helper_request_region(resource_size_t start,
-					    resource_size_t n, const char *name)
+__rust_helper struct resource *rust_helper_request_region(resource_size_t start,
+							  resource_size_t n,
+							  const char *name)
 {
 	return request_region(start, n, name);
 }
 
-struct resource *rust_helper_request_muxed_region(resource_size_t start,
-						  resource_size_t n,
-						  const char *name)
+__rust_helper struct resource *
+rust_helper_request_muxed_region(resource_size_t start, resource_size_t n,
+				 const char *name)
 {
 	return request_muxed_region(start, n, name);
 }
 
-void rust_helper_release_region(resource_size_t start, resource_size_t n)
+__rust_helper void rust_helper_release_region(resource_size_t start,
+					      resource_size_t n)
 {
 	release_region(start, n);
 }

-- 
2.52.0.158.g65b55ccf14-goog

