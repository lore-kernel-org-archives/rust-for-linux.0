Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6234F1411C9
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421561; cv=none; b=fPUr1fzrecghsWMXaBewi8IGLQZ1RAjRHhxS2q+61hAcZbm7sAVyG8yN6gGwVmhHKOqvv2PMl2z/ccsvJGfq+YiOXAFpb4u/5MfvfSi4j0zHVpYdEivy3frDuYt6s4Z8fUq3efqqEtOfKYctHd5whCDaTeZyGArnqhz1aKTcClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421561; c=relaxed/simple;
	bh=UzSuCue7NCSF8+MUHIK6CCCvZmZCMATYbk9gC0J0q9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VuHkwbreuX/0gaIpZmKXeNa0d1gpC3AxzH2agmlzORIDywLr8MvOGo3yE7PIM+GLkPV50WD1d5xBHqhkKFXd9pducEAvwpc45Sm13pLqyfl+LW0bE7jhrWW7+Ca4E2Az652mVC4JZya5+4WIEfRrxJ+DtOETJUHQQ59llJvkzKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BlPcM9ub; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BlPcM9ub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714421558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZB6GhDs07AycTbX7ZJHI829I39yn83/nt2wo88lr+c=;
	b=BlPcM9ubzgXwA6iCEDvw/QKkXxHT+Asfm/vpP9HXPKWTtE3lUlO2Vye9iJ8ez01jSXm68Z
	K5QOtoiXrU7ORQKjT/xKsnnIHjjj8T/yWO7Dyq6B9vY0gEfcmo0CWZEMGpm4qwu+9iunvN
	PyieeajA0Ps2LLxR2JAAE6lljLeSuJo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-dLiXTqpOOcK3nvZnIEaxzg-1; Mon, 29 Apr 2024 16:12:37 -0400
X-MC-Unique: dLiXTqpOOcK3nvZnIEaxzg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-41be609b854so10424515e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 13:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421556; x=1715026356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZB6GhDs07AycTbX7ZJHI829I39yn83/nt2wo88lr+c=;
        b=xHFpOpOJ1yhzebWmobv/oDsVQzbCjTlWqVTqd5D6wSVQ8kOdIXcBPdNMY83gWBhCBQ
         nbERVicgd5xi0VZk4dlBciVPT+qm6k0li3RX+Hgzupm5Gk9+2fmpFjAuk8zaUKC5iJit
         oPjaL64hT65LvbHSdVZ3Rw+NxBa0Tkg2GpWmkJyvm3LjuRAXULtXIR0ot5SC69co5TjU
         +68z7poL02xat+qamFxuUQfqS4cTQWqYMahfmd8u38wlMRmGadHKH7ZENOeWDcudCHO0
         CVwLjITR7sUqa/iB/Ap7FuF/bWT+ZYVkubh2DfTDzoaalCq9hjHXXyhcDfiQydNF8bbA
         ioTQ==
X-Gm-Message-State: AOJu0YwRTG0EttxsFB/QHjEDinu3f1CpcxlKU6Uo5MzBNeR/EfB6ghWJ
	hQWhSvd+rlHSMou8FAOuqeAd9zEEZ/W6ZFpTAZJPt0s3EDCwzki3wzsKpptPllCJPHDEhKWJTM0
	Hzv54JfVA7mO45Dz1VdkntFUC8HWDM6T9SHFv8+X11Q+XkqJ1dFI5YtQtARAzZ8sj
X-Received: by 2002:a05:600c:1906:b0:41a:7c1d:3326 with SMTP id j6-20020a05600c190600b0041a7c1d3326mr712853wmq.8.1714421556268;
        Mon, 29 Apr 2024 13:12:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHggGVY9QxxJaUXR9Y7f4Oje0gYrKnDnIN13sDREIWFcso5uQ6oVaJSCmetLTVSzlJx4KAuKA==
X-Received: by 2002:a05:600c:1906:b0:41a:7c1d:3326 with SMTP id j6-20020a05600c190600b0041a7c1d3326mr712840wmq.8.1714421556015;
        Mon, 29 Apr 2024 13:12:36 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id fm18-20020a05600c0c1200b0041b5500e438sm16895080wmb.23.2024.04.29.13.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:12:35 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	ajanulgu@redhat.com,
	zhiw@nvidia.com,
	acurrid@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH WIP 2/8] rust: alloc: use AllocError from core::alloc
Date: Mon, 29 Apr 2024 22:11:52 +0200
Message-ID: <20240429201202.3490-3-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429201202.3490-1-dakr@redhat.com>
References: <20240429201202.3490-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc.rs         | 4 ----
 rust/kernel/alloc/box_ext.rs | 3 ++-
 rust/kernel/alloc/vec_ext.rs | 3 ++-
 rust/kernel/error.rs         | 3 ++-
 rust/kernel/init.rs          | 3 ++-
 rust/kernel/str.rs           | 3 ++-
 rust/kernel/sync/arc.rs      | 4 ++--
 rust/kernel/workqueue.rs     | 3 ++-
 8 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index f1c2c4aa22d2..9bc1b48b5641 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -8,10 +8,6 @@
 pub mod box_ext;
 pub mod vec_ext;
 
-/// Indicates an allocation error.
-#[derive(Copy, Clone, PartialEq, Eq, Debug)]
-pub struct AllocError;
-
 /// Flags to be used when allocating memory.
 ///
 /// They can be combined with the operators `|`, `&`, and `!`.
diff --git a/rust/kernel/alloc/box_ext.rs b/rust/kernel/alloc/box_ext.rs
index cdbb5ad166d9..76653d6f4257 100644
--- a/rust/kernel/alloc/box_ext.rs
+++ b/rust/kernel/alloc/box_ext.rs
@@ -2,8 +2,9 @@
 
 //! Extensions to [`Box`] for fallible allocations.
 
-use super::{AllocError, Flags};
+use super::Flags;
 use alloc::boxed::Box;
+use core::alloc::AllocError;
 use core::mem::MaybeUninit;
 use core::result::Result;
 
diff --git a/rust/kernel/alloc/vec_ext.rs b/rust/kernel/alloc/vec_ext.rs
index 6a916fcf8bf1..1dc991b44be7 100644
--- a/rust/kernel/alloc/vec_ext.rs
+++ b/rust/kernel/alloc/vec_ext.rs
@@ -2,8 +2,9 @@
 
 //! Extensions to [`Vec`] for fallible allocations.
 
-use super::{AllocError, Flags};
+use super::Flags;
 use alloc::vec::Vec;
+use core::alloc::AllocError;
 use core::result::Result;
 
 /// Extensions to [`Vec`].
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index fc986bc24c6d..7151a5bd682a 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -4,10 +4,11 @@
 //!
 //! C header: [`include/uapi/asm-generic/errno-base.h`](srctree/include/uapi/asm-generic/errno-base.h)
 
-use crate::{alloc::AllocError, str::CStr};
+use crate::str::CStr;
 
 use alloc::alloc::LayoutError;
 
+use core::alloc::AllocError;
 use core::convert::From;
 use core::fmt;
 use core::num::TryFromIntError;
diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 9608f2bd2211..fec47b274ec3 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -211,13 +211,14 @@
 //! [`pin_init!`]: crate::pin_init!
 
 use crate::{
-    alloc::{box_ext::BoxExt, AllocError, Flags},
+    alloc::{box_ext::BoxExt, Flags},
     error::{self, Error},
     sync::UniqueArc,
     types::{Opaque, ScopeGuard},
 };
 use alloc::boxed::Box;
 use core::{
+    alloc::AllocError,
     cell::UnsafeCell,
     convert::Infallible,
     marker::PhantomData,
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 27641c3e4df8..2e7ab4a620b6 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -2,8 +2,9 @@
 
 //! String representations.
 
-use crate::alloc::{flags::*, vec_ext::VecExt, AllocError};
+use crate::alloc::{flags::*, vec_ext::VecExt};
 use alloc::vec::Vec;
+use core::alloc::AllocError;
 use core::fmt::{self, Write};
 use core::ops::{self, Deref, DerefMut, Index};
 
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index c2a3a2c7cbc5..0866378f1360 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -16,7 +16,7 @@
 //! [`Arc`]: https://doc.rust-lang.org/std/sync/struct.Arc.html
 
 use crate::{
-    alloc::{box_ext::BoxExt, AllocError, Flags},
+    alloc::{box_ext::BoxExt, Flags},
     bindings,
     error::{self, Error},
     init::{self, InPlaceInit, Init, PinInit},
@@ -25,7 +25,7 @@
 };
 use alloc::boxed::Box;
 use core::{
-    alloc::Layout,
+    alloc::{AllocError, Layout},
     fmt,
     marker::{PhantomData, Unsize},
     mem::{ManuallyDrop, MaybeUninit},
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 9f47bad0b003..0027cc730d6b 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -132,9 +132,10 @@
 //!
 //! C header: [`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
 
-use crate::alloc::{AllocError, Flags};
+use crate::alloc::Flags;
 use crate::{bindings, prelude::*, sync::Arc, sync::LockClassKey, types::Opaque};
 use alloc::boxed::Box;
+use core::alloc::AllocError;
 use core::marker::PhantomData;
 use core::pin::Pin;
 
-- 
2.44.0

