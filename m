Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF163329E4F;
	Sat, 21 Feb 2026 02:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639819; cv=fail; b=IammsAR4eKIc1+TS1GugbJGMHf5Qk56mih7xFcEkovmfBjz+AOCz4dpvrd7wiioWVbpprR55Pem2EeMhGzfUYYsw9JjJAFc6y2WpD2wa0amown0c/x9Wx4DR/Kt3RY4dzlV2hEseJMzkxWSYDlzrfU/+ppWGjCYI2LX8UpMDAW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639819; c=relaxed/simple;
	bh=LNADL88YrdPCytvI+T8oJ/QD/0uECJ6g0pedx+5zSwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I+OzLhy7eODGa2hmvQTRBC78qkdn/yBijCIYcfjMDGcXsWjL87fpWohgmpTRFgasGv/9Y/5O6Sg8jlUkNdcQWn9phO4CDOnq/vhWXjrIyR6Mgpk9JtS0oomHpVnkvsTvnvlRYDS05cZ/oJwqPDZxuRoNVns0XK8k77LN6ShawL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q7sbWQ5y; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q7sbWQ5y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNln9DcpxCO+j1ukTe1zPYaY+OoRZ2owOTsVgfbs2LXgV2zxgIV4D1aUhr5bdjesoLoN9sZ8M0WbkmXDSgMO25Yt95ApimJLoyZGCDUS6FIoQmt3crCkjzYv89ArZFKqBfOHXEIF/uTr2UaESgtHeI3sAZbKY4CkotsI98Bcind0n0vGXuK410E85Q6atJXEgSg3vgjq0a+DuZ3y4zju3gGX6DyThIGV5AC8zMzqobUrRSYLG2eK8VfAmUp9kWe/2KP0a4YYF7P9Xhv1zUmTNpWhoRPz86yyqy6geUIuS9pC+iQ6JMqzF87Jj4w5PEuQ6HNBL0SzJAJrp+tLWj5r1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7dcGOIOn7YtEnwKtdHI47HvlagiPXqVb+Aj3hvA7LU=;
 b=Q55qHIy1RZqtINHXv2xpkvJ+Ck58gk2Y4j7V7wUu4zvr1Br91jWtFhPOvGAwUbqz+uP4296bKJZCjs/nxnnS3VUtTV5eKBergZVrHXCy5eYulYszQR9fJ6yRnqoe7KKs8hIIV9ccNF+HGsKWCOdqEqZTrQeSlgA2It3olOum8x6OxWOmcKLIjVNT5rpYL8xA6wX1UQut5+ivDGqdIT9OfuuiMOECzSpa5SGTptkHMHPIKVaA7EoObfoO1WbM9T4v0QBCC1SNvH4+GYNcovZviBhy0PuHX/4exXn6X9RlX0N0Q3aN6vUhUzcPp19N6eWLvcDkXr74J2Q2M/Kgc2emGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7dcGOIOn7YtEnwKtdHI47HvlagiPXqVb+Aj3hvA7LU=;
 b=q7sbWQ5yGUXhEzhMFc8ASNs67LGw5fOI5uSbRpnRmOVl3SlUjFUv58PtGytqVy1awM02P3uy7RudxIChrQyd1E11KvviP5pIJV0oQ0GOLq2voPbiFQvZvR91L/SPREBNUAqDshfhXi79XwXmyF0ITGtQtarBTHciUvbge7PBBtMFluMO+6r2307z8zm1fh+OSGU12erahEAla0R/hqa9Hmq11JJVOxQpbUq+nVnigunprYArYkV3KpMTLsYpizGRqXgfZWNVGiIxwlASBJckQJsSCcl6paey2lOMC6EB0MinNxmgMGj14hGvXaMsjUYJd9Vk6gDkgGZMU1WnF5lIKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:10:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:05 +0000
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
Subject: [PATCH v5 09/38] gpu: nova-core: move GPU init and DMA mask setup into Gpu::new()
Date: Fri, 20 Feb 2026 18:09:23 -0800
Message-ID: <20260221020952.412352-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 19799c5f-5918-4aec-aa6a-08de70ee548b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7V62CjSb+9xQNZ/mLpo0Nn6toHpIorThjin8JVCK8Slcu8sSxrZPFh+0+cUk?=
 =?us-ascii?Q?pSekH3x/x1bawVDRmTy8nsRnMkh5a8BSu9WXkC7FTTY4mYF7oulQlHmIZost?=
 =?us-ascii?Q?umHS3fcorhLFhtBx56GWAxJTEkJkkzxputcdi9J8tzSF8R57kSdhR+OlZc6z?=
 =?us-ascii?Q?LiK3FK7KD4RWbWUfwgKAn5Rf/gS8L/F41pvPYhhGqxTaGcLD+K1Tl24wFCmS?=
 =?us-ascii?Q?a20+UzwrujBgQgOMEp1TShPT2nClJXQLITh7iucjG+gpEobu/X+M/gwsxI5t?=
 =?us-ascii?Q?F0avoebFj0YPDaDTjzUHQBOdNMIvByL8Yocqzdba+6YzqZnzkr9WRmy4BABb?=
 =?us-ascii?Q?X+JXn6/5AgOV+ZYUnaRT4PmEfifK3pstMHFlq+lzAJi+H75e2TKR1FPU28wJ?=
 =?us-ascii?Q?7OTap6coPGPNFg/Yq75gICs1yZE0Ntm7JdYzsLmdfLf7PC6LQemRShaX+fFF?=
 =?us-ascii?Q?nym5ScKRWG4SUtEQwPHtzeqX+RJoEXO+J1ovaLpnfCNJCsECQNp5Tk+EVssH?=
 =?us-ascii?Q?mv6rrGJ+T0k1ZfjxIkXJMu5RKfU8AWwr5k3XPFvwvge6GK1XNANS3Kw8A+I2?=
 =?us-ascii?Q?owlRpRMkkR7eVUdeW+CGDS3I0i5xO0uWHw+MrmNimK+z+lRGGgpMVqym970h?=
 =?us-ascii?Q?OVvgqjdXrltVpcCMLNHbBk0wLBnXwldREqcyvUd3GoDBfrydsRTmEBRhR5fP?=
 =?us-ascii?Q?3wDQsOkFoQzEvTR755KhDNrNVNGYIVrtP4yxFCxqB6luj2hw9lBSooKF9xnU?=
 =?us-ascii?Q?9aa24URkUjnAzrnDLtKN3k3FOpfH9BHHcgaFwYhOOGALovZLVckeLQNSQIxq?=
 =?us-ascii?Q?F+mummqtN7iuin0y775npziP+mb8RG8mO3ZeA/vb++TrWMvC2fLFYTASYQSL?=
 =?us-ascii?Q?sQGj9apyEoYxvWhJBGiCpVuOLCEDz6gUj/my6gmSdYYYewfmdSD4GLjX3gla?=
 =?us-ascii?Q?9XgmvENKbnTGhzkyDKblgzCUEK+sIVDpRKrKKbPXoja65Busaeiv/r4eQo0C?=
 =?us-ascii?Q?GyhYLylFAjAP8v2FNQ/9m85CcTNLONNjUB9We2e08mc+mktMZfKC5d674QgS?=
 =?us-ascii?Q?GYFFzEmAAGo65++iIKZRv/RM5LZx5/VfsfYJqZx1PKjurgOAGIfO3yVD6d0E?=
 =?us-ascii?Q?5k9cFZdG/yCpGvjfoF4IUfX5KQaX5JNqSflJUfSlpRz16HVHr+kJ4UhhT7N6?=
 =?us-ascii?Q?qrKtRR7pOmzWCnygbIKdIqP2zzfZCPfnXzJX7qbLw/UzPFOsSEklNtHyX5RG?=
 =?us-ascii?Q?Ht7YfYt/ParYSg62p7bikGPtjTNySwteU+gJZB//dDHzY8bM41qQ2HuGZxGc?=
 =?us-ascii?Q?8ikJ4Z+ES6UxIcGfmJYOiwzYyTAJZDO0LsPnWhyB+VYlEgmSDxqem4O9+d4J?=
 =?us-ascii?Q?TPUxyIo5ZwRgyYuV37VUClyYXii31pYdCNQbGOzEor7tIESEbJfwc+KrFftZ?=
 =?us-ascii?Q?Yiz+iFD6sxDMNqqilus8uSq2aBOk+Emj9rF8LPAb883cB6XUe/YGk47oeR6M?=
 =?us-ascii?Q?nI7RGGEabzhGFd2DVrmY6531SJrMFQ4YJnzJSTe7T+NJT3VGUxldyxFsLfjs?=
 =?us-ascii?Q?T7HiJCVBPaNcdi4x2Kw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tFdpQwRZ3gIEtIHRGdh//3ufjF6tJOoZM9eHURZQwySg8XFNpgSY/qNMqLTW?=
 =?us-ascii?Q?cVD5PZd8eNR3c30kzRRgwQCHyiYcnu9lnxCF0suOTKydzAXrrw1prOZX/hCy?=
 =?us-ascii?Q?Aot9QzXJft+wDehr3/G5UtQ/zM9FXRU+Snwg//kt7DhuS3mfXESVKoCE3d9n?=
 =?us-ascii?Q?2F/isWC3eAifj6Zgd9ISIAnGIJSK6v+lKhJZYucSUedm4TqkeaIoeBxhjNDZ?=
 =?us-ascii?Q?1OkYQokoBAyFkPp81ZS6FxOVU/WBxkYotvqXz4kE3hCHdxs+fcIQNoy3XYJU?=
 =?us-ascii?Q?OTbxybfZ+mPlQULhC67gY0QhQSUq55pneQsN6LCgH44QwV/mzJGG7PHzdrrf?=
 =?us-ascii?Q?7zRrszKlyV4sj3tk0xKTu0Aa0WhYkgt0xzfnCtG9APvG2udIUNiV1WmpEP2o?=
 =?us-ascii?Q?K/En/ox6bOPK/xLpFpExYxAfvCqEuTrCzivzUGjxxi80XvCin0LuL1On61Uq?=
 =?us-ascii?Q?kkRWIaHjW6kOc1WHVdJUZEP0mhyWVEKIi4l+B67+093BvJ9EWVJ6MlCUrdEe?=
 =?us-ascii?Q?uP1hgffxoJICfKADfN7mre+xrqLO7/sZmETQ81crGrTngxaq5+QGQTtoVQIi?=
 =?us-ascii?Q?rN9Py8aUHMM8+8TNFzx9A6/8v3dwl5EiXu2MhTqzPUocRV9Vv1YjC9Tu3tMP?=
 =?us-ascii?Q?+bNAWUwhOLp2BwijMXc/LMCYlYdCrqgi+ewAPtEBvHYNnA44e1i9vCv3GNFX?=
 =?us-ascii?Q?KG6MgEkzMk5TXvC6QYE5jcJGPizffqp8J1gOF/94OGHDu8ozjHtPO9rA5gOE?=
 =?us-ascii?Q?B4fQiYqGsEn6OEVVGy7kJOU4hUrCAFK9bxMbOlMA6T8pddIBZbMCdXuPZ5II?=
 =?us-ascii?Q?6zYRzaH1UZUx7UmW0qJpeRkM9z2TVn1YrJ9untyE1dyrJ1+whDiyaqrvhsk0?=
 =?us-ascii?Q?vA8e7PwmOiGjj3aPo3QkviXIKfbVjtWTC5F5vlPhHAyfMP9ytCr7/8x3ins0?=
 =?us-ascii?Q?D8Ei5BfTc7G85+D7Z4qVWoCsoqYltaukoY4I1s/YvuTDbGpc5Izk4PBxAJjr?=
 =?us-ascii?Q?A6Amd5oOm5ET607Hm0DblBbU0m3M5HV30xYX4xvS9pBXzm1D2ZPn2/scHEsL?=
 =?us-ascii?Q?9FcVnqBgsoMnlUBbJFILn9baJ3+5aUxuxJtepXUOlnRZq5EG3CKXBZpOdIgf?=
 =?us-ascii?Q?4jDvyoDtoLS1D4xTW3y4sN6eQGmfyjc356lu65Er1cySxeNXujMG8XE2jGdu?=
 =?us-ascii?Q?Vog4XoCUhO7hz5wgdTaVVZxNl1O9HXpJnvU9jsOH+BCVD61dlaCRiT+87lrc?=
 =?us-ascii?Q?vr15Qgfzy9DjcYGDTa4xvaW4Z79NALz/IArn+mksSf5FXJZ312Agz1DEGJ06?=
 =?us-ascii?Q?0wqvLUq8DEC6rSU8MxY+4JuEDQ4F1TG2QqMvXHIh5arIRcmP3OGcPr92ucad?=
 =?us-ascii?Q?BOKDp2RLbX8YMdBmJKyKym1OYH2GcK3x5XRksKzAtuI1QTUc28HskKlG/1i3?=
 =?us-ascii?Q?Obt6OW2hq+7qUFGmYoK3TJJvrSDe+N8Q3hDPPclqkOmWsffuBULT2v5sSaaV?=
 =?us-ascii?Q?kSqUrt0BmgotonQDgpnVdYq5FDywcxSRgHp9nfXaeGAGHQYBdnYb0iX9sXGc?=
 =?us-ascii?Q?1Krw9PanLbgX6EiH2d2NLweRNQTJh5UnqjS6+e580tykUjr2i8N+gqerXhAo?=
 =?us-ascii?Q?wDyY11ASOa5VcZiPtKdIotQuENijowKl/MLFMWYN8VW8ZtE42SRIUgb9mBD0?=
 =?us-ascii?Q?h+PG+R56v4WoK4N2I1x2X0QlBIMIYCRv9oXEDklXu0Yg//fcqt2trIqnlfrm?=
 =?us-ascii?Q?duj0hMsx1Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19799c5f-5918-4aec-aa6a-08de70ee548b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:05.7365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YHPvV4csubGicuHRFvzRZ/w75khZHPr2ydFh4wuJLVNvdTcRRBLPUlrNJJS9UYRtypJaVLf2pLvKOIhcdqT5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

Move Spec creation, the dev_info log, and DMA mask setup from the
driver's probe() into Gpu::new(), so that all GPU-specific
initialization lives in the Gpu constructor.

This restructures Gpu::new() to use pin_init_scope wrapping
try_pin_init!, which allows running fallible setup code (Spec::new,
dma_set_mask_and_coherent) before the pin-initializer. The parameter
type changes from pci::Device<device::Bound> to pci::Device<device::Core>
because the DMA call requires the Core device state.

Also makes Chipset::arch() const, adds Spec::chipset() accessor, and
makes Spec::new() pub(crate) for use by later patches.

No functional change: the same 47-bit DMA mask is applied.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 15 --------
 drivers/gpu/nova-core/gpu.rs    | 66 ++++++++++++++++++++++-----------
 2 files changed, 44 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index e887bcc3187f..a26777552710 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -9,8 +9,6 @@
     auxiliary,
     device::Core,
     devres::Devres,
-    dma::Device,
-    dma::DmaMask,
     pci,
     pci::{
         Class,
@@ -37,14 +35,6 @@ pub(crate) struct NovaCore {
 
 const BAR0_SIZE: usize = SZ_16M;
 
-// For now we only support Ampere which can use up to 47-bit DMA addresses.
-//
-// TODO: Add an abstraction for this to support newer GPUs which may support
-// larger DMA addresses. Limiting these GPUs to smaller address widths won't
-// have any adverse affects, unless installed on systems which require larger
-// DMA addresses. These systems should be quite rare.
-const GPU_DMA_BITS: u32 = 47;
-
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -83,11 +73,6 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
             pdev.enable_device_mem()?;
             pdev.set_master();
 
-            // SAFETY: No concurrent DMA allocations or mappings can be made because
-            // the device is still being probed and therefore isn't being used by
-            // other threads of execution.
-            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
-
             let bar = Arc::pin_init(
                 pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0"),
                 GFP_KERNEL,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b6a898008a59..93bf1c7b3ea1 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -3,6 +3,10 @@
 use kernel::{
     device,
     devres::Devres,
+    dma::{
+        Device,
+        DmaMask, //
+    },
     fmt,
     pci,
     prelude::*,
@@ -102,7 +106,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
 });
 
 impl Chipset {
-    pub(crate) fn arch(&self) -> Architecture {
+    pub(crate) const fn arch(&self) -> Architecture {
         match self {
             Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
                 Architecture::Turing
@@ -155,6 +159,10 @@ pub(crate) enum Architecture {
     Blackwell = 0x1b,
 }
 
+// TODO: Set the DMA mask per-architecture. Hopper and Blackwell support 52-bit
+// DMA addresses. For now, use 47-bit which is correct for Turing, Ampere, and Ada.
+const GPU_DMA_BITS: u32 = 47;
+
 impl TryFrom<u8> for Architecture {
     type Error = Error;
 
@@ -204,7 +212,7 @@ pub(crate) struct Spec {
 }
 
 impl Spec {
-    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
+    pub(crate) fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
         // Some brief notes about boot0 and boot42, in chronological order:
         //
         // NV04 through NV50:
@@ -234,6 +242,10 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
             dev_err!(dev, "Unsupported chipset: {}\n", boot42);
         })
     }
+
+    pub(crate) fn chipset(&self) -> Chipset {
+        self.chipset
+    }
 }
 
 impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
@@ -278,36 +290,46 @@ pub(crate) struct Gpu {
 
 impl Gpu {
     pub(crate) fn new<'a>(
-        pdev: &'a pci::Device<device::Bound>,
+        pdev: &'a pci::Device<device::Core>,
         devres_bar: Arc<Devres<Bar0>>,
         bar: &'a Bar0,
     ) -> impl PinInit<Self, Error> + 'a {
-        try_pin_init!(Self {
-            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
-                dev_info!(pdev, "NVIDIA ({})\n", spec);
-            })?,
+        pin_init::pin_init_scope(move || {
+            let spec = Spec::new(pdev.as_ref(), bar)?;
+            dev_info!(pdev, "NVIDIA ({})\n", spec);
+
+            // SAFETY: No concurrent DMA allocations or mappings can be made because
+            // the device is still being probed and therefore isn't being used by
+            // other threads of execution.
+            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
+
+            let chipset = spec.chipset();
 
-            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
-            _: {
-                gfw::wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
-            },
+            Ok(try_pin_init!(Self {
+                // We must wait for GFW_BOOT completion before doing any significant setup
+                // on the GPU.
+                _: {
+                    gfw::wait_gfw_boot_completion(bar)
+                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+                },
 
-            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
+                sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
 
-            gsp_falcon: Falcon::new(
-                pdev.as_ref(),
-                spec.chipset,
-            )
-            .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
+                gsp_falcon: Falcon::new(
+                    pdev.as_ref(),
+                    chipset,
+                )
+                .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
 
-            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
+                sec2_falcon: Falcon::new(pdev.as_ref(), chipset)?,
 
-            gsp <- Gsp::new(pdev),
+                gsp <- Gsp::new(pdev),
 
-            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
+                _: { gsp.boot(pdev, bar, chipset, gsp_falcon, sec2_falcon)? },
 
-            bar: devres_bar,
+                bar: devres_bar,
+                spec,
+            }))
         })
     }
 
-- 
2.53.0

