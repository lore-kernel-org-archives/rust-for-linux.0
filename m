Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60C93C0C;
	Sat, 21 Feb 2026 02:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639804; cv=fail; b=IQyzBjhhEMO3rt+VN8B7suFrJP6zDWnEVNGElkjBbrQtfQCgGJtgLI0haJkYdpGzCkrTViHZ6Z/rTFmqHg80V2VLHsQHgt+CV7+L8N+X13UyqcuSz+pAIGtDtoPNpiQHK5jwkfnUrngjj3kWezbEc7pMevo2COUfw+g5RIjM2sA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639804; c=relaxed/simple;
	bh=dZ4/42aG0PqFp2ruVGlmRNMJVE0HJHef582pEmA+xg8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iNv7xlQQiwDcGoWSgUXAG2jCaU5AGabKRxQWo7ajicWcDNmFcj0n23E2LkjTv1otAn2t3lDp5ixw16tKL2HqFmvR7l4IW3G35w1bSyOp+EUHxIBqfUMWPadq2rO7+wmWFWMcYI035XEpw4dqe4vu5K0PID16Sl8923zEw/QHRLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FdPfSZdF; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FdPfSZdF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jU7RfC3Wz53nouil/5RlLUm9kOyhsBide4mJVEJJaGz806+jvOLEiaLSIsBbaje3h8jYjUj+3BMKHo/ugbaaQAC3XgUnpSzvOKossyW8/04RGzjLo8caRLYjof2DDvCQiFODOvm3ZBdz1P8VOloNd4dxWvdlxwDH0/YzN0WWwiZaVDQJenNlRsI5urUmiHNtPEnziEy2o6cfC38dZOsr2webwFlkaWBDhJnTd/Pxpp9Ch/T/96KwWpAMi2NyXWSdjean+Zg/QgHKpID637chbMf4FWo8pMY00bL9ppKWrpsI4RP2ErCvLSJCRgvpTkp4e3TFmt0SMNgHemMtn8qN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyqHx2CXJmDtrItGVMojDlT+LymI1WFYxXxxOm8bkhQ=;
 b=Q0dAcQbsj+9p9rnUgMPg/pC82X72b6A9f8GRLSTntt7EPPqRYMag5fP3RX02yPeBficE7LEHgNnsaJERlKw/+aOYcBRPwoG2Yfe/egMIst4rWu7BzKnb/uIc0oenY/XuMQ5M9ytBbZW7LoLs9sqP2YstYaLGk1G0h7tqFFdT8YFnz7+5WVNUFM7sjirIvYpaeY9OKyOWBUpwj8AJ50YUcYEj/2vEQGMQWDtRrjTOzgaKxSFZAmShwu3Re3h0/CeJFX8nPWbXzsF7qHP16n+rLeGGedFNGoEtcxvN2U/tmeFpVJSlqjj3MScGEHbU5T/9kedyaQAdX9yhfDqjOqSpBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyqHx2CXJmDtrItGVMojDlT+LymI1WFYxXxxOm8bkhQ=;
 b=FdPfSZdFvWppFHIwIqEfo7sgs86jn8dbfcZ119xfOSbY/4fnvZBwkDpr0OaDRryuSb8tb1iiDCl/PkK73g0UrFMWlmo8Tf/7qNa2LfL57lt43uYTzo7ATmLcr35j5Kro/oOU21BAfp4jdd46AUrGC6SeiDoicJk/ltyvkn4Hsz8kFmwDqKtqtij/F9v6Cu5waSRKqOnjFGH+u6nZietn9iI+m8/ynlvzibjtsdPHFBwjlZ/AeWSbPqcnZX3cPZXCaUFMdUSTuXvdm4Ta7HJIweyFnZqQYdv+4F1FCzrYBRx6K2JiSXzPXtVB22UWyczdgq4+hF9DSZ7uJKP2m9p+/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:09:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:09:54 +0000
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
Subject: [PATCH v5 00/38] gpu: nova-core: firmware: Hopper/Blackwell support
Date: Fri, 20 Feb 2026 18:09:14 -0800
Message-ID: <20260221020952.412352-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0a6980-6477-440a-3c17-08de70ee4df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HE+PhFHYJWmUD44c0cs44II0SMXR/0CMJrUA8gLXOLd8MqWzHztg7/t2WQqr?=
 =?us-ascii?Q?jPnUKCIYdSSemeGcT85UNGoUMwimksq6k/V+Gpy+8kT2Gua/kt+D78K8pV5x?=
 =?us-ascii?Q?GaKWS+WIugVsBDB0t1b54afAsHfXj+ZMyTPeDD4Jn4JUE6V0uaJthMjRw7/P?=
 =?us-ascii?Q?jp6qwpaz7CVmuKbQdLQ90rpldBEetMQ+6RAHZ/Hvqhy/5rTFubeXXca/X1BZ?=
 =?us-ascii?Q?e/KTuDmyV5AApekCTwbjE/oW/Opj4UwXjGMqvZfGRVWT2rV3HWIZJRzX5fsQ?=
 =?us-ascii?Q?BwERJuSRZecZuQhTvwj7W1oBoQYSuO4l6IijlZcOPZaPnsPCOkys64Ag3tbo?=
 =?us-ascii?Q?PvdQBgPR2oeOM3tRn9tCatUMwP+FwbQbOHTlRncj9DYZ6EYt+fKGBXHblTOH?=
 =?us-ascii?Q?jmnVZ3TUZNKLwAqa1CyUKejUzaqOYG95iC+rhtTmxBrVuG1yxnA+onHJ5y/W?=
 =?us-ascii?Q?JA9Bftbj0hXjGt/P/seal09nly2ItGUMRycdAexw0KSVFV/LsQEqStDo68gO?=
 =?us-ascii?Q?vJeYOxdunuOe7hGxw3K4RgIoBqgyK11zoXdww81CuCJ2j3IpABPox8XkOFRR?=
 =?us-ascii?Q?IYacv2o9EmOElTQ28EIpd3k4sgVF+JVA3rWZcoJxU6cSrbK2uAEaRsyf+hDi?=
 =?us-ascii?Q?09PsZ9gDp+9aAh0caqFoDYB9j2ki6OQwVH9xAhLqUpvsttopNkSST7BN+0xY?=
 =?us-ascii?Q?0/rRAebbvkwM2peMJqX9+OgqLjVPafBr2L/c3I5/w/nrdpiQNc+KORs9Cas/?=
 =?us-ascii?Q?eC7MD6Aic2EO6Sq3Lx9GVGwXTJuaLNITJ0YnWiv5bshH1zbx00u8aobi2Cxl?=
 =?us-ascii?Q?sW1F6QGRC4phrshmS5p8AYWTWgFWAFLDFBbQc/SQl3U4aNk5tYlA0H7I3Z/P?=
 =?us-ascii?Q?2JVG7QY2cs7mJF/tN8S6q1WKIrfM+Q4zhm66Lua54susJ/OFh3INclnhsU1T?=
 =?us-ascii?Q?2B5OFekmMtxvMIuWQj20JpW3LEqJXR0CRaWXQSw6GVmGV7NYNNALLXav6Xi1?=
 =?us-ascii?Q?lhcBN399X1OvwbBe8GgYVrvJa3gV1oipsajzB22r7oCfV/GuBF2xdA2D6udD?=
 =?us-ascii?Q?HJglIOxI0jJ1rTcbTwYc9ZYy5i+pEpsbTziG+CR2ji0CEMPcvfIN96RPFnHW?=
 =?us-ascii?Q?Dw8NHa0SQdr7Wp3AKAT/9MY2bHsqTxrs8Ll+rOPEzak4IaokfLqL39qRIDWA?=
 =?us-ascii?Q?fs5ePpzbTj3vPIcSHknf0et/PcXSFWGGmveCfrQLRlDawURMOLodaP4uj9s3?=
 =?us-ascii?Q?SJYOmpDxfjMZeMzv3jj0FtRriauzzYcVfiEYMOk8wCNFBgU9f6c85N1usxkf?=
 =?us-ascii?Q?SAPK2CQEsbTSTiXFvwn8BDpDJTqXQuVGsfROJPVe6Jb/Pbr+WVeRAaBnrdvn?=
 =?us-ascii?Q?D5iW5soEI0nJnEgO66qplH0V0PsGUO/qzmG3UofNP0g0rMfCWl3Sm+cssUmQ?=
 =?us-ascii?Q?pzHn3h/4jp7OB/+Z87t5NY+XVekZ2MMFAk5xi2W/Km3z5LWpsKEmkFZxr/ik?=
 =?us-ascii?Q?M1R8OcSOTGCwe6OFWhJvACl2MywxjoqCExyGVbkWAmRWLxR+rQFo3edn4Fnl?=
 =?us-ascii?Q?aNo+6rGe7j9+zLMh/JE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0/wZZVZGYVj0wrD2snL7rurKIBtmMl+ejJDNpCiDDw38OCmDFAhXG53Kb2z6?=
 =?us-ascii?Q?Xh9LxiEl/1XHLD6Gs7LucW0AKBdtgWfOtZEdxbJmTXooOfyus6takc9O9n7k?=
 =?us-ascii?Q?3ioSyHhd+nMXsbNfsT14MsqTIZyv9+uykfCHubIOt4Imymx6fsCmhIwyhiJH?=
 =?us-ascii?Q?RpWjtHhf4Lz6RFiTbeonTCa+6tD2UTR0QcmUh6R/mKqC9vdX3DSx3PmWZ05r?=
 =?us-ascii?Q?5kyC/I7whO0up09dVnGBk/YnsrLrSIjLENhAYITd+4Ax3ZTuzCnFmmTFmM1j?=
 =?us-ascii?Q?UsT9QUaLV5ysJHWhbNMDxOiXYxZiqciVuowuFaZ0cZboKRCUcDoarfNV8ch4?=
 =?us-ascii?Q?vLad7LRBiFNQPK1mhPYsrblzQsq37fhfCVrgUgmSf+HEG2v1jNS+cvcrXupZ?=
 =?us-ascii?Q?77K6UJr1NXclK7mFOCK9GL3FicnAmqEqtNZZ1t9oPgmC0fwwsM92mCaZQVqb?=
 =?us-ascii?Q?N+NA9LPlZcLzaWlCcKtK6HCuxd0+jYOrpkgLU1K3oT2y1/ht6E6koTpYtctJ?=
 =?us-ascii?Q?w5uOZ4MRrAd7SRnH5Td0DOoyVwUm5bm2BxhyJeAguGZL5qVHLTgZy58T5p96?=
 =?us-ascii?Q?0iFfh22i6zSzEdPqw9hdY05tkM2HMsnAB4trohp1VMSCnrCUDW+Cv382+kjK?=
 =?us-ascii?Q?UMNcJ2g2yd4w+RVOXejUlTBrlQZd4xy0kTn43781oRp4ccokpo+jadfzgsDp?=
 =?us-ascii?Q?Lbz08/fvVFikLqCAzKejw3awUPOfxQC6kNHOztcG+7I68OdTGjJEOzD3V9XP?=
 =?us-ascii?Q?EoZ8A2dIxPFTNKo3N8augMK7ue4LnAy5DO92fr/adDhZDQwU6CK9NXurcd9J?=
 =?us-ascii?Q?/JIr3HqeKzwSVwr+vLCpyWBFdjEib8nwv/dSeITnh/rT4NSRLzw6vv0amULt?=
 =?us-ascii?Q?bXC6QeowTiBQHI3FLtAps91dqXah4FWcyyXF6+E21pmDQLz3OvHcfVO8f9lL?=
 =?us-ascii?Q?S8/2VYOSrYl1MinclU54m70Drxd366qcnPZ4HCWUQz73QUYXuRxCSshYwSwj?=
 =?us-ascii?Q?latB6bsPoYHgJcCzrgCnWJpcBfEfXc1Xgqjo/UagC1p62zER5PG+vtJa/Hk6?=
 =?us-ascii?Q?j6AIRmBzenOKjSjlnf6JhzxdsbXh5Palyii++eZeEpBMMaMu7qdY9TGkYC4G?=
 =?us-ascii?Q?RyBZ5GXgI0BGslFgpWg1b0kkIEItMkBJbtIWRHmx+zNSP8vNi7eNYHNngBHc?=
 =?us-ascii?Q?/fLrXqCCxve0sc6w0cXxZHkVBH7Q5ihhv2e6paNmRVmCAHttfMzeWSaWTFDi?=
 =?us-ascii?Q?udb4cLo7WgLDqdVfwVo8NBtz4FMDBqKJsJ4OFyIe1d1WbOUxpJcL95Z4Pb7O?=
 =?us-ascii?Q?KFqYDcxS3R9RAONFQSzlb8n9zzvj0dUAnVnzaDQKvQ4p78gBSlmzGB9YGbQB?=
 =?us-ascii?Q?hoObUIH67AAid/u6JYai0QbXKkyJm1cvrMdyxMNsP4fPI/JNLDZVsqrut5tO?=
 =?us-ascii?Q?v644AMAhhwPpQcbJuPWzhstaX2vOUGnEYLaLzdVId5dQHXFGQuFOppy21UMR?=
 =?us-ascii?Q?9CQPNiBXzO39Dq4/3x6GZ1bXImmfOEh2kO/ghzFAFjgRTyojosxFv0BSrR82?=
 =?us-ascii?Q?3q7FwtVMWXhlwBpAnneC0CMHUhk0AO8IE9uIX6xYeYYhm92NW0tDonAQ5NBZ?=
 =?us-ascii?Q?01iKptd/QSzLRNGybb5SwCFb/SPrfmfq4UvBpQY3iX9VzwNnOYiBaXm/GGqP?=
 =?us-ascii?Q?GwUtNFIkqRUYSXdmxQ+nR6QGEdZ/RU3MoBIOoImU+vR0q+xK39EB+Jaa9ESi?=
 =?us-ascii?Q?lsvtoJvGiw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0a6980-6477-440a-3c17-08de70ee4df0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:09:54.7138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOVNZpNQ69h2PBQ8Hk+Z1AFf+k0rOWcbutMfKtXBSj7VtQLvvwdZtSIq+OwGSUqZEiWHfSAcHD5ZECsutzWCkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

Hi,

This is based on today's linux.git. A git branch with this (plus a fix
for a CLIPPY warning on a core Rust for Linux issue which I suspect
others have already found and fixed) is here:

    https://github.com/johnhubbard/linux/tree/nova-core-blackwell-v5

This is quite a large overhaul, multiple passes to fix up a lot of
issues found during review, and then I found more while doing the fixes.

Patch 1 is going to be merged separately, but is included here in order
to allow people to apply the series.

Patch 2 is going to come from Gary Guo, not here, but is included for
the same reason.

The last two patches, 37 and 38, do not need to be part of this series,
but are best applied *after* the series, in order to catch all the
cases.

There are a also a few rust/ patches that might need/want to get merged
separately.

It's been tested on Ampere and Blackwell, one each:

    NovaCore 0000:e1:00.0: GPU name: NVIDIA RTX A4000
    NovaCore 0000:01:00.0: GPU name: NVIDIA RTX PRO 6000 Blackwell Max-Q
    Workstation Edition

Changes in v5 (in highly condensed and summarized form):

* Rebased onto linux.git master.

* Split MCTP protocol into its own module and file.

* Many Rust-based improvements: more use of types, especially. Also
  used Result and Option more.

* Lots of cleanup of comments and print output and error handling.

* Added const_align_up() to rust/ and used it in nova-core. This
  required enabling a Rust feature: inline_const, as recommended by
  Miguel Ojeda.

* Refactoring various things, such as Gpu::new() to own Spec creation,
  and several more such things.

* Fixed three Delta::ZERO busy-polls (patches 21, 24, 31) to use
  non-zero sleep intervals (after just realizing that it was a bad
  choice to have zero in there).

* Reduced GH100/GB100 HAL duplication. Made FSP_PKEY_SIZE/FSP_SIG_SIZE
  consistent across patches. Replaced fragile architecture checks with
  chipset.arch(). Renamed LIBOS_BLACKWELL.

* Narrowed the scope of some of the #![expect(dead_code)] cases,
  although that really only matters within the series, not once it is
  fully applied.

John Hubbard (38):
  gpu: nova-core: fix aux device registration for multi-GPU systems
  gpu: nova-core: pass pdev directly to dev_* logging macros
  gpu: nova-core: print FB sizes, along with ranges
  gpu: nova-core: add FbRange.len() and use it in boot.rs
  gpu: nova-core: Hopper/Blackwell: basic GPU identification
  gpu: nova-core: factor .fwsignature* selection into a new
    find_gsp_sigs_section()
  gpu: nova-core: use GPU Architecture to simplify HAL selections
  gpu: nova-core: apply the one "use" item per line policy to
    commands.rs
  gpu: nova-core: move GPU init and DMA mask setup into Gpu::new()
  gpu: nova-core: set DMA mask width based on GPU architecture
  gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
  gpu: nova-core: move firmware image parsing code to firmware.rs
  gpu: nova-core: factor out an elf_str() function
  gpu: nova-core: don't assume 64-bit firmware images
  gpu: nova-core: add support for 32-bit firmware images
  gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
  gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support
    of FSP
  gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
  gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
  gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
  rust: ptr: add const_align_up() and enable inline_const feature
  gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
  gpu: nova-core: add MCTP/NVDM protocol types for firmware
    communication
  gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
    waiting
  gpu: nova-core: Hopper/Blackwell: add FSP message structures
  gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
  gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
  gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
  gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
  gpu: nova-core: Blackwell: use correct sysmem flush registers
  gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
  gpu: nova-core: refactor SEC2 booter loading into
    BooterFirmware::run()
  gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
  gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
  gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()
  rust: sizes: add u64 variants of SZ_* constants
  gpu: nova-core: use SZ_*_U64 constants from kernel::sizes

 drivers/gpu/nova-core/driver.rs          |  32 +-
 drivers/gpu/nova-core/falcon.rs          |   1 +
 drivers/gpu/nova-core/falcon/fsp.rs      | 222 ++++++++++
 drivers/gpu/nova-core/falcon/hal.rs      |  20 +-
 drivers/gpu/nova-core/fb.rs              | 123 ++++--
 drivers/gpu/nova-core/fb/hal.rs          |  38 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs    |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs    |  75 ++++
 drivers/gpu/nova-core/fb/hal/gb202.rs    |  62 +++
 drivers/gpu/nova-core/fb/hal/gh100.rs    |  38 ++
 drivers/gpu/nova-core/firmware.rs        | 186 ++++++++
 drivers/gpu/nova-core/firmware/booter.rs |  35 +-
 drivers/gpu/nova-core/firmware/fsp.rs    |  46 ++
 drivers/gpu/nova-core/firmware/gsp.rs    | 140 ++----
 drivers/gpu/nova-core/fsp.rs             | 525 +++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             | 119 ++++-
 drivers/gpu/nova-core/gsp/boot.rs        | 318 ++++++++++----
 drivers/gpu/nova-core/gsp/commands.rs    |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs          |  95 ++--
 drivers/gpu/nova-core/gsp/fw/commands.rs |  32 +-
 drivers/gpu/nova-core/mctp.rs            | 105 +++++
 drivers/gpu/nova-core/nova_core.rs       |   2 +
 drivers/gpu/nova-core/regs.rs            | 103 ++++-
 rust/kernel/ptr.rs                       |  27 ++
 rust/kernel/sizes.rs                     |  51 +++
 scripts/Makefile.build                   |   2 +-
 26 files changed, 2098 insertions(+), 309 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp.rs
 create mode 100644 drivers/gpu/nova-core/mctp.rs


base-commit: a95f71ad3e2e224277508e006580c333d0a5fe36
prerequisite-patch-id: 1ec0faa352dab8fa7c0f209474b75cd21931340d
-- 
2.53.0

