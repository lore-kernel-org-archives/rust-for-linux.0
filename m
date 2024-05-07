Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EAD18732A
	for <rust-for-linux@vger.kernel.org>; Tue,  7 May 2024 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715113038; cv=none; b=DgVXygPpJ20ViiUUrMpSdxRvIzPBEa4JlfTJzWwjrIwlYIfqlL+stZCzkNvcPQwo/3yq5tMo4TBIDRaJDGu/mWnIDpDKa09SfQwlVoTKsdMEWBw8UomCZDqP97ekmt15yvXwo4W7shE5bpHtym/3voMe7FA6aOyUUrMUmVIZ8vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715113038; c=relaxed/simple;
	bh=SgiQ4zGI9XoRmzRQI/EtxJoMsLhTcGWfKi+ngZCyAsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SAJgiLceMFMUH6ybWaUaVgSjZTMad76mHByG/uUEsAc3eTNnyNHTPrRlCgjikOr1U3LLPVqJKs5OWrKmYZQ7bKW9gbKNaAGYLPfhQrBMqJ4rLadY+fjo1s5ObiL0Kv0UUfM41siZUTshVb2Ge0tCv7lO3v/F5GgW9EZteYqyhzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q3lUCv2a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q3lUCv2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715113035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=80D/RaJpNnwB0rcM6opQgS6VFgdJyvfvhV46CUuAkMM=;
	b=Q3lUCv2aroU6jM4y8vgwALIBLFQUcFMphjGplqgd3dQUELfYNiWHmi4A3F0gDxYi/Sziuo
	SCTt/fMikzE++nfSKA9FEuf71tylSY4ZkNqOjq+73yPHVY4w2Z00Lm6l32tCLw5udryKrM
	3zjgoPzhBIASskOWqBpZl299RvCp6uc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-0tcmeDD5NyyLTTHWNl5RqA-1; Tue, 07 May 2024 16:17:14 -0400
X-MC-Unique: 0tcmeDD5NyyLTTHWNl5RqA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-41c05442f92so19795105e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 May 2024 13:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715113033; x=1715717833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80D/RaJpNnwB0rcM6opQgS6VFgdJyvfvhV46CUuAkMM=;
        b=pWdcii01KVsb0q8ZFmgyH5pAeJIVChZeWm2h5I/GDY9O38V+jRT+d2v9Tm6+yAH42s
         oLzifegpF0ux9gu2zsZctXolLuBOksipoqtC5I0W0MoaSfQfetKwYPSu7nbXfh0y4VOv
         jpKZU1xAvSnFh2Js7NQlEJIseZo/nHHXPMnBtzSg5x251OIXUL9HXTwrLP3qUoSIZBNR
         JLJsIhSlffqXA2v1ALsbgQA+I3uchgtNVvDZnzKjGMI1msetNT4HgukLiUSaFIcOI6Vv
         LY5R12ZkQFrqVAbc5BEnBCWIgGqO2uIcmEl964c/n413LjeSetbhVKrm4qzWcTmBk8FO
         zzSA==
X-Gm-Message-State: AOJu0YzG5HDzdH+0+gwVZevJs6WnpSM8X3+RgcSiWa20bUXD2vbXQPhg
	UKMHCxKiQU3HKByLKkbGgJB5oZ4lcXs05ATkpfZ60Ekpd636/SaKExEtcmqQprVk7dn3iRaZU9K
	sb1IgrO1GLHbTXR7Ev5Vw7RD49tkVOuIgQuHOjscZ2QSgk3o13dDR4TuZPjn892Eb
X-Received: by 2002:a05:600c:354a:b0:41b:eaf2:f7da with SMTP id 5b1f17b1804b1-41f71cc1aa4mr6664585e9.6.1715113033303;
        Tue, 07 May 2024 13:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaFcUEZm6HhmNhI8dpbKPbaLy3jsex5fkpfQvAH8j33YaCam6gdu+BVOKqWJxfNNRNY5Obvw==
X-Received: by 2002:a05:600c:354a:b0:41b:eaf2:f7da with SMTP id 5b1f17b1804b1-41f71cc1aa4mr6664415e9.6.1715113032946;
        Tue, 07 May 2024 13:17:12 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c3b8c00b0041bf87e702asm20842100wms.10.2024.05.07.13.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 13:17:12 -0700 (PDT)
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
Cc: rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] rust: alloc: use `if` instead of `match` in VecExt<T>::reserve()
Date: Tue,  7 May 2024 22:16:44 +0200
Message-ID: <20240507201709.105693-1-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
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

In commit 1161057f53f6 ("rust: alloc: fix dangling pointer in
VecExt<T>::reserve()") the check for zero of a vector's capacity has
been implemented using a `match` statement. Using an `if` statement
is the preferred style, hence change that.

Link: https://lore.kernel.org/rust-for-linux/2c69a6eb-67a2-439c-ad27-70be130436d4@proton.me/T/
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
Sending a separate patch since v3 has been merged [1] already.

Please feel free to melt this patch into the original commit.

[1] https://lore.kernel.org/rust-for-linux/CANiq72nSQAE7c8ypWQA__BMoaBYqiEjXvHpuzn-=CsCky9uu7A@mail.gmail.com/
---
 rust/kernel/alloc/vec_ext.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/rust/kernel/alloc/vec_ext.rs b/rust/kernel/alloc/vec_ext.rs
index 8f16b919bf4d..e9a81052728a 100644
--- a/rust/kernel/alloc/vec_ext.rs
+++ b/rust/kernel/alloc/vec_ext.rs
@@ -141,10 +141,7 @@ fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError>
         // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
         // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>`'s capacity
         // to be zero if no memory has been allocated yet.
-        let ptr = match cap {
-            0 => ptr::null_mut(),
-            _ => old_ptr,
-        };
+        let ptr = if cap == 0 { ptr::null_mut() } else { old_ptr };
 
         // SAFETY: `ptr` is valid because it's either NULL or comes from a previous call to
         // `krealloc_aligned`. We also verified that the type is not a ZST.

base-commit: 1161057f53f643b63060835d46461ef09e8abe2f
-- 
2.44.0

