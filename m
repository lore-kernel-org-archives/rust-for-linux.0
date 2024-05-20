Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22C94C8E
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 17:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716225686; cv=none; b=C30B8FCVl6O0KyfrI1KDx5I90I7L+Y417h5xNptbVdZ8xB/HsAgnniL+mOLjwTUpwSldaLn959G2qvMDbeeH1nFz1p0D4XZjXwiM3jEcU0wH8dXirwj4vmRe7tnNvZ/JU7e2NPfMG2y49b+qpMQSWKJti3V0MWBKvN7Ms8p/U64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716225686; c=relaxed/simple;
	bh=M5BCgP47lLlzWqIZ7efzdfOAZkjWenqPYQOmIC2qtI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QbuDDr0qz1vFXhwAvWNmY27ePk4zjSx2yzC1ALfE5JfxXTZlAinMB0kSZ1VKBDSkd4Nu6hC2XvDThtidO0XHJk96uLYo9OJ6JjUI/1zbzBkJ5fPbYSN2hmnPmE7oKScqmP8GQulH9+x1UYnOq7GWJn/dEWSiMW7qKL00NPr+9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hGp8eIZB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hGp8eIZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716225683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKS6qhSk55pRZeAXjj0u08eGqfwnnqmzVscIpFm2Jrw=;
	b=hGp8eIZBxdmOFZ4oNKZKyzAbyWdxX6g/gDIPh0xZAEbDSyJoNwTdOdxcYjYxEJkdIJMzTZ
	myKbWhFy6DqZLm2wsLdqwILiW4Bs1Igl48nz1UvxJwdlkwlgPgAChKUg+2WofDEsCTzliF
	ysO8W+tPxnb6E3syhb7H9vpW4tQCeow=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-SvkKuaPWONW9xHKcnloGnA-1; Mon, 20 May 2024 13:21:22 -0400
X-MC-Unique: SvkKuaPWONW9xHKcnloGnA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-523936877a3so5364522e87.3
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 10:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716225680; x=1716830480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKS6qhSk55pRZeAXjj0u08eGqfwnnqmzVscIpFm2Jrw=;
        b=iKn0DRz/hIahNG3IUiZCckZqBh/Y8xV51SGyMwLtbshgNoiXizjUNmy1vYUOIj7RQv
         z1aDQg9zIHxUWCA7tisroQ7W9Q+93YkVP+4ulYbv8L+ThKjMh6xi7HQk6Z1CCIJ+rWME
         SDbikIyT/GxBHgkS1X0C9/xaoJu/viGfs+aTTRdC0mjC8yBipTyYuh7EbBnUgVA/BrvL
         uOti+Y3eXQQ6D4nwh3QA5os0gPUGfAMNGSQLw3GwqoK/5gT0Z+Sk6NW3j3Yx9DMhND/7
         HcXWDDApOTStoCViabWndOBQfmskfMTsX0LD4n3J+pENwzhtW6HV1967VBw4OfOzOPYK
         mSGA==
X-Gm-Message-State: AOJu0YySDmWg2XorklF+aBECsDAgTQmuoUPJhlKGBOPJAMwNyeQi38dW
	VqXYdSaw6ciXgXS+97dNPOVr6ncRuKfIvwDDkBo4BgfZWYdvvwOzYGVl/0UsUtHozTWAPj2p9o7
	bqi6Esis82Nypvf19CfJzh+Wu3cWWaBbrumqkN75iJmY2BcPYu6AsziaVrGIB0ytu
X-Received: by 2002:a2e:8794:0:b0:2d8:34ec:54e6 with SMTP id 38308e7fff4ca-2e5204ccd8fmr175153661fa.33.1716225680711;
        Mon, 20 May 2024 10:21:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErF7q9FqAV3RyM+4sRTgS+83yJJodVaf9ir9uNQdpIiZzoq5t+t64rFKzgExXy9aAhHq+sdw==
X-Received: by 2002:a2e:8794:0:b0:2d8:34ec:54e6 with SMTP id 38308e7fff4ca-2e5204ccd8fmr175153391fa.33.1716225680279;
        Mon, 20 May 2024 10:21:20 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42014c21260sm315868065e9.3.2024.05.20.10.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:21:18 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	fujita.tomonori@gmail.com,
	lina@asahilina.net,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 2/8] rust: Add a Sealed trait
Date: Mon, 20 May 2024 19:20:49 +0200
Message-ID: <20240520172059.181256-3-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
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

From: Asahi Lina <lina@asahilina.net>

Some traits exposed by the kernel crate may not be intended to be
implemented by downstream modules. Add a Sealed trait to allow avoiding
this using the sealed trait pattern.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/lib.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index cb0dd3d76729..6415968ee3b8 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -65,6 +65,11 @@
 #[doc(hidden)]
 pub use build_error::build_error;
 
+pub(crate) mod private {
+    #[allow(unreachable_pub)]
+    pub trait Sealed {}
+}
+
 /// Prefix to appear before log messages printed from within the `kernel` crate.
 const __LOG_PREFIX: &[u8] = b"rust_kernel\0";
 
-- 
2.45.1

