Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8BA3D5657
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Aug 2026 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786866120; cv=pass; b=AMT6YYi17Iarg0EcjkQOKzy44B+A+MFER2TXoP8YmeAQyGAUkcVP0vp6fK29+oty2VIYQLxBQA6zVDGbM9PtOfbkyeOkDYfqBcxH5mzmNx70Rsly8rKFj1L6DCwQfo5zHhnnGqXNZRt/AIdD9lxlBH8T2xmhuHcp/1y2f9izvkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786866120; c=relaxed/simple;
	bh=oUj9a05u3BrZXpZY8d2cwDmZZkc0AB+gL3ZeNRklfdI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=C/Va/hfIn8Ou+tgae5ywKUeVqG6/+RgTJJver2NqP5rMlS8bxkg6XBi8xy/REHxmrgDMBNFzMveN2MwdoJ0hpj56pux+BEbGcpfAjUXkfUwFI/JBT3bPIKXsNSiiHJHMVVgO80NdRIMuGHWibJgJG1zz/vAOnt1OeGRkpYhMQso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNK7zjQb; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNK7zjQb"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81ff017d420so45076497b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Aug 2026 00:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786866118; cv=none;
        d=google.com; s=arc-20260327;
        b=ke5E4EBBCkiryoH90k+Jup/RNllR/aUzSRxeiPCXrvPY+1hib5bCSGga+4E3RxhLpt
         TmgR5CRSyeS+5Rsbfd0WXDTxuKtECLEyP214NgpK1XFsGLBA+4DFwiKKFE8dDbvP/8ib
         VK03w50TUEyuWipzwv3B23xdyvPRwZ1j7DYmqP6j0VLHVa+qHyvSsyYbPCYqednX/A3s
         2ZHe1lD+1QVotiA+pRM8ESIKsk6XqHNUvtkMB88iNk7vpaQigCD6ALfghEKbe6M+wbkI
         BPvJzBAEWGmXXWYNvYo+JXJSBV4EIeYIM8dZ4obAHV16w7Syh7C2fedijEUZNfhKmc/M
         h2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=UIOqvIl7xDfcrdTSa6EMB4Htg56pwX6vcT6tUP5VQD4=;
        fh=l9MANmrJnhS5ncp2d69SBpBfnsNnX67n8S9IJfBdmE8=;
        b=pQ2AAi3QW2dHEY+5eTWrO03SryCOaBx6iqA+WAk7UNENdzwctmA1XLlLTJJnz5yKo/
         zIQrpgU8nIQXIpMBYoiO1O797o6LdYiYsVhAUlNJpl12B6MBTKOzTCGDTamgfPxqPDqO
         Tw8eXBaTp9fAL/s0JKHobEOt9cA5iw3UfFLNNnGuIvYyykf9DnNcSl1vMvWb3ZHmAaMf
         JaWODfR7TWPJ05+NmNeCtHAt0XTfYs9SxGhxFzuZUZMQpjeuR5HkT1HFA+9QXo3tvjyJ
         4z8gJmezyLiZhwVwCV8eH/yCiCA5Dy+938n5xONBgPKEzwq5kGM27QnyKCg/QYiNzgOE
         4kmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786866118; x=1787470918; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UIOqvIl7xDfcrdTSa6EMB4Htg56pwX6vcT6tUP5VQD4=;
        b=DNK7zjQbCFx1tl6j2ElbKnHfh+TOvD1XKvrXhVXKzM7hGI4HEkeMbuWgxdGuQq0d7x
         mCCu828Xq3fOct6L6RL45FCi1XxF+NHia8EVM6JZxiobsdi/FnTiVfwqtIMMqfUrT57x
         gae1r6Vl83amnHgDTroAjgKG0TsPztMSO1ifB99cLP/O1hl6unjD/QVsSuuu/GzHKSJ9
         BxDwG2ZTinmLIN+kFsIG97D1p2BgTZsmeBc+F1621B5cCF8i4iufiTX1F0AlCx0w6b7H
         l2Onxw7kVFIRNxgefMt2YiIvKCwbiO0UCUXtlnjfMfnDE9FMhqLo1c10GVEIFtJGb++b
         51IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786866118; x=1787470918;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UIOqvIl7xDfcrdTSa6EMB4Htg56pwX6vcT6tUP5VQD4=;
        b=ju5Tqs5hASs0Vlisj4sz30PSMMH8pfM/kvX0+PWdyJ5kLzbdEtWCUeuaP4UJNwvVyq
         3MeGSdYpM7llpzDn7EnHog+NZuOH42X4SCY2B7yPL0r+IlV/e3NxH2eF56xjjvNDdPoL
         EZI4+370UBgbvF/4GLhz7tPwWmKCMXGpHPz0jbbQ7Q48Dtoo8EGfi66bPEs5zdO1QpL5
         vDMDxGdA97TdFbfpT2hYAhT0sibQHbED4m1h/aO5BIkwdCt7gmXFm8xnmERx1VI9jZlX
         XpVa+1XNcKxhh0Ccq9uA2OXxcJrxU5JXU82MZ7IhyhXhPtqHUp5OVL1CXLwaj1ojC/9X
         yp9g==
X-Gm-Message-State: AOJu0YxZzevyZj1futVhpApmI+lcgyi95C8zyF5ES8ukdb0hAwZB5Nmj
	rcs1/APt3KtAAAFO3JDT+r8/HYG1OqUe0fXZ8OFWJ0/2nTLXzwPIwUzkgqRoM2HK1E5RbdDgEA4
	loxNrx8K8SDLnnb/fXZtXHfogEp271OI=
X-Gm-Gg: AR+sD13PKxiGxXvrH43odZLBcWSXNfIZjsM4xPEjjkgshMSm1kPZblGDlhRLes0Rkzu
	0DEYmVXILyHjGuk1SRawiAlgEi76inkHMb+E4uzYzmcKlPj12Vux1BF3Knb2CcsfH3iXjLuTO5G
	6IhWjyRvPyMFrJl7HlWS10J1lsR2/N54OiiWj5R1Z7FiUAKazGke2hPEWlkeLzqtOi5hRBOWnh4
	ustzhHzwLPfBggCwMleIm1JQBF0yW0vyGF+tP4DJ6MjvJ4r6pLlyvOGPF56n9uayjClAHWZ/+Ka
	wlRESNlxiKUEL2YQs8sajCG/56pL+MZlv5QZy6C7
X-Received: by 2002:a05:690c:370a:b0:825:468e:e0eb with SMTP id
 00721157ae682-8371327bc01mr63323357b3.15.1786866118228; Sun, 16 Aug 2026
 00:41:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 16 Aug 2026 00:41:57 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 16 Aug 2026 00:41:57 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alexander Smoliyaninov <alexsmolya@gmail.com>
Date: Sun, 16 Aug 2026 00:41:57 -0700
X-Gm-Features: AcwNN1UI3NNRB9P3qcWjgYW37D2nM1o8f1bOtnqcf2JP7hb4GdfF2ldFrgZEWpI
Message-ID: <CAD4eaOyQ+MH0gpa=UgECPyWpWMDLC87Fnp=TumzW0hCUW8p6-A@mail.gmail.com>
Subject: [PATCH] rust: list: add SAFETY comment for HasListLinks in impl_has_list_links_self_ptr!
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"

Document the safety rationale for the `unsafe impl HasListLinks`
generated by `impl_has_list_links_self_ptr!`.

The implementation of `raw_get_list_links` computes a pointer to the
`ListLinksSelfPtr` field and casts it to a `ListLinks` pointer. This is
sound because `ListLinksSelfPtr` is `#[repr(C)]` with `inner: ListLinks`
as its first field, and the method only compiles if the field has the
expected `ListLinksSelfPtr` type.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/351
Signed-off-by: Alex Smolya <alexsmolya@gmail.com>
---
 rust/kernel/list/impl_list_item_mod.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/list/impl_list_item_mod.rs
b/rust/kernel/list/impl_list_item_mod.rs
index 5a3eac9f3..d84aedfdc 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -86,7 +86,9 @@ macro_rules! impl_has_list_links_self_ptr {
         // right type.
         unsafe impl$(<$($generics)*>)?
$crate::list::HasSelfPtr<$item_type $(, $id)?> for $self {}

-        // SAFETY: TODO.
+        // SAFETY: `raw_get_list_links` only compiles if the field has type
+        // `ListLinksSelfPtr<$item_type, $id>`, which is `repr(C)`
and has `ListLinks` as its first
+        // field.
         unsafe impl$(<$($generics)*>)?
$crate::list::HasListLinks$(<$id>)? for $self {
             #[inline]
             unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut
$crate::list::ListLinks$(<$id>)? {
-- 
2.55.0
