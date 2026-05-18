Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E4A3264C1
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 04:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779077544; cv=none; b=eIMuwceDNnsneEtvB/PKhJ6Vp/vNq8W2onpbBNuzXnDsqCkOJTkSfFRIPeFCQ4aQaOTu2lNKPdZh6iU5+fG4jttFQJzVX/bOiuAdM98pI/7X9OGArSXEtb6HHRt6UCjXLzgqFR/AapmCxoV+x7hVOq07U3FSMalsHKc1v3KYZII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779077544; c=relaxed/simple;
	bh=qvwDXjPW5bhynueugN2f9ofF5YULcfhZnUHLUqPm57M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtW1tO6r8wSeE66JnAKZZG9bvQgKywKpofoFqCkG6sRlAJexpJ+ZX80CakTV4mDxgFlhKKSusAxZtRJ+o/yHkp6JhVVB2POEuw/NU8VgsOjV4/CCCOBIXjp1fByLyq1JDDpqnnPzmItY3H5TVD7lwssQNPRMOtETWNdQOoca3AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+FqRKwd; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+FqRKwd"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bccd251d622so330084766b.3
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 21:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779077541; x=1779682341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hKaRnqZPoxVqBNd31T25m+TGbSK154FtvkgRcLvmLk=;
        b=U+FqRKwd8o9BZR8BwOFwTemQrUO82gpBINhsr+WhFn1dMFuUPQPGrY/IJeZsbDrZ1o
         iD0xUqqoDUCPj3J9vOGEhkxRMVKsiMGnT0HODOXkz6NXBZT3BnezTd1Y/xX0thoPDQeg
         VnOzpHb/EzLcI+RehLQQ0CvwLj8ZanC3pz+de9LjXqFISuWlhSnl2mbFwK5a93wYj8U9
         KYLw/+xmuj2Ifef+oz6brpgDb/mc1r3lsXQSH+DgnH2wKQuqddXFxeU3jolr7EW0zKgG
         zEpmQ1Mh0SctC53S2UuMYZU3hsT6MO8TpR7t8QYfYfufx3Bt5vBW1sPGw4Kbe8xBcOFG
         X8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779077541; x=1779682341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4hKaRnqZPoxVqBNd31T25m+TGbSK154FtvkgRcLvmLk=;
        b=gr+mkkc0rjzWSiESo7mI5YUi7YJ7rS9jVzjwGt7HWDVFrOxvHML/7foTEOmwPiSuP4
         4epCo5ctgHu+VWkens+hC+F3cJsTewkRjjTOApw5gTDrDzBPb8H0aV3QDyOpTeUNkcrh
         vfml0F5OaAIUcluNvp3khy7zxOk2VLkVH6HE5kAdOwOfci1gpEnmBf8Owt5fPml6YpTz
         meNIeUf42oq2HW3Z4iviBj3uPMWlzVwvkrB4MHfZybq02HIQVVYUJMz/Qa8hmZWWbhEj
         z58sKSND2xRbvyf7wXkhupKv4QCUUHx/vEvggD1ql2lfkiv3YFin7IcoMX9G0guuxl8A
         P52A==
X-Gm-Message-State: AOJu0Yw6H2FrQNjLK0posXFnTID9WVXzSsxFnH2flzzU885tbU3+ZevG
	MD/7oCYOIW1xm6dQQ//tY+I/8o5+iFvsQcbSW7glXc3hEChcX/IQIhxnLO98DlNZfZChBA==
X-Gm-Gg: Acq92OHt/WJSPNihl+pSBlKSg8lt6+Vqe2x6V9JQKZuAWXmFlNLyrnwDBVzpPBLKwgM
	oK6FWAqIl32M9Xa7wLg0j+hdPena3oflmAOqi7Nhr23VBHqVoCRx1LFXOc23lCa2wZYGCLR/pp2
	N7PdiP8pXdCkmIEzXP8I+4L8rLumPaZe8NrCPEA3JXDEJYYIoeFjGH6/Ic1ybs98y3pIB+eni2O
	gttCLbFc+b3TBZVRk7LW8cmKO7p+h2MZ5+3iQShcFMjpfhTYs1z9xTatL9rtp2So/tIYOpVhMOS
	ktgY/3i+eki8A8x0yIJN9Z3BU7nQ9ptS7sUbXIwE335CQCRqYEUfDnXt5LZl0/NZMJpX/icm/yY
	EaR+e3Lu4iHbTvcRFPWVsaQq6FQ4hD1i5D55lJCEYu5YXJ3rgqgGzpcoQ1XnRywlNl5DimZWoJo
	1RG4dVPwzE1R0xZ4x6VxQB7Wsxl7tt9XvGPAzNFWuPyYTT3g==
X-Received: by 2002:a17:907:82a4:b0:bc6:7238:bd4e with SMTP id a640c23a62f3a-bd51780cac3mr472565966b.5.1779077540721;
        Sun, 17 May 2026 21:12:20 -0700 (PDT)
Received: from moayad-Dell-G15-5515.. ([185.192.162.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c620cbsm513915166b.27.2026.05.17.21.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 21:12:20 -0700 (PDT)
From: Moayad Salloum <salloummoayad4@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	aliceryhl@google.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	Moayad Salloum <salloummoayad4@gmail.com>
Subject: [PATCH 2/2] rust: list: add SAFETY comments in impl_list_item macros
Date: Mon, 18 May 2026 07:11:56 +0300
Message-ID: <20260518041156.93133-3-salloummoayad4@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518041156.93133-1-salloummoayad4@gmail.com>
References: <20260518041156.93133-1-salloummoayad4@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fill in three SAFETY: TODO placeholders in impl_has_list_links_self_ptr!
and impl_list_item./update-data.sh

For the HasListLinks impl: the field type annotation ensures the field is
ListLinksSelfPtr<T, ID>. The cast to *mut ListLinks<ID> is valid because
ListLinksSelfPtr is #[repr(C)] with inner: ListLinks<ID> as its first
field, so they share the same address.

For the two container_of! calls: in prepare_to_insert, links_field comes
from view_links which calls raw_get_list_links, returning a pointer to
the inner field of the embedded ListLinksSelfPtr. In view_value,
links_field originates from prepare_to_insert by the method's safety
requirements, so the same reasoning applies.

Signed-off-by: Moayad Salloum <salloummoayad4@gmail.com>
---
 rust/kernel/list/impl_list_item_mod.rs | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
index 5a3eac9f3..e9ee078bc 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -86,7 +86,11 @@ macro_rules! impl_has_list_links_self_ptr {
         // right type.
         unsafe impl$(<$($generics)*>)? $crate::list::HasSelfPtr<$item_type $(, $id)?> for $self {}
 
-        // SAFETY: TODO.
+        // SAFETY: The implementation of `raw_get_list_links` only compiles if the field has the
+        // type `ListLinksSelfPtr<$item_type, $id>`. The cast to `*mut ListLinks<$id>` is valid
+        // because `ListLinksSelfPtr` is `#[repr(C)]` and `inner: ListLinks<ID>` is its first
+        // field, so a pointer to `ListLinksSelfPtr<T, ID>` has the same address as the `inner`
+        // field and is therefore a valid pointer to `ListLinks<ID>`.
         unsafe impl$(<$($generics)*>)? $crate::list::HasListLinks$(<$id>)? for $self {
             #[inline]
             unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$id>)? {
@@ -274,7 +278,10 @@ unsafe fn prepare_to_insert(me: *const Self) -> *mut $crate::list::ListLinks<$nu
                 // SAFETY: The caller promises that `me` points at a valid value of type `Self`.
                 let links_field = unsafe { <Self as $crate::list::ListItem<$num>>::view_links(me) };
 
-                // SAFETY: TODO.
+                // SAFETY: `links_field` was obtained by calling `view_links(me)`, which calls
+                // `raw_get_list_links` on a valid `Self` pointer. That method returns a pointer
+                // to the `inner` field of the `ListLinksSelfPtr<Self, $num>` embedded in `Self`,
+                // so `links_field` points to the `inner` field of such a struct.
                 let container = unsafe {
                     $crate::container_of!(
                         links_field, $crate::list::ListLinksSelfPtr<Self, $num>, inner
@@ -326,7 +333,11 @@ unsafe fn view_links(me: *const Self) -> *mut $crate::list::ListLinks<$num> {
             //   `ListArc` containing `Self` until the next call to `post_remove`. The value cannot
             //   be destroyed while a `ListArc` reference exists.
             unsafe fn view_value(links_field: *mut $crate::list::ListLinks<$num>) -> *const Self {
-                // SAFETY: TODO.
+                // SAFETY: By the safety requirements of this method, `links_field` originates from
+                // the most recent call to `prepare_to_insert`, which returns the result of
+                // `view_links`. `view_links` calls `raw_get_list_links`, which returns a pointer
+                // to the `inner` field of the `ListLinksSelfPtr<Self, $num>` embedded in `Self`,
+                // so `links_field` points to the `inner` field of such a struct.
                 let container = unsafe {
                     $crate::container_of!(
                         links_field, $crate::list::ListLinksSelfPtr<Self, $num>, inner
-- 
2.43.0

