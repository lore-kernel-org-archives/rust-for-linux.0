Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B7C3191CE;
	Sat, 31 Jan 2026 00:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821000; cv=fail; b=n0z+BbtObqkB0mZyJ/msr6ivJTXX6W7IqteCVCL9WAgovVzU9jfKZhJP2laHZ3fL7nZuEmoxwE5zMg0v+TcF/09/Ol+hebnDrheKwzujCzlmthz8vSaoWLODZfj5MqaljsJ0aSHVTL7+PZ+ktUgvcXYeno/2K6flNMJBH3r6Zjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821000; c=relaxed/simple;
	bh=CH+UtduoqbdYBTg+4zNRPd/vqgN39j/2ck9fvgshFyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CW7usMZEHhYku/IzbYM4gR7xmJ+clgHHe4LIYDWYMGljoBK4xiNgElQ+bb1xZI+8Rvvx77duFjNleEL0a1rnsdFMUUwkeeYn3R8jb60nQ4Mvm2EoB3ia+S2T9ZuxPx+oWtKVOnjilPDpMVv6IjKDlS8Xm/mZDjeWqgPH8lmavp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QiCQEIBR; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QiCQEIBR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMTLDWiN6qQUwz/ljFQxPb1uhcoDsRFbr0vwULokTmUUQEJMovkJ7vdM76/KF6WRMigWqAb7hUYJGGPsabWnXgXRgyBBLF1p68BVqjFv72pMhML1/9xKmDfu/IrVo8g0Fr5sKLjAwevmHCkB07zMvX9hBrlScjtVipSF2aJfpAFGSzavvp/o0/XMeMVFegCprpafg6lDdHslSbmK5qlg3pe8+Rk+9MhfqjHAeWycLHW5z1uC24w6r9+JhsZMBR/2YJKR/u71tHfTET8vaFOrg6h4vdFsIS4H3JxaRdZZWlf+W3oGaUbVA9MV5A8xoFAjyU4n5eb70bh++7MU1/C1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fark1rNmmPEp2/uPbLFYjKFNexQnflhr1c33X1nm8oc=;
 b=J0xgaKBN/JmAaqr2zcZVypC+ptPSpx+QYkTFwdEq3bgaTrSu6C3sE9l9rmyRBz7rA3rtwgNgopNgzFCDKmnEB5vumL4SCtanqxhu2LR7HRo9DbecBENF6OQFRttaRSeQp1gkNPZNdwDqRuK9kI/2bTYiJY9ZShbTjl6KS2mfC4Wz4OohgrVWDOgB++MY9jAZDxClnwlMEfDV9oTuxexUgYmC+QWgJVJRpmbmLOf7WkL9YDWkPdhbRjKS4buEWMWi3rWVNbqUbXGuDOeNGIzoPBrZDoor/OpXh/Q5ToZAvDgDMdruXkikXUJcgxY+3wAnmNJ0TGmgjl//tI/RXiNk8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fark1rNmmPEp2/uPbLFYjKFNexQnflhr1c33X1nm8oc=;
 b=QiCQEIBRa5NqVhgLf950mKxy90jJwUnXq5dkHlDKURPYsfaI255XrsbroJRdlwokQSrpEi8/ZbQa9xGWyzA+kLDwYLnnxyIKD8N7S0pu4rkaLfI3iJXEu0GoGQKxH6qehoJFRCPTa+SPBUNuL1uJf6nKmLRI0BC+htNEQzahTon1YPJlLqJpka7Pgs/p/xYEwBkgK5+mB9GTdKplivTdUpXB7eb51QHAKKoTpQUHC5fn3BzFpJt16fQ08WLhr0rv8hk8VUYWDTcbrhbEPC2JcXYIKwZ0WR4+dVpSuH/WU1p6QE58qS4MNiSI1JNelX32vY3K3lpsy0NN0LmVX6EovQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:29 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
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
Subject: [PATCH v2 16/30] gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
Date: Fri, 30 Jan 2026 16:55:50 -0800
Message-ID: <20260131005604.454172-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ea314a-d721-4dbe-13cb-08de6063918d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ox+H/AOvc6smsiFYZob/l1C10gr5SPtVDuIUDb9jvZrh2yLRXiTJI9uhugSr?=
 =?us-ascii?Q?zcKxrNIxrgHBRc/1sMqaH5xfifl/8UD9P75j8cKVprHTtzytRTlitflR5FDE?=
 =?us-ascii?Q?o8ukvYRHYJWvucflTUBdm/s7HRdmXXG/fwxN7Bv5KDCRe6qr6d33MQ5Plx3R?=
 =?us-ascii?Q?4DMoA41/hTVINYdlfF9DjoDKzFymx0giYa2nBbNBuKlSc8hedGIuvgfAy6db?=
 =?us-ascii?Q?aJ6Ng6t04f0K7wPex2EuObbg2+1nkQkEW7DNDzFuco7aTES9VLrduJRXkgT3?=
 =?us-ascii?Q?vG1MvFQsXzh7qI1Xj2GTVwdqUf4MlHXpf3Nqmalai7KvGBpCyXnKWi83/fKD?=
 =?us-ascii?Q?JR/brJo+IToiB/Dvatlyrp1o+6uSdM+vsUJ75JqBlhv6BJ+oDg/E5jzcKDy0?=
 =?us-ascii?Q?eUB2qlfjbRszmMqGPf7Zc6Lyw6Ght0I6R92hzUHj6gOstRJki3PmoeKuZIak?=
 =?us-ascii?Q?342QIyS/jJW1mpdsI+SBkh3eqBxD+Ar0UhlFNn/2Kwu+EFtmpoEAF9K7fid2?=
 =?us-ascii?Q?X6iyMk4H9dlm3lCXchik6QLnxAjujnly94lY/jh/p0EEkRth3zdWEu2vAXVf?=
 =?us-ascii?Q?7BD3xa8EAzXhqM9DjiYQb8JDjgxq7h0Uqwftq9RC/fRKFU4jZYNRSvbM4mM5?=
 =?us-ascii?Q?GdOaL3a3DaOaNoKjI9Iiz+JVoN4SdBMlGzjKZYfs0NQj0ZuPc1Y0uYokm67m?=
 =?us-ascii?Q?OgTEWAko4UFDy8Z2Z7eIrDav1M55JNWf1SXwdI8gzB+S1mfnQ0uEnqTOEzHg?=
 =?us-ascii?Q?1rkMx2whtEaGN3iy0+BpeN4uNW/O8vhrLs3iWtrDsh44wluByMbbiWyO3+p7?=
 =?us-ascii?Q?2pYChx5QAsegEy5aPyke8MvguFnI99wll1fMuMXc29bKmEOjN/xWruGCekVF?=
 =?us-ascii?Q?MWFZEAWSNQ0/pvFpWhVKusqUFCnVik+/CsnCIhaz+3PG7RwwoJKyiQbiKDdX?=
 =?us-ascii?Q?eGj5QeKIh31PiYZQ8SdagqkjLU+53EDar29Ti8QiTPrNlbi4Oqv6ipfBU6jH?=
 =?us-ascii?Q?LHg2Sz6evpm9Vfu4Y8fjGb3YTWrhqP04h3H8THCyrvzqbiumixSi1dRMxS7F?=
 =?us-ascii?Q?AAdYggGBv6JIr0RA0CSaZEb1rPwUV1D+b5oHlmrbb3yKcm/6i6NW59t67F+H?=
 =?us-ascii?Q?vhdGf/L6gPcjg7EymL8oKpgAIHpu5HZZiST9A67dyKgoTfBzpTt602HPu/r+?=
 =?us-ascii?Q?i3Vy2pWFNL4G20P6apzKSuVdJxEPeXQ3L43qGF5IvMKEwRMS8FWbjAmGtTS3?=
 =?us-ascii?Q?Y/1S9nWBRZZwzsc2Ue3kRRociiaP8mJ1yfUOKvFGdGOFVQM3wIIh/czYs6VZ?=
 =?us-ascii?Q?qaii74O01tOQM1aQ50xo4cCxgm5Do3IQtoQRlg+MHDZ9rL25BUlPhjjWAypo?=
 =?us-ascii?Q?8ggr1i7id7YYFqZKLmLPPWsXHPcgPjDcoSQOgKv0QfIWHscz/IgyXQyMEKkM?=
 =?us-ascii?Q?YAbsFvPDAM4PjQkPPnZs0Ua/t/JypGaujGYqS03t/9KFBKazZdZUhNaPOo+c?=
 =?us-ascii?Q?0FvEzQDLH6CXm397Lc7MXWOyA+/7KWE7gbsposzKya+8FLn4e4VC59k7ZVLb?=
 =?us-ascii?Q?Il+InuWLplsP38MU/88=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zBVWWtoXulDRPdFLLcXPR+ZlazG5fFyRf6NCP/L4yP94rBwiN5n73TplGDqH?=
 =?us-ascii?Q?AdjIf62HRSZK7eDRjwxHdDI3Hlgvdjvoi6foEOcsZq0MXSYcq7El4Gn6Cz7h?=
 =?us-ascii?Q?wOct5znEDP0gbzdBji2oBq3Ym1L35fk1w6uZfQ1bk9ghft/PvWVobJbiHqII?=
 =?us-ascii?Q?eNG7noV1Ntu9rIJ0V4FuY3M4IHbxb9HkxhxgOqm6ZMRSHtDXow50832Yujol?=
 =?us-ascii?Q?PR01FDygi58zZ9ZNFZnw1BCRuO2WTngHB9hVtBcN/hT2Yan6Eg0Fgc+9aPF6?=
 =?us-ascii?Q?SevKVGCftbGEuS5RRlFMhLZpUDEWGMCzDKDvyp6u0YZzbOiA7C871xMhDP+v?=
 =?us-ascii?Q?Ik8V5uiGPDkxmH/eIc05tM40KMGwriD7EzT07Ap7hZmEDSDgwBK60EtjKbnz?=
 =?us-ascii?Q?X8vx8kWlnAv5g40jDoME3VbjON+ssU3WAN3PaJIBgoOkdcEMevuPEENiE2qA?=
 =?us-ascii?Q?I2LNaGeuDhxL93as+IhXlHz7bOFmo5EPdojqlWNMjSIvrZ74uwruk4PV0lHF?=
 =?us-ascii?Q?TGdmGxgP+HCq8y2gJWbaeT3BoMUmI9+o17mJFE6sKqcoWJ4OxPKXNcr7N3w8?=
 =?us-ascii?Q?Wi8ziP/NoxKYfDHBy4CNcSSJ9gi1lSKiL9ybz/sTx0GBQp0P9Ky8053Klto9?=
 =?us-ascii?Q?TUJgY7HrG0WTWlBP8nFjod7uah2OVBxIn5NMgpaRtCA8feXc782iyL24ItDi?=
 =?us-ascii?Q?8r9sdgOlzZQYfUXFwh+F6ic2uoutYxpPXHKCrr4/8AyZShZnJ5bUKUgt6Ysu?=
 =?us-ascii?Q?326sHABf7zMh8IVgIQIk8yf3wQQtfUNCkikYw+Y1kTxq199QUiITbXOWNz6u?=
 =?us-ascii?Q?2JHVpXFFq+n16LxEsawzT5qFvvOB1f09bVJhXXQfQc6f5xIkuHUUpjcQ3mWq?=
 =?us-ascii?Q?jzXavRCelDNt90uJMxWi6Kr5BOeM6UFBhUYrQcEdFuqzJPaY27vMGEqnu/iZ?=
 =?us-ascii?Q?EqshAGBhoU5wwZ7gKeJbwiPrP6V+7CRBOdqkmqnub7CdaEmDrRttITz4P6ZO?=
 =?us-ascii?Q?nCyAHmnNFM6DQDdEzT2FBpkNMku6uIOXaC2N/W4UfmnoWw2agWBQphTQmJSB?=
 =?us-ascii?Q?YGPS7eNvcRF9QXx7rYZPQKt+J1UGmyXEffxvDdSd7q/Ld2GW4wXKmakXvD6E?=
 =?us-ascii?Q?EcmecJ8y3nTsVs1xQpoHghFAVpyLsIeSPlko8TCzQ1+9T90RGiVF/IrXnK/c?=
 =?us-ascii?Q?oQpUPafqBhG40xQxYEJcwPdLY09JIS59ZWq1Uv0dgXUxrk9oYie1mPByPOv4?=
 =?us-ascii?Q?bUnu0LQiZDrtMORHIiMq9wPWya1GDWneqeSvuis/n26LkDzFjAswnikyZaQz?=
 =?us-ascii?Q?e93MVWyobEcAdR2NqeFkUVOwFi2wo36L/NfSwCMLFANKHGVIKRI9yJG+zOFG?=
 =?us-ascii?Q?R2KC0OLpisdwzvXEs2G16pl0bsbrPmJuUrxW4xSYPQjy67GXWlb3dWezn1JW?=
 =?us-ascii?Q?uliu7+GLHZm7xzjiXnizoRxaWFhFkTFol5b8Kmsct/46BmqI7nl0fcHY8pv8?=
 =?us-ascii?Q?5J5DR+6iY+7lawKEzme18jFSeyQCc//JeBFnzMCN1p3PMME+W84DhvLtxexh?=
 =?us-ascii?Q?woXN1DqqtisLsyQRylmk6FLsdk+SNTF+jP3K9yCtuYv3aEbPnOHWsHjQ3Qfj?=
 =?us-ascii?Q?3ousivy6eX8unos8E397nllf3I3oLYJekKOzhAFZ+8RPZ9W9GR/0vDDKVkwM?=
 =?us-ascii?Q?qFeF8pTRh4lTEh+D8EzIHqeuZhofwNpnMsKQJCeSOR+6+9VEHsKY8aBdZzRG?=
 =?us-ascii?Q?JNn/kSs06g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ea314a-d721-4dbe-13cb-08de6063918d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:29.4629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1K9VfEBJ703zW/x7hvqVlRENME//GgEBE/N1wLWT63hhstEkwieiWpvooDWbDWh3Ov4ImZbjYb2P17MUzAs8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

Cc: Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 62 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 10 +++++
 2 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index cc3fc3cf2f6a..5152c2f1ed26 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -5,15 +5,27 @@
 //! The FSP falcon handles secure boot and Chain of Trust operations
 //! on Hopper and Blackwell architectures, replacing SEC2's role.
 
+use kernel::prelude::*;
+
 use crate::{
+    driver::Bar0,
     falcon::{
+        Falcon,
         FalconEngine,
         PFalcon2Base,
         PFalconBase, //
     },
-    regs::macros::RegisterBase,
+    regs::{
+        self,
+        macros::RegisterBase, //
+    },
 };
 
+/// EMEM control register bit 24: write mode.
+const EMEM_CTL_WRITE: u32 = 1 << 24;
+/// EMEM control register bit 25: read mode.
+const EMEM_CTL_READ: u32 = 1 << 25;
+
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
 pub(crate) struct Fsp(());
 
@@ -29,3 +41,51 @@ impl RegisterBase<PFalcon2Base> for Fsp {
 impl FalconEngine for Fsp {
     const ID: Self = Fsp(());
 }
+
+impl Falcon<Fsp> {
+    /// Writes `data` to FSP external memory at byte `offset` using Falcon PIO.
+    ///
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(unused)]
+    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
+        // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_value(EMEM_CTL_WRITE | offset)
+            .write(bar, &Fsp::ID);
+
+        for chunk in data.chunks_exact(4) {
+            let word = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
+            regs::NV_PFALCON_FALCON_EMEM_DATA::default()
+                .set_data(word)
+                .write(bar, &Fsp::ID);
+        }
+
+        Ok(())
+    }
+
+    /// Reads FSP external memory at byte `offset` into `data` using Falcon PIO.
+    ///
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(unused)]
+    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
+        // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_value(EMEM_CTL_READ | offset)
+            .write(bar, &Fsp::ID);
+
+        for chunk in data.chunks_exact_mut(4) {
+            let word = regs::NV_PFALCON_FALCON_EMEM_DATA::read(bar, &Fsp::ID).data();
+            chunk.copy_from_slice(&word.to_le_bytes());
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index ea0d32f5396c..30a5a49edeab 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -431,6 +431,16 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
     8:8     br_fetch as bool;
 });
 
+// GP102 EMEM PIO registers (used by FSP for Hopper/Blackwell)
+// These registers provide falcon external memory communication interface
+register!(NV_PFALCON_FALCON_EMEM_CTL @ PFalconBase[0x00000ac0] {
+    31:0    value as u32;       // EMEM control register
+});
+
+register!(NV_PFALCON_FALCON_EMEM_DATA @ PFalconBase[0x00000ac4] {
+    31:0    data as u32;        // EMEM data register
+});
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.52.0

