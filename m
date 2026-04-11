Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80709318B96;
	Sat, 11 Apr 2026 02:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875831; cv=fail; b=Bh/PW3UajFYlIlQAsxWUk1PHlDFdlMk1pNIZKK0+XZ1kEjT0ZpLXxEsIP/kyg6wqdXCVRIt/Gwawvn7PLm1ArC2le2LiEwV8u6EzyC/IjwpcRPCsbbm2CTQ0PSfY0pxY7X/2/YEauLjpA3kjCag74qCedbxyXYYrSLBT3GUiPWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875831; c=relaxed/simple;
	bh=eExHSZ09+UezG5/B0JRyWYIhSLmHn/qPNK5TzBG+BDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dAHDJ2OFd13M7Ja1AU/wA6+sKOcQiLjql1e5mQnjdj+sOXVxx1v+lynZWS7SJd5buJnhYZX4mP5a/mLVzyjPiPhLMqPFDxAqhrVR1IDNRmitPVHCesRQOWXDIMjzgWgJ8jFD5JOIK+gYJdT+hah97Hbr1mrj2TIwSBf/7FCTHpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AeEgug8D; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AeEgug8D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPbKZfX0Hi3IQR3fxFSgtposdcjPnANYEhZvL3mWfV4okhK3n8EgijNFtKvzm9fjD5tlh0r08V9O//Y1TxaoZvGAkf3THp5TC2oIPIMbfmktcjJGGWSFVh8V2ot1TydWFTBhxPMRb7NDC+gqJ6FhjyXhpjsqiTrSiKfcj+697E7u6NDbr7ldbl+0T07MFT4oSnB+nks+YctEtmIAB6Y6XJF/JrJ9mlT7JCIyqZK7GVPmiGM+nvjtJO4Y3/oFPkTuvKq7+unvIlzEx3QaBRKjPKO1Xy6ysFcGNhPiMdKrMzFlm0xppSyex5I4az2btidy5u1BP4Kb68739gD6avuL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tw0jDjD+hFURQC2t3mXpB0wgfT2ULLu9E9HSdmZxZtE=;
 b=jXfsDYJ3XJzFCGubIGBptz4XYWnQ+a6RTTkNB/vvkXQl3bQuzXfA7NdKeHM3Fof+B3QWtMcb7kIC8gwlTExKACpDEm1jrZk5nP6dcXo0QlMU3rojuxHGeuX9mg/WgmDVrDmnBzKU6UQf4p1KGsi8cEdluTeNwaiWsJYLP9VjHupuPsC2VtciWaCpHRcwSXQikRK1jqwILcYvpq6dEJE+kXE3ZGKBEznp9q8HV6NYtdro9f29gvkHetoAzDj763dO0S59LuGa6UVdiJSF/sDQf2QNF/+Kvqe8QdasAJ0kEPpFDc7E3kEduk61OQYLQZ7DKR/uz+FLkZgih9LMjajPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tw0jDjD+hFURQC2t3mXpB0wgfT2ULLu9E9HSdmZxZtE=;
 b=AeEgug8DnnQ1oseqDfQ0kW5UeWNRFnCy71hgtEPinaytLh/Ydm73LwJ9sQoTLBECZVGHWZICksptl7e5Jm7vvxcLAE9/ojFCY10CrBimrm5D47B4ZDhwkQaznTVFAH9HmmcxUkmo1earNc7WaWzbpHi+VBrLH9JJ0YryPL2cS99M1tg4VViXqjZVd6Hwzf6Df/CYL80DreB6X0zohl0/mBSxVCPpm7QCroA21L4zhA92zw02AnrU3gpSFFnlFKdI8CAEM5No6sHrRHpW+ZJbALPq9MutnmwgFddePkV2jO7dayyjqPSCXT1rlAhaDuLSuRUynH6cnL2HMckbwq10AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:20 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v10 19/28] gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
Date: Fri, 10 Apr 2026 19:49:44 -0700
Message-ID: <20260411024953.473149-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: abec9646-58d7-4c26-cf78-08de97751237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	QmRtapJGBmFFo+/swIzclz9MXaC0bO/LfSoB6nad8N7NwK5bRnzW1cbDiqw25JKYsO3Kp8/3vZHFQP303z/NG4r+G4fJBoadbVxX6BxN9XrMwr+UkrOHjAKDF/ZLzhsImoLgcMO5/kdHTb9Fiqa5yeOEe7rvdXhRGHnekYEEQzh4PhMOPFH8AoGdWgRs1PCwfeTPSSUhXC/+CfZPUU7Fb1qzMt0RCcPxC6P+RiyDyEF7v/rP/EC7AjTUwm8FX28YyiQjVf+GcPQiDe5lqPYPYClkcT2bZJIFORcXnsx/ZUPF3LBA3pKwSCAAAjE/F75srlv80bRcaMlxwphg/MrVsi2OQtPHLwvjYJ4Nk5q1C8CfhVxDR7vyvTlgxfNiQIDxIgXH0vo6LYh7xfV0QjS59WNtrsyP99DhPWbX+1YtgTIOxH1v5rX4pxTRpxp5BgcrzEa82QnQ0W2CJ2uONHqoD4kFw2BMhFPKWzkPWF0FV9rlhPWsRKBPPPkeCVYFxQdd2zIZVYEvm2Q6nYmz5o3iNoJmzad5C+E4zX8RHn5fNY0f+Baw8NcwuStAHzvzm6dDBwStZvO+dddIWJ4oyrPQqNfDHvVUuPX7M+u0fVTsFmiTRmP4f+LNJ9qJ62B5UaBHvNYUimrzCD+/Axsez3E1ScQe09AzzKpRkNMaBy1rs21nJ/t1ALxmat5aEBwcUElwfwbqevcgyYKFbRZheLBug2RruCECRD2YbtCpLjgPX7w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TZ9cgnElLoYWzqNpgwxa9uyH6YC3kQubMJPFj0AdynfpzHUTCKl7Uo2X0lbO?=
 =?us-ascii?Q?/tEv5Es/w3gRJsAPbRIzl5wLSWD9/cz/7rvL8nf1ki9xqTZI/TdYKccZgwnf?=
 =?us-ascii?Q?mSOASbWTjR/RNGGJ4CmparRE0ezUPWzsmcj2vlfHn/K3HnBd6IfI5pGg5Jbh?=
 =?us-ascii?Q?JJY87P/9zdRpgmtQi8TEBersHD4VXJeLPmsHl8hLZcn2rGjPcOnVo3rioACO?=
 =?us-ascii?Q?LdCMgJOdMUaont58+y+HE3XWPnMBGeDE7nlXDAgL0g1/2AX/QLEttWaSXXH+?=
 =?us-ascii?Q?6U4TKBHFuruD/HPkjv8aXYYzhrnKf9HN6x7mYT00QdkYgbnAansjy/C0qWIe?=
 =?us-ascii?Q?EF3nV0IWxrP+BST0sUO1M2Tl8orSNrJv0ZyE7U1CczYrSP+svIeQb+X6dUYU?=
 =?us-ascii?Q?ishgrAqFZWQJNFJdnGtriEjAuMR7bGjigOrswJL3MDSVfU8C0qpkccq4Zcwx?=
 =?us-ascii?Q?XFbf3/fRkVeuB4+BQRVJQ1tEkPxppi0qBKPuepgAUdnS8qk1EtmDdLQojNcq?=
 =?us-ascii?Q?toWqn5nDXp8dSIpzg2+31oCAcHQSZMzNfOHtig7Xh8MkkXWv2Jaj0fqGrrCc?=
 =?us-ascii?Q?exs47n3yNZ3xRy0wN8VgEpOEogxGzE7XrkrMV88Vw0kzjJPNMX1C/X9cSL92?=
 =?us-ascii?Q?Syn/0jOF6z5UHHBVqtX+tufUiSQukCbQlTBrUt/pi/hrvsIkOJ6aK9ovkGDP?=
 =?us-ascii?Q?HAOXfuwAJSn9ixlDWNzX8++WdQiGCZPPzIb71M4aE4aKBgwQNiwoL12dCl6r?=
 =?us-ascii?Q?LKFS03l6H0Q3wlH3omGyrr4TcGcPwrOJQ29wB27/Mvs313w+mS927UQMh8Hx?=
 =?us-ascii?Q?13Zj+Ox8dbQ45bjhtOOOxMBoacm+KcOAa5JZxk9vgIfNt37yG71emedH/XD0?=
 =?us-ascii?Q?vj/72QjhNHRKumJr4nKKEUoCaFQo0/kn5zlyDg0JEas8C94CGf9GnkcIOaki?=
 =?us-ascii?Q?20AOcEAO4Q6AtyfcBm/jzi6UdbSuzuhEdxGiv5K8PonbKk1lkLITiFA9Yzsm?=
 =?us-ascii?Q?0PW+cXE1fQzuDLNMXhMTeEvFsWXQBGDMwdjAY4W65wCrgDrxANna8nryJFgB?=
 =?us-ascii?Q?co3bszYG5SJ8edAobUy7lRusiAtm1eo3xG+bovMYT8cySMur9z1yR03lfJ/W?=
 =?us-ascii?Q?AvKYRoyI/ywseDFj3/595Qz+kE85RgJ5aNtcmsxI2ZGhFU1Fuv/kC5cDQM0B?=
 =?us-ascii?Q?gA/s8XUd5WYMTMR+P7J4J1rVJd3Ny8iH5ZUEe9Xtu9TQnvx18jIBovPAMUyp?=
 =?us-ascii?Q?ljaGr5nn3GaspNBJ4GDlWKXOSD/FChjF/H5w+DbZOcUaVnn5h29TURWvqZPv?=
 =?us-ascii?Q?cNIim7zhgbrasVo9l1PdTGI3qdN3BcYrQwOHzcK+Vz5PcYE1t8K0nyqDLmIN?=
 =?us-ascii?Q?YyPlB0Z/j7soUMjtmme8IciiUFwWApB7tdIHaUL6iMUlJvTQQ8ooBHfxxr/L?=
 =?us-ascii?Q?gpQv6ZiA8gqYC6sPjw+OVy/kHtYF73JvvfYYXCl5t/HjAF2o6/5zsJAWQnZJ?=
 =?us-ascii?Q?UJhJZ5VrGZBJN7M/scwJY/LDbsvi6vWI7MGCTl4yYm39+Fze8AqqfqwPdy9L?=
 =?us-ascii?Q?99WcPdY8QQoV2fZdZF6XitIuFVXgNM3j83SCBgtBArWEf38gJUITu55RLlyM?=
 =?us-ascii?Q?cPNVmqRyIX9KwTz1gbxCpoHfLEeuBktaJ1mxXiS1hbJTf0XgV0AQHxbw2/h1?=
 =?us-ascii?Q?cOWQaPRDXvRULj9k13MX4kW3UhyhrDXqUtpQM4r2A7iKSVc2WzxyoNWXFnBF?=
 =?us-ascii?Q?OW8dD0l2Yw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abec9646-58d7-4c26-cf78-08de97751237
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:20.7356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXCjS38hxks9l+kUuxGNhBhKe7RK+qnq+XkoSnmP3Pi2x+24e7tuREEi3NWIH/xCo+n6AdOSdfYYxDZAyNMbGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 149 +++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       |  16 +++
 2 files changed, 160 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 57817a594631..27344da6680c 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -5,12 +5,29 @@
 //! The FSP falcon handles secure boot and Chain of Trust operations
 //! on Hopper and Blackwell architectures, replacing SEC2's role.
 
-use kernel::io::register::RegisterBase;
+use kernel::{
+    io::{
+        register::{
+            RegisterBase,
+            WithBase, //
+        },
+        Io,
+        IoCapable, //
+    },
+    num::Bounded,
+    prelude::*,
+    ptr::Alignment, //
+};
 
-use crate::falcon::{
-    FalconEngine,
-    PFalcon2Base,
-    PFalconBase, //
+use crate::{
+    driver::Bar0,
+    falcon::{
+        Falcon,
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs,
 };
 
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
@@ -25,3 +42,125 @@ impl RegisterBase<PFalcon2Base> for Fsp {
 }
 
 impl FalconEngine for Fsp {}
+
+/// Maximum addressable EMEM size, derived from the 24-bit offset field
+/// in NV_PFALCON_FALCON_EMEM_CTL.
+const EMEM_MAX_SIZE: Alignment = Alignment::new::<{ 1 << 24 }>();
+
+/// I/O backend for the FSP falcon's external memory (EMEM).
+///
+/// Each 32-bit access programs a byte offset via the EMEM_CTL register,
+/// then reads or writes through the EMEM_DATA register.
+struct Emem<'a> {
+    bar: &'a Bar0,
+}
+
+impl<'a> Emem<'a> {
+    fn new(bar: &'a Bar0) -> Self {
+        Self { bar }
+    }
+}
+
+impl IoCapable<u32> for Emem<'_> {
+    unsafe fn io_read(&self, address: usize) -> u32 {
+        // PANIC: Per the `io_read` SAFETY comment, `address` is within the I/O bounds of `Self` and
+        // thus less than `EMEM_MAX_SIZE`, meaning the `else` block is never taken.
+        let Some(offset) =
+            Bounded::<usize, { EMEM_MAX_SIZE.log2() }>::try_new(address).map(Bounded::cast::<u32>)
+        else {
+            unreachable!()
+        };
+
+        self.bar.write(
+            WithBase::of::<Fsp>(),
+            regs::NV_PFALCON_FALCON_EMEM_CTL::zeroed()
+                .with_rd_mode(true)
+                .with_offset(offset),
+        );
+
+        self.bar
+            .read(regs::NV_PFALCON_FALCON_EMEM_DATA::of::<Fsp>())
+            .data()
+    }
+
+    unsafe fn io_write(&self, value: u32, address: usize) {
+        // PANIC: Per the `io_write` SAFETY comment, `address` is within the I/O bounds of `Self` and
+        // thus less than `EMEM_MAX_SIZE`, meaning the `else` block is never taken.
+        let Some(offset) =
+            Bounded::<usize, { EMEM_MAX_SIZE.log2() }>::try_new(address).map(Bounded::cast::<u32>)
+        else {
+            unreachable!()
+        };
+
+        self.bar.write(
+            WithBase::of::<Fsp>(),
+            regs::NV_PFALCON_FALCON_EMEM_CTL::zeroed()
+                .with_wr_mode(true)
+                .with_offset(offset),
+        );
+
+        self.bar.write(
+            WithBase::of::<Fsp>(),
+            regs::NV_PFALCON_FALCON_EMEM_DATA::zeroed().with_data(value),
+        );
+    }
+}
+
+impl Io for Emem<'_> {
+    fn addr(&self) -> usize {
+        0
+    }
+
+    fn maxsize(&self) -> usize {
+        EMEM_MAX_SIZE.as_usize()
+    }
+}
+
+impl Falcon<Fsp> {
+    /// Returns an EMEM I/O accessor for this FSP falcon.
+    fn emem<'a>(&self, bar: &'a Bar0) -> Emem<'a> {
+        Emem::new(bar)
+    }
+
+    /// Writes `data` to FSP external memory at byte `offset`.
+    ///
+    /// Data is interpreted as little-endian 32-bit words.
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(dead_code)]
+    fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let emem = self.emem(bar);
+        let mut off = offset as usize;
+        for chunk in data.chunks_exact(4) {
+            let word = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
+            emem.try_write32(word, off)?;
+            off += 4;
+        }
+
+        Ok(())
+    }
+
+    /// Reads FSP external memory at byte `offset` into `data`.
+    ///
+    /// Data is stored as little-endian 32-bit words.
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(dead_code)]
+    fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let emem = self.emem(bar);
+        let mut off = offset as usize;
+        for chunk in data.chunks_exact_mut(4) {
+            let word = emem.try_read32(off)?;
+            chunk.copy_from_slice(&word.to_le_bytes());
+            off += 4;
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index e4de7bfffde1..5ba6c2aedd7e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -425,6 +425,22 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     pub(crate) NV_PFALCON_FBIF_CTL(u32) @ PFalconBase + 0x00000624 {
         7:7     allow_phys_no_ctx => bool;
     }
+
+    // Falcon EMEM PIO registers (used by FSP on Hopper/Blackwell).
+    // These provide the falcon external memory communication interface.
+    pub(crate) NV_PFALCON_FALCON_EMEM_CTL(u32) @ PFalconBase + 0x00000ac0 {
+        /// EMEM byte offset (must be 4-byte aligned)
+        23:0    offset;
+        /// Write mode
+        24:24   wr_mode => bool;
+        /// Read mode
+        25:25   rd_mode => bool;
+    }
+
+    pub(crate) NV_PFALCON_FALCON_EMEM_DATA(u32) @ PFalconBase + 0x00000ac4 {
+        /// EMEM data register
+        31:0    data => u32;
+    }
 }
 
 impl NV_PFALCON_FALCON_DMACTL {
-- 
2.53.0

