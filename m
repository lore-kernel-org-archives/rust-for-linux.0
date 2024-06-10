Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2282B3611B
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Jun 2024 18:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718042611; cv=none; b=jOJ+UUjZPLJrCWj6SjWpSSv8791YTzfwQVXxK2XCUvPSL1RNW8O6mSilSUnZ6LiWjjx4irdF6GCe7R244Tq63tw43cwBppGvpcW12/qTzagjG5eJNtDrw7RGW9G6FIwMB6z9FGcAd5vPx2kM852XcrtelJz/nkcGt6DeFCXo/bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718042611; c=relaxed/simple;
	bh=BUjM1t3PIXAC6Ytd/MmTqu6Vsv+XYZQHt79/aOU6bkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mYNSmZVm9/I8ITMTwa7PpdSRAaHBjXNZWb2w9XnTeuYFBftgI2LadTFVqqrY2jgL7QYzWR34nvtfMO4w0DGfeIgjYNAbN3MqroM4q71/u8ATRX3ZQtK8Wb5AQsFxgPlYCRbD/ySumrxPD/Tnc2lK1QlGm40YsVmAL9NUOQp2Vk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OiFwslh1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OiFwslh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718042609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lBAdoXrWxfngAOXeETgZ/9eMi7EOVwujj0O8BRZDoD0=;
	b=OiFwslh1aMhCsX97ZA9hIG/hLtgax00Qnv+kujCHgW8Rgw63YrwAXjpbxZtW7det/qD+PR
	kd0pdryRgdKc0i4ToaFnDLISJuCF6jjGQ6+797qXWb5PQXfSup1FkHOi5IfDPtdgPhs8bX
	UBEEnqtYH8LKVu1iWSBUwPlKqZ+ntNY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-A4oJJHhkMaio4yNJxkAcnw-1; Mon, 10 Jun 2024 14:03:28 -0400
X-MC-Unique: A4oJJHhkMaio4yNJxkAcnw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-35f1f958b7dso168280f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Jun 2024 11:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718042604; x=1718647404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBAdoXrWxfngAOXeETgZ/9eMi7EOVwujj0O8BRZDoD0=;
        b=LxJiqOumsVnwRhg0CNS6QiU50F33F8BEJN5yuwjozE7h0q5VjFktmvFbYBxx88HES3
         an5SXEoZKOXROz/LdVU/5yzrVEyotymgaDo919pARyYS9dU8EAEo9tPlbvoLy47i3P0C
         GlRxtKNXDU8f9qry8EvK9ifPOsG9010TF+MdcUFKxIM2tfVhvyjHSYnWTlwnQ/6iD0mc
         yKs+OadTPbVHI2zw/qFM6IX5y10Yy54hT2Y/xKBYwq5peFp3Q71ZFY1GlRZT+RYeYsvJ
         giCkSlFm0tNVeDDutg2i7RNMilUmPrc+EfS9L0nc7n23G7ylpMD8l92IN46PcUUjpTyT
         mQRQ==
X-Gm-Message-State: AOJu0YxEq21tFa0z5iMewOqcYgvktBZ5CaqJ+E8Q0k+CyOLCMR3vKPjq
	qMXbsjHacurUxUQmbNuQvwN7slABMDee5Mr0FoHULfavg2FgyaX1aWzuX0Cwunldi8U5zLTL/ET
	0xAlly5WEghmX97QKLaP0SfKOfjwrGVcaxnVhAFUDGMxP63SypmpOZbQBp02zY67v
X-Received: by 2002:a5d:6305:0:b0:35f:1c26:b68d with SMTP id ffacd0b85a97d-35f1c26b7d4mr4334328f8f.60.1718042604301;
        Mon, 10 Jun 2024 11:03:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6fttIySqaLlAtrmoTpFqX0+ZaGQTLMt4MDrm2NDweITHX9K6XyLSqHw5pHedfj/9Hbj+mrA==
X-Received: by 2002:a5d:6305:0:b0:35f:1c26:b68d with SMTP id ffacd0b85a97d-35f1c26b7d4mr4334305f8f.60.1718042603941;
        Mon, 10 Jun 2024 11:03:23 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f0ccc5f03sm8384464f8f.88.2024.06.10.11.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 11:03:22 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	mcgrof@kernel.org,
	russell.h.weight@intel.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	fujita.tomonori@gmail.com,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 0/2] Rust abstractions for Device & Firmware
Date: Mon, 10 Jun 2024 20:02:26 +0200
Message-ID: <20240610180318.72152-1-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
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

Hi,

as agreed in [1] this is the separate series for the device and firmware
abstractions to unblock the inclusion of Fujita's PHY driver.

Originally, those patches were part of the patch series [2][3].

Changes in v2
=============
- use the 'srctree/' notation
- expand the existing documentation and make it more unambiguous
- use `NonNull` in `Firmware`
- generalize the `Firmware` request functions
- add missing safety comments to `Firmware`

[1] https://lore.kernel.org/rust-for-linux/2024060745-palatable-dragging-32d1@gregkh/
[2] https://lore.kernel.org/rust-for-linux/20240520172554.182094-1-dakr@redhat.com/
[3] https://lore.kernel.org/rust-for-linux/20240520172059.181256-1-dakr@redhat.com/

Danilo Krummrich (2):
  rust: add abstraction for struct device
  rust: add firmware abstractions

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers.c                  |   1 +
 rust/kernel/device.rs           |  97 +++++++++++++++++++++++++++++
 rust/kernel/firmware.rs         | 107 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 5 files changed, 208 insertions(+)
 create mode 100644 rust/kernel/device.rs
 create mode 100644 rust/kernel/firmware.rs


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.45.1

