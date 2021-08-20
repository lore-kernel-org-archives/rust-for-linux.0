Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36049C4338F
	for <rust-for-linux@archiver.kernel.org>; Fri, 20 Aug 2021 19:39:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8DAF61163
	for <rust-for-linux@archiver.kernel.org>; Fri, 20 Aug 2021 19:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhHTTj6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 20 Aug 2021 15:39:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:30022 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229672AbhHTTj5 (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 20 Aug 2021 15:39:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629488359; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: References: In-Reply-To: Message-Id: Date: Subject: Cc:
 To: From: Sender; bh=7g+BdlC9iasfHFohnzPxC0gwibAs7wyuyv0oBy73rFA=; b=uCEaK1MnAXPpt9QK5ZVbwM+KfSkNfP6MFIyy8oVvye8IKy9VV0VIoMkVEf/lPssPYOWs1kq8
 6zgCZ/SFbjmWvuHZyYrtWqwFHNr/V7YQYE1ftR6s+MeNmWkYRXWQ9E47r91wlKOVz12SExGi
 WYM/i6GQttz2ULMq/mYzAPv3e1s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2YzhhMiIsICJydXN0LWZvci1saW51eEB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 612004e00f9b337f115f28ac (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Aug 2021 19:39:12
 GMT
Sender: amartora=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A4F1DC4360C; Fri, 20 Aug 2021 19:39:11 +0000 (UTC)
Received: from th-lint-038.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: amartora)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 255ADC4338F;
        Fri, 20 Aug 2021 19:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 255ADC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Antonio Martorana <amartora@codeaurora.org>
Cc:     Antonio Martorana <amartora@codeaurora.org>,
        rust-for-linux@vger.kernel.org
Subject: [RFC v2] soc: qcom: socinfo.rs: Add Rust Socinfo Driver implementation
Date:   Fri, 20 Aug 2021 12:38:53 -0700
Message-Id: <1629488333-305361-1-git-send-email-amartora@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629163412-157074-1-git-send-email-amartora@codeaurora.org>
References: <1629163412-157074-1-git-send-email-amartora@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

To: Miguel Ojeda <ojeda@kernel.org>,
    Alex Gaynor <alex.gaynor@gmail.com>,
    Wedson Almeida Filho <wedsonaf@google.com>
Cc: rust-for-linux@vger.kernel.org,
    Trilok Soni <tsoni@codeaurora.org>,
    Elliot Berman <quic_eberman@quicinc.com>,
    linux-arm-msm <linux-arm-msm@vger.kernel.org>,
    Alex Gaynor <alex.gaynor@gmail.com>,
    Wei Liu <wei.liu@kernel.org>

Add initial work for Rust port of qcom/socinfo.c  driver. Socinfo driver
reads QCOM SMEM to learn current device information (e.g. SM8250).

 - Added several C libraries to bindings_helper.h for FFI support from  bindgen.
 - Implemented PlatformDriver and KernelModule traits for SocInfoDriver
    - Register with platform device framework
    - Add devicetree compatibles
 - Did not port functions referenced from SMEM, wanted to show a
   working proof of concept for Rust leaf driver with FFI code
 - Register the discovered SMEM data with socinfo core.

---

This patch relies on Mateusz Jabłoński's try_format! macro patch from GitHub:
https://github.com/Rust-for-Linux/linux/pull/478

V2: Addressed formating issues, added conditional compilation to debug_fs 
variables, fixed Kconfig, and still working on removing references to bindings:: 
by abstracting FFI functions through rust/ .

Signed-off-by: Antonio Martorana <amartora@codeaurora.org>
---
 drivers/soc/qcom/Kconfig         |   9 +
 drivers/soc/qcom/Makefile        |   1 +
 drivers/soc/qcom/socinfo_rust.rs | 794 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/bindings_helper.h    |   7 +
 4 files changed, 811 insertions(+)
 create mode 100644 drivers/soc/qcom/socinfo_rust.rs

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 79b568f..d1b23c1 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -190,6 +190,15 @@ config QCOM_SOCINFO
 	 Say yes here to support the Qualcomm socinfo driver, providing
 	 information about the SoC to user space.
 
+config QCOM_SOCINFO_RUST
+	tristate "Rust implementation of Qualcomm socinfo driver"
+	depends on RUST && QCOM_SMEM
+	help
+	  This driver provides alternative Rust-based kernel-side support
+	  for the socinfo driver.
+
+	  If unsure, say N.
+
 config QCOM_WCNSS_CTRL
 	tristate "Qualcomm WCNSS control driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index ad675a6..340ac65 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_QCOM_SMEM) +=	smem.o
 obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
 obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
+obj-$(CONFIG_QCOM_SOCINFO_RUST) += socinfo_rust.o
 obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
 obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
 obj-$(CONFIG_QCOM_APR) += apr.o
diff --git a/drivers/soc/qcom/socinfo_rust.rs b/drivers/soc/qcom/socinfo_rust.rs
new file mode 100644
index 0000000..3c4fb4c
--- /dev/null
+++ b/drivers/soc/qcom/socinfo_rust.rs
@@ -0,0 +1,794 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Qualcomm support for socinfo.c
+
+#![no_std]
+#![feature(allocator_api, global_asm)]
+
+use kernel::{
+    bindings, bindings::*, c_str, c_types, linked_list::Wrapper, of::ConstOfMatchTable, platdev,
+    platdev::PlatformDriver, prelude::*, str, str::CStr, sys_soc, Error,
+};
+
+use alloc::{boxed::Box, try_format};
+use core::{convert::TryInto, pin::Pin};
+
+module! {
+    type: SocInfoDriver,
+    name: b"socinfo_rust",
+    author: b"Antonio Martorana",
+    description: b"QCOM socinfo rust implementation",
+    license: b"GPL v2",
+}
+
+/// SoC version type with major number in the upper 16 bits and minor
+/// number in the lower 16 bits.
+
+const fn socinfo_major(ver: u32) -> u32 {
+    (ver >> 16) & 0xFFFF
+}
+
+const fn socinfo_minor(ver: u32) -> u32 {
+    ver & 0xFFFF
+}
+
+const fn socinfo_version(maj: u32, min: u32) -> u32 {
+    ((maj & 0xFFFF) << 16) | (min & 0xFFFF)
+}
+
+const SMEM_SOCINFO_BUILD_ID_LENGTH: usize = 32;
+const SMEM_SOCINFO_CHIP_ID_LENGTH: usize = 32;
+
+///  SMEM item id, used to acquire handles to respective
+///  SMEM region.
+const SMEM_HW_SW_BUILD_ID: u32 = 137;
+
+#[cfg(CONFIG_DEBUG_FS)]
+mod config_debug_fs {
+    pub const SMEM_IMAGE_VERSION_BLOCKS_COUNT: usize = 32;
+    pub const SMEM_IMAGE_VERSION_SIZE: usize = 4096;
+    pub const SMEM_IMAGE_VERSION_NAME_SIZE: usize = 75;
+    pub const SMEM_IMAGE_VERSION_VARIANT_SIZE: usize = 20;
+    pub const SMEM_IMAGE_VERSION_OEM_SIZE: usize = 32;
+
+    ///
+    /// SMEM Image table indices
+    ///
+    pub const SMEM_IMAGE_TABLE_BOOT_INDEX: u32 = 0;
+    pub const SMEM_IMAGE_TABLE_TZ_INDEX: u32 = 1;
+    pub const SMEM_IMAGE_TABLE_RPM_INDEX: u32 = 3;
+    pub const SMEM_IMAGE_TABLE_APPS_INDEX: u32 = 10;
+    pub const SMEM_IMAGE_TABLE_MPSS_INDEX: u32 = 11;
+    pub const SMEM_IMAGE_TABLE_ADSP_INDEX: u32 = 12;
+    pub const SMEM_IMAGE_TABLE_CNSS_INDEX: u32 = 13;
+    pub const SMEM_IMAGE_TABLE_VIDEO_INDEX: u32 = 14;
+    pub const SMEM_IMAGE_VERSION_TABLE: u32 = 496;
+}
+
+#[cfg(CONFIG_DEBUG_FS)]
+const PMIC_MODELS: [&str; 37] = [
+    "Unknown PMIC model",
+    "PM8941",
+    "PM8841",
+    "PM8019",
+    "PM8226",
+    "PM8110",
+    "PMA8084",
+    "PMI8962",
+    "PMD9635",
+    "PM8994",
+    "PMI8994",
+    "PM8916",
+    "PM8004",
+    "PM8909/PM8058",
+    "PM8028",
+    "PM8901",
+    "PM8950/PM8027",
+    "PMI8950/ISL9519",
+    "PM8921",
+    "PM8018",
+    "PM8998/PM8015",
+    "PMI8998/PM8014",
+    "PM8821",
+    "PM8038",
+    "PM8005/PM8922",
+    "PM8917",
+    "PM660L",
+    "PM660",
+    "",
+    "",
+    "PM8150",
+    "PM8150L",
+    "PM8150B",
+    "PMK8002",
+    "",
+    "",
+    "PM8009",
+];
+
+#[cfg(CONFIG_DEBUG_FS)]
+#[derive(Default)]
+struct SocInfoParams {
+    raw_device_family: u32,
+    hw_plat_subtype: u32,
+    accessory_chip: u32,
+    raw_device_num: u32,
+    chip_family: u32,
+    foundry_id: u32,
+    plat_ver: u32,
+    raw_ver: u32,
+    hw_plat: u32,
+    fmt: u32,
+    nproduct_id: u32,
+    num_clusters: u32,
+    ncluster_array_offset: u32,
+    num_defective_parts: u32,
+    ndefective_parts_array_offset: u32,
+    nmodem_supported: u32,
+}
+
+#[cfg(CONFIG_DEBUG_FS)]
+struct SmemImageVersion {
+    name: [c_types::c_char; config_debug_fs::SMEM_IMAGE_VERSION_NAME_SIZE],
+    variant: [c_types::c_char; config_debug_fs::SMEM_IMAGE_VERSION_VARIANT_SIZE],
+    pad: c_types::c_char,
+    oem: [c_types::c_char; config_debug_fs::SMEM_IMAGE_VERSION_OEM_SIZE],
+}
+
+#[cfg(CONFIG_DEBUG_FS)]
+fn qcom_show_build_id(seq: &mut bindings::seq_file, p: &mut c_types::c_void) -> Result {
+    let seq_private = seq.private as *mut SocInfo;
+    unsafe {
+        let ref_mut_seq_priv = seq_private.as_mut().unwrap();
+    }
+
+    let mut format = c_str!("%s\n");
+    let format = format.as_char_ptr();
+
+    unsafe {
+        bindings::seq_printf(
+            seq as *mut bindings::seq_file,
+            format,
+            (*seq_private).build_id,
+        )
+    };
+
+    Ok(())
+}
+
+#[cfg(CONFIG_DEBUG_FS)]
+fn qcom_show_pmic_model(seq: &mut bindings::seq_file, p: &mut c_types::c_void) -> Result {
+    let socinfo = seq.private as *mut SocInfo;
+    let mut model;
+
+    let mut format = c_str!("%s\n");
+    let format = format.as_char_ptr();
+
+    let mut secondary_format = c_str!("unknown (%d)\n");
+    let secondary_format = secondary_format.as_char_ptr();
+
+    // SAFETY: `socinfo` is guaranteed to be:
+    // - A valid (and instalized), non-null pointer
+    // - Is properly aligned
+    // - Adheres to aliasing rules
+    unsafe {
+        let mut_socinfo = socinfo.as_mut().unwrap();
+        let test_model = socinfo_minor((*socinfo).pmic_model);
+        model = test_model;
+    }
+
+    let mut check_valid_model: bool = false;
+    if !PMIC_MODELS[model as usize].is_empty() {
+        check_valid_model = true;
+    }
+
+    if model < PMIC_MODELS.len() as u32 && check_valid_model {
+        unsafe {
+            bindings::seq_printf(
+                seq as *mut bindings::seq_file,
+                format,
+                PMIC_MODELS[model as usize],
+            )
+        };
+    } else {
+        unsafe { bindings::seq_printf(seq as *mut bindings::seq_file, secondary_format, model) };
+    }
+
+    Ok(())
+}
+
+#[cfg(CONFIG_DEBUG_FS)]
+fn qcom_show_pmic_model_array(seq: &mut bindings::seq_file, p: &mut c_types::c_void) -> Result {
+    Ok(())
+}
+
+#[cfg(CONFIG_DEBUG_FS)]
+fn qcom_show_pmic_die_revision(seq: &mut bindings::seq_file, p: &mut c_types::c_void) -> Result {
+    Ok(())
+}
+
+#[cfg(CONFIG_DEBUG_FS)]
+fn qcom_show_chip_id(seq: &mut bindings::seq_file, p: &mut c_types::c_void) -> Result {
+    Ok(())
+}
+
+struct SocInfo {
+    fmt: bindings::__le32,
+    id: bindings::__le32,
+    ver: bindings::__le32,
+    build_id: [c_types::c_char; SMEM_SOCINFO_BUILD_ID_LENGTH],
+    raw_id: bindings::__le32,
+    raw_ver: bindings::__le32,
+    hw_plat: bindings::__le32,
+    plat_ver: bindings::__le32,
+    accessory_chip: bindings::__le32,
+    hw_plat_subtype: bindings::__le32,
+    pmic_model: bindings::__le32,
+    pmic_die_rev: bindings::__le32,
+    pmic_model_1: bindings::__le32,
+    pmic_die_rev_1: bindings::__le32,
+    pmic_model_2: bindings::__le32,
+    pmic_die_rev_2: bindings::__le32,
+    foundry_id: bindings::__le32,
+    serial_num: bindings::__le32,
+    num_pmics: bindings::__le32,
+    pmic_array_offset: bindings::__le32,
+    chip_family: bindings::__le32,
+    raw_device_family: bindings::__le32,
+    raw_device_num: bindings::__le32,
+    nproduct_id: bindings::__le32,
+    chip_id: [c_types::c_char; SMEM_SOCINFO_CHIP_ID_LENGTH],
+    num_cluster: bindings::__le32,
+    ncluster_array_offset: bindings::__le32,
+    num_defective_parts: bindings::__le32,
+    nmodem_supported: bindings::__le32,
+}
+
+const SOC_ID: [SocId; 105] = [
+    SocId {
+        id: 87,
+        name: c_str!("MSM8960"),
+    },
+    SocId {
+        id: 109,
+        name: c_str!("APQ8064"),
+    },
+    SocId {
+        id: 122,
+        name: c_str!("MSM8660A"),
+    },
+    SocId {
+        id: 123,
+        name: c_str!("MSM8260A"),
+    },
+    SocId {
+        id: 124,
+        name: c_str!("APQ8060A"),
+    },
+    SocId {
+        id: 126,
+        name: c_str!("MSM8974"),
+    },
+    SocId {
+        id: 130,
+        name: c_str!("MPQ8064"),
+    },
+    SocId {
+        id: 138,
+        name: c_str!("MSM8960AB"),
+    },
+    SocId {
+        id: 139,
+        name: c_str!("APQ8060AB"),
+    },
+    SocId {
+        id: 140,
+        name: c_str!("MSM8260AB"),
+    },
+    SocId {
+        id: 141,
+        name: c_str!("MSM8660AB"),
+    },
+    SocId {
+        id: 145,
+        name: c_str!("MSM8626"),
+    },
+    SocId {
+        id: 147,
+        name: c_str!("MSM8610"),
+    },
+    SocId {
+        id: 153,
+        name: c_str!("APQ8064AB"),
+    },
+    SocId {
+        id: 158,
+        name: c_str!("MSM8226"),
+    },
+    SocId {
+        id: 159,
+        name: c_str!("MSM8526"),
+    },
+    SocId {
+        id: 161,
+        name: c_str!("MSM8110"),
+    },
+    SocId {
+        id: 162,
+        name: c_str!("MSM8210"),
+    },
+    SocId {
+        id: 163,
+        name: c_str!("MSM8810"),
+    },
+    SocId {
+        id: 164,
+        name: c_str!("MSM8212"),
+    },
+    SocId {
+        id: 165,
+        name: c_str!("MSM8612"),
+    },
+    SocId {
+        id: 166,
+        name: c_str!("MSM8112"),
+    },
+    SocId {
+        id: 168,
+        name: c_str!("MSM8225Q"),
+    },
+    SocId {
+        id: 169,
+        name: c_str!("MSM8625Q"),
+    },
+    SocId {
+        id: 170,
+        name: c_str!("MSM8125Q"),
+    },
+    SocId {
+        id: 172,
+        name: c_str!("APQ8064AA"),
+    },
+    SocId {
+        id: 178,
+        name: c_str!("APQ8084"),
+    },
+    SocId {
+        id: 184,
+        name: c_str!("APQ8074"),
+    },
+    SocId {
+        id: 185,
+        name: c_str!("MSM8274"),
+    },
+    SocId {
+        id: 186,
+        name: c_str!("MSM8674"),
+    },
+    SocId {
+        id: 194,
+        name: c_str!("MSM8974PRO"),
+    },
+    SocId {
+        id: 198,
+        name: c_str!("MSM8126"),
+    },
+    SocId {
+        id: 199,
+        name: c_str!("APQ8026"),
+    },
+    SocId {
+        id: 200,
+        name: c_str!("MSM8926"),
+    },
+    SocId {
+        id: 205,
+        name: c_str!("MSM8326"),
+    },
+    SocId {
+        id: 206,
+        name: c_str!("MSM8916"),
+    },
+    SocId {
+        id: 207,
+        name: c_str!("MSM8994"),
+    },
+    SocId {
+        id: 208,
+        name: c_str!("APQ8074-AA"),
+    },
+    SocId {
+        id: 209,
+        name: c_str!("APQ8074-AB"),
+    },
+    SocId {
+        id: 210,
+        name: c_str!("APQ8074PRO"),
+    },
+    SocId {
+        id: 211,
+        name: c_str!("MSM8274-AA"),
+    },
+    SocId {
+        id: 212,
+        name: c_str!("MSM8274-AB"),
+    },
+    SocId {
+        id: 213,
+        name: c_str!("MSM8274PRO"),
+    },
+    SocId {
+        id: 214,
+        name: c_str!("MSM8674-AA"),
+    },
+    SocId {
+        id: 215,
+        name: c_str!("MSM8674-AB"),
+    },
+    SocId {
+        id: 216,
+        name: c_str!("MSM8674PRO"),
+    },
+    SocId {
+        id: 217,
+        name: c_str!("MSM8974-AA"),
+    },
+    SocId {
+        id: 218,
+        name: c_str!("MSM8974-AB"),
+    },
+    SocId {
+        id: 219,
+        name: c_str!("APQ8028"),
+    },
+    SocId {
+        id: 220,
+        name: c_str!("MSM8128"),
+    },
+    SocId {
+        id: 221,
+        name: c_str!("MSM8228"),
+    },
+    SocId {
+        id: 222,
+        name: c_str!("MSM8528"),
+    },
+    SocId {
+        id: 223,
+        name: c_str!("MSM8628"),
+    },
+    SocId {
+        id: 224,
+        name: c_str!("MSM8928"),
+    },
+    SocId {
+        id: 225,
+        name: c_str!("MSM8510"),
+    },
+    SocId {
+        id: 226,
+        name: c_str!("MSM8512"),
+    },
+    SocId {
+        id: 233,
+        name: c_str!("MSM8936"),
+    },
+    SocId {
+        id: 239,
+        name: c_str!("MSM8939"),
+    },
+    SocId {
+        id: 240,
+        name: c_str!("APQ8036"),
+    },
+    SocId {
+        id: 241,
+        name: c_str!("APQ8039"),
+    },
+    SocId {
+        id: 246,
+        name: c_str!("MSM8996"),
+    },
+    SocId {
+        id: 247,
+        name: c_str!("APQ8016"),
+    },
+    SocId {
+        id: 248,
+        name: c_str!("MSM8216"),
+    },
+    SocId {
+        id: 249,
+        name: c_str!("MSM8116"),
+    },
+    SocId {
+        id: 250,
+        name: c_str!("MSM8616"),
+    },
+    SocId {
+        id: 251,
+        name: c_str!("MSM8992"),
+    },
+    SocId {
+        id: 253,
+        name: c_str!("APQ8094"),
+    },
+    SocId {
+        id: 290,
+        name: c_str!("MDM9607"),
+    },
+    SocId {
+        id: 291,
+        name: c_str!("APQ8096"),
+    },
+    SocId {
+        id: 292,
+        name: c_str!("MSM8998"),
+    },
+    SocId {
+        id: 293,
+        name: c_str!("MSM8953"),
+    },
+    SocId {
+        id: 296,
+        name: c_str!("MDM8207"),
+    },
+    SocId {
+        id: 297,
+        name: c_str!("MDM9207"),
+    },
+    SocId {
+        id: 298,
+        name: c_str!("MDM9307"),
+    },
+    SocId {
+        id: 299,
+        name: c_str!("MDM9628"),
+    },
+    SocId {
+        id: 304,
+        name: c_str!("APQ8053"),
+    },
+    SocId {
+        id: 305,
+        name: c_str!("MSM8996SG"),
+    },
+    SocId {
+        id: 310,
+        name: c_str!("MSM8996AU"),
+    },
+    SocId {
+        id: 311,
+        name: c_str!("APQ8096AU"),
+    },
+    SocId {
+        id: 312,
+        name: c_str!("APQ8096SG"),
+    },
+    SocId {
+        id: 317,
+        name: c_str!("SDM660"),
+    },
+    SocId {
+        id: 318,
+        name: c_str!("SDM630"),
+    },
+    SocId {
+        id: 319,
+        name: c_str!("APQ8098"),
+    },
+    SocId {
+        id: 321,
+        name: c_str!("SDM845"),
+    },
+    SocId {
+        id: 322,
+        name: c_str!("MDM9206"),
+    },
+    SocId {
+        id: 324,
+        name: c_str!("SDA660"),
+    },
+    SocId {
+        id: 325,
+        name: c_str!("SDM658"),
+    },
+    SocId {
+        id: 326,
+        name: c_str!("SDA658"),
+    },
+    SocId {
+        id: 327,
+        name: c_str!("SDA630"),
+    },
+    SocId {
+        id: 338,
+        name: c_str!("SDM450"),
+    },
+    SocId {
+        id: 341,
+        name: c_str!("SDA845"),
+    },
+    SocId {
+        id: 345,
+        name: c_str!("SDM636"),
+    },
+    SocId {
+        id: 346,
+        name: c_str!("SDA636"),
+    },
+    SocId {
+        id: 349,
+        name: c_str!("SDM632"),
+    },
+    SocId {
+        id: 350,
+        name: c_str!("SDA632"),
+    },
+    SocId {
+        id: 351,
+        name: c_str!("SDA450"),
+    },
+    SocId {
+        id: 356,
+        name: c_str!("SM8250"),
+    },
+    SocId {
+        id: 394,
+        name: c_str!("SM6125"),
+    },
+    SocId {
+        id: 402,
+        name: c_str!("IPQ6018"),
+    },
+    SocId {
+        id: 403,
+        name: c_str!("IPQ6028"),
+    },
+    SocId {
+        id: 421,
+        name: c_str!("IPQ6000"),
+    },
+    SocId {
+        id: 422,
+        name: c_str!("IPQ6010"),
+    },
+    SocId {
+        id: 425,
+        name: c_str!("SC7180"),
+    },
+    SocId {
+        id: 453,
+        name: c_str!("IPQ6005"),
+    },
+    SocId {
+        id: 455,
+        name: c_str!("QRB5165"),
+    },
+];
+
+struct SocId {
+    id: u32,
+    name: &'static str::CStr,
+}
+
+fn socinfo_machine(id: &u32) -> Option<&'static str::CStr> {
+    for idx in SOC_ID {
+        if idx.id == *id {
+            return Some(idx.name);
+        }
+    }
+    None
+}
+
+struct QcomSocInfo {
+    soc_dev: *mut bindings::soc_device,
+    attr: bindings::soc_device_attribute,
+    dbg_root: *mut bindings::dentry,
+    info: SocInfoParams,
+}
+
+impl QcomSocInfo {
+    fn socinfo_debugfs_init(
+        &self,
+        info: &mut SocInfo,
+        info_size: usize,
+    ) -> Option<c_types::c_void> {
+        None
+    }
+
+    fn socinfo_debugfs_exit(&self) -> Option<c_types::c_void> {
+        None
+    }
+
+    fn new() -> Self {
+        QcomSocInfo {
+            soc_dev: core::ptr::null_mut(),
+            attr: bindings::soc_device_attribute::default(),
+            dbg_root: core::ptr::null_mut(),
+            info: <SocInfoParams as Default>::default(),
+        }
+    }
+}
+
+struct SocInfoDriver {
+    _pdev: Pin<Box<platdev::Registration>>,
+}
+
+impl PlatformDriver for SocInfoDriver {
+    type DrvData = Pin<Box<QcomSocInfo>>;
+
+    fn probe(device_id: i32) -> Result<Self::DrvData> {
+        pr_info!(
+            "Just checking if probe works, with device id {}\n",
+            device_id
+        );
+
+        let mut drv_data = Pin::from(Box::try_new(QcomSocInfo::new())?);
+
+        let item_size: *mut usize = core::ptr::null_mut();
+
+        let mut info = unsafe {
+            bindings::qcom_smem_get(
+                QCOM_SMEM_HOST_ANY.try_into().unwrap(),
+                SMEM_HW_SW_BUILD_ID,
+                item_size,
+            ) as *mut SocInfo
+        };
+
+        let info_mut: &mut SocInfo;
+        unsafe {
+            info_mut = info.as_mut().unwrap();
+        }
+
+        drv_data.as_mut().attr.family = c_str!("Snapdragon").as_char_ptr();
+        drv_data.as_mut().attr.machine = socinfo_machine(&info_mut.id).unwrap().as_char_ptr();
+
+        drv_data.as_mut().attr.soc_id =
+            CStr::from_bytes_with_nul(try_format!("{}\0", info_mut.id)?.as_bytes())
+                .unwrap()
+                .as_char_ptr();
+
+        drv_data.as_mut().attr.revision = CStr::from_bytes_with_nul(
+            try_format!(
+                "{}.{}\0",
+                socinfo_major(info_mut.ver),
+                socinfo_minor(info_mut.ver)
+            )?
+            .as_bytes(),
+        )
+        .unwrap()
+        .as_char_ptr();
+
+        unsafe {
+            drv_data.as_mut().soc_dev = bindings::soc_device_register(&mut drv_data.as_mut().attr);
+            drv_data
+                .as_mut()
+                .socinfo_debugfs_init(info.as_mut().unwrap(), *item_size);
+            bindings::add_device_randomness(info as *mut c_types::c_void, *item_size as u32)
+        };
+
+        Ok(drv_data)
+    }
+    fn remove(device_id: i32, _drv_data: Self::DrvData) -> Result {
+        pr_info!("removing socinfo_rust now with device id {}\n", device_id);
+
+        unsafe { bindings::soc_device_unregister(_drv_data.soc_dev) };
+        _drv_data.as_ref().socinfo_debugfs_exit();
+        Ok(())
+    }
+}
+
+impl KernelModule for SocInfoDriver {
+    fn init() -> Result<Self> {
+        const OF_MATCH_TBL: ConstOfMatchTable<1> =
+            ConstOfMatchTable::new_const([c_str!("qcom-socinfo")]);
+
+        let pdev = platdev::Registration::new_pinned::<SocInfoDriver>(
+            c_str!("qcom-socinfo"),
+            Some(&OF_MATCH_TBL),
+            &THIS_MODULE,
+        )?;
+        Ok(SocInfoDriver { _pdev: pdev })
+    }
+}
diff --git a/rust/kernel/bindings_helper.h b/rust/kernel/bindings_helper.h
index c64a630..a8c73450 100644
--- a/rust/kernel/bindings_helper.h
+++ b/rust/kernel/bindings_helper.h
@@ -18,6 +18,13 @@
 #include <linux/platform_device.h>
 #include <linux/of_platform.h>
 #include <linux/security.h>
+#include <linux/sys_soc.h>
+#include <linux/err.h>
+#include <linux/debugfs.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/random.h>
 
 // `bindgen` gets confused at certain things
 const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

