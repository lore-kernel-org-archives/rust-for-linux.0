Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834613F23C5
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468967; cv=none; b=BMj3xgCTS3ePnkDypu4RYJX7DXHMP26yh0OKLFFToUqIOuhr4iwW8C+jSH0UcslecOehPBSnD88QJ9CmrtD1MjPxRJF1O0pwWiLwnlmaFiiB2ZUSe4OfQirX3mUk4olwCVdZaZWZWO/8KrF+6ZmeIxsmgRb/r3LJn02YEJkTnXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468967; c=relaxed/simple;
	bh=QntNCRxsqRUOS0ylI7Pz/qxqd7q8WopawYe4imAZ9cM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P+Fi4a6pTWwZOsJU6ycEzAxBMGb3QaOFZUVQSV9ydNPOrrkCdc+QF/p387ny384MSk/9Hr2+VtiFmMeS5xb6rMsHohKwFxcEMEDfsudhobK76OZbX6MUsQUddnuJd0w1iRTw3a+K2YETtgEimqAOLzUfascQsovw5lDsJNGWv/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+og0c+k; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+og0c+k"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82418b0178cso7594023b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 06:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777468965; x=1778073765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GHDw5P/WKuWdQLGr63cox/hFUSLBxTNMcAldluDTWOk=;
        b=a+og0c+kQ+B8MfH1G9mvqqOKRs14SiqfH9j7JV23DE0DZYMvYXQXwCn32fHimOap6J
         YHLRsvH7Be3Vzo0FzKAXPyJmjwbuu1wW2etthAkVW9BKciXEIBZ7xT3Wx4CRNFGkNFjg
         fpc6wlPwL7UX3evvJVJDqXGM6xfv0DrZOGo1P+l+0fSP516/XrM+I89uL+xCZryepvfa
         9EyZ3FS/HMls2vEjFtX+oqfZnfDw1HDG64RnqGRWxOEriI6+73JiBv9lxe/ClIZMxLaa
         GBnHKD0DrQp13HttYuRSNBn5WDg4QkXhN4rDVL9m+Bu1zM5CC6iifnbiwRNK3tgK/L7R
         8QNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468965; x=1778073765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHDw5P/WKuWdQLGr63cox/hFUSLBxTNMcAldluDTWOk=;
        b=KX+KJv2C5r/miwrmy8cKe2gWpUFwQ2jLS+YZvY5gnSHAeznOduHF/R/gN0wUWctoW8
         lWzF06xdMEG5hsWepNxzEtHEs+cNCJYlRNx+KzcC8ubGldNx0IDUcHiHQXf8scJtEmOs
         sB3mWFTS854m45LJpaE5HNad7rXFJHtMxsxm5KImGjs7uPE3fdRcRGo8+R6jspkng2zx
         uVi9PwucrqsKpi+hAkgCF1fFQ9JOSNyX2OMtOir4VLexX0lRP/phfv/UYtg6WSrxCdWB
         bMoK8hhKHiqpRyZfcOzr9c7TQxvMiGPR54sQfiEewcFGhRztNMCiw3KIAvjao2p7y7ju
         4iHg==
X-Forwarded-Encrypted: i=1; AFNElJ9EwV10Trj98RJTZCvfzryu51jHX5HoQ/r8JaK8aAlm8sW2q1FScA8eObfSosqDuYZ4kbCWybshbUJDVxvNyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+bKB5Hjh9DRFIGPnV8TBwo1lr6i8Pd+AUkAM5bCaQiDdyW0Fp
	mX/AZAYHuTjYuGx/yrjgqH1gONTsOikH+MQ2yD1aNHYoVhrd+nk9ZrFY
X-Gm-Gg: AeBDievv6fA8HHpA5/hKRd4lTBevajwK/s4SSrNdKLxHiq8lnUHAm+jYcNPSutZCOT4
	7yTT8AyDs8pzzqE5UHuxLqBmKoNNZAfqw1kcF9+IjN+p/Y/VWpd/PnLno3Y+437E4/O1odsiaXl
	CUwlHpoKUSomQk9dHGwe2PvhA4FMmncUzrbKKlLrmVqCtUCj9vWePNZor/C+t/iif1XpUdBMzdY
	vcyY3t9pI9NBg0MueMZhXmIrYU29pubxgQErN9H8wROapR3x416n1yyowB2ZKLvieSrV1l/hAfi
	xPbUjRCh0HHxXNUeVfSsUqu3U2D6W5bPE4VvF3l2JCfzCUdOB+ww7phx7HNFnj/Ml9lksQA5A/I
	QR88j7xBEz6879g7EJzW+UDGIflu/x+RTQ6wrkQgr8yUyBXqSbgmroig8feYSzWs18t13t2DN0w
	z/ldXEQZWnSdGtdZmJo+CpfrxgkJZHHRQkp1NRR05ipJI14JOfuCAAcbdR9aSMGVTaLWIHwrdXI
	DJ3di1qRPUTc2Q=
X-Received: by 2002:a05:6a00:950d:b0:82c:212a:a9b5 with SMTP id d2e1a72fcca58-834ea663abdmr3633488b3a.36.1777468964920;
        Wed, 29 Apr 2026 06:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:448a:2002:4381:3859:fd0d:505e:362c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cd407sm2091372b3a.13.2026.04.29.06.22.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Apr 2026 06:22:44 -0700 (PDT)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: branstj@gmail.com,
	lars@metafoo.de,
	ojeda@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	igor.korotin.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Subject: [RFC PATCH v2 0/4] iio: position: add Rust driver for ams AS5600
Date: Wed, 29 Apr 2026 20:22:26 +0700
Message-ID: <20260429132234.30514-1-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the Rust driver for the ams AS5600 12-bit magnetic rotary
position sensor. v1 was a probe-only stub; this version adds minimal
Rust IIO abstractions and exposes in_angl_raw and in_angl_scale via
sysfs.

Link: https://lore.kernel.org/linux-iio/20260419151327.26306-1-muchamadcoirulanwar@gmail.com/

Changes since RFC v1:
  - Moved magnet validation from probe() to read_raw() per Jonathan's
    feedback. probe() now only verifies I2C communication.
  - Added minimal Rust IIO abstractions (rust/kernel/iio.rs) wrapping
    iio_device_alloc, iio_device_register, and the read_raw callback.
  - Added OF device table for devicetree matching (ams,as5600).
  - Replaced hex bit masks with kernel::bits::bit_u8() per Miguel's
    pointer.
  - Replaced magic numbers with bindings constants
    (iio_chan_info_enum_*, INDIO_DIRECT_MODE).
  - Downgraded log messages to dev_dbg!(), removed unbind noise.
  - Added devicetree binding documentation.
  - iio_info vtable is now a compile-time const.
  - Uses iio_device_alloc with PinnedDrop instead of devm_* to avoid
    lifetime conflicts with Rust's ownership model.

The IIO abstraction design was informed by earlier unpublished work
from Brandon Saint-John.

The IIO abstraction is intentionally minimal: it supports read_raw
with IIO_VAL_INT, IIO_VAL_INT_PLUS_NANO, IIO_VAL_INT_PLUS_MICRO,
and IIO_VAL_FRACTIONAL. write_raw and buffer support are left for
future work.

Muchamad Coirul Anwar (4):
  i2c: rust: add smbus_read_byte_data and smbus_read_word_data
  rust: add minimal IIO subsystem abstractions
  dt-bindings: iio: position: add ams,as5600
  iio: position: add Rust driver for ams AS5600

Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
Tested on BeagleBone Black (AM335x), kernel v7.0.0-rc3,
AS5600 on i2c-2 (0x36) at 3.3V, diametric neodymium magnet.

  $ cat /sys/bus/iio/devices/iio:device0/in_angl_raw
  3296
  $ cat /sys/bus/iio/devices/iio:device0/in_angl_raw
  1675
  $ cat /sys/bus/iio/devices/iio:device0/in_angl_raw
  468

  $ cat /sys/bus/iio/devices/iio:device0/in_angl_scale
  0.001533981

Magnet removed:

  $ cat /sys/bus/iio/devices/iio:device0/in_angl_raw
  cat: '/sys/bus/iio/devices/iio:device0/in_angl_raw': No data available

Muchamad Coirul Anwar (4):
  i2c: rust: add smbus_read_byte_data and smbus_read_word_data
  rust: add minimal IIO subsystem abstractions
  dt-bindings: iio: position: add ams,as5600
  iio: position: add Rust driver for ams AS5600

 .../bindings/iio/position/ams,as5600.yaml     |  40 ++++
 drivers/iio/position/Kconfig                  |  14 ++
 drivers/iio/position/Makefile                 |   1 +
 drivers/iio/position/as5600.rs                | 129 +++++
 rust/bindings/bindings_helper.h               |   2 +
 rust/kernel/i2c.rs                            |  24 +
 rust/kernel/iio.rs                            | 224 ++++++++++
 rust/kernel/lib.rs                            |   2 +
 8 files changed, 436 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/position/ams,as5600.yaml
 create mode 100644 drivers/iio/position/as5600.rs
 create mode 100644 rust/kernel/iio.rs

-- 
2.50.0

