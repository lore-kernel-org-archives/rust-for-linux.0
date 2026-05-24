Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1675B393DCA
	for <rust-for-linux@vger.kernel.org>; Sun, 24 May 2026 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779629339; cv=none; b=G1ePM5i44ZvdHPtUyyTbrXK1IryQ3BVT9JMNOrmLM0TmrXZZq/wRkI/tmJuWFcT6+mjMFpHSw8cMfpSpiidSj7NuFrecF+dHge5OkTFaaFQ7jTJYw5lxYJMgWaCHDnOp82fA2p72pSwUmSfzoLwvqX5GZ4svM9JicL03DUHXo6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779629339; c=relaxed/simple;
	bh=K5joXiGigHY4AX80TpszLLsv1e0MQCIb5XR5UlRJug8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hTcLaUH5NUY9heQvWnzCaIUgtPmhhL0Yt8pLUwlJxdtkYyZaRt1bWd2TJ5+q4QSNf0RskhH+3fzIx6FA+62Sr0A9ZftF0RpJzz56frTOg729RDcYWpr9/Cctr+yodwwS/4j+8jZZwkesQHyRrJxYSdPJjVTaQw5XJKjaZFcg/hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eE9mjigx; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eE9mjigx"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2babfd18435so38980265ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 24 May 2026 06:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779629337; x=1780234137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewEUZMFUPji4t9hkw5T9WDC0gsus4wg45o/DJDgsA2k=;
        b=eE9mjigx21k+xriwULpq2uqzlrez/gYAlO3QPrzJXSAh1f4D27zIddoi6pPQum8mbN
         TTl7ToNWnUl/KP2DVak2a7wi/UaZL+5pwoF74GqXGkx5PWfmyeUcqGHhMuwkIuJ6jmfM
         fC3JvVe9s8BpSJJukiy1hEwaSHSvAi7C9EObjKU1S9t/vl1sIVJG+9mtaJPuou4Dd/jP
         dcNQ1QvXyUd/kIsPweyrdk2LpCTt2FxhKqcU6JOI51IkkDHVQXN0S4zNxfwma8ZY7nBi
         xf+T9BxhhCl9O0i6hR1owvcqjRy6Emy0R3wAfYUkztOuLsCbuOzDtLu0MoblUt/apOhY
         ompQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779629337; x=1780234137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ewEUZMFUPji4t9hkw5T9WDC0gsus4wg45o/DJDgsA2k=;
        b=ZZ8iux6wHV76SZ1KFNRbeg0V8chZoinoKn5M/BlYs0THNRRQ3iBaseNco3NLEmk4Ye
         wCrFjUfRvK/R9vg1rf7mSlsnOqG/LOjLdjYusWtQDhEZTWrY3fuJUb1LbuBHj4pBbKNP
         GlYoZeUXt7N9J136KE9JVQvQNGC52G26eQNWprncOUY/lszxIro3+rFSbWpJaqnqHuvh
         WYIUP+mmwOqa2rA3FAC74QyYeoDIKCB4tb1JKhzfuoC1iWCiI1vOUXTiWJLbdRGnXRuu
         xCuvbQhaccPpZkIuDoVrNCgyUc7O5SL0ymFaHXLgE09wiHLpKlvNuFCcM8XXv1XnR+Gd
         CY1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+GaQOD4eSEzMaMaOyoPIXxB4VL9LuAYgVH9sTsGG6CYfYRB4BZFqrlG8DVj6ctdKzGhOeHKshDMORKCAeJnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1OAySlOCxmyJ3F/+7ogIV4ZO1QpOaLCPntzV++w21T+548QUD
	pbdRdwWcwXG0oqIncB9eCq4eU1eQC6LTg4jI3jNFFgnkQe1fEqv987Jv
X-Gm-Gg: Acq92OG26qlSG1wsTDAt04W8Nn8gzcgoiC67QLShbsIpI6TA+ot3YxUFQjwQlyG2wG3
	NZo3XTxE/wwYoPHd8QLESo+8/R8iaNEuoAmq2hkfSgqFau4g3gJbvcGz8XPA8WZxCT2EALkgIYu
	uyZ0xRZQ3YvwyzG7b16LcycsxpC/igTHIOnWozwbUFoBqzJaAb9yu2Drr9LzfF84mtnwc13DcpZ
	W/zxT3iVYx78Vbjfg4OieM65/mWRgZDhnCRwne7gZLprsNpaDodXk0gaTnRomA5phxPjn3TQyqY
	HB3KHcG6cQgZNf3rkit39by2dYiRNaUHgKQn+vqSfZqQArL9RIMKzHe4oWH7yCxeKJWA+daf2ih
	EDo2sbt7+FNHfVWBnLOn/8Vpzd3HOv5ei/FDUAkE1Tx+qY+rItXKKKgB7N+OoK2EjCo3CtFyyXW
	uDP82YmXPCzXxnT5Ly5aUbd7z+UTER8XBG2WN46u1L3VzfyB67RDRUHvW9Y3kA3g==
X-Received: by 2002:a17:903:11c4:b0:2be:260a:592e with SMTP id d9443c01a7336-2beb031b1e9mr110031255ad.1.1779629337390;
        Sun, 24 May 2026 06:28:57 -0700 (PDT)
Received: from 192.168.1.3 ([2001:448a:2003:4286:c553:4edf:bb9:bbd2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm91197175ad.36.2026.05.24.06.28.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 24 May 2026 06:28:56 -0700 (PDT)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Brandon Saint-John <branstj@gmail.com>,
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Subject: [RFC PATCH v3 4/4] iio: position: as5600: add Kconfig and Makefile entries
Date: Sun, 24 May 2026 20:28:23 +0700
Message-ID: <20260524132824.54918-5-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260524132824.54918-1-muchamadcoirulanwar@gmail.com>
References: <20260524132824.54918-1-muchamadcoirulanwar@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add build system integration for the AS5600 Rust IIO driver.
CONFIG_AS5600 depends on I2C, IIO, and RUST.

Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
 drivers/iio/position/Kconfig  | 14 ++++++++++++++
 drivers/iio/position/Makefile |  1 +
 2 files changed, 15 insertions(+)

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
-- 
2.50.0

