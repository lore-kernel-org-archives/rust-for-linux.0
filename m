Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339B81CFD60
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112976; cv=none; b=to+WOYui/aP7iks3EuiZYlqkcQ9Nj1vlz/YxDzafzuav7kgd5Lt80F5jAgSbtacGK4DHv59p1eznLt56hFojzeuMKd2khVjLZpGEzQfTR9EbL6LoA9O+JZ2W7rHpfu3reCXQiTdYqh2iNO1GRL1KKlEQgzIhiGMeyFP4iMG6Ba0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112976; c=relaxed/simple;
	bh=p0HGLvz39MagYLHLnfr1oEDeeFWEr8ljFaHWqx1Mx/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZzL8aPBiVFaybPYVgAoV3zKJg0TxtYe1wL7IKsXlEzi1/Do3axzHkBKJ/laU/clTU13+k42vHhBDyeCc6CoGgomGt1kMc3itZX9MBBZ4Dw6EcM56aVwUy/pamj5q6TYG02mB5pzC5ORKDXzleLkoepPEkRxq7QjNRI3wac+Kmc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O4+nkH4k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O4+nkH4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hONGpcUApGTU4b0CZyPLQC6URu9ThOSHp+V60iJ0Myw=;
	b=O4+nkH4k2TmfrToUMkiPByOEv+z+1DgzSZdlaJMds1AJdN6w7DCRzIHZyDbWjqSR/VNaT/
	JxCRLXij/UOvq4MNFDLXeAtfYj01c01WJtzECcaYPnlaPO6aM15jCq+cSXjZxRIrsgGOL7
	fY0Z3io9/jB+U64WZePDM9/Opl2Tqek=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-xa9YTp-IM3CWl_Ojv4IttQ-1; Thu, 04 Jul 2024 13:09:28 -0400
X-MC-Unique: xa9YTp-IM3CWl_Ojv4IttQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52e9557e312so779838e87.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112967; x=1720717767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hONGpcUApGTU4b0CZyPLQC6URu9ThOSHp+V60iJ0Myw=;
        b=FnxGDaFfoYegBDugLDaf23a4po/Mf8y/atBdwN9bvjvctg2TdhmlX/BoQMApNVCxX4
         S+H02k+MkrT/BluvbNZumh6k7SnIuScI/tSAffuz3Ja2wGQQax3okngDyyCkFl2PHWeM
         aCseJkZlX1wIMbUyjax5B019Cv4W/eF0j0Q6p/OD+o08nukP+T6v0Mb9mNWHZmXMPoVf
         41rRO+yyt/BSxNOAxSo63/zw+MG2KhO3o6nzFEe87dqbDVe2LEOF6Nm5KiSatPlL3/JW
         d+P1b4tmvEsjujB6kfaH0H9+iiQaMVavXPNGNtK2UkvmjQWYrnY7JQiUm/rcJmZxotLU
         8Z0A==
X-Forwarded-Encrypted: i=1; AJvYcCXfnWs0CshDCOOQFNr5BpCRMyGSr87eeKNPnx+pRqTBz/e3+H1IPVsL6KHJR7RtxFGM9Lb2GOMo7ETlXnX58c3qKvDDyANTU380C70RL4M=
X-Gm-Message-State: AOJu0Yy40mQ7yH6ZGKp8fGJNH/mS16E8IGGg4+wWzhSEaSteN1NPUZIx
	Z9OSVwmU/o2BWYXBbjkCHa3cCf76nlo4DjLHNE1dbYlD2bT6ItUyR2B186+jzEWtzGy5384DGmk
	8IJQKU8QN+xm2nJCxHNrySfhVcDlZFyo8cbiRLhHWG3qxlDCLc5h5GE49TJGn8MSZ
X-Received: by 2002:a05:6512:466:b0:52e:7684:a385 with SMTP id 2adb3069b0e04-52ea06e5329mr1615799e87.52.1720112967319;
        Thu, 04 Jul 2024 10:09:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNkphbX7wDz7FOEWh9y4mJC6b0DinFkiDszVdH52GQKQkvJI8z95H8cNwAYSlHgH0L4utJhA==
X-Received: by 2002:a05:6512:466:b0:52e:7684:a385 with SMTP id 2adb3069b0e04-52ea06e5329mr1615776e87.52.1720112966875;
        Thu, 04 Jul 2024 10:09:26 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d5100sm31134025e9.4.2024.07.04.10.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:09:26 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com
Cc: daniel.almeida@collabora.com,
	faith.ekstrand@collabora.com,
	boris.brezillon@collabora.com,
	lina@asahilina.net,
	mcanal@igalia.com,
	zhiw@nvidia.com,
	acurrid@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	airlied@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 18/20] rust: error: use `core::alloc::LayoutError`
Date: Thu,  4 Jul 2024 19:06:46 +0200
Message-ID: <20240704170738.3621-19-dakr@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704170738.3621-1-dakr@redhat.com>
References: <20240704170738.3621-1-dakr@redhat.com>
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

Use `core::alloc::LayoutError` instead of `alloc::alloc::LayoutError` in
preparation to get rid of Rust's alloc crate.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/error.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 55280ae9fe40..20306588bc9e 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -6,7 +6,7 @@
 
 use crate::{alloc::AllocError, str::CStr};
 
-use alloc::alloc::LayoutError;
+use core::alloc::LayoutError;
 
 use core::fmt;
 use core::num::TryFromIntError;
-- 
2.45.2

