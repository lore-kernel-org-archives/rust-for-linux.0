Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274BB221FB6
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 17:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979758; cv=none; b=A6qT16Elz+h+7Zu3PihWKJiVHlgb/JihrIFlLpCbS6Q58ZqVbaoBl9jeYprme1C+/xkCEuGZ9TFDSzGO4RFS4kD4wUw2neD1Uk6VlctT8hXBQI0IHNXPfUGL6okzoCABm767OEgWGJJIHN3YI2dSvrvYby/l+P71yWG2Rp6R0t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979758; c=relaxed/simple;
	bh=v0g3ebAkGtWaaXXSBYZkhOaLL8t5bHd21ygK4QtLRCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=lJg0FPlH7czCQ7Ov6ZiAFRJxs/tr2z5eC9j4S95ZJLrcVBpxoELZksxxxB5Lvtdf84IM9IV+QEiKydbmPyPraVKATx9P0/eIE34bv8TbIAyqQDeIvYW7Vmm8BGyCfGwkzTXwgmhSH+mrvQQKpShQnTazwFPxwfxiP1jEoWyMC3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TITBseNi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TITBseNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760979756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H/rLXs19LjWdxvoKTER+8Z+MHCSpaGRowtI4SJ2kq6A=;
	b=TITBseNiGGckrH2rvj5MlSrOgFf40jgMPRwHHgEbdR1tWNIx3O6quguiZ4WMS7X3kV0no2
	w+78g2oJ+RY4jEJXnCTlIuVD8DmvtcX7IkP+6Yb/+LOZXLwBPA/tOft8bXUTgCXHLG88aN
	++tuTriX9rMyENsqjVwGT4ntSesC/OU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-QrrexFoYPbO_Iksl7ZdYyQ-1; Mon, 20 Oct 2025 13:02:34 -0400
X-MC-Unique: QrrexFoYPbO_Iksl7ZdYyQ-1
X-Mimecast-MFC-AGG-ID: QrrexFoYPbO_Iksl7ZdYyQ_1760979754
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88e7bfe5ba7so1748413985a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 10:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979754; x=1761584554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/rLXs19LjWdxvoKTER+8Z+MHCSpaGRowtI4SJ2kq6A=;
        b=tH2GUfn2Y6JKhkOX7RNwnDp4zvDoNvK6I8XtYZqPAqOX7MlxORHh04Svw9NRVcclIS
         T/b7u2tZxeYTudXOgoofntG+II+jYhXBGOM8Yy3Np/yjoUfwTkXWSgo0f+mxNAgSgqwZ
         fSRRIr0XQKx5Y0Wi8IxgeNDub56OU2POqa/zVK2uyHAUUl0J/c2zDpLXkuoEMXQ/3MW9
         dDTC+doeDOoJ/S9ZSjZtBEGNHg0MIU2HQCahirr0YKFSBEBP+EyLVgc+wU/RAmuGG9Me
         Oz0jjz9sh7DSGkaDX6L9HTtb1Wq2ufLhpNCQNSXqPqSSEPrOl31fp0DOD3huNJW99w0r
         zKrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFyorvfvJV9XpbDW3oKhBWDXgVgu0dFmWF5dISsK45sMm5sEHb3wh/9yZagrNVfLo4vCVTUgUgCMOWSOv9ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGy5vfBBpDzXN8r16YiUrOffhgD2qzvEQbVn9n/bVeAQih5KHr
	psSjS2mVOhhUugIjHyfQOWCs80t3KU2iPub3jkwyTbuzdVDa1YDBPnn4mljXOY1ymKbreXFu6ZW
	LGECjJDfeNMzqTwN28GO/vzw8dLBE2kdogpXliEudSFpS5j0T03C9ZZZTRz4Mtc+YyWfn
X-Gm-Gg: ASbGncsLXiGAEdsV8cmllyNrjPXNsvkSPTxcPKLe9LshQjecyLHJS1zzUOHYnRxpioU
	gv9Dw4DkoW4sjCRvPMXIZi72ISnCD1nSte3pCzd2MPIfmaOWkmlv21jmqLwvBNkWzGx1EjIqCgP
	6G7bvmsHGs6WdzOgBPVXHJ6tJ96z1PHnvdc0T0WweSWBy+WOTfJE6m33ajUpiedy23ywj24pVUq
	Ou4TciQhF6ogiE/dEloJjDoLwMvUyCMZRa0Dsht+dsBhgurCycftC+cKVaY090fQPftKnnkQ+CW
	WP9TMORV0BbSj+2sAWJ11WLPzj60Km+G+f5QaeGb5L27PQnFutUbmw93XfwuESlAQUzsP27X+KW
	4ULqmOg1Dk1jn
X-Received: by 2002:a05:620a:258c:b0:7e8:46ff:baac with SMTP id af79cd13be357-8906e4ba3d0mr1771875485a.1.1760979754276;
        Mon, 20 Oct 2025 10:02:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUXXKot6xR6N+YJ5vl0QrsU4HJDgE4R1Ck46voAMrZRdvKXcRoOYSOIO7z8IOJqZtMhnHWzA==
X-Received: by 2002:a05:620a:258c:b0:7e8:46ff:baac with SMTP id af79cd13be357-8906e4ba3d0mr1771869685a.1.1760979753864;
        Mon, 20 Oct 2025 10:02:33 -0700 (PDT)
Received: from mira.orion.internal ([2607:f2c0:b0fc:be00:3640:bdf5:7a8:2136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cf58eecbsm589945985a.49.2025.10.20.10.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:02:33 -0700 (PDT)
From: Peter Colberg <pcolberg@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Colberg <pcolberg@redhat.com>
Subject: [PATCH v2 0/2] rust: pci: consistently use INTx and PCI BAR in comments
Date: Mon, 20 Oct 2025 17:02:21 +0000
Message-ID: <20251020170223.573769-1-pcolberg@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0hJLbaorW5hB4NC-jUxwGXbCyIUPdFiHqdh84Rvm3gI_1760979754
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This patch series normalises the comments of the Rust PCI abstractions
to consistently refer to legacy as INTx interrupts and use the spelling
PCI BAR, as a way to familiarise myself with the Rust for Linux project.

Link: https://lore.kernel.org/rust-for-linux/20251019045620.2080-1-pcolberg@redhat.com/
Link: https://lore.kernel.org/rust-for-linux/20251015182118.106604-1-dakr@kernel.org/

v2:
- Rebase onto driver-core-testing to follow "Rust PCI housekeeping"
  patches, which move I/O and IRQ specific code into sub-modules.

Peter Colberg (2):
  rust: pci: refer to legacy as INTx interrupts
  rust: pci: normalise spelling of PCI BAR

 rust/kernel/pci.rs     |  4 ++--
 rust/kernel/pci/io.rs  |  8 ++++----
 rust/kernel/pci/irq.rs | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.51.0

