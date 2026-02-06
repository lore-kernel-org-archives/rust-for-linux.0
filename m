Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6EA344D85;
	Fri,  6 Feb 2026 04:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351724; cv=fail; b=gf2C1Ih4vTQsfd+TXX/+u3/U6Yy06rZXz4BXPvnZ9PO3iIL/DKwrKpBmt5C0CnAd7YpeGmhhHOIqzvx6z0yZzp8VkOB8BKa3QPz2dIDB8MYkx3VDdqwzwR1jG7YKjBN/rpYKKrxEInzAq08hrIsXzVR2Z2eF3CCNmyzZIUxys1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351724; c=relaxed/simple;
	bh=69vzSwvSUDJ0pHr2MNQKaWrDXnAdFgSDe+iAJV0V7RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a5zlvhLX4EbCwCdeYmjKLJjKRzBhClD/K0/F3GcUap9eLMQomgD11SZDn8kwVEbJ4+ko3R2l/nOB/k34mFTMawDc/uK8FTZexZPiqjUbTnHK6pwZhUEseIFow+5EYdSPCMnMCqi9qtJdBzK5bvnRWlfH4TzQthGM9yoZ7n6MtCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H+tFdkTC; arc=fail smtp.client-ip=52.101.52.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H+tFdkTC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6yfF6PuZm0kIgmEgL7gh7l0HczZSUHWAf5JN3BBfbnMbFgml44hXwYwzAtuRRMrxTq4+cFVJ3dGg18XDSbaDgSI8zn/e/kZzX56qt0L6LPZGVCnrNfyK+4EJ+oEjK/vPY1HcZPGOd7IkordfR1xONzClJftww6O/DBkbhXG3z7Rmp2jDQgrdfewZ2+4hYc2piy9JVB2qf5fj1BDT2dGYPn76O2EiqxckyRo7CiziJSR/RsWZ28d5mnZcprZI7WOd9VO5TZaMIL0i2vKs2nauTilRmqAPgEMkZbNpkmeodApvDv5WXF970oedR6n+ZWrhwfKG/GQXYBT636WqxyAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYRgoBACqJAjOaGcPQlxQJm4lOeCYeMsKZWKAFw0trg=;
 b=Smu5tAsQ8/6WLTMQPWNaKXQ7rCayb02JdvXrt91erpkK4Nos1/aFfsN5lytzkiujzKVmVSE+AAlPrZ2V95sOt7AsqmUpGHGzNu5uJRejGp07OfRoHguLqcSLtYvtDwraJPIC8asIaOoLTDrcVKJhuHm5wwR5roTFD+3av/6GDx2MoQVa8LSZRh6LY8PElk5foVgrrj7I1oYWMnpLOZJDNC1bumj5sGy70H8xXDPTpy+BqBtQ8Y2qRM55l9MEOthl1ShMVjDA9EC12YV58WSd8lXmFHXzIP70uJ6XTnP/FV+hQulDT4ybASB2mlCNfnYDSGSAx11oqu2/EuSUvS3vOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYRgoBACqJAjOaGcPQlxQJm4lOeCYeMsKZWKAFw0trg=;
 b=H+tFdkTC9Lm54gcQd5AzIoXwT0ZMaLRxEX6K7W1y0g+IJo+CBjf9fuwE603iWRiuCnFNTdgwweoJSPAdPXhcAPkoWjNnzARhIMA6u4MN2JlEBgckPKuOIZdHPNmTmEDzSprM9F1PfKttIaky7Xbix9SKF1C30E6uer1iAXZr9PI6OQlSkWidm9gHB7nFEfGk/W+vwdaXCvkYy8iJBYaV9EOMUmeh8b9ur3KGPl1ae7U4X95tCVCTCkuoPxhI2VbCWOQfNxSaQs8dM9+/EY8u76sbvhTYZUcdICYo2hhr+Gso8Q0ex9fIgionhwts8KmGy+2HGcVGHm73QwCM1gkghA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 04:22:00 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:22:00 +0000
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
Subject: [PATCH v3 26/30] gpu: nova-core: refactor SEC2 booter loading into run_booter() helper
Date: Thu,  5 Feb 2026 20:21:19 -0800
Message-ID: <20260206042123.303281-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::49) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d9557b-cea8-48a2-cee2-08de653745e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?egd45P5uzGrDXA+K+go6U+VIHPlFTSXEMxXv2c2fxCvVYe63nu+4AMBSNP4A?=
 =?us-ascii?Q?9yOIQPwRwAKEOlrHGsKssbcyjMnNjLDq7Xp5iGJrdi7HHh7UXsm0cpLg3RDE?=
 =?us-ascii?Q?wRr8lBYoctj2+ybdnRiYpXJ6CuBRv3f/ODnwYDClAqg5JCfnuqzEMkCVIRvt?=
 =?us-ascii?Q?ORbK5gBEM/acarGagLG4bmdaA/rTJS/WcEUmxCvUr0EFmmwP6VdNdhIIeDP1?=
 =?us-ascii?Q?kFwhOG2LbcW5ckFjz4AN11d7k1j8n2PDAkZZvqL6/xjf1hADYBVhA2qRelwH?=
 =?us-ascii?Q?UhwEYt8XXAHEDBZ8Oo7DYbppho/AGA0wG/mlaYvoFTyHCda8lnka5ujtFCmM?=
 =?us-ascii?Q?F56UVwO61kVqUvWsU6D/N/iBEcGvnwElDvgaVDNXkb5N0MSiUkdgu0MLCUgt?=
 =?us-ascii?Q?25nLGfLV0xDgeVzPR+l8WRWARpa1k4nNGctvZJbhge9A2aRwpY72o6RTEmdV?=
 =?us-ascii?Q?pxRMlCyUmLHB9hpuI0Wb3YeoEaZ5q14LZ7jL4qqd3dkNgQy38sLNNXk6XVrI?=
 =?us-ascii?Q?y3HTpU5+NUZ2PoCr+j0/58ClKEiJaIn1X2AdvYEnTzRNBP4PhkM+mveb6JYJ?=
 =?us-ascii?Q?h6HtGhH7FVrlU4bOtX3U0jtbU1+bK4G5khBXKhHViZG+V1h4CJmDqNTB0y2p?=
 =?us-ascii?Q?dXweMLqZVq+SFpCnwlv6B7ewlkDc5tK/eixj+B8je4W2qIf/YtJijEr1vAYd?=
 =?us-ascii?Q?nhMa0igCoNaozTSur+VKr3azJFOgAnp/ozZUqYQN0BpGGNgTleNJj4qkk0h4?=
 =?us-ascii?Q?DSYwSJPDHNkk9doXwpErTr6ffWQArdrigzDdKzSuWCizM7Hv7HIofB6ZmKtc?=
 =?us-ascii?Q?wexjGix57SJjemz7fBqoK7f38uzZ3Wc5/NTuLhe6PLPwNozU9SV4r4tbO7Py?=
 =?us-ascii?Q?GtxdCMMSCsASnR8g6qPLsIIv0vIbyn07+uUsrRWSc0069tJM/nxUL1gRGUR5?=
 =?us-ascii?Q?wYhTSToqxMWRio87efUVhllFoL0c3keaFozA8L3tEaj56gUd/7N396xdbSNU?=
 =?us-ascii?Q?/RCsKmUuhQnpRMFHHHphhc6DQp2lKsObFGnWUQQd71JDP/tQYnllkzum7jSB?=
 =?us-ascii?Q?b9AkMbK79FfJdXzI+b1w5tv+ngE8MR3G/mpm78yaHEEfonsaaisJSn3jh22J?=
 =?us-ascii?Q?XhBaJ7lKXCMRKV5/SK3OV92D3m0iyRyotlYEjGIPX1a5QsmGO/IcyIqukIEX?=
 =?us-ascii?Q?nRy/Ro+zhp2YcYzJa+XbRUM+GbhPbbvSJzvp7dA8QiGoHDJPAfYOPPBbt+a5?=
 =?us-ascii?Q?jnpPsdh2Tl6XsvPAR8PiKJX6ZyIE8RWdhq50P0AVyQ9W9Kpz2ZEEY1q49bk4?=
 =?us-ascii?Q?Qpk8xio/ywoGog5V2k2Aql6Fkutl0UYYCIUW5lQbSRuz4y/6t1xe7QyO2Pkd?=
 =?us-ascii?Q?K3wMAEO+9Ee9nPej1qYwGGc8xz8P0bc9bsAbhylAvcQrJ/XaXnG8NOzCGx0L?=
 =?us-ascii?Q?QfAH9yE92lb4brmlPjx7zXX1T+u6tYB2VUgxS88lwZmBu6CoybyTKGOKXYrA?=
 =?us-ascii?Q?Y+oD+vRHjeMVOpWSJ1N3dAfYjlpKsAEufkhcF/H2SBlkkiAxL/T3DAcx9vjy?=
 =?us-ascii?Q?qfLiS/3i/7pYcxK7xUU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lXZlN/mH4FN7Dz6QiaaOq4yoF4dlWz35DwwhyVFOjSYyXtRduLqaWVmnq9YZ?=
 =?us-ascii?Q?lZcFLzwKTim4vFyAjcKWNRujVKKhUS7q99HWKZ+xKbheBdLs3bdQe3HXeJFC?=
 =?us-ascii?Q?czHgDewxDm3JXKizBj1LiS8A0cO4ZdHMtc7kBc88j4Y2i81qKZpSfjHXc7cx?=
 =?us-ascii?Q?t6wtrBaH4nUqvYkzPs9/mGayas3PcjeV7hSDitQSJZvRT7vHAoUcoiS7gU1f?=
 =?us-ascii?Q?uxHBqDyeF9Pxp/iI2rHoBphRK3IdFlNTkdK62OtjYOEz1z7zeMOEOAa6cqRH?=
 =?us-ascii?Q?ajUgWmRVLG8f+ow7TQTDWVSLPNTYF+g0ef5v88+8TBLoGXMr0XEkQB0Vg9/d?=
 =?us-ascii?Q?Kpg5ULyk0RwqnQTjrn7oOml3UxssRB3si1zgY7G/v/F6TA5/XasCzyYjxYca?=
 =?us-ascii?Q?jJ/2KQQa+xwTG0INWdat7L/8FkbX42HJtvnE7UNPW5MaO9MfapwBEE27L+hZ?=
 =?us-ascii?Q?c5Aesml/AC6nW26HCgkhWvArhv2Hw8BwAkI3d8YuNwqTBV4i5X77mZyjbRaO?=
 =?us-ascii?Q?FGApXTlBH2gq9Wsejj8AM7pfqlNYVQvymWvb1t53Fdms7zc6WzxA+sZ12iS5?=
 =?us-ascii?Q?7NJPZSjw8S841p9IkHZnBhRUrbEAoOXmdcXm9bEdNJ5IgXFwfijMkgSNq6r2?=
 =?us-ascii?Q?umz+BvFKr6mGZfAxqSOZ3QH7iadv0rNUjqFHBG42GJXMgRfVH+7r9P4/KTwy?=
 =?us-ascii?Q?4krITuhQkONglDwRIMgy6lDjxuGTEgxZG0YwEyhtbeKKQr+S3SgIcF9o7Tdn?=
 =?us-ascii?Q?FmbnACOPC2UKo2aRlnmKgGtUn2TgFRozLDaKinRWm8iEbMptSy2z/u9BsL9B?=
 =?us-ascii?Q?yvgQxKdfRtiiPivh2RS1HQwo1jt7Obt6olocLr1XBC0zToDqKUl9BaGUYC7o?=
 =?us-ascii?Q?TG8HbNEViFS0TUbBvXQkNGZkAXEj5r0USw6x2gsw/kDmNAZp5YQYL7qxVBYN?=
 =?us-ascii?Q?6BVemdz6Ks4HXb4jbAJMFN8OxhDp1wzYBbk3Zf/fwYGpT980cw7LnYh/O9I4?=
 =?us-ascii?Q?Jc01Q/QqfXynMfEHhSgAxKd1ekXOgfg9iSgLfdaZ6fiXtZH6j1Xjccvq79sq?=
 =?us-ascii?Q?8PG5GC66ZsGeTfbelcO1oGy5ZK2+iLrsv0IaFNVidG2mg8tva7fAnS+X1dDb?=
 =?us-ascii?Q?gqGbuPzpxgd1w23A0v0gexK2cthPy5JBuT4ITfYhmzVwWGXX+rb1Z86mtexC?=
 =?us-ascii?Q?eIB7kg30iJuzcOUXsJAuiQE4CZTeZsm0ukqVrDcalvyrkqIZwyxevvLzNzlj?=
 =?us-ascii?Q?53lQK8I8WDHvxJT4QEp0MPmynLnZt6ljMNCXi3L5IeCI23jmFtaO9s8nq2qJ?=
 =?us-ascii?Q?gk7qsshBil9AI5Yv9mk2mjI5KbsvRr992XUfgvdc1W7VuRzcenYPY93+Ylkv?=
 =?us-ascii?Q?dHIJVAo2uT9Q4awlL/4nfwsOCHRS2AamXQ3nfyZmSpo+06v6iutDlMqCYuYj?=
 =?us-ascii?Q?FCQfmU83pDsfVUGNBTsDJpN5An4VInnejuIchtpIDDfI1U1hP0ETnD+ERuxE?=
 =?us-ascii?Q?icnr+s9xeuJv0eC8d6h+n/7/tD87gAlG5h9LpawHw8GDz/CmpFB1o3vMSfPT?=
 =?us-ascii?Q?RG52/sVMa9z0cAsiz8qqF2Q65kbzvgipseIR/j769EGhG5zZEvyKJNyz3+Tf?=
 =?us-ascii?Q?lkriu4ML829hehiOKEjKgMzvQn41f+QeMoyMjhJY/Jm0UVt+xWgaQlBAq0d6?=
 =?us-ascii?Q?WEdnztqAdqtNY4uDy6uA/p6ksj0blARdGh7yBmkYaRBi0edud7VBrmROjVvs?=
 =?us-ascii?Q?UKj9OrUI/w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d9557b-cea8-48a2-cee2-08de653745e2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:22:00.4512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpGJ+08YnheEqevq6IaFbR7vQnC7GuSsO30g1lZmThfD02jBi21Bpyhkcv9eUEnfo+PskIWa90IP8hwBoCuoBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

Extract the SEC2 booter loading sequence into a dedicated helper
function. This is a *almost* pure refactoring with no behavior change,
done in preparation for adding an alternative FSP boot path. The one
slight difference is that an MBOX1 printing typo is fixed:

Previous output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX10x1

Fixed output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX1: 0x1

Cc: Timur Tabi <ttabi@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 67 ++++++++++++++++---------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 036a42a6afb6..b6aa6dcec28e 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -120,6 +120,40 @@ fn run_fwsec_frts(
         }
     }
 
+    fn run_booter(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+    ) -> Result {
+        let booter_loader = BooterFirmware::new(
+            dev,
+            BooterKind::Loader,
+            chipset,
+            FIRMWARE_VERSION,
+            sec2_falcon,
+            bar,
+        )?;
+
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.load(bar, &booter_loader)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+
+        if mbox0 != 0 {
+            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0);
+            return Err(ENODEV);
+        }
+
+        Ok(())
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
@@ -146,15 +180,6 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let booter_loader = BooterFirmware::new(
-            dev,
-            BooterKind::Loader,
-            chipset,
-            FIRMWARE_VERSION,
-            sec2_falcon,
-            bar,
-        )?;
-
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
@@ -182,29 +207,7 @@ pub(crate) fn boot(
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
-        sec2_falcon.reset(bar)?;
-        sec2_falcon.load(bar, &booter_loader)?;
-        let wpr_handle = wpr_meta.dma_handle();
-        let (mbox0, mbox1) = sec2_falcon.boot(
-            bar,
-            Some(wpr_handle as u32),
-            Some((wpr_handle >> 32) as u32),
-        )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
-            mbox0,
-            mbox1
-        );
-
-        if mbox0 != 0 {
-            dev_err!(
-                pdev.as_ref(),
-                "Booter-load failed with error {:#x}\n",
-                mbox0
-            );
-            return Err(ENODEV);
-        }
+        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
 
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
-- 
2.53.0

