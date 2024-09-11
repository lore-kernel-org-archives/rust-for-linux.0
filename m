Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986721A2627
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Sep 2024 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726064926; cv=none; b=NAGqAEmhRtpkBhB3jV++Jw727rgexz/rYUhTR56JrRJUhb5tcKEeOHjM6YbXIEW34Jx2th8rlIl7jsXto0QVW5R1dQGiye5uD97syujwD1X4BierULWX94oOcWEnjwzWCyHRu7o6/CXzFu9CZtZCkRtlTbTO6iE38OROXWnHwVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726064926; c=relaxed/simple;
	bh=fvn5dpE2XyvTj0U03uUcIoDMSvkgRzCWJgdVKHBGt+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=laz7nzyMrDx5daUaByAKrlE6bqV8L89CC32KPUcgcMmwXty8GPZFRf+bvfy0LMRrypHP8o3Fwkh6g3mDxZUSWPAdKB13eMc5zxmYeY20L9JouUGCK1K/YGKp7rWyuaN8Q/xIAEQAEbfqR5ma6uGEoxupZn90Opu8N7JXrUwqttQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=XDETgUYE; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="XDETgUYE"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-2d873dc644dso1545931a91.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Sep 2024 07:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1726064923; x=1726669723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTZXIs4uk1Xc7bmq3sRcTypL0+dX/QazKSXr67dxE0M=;
        b=XDETgUYEHXcYpoWVkeummhH3hmtGzz/b5qNY1y62RnPqzHCTQhHQGelTLOT7zgXNN5
         gyVdfkcoa+A11xpfX8rSHmzpOhusFrsBZ2FHBhW0Ib1FkH4pkjwjyoyZ7QwwpNUzmgcC
         XKAJ2Uvm60WbBHC8lc1B7HyImskkZ1e+056kQbprQjMzlV7VCVEcELVWOS7ROQLofJi+
         9qO6+m2q5MIQy5XfSvlXl3zKEi3bpFfYExWPNocx+eOHiuoh6D4t2SmnVDfaEGrIGXMW
         7DZ29BVEd/YqCJx/FPR7uaKCDRxfC5mly6mMQBu5AvSiW1UjO3Vg/KF8cfDygrUFNML8
         2RPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726064923; x=1726669723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTZXIs4uk1Xc7bmq3sRcTypL0+dX/QazKSXr67dxE0M=;
        b=s3OjLrB7wgeJLFqsdVLIS4HERViegntIjcyeevC8d1XD8At7vSLEtvfDG9wp3y1T9s
         nez6CZIJ8fQHj3yq/0fyTp6a9J3onrzyIW1f2sNGO6lBfQWdSXR+FhisNI+6dk+o3blE
         oRlXnLrgcKtI2tRF5gTMyTe1nRW9UMVpdVE61HqlM4gqnd2cI2eEKthNZ73hvFer/ITl
         O1OdcGRDcigoziO/rYp9ZkTQa+rRZv7DL1Oj2KP7mFek5ymEY+EbceBsylDuKuMFBTrP
         m/tz5Poo5XSMUgDRmyo0D8ANndgaX3Rz81nqNPqCRNhT6sCk06PlL1ZUuBc2O2IpJHe4
         IErw==
X-Forwarded-Encrypted: i=1; AJvYcCVBE/x45z05tdiLJ9xTxFmqVl9MywgvPt40iOotZzYVFqpl4s6xspuZRGx4Be7cZo1QGnd2V3Q8FEq+cSAfZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH35Hb8qi2cgwzOTHVfvQYWJiB4lDjVI7vGOKMhRbYR8FpUA46
	82VuAeBBZMXkjxCj5LEf2W949mxd8ctg6g0CXHv/f++mDcKxdQbI7vU3LoIrQg==
X-Google-Smtp-Source: AGHT+IF++BogjcP4oyy+DBrKCYr5bb8gz+HUGRerT0bhZx+7Lc/6JJaHgIpOtNWMJNsPpzmw/R8LWA==
X-Received: by 2002:a17:90b:1e4c:b0:2d8:d098:4f31 with SMTP id 98e67ed59e1d1-2db82fe9fd4mr3821301a91.17.1726064922953;
        Wed, 11 Sep 2024 07:28:42 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadbfe46c9sm10639116a91.11.2024.09.11.07.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:28:42 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Wed, 11 Sep 2024 19:57:23 +0530
Subject: [PATCH 6/8] addon_boards: Add addon_boards plumbing
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-mikrobus-dt-v1-6-3ded4dc879e7@beagleboard.org>
References: <20240911-mikrobus-dt-v1-0-3ded4dc879e7@beagleboard.org>
In-Reply-To: <20240911-mikrobus-dt-v1-0-3ded4dc879e7@beagleboard.org>
To: fabien.parent@linaro.org, d-gole@ti.com, lorforlinux@beagleboard.org, 
 jkridner@beagleboard.org, robertcnelson@beagleboard.org, 
 Andrew Davis <afd@ti.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2645; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=fvn5dpE2XyvTj0U03uUcIoDMSvkgRzCWJgdVKHBGt+M=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBm4ajW3lj4TagmQ2l11Yz9eXm8I+My2lBntIytD
 qsFIZFBHp+JAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZuGo1gAKCRAFzvXHieVa
 dD7hD/9Dh5cX/zgWb0ImhB3R//a2DVBC9/xamAtVS4AbOSg5czQb4pQ71uEpoYwkMLI/76nQAwo
 IznhuYiB1NivpVD/r6xayr9afiar7AoVfMGwXxOL4qdxx1UvWeuhMu7RE1rW8su3VtxVqN162fS
 c0em/ySb2wnxpKh0Ku7yyDfZwk7tuQ0XIBA0ysPbyEuKZxXxcCmdVdITr5WPXhsuUmY88ISzjkX
 CZejxuAMldlcHCYX2MBKgHPJhsjMX5CCAYKjANMIhsRyYCC1FQRva3ZkzKJmt7Eo050MW7DEfgP
 21m/nGriy3Ps0ru8+AQlcx+zcfytxjVyPRcS5Fn4Tk+6h94CdDEHG4ug6+enMWWYe4t7fCuZeqA
 2NodmWtzcivV1QShnpfXjXUL8YgEvUjiDEm9qHRwar0hno3NQp2GjTZYha96Q2uFJPeRbOwnLv7
 ze5KWxyoWD6kN9+kKnNWbrIQusdm1f8moFEEt7NGLd6VjqytwYf4yQgCuEcMiQqX33zxgfB54Ve
 YX4UelJTyCRCLp2C5uNWDyermCLf4HN0GgJgZayTIedZjWsqEBfYd8qg4SynbR+G8JkKasqS0N7
 Cuf09oC6oJNSL/HoG0XHANtLJfpu24X2RxKwgIccIhYtel+ME1FZO1/mB5L3iKh/W32xgVXm96V
 I1eRlTEYdHwR6RA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

A directory to store and build addon_board overlays like mikroBUS,
Groove, etc. The overlays present here should be completely independent
of the underlying connector.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 Kbuild                         |  1 +
 Kconfig                        |  2 ++
 MAINTAINERS                    |  1 +
 addon_boards/Kconfig           | 16 ++++++++++++++++
 addon_boards/Makefile          |  3 +++
 addon_boards/mikrobus/Makefile |  1 +
 6 files changed, 24 insertions(+)

diff --git a/Kbuild b/Kbuild
index 464b34a08f51..9c897397f55f 100644
--- a/Kbuild
+++ b/Kbuild
@@ -97,3 +97,4 @@ obj-$(CONFIG_SAMPLES)	+= samples/
 obj-$(CONFIG_NET)	+= net/
 obj-y			+= virt/
 obj-y			+= $(ARCH_DRIVERS)
+obj-y			+= addon_boards/
diff --git a/Kconfig b/Kconfig
index 745bc773f567..49880d4e91e9 100644
--- a/Kconfig
+++ b/Kconfig
@@ -30,3 +30,5 @@ source "lib/Kconfig"
 source "lib/Kconfig.debug"
 
 source "Documentation/Kconfig"
+
+source "addon_boards/Kconfig"
diff --git a/MAINTAINERS b/MAINTAINERS
index 95f228c85a40..8e2e0f8d16be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15432,6 +15432,7 @@ F:	drivers/usb/image/microtek.*
 MIKROBUS CONNECTOR
 M:	Ayush Singh <ayush@beagleboard.org>
 S:	Maintained
+F:	addon_boards/mikrobus/*.dtso
 F:	arch/arm64/boot/dts/ti/k3-am625-beagleplay-mikrobus-connector0.dtso
 F:	Documentation/devicetree/bindings/connector/mikrobus-connector.yaml
 F:	drivers/misc/mikrobus.rs
diff --git a/addon_boards/Kconfig b/addon_boards/Kconfig
new file mode 100644
index 000000000000..01766ab28848
--- /dev/null
+++ b/addon_boards/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+menu "Addon Board Overlays"
+
+config MIKROBUS_BOARD_OVERLAYS
+	bool "mikroBUS board overlays"
+	depends on OF_OVERLAY
+	depends on MIKROBUS
+	help
+	  This option enables the mikroBUS addon board overlays. mikroBUS is an
+	  add-on board socket standard that offers maximum expandability with
+	  the smallest number of pins.
+
+	  Say Y here to enable overlays for MikroBUS addon boards.
+
+endmenu
diff --git a/addon_boards/Makefile b/addon_boards/Makefile
new file mode 100644
index 000000000000..38275c3ff4c1
--- /dev/null
+++ b/addon_boards/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+subdir-$(CONFIG_MIKROBUS_BOARD_OVERLAYS) += mikrobus
diff --git a/addon_boards/mikrobus/Makefile b/addon_boards/mikrobus/Makefile
new file mode 100644
index 000000000000..f66554cd5c45
--- /dev/null
+++ b/addon_boards/mikrobus/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0

-- 
2.46.0

