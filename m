Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAFB3FD14E
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468998; cv=none; b=XDdZYuHzZtwpwOeuNA5LRC5zdT27WLcO1bfpNZE992Y8pa5px2es40nBNj1BzhGtYC3tawpGoagKsiposlXRJF72UlvzYFmOSaaWl2mtlchFm2f8IZKiWPjEuGbDCwnidu2ywWLDYY13/2cvZQsC3dauZxVkhgADPvFVJp9YJrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468998; c=relaxed/simple;
	bh=4onuEvPaP2yvZAtOC+F4BCT1UwRW5DkR/lNZprGqXK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZsZvJFe3Nm0B/l9KgXxOlvzgyEM/0+DTlmWXRXLacqUBlLsQ1TMn92Nl/p9juc76kIJQsOchijBqRjq4aqTQPNFdlNNmM8YS0jI/8vHq2hfQo6rgslyZrT6mXs6IUBVxznbZiwmlJNOlKnNXzQiomqxs7utSy6GIS4PMift3X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V90m/fjb; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V90m/fjb"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82ce2e2880cso8795822b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777468995; x=1778073795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCpqWEaMYg3UZ5FWd6Kx+fvUYh//nkS7obYuvELKMmY=;
        b=V90m/fjbKTuPjqlw5QgrqvYOosLYhl2YBonDELiwUVpWnSvCmJrazCko7GjU+Skcmc
         v8TKoX73DHAKUs2xi4DMdg4rObLVvQGCE3xwnpHXLQPaOPur+NwL4ha07hh/5MYdq6Le
         +BQaDUOBeubCtOvsbx4YbVpohIUAsQmE+7ssTscHgaPwKrHLj3N7MnBXQDYfVKywgh2T
         lbs0nI0nULv+maQ7lKCI4yW5G2dcI1oi79SsZYe0iG3NCYhBn/oIghngqgn/s56aqy1/
         HmxnKgiu7MOYqp63nnyX0khOtwfdCXAvH67HqRmusEzPx3oLRSMqbgYwVWzioK47o9y2
         EkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468995; x=1778073795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCpqWEaMYg3UZ5FWd6Kx+fvUYh//nkS7obYuvELKMmY=;
        b=fTN8LCKz7TSjQeQX5AkeUfXY7rwVRXHvigHU/+34IyO9Q55JMTYfxtE2yc8b+RWXGa
         CanoDDceay70Zfi2yZTLSk8ygFzoobKq8OYQoSphA/78LzL3r84R3cInDnAdMnaKzXK2
         qAoTyX1KQYhEWBkj7RoxYkEAoWKr/bhugGRXQFNh6If/yXdl9ZclWjoi42QFiyoTxzN5
         t1NRSPEVJ9Qpz1vsmAe+wwW9/by9JCwfypdvUo3g/QDQoO8md7hRVbBeyOjhRWiXqmGK
         UWfWGUwzsoQlrguyVs0huaeYUW54ic3/tO5GD4goCfRGMi9wl8OvXkwUr7ZsXBL8/pLT
         bN5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8uC7iYrREAGbIkbRJ+BmUjc65/w6z57Idp4kBQsqzcJ54CIRhdWCv8alDnIUnBxWNcu/YpMquPycolL8KgdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlzGqr+kotFG7eI8KnzfDqVuxuS6RnaxJcNNq0rE9hH2Kn3h/T
	UI1T+LZOgNZgnFlAzH6g4uPgkokaEh/iRQ0hbL47x03lavQ4QK+P24B4
X-Gm-Gg: AeBDieuPmRpj2XGlmIowlDEzvCv1SlHQVqVFMy6XcS/2wEsIMVxYMdUc1tlhXhNFL9m
	SDmxbkF1l30kOaim2MtsBFXGCZKn8Pj1UPB2PCERnAVMHZbTLPz428TOpbfO/QwyHWIhsQUfIT8
	KCYKnsz2YTnz5CNIGbP5uSlqNSdHrKXfvil7c7K+IxW9yDFJpfGh3cztbQr3kvzW5JcY+CducG4
	0Ish/BtYd46Jp5w99g+1Ssy/gswSHl6ZA0jqEON8TksZal1j2RBUQ4RF5V+7xOqtaFA/TfGRA4i
	qa5edDT5/S/7npvJMDgWxl8csrTJ2VS728qwalP+bEmoN92c9mbMKe5I5EeG4u7QIRko53eHu/W
	l8FkWcsa/q6Nb1e7BJLT6eeS7xeTeZNekviKG1CGQmka4AhLsoPwg5I/noJqMLu/S+3bmC3keFh
	IKlmJ0fKMIT9zK/oJzVmkf9gaDcKbahBTYLzrH3II95QVTCf3Cv8FegPmhdmc+Yae+zgxNu81bH
	V5XNwaBP8PzKI0=
X-Received: by 2002:a05:6a00:69a3:b0:834:df57:9d6b with SMTP id d2e1a72fcca58-834df57af63mr5180255b3a.24.1777468994395;
        Wed, 29 Apr 2026 06:23:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:448a:2002:4381:3859:fd0d:505e:362c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cd407sm2091372b3a.13.2026.04.29.06.23.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Apr 2026 06:23:13 -0700 (PDT)
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
Subject: [RFC PATCH v2 4/4] iio: position: add Rust driver for ams AS5600
Date: Wed, 29 Apr 2026 20:22:30 +0700
Message-ID: <20260429132234.30514-5-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260429132234.30514-1-muchamadcoirulanwar@gmail.com>
References: <20260429132234.30514-1-muchamadcoirulanwar@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
 drivers/iio/position/Kconfig   |  14 ++++
 drivers/iio/position/Makefile  |   1 +
 drivers/iio/position/as5600.rs | 129 +++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 drivers/iio/position/as5600.rs

diff --git a/drivers/iio/position/Kconfig b/drivers/iio/position/Kconfig
index 1576a6380b53..dab9310e8079 100644
--- a/drivers/iio/position/Kconfig
+++ b/drivers/iio/position/Kconfig
@@ -6,6 +6,20 @@
 
 menu "Linear and angular position sensors"
 
+config AS5600
+	tristate "ams AS5600 magnetic rotary position sensor"
+	depends on I2C && RUST
+	help
+	  Say Y here to build support for the ams AS5600 12-bit
+	  magnetic rotary position sensor with IIO channel support
+	  (in_angl_raw and in_angl_scale).
+
+	  This is a Rust driver that exposes the 12-bit raw angle
+	  and radian scale via the IIO subsystem.
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
index 000000000000..0cbf8be58b64
--- /dev/null
+++ b/drivers/iio/position/as5600.rs
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2026 Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
+//! Driver for ams AS5600 12-bit magnetic rotary position sensor.
+//!
+//! Datasheet: https://ams.com/documents/20143/36005/AS5600_DS000365_5-00.pdf
+
+use kernel::{
+    bindings::{
+        iio_chan_info_enum_IIO_CHAN_INFO_RAW, iio_chan_info_enum_IIO_CHAN_INFO_SCALE,
+        iio_chan_spec, iio_chan_type_IIO_ANGL, ENODATA,
+    },
+    bits::bit_u8,
+    device::Core,
+    i2c::{DeviceId, Driver, I2cClient, IdTable},
+    i2c_device_table,
+    iio::{Device, IioDriver, IioVal},
+    module_i2c_driver, of, of_device_table,
+    prelude::*,
+};
+
+const AS5600_REG_STATUS: u8 = 0x0B;
+const AS5600_REG_RAW_ANGLE_H: u8 = 0x0C;
+const AS5600_REG_RAW_ANGLE_L: u8 = 0x0D;
+
+const AS5600_STATUS_MD: u8 = bit_u8(5);
+
+module_i2c_driver! {
+    type: As5600,
+    name: "as5600",
+    authors: ["Muchamad Coirul Anwar"],
+    description: "I2C Driver for ams OSRAM AS5600 Magnetic Rotary Position Sensor",
+    license: "GPL",
+}
+
+i2c_device_table!(
+    I2C_TABLE,
+    MODULE_I2C_TABLE,
+    <As5600 as Driver>::IdInfo,
+    [(DeviceId::new(c"as5600"), ())]
+);
+
+of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <As5600 as Driver>::IdInfo,
+    [(of::DeviceId::new(c"ams,as5600"), ())]
+);
+
+struct As5600Priv {
+    client_ptr: *const I2cClient<Core>,
+    channels: [iio_chan_spec; 1],
+}
+
+// SAFETY: `client_ptr` points to an `I2cClient` that is owned by the I2C
+// subsystem and outlives the driver binding. `iio_device_unregister` in
+// `Device<T>::PinnedDrop` drains pending callbacks before this struct is
+// dropped, so `client_ptr` is valid for every `read_raw` invocation.
+// Concurrent access is safe because the I2C adapter lock serializes all
+// SMBus transactions.
+unsafe impl Send for As5600Priv {}
+unsafe impl Sync for As5600Priv {}
+
+impl IioDriver for As5600Priv {
+    fn read_raw(&self, _chan: *const iio_chan_spec, mask: isize) -> Result<IioVal> {
+        // SAFETY: `client_ptr` was set from a valid `&I2cClient` in `probe()`.
+        // The I2C client outlives the driver binding, and `read_raw` is only
+        // called while the driver is bound.
+        let client = unsafe { &*self.client_ptr };
+
+        #[allow(non_upper_case_globals)]
+        match mask as u32 {
+            // IIO_CHAN_INFO_RAW
+            iio_chan_info_enum_IIO_CHAN_INFO_RAW => {
+                let status = client.smbus_read_byte_data(AS5600_REG_STATUS)?;
+                if (status & AS5600_STATUS_MD) == 0 {
+                    return Err(Error::from_errno(-(ENODATA as i32)));
+                }
+
+                let angle_h = client.smbus_read_byte_data(AS5600_REG_RAW_ANGLE_H)? as u16;
+                let angle_l = client.smbus_read_byte_data(AS5600_REG_RAW_ANGLE_L)? as u16;
+
+                let angle = (angle_h << 8 | angle_l) & 0x0FFF;
+                Ok(IioVal::Int(angle as i32))
+            }
+            // IIO_CHAN_INFO_SCALE
+            iio_chan_info_enum_IIO_CHAN_INFO_SCALE => Ok(IioVal::IntPlusNano(0, 1533981)),
+            _ => Err(EINVAL),
+        }
+    }
+
+    fn channels(&self) -> &[iio_chan_spec] {
+        &self.channels
+    }
+}
+
+struct As5600 {
+    _iio_dev: Device<As5600Priv>,
+}
+
+impl Driver for As5600 {
+    type IdInfo = ();
+    const I2C_ID_TABLE: Option<IdTable<Self::IdInfo>> = Some(&I2C_TABLE);
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(dev: &I2cClient<Core>, _id_info: Option<&Self::IdInfo>) -> impl PinInit<Self, Error> {
+        let _status = dev.smbus_read_byte_data(AS5600_REG_STATUS)?;
+
+        // SAFETY: `iio_chan_spec` is a C struct whose fields are all integers
+        // and pointers. Zero is a valid initialization for all of them.
+        let mut channels: [iio_chan_spec; 1] = unsafe { core::mem::zeroed() };
+        channels[0].info_mask_separate = (1 << iio_chan_info_enum_IIO_CHAN_INFO_RAW)
+            | (1 << iio_chan_info_enum_IIO_CHAN_INFO_SCALE);
+        channels[0].type_ = iio_chan_type_IIO_ANGL;
+
+        let priv_data = As5600Priv {
+            client_ptr: dev as *const _,
+            channels,
+        };
+
+        let mut iio_dev = Device::new(dev.as_ref(), priv_data, c"as5600")?;
+
+        iio_dev.register(dev.as_ref(), &crate::THIS_MODULE)?;
+
+        dev_dbg!(dev.as_ref(), "AS5600: Sensor probed, driver ready\n");
+        Ok::<_, Error>(As5600 { _iio_dev: iio_dev })
+    }
+
+    fn unbind(_dev: &I2cClient<Core>, _this: Pin<&Self>) {}
+}
-- 
2.50.0

