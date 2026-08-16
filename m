Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D07238F639
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Aug 2026 08:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786867568; cv=pass; b=KSDZN0VnhCRTLLIru3D9jgCn/6/caYAxaDjpwKmDKsCz+CDsd6/dDLgCiAOzO+n/uEPjkyJ/D847hAUM0uJVCI/RRzv07iqPCiPQR+HaTcSGNsZRPGnLARnKZJGzLN12gQ6kyzcXPfDUW2MHqsxSac+QT29qNSCIpGJtZaxQZLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786867568; c=relaxed/simple;
	bh=spN01miLZ+1EuMHCCi2TsGrFMZYCSvwaVtnaL2vV8/M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dNMQtSoq3+KESEfPIGtX60wV+Q+iV/9IbryL8OCrfvj9S5AOYV7NTKUKUKf6VtNR7gBBifB8FYPpgqMK4+BQKlCijhL1VLeIPkVdQ1sm9GXrNqt7QM4PcjSl3lU2R3+E3EAVYYbd00EDQJQQWQoqNdQIRBZFv49HEz+ZSWfWOFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jC0E5CPy; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jC0E5CPy"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-836ce5d6e85so34925057b3.1
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Aug 2026 01:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786867566; cv=none;
        d=google.com; s=arc-20260327;
        b=NLXjylgejw8PHRKN1T4UNYWV5Z6o/Lm6EPzmbaFUknRUFFnHrfZuEff3ixKYmMr6eU
         AiONcSfYl2dy+/XySppMrEL9HtEpRYYG3FpwXtuKoG6JJJaIxKv1bCB4wRBNfuiye19K
         kcHuVm8wrBo1TAg2FL/k5rrcWZtFdUxfnXCnXZkGot3iqhSj0S2o6MShe5tXg6d8M1gu
         jupyDsTMj1RX47hLRLQspZpnGsTZyfne4DH2LqXbw+Wpm+eXJG+ipjH5GTSvvIt30oiq
         3XnuzgGb/M+9uE6+e2tFPuBUU9UclGHMaHcVo1qH8lAWvlG56wKQLMHPR6jIMAPe8h1y
         PxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=kqZ0XBSF1HGWqR58xlsXfstkBupWwokqDVn/yufUMU8=;
        fh=mP16Eh4ekck+fRIpJpNOY2O/mRp1IHm6RwoMAfGBMqA=;
        b=fIQocAUjP52tsleEhJb7sqqIiL6+FNIas+xsAUt1y4WPeRA1TdaZjjb21QnExOOSSq
         q1pazy6jVagkcHXVcNZK7EqLj79qvVqiwAZ05hEGIYRpei8U7EAdsz3r4pJr3lsKFM/S
         zVQqGGtZQX3Tk/V5JhJwAd305X3GyLdOu5IpKc9nFXrT9Ujh+l67EfPQe70t7vpODdHI
         6pYbiZiK8XXjFsrnE+rkic3dXqpE9zFJ2+x+wZCexVXAFOlr3zWy4eEKI9qh5Uz90nJg
         VAcvBpuX6t1z/FIoLs+6EzBB9qatt2VMjyZ/pxQvi0RqkGFehRrLh/BCVtFFzdm730T3
         9kwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786867566; x=1787472366; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kqZ0XBSF1HGWqR58xlsXfstkBupWwokqDVn/yufUMU8=;
        b=jC0E5CPyxPXy7XzTVkJhm6hA/2eyeOqK7ymVWwGMsfvdVmJ0X0kWTQBqz0I4QwGwdG
         9W15W8W1P1/ZklYSFcxi9RNSud23/M3A3kKggKTg1MZi/rfEvMzu0yyo9uhRQ2Vcv1jJ
         dgbriw9AE95+DrYASbQz6tSn3aWR1hJQOpvjW80y+C6BjcFAd1MZ6ZR9W4BVBPIyrUvO
         n4cM5+qgo6pedSEspLofUS0tWVvykPjttFptwMMngYvRSEMb3zXO+Cv9sb0LUZfBgjSl
         Gwui6Pp3jAsl/z3usvAZrfHL01xHvnRLkw6PMuCqmc97VmVWRAhJOEj40CnY5cYGvjUz
         mRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786867566; x=1787472366;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kqZ0XBSF1HGWqR58xlsXfstkBupWwokqDVn/yufUMU8=;
        b=nzDm66fz5+19C/0iAvdZ5Y01BU/JyoTCRW71PlrnzdHH3a340E5WBqfyI8aDNHapUy
         2AnPwRobJbiCoLsx3aANLFQcbNycFgEHKcDAJ5qpg4oqZVszB8jCrNFFWAXamfngNn/s
         uNyPsYaWOFwOAzH51PBF7NxisS2Nt0emGnJwUgToX7KW+02E8bxL3ZFVlVGo7kNydNkV
         VVqVp0EAkpRGqYA9clAeBFx5sZ+lasSDSzc+OrrayStfnRUoA0EfQoF3PDVjzgU/n90h
         1qdSFBjq8A3SHLBuxLzf8ylEHFTzzxFIBZg70JoJ0Ft1v5ZUODp1wsRQTrAPMRyHZJky
         t4Pw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6VCgU8JhPAN426NCTw/vkdCZqSPPGrU9akTAd1JygThY6CC////o/p7kD7IIZket5WAhJju4lj6SurAPkYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFnl+hhjhQrHsFznkp2z7jI8ipBYq3nuneKUeVsKiuawgO7HbZ
	9iGa5cioaLpog10pB887a0e2QyBuoABvI2bW12nxwgCFEXTO8fyz9flB2nX5J+KMe8iQ3S7UvKs
	G9Gx+cHHWOu6fATuL7z6HFXG9wdXbvxU=
X-Gm-Gg: AR+sD13kNtzEKut5tpRBo+QYCL8tK7mfgqjkLDOnw95CLFKDI9v6Ltf9k3xJvhonbqm
	LF4saSRsWEZm39rbB+RP3dHStrIqxB2mQi2nyi2kFwyRHbEsBBzTvVP8fLi/UdiPbplfHu1NOFl
	xSLclYOo4ydMh3ojpqprQaaqD9mmkoJ4GHpIN97lLSRAaIQ63pqrc6n5bnIzgJzgU6K7GtXfswM
	5TzhhGahiejfFvngHslza68XiqJYoovcCHciK2O72YFG6G7hYcd2e3IO3OFMRNVvZ3t7B3qfa9V
	cSluS2r1mI3nSGtlP9Mj5RfzK9FfjoAuidjergEm3hA=
X-Received: by 2002:a05:690c:d20:b0:81e:799f:d55e with SMTP id
 00721157ae682-83710b8b446mr63979557b3.19.1786867566325; Sun, 16 Aug 2026
 01:06:06 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 16 Aug 2026 01:06:04 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 16 Aug 2026 01:06:04 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alexander Smoliyaninov <alexsmolya@gmail.com>
Date: Sun, 16 Aug 2026 01:06:04 -0700
X-Gm-Features: AcwNN1XVHQN0yNPizzu4Mk1FiSzGE4Vrd152VeFm6B736_YPIllOd0hEDxUqbjI
Message-ID: <CAD4eaOyRQiJM-j45ofO17dkpD10o-NgdSR58Owv1QA-PJXvoGg@mail.gmail.com>
Subject: [PATCH] rust: list: add SAFETY comment for container_of in ListItem::view_value
To: ojeda@kernel.org
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 500f0ac27706fe5d41d82659525bc52b7a46d33c Mon Sep 17 00:00:00 2001
From: Alex Smolya <alexsmolya@gmail.com>
Date: Sun, 16 Aug 2026 09:57:20 +0200
Subject: [PATCH] rust: list: add SAFETY comment for container_of in
 ListItem::view_value

Document the safety rationale for `container_of!` in
`ListItem::view_value` when using `ListLinksSelfPtr`.

In the `ListLinksSelfPtr` implementation of `ListItem`, the caller
guarantees that `links_field` originates from `prepare_to_insert` or
`view_links`. Both methods return a pointer to the `inner` field of
`ListLinksSelfPtr<Self, $num>` within `Self`. Therefore, calculating
the containing pointer via `container_of!` is sound and in-bounds of
the allocation.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/351
Signed-off-by: Alex Smolya <alexsmolya@gmail.com>
---
 rust/kernel/list/impl_list_item_mod.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/list/impl_list_item_mod.rs
b/rust/kernel/list/impl_list_item_mod.rs
index c2a1f77fb..423afbf84 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -329,7 +329,9 @@ unsafe fn view_links(me: *const Self) -> *mut
$crate::list::ListLinks<$num> {
             //   `ListArc` containing `Self` until the next call to
`post_remove`. The value cannot
             //   be destroyed while a `ListArc` reference exists.
             unsafe fn view_value(links_field: *mut
$crate::list::ListLinks<$num>) -> *const Self {
-                // SAFETY: TODO.
+                // SAFETY: The caller promises that `links_field`
originates from
+                // `prepare_to_insert` or `view_links`, which both
return a pointer to the
+                // `inner` field of a `ListLinksSelfPtr<Self, $num>`
inside `Self`.
                 let container = unsafe {
                     $crate::container_of!(
                         links_field,
$crate::list::ListLinksSelfPtr<Self, $num>, inner
-- 
2.55.0
