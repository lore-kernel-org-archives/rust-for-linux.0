Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333DB1741DF
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Jun 2024 20:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718656224; cv=none; b=AmPKyp3Y4Q9yW0mnnmZYt+qmTjIrRWahT/QQzHBn3waffeF9H8sIJkSYyaVmrzzs3/4HqmOu+DGBVq2ZxF/z3nKtw719vuSa7L7O9wgt+e/I4koTxp8yfGRX46dICb2KiCOECkMPzqZVn+EhMg2IB5U9Jg0j/vVMVTkSFCBzAFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718656224; c=relaxed/simple;
	bh=DmPO2Vwro1FlOglAhnrcQSsrrh8TKk7BJlzwsizxTOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uRWG9MMOZOEo+ZiURdRfDiP3qCch7GbixTQmoocO0tS51DH0V2X3uuijwTaFGCELmxbYoi752PX5HZw1RZavUCinxNZ2xhCkgStW+Zr3fe55R5IpEam7887AWci/WZMsmb85Ne0Z/nI9l2L8MbAP9o642BKd4Nopa2h+1adCdWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iyu1NOIU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Iyu1NOIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718656222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ea6sZXa/7DWxE8pxpCUuitKCovL7tQYbV++N23/HTmU=;
	b=Iyu1NOIUI8Y1zYt08vUbfYWY/vjDZ9OS5RtlWBKfoFee0ttsgL9phmcbNQNUQtwdDOHGlQ
	Fd3tFX+6atBrH1LVHrqTyVEVRxZajqYUIR7ayp1KE6mMxPKjwiMQms9ZeXOghfQUEKXxeK
	zWHpoAw/f410BRojuvGIG/bUqBQKHtE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-TSWVOZFqOdayGbemAkJSUw-1; Mon, 17 Jun 2024 16:30:21 -0400
X-MC-Unique: TSWVOZFqOdayGbemAkJSUw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-35f21956382so2958094f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Jun 2024 13:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718656217; x=1719261017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ea6sZXa/7DWxE8pxpCUuitKCovL7tQYbV++N23/HTmU=;
        b=f3sLbYNwoPtiBsdMcCJLCBVC8M0cnn6JHSNRhUBWGi4ET1zZBrg8CBGkbeK/9NfYl1
         aepS5KXGzwcFC10Rgq+USb1vMnXaVk7EfR24YLt76bZLc6WO0p09O2nONiD7fJhFrU0N
         nbFZWOUwquhpwJKM1O+wGAQSW7Dvj3Cdwqyv5tdkgeF8KkY9V75UP4F74KAQ5kX7jqO7
         ZcjNtZdTod1b3NhTtNgTjstJ4QOdRExMBkd0s9voFjW5yEhc8/64iH30NmWfgI1MX3hU
         0FVrH6XW6HBpoPy1y9i5sQHBmPXeLIia+4yTrS/+4uOfAnFH/b3Uu9kbmrnAZ2GMrYYx
         gX8A==
X-Gm-Message-State: AOJu0YyyRie/hi07W0pSsDgigFcM5+RwBdE9v8EM7p0vFF6nVuZ1TKWz
	ZwOzJVkOzZWekwjUwWF4qgUDZCu9odtWWwAxYH7oHA8DaTKtDgIAxu6RBbnLwI0vXUkdu9h1tVN
	wqOyZcCjjpycHyXM6c9Tzb+6gGB1y73yEW3JnX35NikO6zkLJ6pnXqNRpC+2H5nsX
X-Received: by 2002:a5d:6887:0:b0:35d:bfe3:1817 with SMTP id ffacd0b85a97d-3607a7b6608mr6691260f8f.21.1718656217492;
        Mon, 17 Jun 2024 13:30:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHspzgic05YmLERp6FfxQzV5TfzVs0ataIlRRzarVIChjHH0Fd5oleVnDT/bv/Wg6ypp5SeWQ==
X-Received: by 2002:a5d:6887:0:b0:35d:bfe3:1817 with SMTP id ffacd0b85a97d-3607a7b6608mr6691247f8f.21.1718656217131;
        Mon, 17 Jun 2024 13:30:17 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075093a4asm12594425f8f.21.2024.06.17.13.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 13:30:16 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Rust abstractions for Device & Firmware
Date: Mon, 17 Jun 2024 22:29:39 +0200
Message-ID: <20240617203010.101452-1-dakr@redhat.com>
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
 rust/kernel/firmware.rs              |  98 +++++++++++++++++++++++++
 rust/kernel/lib.rs                   |   3 +
 6 files changed, 212 insertions(+)
 create mode 100644 rust/kernel/device.rs
 create mode 100644 rust/kernel/firmware.rs


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.45.1

