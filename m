Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC17C179958
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 23:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718753624; cv=none; b=Cqgq2lkDSBF6qEOrx6z2HIsiy22wMdmQMTGsukA0E9mZdzpXQzoZHDqXms7TqjuWjhSZtdsAGFjfJvyUUEnwoa1HWD8Ny8CI3eN5MRKANF/Pc4+NhJKrEYBgI6WZuZn+7NG0rBwNdyxbucXFqiQFpInYr9bxIsbq9zxpr/O3gxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718753624; c=relaxed/simple;
	bh=dMMzNBJQ0tQZ5TVJx4rHJnN8um65utdxohW8/JV24/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fRmeHxtJVnLPQa2e7x5VpmHNv++WJd4wRZ1QflZifi1/GEfJ5hznnOgZIJIfrRQ9qGTar3tp9HzJS5yHwfdtMpuCOZkEIF5DXYu069atNtn6GtZ4/kBXeOX+tyW9rQczVwQMgsk6/FRwrI92UBYjkpCLrbH8XOJ3T/4INE3lRLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rqy2WmNk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rqy2WmNk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718753621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9vRjyrj62G3ZTVc+TSdMn/DvpeQf6xGighzoYUQH+3w=;
	b=Rqy2WmNktfEaIBQ9EaL/iS11pWqhyjFGUdDcaz+6b4/73CsGmnGhZcuC06BE8nq8QtI3Aa
	f583Zh8Y1WltC6+Nd13RLI9Tcm6xDpgtfC/WrISx8StgDkQJAERyipfk0iXqLGFQaCKi+B
	KTBR9i67QPW8YfTlSA/zeDhyH7mnjBQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-JXtwLXmSO-ed89D9_tKs-w-1; Tue, 18 Jun 2024 19:33:40 -0400
X-MC-Unique: JXtwLXmSO-ed89D9_tKs-w-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52c9894a547so4846354e87.1
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 16:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718753619; x=1719358419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vRjyrj62G3ZTVc+TSdMn/DvpeQf6xGighzoYUQH+3w=;
        b=w83OPnCVToxxrFt4G/z8AQBHpYMBVuDax0ZvK7+8aI/YHnpD9mR+GTdkENyzmkfYkx
         Kq3yoSFkPyaauEY9jyz5V7psgNu365jxhNqZul+pIAmHipwaWwPRvewcvlLzaGr9sHuD
         9F83lu29aQAvkA2DBpJK+SaiTqLNioqiqybdN4olCGGDQkYb5WGh02Ua4G6nDM1eoPTv
         q5nmVxs4od4gphAmRBm/3ysyURm1TYtRQgLCeSMjKYdsxwF/y7Hdc4sPBf/FAyiIC3oi
         bSf5BVXQSDmLlw5KP1CvYkAECTmOZllTGj2CQCcpKr+X90KihnsyHjg85ygB0J7x6UIS
         Nwuw==
X-Gm-Message-State: AOJu0YxeQATDVHHvnfQK40kX1nmIqCK6xDdWBv9+LdHSG4bYVj/q65rk
	gJwA30yhaMTZNwOf4IDpCMSR5X5Lr2fDLx+Tehg/1fFhKc2iOnZx5LEI4/z0OW51qkVE85GicM+
	wPxTKm14pK8Z7/oAUbQeaAm+z1207NAL7UV4JJTprrKKu4Cjpb7H+iSelFW+UGArq
X-Received: by 2002:a05:6512:3d0b:b0:52c:8a88:54c with SMTP id 2adb3069b0e04-52ccaa5856bmr685567e87.7.1718753618833;
        Tue, 18 Jun 2024 16:33:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR5TELOyHF36z9x2sDA7EG2pwK1HEt4LI7J206JjJ23kRVx6cagS1d8R8DZaXj8i3UqYOx4A==
X-Received: by 2002:a05:6512:3d0b:b0:52c:8a88:54c with SMTP id 2adb3069b0e04-52ccaa5856bmr685559e87.7.1718753618490;
        Tue, 18 Jun 2024 16:33:38 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f2407sm15548805f8f.72.2024.06.18.16.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 16:33:38 -0700 (PDT)
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
	lina@asahilina.net,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 2/8] rust: Add a Sealed trait
Date: Wed, 19 Jun 2024 01:31:38 +0200
Message-ID: <20240618233324.14217-3-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
References: <20240618233324.14217-1-dakr@redhat.com>
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
index 5a68b9a5fe03..d83c4c58834f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -68,6 +68,11 @@
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

