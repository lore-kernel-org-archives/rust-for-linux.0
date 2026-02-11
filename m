Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80CCA52;
	Wed, 11 Feb 2026 00:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770768304; cv=fail; b=DkuAbML+2+q9ookY8prQ+7X/eO+nb9y2tDyNzeGloa4c1SrJjV5bgvfqsYgVAH+TxRVpjPovaZrYlMoKgFX9TayEFXK6nF0ccxZCc26SMBXBtpedYypdTAOYfnyPE151SfMxIRFoBnnbcZTJ7vbVq784Mk8JL3QlXDYANdqCAco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770768304; c=relaxed/simple;
	bh=eaS8uYmxL0nWHNq/9Efj5E35se2n1TYlKAkD6fukjpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QWiwrkZpEkMRzlcmTAQ+haaB2BC/0Ip7DevYJZjadnDtQpibeMH6qPFiq3NPC+7QkXZ//qN3KZI4+FA8i5a41TdnfuIcI8dWEqCelfY2gkOZxhJoK8RQmKc4l1UMybh8D2qiORRo54FUKzswqJOEnx7FXRue0CDT+ltL/0oXfMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jsliFdnb; arc=fail smtp.client-ip=40.107.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jsliFdnb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRyq9GizrndPqiZPn9M6krk8Ujht/lxHOCU++58kU6CxmASTkrIhZQucnO3qEGiJRfhCRhpcd/FaAYnLFpuD/AP3V80WtVpdg1V77+77fj4LMUAaMYWIGr2VEpNcMneco692C497eq256r1g3Jls4SEcQKz/sqfqw2NoTVgSK+Hls1THLAnPzeUCF70Rv3R4zyKUBXMzzCMVWQ0xZvQKS2StVZaCb3X2C41agw5+kI31j8Go+zERpHnzXtaz4Xy42BTf1sf0X8s9rCESw8aE+DlQpj9upXAE/meugVXuMnN4Xyj5b+r7dYTCQaMDMaVhrhRHs6C+QPdEOzDj5rKJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spOI+/aVmIaeY475L939pCDzO9Gr73O6Ar7Cu/R28Dk=;
 b=n5viOq5JuvFvvZNQHJXw0cwF2SW7lSP3uL4YyYLK0ZtdMMTd5meGVs5LH5xdLVGuKyjk9OfzA4Qe1KksF/wK5WitIlkOKIws0jQ1KKaImcUhZ6TKGicO+oh7ZvQ0FEyr+7mg+DA6a8mtnnO4g5PfPvU07Af65TKn0hDvItJWAS4HujrYCl5wWYV92+a6aoZePLTvEAZuJ3r2o+FGMv4NUGKbaFN701Wdcce1tqf9dlf3URB0cDhtqVqcaBJasotQA6WpNlfGqiY2e1jdEbqBWsgWGXFuBclInjxK/edS25Wjm38FtE2WG264cMONAHieQnJvwywzGlbuWnQ162ESFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spOI+/aVmIaeY475L939pCDzO9Gr73O6Ar7Cu/R28Dk=;
 b=jsliFdnbD3KLOHscpWLJ3F5xdAE5eX1IQhaZIX5ISrACFiX3dn9tYl9rVSYa0KCEuidg8PFgieFd1OQsrZ9vdCqVaAPGFkt82H1+jaC7TOBiHbRT/GxVSUKCFV6TfZ6zkTuJwThIYXJX3HYM3C1pSx/u1qcVCiFFxRYHFcTpwqitoMVrv/fiQ19B/ohPicuU5Pxz5qClZ/biMjk4GNSCRpQRORHGiUhNH+lQq9hXNCWK2wN0lTvUp3Xg+E40ie1yjqUQflT28w5cQXYkinQ/k8b3FOU9341g0jbU8VmkfWsYJnpERCH+0RgmpBoTziFjx2LZWKdu43ZTOr3TR8OzuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB8588.namprd12.prod.outlook.com (2603:10b6:208:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 11 Feb
 2026 00:04:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9611.006; Wed, 11 Feb 2026
 00:04:56 +0000
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
	John Hubbard <jhubbard@nvidia.com>,
	Maneet Singh <mmaneetsingh@nvidia.com>
Subject: [PATCH 2/2] gpu: nova-core: improve GSP RPC debug logging with message classification
Date: Tue, 10 Feb 2026 16:04:51 -0800
Message-ID: <20260211000451.192109-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211000451.192109-1-jhubbard@nvidia.com>
References: <20260211000451.192109-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7a0181-4c04-4dbd-7810-08de69013013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KYsX0Q/gqdstLsNCzspQRdd/x01SviRInu3QAi1edfTGmFj9aVWf09x6nI5v?=
 =?us-ascii?Q?ggo34obrEX/aWveXF7lEKXK8pFOBWtVGK/w28zi/FlgZKzGsFm7iqj2BsnAD?=
 =?us-ascii?Q?5mCfNWQziHckVLmO2hg73wxOCoII9zaC62S1Pi75/rIM/HpiDNf9iH5Pgnsm?=
 =?us-ascii?Q?aVm3VDJWV0Sf90zA77nZqb3wEJ0Rc4Dct5NSHoeddTmgpmLIq5roh6dQfYz6?=
 =?us-ascii?Q?CPI10kC3v2tf1jV2+n+1XO+MD9Dwp2ro2zQnvkUvbVRCA/qOXFHnMfhaRh9M?=
 =?us-ascii?Q?DgNltMACdCHCluklLBVRN9lWTlb6xlVsdxICZllbaHHy24S4rXWaIngdpWob?=
 =?us-ascii?Q?DnqybSv54HPhrZ4skq82wk+mSjN1KFm5PhFiK5zT2qra12fv4sVWaWk22n6u?=
 =?us-ascii?Q?kVniU5tYvdcCZF2IcHCL9LUuq3EqXIj9hF2Tm3eA9QREDbZ5hkAgauYFRrwe?=
 =?us-ascii?Q?v+bs+iT6VOd8FvBXWLtriBEXeMgPAiDi8ddMewqxbWBQSvcw3g0H6gPC/9I6?=
 =?us-ascii?Q?ECnZkku29hwmT/KPJnAhLGf+jzFzhqitha+gnvZ6AHI0UySZjKhAq8uynH5v?=
 =?us-ascii?Q?frRzncNmeTZJJ/x9pQhj9GndGDRdvL8RpsEawvfohbfY2O74a0rAoAXOE7EC?=
 =?us-ascii?Q?FvxpWQEq0pupo0SqFUNqBujcmmPvUzGX/DuyM/F4TxREEE8DFxEJ7ZhPVRVY?=
 =?us-ascii?Q?klG09HbqsiEIR3ZkrCRFm9YWHv2+rqifX3NVLtK55DJtbjd5OUPa5dm0E0fG?=
 =?us-ascii?Q?Or+l3psIqosXtS2utyb+bH1Qp9ygJ8h0yvK2y4zPFqLe7FQiDLkOaavuQwWm?=
 =?us-ascii?Q?+gEqNIrmvFE2y/pfWi5bZDyvU3piG26NWCaxm8hUy56rsxu0qpnpbTzYgRip?=
 =?us-ascii?Q?5owuJiIVUaGmDLc+wqtPZkrQ31W5RSCT684k2/xPdaD01x/RKDeShRq2CFtb?=
 =?us-ascii?Q?BCkGKzcNODaA3lTxPWCMwNn7wl2teIVQm5mMWddDMCLYa1EeUTRYJVO039XY?=
 =?us-ascii?Q?qvoQOVOzArz9f16KpjM/hPZXI4IEEso8eBV2ER7Y4VS/a5kzxVfz/+pDAxwy?=
 =?us-ascii?Q?vBusjRipYITw5nD065VOvmsku0DGFTg+6ev+bgrWnitN+vFA6voyW91CeeD2?=
 =?us-ascii?Q?k6fvnd/uCPKZbVFMTjfUgKRdIevcZG20Zs5N49S+e3X8VeXEvzKzU97JwuWP?=
 =?us-ascii?Q?SvIG2F7Z+Z9/Cbjsb2k3g30qclWH9ur1bj7UmcYLlKATEJs+L6ntxOMOz8ko?=
 =?us-ascii?Q?gFzOu8VjaKwoTZtIG64h5gtLcpxTr8y0GLfIyJgBRzR4fbhT+KujySinfErc?=
 =?us-ascii?Q?FXsEQFBf3X25mst5UAHDs5wvXdWjDUoBIM9h/jlz1Leb/kW5mOSdvnVKqJjm?=
 =?us-ascii?Q?YY5zv2JRFgK7cEtT27Ow8wlBwaDcLsw3xhqCub+m3QZu760l1TpMKpVxanOY?=
 =?us-ascii?Q?wes5mtZ7X09FX25fwJ9JeQQX0NwZ6sAzBsA5028oD0lFvtUKS0Z4lzp3E8bg?=
 =?us-ascii?Q?0qi02Kzb0N1dJQkl2upaOBlSdKH5vhU6NS2FI9V/19Ttt/m4Acx89pcmxsXd?=
 =?us-ascii?Q?W3f+dzk8kW8SSDYXJuw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?au2aT+YxgMAbVUveNFGAwZqaj/8OBlWL/15EfoPOpQKPyaztwNQC2pRe1Q6P?=
 =?us-ascii?Q?G4xXZkymcDKKN8vIC8R5XOYDOx3nuKmEWqwZ+tM1SKyJ7PvEozA6rHw937hR?=
 =?us-ascii?Q?sxgmadOCHPliscS8JseTsoMIAt0F6RzHsNAirzS1lLWKcxoo7pppFm+WClzE?=
 =?us-ascii?Q?rdAGTJn/HsIf9kDxvMY7EdCD48LmmZ6KsHVbG4OIHVPufwJJk/jxgYaCvrVE?=
 =?us-ascii?Q?DRm+Pq7eSkmGnYZBVLl4vX9KB6S3+p2SRBvkmwOWgiZX4EIPwea6jo/s0fCv?=
 =?us-ascii?Q?4S0Y3u4G+DTV7rHtEXBqwOvqZse2wpxVt/QZun81el1SfoIvnMnO8OAMwlSb?=
 =?us-ascii?Q?L+r3LW/p2FtH6xKc/jews+Jj3cPy5ASWBgUAvxyUr2yObnbGkSJMNNlp1GPu?=
 =?us-ascii?Q?QXE2+GylSLmqmBy1qx7aBXuPGtaxZCfBEwhnYN3qY4OeFX9Hf3PIatdrKebI?=
 =?us-ascii?Q?EevVe+Lt1ZvfN8spFYtN5y1Nmdc9I+kiVMkNwpTjVEckX0c+2frvBB7Kx5Xt?=
 =?us-ascii?Q?nzI1twBpBFmo3gBTzCaq1qBV4YdXomktieojVpePPBNdtSvAU6mAL9+/KjUj?=
 =?us-ascii?Q?GQxzpIVJEPHYnomb9FIHtmRmmtFQUMmfgUHw866xHl5Zd+zYJNEd3urt6Rz3?=
 =?us-ascii?Q?ZCnNwTDsK7dSK+7Ctp63+z8ksihb36cnKbcg2Ro4ei1921ZC1OgOWnIlHXfd?=
 =?us-ascii?Q?wx7+37dQ/2xbzZJZ6lQz/3/cbWr7K/hoSj/aTi7BTsxqGFzOfVlnOZ5zw1j0?=
 =?us-ascii?Q?x2zhU7hu//ueKJfxdSYzEg481ay2PDLwUpc5x9D+K6HApByV+PV0xKaHCEDx?=
 =?us-ascii?Q?f7jVxFHNN5d+JWeQclTCC6xQqx20tpBjTMSMvr4nVTaoSanOrGucQURhRKfC?=
 =?us-ascii?Q?jxnzpyEBkjT2VWQJ5Jx6IqqH6MX7Q+4Q3Q2WSORhzdNDZsVnPfHqtcd7KAUD?=
 =?us-ascii?Q?1moO/IsngxFNylIywAtzEq6+XSiD+ecT1LmzeystE4bZe7LKAvm9Osd8wo3P?=
 =?us-ascii?Q?RFAQJGe/Xd57gjQ5etlbxJcBJdKXG91jk8xwcI2qbkFEq8NMj2iQ7SBNy09I?=
 =?us-ascii?Q?e24tMOKNkOSTiKmJqpCPxUJlhwWi0z/DdETVvGHYKMfyXRbRcfosUnTuEe2y?=
 =?us-ascii?Q?DzDix7mHaa5kYAK0xDwiyrfVhTkfT22SnrWSJ8/JnTbqB80PHBjbdyZGrpH9?=
 =?us-ascii?Q?dAqORdrpJ7l5Tiz6W1vBTRl3YFnXaLh6sLav7g9MPu48bsY090Wb/jV6zeYY?=
 =?us-ascii?Q?2CsdkR6Xg3n7Yyb5rjI6J6ykkQK3eR9vQkptkWBVqDq91qtFWfcYHWmbCLr6?=
 =?us-ascii?Q?/XBGNEGUAUnFv28NVQVKGGbcqyiWrH15VlugCWhs6rcpmeZ+T/UwQsVVjizl?=
 =?us-ascii?Q?CdTkS5SV2ulxtYrUc5QAItCHD4bQ9Yy5osADSmTcFxh0SmFy5FCGVqCPGxgC?=
 =?us-ascii?Q?fjXIwizJogxyy8/nlvWZb88d5Khv2UcBoAPywPF29Ydgt0/BBBTLXEdi8oLC?=
 =?us-ascii?Q?m0t0RgeFuorkh9a0AYR1v98ehLVo8axvgAdC+Uei4//xdMnxmjqJ9Y1JCM+c?=
 =?us-ascii?Q?XOyZIDc2pPgA4gTQRlDBhY+2yWpWGFKwuOkEm4Z5RLicsvSWF+9AFHBW9VR/?=
 =?us-ascii?Q?QqvoDL+BUw3o2LCzVncat9InPJNVKpDu3OPuqyIeoLcCeZObxV3cz0x7BI4Z?=
 =?us-ascii?Q?wKq/+W29mVWVJ/oPINFpKX/180gE46pVgLPbgI9hM2ot3ghmwSFrmjGwBGFF?=
 =?us-ascii?Q?Gcna9egs1g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7a0181-4c04-4dbd-7810-08de69013013
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 00:04:55.7336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCwG6nCqRxqaS7FaD1wfFqACz7C+zLX44sC2VfHaBzNkj3QnZlZsIRqhi3g3xg2jfTfNN0+arzcnPXUZzUobZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8588

The debug logging printed a flat "send: seq#" and "receive: seq#" for
all GSP RPC messages, with no distinction between async events from GSP
(like GspLockdownNotice or GspInitDone) and command responses (like
GetGspStaticInfo).

Add driver-side tx_async_seq and rx_event_seq counters to independently
track async sends and async events. Move the receive debug log from
wait_for_msg() into receive_msg() where the message function is known.
Label all four message directions:

  GSP RPC: async send: seq# 0, function=GSP_SET_SYSTEM_INFO, length=0x3f0
  GSP RPC: async send: seq# 1, function=SET_REGISTRY, length=0xc5
  GSP RPC: async received: seq# 0, function=LOCKDOWN_NOTICE, length=0x51
  GSP RPC: async received: seq# 17, function=INIT_DONE, length=0x50
  GSP RPC: send: seq# 2, function=GET_GSP_STATIC_INFO, length=0x6c8
  GSP RPC: response received: seq# 2, function=GET_GSP_STATIC_INFO, length=0x6c8

The async received seq# values are driver-counted for now. For command
responses, GSP echoes back the inner rpc.sequence that the CPU sent, so
the response seq# matches the send seq#.

Cc: Maneet Singh <mmaneetsingh@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 67 ++++++++++++++++++++++++-------
 drivers/gpu/nova-core/gsp/fw.rs   |  1 -
 2 files changed, 52 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 7d6d7d81287c..295e1a80d64d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -449,6 +449,11 @@ pub(crate) struct Cmdq {
     /// Transport-level sequence number, incremented for every send. Used for the outer
     /// GSP_MSG_QUEUE_ELEMENT.seqNum. Also used as the inner rpc.sequence for sync commands.
     seq: u32,
+    /// Async (fire-and-forget) send sequence number, for debug logging.
+    tx_async_seq: u32,
+    /// Async event receive sequence number, for debug logging. GSP does not populate
+    /// rpc.sequence for async events today, so the driver counts them itself.
+    rx_event_seq: u32,
     /// Memory area shared with the GSP for communicating commands and messages.
     gsp_mem: DmaGspMem,
 }
@@ -477,6 +482,8 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
         Ok(Cmdq {
             dev: dev.into(),
             seq: 0,
+            tx_async_seq: 0,
+            rx_event_seq: 0,
             gsp_mem,
         })
     }
@@ -555,13 +562,24 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
                 dst.contents.1,
             ])));
 
-        dev_dbg!(
-            &self.dev,
-            "GSP RPC: send: seq# {}, function={}, length=0x{:x}\n",
-            self.seq,
-            M::FUNCTION,
-            dst.header.length(),
-        );
+        if M::IS_ASYNC {
+            dev_dbg!(
+                &self.dev,
+                "GSP RPC: async send: seq# {}, function={}, length=0x{:x}\n",
+                self.tx_async_seq,
+                M::FUNCTION,
+                dst.header.length(),
+            );
+            self.tx_async_seq += 1;
+        } else {
+            dev_dbg!(
+                &self.dev,
+                "GSP RPC: send: seq# {}, function={}, length=0x{:x}\n",
+                self.seq,
+                M::FUNCTION,
+                dst.header.length(),
+            );
+        }
 
         // All set - update the write pointer and inform the GSP of the new command.
         let elem_count = dst.header.element_count();
@@ -606,14 +624,6 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         // Extract the `GspMsgElement`.
         let (header, slice_1) = GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?;
 
-        dev_dbg!(
-            self.dev,
-            "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}\n",
-            header.sequence(),
-            header.function(),
-            header.length(),
-        );
-
         let payload_length = header.payload_length();
 
         // Check that the driver read area is large enough for the message.
@@ -680,6 +690,27 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resul
     {
         let message = self.wait_for_msg(timeout)?;
         let function = message.header.function().map_err(|_| EINVAL)?;
+        let is_event = function.is_event();
+
+        if is_event {
+            dev_dbg!(
+                &self.dev,
+                "GSP RPC: async received: seq# {}, function={}, length=0x{:x}\n",
+                self.rx_event_seq,
+                function,
+                message.header.length(),
+            );
+        } else {
+            // GSP echoes back the inner rpc.sequence that the CPU sent with the
+            // corresponding command, so this should match the send seq#.
+            dev_dbg!(
+                &self.dev,
+                "GSP RPC: response received: seq# {}, function={}, length=0x{:x}\n",
+                message.header.sequence(),
+                function,
+                message.header.length(),
+            );
+        }
 
         // Extract the message. Store the result as we want to advance the read pointer even in
         // case of failure.
@@ -697,6 +728,12 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resul
             message.header.length().div_ceil(GSP_PAGE_SIZE),
         )?);
 
+        // Deferred past message consumption to satisfy the borrow checker: message
+        // holds a reference into self.gsp_mem, so we can't mutate self until it's dropped.
+        if is_event {
+            self.rx_event_seq += 1;
+        }
+
         result
     }
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index e417ed58419f..1535969c3ba9 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -263,7 +263,6 @@ pub(crate) enum MsgFunction {
 impl MsgFunction {
     /// Returns true if this is a GSP-initiated async event (NV_VGPU_MSG_EVENT_*), as opposed to
     /// a command response (NV_VGPU_MSG_FUNCTION_*).
-    #[expect(dead_code)]
     pub(crate) fn is_event(&self) -> bool {
         matches!(
             self,
-- 
2.53.0

