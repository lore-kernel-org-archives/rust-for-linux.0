Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE30914039D
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 20:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421557; cv=none; b=ALCZ/93UucFquMK8j8cNd7xBy7zTI2LLx1qQBzCc2JzNJrPB1ieBo4F46qCnFYMzcOWLDm04cCwQpCDF7wxANgs6JOXAUlVi7IBc/WPjNEoYoUdAJkAslTzuAMeu858Ysdi3KJZbwND60BFZ0O7GYK5zCme/CPP/rEFNEVxgvIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421557; c=relaxed/simple;
	bh=7Rw6oHtZE0HVviOqFmzxDEkBzCN0dAdjRPvLcrI4qGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eFuObjI92pm76NHNTXTRhDeCOjjFG1ucMduIS7aVf1cN/MUtqhNndhhPWaJhUrhSAo81PctOgUnb5r7qbMt0tkwqNZAtwnLNfAV+ZGsFWjHhxLvQgyo3/ZcUJ0Dc/Bucmt51XpebyyDFfU5MELJGR+ttsU4tLscpLxbukX+3wcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a1W66bxR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a1W66bxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714421554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wtt6YExF5M4OAPl3+UIh0S6Tqultx52XlAUrAwUyoYQ=;
	b=a1W66bxRx9QXGpRWU3Vpkmg6+6NqsFeGVuZtyfdX8O0wjYEtF85L1Zs4ti5ePFL68NG+Om
	zW14RkION3Y5dsgXbvJ+2hPjA2x5DJX2z4Ufr/C5cHAXliixXi0ZHojAGrkdEc+zG50iNJ
	+GEoFe36cnH5e52xJSbQ3pbTCokYJoA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-FLQ1nT2rOvakJRBNYq1H_g-1; Mon, 29 Apr 2024 16:12:33 -0400
X-MC-Unique: FLQ1nT2rOvakJRBNYq1H_g-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-34a4ded7d49so4731603f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 13:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421552; x=1715026352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtt6YExF5M4OAPl3+UIh0S6Tqultx52XlAUrAwUyoYQ=;
        b=qmhDPhllBRAc+vsSKy3YXeIVMZO6keTSRPzHVEWIKNdROOZKAQgIPV4VEBds5St55U
         JmvqIDsrHmqGktwC9rqCujUVMFqWzHDI7KGhYa/GABM51fy7cLJZuqg2n7tc9jKI7OO2
         5e11A9j/Vaeh8E6YN3QYr9XpQj7ANSwVMFcJFMqdfzkvJVSK88DmInvirdLEH5zBlTaJ
         juGRjDqVTFFd+rov9s6iJQ2YgxGCId2/j5n8OPar+4Ir+9qL8HKeIW9v2E7yEJo3kEkT
         aGILlTxS/sMgFG/pUnhm9uie1mUgyM6NKp13xb/mZHxVWEG+RAI1CLwgvAu1FIQodYuS
         vOLw==
X-Gm-Message-State: AOJu0Yyr+WoIubLP+61w1AL39yCdKHJToCN0JUkTVrkt2R9O5s9WO8VR
	VFV9quRuiB3bys9G4BsFYpkmxh4ZwdAHnTH2b6VsOSSpCHkldoyQAcTeHQmVddumHa5wtaPuXDP
	uiucI+iUwexADkuLdD/RmU8O8ZjpklD0aKc2G8bsEEBq0ZRqRTfESPkjSzJipP+Mm
X-Received: by 2002:a05:6000:156e:b0:343:ef64:e0fd with SMTP id 14-20020a056000156e00b00343ef64e0fdmr8868683wrz.52.1714421552250;
        Mon, 29 Apr 2024 13:12:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcuJO+NMfP9sUUbTGfk7Z4+7gGZjhNnQAvQ+Dr9Ex+aOPEeHBq/GnXVVCpeRssslGtEIew6g==
X-Received: by 2002:a05:6000:156e:b0:343:ef64:e0fd with SMTP id 14-20020a056000156e00b00343ef64e0fdmr8868666wrz.52.1714421551927;
        Mon, 29 Apr 2024 13:12:31 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b00419f419236fsm34089379wmb.41.2024.04.29.13.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:12:31 -0700 (PDT)
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
Subject: [PATCH WIP 1/8] rust: alloc: re-enable allocator_api
Date: Mon, 29 Apr 2024 22:11:51 +0200
Message-ID: <20240429201202.3490-2-dakr@redhat.com>
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
 rust/kernel/lib.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9a943d99c71a..1e910fe7c2c7 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -12,6 +12,7 @@
 //! do so first instead of bypassing this crate.
 
 #![no_std]
+#![feature(allocator_api)]
 #![feature(coerce_unsized)]
 #![feature(dispatch_from_dyn)]
 #![feature(new_uninit)]
-- 
2.44.0

