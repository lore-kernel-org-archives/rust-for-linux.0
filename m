Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45FA45C16
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718725730; cv=none; b=jK9XD1djtfE6qUupTiC2xkDsH3IA40xiF7sot7cAZj6SVa2+Adj12GVQ7DhVS+uST/dQnNAE48EVrkZhN34XbWH1HsVv76eS/517KlEZ3h9UUquh3SnFwRPh//eqIsj7KS37dlrpDV6jYyml+MllF7znpiFGQYCuYh2gww6rqzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718725730; c=relaxed/simple;
	bh=rl883/TvCFM8iBzfUryfwpVXVVTJzuTXYPgBNHy/Abw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r+lUrvdDhkSO51Y2OtQkNuRyR7MiAiWeyuJseic5XVrN5dlAdiNde/yHmHEWqWAp/GqX70J0q7Uix/r59WdU8ATE9MLBSh/udMI/d7OsIN3sborCSZUF9+oA4DmtGtUD1sDtyXHzmff1S/XasDMChGKP6BTVZijoeS+sEgE3N1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F/8TRUuR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F/8TRUuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718725727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FvzzgHj+wG3QHgl50zv8zTMPpV1hn2NtNSqG9dSefl8=;
	b=F/8TRUuR2/SzQZX/EZo0dCd/5xLbvspTpvRJ+pJPDYAyylilcrLPgBtBtqlzk3YexPxfoh
	P/6olucjuQVjHNTjTB1aUmPTr4awFWKLm4Eq9+wgUTuB+g4vjEEab9YevdTG8lAPNFs7z+
	F5XmJjLMl+tH99/b+Yx9MlUhhwIFHgk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-d0zRy46ePjO4RYaW9iVvkg-1; Tue, 18 Jun 2024 11:48:46 -0400
X-MC-Unique: d0zRy46ePjO4RYaW9iVvkg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4210d151c5bso41470625e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 08:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718725724; x=1719330524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvzzgHj+wG3QHgl50zv8zTMPpV1hn2NtNSqG9dSefl8=;
        b=K9o4hcPr1gVvsSjBuOcBuN0G+do23mc42L+lNQgPiMBpQGvAcDhPUwdFhE+MdLiIr5
         PQfN1uKTFzxUl578IAnzdRuBQhhK6eaXHF7SM5JJaO0AO5PcK85D0fmrToMA9UHVcDaH
         /KlbXj/rmfGhfDj1pYkCp3KpXlvfDTasW6CEFnGU+S/j7E6qM9C0Q3WSHLlyxvBq8syf
         sxTgGpIkKvb9n+oQNRgte0S6VRtXffzr7bpDFJTtC+qvNiH46ofCjs76NbAE9tZBOOSq
         3ARemPXMSUKV6U+vUS3ROjHI7IOK/PfVIFC9w2wzsGJxra9Fkd4SaO7At1HNWUnwSKKe
         jMkQ==
X-Gm-Message-State: AOJu0YyDaZNzfPvnPW9AihKtX70JFsxM2LPlvJfAenq4TzdaoFVOo1P3
	5dGeNf+HNtRZ/8RUiLn8iohNf8MBTuQbm+6jdKtpjQmnnc3CPX9/TBiYDk26GNkK0fqEDZTLZRb
	zbDZrIi78g//RvxxDLQRSElSgnR7iwB+A9R1Y1h+j6bocLvMQ0pii80WunVpvVUHg
X-Received: by 2002:a5d:5351:0:b0:35f:275c:fb6f with SMTP id ffacd0b85a97d-3607a78dab2mr11013652f8f.65.1718725723887;
        Tue, 18 Jun 2024 08:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDdOII8S7S2Wbi067c8OVqGpnKCoURHhtfz5VZdgCPfo66Azq7IdxyFJAMwqr/T4xU3pdhZQ==
X-Received: by 2002:a5d:5351:0:b0:35f:275c:fb6f with SMTP id ffacd0b85a97d-3607a78dab2mr11013622f8f.65.1718725723555;
        Tue, 18 Jun 2024 08:48:43 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607510340fsm14413317f8f.93.2024.06.18.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 08:48:43 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	mcgrof@kernel.org,
	russ.weight@linux.dev,
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
Subject: [PATCH v4 0/2] Rust abstractions for Device & Firmware
Date: Tue, 18 Jun 2024 17:48:33 +0200
Message-ID: <20240618154841.6716-1-dakr@redhat.com>
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

Changes in v4
=============
- add invariant of unmodified backing buffer to `Firmware` (Boqun)

Changes in v3
=============
- fix safety comments for `Send` and `Sync` for `Device` (Boqun)
- add corresponding invariant and safety requirement for `Device::from_raw`
  (Boqun)
- drop `Firmware::request_platform` and `Firmware::request_direct` (Greg)
- fix missing Kconfig entry for `Firmware` (Greg)
- fix doctest compilation for `Firmware`

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

 drivers/base/firmware_loader/Kconfig |   7 ++
 rust/bindings/bindings_helper.h      |   1 +
 rust/helpers.c                       |   1 +
 rust/kernel/device.rs                | 102 +++++++++++++++++++++++++++
 rust/kernel/firmware.rs              | 101 ++++++++++++++++++++++++++
 rust/kernel/lib.rs                   |   3 +
 6 files changed, 215 insertions(+)
 create mode 100644 rust/kernel/device.rs
 create mode 100644 rust/kernel/firmware.rs


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.45.1

