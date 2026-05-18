Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33686241CB7
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 01:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779068397; cv=none; b=Zm6igQ4JvDxMOLz6w7qpzJjQ8ggjbrSJegn+CJDYakmO2ym9O4p4dCrznLcu1qasTeBnUWtly7JE/cZ9Q08LqNyMksSKOI7GH5IGwXoxPfLZF+MamOc88zwM8Te8tpqh+TXXweDPZ/ot7eo5zOKFXweG0S+VPaYXTsWAHZMa0DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779068397; c=relaxed/simple;
	bh=qvwDXjPW5bhynueugN2f9ofF5YULcfhZnUHLUqPm57M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmvb/vYVnPZIVr8NzGtJGaLZKjcFdHH2iSWUQnASubUfky9l6dT51IxDQocTU41PAjttFbyYOwRq6yuAzg2KXpxl7NSodWY3/5Ay2yCmA2dRQ437WKuDNzugrUwskeWYph9T5d9y9uMmLk+WdKUp4b1E13NKLCA4jcvQWjwSD2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0lfNMil; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0lfNMil"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bd6460b0d11so263985366b.1
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 18:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779068395; x=1779673195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hKaRnqZPoxVqBNd31T25m+TGbSK154FtvkgRcLvmLk=;
        b=M0lfNMil8M0zh7xgsP1uXVpx+BZH1DxJwUGczDo+n9IFNcV1jN1WqKC8piontz35Sg
         8K/czlwx8bUxGwDUQeDVcwDs5ecnu8yCBx5dp7gVVa3WHBEZRO/+BKkTS5ibtncDc/Km
         /kT/P0N5v8eAqu7MI25S5GmSPEyIkVpqBmdoNt9vJu5rcC2HyVl0UN8yrBIyfPkrw19I
         3M0IN0UN6Aw0hkUnU+YNGpBXsOaOkGXb1C2TawFOjN94JRBkLP82vUK+fI4tE11xs2az
         pAJuvmpwN/w3xfIMbzX8jO+t63blXrBumtRmE/xjw86ScQGhy/XsruVwOPsbccXig7rq
         PYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779068395; x=1779673195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4hKaRnqZPoxVqBNd31T25m+TGbSK154FtvkgRcLvmLk=;
        b=DwyOOrjMS9x/R3Prh+qToEGouWTCVlN3iOm5W22l5CodGQnsFRjYJBQWxsDql/ul37
         JutdQX2KXfOYfJcu+nh48Uxt0OWeZAWDMEfJgrKDkJA7UWSZ2q21YQ/CMDnSMYPO2gRX
         UNEvZodYfWTaeFJyPi8F2vXJ556C/2r5udjP2VOv9kFkaKLYdeEHhDxZK3Xj+fQZjnk4
         3h2VetfGI1AITqp+JjHC30IosejSlxslMraoroSkncKUMQyvOOCEGuQ9LYn2OiAXcVUa
         +FfhDYJ4tzMgHWp4USCjthz7QTEp2hawwSPrD5P7uspc2YtpjiIg9CMFT4QQ3VOMultE
         z97A==
X-Gm-Message-State: AOJu0Yw86/7m9BqCn53WTq+7dlOVtN1pIKwO2twKwxIyPqpiWCvhXRU4
	C5iD80sJBeHj0yBjE48Y5fcvFXHIGmaNVU7tlDIQv6KQtcj4p/ItaWDPHVC/vvHBGkvPXA==
X-Gm-Gg: Acq92OEUjJz5/0Ipeeg7bSuSX+6W9gsUVDcEw8XmJ4x5KYdxX1NM7t6trp5XyP9aHLs
	qQAL7ffsjQWiYMGZ+9U1OCZwDoh48SAd/dictt2fs1bF+XU9MrVH38FdVTI2pGFX0VUOJEvfL34
	d2F8nainW6hZRCCCPrHZyTjTRF2hqQP3enFlY82asK3ytbghND/iXHeKQly7o3CPvh1HYHmX1RH
	U5CR6XTercmXy7E7ousJ0/88+kSAj51zNcf3aV1EeUhl4OX8ajA1K9pdNl2QC+NkzrkxXtDuX+k
	q5RsMkDknYpIAX6n0tCnCVUorlTBEciRqLDsIRhgyMgZiZkPaWHpLUh7yo0QA1677/RSrqohuwW
	kU8KQ/VyCdQaRGAdxvBoTjj+R7i7iQuqph6cGkhyb02muFFF6cGtEwbzYZYp01E+DLlNqR3d5Gt
	KWEOxvLVZrj1KVdVQHTF3c24q1PFsYtEybxtJbBJdR5Bcf7O6UikZ4Uoo=
X-Received: by 2002:a17:906:4784:b0:bd1:4da0:b0d3 with SMTP id a640c23a62f3a-bd51776c481mr586447266b.9.1779068394464;
        Sun, 17 May 2026 18:39:54 -0700 (PDT)
Received: from moayad-Dell-G15-5515.. ([185.192.162.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1116sm507533966b.10.2026.05.17.18.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 18:39:53 -0700 (PDT)
From: Moayad Salloum <salloummoayad4@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	aliceryhl@google.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	Moayad Salloum <salloummoayad4@gmail.com>
Subject: [PATCH 2/2] rust: list: add SAFETY comments in impl_list_item macros
Date: Mon, 18 May 2026 04:39:26 +0300
Message-ID: <20260518013927.58481-2-salloummoayad4@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518013927.58481-1-salloummoayad4@gmail.com>
References: <20260518013927.58481-1-salloummoayad4@gmail.com>
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

