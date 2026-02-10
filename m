Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6402EC083;
	Tue, 10 Feb 2026 02:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691609; cv=fail; b=H7nbnYqF3auh+2+4io+tbeGWp2f5aNZDDABcKcwla8dKWbMBWXuYSCLmGtJX11UBH82JW6jG4seF605cW2G6PR4hr4sXc3QmTMH1uaSgFMBnVJSqlbuT6aEos04h81dTB9gt9uZ483EtPXzgiGlW/3hQe1HGEZBsDz8Nnbpo9lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691609; c=relaxed/simple;
	bh=mmZehtPWYJLNYRsLZDlz6mrZJuIhmufddOHpvEqVM9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lxCOkfv1xVj4rypPM9YwhhVHSlugGJwfdUWKf4WG7iTv9T/tcZvj1LxDv6y782iKnABr6Jc2zI3LBvgR91Fc7QvlTN4LM8+BFieXgAgIqYyztH8iVevOFg1NFEgDp95IiqCyxKPsNKOtRcMEvnm55pPfYjyKImXnZ6X6ha9orJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fWJcCiX/; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fWJcCiX/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrxgcLqjLODTnpD2oosZ92mDZwNoyOimcbULFD2p+W04HqSVgI2oagoenJCeKF5OUfHZP8e4LzwsxoLgf7OY9v0t6BSGNOPbT0CwF+6Lnw8Yc9+PpAERdUu2Qc9ULhJwrcATJyq1aOi1HK+VIBaayMlyemmUF6a2/G9EMPGHIHxI+N4U44w5JEAWnpPWQGWj6KGPGjoz155n7115dSOV9oJpC4gq7inCVSHsV84m4wdTicMP1LxYNhKG6xJk93V2P3SsXifwNv0gJCxC5l9uWUIrQMTPLvX/SS3O6YgUSkhXaUVnldYH/3OjWH5+q66KAE9sZhwuDrz8kiA5YBfFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yoA2ic1704Ug3t/TpijOLDqvLc5iwxCRLRmoHgRn1U=;
 b=jaIbU4yEgY7eURUiozGCPG2J9imXbsRnFG2UCVQ+Gy4+ruUElHio2jHt+hQ7VF437w8Xzq3VeIV2i4MEJJTNYXyhGCBYPsfuhCtHYq9JeCc8y0fljBObAOGVPWJa50VevgPQwkGsNaJV87cTesUjUFtctuz+/zhmDouwNh6qG+nuid4PSZnuaTxOazJivO1Itg+K6OnabkoLLmdcD9V6/VumF3OWlhztlEt0Ci5H/Sk16LJj6Pxvr8pYaXTjv/3wYdlz3Ji0yD0bCqQOIETbgQ74PoKI1p+2kE+1frNPjLSBgAMGF7sEZ/Cl/KpgRvx9a2om09F2ati5pSUF30L82A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yoA2ic1704Ug3t/TpijOLDqvLc5iwxCRLRmoHgRn1U=;
 b=fWJcCiX/MKnPpxhVPZ1kNyiOW3/ac+n+T868IPjrqev2lO533VHnoD2vDLrQel0XabiG6C0KUYl0TNX9SyTPcF49miR/gX2kVtibAPspdM79nYjt+vFXnT6zvUSuYvzWAgybxQbsBrZCvcz8y58Pq83StFrj0e9PcIxOneadFergJhGDig5+n8jGb9qTMQGQwrAp6VLUKe02J7DMvHpvC6PBvdnCxRLbVGzr/zdajrU9Kp6Z3KcdijyehJSK3wrcEpH26bGFQ20sVVqyOTRVSsRdLmqVL5bDmQ2vCbe7dsa4zM4ATWURtAkYGBD8wvaVKOFasMCwB2LIBHZI14H4fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:32 +0000
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
Subject: [PATCH v4 24/33] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
Date: Mon,  9 Feb 2026 18:45:51 -0800
Message-ID: <20260210024601.593248-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 579d3075-d079-41d9-e380-08de684e99a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m/CM9bcTja8pEMzsjsbM8uo+9Uip1qEoXZ4eEUZri2BDP0I1FaoXjVdIxMDN?=
 =?us-ascii?Q?fKKCPXmLfIfXjWlk9L43ENQRgVx31ljehhaUem1H6yrcMEov3bd9ThFdc4WD?=
 =?us-ascii?Q?m8vzxkdVdTngRwA2s120806R75G7bqVYZ1fXhKvvIl/oj1ZqhDdvxbYGS6di?=
 =?us-ascii?Q?ZMMvwwfqnQ+84QbzaSl2QVkosU16y5S+KuNgW4iBgIV/kuriKuQIpE8GTSse?=
 =?us-ascii?Q?nogAWDcWQgZRLyl7qD2WNCjlZHreytKeXacJim30W76vA4z+NmEFiKA7ioYl?=
 =?us-ascii?Q?RlG47wmyPGYuYjji1u1LBqTUTI14+7DoIZJBeAieXRdrd9oSpVx4o89WDueb?=
 =?us-ascii?Q?bwvoDK+6+Izbf5phR5mUixVRrLNlxjo9vTerrLL/dnABKZ9Gb2kf4r4qBvD9?=
 =?us-ascii?Q?L8+4iogL1UblZOzzUAM0icEhrGXk+Ophc03l2QrJ/u5Bzwl9Sm+o3YLLc2u5?=
 =?us-ascii?Q?3eJcDrVoIWumIq2KSfTGRpdxzt+weUJlIgfcJCgQQp2quLywJ5ErGPIeplTi?=
 =?us-ascii?Q?XT1l+AkaKFZzx4o1FSNu61maIxKMZLm6naFmy3jIUWJJv+iYoWSrUbjsHAx4?=
 =?us-ascii?Q?hQq54RmEBMoqLgXw8B5/BHqGxL0ILB7sbyXVMKrPm+O5wfv3wLO/IoSeFXzd?=
 =?us-ascii?Q?CaCNXIzfNtbWxBjj5txwiEHDSQWMT5HH/y02QftTRKlTI8cNEih/NQd25VV/?=
 =?us-ascii?Q?f3Fdto9EF6xdymdUGaQLSUZdm5XxCaa78Cdjp5DQtaBc3DqHazo/dU9SvjyD?=
 =?us-ascii?Q?ecVXHOKlMLhwCDJNp/6WEXTsA+lXL2qpa0mplbU/02kEh0t71sgyRtjFyLbt?=
 =?us-ascii?Q?ObPsO0kp0+3VM/aiWPRfQWNRz2CR3+eghvkmdg8q6Q0QFbjtojl7ASJH//vQ?=
 =?us-ascii?Q?+TdRhiVmQTubbw9cdhPNWLJhsCbr2coFlXb9LYY78hn7APs/jvCkxfhbu82w?=
 =?us-ascii?Q?O6mwH5Lm+uvm9aSF6bDAo3B6vRqDQwrToVQJcKOjPH8LG6xQv8nqeNSzde3D?=
 =?us-ascii?Q?wIKtxGjqmeky99mpQzcTq4m/6VOL5BpOF+dmBWLveZO/pbOSyUi1iB7MpJev?=
 =?us-ascii?Q?2rTnPyWwx22FObjUjrC4oN60dPIOJzrEBqNo1qWlFFH1iZ6AZMgpH21en4Mb?=
 =?us-ascii?Q?VOKIm2ks0zQpErjf4Kc+HNWp1a3rD1qY5cwz7YexjybqtCa0ZXx7cUpqHaHP?=
 =?us-ascii?Q?Rnlw8FaRE3PZFBCZYq4tyBlrBncmYfNH7RL52YRp5lR0tlLOjMVMmPf4qDc+?=
 =?us-ascii?Q?ZTDmxc6KSfqditU5pz1/Gf2mgEhchXg9Usfu7Qx0028UbS1Nmx++gMfAw50T?=
 =?us-ascii?Q?vGBO/w86t/8LebuNyJP9nWCk2c0c7LTzI/V90Ka+M7K33ghrscwFwMelEBDo?=
 =?us-ascii?Q?tKLfEJi4mi21EjjGAZKL3eeJELnXDDwDLpqFdcj/kkJ3G0N3dxrbWSjXw8Vg?=
 =?us-ascii?Q?9uwfpt82DBxG3YBUV/sIN1Ycrpj0btr8aMxBGbr1YDsG9A7QqZS214ZoUntd?=
 =?us-ascii?Q?cIPjO/i1jQ3FTFcNKJfH4rePjyqRibGZr+Qoas1JVBR61d0hfRn9Ki69q8L0?=
 =?us-ascii?Q?ZqPPsXqLzrQe498XFfc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ztm2XGWUlpqta4KJ3ZaWwXY8lRncHaNoj16hYsSiRWebvR6mWFs3bjsnqQ82?=
 =?us-ascii?Q?j2Mx+sLZg0iljGYpJqRK+SVvGXvr+JW9NTJnEbCbXFsYWRNsoIucebeMDoD8?=
 =?us-ascii?Q?9dhbsOgXPgHEJeXBInohc4Q6rhCBsQcK5zvCFo/khSX8SMZTQwuO5DQF7/Pc?=
 =?us-ascii?Q?YH7XdmUHbj2peDMGVMn7+QPveVVHAVV0O1iOEO9ZLc8xNAMCSTcaaPMBQ1kA?=
 =?us-ascii?Q?dyVKWyw/KPbH0thTzcJzKF9nwqmCTxbHnCVcYIed7ArByzMHdLSWraf+qxME?=
 =?us-ascii?Q?7JKZ98Gjht3PKd60lQH4F+GHwqxJldghLxEROyMCX/SS6n57rTM+gz2Y8902?=
 =?us-ascii?Q?Fhxc9t+4ZF6b6qSvWNIg0uJ1T2hUehw/Nj5EG14x49g0I+iyqu8OSL/oVc/X?=
 =?us-ascii?Q?jDKg03sujgM0em3z/lcoix4N3T0gba8jWdfvMtXLsqK69Y36o4REHxEhp3Yw?=
 =?us-ascii?Q?R5WIH7MSCI4SxJB1Nt4aZB3wbEuF6qzvVOR4YhQ8oO7PjvI8IsciaYIcwOan?=
 =?us-ascii?Q?AdXLYM4BuIhbAtp5Seg8JcS0e+ZFfxkNlrWJ6oy01L8k1024O5AvRrIiiqjO?=
 =?us-ascii?Q?tZoi6Ykcjfr5XYCSzx4JPjCdqZ4LkJccK4ms5Xi7rXJCLGNygwzvp96TBSmi?=
 =?us-ascii?Q?PsGi620ZC3HSz8FVXP+EwUY/timVbeOkNSiNiM6Npn5MhmS85FRuIvf5ZnyE?=
 =?us-ascii?Q?gWkVAOIU4I/BxsYnTYoosmQZZtfnsK7vSUA2oWIAUvgHAh02ozwVSM/yYZS5?=
 =?us-ascii?Q?Qqxqc5K2Pkby3JenhlSclZig6OH5TlQN0xmi49pCA9yGDhu+/4QWM3agg++f?=
 =?us-ascii?Q?z6KQZB0SR9RS0iDVcIAjSvaeC5dBgqOawUEl9K3D2kl2qnDN3UCf9ARv7CGO?=
 =?us-ascii?Q?sHqyisPAz6W7537Ak2521KD+Tu2j1ysWRLpQwCL4Z6LMpPa1j1zJojnDzLK2?=
 =?us-ascii?Q?x8qLsOqjkJhstGyAut9Bgam4F/8QzuXSCklieydEjKd8oATSfm8VkKQgnIjT?=
 =?us-ascii?Q?chKmJJQrg7Y3LGJsYEn834eJTqrMfNvqJXY8t9b9Z9zOip/4gTv42QLeM9TJ?=
 =?us-ascii?Q?zJMgmw5FDXP+yfHSyMaxu/eZCsMOwIP9xU8sdmYWx0qfJU9szmLNTxSmXHzG?=
 =?us-ascii?Q?ghc7S+sCcFCaYA7hdHRhja06/CZxgyCMSSTw8AIkQmrQ4sqZbXf0bzuVujmK?=
 =?us-ascii?Q?K4tMVowtmqPvxDBhk4LeYvX3pnnVWpgCAVjLTbfID7dW8WPdoC/DRxJhQjnl?=
 =?us-ascii?Q?+wVrfIZiqcAInStAo7NzTHSf/akIgOpdajEiwWB8fqww9OKd+tNzFc01XdQ8?=
 =?us-ascii?Q?9XAna0aiFbgheO8V4H8INcrIw9UZxc7631ci2F2nd+bLDXGMSL6NxyglUQh3?=
 =?us-ascii?Q?LVUe5xuXQY40DZkkjPl2u6QpdTTeRQIJvh4TzVEuLhVVkMJ5gpkH6euyCTn3?=
 =?us-ascii?Q?QV0Zw3kVQo8B91ToAKTzw/XNERp9u7NcY1BIg4bBLaBEQbyzURuOU7uj+P4t?=
 =?us-ascii?Q?SJsvZ/TqbVAy7NPmLjYbNMjZg3XexJlBtsrGFuH1ICKyX+3e2djKEVId0XxS?=
 =?us-ascii?Q?wW67OooHQpqZRoGFvXBYp/XOmNTRnyNQouFnR8PpwO/I9rYA24DbudDll8Oy?=
 =?us-ascii?Q?HVvH4VTDMgPb7MgzayS14c7Hixsv8aJCtkcdHjA6UDKwfKos3PJ42sCrhBhJ?=
 =?us-ascii?Q?dDtmPzgsBOf59YTTJrxmkqGnCaNxlku/hVXgbDr7UI4W/EqOq44wLgB9Qbc3?=
 =?us-ascii?Q?n+6V+pkmmw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579d3075-d079-41d9-e380-08de684e99a9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:32.9178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGpDm4PsbfFszhNFh/hAw6owz7RxKbKHMg6iIHrq4Ub6F2/eK/RE0Fs9tukCKgpwG59tTN1V13pb8I+lQTFsGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Add the boot functions that construct FMC boot parameters and send the
Chain of Trust message to FSP. This completes the FSP communication
infrastructure needed to boot GSP firmware on Hopper/Blackwell GPUs.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           |   2 +-
 drivers/gpu/nova-core/fb/hal.rs       |   9 +-
 drivers/gpu/nova-core/firmware/fsp.rs |  19 +--
 drivers/gpu/nova-core/fsp.rs          | 166 ++++++++++++++++++++++++--
 drivers/gpu/nova-core/gpu.rs          |  12 ++
 5 files changed, 191 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 9b4407338724..3a2b79a5c107 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -30,7 +30,7 @@
     regs,
 };
 
-mod hal;
+pub(crate) mod hal;
 
 /// Type holding the sysmem flush memory page, a page of memory to be written into the
 /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR*` registers and used to maintain memory coherency.
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index d795ef7ee65d..eaa545fe9b08 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -28,10 +28,17 @@ pub(crate) trait FbHal {
 
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: &Bar0) -> u64;
+
+    /// Returns the non-WPR heap size for GPUs that need large reserved memory.
+    ///
+    /// Returns `None` for GPUs that don't need extra reserved memory.
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        None
+    }
 }
 
 /// Returns the HAL corresponding to `chipset`.
-pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
+pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 80401b964488..edcc173c2fa6 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -3,6 +3,7 @@
 //! FSP is a hardware unit that runs FMC firmware.
 
 use kernel::{
+    alloc::KVec,
     device,
     prelude::*, //
 };
@@ -13,16 +14,16 @@
     gpu::Chipset, //
 };
 
-#[expect(unused)]
+#[expect(dead_code)]
 pub(crate) struct FspFirmware {
-    /// FMC firmware image data (only the .image section)
-    fmc_image: DmaObject,
-    /// Full FMC ELF data (for signature extraction)
-    fmc_full: DmaObject,
+    /// FMC firmware image data (only the .image section) - submitted to hardware
+    pub(crate) fmc_image: DmaObject,
+    /// Full FMC ELF data (for signature extraction) - CPU-only access
+    pub(crate) fmc_full: KVec<u8>,
 }
 
 impl FspFirmware {
-    #[expect(unused)]
+    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
@@ -36,9 +37,13 @@ pub(crate) fn new(
             EINVAL
         })?;
 
+        // Copy the full ELF into a kernel vector for CPU-side signature extraction
+        let mut fmc_full = KVec::with_capacity(fw.data().len(), GFP_KERNEL)?;
+        fmc_full.extend_from_slice(fw.data(), GFP_KERNEL)?;
+
         Ok(Self {
             fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
-            fmc_full: DmaObject::from_data(dev, fw.data())?,
+            fmc_full,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 479b97eed7bd..35169f3bc446 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -13,6 +13,11 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::{SZ_1M, SZ_2M},
     time::Delta,
     transmute::{
         AsBytes,
@@ -35,6 +40,16 @@ pub(crate) mod mctp {
     pub(super) const HEADER_SEID: u32 = 0; // Source Endpoint ID
     pub(super) const HEADER_SEQ: u32 = 0; // Sequence number
 
+    // MCTP header bit positions
+    pub(super) const HEADER_SOM_SHIFT: u32 = 31;
+    pub(super) const HEADER_EOM_SHIFT: u32 = 30;
+    pub(super) const HEADER_SEQ_SHIFT: u32 = 28;
+    pub(super) const HEADER_SEID_SHIFT: u32 = 16;
+
+    // NVDM header bit positions
+    pub(super) const NVDM_VENDOR_ID_SHIFT: u32 = 8;
+    pub(super) const NVDM_TYPE_SHIFT: u32 = 24;
+
     pub(super) const MSG_TYPE_VENDOR_PCI: u32 = 0x7e;
     pub(super) const VENDOR_ID_NV: u32 = 0x10de;
     pub(super) const NVDM_TYPE_COT: u32 = 0x14;
@@ -203,6 +218,19 @@ struct FspResponse {
 // SAFETY: FspResponse is a packed C struct with only integral fields.
 unsafe impl FromBytes for FspResponse {}
 
+/// Trait implemented by types representing a message to send to FSP.
+///
+/// This provides [`Fsp::send_sync_fsp`] with the information it needs to send
+/// a given message, following the same pattern as GSP's `CommandToGsp`.
+pub(crate) trait MessageToFsp: AsBytes {
+    /// NVDM type identifying this message to FSP.
+    const NVDM_TYPE: u32;
+}
+
+impl MessageToFsp for FspMessage {
+    const NVDM_TYPE: u32 = mctp::NVDM_TYPE_COT;
+}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -315,16 +343,138 @@ pub(crate) fn extract_fmc_signatures_static(
         Ok(signatures)
     }
 
-    /// Send message to FSP and wait for response.
-    fn send_sync_fsp(
+    /// Creates FMC boot parameters structure for FSP.
+    ///
+    /// This structure tells FSP how to boot GSP-RM with the correct memory layout.
+    pub(crate) fn create_fmc_boot_params(
+        dev: &device::Device<device::Bound>,
+        wpr_meta_addr: u64,
+        wpr_meta_size: u32,
+        libos_addr: u64,
+    ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
+        use kernel::dma::CoherentAllocation;
+
+        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
+        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
+
+        let fmc_boot_params = CoherentAllocation::<GspFmcBootParams>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
+        // Configure ACR boot parameters (WPR metadata location) using dma_write! macro
+        kernel::dma_write!(
+            fmc_boot_params[0].boot_gsp_rm_params.target = GSP_DMA_TARGET_COHERENT_SYSTEM
+        )?;
+        kernel::dma_write!(
+            fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_offset = wpr_meta_addr
+        )?;
+        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_size = wpr_meta_size)?;
+
+        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_size to be zero;
+        // it obtains WPR info from other sources.
+        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.b_is_gsp_rm_boot = 1)?;
+
+        // Configure RM parameters (libos location) using dma_write! macro
+        kernel::dma_write!(
+            fmc_boot_params[0].gsp_rm_params.target = GSP_DMA_TARGET_NONCOHERENT_SYSTEM
+        )?;
+        kernel::dma_write!(fmc_boot_params[0].gsp_rm_params.boot_args_offset = libos_addr)?;
+
+        Ok(fmc_boot_params)
+    }
+
+    /// Boot GSP FMC with pre-extracted signatures.
+    ///
+    /// This version takes pre-extracted signatures and FMC image data.
+    /// Used when signatures are extracted separately from the full ELF file.
+    #[allow(clippy::too_many_arguments)]
+    pub(crate) fn boot_gsp_fmc_with_signatures(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
+        chipset: crate::gpu::Chipset,
+        fmc_image_fw: &crate::dma::DmaObject, // Contains only the image section
+        fmc_boot_params: &kernel::dma::CoherentAllocation<GspFmcBootParams>,
+        total_reserved_size: u64,
+        resume: bool,
         fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
-        nvdm_type: u32,
-        packet: &[u8],
+        signatures: &FmcSignatures,
     ) -> Result<()> {
+        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", chipset);
+
+        // Build FSP Chain of Trust message
+        let fmc_addr = fmc_image_fw.dma_handle(); // Now points to image data only
+        let fmc_boot_params_addr = fmc_boot_params.dma_handle();
+
+        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
+        let frts_offset = if !resume {
+            let mut frts_reserved_size =
+                if let Some(heap_size) = crate::fb::hal::fb_hal(chipset).non_wpr_heap_size() {
+                    u64::from(heap_size)
+                } else {
+                    total_reserved_size
+                };
+
+            // Add PMU reserved size
+            frts_reserved_size += u64::from(crate::fb::PMU_RESERVED_SIZE);
+
+            frts_reserved_size
+                .align_up(Alignment::new::<SZ_2M>())
+                .unwrap_or(frts_reserved_size)
+        } else {
+            0
+        };
+        let frts_size = if !resume { SZ_1M as u32 } else { 0 };
+
+        // Build the FSP message
+        let msg = KBox::new(
+            FspMessage {
+                mctp_header: (mctp::HEADER_SOM << mctp::HEADER_SOM_SHIFT)
+                    | (mctp::HEADER_EOM << mctp::HEADER_EOM_SHIFT)
+                    | (mctp::HEADER_SEID << mctp::HEADER_SEID_SHIFT)
+                    | (mctp::HEADER_SEQ << mctp::HEADER_SEQ_SHIFT),
+
+                nvdm_header: (mctp::MSG_TYPE_VENDOR_PCI)
+                    | (mctp::VENDOR_ID_NV << mctp::NVDM_VENDOR_ID_SHIFT)
+                    | (mctp::NVDM_TYPE_COT << mctp::NVDM_TYPE_SHIFT),
+
+                cot: NvdmPayloadCot {
+                    version: chipset.fsp_cot_version(),
+                    size: core::mem::size_of::<NvdmPayloadCot>() as u16,
+                    gsp_fmc_sysmem_offset: fmc_addr,
+                    frts_sysmem_offset: 0,
+                    frts_sysmem_size: 0,
+                    frts_vidmem_offset: frts_offset,
+                    frts_vidmem_size: frts_size,
+                    hash384: signatures.hash384,
+                    public_key: signatures.public_key,
+                    signature: signatures.signature,
+                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
+                },
+            },
+            GFP_KERNEL,
+        )?;
+
+        // Send COT message to FSP and wait for response
+        Self::send_sync_fsp(dev, bar, fsp_falcon, &*msg)?;
+
+        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
+        Ok(())
+    }
+
+    /// Send message to FSP and wait for response.
+    fn send_sync_fsp<M>(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        msg: &M,
+    ) -> Result<()>
+    where
+        M: MessageToFsp,
+    {
         // Send message
-        fsp_falcon.send_msg(bar, packet)?;
+        fsp_falcon.send_msg(bar, msg.as_bytes())?;
 
         // Wait for response
         let timeout = Delta::from_millis(FSP_MSG_TIMEOUT_MS);
@@ -389,11 +539,11 @@ fn send_sync_fsp(
         }
 
         // Check command type matches
-        if command_nvdm_type != nvdm_type {
+        if command_nvdm_type != M::NVDM_TYPE {
             dev_err!(
                 dev,
                 "Expected NVDM type {:#x} in reply, got {:#x}\n",
-                nvdm_type,
+                M::NVDM_TYPE,
                 command_nvdm_type
             );
             return Err(EIO);
@@ -404,7 +554,7 @@ fn send_sync_fsp(
             dev_err!(
                 dev,
                 "NVDM command {:#x} failed with error {:#x}\n",
-                nvdm_type,
+                M::NVDM_TYPE,
                 error_code
             );
             return Err(EIO);
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f04e2a795e90..88b1546e3cb4 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -124,6 +124,18 @@ pub(crate) const fn arch(&self) -> Architecture {
             | Self::GB207 => Architecture::Blackwell,
         }
     }
+
+    /// Returns the FSP Chain of Trust (COT) protocol version for this chipset.
+    ///
+    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
+    pub(crate) const fn fsp_cot_version(&self) -> u16 {
+        match self.arch() {
+            Architecture::Hopper => 1,
+            Architecture::Blackwell => 2,
+            // Other architectures don't use FSP COT
+            _ => 0,
+        }
+    }
 }
 
 // TODO
-- 
2.53.0

