Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAD52ECE9D;
	Tue, 10 Feb 2026 02:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691597; cv=fail; b=mpgeY7r0+KTXKkuzMghZorNbJiulcXWNb5eg4nCTK/8goLCso3IsqzwLFGm9tiqkb7eRfuCGKyuKFVFSNZ5/LPqpePRpzVumS/voxAYVwtqX68tGIRPVP2mY+Yn2YxOa2G9i4m6hBcG7fAwHkx2NEeAPLEnTEVvQP1FYBmbXSXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691597; c=relaxed/simple;
	bh=CWV/yeH8gI6J+X4Q2o0yJwKCy+4N19FAXVbOnMOgSjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JV3j6S4tW0URb/Vw0KfZFX8UBSZMT+Odhc2E54/tlOw22kCBaFIHf65F2kcdkB0Nppsb6qWRual5mBG+LsjDK1B2i+5KLdWfidZouR74hqk56q7Q7rwbwHmBY6YTFmfJn74GmSh7hA4sNYJyVC7nC4rRNAzPAFT9xTrQ9dmO6wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k0THug/0; arc=fail smtp.client-ip=52.101.85.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k0THug/0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxaO1A0+iWQn/kzBvzWsdXDKKlAaTO4c0qsEDZlhc6llzeKEx/3FoymlD0b25sbKHfffVXRpkQM8t+qf15z9ecXBYSrCgXrgg1CRbsV9/MLdfQ/ZxTni+2zCf5Q70120XhDleNVBp/z80RXwc6ATRR8NlcJw5vDNe3gomm0m1T/z6xbs24oRi1+6nq19tdmbuaix39Ps+sTyDIAIkxkOAE6HZxV6g4bVCUpJxyLDhaL4Xxfm66NjcVJ6D37lVyz7Pay1ZP2S1JhCEpzVpRwpRVITvjK+XZgAK1S0t0U3K6QNh6EfBHoKW9GaMx3qdC5Mb53Q3cg1814F1ksJWyMMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjAi3+G/SFKfernVHDSlcL62HXndpVDdl0C+niOcSnM=;
 b=COnVcX63zf/GU+itGUg9NpzymfCIGU1PXUmD0ICZE/4VtjL9OHasx1Y9QFRAKyIOsMgKi8psWfTVqmQkxC2SZky+kB0CQqLL3qxzhW4xbdTVS1v8YvViJ2VNlsXHnNJvuIqu28jHeNCMHWfmHMDeKJ/xNtKPYlsHlyOrYiyC/DBG7uAiuuidhj938GAdhrZJT3E9/BnnE4dFHo4rdOWOIp5HVfGAwe6RGoiNPCdHgiskgTNqGf2QI+jWSk+kfdTWku4K+OZuWyELn/WKa11ojq46Jms/tHBreDdOZQaNGkzq72iDNZ6k1dJXqTh7JQHpXialiiE1GBlQEKu4EBpowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjAi3+G/SFKfernVHDSlcL62HXndpVDdl0C+niOcSnM=;
 b=k0THug/0PJUzJV+BKSI/KTw0Go90gzRX2qwgYskl7aGzkcn4OsR0B3oBsnxmTyxfPIbXZKjPx1OB+NAHiMe+tVC6ChScrtFK7466vcGOXJJ5q1hkhD/Myk2qwB6GOsJ6GRoUfBvvpjT8EY9ZJxeujI9NQ7jtr/uPpEk6UNI6eJ7d+s//pM5ButVioDbqQoRdfQByUjkMHDSa+koZZO1cBtXqtGhMWNnj4fzq78Xux68Z8cD4mDZq7KRKTVk/7zuvu3AiKtFvYw1LHWNXN6DDoPbsGXVRn6yvgf+/zJkVG6fpYDnE+SbRtHBTeQ/OyiytXOQmZV5Etzsst0PToxrqNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:19 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v4 13/33] gpu: nova-core: add support for 32-bit firmware images
Date: Mon,  9 Feb 2026 18:45:40 -0800
Message-ID: <20260210024601.593248-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::41) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c478514-d943-428a-78ea-08de684e9183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4kYRsmkWjnzw1BtHxpXSYqBK9E1KM9e69FUm+z1CQZtSZV7u1ztGKJuyvZ05?=
 =?us-ascii?Q?zLfeD7NvTevp5C3UUdYSEaNU3pQvOJfezcL7ofVHotp3LAjmqqdFWJlPsw6H?=
 =?us-ascii?Q?pTJ6c8xOxI9EnF735iY6yd5GFTZZ3YWOdXf8SzZE775UkVT38OEJSiUDI7bj?=
 =?us-ascii?Q?NaK7AXXEnIF0qOaLM43NwNA0wMytzQ2mIJzen5wBEyzi4UBco/3xdMQtKFbK?=
 =?us-ascii?Q?EpfjDKuA1/iTAFnwB9t8CceIb9KlHvW3hcqb8cGaMENYmXXJ8s8NAeICnReS?=
 =?us-ascii?Q?dk8aDqQbKBmMI8ncrxj5DxGK4m3mkZd2DtoXIW+RNSO6Aupicn5eubwBpYde?=
 =?us-ascii?Q?AxN2uOgMnaEKXtLthEwEnRPObxpf4KPGz3QLUq4YqTjFPWgIWjlmn6TAynSp?=
 =?us-ascii?Q?+iflZn9crJRH6eK85shOsuaSLIcni7vU/FGLfd+Fd5BjXiJSGwbU+iXP+aUD?=
 =?us-ascii?Q?h7mkK2g8Yewxa7gKq7m02uMx/SLQo0LAJgFP8KDOTphpyvnQ00PlknpZ46MD?=
 =?us-ascii?Q?JCBIG4HtdkCR+qXU0Eci8kaBdMW1oXSIScNQ6oUZsVvf0uWOFOmvrzn+6Ge0?=
 =?us-ascii?Q?NXjvFXa1DlDUm/X51859tukyN9cPhdEC0LCNjHRrcKXfRZnOdMYAtTHwdfl/?=
 =?us-ascii?Q?gMSuwcIgxv8mGQtt7Li4ilU4Me/b3RpPu4ru2o3yA/z+ZWbCnHIuyXjbwo4o?=
 =?us-ascii?Q?qClCWBbfYhcOU7ADfVxsunvXwld87iYCI7HDwTRt6lLDG+6rlH0nLhepsP50?=
 =?us-ascii?Q?CsK0owmabLNTJ1ganmDMmxMxv/SC//jbX1RgOsekIbfR3j2Ie8dBpWIh8moa?=
 =?us-ascii?Q?C9kITZu3XcjibMGJNe7A25QoOawAyzEBFiBfHB666gR7XLWSp0E8L4TZB82f?=
 =?us-ascii?Q?Elb8/pB5opCO1NEfHQPsMbjfars7zjuLLC95zfjkV9fxbXKl6vRe/aAkOWtE?=
 =?us-ascii?Q?y1EJMs3a580fa3kKMF35tuavF6sHbpQdSTQ9UYJX+/tp5jXMp/kjmtxRksW1?=
 =?us-ascii?Q?K06xLRxuaH+lWl21X0h8avmckFh0+nDi1UUGf7qQH6Po23j/Y9RhbMcyHiSn?=
 =?us-ascii?Q?VmFM/vIZlSw0s71Tl2tVRaVRw1ZNo4n6DZNJAxSo8pVtZVdv5LB1LyIkcsWS?=
 =?us-ascii?Q?ZKNK5rmYZyel3p6qzxwc1lZ2aVN3n8mzwUaHYCVS71/jzAZtCyJOefXWYNfH?=
 =?us-ascii?Q?JFEYXSpDDkHoDuW+53rX+1V/ExZpmXU3kgyuU9GpytjHTtbRpJehlD9QXdI3?=
 =?us-ascii?Q?Ra1eUmZJTsxU2qYZL/k0OosX2oyPXB4xpX5WXGqCFefJ2QZ18YPixsYpA0MX?=
 =?us-ascii?Q?cHYS1IlFTVSxPDWgfS4KE0Po2+ZsTySPws2gWqXYVnXaaZUihoF9XxTfn8O3?=
 =?us-ascii?Q?6vuCv3uJI+X9wtmBCRjqh6eA08uyhkI2ipt91aiWpJ/tV4R9kG9KWZAesipl?=
 =?us-ascii?Q?Da1KIy1jWEs1729SHhogIF+Y7V+ldEnsyqnjVmSiKg0NH/bNZbfzyroCiMe6?=
 =?us-ascii?Q?iFVzFtJxka3eZV+iBy76DxdttyoCl5Dlx/2DYiZ2qaCCaNHsPucJniPVoaii?=
 =?us-ascii?Q?EU/jT4MBioy1MxYcJb0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Gru6ko043uvvPNrZjVKMh1GbQPQgAQR9/XNobJZRqx9DKS8GMiLunz5ul+7?=
 =?us-ascii?Q?06LAPsVbvvsispqZyg/djLmK0VnFf9uMte6TshG9YN6XoH1poT+gYg6Eoyz5?=
 =?us-ascii?Q?zipzNBh34Wc5S84yEQ2zEvIbC1GIzKOx9ym1T8Hc537A0/bgJYb+dLqI6Kmp?=
 =?us-ascii?Q?0VgviNclx928f3kstdyjKLTczdKPsAJeKO+QoI1Nu9jpTSW7s2agMNAu2856?=
 =?us-ascii?Q?s6gq/COGHjlcDbhlFxr2FkglWmXcO0d7MLQHgiFNkP8E6iYacrFbZKIXPFCN?=
 =?us-ascii?Q?X617n70xeVDWSYYOYtsZ/WWweLuiVk2OkPRkEbZlqU3SafU1n0vkn8qy/Axu?=
 =?us-ascii?Q?WdeSu1puAOj9jxXZ3JU+95pRISGmOuOiDw5oZWg5DXdvrclAUrTwTcRNPRDo?=
 =?us-ascii?Q?HZpGh5smbQTyzEPJ5ZF4Efg0VuF7JhuZHkPdkblmYiTglZjg4ysY2fWOTWzR?=
 =?us-ascii?Q?T11RMdNLZWZwORgNOznwcr7jWod6PkT3xlJLIDl+ReTTQY4ilOW8e5w2thy2?=
 =?us-ascii?Q?G2oH6OFT3ph47C0V2aYf+SO2ATnLFqLiXsArgVHednHrJz0o2vN1O6UIL9cw?=
 =?us-ascii?Q?C5Jv3QEv2Z0qZa67q/C4iALBHIUFRLjPlpC4OLYwBMbXbfKGt3nIMd0zgi+p?=
 =?us-ascii?Q?ZT2pmKNQiIOBo3sTqZ9j/U052vrQxNQTqWdHei9ZefF3+X9qvhGJogeErUfr?=
 =?us-ascii?Q?nID2EOajtRe8b9pkDJNGqKtTwSMbIMhjVlQtkGdOahiwaCXPR2KTuLgfZbdi?=
 =?us-ascii?Q?MlPcBpGmoiregMzQqGQU9YmzY4072yeKrbsecvQJnuvAlLNO8ExwmrKYnNTA?=
 =?us-ascii?Q?RCVW58naMsq09Qb7Eq+SUoHMdbuhY0HBuocBugu+xuzoXX7E8dnzjYS9qF4N?=
 =?us-ascii?Q?FjqKMCsW78G8U81uDSz5LyuVJZeKzNYijY+AfiknggHSzv7Rk4EVOijHZcBP?=
 =?us-ascii?Q?0TY6W6WFgprZh6vInAAceWwTootIdoeixEAPb5A2fUpKpFsNGkj3Sfjxw6nH?=
 =?us-ascii?Q?rxRj2OF7Tq2FngM5JFT5BdGLC4toCyQZDgDjjcilOub/XqMtFetHM1FSQAMh?=
 =?us-ascii?Q?LEy8PcDDGXXxjMRyuQ1YDJPFgsNs/0On47utcOBynXR7tUQd7SAlPecqBETT?=
 =?us-ascii?Q?cC13N7dFmbXcsnOOZRSMl2GVAB3aRzqzaQUNCxzrqm++Y9mAeAbmLmsgXukh?=
 =?us-ascii?Q?UNSk0Q9hVfg/PeIueXytnjJQpC+cBPkORJP2ytD+eQpnXZpDJSUcUZs/sFRb?=
 =?us-ascii?Q?Cp2gRAlAwovRLv/bdxOSxvOzWj1LEkmfybzl3qbzyTIBmgX9tFMWvO0AV1OT?=
 =?us-ascii?Q?ISwM5rB9Ww9Zu9x29JIMlZhp2k0QmGSFziEoHlMmYiMbK8USnD+BNmix5LCO?=
 =?us-ascii?Q?oQa4BFmHLd3wJM/GjlW3YlDlzkOIGlRX7Jljd++1USjh0uVHOJerPgFT8+xa?=
 =?us-ascii?Q?nCOLTmfA3+HybX9zLGxTS0F2FmqpRrgfLSvtmnkj7zYGMnUstsfGDdlOEPHy?=
 =?us-ascii?Q?SgMjG2Jgck0OWU3OEhiEnyLoE8b0y6q5QFCAYG3jRyQ5bdYqFenwvKZ8FyaI?=
 =?us-ascii?Q?BsNHG3SW+eAplhmj4cj4yzoW2SZZXO2Qr1K5ZWB9V4qvbbSI7H5Fn2yhM9JO?=
 =?us-ascii?Q?eAFl3NtIKely8pxh4OTPZsialO8hB6wrxEfetQ3C4Pj/B9e3GySaG7IvEkQt?=
 =?us-ascii?Q?5kbeJiWNMnUDqCTCjEZpqDYcCpmOUC/7yV6G6Gpf0/tbDgkSK15OJsGmKJPo?=
 =?us-ascii?Q?APYJaHTbRQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c478514-d943-428a-78ea-08de684e9183
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:19.2727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlgGDXP1FpuRpA3wxrDqm/ADjviilt0HJxYZw+8xz10RF2+e/gTL8WvCvu/VhUlFE2OZnv6GKPyTwzvoPxyMpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Add Elf32Hdr and Elf32SHdr newtypes, implement the ElfHeader and
ElfSectionHeader traits for them, and add elf32_section().

This mirrors the existing ELF64 support, using the same generic
infrastructure.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 46 +++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6ed76a7e15f1..5f3f878eef71 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -507,6 +507,46 @@ fn size(&self) -> u64 {
         }
     }
 
+    /// Newtype to provide [`FromBytes`] and [`ElfHeader`] implementations for ELF32.
+    #[repr(transparent)]
+    struct Elf32Hdr(bindings::elf32_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf32Hdr {}
+
+    impl ElfHeader for Elf32Hdr {
+        fn shnum(&self) -> u16 {
+            self.0.e_shnum
+        }
+
+        fn shoff(&self) -> u64 {
+            u64::from(self.0.e_shoff)
+        }
+
+        fn shstrndx(&self) -> u16 {
+            self.0.e_shstrndx
+        }
+    }
+
+    /// Newtype to provide [`FromBytes`] and [`ElfSectionHeader`] implementations for ELF32.
+    #[repr(transparent)]
+    struct Elf32SHdr(bindings::elf32_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf32SHdr {}
+
+    impl ElfSectionHeader for Elf32SHdr {
+        fn name(&self) -> u32 {
+            self.0.sh_name
+        }
+
+        fn offset(&self) -> u64 {
+            u64::from(self.0.sh_offset)
+        }
+
+        fn size(&self) -> u64 {
+            u64::from(self.0.sh_size)
+        }
+    }
+
     /// Returns a NULL-terminated string from the ELF image at `offset`.
     fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         let idx = usize::try_from(offset).ok()?;
@@ -559,4 +599,10 @@ fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
     pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
     }
+
+    /// Extract section with name `name` from the ELF32 image `elf`.
+    #[expect(dead_code)]
+    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf32Hdr, Elf32SHdr>(elf, name)
+    }
 }
-- 
2.53.0

