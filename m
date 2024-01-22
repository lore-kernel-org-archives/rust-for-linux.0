Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BFA5C619
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 18:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705949177; cv=none; b=ann1FUb9njsOaZDYh6ZCDY5L0UXI3DR6pog3NYYhQke1WSX7uwoWe71UnnIpqS9I3FjRHm6/5HDqIii5NQY030ZzczYNfj9NfNZ6zagbwXLgSJn6HbLMaQIiiafiMBb+mjj07B7/vaerJaMFjaz7TExLZ/T5TEMOI1PxBXOswVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705949177; c=relaxed/simple;
	bh=lwHcE6C75LYyexBkvNLU1jyUyNNxt7s+6RxQN71P8CA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YYm6HAptvqY9UqriWbY8zM9MciK8lOqBvqy6vS3iO8I3bymUyQ4zjjWal/oyv0vue0ij/Bki1lPtflQ6niPKoXqLLBaCEZoa23nlEr6xZhHcA/dA/CiRLSGpQTU9KrzWbgEguyddmdRuoS4f8fSpZ6DzppOEgzDpkF8QMjiKOL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MTXWOs3Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MTXWOs3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705949175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9k/EegaiCDxQTsPJYM7AgRXIenTX4Qdv+pyOcBo0/BE=;
	b=MTXWOs3QUlFRpaKXFLU5Bh88MHWjpqXJQ6sOi+4BOZngIJzvhPJL++5JKPxhoavWNpXTkk
	h6RQ8xW8yQ2Z1I8CYT3tqdKKH40kFvxnOhXeMHIJjY5gl+x4sPK8YEgQpitM9cDJEhKRx/
	zB6WqcSdmXEjUaIQQk4YRf9H12IAtO0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-MlIYtn7qNLGi9aznNwYMOA-1; Mon, 22 Jan 2024 13:46:14 -0500
X-MC-Unique: MlIYtn7qNLGi9aznNwYMOA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40e9d6a366aso35694325e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 10:46:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705949173; x=1706553973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9k/EegaiCDxQTsPJYM7AgRXIenTX4Qdv+pyOcBo0/BE=;
        b=vFXUbNUGihfc83YeEV3qZxmQCXz8gh9SliAj8gbQ7fMh/Ji86X7voo8IrYUs1KniR5
         TZij/I9q/UEw/hblJmfB2gQ8oHc0aWasDqY70XAG25GTLrPHFftORM4XxA7DtkK+X0is
         ynw2KgfUs1L96ynVi9XVrcTw3qb6POQ0SxD3tSJk60xf0t6gXY5X28YhphB0/jeHU+Cv
         JIZFjegB0alcwHI+xDQGSnO3s68Ox5OXskQs6zaNDYHaUR+SQ3LX0UWM7h28Eywu8n5m
         Z3AqUMWfp4AxzcMCYe4lERF1skvRqjY/WtgTpiQeQq7FKQSg3DxoqootFpC1flJv2GuG
         MU9w==
X-Gm-Message-State: AOJu0Yxf1RgzJ5XER21CQb6UpSwHVV9k+Q5xmfkB2z5hhQVCvnXmcMCx
	cfVRDB1AyQ7cfYk9nUmCMcjeAZ/mH4DLYz8O9jeUlCTT9F8aK0NZ6TVSZV282F9XXTU0fljXfTn
	Wf2b7qem3T3eg6DXnDZZbxpDnU+oyyrxahY7b6ZO+VLm9en+YwBW4hEd9o0fbOUct
X-Received: by 2002:a05:600c:6a12:b0:40e:5b66:f4db with SMTP id jj18-20020a05600c6a1200b0040e5b66f4dbmr2605037wmb.88.1705949173076;
        Mon, 22 Jan 2024 10:46:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8W84MVbr8pmJwkEKsKLqPzJvH24XUfb+11MPuqGlBCQFQ9TMC0d1DOvhygMO74Bh8s7Iw3A==
X-Received: by 2002:a05:600c:6a12:b0:40e:5b66:f4db with SMTP id jj18-20020a05600c6a1200b0040e5b66f4dbmr2605024wmb.88.1705949172795;
        Mon, 22 Jan 2024 10:46:12 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id l6-20020a7bc346000000b0040d81ca11casm38940253wmj.28.2024.01.22.10.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 10:46:12 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] rust: str: add to_ascii_{upper,lower}case() to CString
Date: Mon, 22 Jan 2024 19:45:57 +0100
Message-ID: <20240122184608.11863-1-dakr@redhat.com>
X-Mailer: git-send-email 2.43.0
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

Add functions to convert a CString to upper- / lowercase assuming all
characters are ASCII encoded.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/str.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 7d848b83add4..d21151d89861 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -581,6 +581,16 @@ pub fn try_from_fmt(args: fmt::Arguments<'_>) -> Result<Self, Error> {
         // exist in the buffer.
         Ok(Self { buf })
     }
+
+    /// Converts the whole CString to lowercase.
+    pub fn to_ascii_lowercase(&mut self) {
+        self.buf.make_ascii_lowercase();
+    }
+
+    /// Converts the whole CString to uppercase.
+    pub fn to_ascii_uppercase(&mut self) {
+        self.buf.make_ascii_uppercase();
+    }
 }
 
 impl Deref for CString {

base-commit: 610347effc2ecb5ededf5037e82240b151f883ab
-- 
2.43.0

