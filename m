Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591A038AC90
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Aug 2026 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786867559; cv=pass; b=sgcLJafviru9q2M9vVQ/72E3LZmGujYOz2CEQG9cMiiPymsHpAL0LBrXHwKtMiI4+xXNJubCnbBazbKnZqLyEWVoJgX7/QwDx20QfUx/3D83INGxd7lJvW84xQXV8WLUNe6AubEaKQQLo616DcrxDBZNs66nIkJ5y5GgSI1XJQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786867559; c=relaxed/simple;
	bh=4H71DKFKue4ha02mwRVH3W1cR/3p6l//psqx577EuQQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WnLY5bL7cQLW6ZO4xhIs+RUoWeYBgJAzN9983mho2yxwoSAcAEVDfRZlwPe8INZy9PgpN/O65ZCkZ7UuyhfxasgmczkATUnGvFuL5X6LDKDkFaGm4USMFFVxxMcahjqSGje8NlWiA6mX5qqvmsCnRkh9BychMRaN9MoCf/5Okq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fP5T+lLV; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fP5T+lLV"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-836c718715fso28397737b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Aug 2026 01:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786867557; cv=none;
        d=google.com; s=arc-20260327;
        b=njVkyDuyYbTFBI2ZtbxB/jEj6jvh5aapaAqsTX5JwY5sqwHuf9nu+fb9/a5h2OSffr
         9Wgs1JQm5e2oJjbg4qMlHEJMIQGXavW3bnDzEWpsvgRmRFKuxRIX2q1f56VIJkZTJSFk
         NqOsznivzGhFdKEJJxObHqriMWYLZxBzvKkMAY2Zf9EPsjVTWjhTRFBSv67VyQPxJzpH
         rfHEWfH8zYJp5Iqe164Hz+lAraTRgImlLCo2jszECvSw+pvHTP8AmpP/iA121rZEjlXz
         7TVeKI+Hs2q0Puao6WMwZ2kzyXn+P2KYD7OGuiQ4jup69noLB5luW6V/qciKw+5TQmns
         nMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=StlUsK9zw1G2L8oITvi9ZhkJQGYcuGs/YnOzS0AQwls=;
        fh=KsoIyb7V6yFu48hq9T411J+4fxzW9y0qVkJ/0aOAxHg=;
        b=rQMm9VGwf5r0I5RXoD7uXPZ8Zl9kOD/tG9qysitDqUqNDgMMy3cou4IWjlqqMy5ryD
         xb6baOPf85BWUk/5n1H/ZE2C3zp14Bu/BumEohJ+XNzwAHwjgyi+WHg3UheHcfP8SgGZ
         i14OAx/tilzExX+aX5Mwr7V9zb4VXm+u3MLFgVh3QQjD8LAUj/ZC6SEGd0bnXkV11g25
         v35OvQs06X4KlSpkiJGsZSvGpl1/Sf9NKouUOnR+TiLJo19R19AtyP4lSucu2I5rsqe9
         yqByu1TP0hBbf9J7Iy2K8i1cKJUfnZ0EGdV6wF8BLyN78UxkFll4WySGGMP2E6c8b8jf
         N58w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786867557; x=1787472357; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=StlUsK9zw1G2L8oITvi9ZhkJQGYcuGs/YnOzS0AQwls=;
        b=fP5T+lLVPigt1oYnwP6LTXfgucVU9aXXOVRC3EFuEiu5xSldJrqzItaTjjMUbtkrWL
         ZhWLn/54IFZg/yZjIQWN65OsBSGKYf3hv6riqo939IxzNdxr0d9NNTev6aWsvVe9u3HA
         3v6qIDeyEJmJe61YLha5H89vxSJQM4oWzsV5V1ZVvwfE3sN84CGiXNsr3n3XKvTqa1tK
         MsmMyll6ltAI1nvVxOVVV2wOpwELEbJu8yEv2uL8NlaSj49Ll+stauy20uKerKnd7gnP
         qCrwClR5jhKXo1tIq8ovI5HPvXeZFDHJxVUFjrqcANXmouR0HBpj/2+k6WaZyqt53e37
         0t+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786867557; x=1787472357;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=StlUsK9zw1G2L8oITvi9ZhkJQGYcuGs/YnOzS0AQwls=;
        b=VivAKqgmHblVjj672sTVdeepp4cD8ArnTnwP+RvyC9oF01z948dZurV1+WkNEUcVdY
         FaFJtd29HQ1ep4b3nb/gBwWYphm46GUF2MV33mH7fpbrmFUpc4v/htta7aWZtFCPGWP+
         WGTF8JzI31+4C1zIbgzZMh88Abn3KbHnlj017FBZ46e2SpU6GsHlqejfKesHShQqdW/q
         lvyAnyVSQLNfAMvSIBfkDkteLsAKbEgTITsKhkB0Sl3TOHAmue8/iy3BJK8xcF634MrJ
         y6RboHZF16RI3YzmmsNV+ZnLbMBcBc5YpODnb98sKA0cKFtvO2ZhkkpFhx3EheItjFqY
         Eu6A==
X-Forwarded-Encrypted: i=1; AHgh+RrXcH3i4aOyiydmBGtmpOjkXDRiCl2zlPXURccFvtpx+xnuemqWJo2CVWSHtWJWJxf47MUApb26bCW4EMp8zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpT8LLxwRjtVZZ+nb7OldqI3dMFIbVdxUSGZIoYXOQX3WzM734
	ANGSVqCt7GbifMlYzSvae47ZS++NoIs25yilcWdZqogwpbe1q2uNchVN78VyGLFSlWT3nFKGo/O
	t8y6iP0Pm95+RHyXYjbZ+R25esCXr58U=
X-Gm-Gg: AR+sD13UccOQe0Y/IMQCKGQI7odaEUoFQE6aUHqwHLmjWTamIZ5jp7NcH8FyvNtk1PV
	Gpq70R3SIreHJs6S7DmIGCth+AvzlCpSmzmXqv8WGQp1WcfSg+9kEJBCaLabdJOo16wlUseshJT
	mbxCZaHOM7mWArTOW+d/a9F3/8B8FRYWCvBzcsrCtn1SASz7XTStK+3roumuQz9Wr8I8nREeqO7
	k8zT+ZvmGQBJJC11+PXfw40+WMcd+vIya3fWriI+UWVncVHuhQAAb+7d7aKwkRxUG9UP/BiqA6q
	fE7JM8OzF2Sx9aqqgcMgxwYyCTao3/xCGKWAmrC5IvY=
X-Received: by 2002:a05:690c:4382:b0:81e:4aa9:d02a with SMTP id
 00721157ae682-8370ce2bfc6mr44691917b3.6.1786867557210; Sun, 16 Aug 2026
 01:05:57 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 16 Aug 2026 01:05:56 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 16 Aug 2026 01:05:56 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alexander Smoliyaninov <alexsmolya@gmail.com>
Date: Sun, 16 Aug 2026 01:05:56 -0700
X-Gm-Features: AcwNN1XFYTv3cmUQkzzVPVdfLZC5oh8lNmR0IdT1s-H3zq9p_C8cu36PX9MDPfA
Message-ID: <CAD4eaOwGZR-gBM-R07+j0zQZ_b0NfCjYKgysT1i0oCE70gWq_Q@mail.gmail.com>
Subject: [PATCH] rust: list: add SAFETY comment for container_of in ListItem::prepare_to_insert
To: ojeda@kernel.org
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 8d8c1a4d0dbaa2653e667a0bd0b3b24df4d5ebf0 Mon Sep 17 00:00:00 2001
From: Alex Smolya <alexsmolya@gmail.com>
Date: Sun, 16 Aug 2026 09:27:53 +0200
Subject: [PATCH] rust: list: add SAFETY comment for container_of in
 ListItem::prepare_to_insert

Document the safety rationale for `container_of!` in
`ListItem::prepare_to_insert` when using `ListLinksSelfPtr`.

In the `ListLinksSelfPtr` implementation of `ListItem`,
`view_links(me)` delegates to `raw_get_list_links`, which yields a
pointer to the `inner` field of `ListLinksSelfPtr<Self, $num>`.
Therefore, `links_field` is guaranteed to point to that `inner` field,
making the `container_of!` calculation sound and in-bounds of the
allocation.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/351
Signed-off-by: Alex Smolya <alexsmolya@gmail.com>
---
 rust/kernel/list/impl_list_item_mod.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/list/impl_list_item_mod.rs
b/rust/kernel/list/impl_list_item_mod.rs
index d84aedfdc..c2a1f77fb 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -276,7 +276,8 @@ unsafe fn prepare_to_insert(me: *const Self) ->
*mut $crate::list::ListLinks<$nu
                 // SAFETY: The caller promises that `me` points at a
valid value of type `Self`.
                 let links_field = unsafe { <Self as
$crate::list::ListItem<$num>>::view_links(me) };

-                // SAFETY: TODO.
+                // SAFETY: `links_field` originates from
`view_links(me)`, which returns a pointer
+                // to the `inner` field of a `ListLinksSelfPtr<Self,
$num>` inside `Self`.
                 let container = unsafe {
                     $crate::container_of!(
                         links_field,
$crate::list::ListLinksSelfPtr<Self, $num>, inner
-- 
2.55.0
