Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DFB36828E
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799014; cv=none; b=pUfLVT15Bh0TImGDCmdZnK62GEt0ZdzEwAPfRHY02MqXOWFi64D1S2+6hhpRTywDss2hV02YIzRRMh2P/X3Srzm89ZdSEJwGF6oTe+BZYtgOxDEf2GfddGMUhy8sNmcr/v1k5cpXixJgla6p0uspE3+zfGas9bFxI0rVLWUUzks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799014; c=relaxed/simple;
	bh=Zh3CosvYSB2naZ/tsAZBGceplO+NdNCSsEdIc5N4TP0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Mx4Hl9RGlJPp30Bmafmz3TgDDmKkuEUpcgK1l5ONjgS0SszGBPpCABSOx3cgpGFFP6jwEkWQq81GOw4RgRcjDEVPDxBQqERmRbRaHM9H5z6aFlf/sqlvCgnRn65PyV/g+rYSHe1z6wzfIiqsZHTioxhNoaxuJ7UZXtBBkGZsbZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=16PBKwpc; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="16PBKwpc"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477cf2230c8so20336205e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 07:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767799011; x=1768403811; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y5KhcYh/HDEMfhpeShJc3bIRP0HovR3OTZMD4Ywi+6M=;
        b=16PBKwpc3SNfliPvqs/hXjaYXARnLRMRImJCUP3z7O4UetvMUZNDsnQqmBwFuIjNgY
         2NAifHCLpvVVxiyrpW35Md5lmL73mFEQQwQwrRtieDkS4i5gCFjLC2W/jUDLJMnlhBRd
         ZDEiNhqVSmvz4nY5mwJO+QEYXdqhvBnxSiCBsxbON7rOpn1rbHY+tzTSEtpW7ndGIYLt
         1wxWV7BXqPQvASLFclSxAOac5KkXW4RmleB9LSFB90F0fpdEKS/0wjAtOek/KJANPSuE
         zDzMg2B4G9lRRjW41SCHz3fQW1IwCUCwypY8o3ONPeFC06Y6dHckr45klubgVF+snoKi
         syRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799011; x=1768403811;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y5KhcYh/HDEMfhpeShJc3bIRP0HovR3OTZMD4Ywi+6M=;
        b=jMn9oSxwdkY3KtkzySVVVic+v+4aEmwZAeQIcRN13ogfQCdPXspZVKXquZHJNhwWlQ
         9cz2NI9HmS+tvPIby+HXTZ9d+djXMLR1XxoyWm+rFv9Uy/HrG9a6nO6J+ocIB0XN8Pem
         yFx6EXEUFizyhQIIDwo/uLu6l/lzuwYDw15y7qZCD2k/lmdD349o0XwMBEnwUe42n6Ii
         bGQ2fj1xsOF9FKzYx76rfVLBD5UOtFlYGZIjXvbKvulEqTQd+ChD3QV6UHX9YiyPoamB
         iNxQfcI0t46AoARYaYJu6z86zEkw9s+iXsXQ3zGzvJqK+OI37dmUIw7FghOpVxDeAwI0
         flFg==
X-Forwarded-Encrypted: i=1; AJvYcCWdjIXCLe+NsMF1M2rvNNaFsDOVCvw8GMR+m/uORUr2OQNIF4v5s9N0EzN7+IqvZv5WVFLfvNeDuAy3KXDz6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV686InkxiaRMIsOn5Z7jDT5tkrz0WdOozcynCrwqdKFMml1UP
	JtLnhUx3lUsWbBJ2jjjmp+/QLas3ITdKSQxtNgup6wlB4qOY80/px5X1DXg9KL6KHJeqyK9SsM4
	8/OyVBqsZT0KLca5grA==
X-Google-Smtp-Source: AGHT+IHy/226WGsfxdKTD5bXwnrI3EV2nDVTyLl+dpH3NIQl5WMq3eRB8ICpabqPOangIJYEAg6br+51EJCY7QI=
X-Received: from wmpb42.prod.google.com ([2002:a05:600c:4aaa:b0:47a:9a5e:7c36])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:648a:b0:47a:9560:ec22 with SMTP id 5b1f17b1804b1-47d84b17ae4mr29501795e9.14.1767799010827;
 Wed, 07 Jan 2026 07:16:50 -0800 (PST)
Date: Wed, 07 Jan 2026 15:16:42 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANl4XmkC/x2NwQqDMBAFf0X23EAi1LT9lVIk6otdCNmwERHEf
 2/obeYyc1KFMiq9upMUO1eW3MTdOpq/Ia8wvDSn3vaDddYbHEV0M7sipCTzmGXBGBKvuWFRicb Bx+k5+QfuA7VOUUQ+/o/357p+JlX+h3MAAAA=
X-Change-Id: 20260107-export-vrealloc_node_align_noprof-1e7fb9b78e56
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Zh3CosvYSB2naZ/tsAZBGceplO+NdNCSsEdIc5N4TP0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpXnjdN3Qj2lLaTIbxVd2IVEGyuBmcThP0qr2rK
 uDFctaFH0OJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaV543QAKCRAEWL7uWMY5
 Rr7AD/9uGRGZAWi9Wblof+yZYze8SKqGgaSLZFQM64E8snBItkl6yglCiP/auZ8VtIf0Op2SShY
 p/K2oFYUG/HMxdMHO0XcUIj/Qr5fr6XHqswxN35keDJrSDry9gor73YDia/Vt3g5v77H/a/D5gh
 IzmLu4of8u8dqDUpjEckhG9YBeaBLm+1zkI+QtTsqrwI+zKfn1Srl9CNtjsTCMAfiUb7CEG9kDh
 87a2QV7Xk40EtEAwz+AK3vggOXc2dICZjByaGRllQ29jMPSfcIBQO3ZzziL/VQyYuEck9xgJnX8
 aA22Evey+SyZh/MGOYcwga7NlBCVnT59/Cb+xCj0/ijwUR7FOHtAzUUjoq3xYgnIRovLLJc9msD
 qA2O78NRF3NNKKOLWd69y0EdKf3VtXzX3Q9k9KxODd/Sx8ORudOfw6kT75bViZmVOCkYd3C3DJr
 k9iUI7oCHjTY1iC2dld5cksCYzoPrhqKntjKeDeRecYP3RxC8/XYStwXEadEer4o3JodsZ2fmOM
 kB4M2QZSYl+oTpnIaMIagvIdodTf+Mq/G9cH+U8y548A7bISS5R6F0w4166g30DfbIvJZBrcTVv
 S/vk1vSMUoZNG8LX9k06wl7itOwpNUMjMLXQTFnqzzH16rndDTmdM31fdEObwu57J0WC+luJHw8 JiBfm1i2rzrYUvg==
X-Mailer: b4 0.14.2
Message-ID: <20260107-export-vrealloc_node_align_noprof-v1-1-a581bec13054@google.com>
Subject: [PATCH] vmalloc: export vrealloc_node_align_noprof
From: Alice Ryhl <aliceryhl@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This symbol is used from the Nova driver, so it needs to be exported to
avoid a build failure when building Nova as a module.

ERROR: modpost: "vrealloc_node_align_noprof" [drivers/gpu/nova-core/nova_core.ko] undefined!
ERROR: modpost: "vrealloc_node_align_noprof" [samples/rust/rust_dma.ko] undefined!

This error is only triggered if helpers are inlined into Rust.
Otherwise, Nova will call the exported symbol

	rust_helper_vrealloc_node_align()

instead. There is no Fixes: tag as that feature is still WIP.

I used non-GPL EXPORT_SYMBOL to match the rest of the file, but let me
know if I should use EXPORT_SYMBOL_GPL.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This patch was split out from this series:
[PATCH 0/4] Inline helpers into Rust without full LTO
https://lore.kernel.org/all/20251202-inline-helpers-v1-0-879dae33a66a@google.com/
---
 mm/vmalloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ecbac900c35f9cf207ac9299be096939509be43c..c248b5edb682e9a08acc1c3e804122f5fea22d19 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4355,6 +4355,7 @@ void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align
 
 	return n;
 }
+EXPORT_SYMBOL(vrealloc_node_align_noprof);
 
 #if defined(CONFIG_64BIT) && defined(CONFIG_ZONE_DMA32)
 #define GFP_VMALLOC32 (GFP_DMA32 | GFP_KERNEL)

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260107-export-vrealloc_node_align_noprof-1e7fb9b78e56

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

