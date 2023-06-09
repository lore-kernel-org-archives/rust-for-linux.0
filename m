Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37997C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237844AbjFIG5D (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238578AbjFIG4h (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:37 -0400
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602792D7E
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2628; q=dns/txt; s=iport;
  t=1686293795; x=1687503395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h4eLsoJNiilSAwipHiajJP5dvQLMxVKl/yJdfjHDB60=;
  b=Nq8xKsBwGFK7vEXm3uCJaows4TDO6YSmtpbxljfhbBUuJ3ua2AeC8rid
   1FdC1yw4hVaOldmu0rYMTIZ3rclQoD3DqNnzFBjvRLzdMkFBffiogl1MX
   WfUvm904V5TuqKuZLX2R0GFqzYDIiTlaRJH/85lPl9TKSzlx3f2gPpwPD
   I=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5453676"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:41 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDB055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:41 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 17/80] kernel: configs: add qemu-busybox-min.config
Date:   Fri,  9 Jun 2023 09:30:15 +0300
Message-Id: <20230609063118.24852-18-amiculas@cisco.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609063118.24852-1-amiculas@cisco.com>
References: <20230609063118.24852-1-amiculas@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: amiculas
X-Outbound-SMTP-Client: 10.61.198.236, [10.61.198.236]
X-Outbound-Node: aer-core-5.cisco.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 arch/x86/configs/qemu-busybox-min.config | 11 +++++
 kernel/configs/qemu-busybox-min.config   | 56 ++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/x86/configs/qemu-busybox-min.config
 create mode 100644 kernel/configs/qemu-busybox-min.config

diff --git a/arch/x86/configs/qemu-busybox-min.config b/arch/x86/configs/qemu-busybox-min.config
new file mode 100644
index 000000000000..9a2bf2549053
--- /dev/null
+++ b/arch/x86/configs/qemu-busybox-min.config
@@ -0,0 +1,11 @@
+CONFIG_64BIT=y
+CONFIG_ACPI=y
+
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PVH=y
+
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="console=ttyS0 nokaslr rdinit=/sbin/init"
diff --git a/kernel/configs/qemu-busybox-min.config b/kernel/configs/qemu-busybox-min.config
new file mode 100644
index 000000000000..51435e178199
--- /dev/null
+++ b/kernel/configs/qemu-busybox-min.config
@@ -0,0 +1,56 @@
+# This is a minimal configuration for running a busybox initramfs image with
+# networking support.
+#
+# The following command can be used create the configuration for a minimal
+# kernel image:
+#
+# make allnoconfig qemu-busybox-min.config
+#
+# The following command can be used to build the configuration for a default
+# kernel image:
+#
+# make defconfig qemu-busybox-min.config
+#
+# On x86, the following command can be used to run qemu:
+#
+# qemu-system-x86_64 -nographic -kernel vmlinux -initrd initrd.img -nic user,model=rtl8139,hostfwd=tcp::5555-:23
+#
+# On arm64, the following command can be used to run qemu:
+#
+# qemu-system-aarch64 -M virt -cpu cortex-a72 -nographic -kernel arch/arm64/boot/Image -initrd initrd.img -nic user,model=rtl8139,hostfwd=tcp::5555-:23
+
+CONFIG_SMP=y
+CONFIG_PRINTK=y
+CONFIG_PRINTK_TIME=y
+
+CONFIG_PCI=y
+
+# We use an initramfs for busybox with elf binaries in it.
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_RD_GZIP=y
+CONFIG_BINFMT_ELF=y
+CONFIG_BINFMT_SCRIPT=y
+
+# This is for /dev file system.
+CONFIG_DEVTMPFS=y
+
+# Core networking (packet is for dhcp).
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_INET=y
+
+# RTL8139 NIC support.
+CONFIG_NETDEVICES=y
+CONFIG_ETHERNET=y
+CONFIG_NET_VENDOR_REALTEK=y
+CONFIG_8139CP=y
+
+# To get GDB symbols and script.
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
+CONFIG_GDB_SCRIPTS=y
+
+# For the power-down button (triggered by qemu's `system_powerdown` command).
+CONFIG_INPUT=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_KEYBOARD=y
-- 
2.40.1

