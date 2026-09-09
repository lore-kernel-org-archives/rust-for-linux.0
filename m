Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011047.outbound.protection.outlook.com [52.101.57.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CC6345EDD
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 06:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934000; cv=fail; b=gGNSfiK9DIvB1aCNHkyrLWVtCPhAW8VPMe3XTLJJ+HPy0PBRu0k70x/5LoU8jnXOP52jxWpkfdi1h6kjZ69HmPj360oVJF12EapO4sZjiW/PTWXpd1ROUhHW/bAg8ceciysO4Ye0zkR952krN6JAG7UC57+TBXee8qWN8SN4PsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934000; c=relaxed/simple;
	bh=WnFh5e9FNNzDb9M28foGmQ1GQl+QMDYcoyxME0QE7GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aB4IRIFtKKbmp/g0TPBloMqhMUyB5GV2Bm2HMibecD6i03FEEhUa09O/eCTAQafji/yLottRAhFOPk0Yxuk6dEub4CbkXQ58onkiBcpxqqSohHfX/W90qtny3RJnKVmYk8B+svtz2ooVKJi5aieXK/saW+rto1/Ck/idnOhAz+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NUmRpGxd; arc=fail smtp.client-ip=52.101.57.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NUmRpGxd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/JPuVggEq88eIqtrGxH04pBUuyHkYdTzpiPtBtprOy0hKCWdjtGkavGTq5IRlbKv8pmcxQWZ5GuqgsRWWROuvvSohSZ6l2hiru/FVtz8Ks2V9c+EQsWwNNng0eETtCjqvR7TfcL9IUgTF0b1GHCTPAHZm/5vpsXSHU01/Q5VJLVJ4Cl3kbU6mOy5uFl8/gopFMbJGg92mL2NyDddh5ImaPj/WU89rLOYxI2bBesH/htc0l8n7FFpHThVVim0AiN8236uyQAkupsxo8bdbfDr+d7wBnxxrMWUvAQ8jndUqR2jlfL/tibjlOoR2lUqVgsM1Zuy31UjswuKqy2sQlAfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKLIrGO88B0PDUHVVVzpDZM7SDePUWcUzThR3md2H6s=;
 b=IATyj7w9bLWEk+ooq/v4rDymotQstMf9hSYnWaA3TbmG8MhN91kl4sPuccmDS8Jp96+Rwg+tWyzcJHZpOjtafQzcQvu+ZAqHtckaBLWbIVm1TuczZdWyhv4t0YjMOZLVd9mgYxLNApvNNGAa8IQ7vp6v2mvwo1aNYaMjRf7iSfxVcpA21r3P7yRax/uh/nfpGKFsP6yE1lFCaT5GETUrydFpm5RnaNBZe6yYrzh8Tr/6oooOa3Yg03FOK15c9J/KDAIbxidWcni9z6torNszxaBBSWlJGUHNsxYC8aOId1uR+L3S2h2jquRpKSpR/Vyaz/oPObu/tsW1EMe55/xlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKLIrGO88B0PDUHVVVzpDZM7SDePUWcUzThR3md2H6s=;
 b=NUmRpGxd9mxwCim44riX+qKynbSYD3X41jb1vH1+oJAe/hSypdXT96Q74ysdEba3pJXCckrzXu8pNDgDbwNN4fPYs/2p4dzohRMcGxAANN1d6h0XCNeXbYWXwDeSvsK4jbO96dJEED+JLnV3nmestVX5X/KtK8pE3hUxm9T5Q6ZluAwORsBOuUdt8YQdJ0W3x5LkIos6p4z9sp3TtuP4CCZXGcLRIPSUQSN8hImg98OvnWdPzkdUiKCrNC8cwvJA6vwpote3MqDCjWOi88KvPVLFLbiu4yu03NjKp4RD6RL/qMLKaCpfEeVbOl2dPbYiSDOhu5FiDan30qPajw9iOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22)
 by LV3PR12MB9353.namprd12.prod.outlook.com (2603:10b6:408:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 06:06:30 +0000
Received: from MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28]) by MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 06:06:30 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Alistair Popple <apopple@nvidia.com>
Subject: [PATCH] rust: kbuild: export symbols from the `uapi` crate
Date: Wed,  9 Sep 2026 16:06:23 +1000
Message-ID: <20260909060623.888777-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0073.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::8) To MN0PR12MB5977.namprd12.prod.outlook.com
 (2603:10b6:208:37c::22)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5977:EE_|LV3PR12MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: 94861220-b007-496f-3073-08df0e387de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|10067099003|6133799003|56012099006|18002099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	+mxIPwlte0ZO4zPUx6P9UUE5/NcvyAtbkWoOh6abnSCueP+bc5cMWH9EIj+lEihqHtuK+V/tAOebd8FNVu/RkrSVNn1EHpqTdtKLiJBsMe3Q2peNj4x+ymsrHjcGntz0tFL41l5mB98NPISnYPFJKBRSo/uEGeJV8vgPZmos7Fk/ERaLAHDB7sLfbzuvA7TMqcK0f0qNPSKnUAgpQ9eF7+o+zhz/VeIC4pPWJm+OXN58p812y7Qf7CKFRZHq4CcZrchHKlk89x2bn+98n/85EEpyjAV/pX7i3VJmz9WLhwF4gvXK3WiYacmuQRN6rslUVAgjdOQ3NzFg+fyC9/fL2UFTud4Y8dYXU3Ai/JI4k+X7XlsLnEKWkn1SMlq7/+w99NVKnXxWOYcIhNt1nWtZkeVt2pBaT+JdVL/a7syc4VyXakvjBh8jr+vocR+N9DNgHS31hd3ZTHCHUC3zjLIvtMN1ugSH9IsaySuEZCKBgqDuQ/0HHrROuqVYZu3qFCXKNrOBUodVWYXCvXSeeo8+nQ8vQ7qCF28DVeXYfWwyD7RSwPyp2Fcpt1zEnADrUh4XXDZsSwzSDp0t9W5i9J/UbVzw60xE2nm3ZNdwwLoenBoqZvHCit5NKFpAtWXvGmnRf22XwoW+13u7+5wywpH0cavTjjnXZv7UGOhWrC6Mi0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5977.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(10067099003)(6133799003)(56012099006)(18002099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?teCqtWLXdRVo6nbyrB7nl8QOulRnbRAkPtpcHiTwIvy22nm20Io8LzvXzxvR?=
 =?us-ascii?Q?gQje/AvKXagewZw6qUZMc9sVbfD+knLm8gw1SZdG1EPecZRntSvcIw70hqvI?=
 =?us-ascii?Q?PrGwoM0ZaFM0MPvA9aSzEIZ395tDIkQElF2ezaE95+bVF0B6l6QDDDtPxoio?=
 =?us-ascii?Q?5Tyi99pB4KkXpnfvpq59QMqtgczf22woSOfh9IygnP2rJhSWPOwXyyw2pKlz?=
 =?us-ascii?Q?YmKWmEid7e2J/2+EkmcbbAVpGldiZ2Dv26APZqwQ+07tlR9/9ubVMLXm/Jqe?=
 =?us-ascii?Q?WbsM0LBsukjgyinALbJbuZvZFpzHHul4RyULapT5/SaddBJSdIROgK86jmZU?=
 =?us-ascii?Q?hK5X6puJBZGzQrePtkOvJJ9T7LYTzxTZR+vA3Ol2YxqLNKdmWVG0Qq8e2QlZ?=
 =?us-ascii?Q?CDmOGVo89LIz6lxWZ5r3lsdV0fzkccJa17RKe4Mo18Hj5d5sGIfkS1C6e2kV?=
 =?us-ascii?Q?gk56TkxHR/VNcaTx81vTGR5Eq0KC9oZpZBWE+6VGConItREx+SpektluDH+K?=
 =?us-ascii?Q?oL/Cclb2o/pvHdubi/ucMeAEFkyyF9nUskvrxOO0bXQi2Tm6ZtZg/9lky7GT?=
 =?us-ascii?Q?fIDUlFxOlc1zijdXadPfkeGCIFtrZw2AbKoC096Gz3hcukcVbqfOMzGe1XUO?=
 =?us-ascii?Q?hIesDyPUYfv8VHTtrlT9be3m9M4MViPLOviJ1PUstEiFTqjdOSfG4y2I3jJB?=
 =?us-ascii?Q?4x688psk3ydyLDEKXceVEglcFd6+JS4D1wb5zYz3BM+8ubNf3SnVgDcPBy98?=
 =?us-ascii?Q?qfyinJHEiu/7FJddqwZ7LKGk2i17bFB5UrQld9Gh4D1UdqfmFzh8ay2hN+v1?=
 =?us-ascii?Q?WvijmrMTsQiIMk61QlgWhk4cd/taMpxYU/HXEISjvhQkXOJWdlh843zhSSMP?=
 =?us-ascii?Q?LH20w9fyxpJjJ/z5g1BnDm9D7Y4cDGfENO/R7+z9roHROLl7QhBR+lNPGxUS?=
 =?us-ascii?Q?hCi9d58cTFLt0pCwX2eyuwslCuDlMqfz2+WoizJAI1gTluqB/AC+XvMnoiB1?=
 =?us-ascii?Q?hRvdseGW2ZFYMr4HNX0vcxNPQfhrBr27RFqguRqgMi9YrPcG8470faBU3v+m?=
 =?us-ascii?Q?n3+Tx/KITqSBjBkG5EL7cdfirHOZ1QaQdvxELcWtZGy7M4SPjWlpBPvTquNg?=
 =?us-ascii?Q?pTC2JI7uMgW4+qdjU+HeKJmSzGWo1N5RcoyrxUzHHx+v68M7JEseroSCxIgp?=
 =?us-ascii?Q?EZk+lhncyFzyrvHnaFCUz0tCmABJUiFushf7nJ1AFSpHZ7ISnUCyXdE8jNic?=
 =?us-ascii?Q?IIxTDLbV+IX68wPIiDwzGFP3sFvSRBE+C7z/fEJvO8LJNbFBc2+uNWXQD4Uh?=
 =?us-ascii?Q?7UaR4+Extz9O/czJSFS+BVK3nykPIkTpwC0oe7IRHsmzmxnXiu4ryJxfgZXK?=
 =?us-ascii?Q?Q5ie1o2e53JeF6pZkbVmDrDZXqgUiHkHSLi4/pZVDsCxmC+wFqPj0VElWFLf?=
 =?us-ascii?Q?f9HozrhYBVTqqvzeUGPCKuuTsFZrmcY+Gz+QnZvO28Doxg5OWL9Owp4Yp8qu?=
 =?us-ascii?Q?fAmU36RNMxrG/saJs4qxb3JLJnsSiUei+9Rn5h1fYW/eOE5Bx6pplFX0YHeR?=
 =?us-ascii?Q?g+e1VW6ehuBHNludM9hd0VTcXe/eaOZhZ20pIcWMlcfWfQMi8OLveTJpAqIb?=
 =?us-ascii?Q?0f68dcTKG3S1LymLm7TRCEl/oDBPqgXblmpfKoN1X8XlfaVw6d+tzni3/+zu?=
 =?us-ascii?Q?OdzJdOmB4gkYj0V0kWUzjAOGzLeMN0fp45U9BBZq4UqNzDRcrMlOEKVxqaCY?=
 =?us-ascii?Q?GKe2mqOAGg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94861220-b007-496f-3073-08df0e387de9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5977.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 06:06:30.6797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKkKr8UsEpdof/I2QCk7sD5SRs3Ljzxi3p/+Sjc/rvQFywu03izmRqblezbNcobjlwx8Z2iXLf/7/Tr1Ye/Zbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9353

Symbols from the `bindings` crate and the C helpers are exported so
that loadable modules can link against code the compiler chose not to
instantiate in the module itself. The `uapi` crate has the same problem
but nothing from it is exported.

In practice this goes unnoticed because the only functions in `uapi`
are the trivial `Default` implementations generated by `bindgen`,
which rustc inlines across crates. With CONFIG_RUST_DEBUG_ASSERTIONS=y
however, the `Default` implementation for structs can grow past the
automatic cross-crate inlining threshold. The module then references the
copy in `uapi.o`, which is not exported, and the build fails:

  ERROR: modpost: drivers/gpu/nova-drm.ko: symbol '_RNvXsH_Csk9v2ZIpWbWt_4uapiNtB5_17drm_nova_info_gpuNtNtCsfr3MPOfBGpN_4core7default7Default7default' undefined!

Fix this by exporting the `uapi` symbols in the same way as `bindings`.

Fixes: 4e1746656839 ("rust: uapi: Add UAPI crate")
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Assisted-by: LLM
---
 rust/Makefile  | 7 ++++++-
 rust/exports.c | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index da1a7409d984..083992a5c1c9 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -27,6 +27,7 @@ always-$(CONFIG_RUST) += exports_bindings_generated.h exports_kernel_generated.h
 
 always-$(CONFIG_RUST) += uapi/uapi_generated.rs
 obj-$(CONFIG_RUST) += uapi.o
+always-$(CONFIG_RUST) += exports_uapi_generated.h
 
 ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
 obj-$(CONFIG_RUST) += build_error.o
@@ -575,7 +576,8 @@ $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 # in the crate where they are defined. Other helpers, called from non-inline
 # functions, may not be exported, in principle. However, in general, the Rust
 # compiler does not guarantee codegen will be performed for a non-inline
-# function either. Therefore, we export all symbols from helpers and bindings.
+# function either. Therefore, we export all symbols from helpers, bindings and
+# uapi.
 # In the future, this may be revisited to reduce the number of exports after
 # the compiler is informed about the places codegen is required.
 $(obj)/exports_helpers_generated.h: $(obj)/helpers/helpers.o FORCE
@@ -587,6 +589,9 @@ $(obj)/exports_bindings_generated.h: $(obj)/bindings.o FORCE
 $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 	$(call if_changed,exports)
 
+$(obj)/exports_uapi_generated.h: $(obj)/uapi.o FORCE
+	$(call if_changed,exports)
+
 quiet_cmd_rustc_procmacrolibrary = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) PL $@
       cmd_rustc_procmacrolibrary = \
 	$(rustc_target_envs) \
diff --git a/rust/exports.c b/rust/exports.c
index 1b52460b0f4e..434f0b73151f 100644
--- a/rust/exports.c
+++ b/rust/exports.c
@@ -17,6 +17,7 @@
 
 #include "exports_core_generated.h"
 #include "exports_bindings_generated.h"
+#include "exports_uapi_generated.h"
 #include "exports_kernel_generated.h"
 
 #ifndef CONFIG_RUST_INLINE_HELPERS

base-commit: b705c185105762676aa6ec16cf976101df87cc35
-- 
2.54.0

