Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160F211184
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716225871; cv=none; b=tt3e2qVeSQ4KYF9oLGok3CxINILTts/kTh+W6Cyi0bNcb7kpfaiJ+xude6J6d0AwIHGpUbwhp023eyHi9lfxFpYNDCDBTy0SHuHb9q0xf5vC1YVVnpzzpjZ15oLy1jLFubSd5RKgfvXgb9XkH/TSABVYOxDKDgkcMJFr7SG8KwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716225871; c=relaxed/simple;
	bh=zafxp5VcRumxwW1Q5m8geHIqCqPMfs7HS4dC+lQb8O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bSGXfGwYN2RWMGsdxbuySWKeqRj7FCu6nYijDe1OCYnnEfWSJR6E+8QQCduKdSNnZFVdl3nrkdc2j8WQR/nfMqsONmhU+/mdHkbXO6UqT+l8FY6kEI4KhKgxV+yvOM8dlwrrWgdVZsSmXQan1+TqgX9eXhs1RQuQNlxfHdHWeJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VMa9a54K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VMa9a54K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716225868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ieml4cQgLdOB6f1Tq+rgmDncA9spVWDVEosV1A4OpmA=;
	b=VMa9a54KHUgnVRB6PN4btHUbhbk0zGBRcRJHwiOIiDNPsiJ2Pu0H61LhS6m1S0vpGlaxnV
	zTLBmPjFewa8F6EZihw05eGDKTQAz23rVSMer703vljGn97Lx35QjKKVFKgjRXjjx3Q815
	+AQu02+eX46zMvkxCOMNyXy9IKogIsU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-DEgLZqlTMYKlG4GszYwgLg-1; Mon, 20 May 2024 13:24:27 -0400
X-MC-Unique: DEgLZqlTMYKlG4GszYwgLg-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2e1d4a03597so75308601fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 10:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716225866; x=1716830666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ieml4cQgLdOB6f1Tq+rgmDncA9spVWDVEosV1A4OpmA=;
        b=Z2QKFBv6GP5tcxainmvVaGz7knd8+1pRozXBj94isyawG/5HYiQSswlEzR7tJ/dDrj
         JxVKplb0W30+ijj+VQ150VdUSmip0lRXCLmVtYRwCHSPQ0lY8y5T1e533LHkBCj3EX5d
         4D8lM4u+ni6x+YZZQ9qUg2n8o6cHkTz731+0YnHHD6Pyr9RLGEkSGfc/Httj513Yl1vi
         q/cP2hd++R309qgf4P//RB+qGiNYE/Wccl4NogusX7HDyeVCnLKwXlkMgIEHM9TZkMcN
         uoLLp7CWow6nMHwR2gfQ++b7Qlznp+bB2zT0SYMmuDq97CTC1H+UxFD5ZOJQLNVR53oR
         9VkA==
X-Gm-Message-State: AOJu0Yym5DqN7pwQEXHG2j1/ALRBWLISBTvM/hsKUOKjMJiF2b/5F/C5
	wlj+xsWKlqyDEE+v63EcRbAy95AWpjkoWPqdLxmRdF8/a10eYtSA5eoDrtKbLUSeOiG/IhJ1rk5
	9ZU6HCUZ7EnIUUCSVz1QBfPjRaCuWgQ6LfCXD+BzvAs2ff4DhFueehozcDYU46jM/
X-Received: by 2002:a2e:8654:0:b0:2e5:6add:e863 with SMTP id 38308e7fff4ca-2e714547d3emr54063741fa.53.1716225865728;
        Mon, 20 May 2024 10:24:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMpsCQkOJtvD6AnOHOUhRrq0Egu+U6M7/zg6S8BPHCPo8n8IiM12UdEpbE9vwd95n/xh9GOQ==
X-Received: by 2002:a2e:8654:0:b0:2e5:6add:e863 with SMTP id 38308e7fff4ca-2e714547d3emr54063441fa.53.1716225865309;
        Mon, 20 May 2024 10:24:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f87b2653bsm462686635e9.4.2024.05.20.10.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:24:24 -0700 (PDT)
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
Subject: [RFC PATCH 4/8] rust: drm: implement `AsRef` for DRM device
Date: Mon, 20 May 2024 19:24:16 +0200
Message-ID: <20240520172422.181763-1-dakr@redhat.com>
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

Implement `AsRef<device::Device>` for `drm::device::Device` such that
`dev_*` print macros can be used conveniently.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/drm/device.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index f72bab8dd42d..aef947893dab 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -79,6 +79,14 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
+impl<T: drm::drv::Driver> AsRef<device::Device> for Device<T> {
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: `bindings::drm_device::dev` is valid as long as the DRM device itself is valid,
+        // which is guaranteed by the type invariant.
+        unsafe { device::Device::as_ref((*self.as_raw()).dev) }
+    }
+}
+
 // SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
 unsafe impl<T: drm::drv::Driver> Send for Device<T> {}
 
-- 
2.45.1

