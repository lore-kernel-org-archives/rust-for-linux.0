Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28282DEA6E
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 04:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760501004; cv=none; b=tPjY6J9h3nQ9ZF5fqZFPKzEKgpz43pCbusce3T4IEMKDRL53ybIQ5SQXcVMd8l9k2EBvCLC9qfQUUuSMPUqAxxahz7BjDWokIGhTcDAXvfaNmku4861NRLWPRFIamRMXMtm32ZpMd7E5gANr3Eym7287eTr0rX2fuJjqKb0fe3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760501004; c=relaxed/simple;
	bh=p04wSVedq5RYaX5Nmz9HRn5PNrsa31BCRLo0sVIHALg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=LHNVINunFWIAWxzJwd22xB8crcSQheBaSdVaK2HKGzZDwKjVL1m92Pbg04gZpasg86/csJWOaBY6soc7nwftJwcxLfeClVCT3e9Uv2RQR0jL0BRzsO8vG2mKkE3xi+n+l+41vR8IQKUQxUVAsySc9d97yypEHAUy5unj2UwkTDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MEic5kUV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MEic5kUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760501001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F0oQPy6sJALcjkJ1xdOgR0v6F24g1cMKqTRKvMpDOSk=;
	b=MEic5kUVmC0D+DQJVmfuUeh3i0UO3fPiNFQtzSt4Ity+JaCCiU6YCHwD28QKa0FikFp6lQ
	I9wZEj59vtzo8iEB2JD8ZSlDv2WJNfQ+I456Htq9yGPzVSRA8rIl7O4N4sywnB4z0sjYJH
	b7lj+kLBYFTkCjTKgLnW8OJkLNQ5u1w=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-PWH4yWKKPe2biQXdDIO_mQ-1; Wed, 15 Oct 2025 00:03:18 -0400
X-MC-Unique: PWH4yWKKPe2biQXdDIO_mQ-1
X-Mimecast-MFC-AGG-ID: PWH4yWKKPe2biQXdDIO_mQ_1760500997
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-339d5dbf58aso22903195a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 21:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760500997; x=1761105797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0oQPy6sJALcjkJ1xdOgR0v6F24g1cMKqTRKvMpDOSk=;
        b=CcFelalEGz1B77/QJiUbVrRI3EP1Ojp9nzQ1mnDWiAsAHFlNWMZfwwZcpQmtc+zvie
         oKI6fJEHhC9+6OMzFPlixeG/+abqvEcja4A1/IXsKsH2LBuVL4JQR8EQDcY125wiexZ4
         g4svmvVxNcJnom3suUF9YtPNghiVRiMIivNCtveivdAVpUzPygB4QD0g4Z70/v6GneKc
         UpgZ/9ztRtKoWhigWAGKxwpm18ixovhxmukKh73YxwqY5zDbwEX0RAF1f2lVk0qKryIT
         FmfpD96+Y66pOCgA1t3M8Ux2uPVsZgOpuSZKOzW+3tzIJt7AfUUL5RugIuD8VG8omteF
         jYwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO5pC1/G+btcf1uMDZbBovvsucKXtkXBMZ8vGia3TkIbQNBr4OgxZ7LNApTh6Oza3kBOEh6hGRj6qt0/3/Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLTV1bKt9IX602zaxeXlgjiX7CfOI033oq2Xm/zQfgTbuugunj
	Ikfh8Toh0J9kGTGVrZqSSwHqRFqf1FFM68idKBEB+lay5ybu0Nj0q7oi+GRWv52D/nNgTmMGqyF
	RwRf8ilnRG6HJMhKaCkj2lP9oSCtvYmFGlYBKnHPct49G0e2SIp0SjozdoMPXExt5FlOL
X-Gm-Gg: ASbGnct46auhFdzzvwb3OvidbOIJuIu5/Nzk8sIQvrlvNuKPLB/ASH9cvQzFevXnhUN
	SQ+hLO00uMYSnzzNMnda3b4ko7cMAAJ2OWoIZOcrk011T5BTZs4sRcy4Bcvp1ZlTyfzOa89UaSe
	nmqsdmIN+X1W2WHYEetsdAZ+9UCNT8DHjcToEZus3kiFNFwjBfxCyAY1d8gJVGDbFw+aHV/GPCy
	xRFd1z38yzbG75J36mjWrEudMLhvVAtBsS2moFbCBXwq1JLDYU9feFBQbPMuTDP/vswd/tfRRbO
	RojRRfnNUG1r6+uQYp3d2g1u9vzwSMGTXd8=
X-Received: by 2002:a17:90b:1806:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-33b513cdaf5mr36389063a91.27.1760500997136;
        Tue, 14 Oct 2025 21:03:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRFuxW1Voy1mECvxyxh5CgehQPp4dDoRICc/mU73XzzKeQ5F8jWZeJJVvKmOuyelAlOt4irw==
X-Received: by 2002:a17:90b:1806:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-33b513cdaf5mr36389041a91.27.1760500996718;
        Tue, 14 Oct 2025 21:03:16 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b978607cfsm608006a91.9.2025.10.14.21.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:03:16 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH rust-next v2 0/3] rust: miscdevice: add llseek support
Date: Wed, 15 Oct 2025 13:02:40 +0900
Message-ID: <20251015040246.151141-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4m6B0rGAtG9_rH_wj4EAJEKPY6aHOsJroCFlL-w6BiA_1760500997
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Hi all,

This patch series add support for the llseek file operation to misc
devices written in Rust.

The first patch introduces pos()/pos_mut() methods to LocalFile and
File. These helpers allow to refer to the file's position, which is
required for implementing lseek in misc_device.

The second patch adds the llseek hook to the MiscDevice trait, enabling
Rust drivers to implement the seeking logic.

The last one updates the rust_misc_device sample to demonstrate the
usage of the new llseek hook, including a C test program that verifies
the functionality.

history of this patch:

v2:
- Introduce pos() and pos_mut() methods to get file positions,
and use them in sample programs.
- Add read, write and lseek in the userspace sample program. 
- Remove unsafe block from the sample program. 
- In this v2 patch, remove SEEK_END related codes from
a sample program because it needs inode->i_size which has not
implemented yet. The purpose of this patch is to introduce
lseek(). Since implementing an 'inode wrap' requires more
extensive discussion than adding llseek hook(), I just
exclude it from this patch series. I believe that whether
SEEK_END is supported or not has no impact on adding lseek()
to MiscDevice.

v1:
https://lore.kernel.org/rust-for-linux/20250818135846.133722-1-ryasuoka@redhat.com/


Ryosuke Yasuoka (3):
  rust: fs: add pos/pos_mut methods for LocalFile struct
  rust: miscdevice: add llseek support
  rust: samples: miscdevice: add lseek samples

 rust/kernel/fs/file.rs           | 61 ++++++++++++++++++++++++++++
 rust/kernel/miscdevice.rs        | 36 +++++++++++++++++
 samples/rust/rust_misc_device.rs | 68 ++++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+)


base-commit: 98906f9d850e4882004749eccb8920649dc98456
-- 
2.51.0

