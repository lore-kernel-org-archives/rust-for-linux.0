Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737141D174E
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 10:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730803659; cv=none; b=ophvavUznnF4PWQ/22IlDyNIWSZwwyqJpy2Jp8MI9Hv5h8FdnPkTtF0kEjwCGU+LbaBpJFjiq30C4J4jf2/9Y+hAL56KYltBrPKaEHg4lT0aOvzPSMpp173X//miMVc1dadoQWAn/TKv409sdfqqUeIPpHMonN7mQV2X0XH45jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730803659; c=relaxed/simple;
	bh=Kc2K8UrbQfukNRjtwVeMfjrvCpkhcSzDbtxbWZ9JIiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iY8cyiUgYKz6O847TwMfce6pI3Ts6Uzol7Mf4k8TACSxo5s7QaaGQn7EhyjMyb41twAP9lh5REhZForV793BN8DzqeARoNTWoNFMPfr3tPsCogbBhpPNosv89H1RH9c8X+x0iGQpWlqyvMIZ41jLyp3xENd/+mm3ZL7c29FjJsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSAEpaJ6; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSAEpaJ6"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f84907caso5744150e87.3
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 02:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730803655; x=1731408455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=inkuPNhLqPkDYmbDcCjMZKP6wSmS+xfll841NSENZlQ=;
        b=OSAEpaJ6vtGmSoadMcECCLfmAz1pas4DHVGH/zmUFB9rnoeyMf9SUbTC885kqRO3yh
         Yexg1n2YAC1A6+UeEA15aVOPk1QMKd3QyyG13gpjGdHW9Dj+mtIe/CvYlVkaaRa99sDF
         kxChpsC76mzYFGkz/0xQYbhIU49kJfS6DWvV1Ygj+E77mEros/DKrW/t4MaZdfPJVp3H
         EP/vM7eH6+uSUpFirDQSXBRuSRiF0QS/lcCPe74PRoS06zN39NQpkO1lk6y2j8+Ab33/
         JiHrWqqTVk9jG9zBrfiSMXd7Gfkz3zeNVgIWkBVjdBMe9ZJ3m7cyTiVRl8jGXjWOPDJb
         zaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730803655; x=1731408455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inkuPNhLqPkDYmbDcCjMZKP6wSmS+xfll841NSENZlQ=;
        b=RBsjCbPBpw3UFslDavJ7mF2UJlOWkSrMOeR05BpCvQI/DziQIblLgxk9y4eSc32G/F
         QiFeA6VDNPY4xpv4H/uI3g/IKk923WAfmNIZHdpWp6Px9xPmx8NDwi3+rAxOC0MeLVsB
         QIKZVKM9i9vzLMVCDM7IUUFsSDMbeHGceem9TXpv/TmffE26wrSi4Zh1s5POiOod1vb0
         PQxHK2q+Ov+jw2lh+3tSl0xyGyLSu47ksalTGXMu2YzuC1IeefYCE3vekhYdV8tqmj8B
         0eBSPKBrHvdDDGTMDsKoJ6GaK7CQesnH/sa7XkRTaYLG5D1td6on0XkcN03YNFdqK863
         BuTA==
X-Gm-Message-State: AOJu0YwuaQbn8kIEPLGz2tBn45+SRLetLCyVGJIt9UI5WcPp3g1t8Pis
	JnM3H0iTrfgyfd/E4PCwPrZuf2A0wQ8YnuPH3S3MO/GKXmWJGGQA6lOHDA==
X-Google-Smtp-Source: AGHT+IF2E4CJdKcm++7hWLfX3uFehGAuQElHscSzGVb2r0TnchK/P7gQCGHXdJcYE5EHCDRVtstbDQ==
X-Received: by 2002:a05:6512:2204:b0:539:e65a:8a7c with SMTP id 2adb3069b0e04-53b34c995camr13511751e87.58.1730803655225;
        Tue, 05 Nov 2024 02:47:35 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9620bsm2082686e87.37.2024.11.05.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:47:33 -0800 (PST)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: aliceryhl@google.com,
	daniel.almeida@collabora.com,
	a.hindborg@kernel.org,
	dakr@redhat.com,
	airlied@redhat.com,
	miguel.ojeda.sandonis@gmail.com,
	wedsonaf@gmail.com,
	a.hindborg@samsung.com,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v4 0/2] Add dma coherent allocator abstraction
Date: Tue,  5 Nov 2024 12:46:55 +0200
Message-ID: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the dma coherent allocator.

Changs since v3:
- Reject ZST types by checking the type size in the constructor in
  addition to requiring FromBytes/AsBytes traits for the type (Alice Ryhl).

Changes since v2:
- Fixed missing header for generating the bindings.

Changes since v1:
- Fix missing info in commit log where EOVERFLOW is used
- Restrict the dma coherent allocator to numeric types for now for valid
  behaviour (Daniel Almeida).
- Build slice dynamically.

Abdiel Janulgue (2):
  rust: error: Add EOVERFLOW
  rust: add dma coherent allocator abstraction.

 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/dma.rs              | 169 ++++++++++++++++++++++++++++++++
 rust/kernel/error.rs            |   1 +
 rust/kernel/lib.rs              |   1 +
 4 files changed, 172 insertions(+)
 create mode 100644 rust/kernel/dma.rs


base-commit: ae7851c29747fa3765ecb722fe722117a346f988
-- 
2.43.0

