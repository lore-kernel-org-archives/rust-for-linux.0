Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ED22874FB
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776611620; cv=none; b=MrhDctrnf8RlQmFJs2fhQJ0Ind2gFs+j8523i2m79Ql+OtkUz10XXt5ufU4T+8+K2Aiis5+ZDjKrilPznRtmzIwmnBnCrKlEqo+11/ZJne95UC31+NUxKh5McSzpj1+Y+hifEcE8+MFJPt62oHsNt1muSLYDEibOz9aJEmGbtIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776611620; c=relaxed/simple;
	bh=vDcIK+5js169U/jlxiXnZOwZX66iqRq/wHgzJ3IkbuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sxNJaG6NJNeGEz+4jpWo2EWzpSRk1NR50g2jf0yEPvBhhXA9aKL4XidpGPWovb5qhhqSa1TF4P8c4u1AFJFTLbGaMTwQaIlPvy0xGb70dh0LVfM0H0siqBj4a5DXENwMaGVO8mIHcLXgY94IfyTzrhizF86fFeePgM6RqIS1QuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MouLzqpU; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MouLzqpU"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f1bfc9b8fso916601b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776611617; x=1777216417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8fkjDIA2luV5mDODpq9a0VIYJU3zYUueNvtgaejrRgQ=;
        b=MouLzqpUvFJH28Dd30F15Pir5FXo2IPX8ie7hvIcKZaanuLxOMRo4Rmak4/diFmtPZ
         zLqWSeg8gzTplfIcnUeSpyHVIsQC+nnK+Rss6VJK1C1hrl/uuKIK57Z6pNai5xKG14dQ
         8b7N6P0OwA825FvD/L9C4GVGSYkW0Zpltlxr94tcjzBZ8/ef9Q6rvmFqU010djK2YEGT
         cLFSDueG6z0QyGzEB9A9UfzU0tb+moPHL6ZSO0IvbP5MP/xTbfwiwOpsNelz6uhDX4Xe
         AbRXiA/gSZK6l34E2DpKfBj8S8AN++QL3E4QQkzQXLWYjZlt8f3vEbrfxDQ9uqXzu5jD
         KbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776611617; x=1777216417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fkjDIA2luV5mDODpq9a0VIYJU3zYUueNvtgaejrRgQ=;
        b=VpqfUsH/9s0SQjZJBeA38LNTMvtv09wuMxHL7TXUzowALRDBPaIBAcJ0Q1F/fpAxsj
         sVeyvEIabwGhIrD0nWE2pHOILja3ELnmpAfosJQBTxF5PtVu+aO2flfBi8iA9tnWjX2i
         LZixnfXXtD7R4uHq0d1XZIVx429rzc+RTiYZ7ELmzWiSA3AnlRBoKG2iUNTHUfpRxYw3
         +c0xkcgb0DUJA8YdUM2uhdN27uhoVJ68GbTYAT0xw+E+iACerfmd4immnAvMe3SJYgNN
         ujXrmKfobXRENIG4mGq4Hoij05OVXJipF8VV7aTVh2KJ0PJMynFfusR23nlbtdwWhh+v
         rX/w==
X-Forwarded-Encrypted: i=1; AFNElJ8bfXGA4ecQuR7jEPN/ZdNkkuYeMTa/0SYLu0KhXwcb/gJMsRR4lsERUmyD+s4eMiutTvOTQQPrluWf/hetgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnJnjcEv3SDTDbiBIOG5/IShrb5+wxdXsnbMZvyP8aV/BBo75i
	JCjW7G52vzO1JVxgRprb6O8SOIgd/w2tuIEVR6hr2WpJVMnxs+vUiCYd
X-Gm-Gg: AeBDievlTUmVuGC9EljSSMmSk6ICic28xNgz6WzJbzuKIJqkv8SAyFNWXR7dhX29R/3
	tKCP4AoMVqzkwbqsDOSp6a7WBBCftTs/2bAQZN+2da+D9gE6kmV3odEG9DwrtkZSTeiLkJAcU0D
	gNbHazCYqn5TYLdkKPGmqati7wo9Zsukp4JG1fa04n7mxac4k27dMYSfHkDITTVHm55UDyrtm2K
	vxufwa/n0WbYmu7Q5Hha0LQAEckW4ClSvqxzES3cO6Ryz+BrzXlvs4mgstpSDOHLoLHBf317W1r
	BWC7rBN1GSz9urXRbBbHw7Gru2kMvFSQ9b9a9bvFeusafr3Ms/doFtpADySMgukxX/XsmSjgv9s
	Sm0KulmCQHy1QZfMIeVGQ4uzDfvQLsXhbodx6zNtOPYo0sta3Sd/GDJJz7wzv7X9x9W6ev7KqAI
	hulPLbeLZObtLKnNTd7UpUMcjt+wbr01NMAownJT+EkaG4vT8v/5WuAE4jOAqnUui9/gHMpjbCX
	j1BiXWZu00CmTE=
X-Received: by 2002:a05:6a00:c8b:b0:82c:ec1b:9e12 with SMTP id d2e1a72fcca58-82f8c849042mr10372913b3a.21.1776611617129;
        Sun, 19 Apr 2026 08:13:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:448a:2002:a699:c062:7e7a:5ea3:cd14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea02ef7sm7175560b3a.25.2026.04.19.08.13.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Apr 2026 08:13:36 -0700 (PDT)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Frank Zago <frank@zago.net>,
	linux-iio@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Subject: [RFC PATCH] [RFC PATCH] iio: position: rust: add initial AS5600 driver
Date: Sun, 19 Apr 2026 22:13:27 +0700
Message-ID: <20260419151327.26306-1-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC introduces an initial Rust implementation for the ams OSRAM AS5600 magnetic rotary position sensor. The current scope covers I2C communication, device probing, and strict parsing of the AGC (Automatic Gain Control) hardware status.

For context, a C-based driver was proposed by Frank Zago in 2021 (Link: https://lore.kernel.org/linux-iio/20211216202651.120172-1-frank@zago.net/), but it was not merged. This fresh Rust implementation takes a stricter approach to probing by enforcing mandatory validation of the STATUS (0x0B) register. It gracefully aborts with -ENODEV if a valid diametrical magnet is not detected.

I have intentionally deferred exposing the IIO channels (in_angl_raw and scale) to avoid writing raw unsafe C FFI bindings. Full sysfs support will be added in a V2 once the safe Rust IIO abstractions land upstream.

Testing was performed on kernel v7.0.0-rc3 using a BeagleBone Black (AM335x) on i2c-2 (0x36) operating at 3.3V.

Testing logs verifying probe behavior and AGC logic via sysfs bind/unbind:

No magnet or magnetic field out of range:
$ echo 2-0036 > /sys/bus/i2c/drivers/as5600/bind
[ 1928.138249] as5600 2-0036: AS5600: No magnet detected

(Probe aborted, safely returns -ENODEV)
Magnet pushed too far (weak field):
$ echo 2-0036 > /sys/bus/i2c/drivers/as5600/bind
[ 1966.130616] as5600 2-0036: AS5600: Magnet too weak
[ 1966.135628] as5600 2-0036: AS5600: Sensor probed, driver ready

Magnet placed too close (strong field):
$ echo 2-0036 > /sys/bus/i2c/drivers/as5600/bind
[ 1988.541979] as5600 2-0036: AS5600: Magnet too strong
[ 1988.547183] as5600 2-0036: AS5600: Sensor probed, driver ready

Optimal diametrical spot:
$ echo 2-0036 > /sys/bus/i2c/drivers/as5600/bind
[ 1977.527490] as5600 2-0036: AS5600: Sensor probed, driver ready

Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
 drivers/iio/position/Kconfig   | 13 +++++++
 drivers/iio/position/Makefile  |  1 +
 drivers/iio/position/as5600.rs | 64 ++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 drivers/iio/position/as5600.rs

diff --git a/drivers/iio/position/Kconfig b/drivers/iio/position/Kconfig
index 1576a6380b53..9d2611a71e33 100644
--- a/drivers/iio/position/Kconfig
+++ b/drivers/iio/position/Kconfig
@@ -6,6 +6,19 @@
 
 menu "Linear and angular position sensors"
 
+config AS5600
+	tristate "ams AS5600 magnetic rotary position sensor"
+	depends on I2C && RUST
+	help	  
+	  Say Y here to build support for the ams AS5600 12-bit
+	  magnetic rotary position sensor.
+
+	  This driver provides hardware validation and I2C probing
+	  in Rust for the AS5600.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called as5600.
+
 config IQS624_POS
 	tristate "Azoteq IQS624/625 angular position sensors"
 	depends on MFD_IQS62X || COMPILE_TEST
diff --git a/drivers/iio/position/Makefile b/drivers/iio/position/Makefile
index d70902f2979d..2d26f6d6ace3 100644
--- a/drivers/iio/position/Makefile
+++ b/drivers/iio/position/Makefile
@@ -4,5 +4,6 @@
 
 # When adding new entries keep the list in alphabetical order
 
+obj-$(CONFIG_AS5600) += as5600.o
 obj-$(CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE) += hid-sensor-custom-intel-hinge.o
 obj-$(CONFIG_IQS624_POS)	+= iqs624-pos.o
diff --git a/drivers/iio/position/as5600.rs b/drivers/iio/position/as5600.rs
new file mode 100644
index 000000000000..c5aab2230acf
--- /dev/null
+++ b/drivers/iio/position/as5600.rs
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2026 Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
+//! Driver for ams AS5600 12-bit magnetic rotary position sensor.
+//!
+//! Datasheet: https://ams.com/documents/20143/36005/AS5600_DS000365_5-00.pdf
+
+use kernel::device::Core;
+use kernel::i2c;
+use kernel::module_i2c_driver;
+use kernel::prelude::*;
+
+// AS5600 register addresses (from datasheet v1.06)
+const AS5600_REG_STATUS: u8 = 0x0B;
+const AS5600_REG_RAW_ANGLE_H: u8 = 0x0C; // High nibble [11:8] in bits [3:0]
+const AS5600_REG_RAW_ANGLE_L: u8 = 0x0D; // Low byte [7:0]
+
+// STATUS register bit masks
+const AS5600_STATUS_MH: u8 = 0x08; // Magnet too strong (AGC minimum gain overflow)
+const AS5600_STATUS_ML: u8 = 0x10; // Magnet too weak (AGC maximum gain overflow)
+const AS5600_STATUS_MD: u8 = 0x20; // Magnet detected
+
+module_i2c_driver! {
+    type: As5600,
+    name: "as5600",
+    authors: ["Muchamad Coirul Anwar"],
+    description: "I2C Driver for ams OSRAM AS5600 Magnetic Rotary Position Sensor",
+    license: "GPL",
+}
+
+kernel::i2c_device_table!(
+    I2C_TABLE,
+    MODULE_I2C_TABLE,
+    <As5600 as i2c::Driver>::IdInfo,
+    [(i2c::DeviceId::new(c"as5600"), ())]
+);
+
+struct As5600 {}
+
+impl i2c::Driver for As5600 {
+    type IdInfo = ();
+    const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> = Some(&I2C_TABLE);
+
+    fn probe(
+        dev: &i2c::I2cClient<Core>,
+        _id_info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> {
+        let status = dev.smbus_read_byte_data(AS5600_REG_STATUS)?;
+        if (status & AS5600_STATUS_MD) == 0 {
+            dev_err!(dev.as_ref(), "AS5600: No magnet detected\n");
+            return Err(ENODEV);
+        } else if (status & AS5600_STATUS_MH) != 0 {
+            dev_warn!(dev.as_ref(), "AS5600: Magnet too strong\n");
+        } else if (status & AS5600_STATUS_ML) != 0 {
+            dev_warn!(dev.as_ref(), "AS5600: Magnet too weak\n");
+        }
+
+        dev_info!(dev.as_ref(), "AS5600: Sensor probed, driver ready\n");
+        Ok::<_, Error>(As5600 {})
+    }
+
+    fn unbind(dev: &i2c::I2cClient<Core>, _this: Pin<&Self>) {
+        dev_info!(dev.as_ref(), "AS5600 Sensor Driver Unbound\n");
+    }
+}
-- 
2.50.0

