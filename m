Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6100E2BEC4E;
	Sat, 11 Apr 2026 02:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875811; cv=fail; b=c2RujAuvyhfgKH13FTHMtDrQBDAMy+v8r/l4JmQqgMz0FbuX1nMTAhLeGHAjrwL4iKhBWooFMIVEdKLotMZTrZiHzoRb1wUH1wE5k12UrdILAzbDP55YyNQkuC4UDaUpjAM5aX9t+euIEb5WD9muqyw/T9bUsJsrcSf67p1SiOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875811; c=relaxed/simple;
	bh=Jrm3kibDZl/us1LRz305RKuFB6SerstxVLgExW2DiE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mo7WJG87wzOrZX6b0y/C46Tq97FZLz+nqoA+A7lfNO/AlQdMG9pieP9kKOK8yZyuNSslPkPU5VIZTQab8Cm5bEEqWd9Qa6f8tvGtQ0vcn2a7Hqo2c6TP14iasrKonuW5Nls3RI2wiSGORGQdv8SYo/DTH/pjzvaQqbWXOT3E+m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SlpaCKYW; arc=fail smtp.client-ip=52.101.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SlpaCKYW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rc6Rq/NUetbcHtqgbIXa2e8FyT6l548xUhpVo4KwEFve6+dyrYWtNfCenXBfcOTlC5qXnuV58J1eiAqB+J2ZyW9qTM+/VjYYhxSh9SB3NnPPKVZzLWkLyNhzKUBvu/hFmyTy/V8VWvIqaiZpuQHZMull0q90R4bhE2M0aXLzeil9DsboLlFUcZtrVNsQ+zhzCrJGu4fY6di+5pVe3tM8+L0woppZ3JjI6eO/x4g5heiw+xEI7Tui87d3GkiSqXeoXiRR7lfLOst8xSrJb+BIoiFVQDD60tPZr4Cp510+p+lKDAaTgJ1Fb8kC+xjlX416JqIxNujyxfsM+YwsUfw4vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ilHz5+aI2kWgXHqdeYFCZjaZd+R/yxO8I+U0+kBp4E=;
 b=Gkm/4D29PucGk+uJpKBUpNXw+o4vyq+8PyB2LGcgQTpTthgsIjIJS90DoIrUS7vmisQzmgMDIAX+6oxoZMPhFvX1qGBnNhBMJN1+qnNpiRTv2cXZuU9LuZDhFRHfbmA0RIsLJRuxtMMCdM1wd2P52i3TxrD3EP2Gd/4z5AgnBJdIKIjlVghyxmqoRdk2hBWp18AmpnxNyFla2cDrbXABk7FfDvi9UB4Q325xjhHTTaiVZeECIIr2gstgC7IYdyW+5pfZLfpJ2Nk6tRdX7WcY7nLHQAtUz3JMG2jmDYJNL8HdvNEGeGiY4CVcRHWorGZDhP6OOTgg1a7ao/NWZCf0ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ilHz5+aI2kWgXHqdeYFCZjaZd+R/yxO8I+U0+kBp4E=;
 b=SlpaCKYWa//R2wHAEx9Fvl6XLVVCQVtQ/RNe0crthBHkRGt2iO1ls7YQRb03eJfDjoNNE3dk9a/OBjmZuVgWimiMdkEZJgXthN/yZX4wdvDEVGDsjTnJC5wU7NZu1nLhgYtfQZln5j2hnMp/rvEBiXtOuKJq1dKWdBiSo+gSfUtm8SqqUqShz6pM/jRpKgnvl5T8c4NMQB4bCJXm6zSgw3SeuUY78/4rIN+pTRPu+dAkGo7nueAcgoWH04pqXLJHDcOa86h9+DmuAWuSPomrM1FQHzdly0TLa2gFO/TRuGhHzK9p87oh7ajUG4sFVAzb0xZTgdD1SAA1A+duFKICMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:50:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:02 +0000
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
Subject: [PATCH v10 04/28] gpu: nova-core: add Copy/Clone to Spec and Revision
Date: Fri, 10 Apr 2026 19:49:29 -0700
Message-ID: <20260411024953.473149-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f3c6d81-b431-4877-9c16-08de97750700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QVOrAbA4z/1G+8QrSqddZhUj37WqorvWS4v3TNc31Wgm3dprmm/CfLJeWRxSHCiyQXwQ2ptxm4IqBvai0a2F6Gp41OmwwZ2CDI96spTFTifvvgCCaaaF4zpre38R9n8S4me6YvPFuJPAiKmezmWyKeDpNuMaNFIz2satww/QHsHyL4iKQyXWcMTNff0j4/puBuIPDskdl3/EEcwidj4tqWwKAsF1AiBSoDtBb5NvLyvo/lFVl6Sfwfpcd9yfwfsDmdkBOq6D7sXG0LRqtr4ndP486yBvcEbZOT1gGY4dtQL0eUkEtuaSrMAMwCbMhtZfD0xBUgoCuWOtCI3dWCYdxmYqiSs72BM2Oyyp4PiPEQp8QpujsFchKxzzrVSyEasSX6sM8AfMAuJPeZE1XDJ3HEz7Y+oP5sVEn/S2gypMn81fhzXi/DVJmUEyg/Q0poXjudadOF2s3Zr+1SdoTVu4YLEJ4ZyQMrlY1Pj9S47asNR7iglhmYFzs07wr6ymaWK//DWWOzI550uqG/fnrSVZWPnHXOtQi6VWIHyXOzxkcLHQQAYRenIklqNbwhUdw6WZ/YBuoVO6Aa9Hi3v8YAjijvMWALgoAEyN5rX0+gWxK/qg+Ih2flPYFej9HKQTlH6Wm9Uh6Jc0n7CPyZNFKCBmndRnnKYh3sAmvxhFAqu49T9kgOgmdDJVnqFHqSf27Md9IITRl4rNWGfvLSD9sUnT6YlHLjqsaAHph7ngCgy9ucY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VDCN5I7e9TEDLX0u5ck/sGa/LBv5FS/f1XBKhUu+Wm9/maySdEVM6BtX6zLA?=
 =?us-ascii?Q?nsE809K+3mlfMx3hiv2NSNQysU3g1mI7QCR3aiNi3nH6pd4v14Ko+/sqLBwg?=
 =?us-ascii?Q?jRVj/4A5zBwPOB5UYrUZjh5yiFWoUngbSk5iMNQLRFGNeZMvsXm93bopY5II?=
 =?us-ascii?Q?eW6k1IDw7H4LW4hQPlQRf6dwJKyutoeLFRhlFQsJ8GN4aVPd8SqTq9mJSPLc?=
 =?us-ascii?Q?oj9VxkQb1drPY7wH+Xv0ra2QKn0f8TIYXNYkSHVstVN7jrmcY1RqY8Fry0jw?=
 =?us-ascii?Q?B/ERetuVHdf6E5uoYyARd6ozDZtb9DqBFm4PaRDTkuJxSDe2Pg0M2fQNdSGq?=
 =?us-ascii?Q?U7B3yNM5uArITiS0/ob+LNf27ZoshRZSo6ZH8xFvN9otp2DTfjoUjWCYe8V/?=
 =?us-ascii?Q?21KNqcnvXCDUB1gL1joDdqMM8ezjCSTlUljZuiBC7HrRcQirhgXdDtp7ZWpj?=
 =?us-ascii?Q?aGdaOrof5KJiiY3TeHg0KgEe+ZenggXrzX8b67/+sBQA8IuXqsP71fbwzw9t?=
 =?us-ascii?Q?NylKeXksRnjh4ZR7/IvlbcUc9fmLfXw/EyIJULMfKTyWxPrZJ5EFnUHh+CtK?=
 =?us-ascii?Q?USONqe22Av0qR2xeayerOPoqKPC/axgQUQcDyOJNhUoTgK1piiYdxIQMOcye?=
 =?us-ascii?Q?WPp3wwJPv5hRFQmZAlgk5v+46UvX0xE5TwPaMhQT4Kd9N2g2P2k9Ia82V8wo?=
 =?us-ascii?Q?K6IZK83g9IAEXPJ1HRQZbHD/wWn+4WDBVbqGZPuBjHpTNMMlKVsOY3iMlIUQ?=
 =?us-ascii?Q?6ulcpdYRs7Tt/zAYg26g+HsVkh4DBta/5/Hh3DwIV9feE0K0I2hpc7ouedPA?=
 =?us-ascii?Q?ta85EgWZm/KuqZeqDAm+YnWz73HIlMCFyIo6RoN4dD5sTJWIYoxoesTONXFg?=
 =?us-ascii?Q?CxWqKIx4DnZfy0WiGOVRA1pEiITKJLMfOmBwvRJ6cDadp1e5Jgb/nuX8MeBL?=
 =?us-ascii?Q?68cZjBe/gJKnT713FSrv/vh1voelZ1UOQMqKoJhCUG8sbZ6k2kBfyGbtDzvm?=
 =?us-ascii?Q?JpS6DqRFl7V2L1hlV8+C0EnqineRKUACw5H2wGdEgRW4g0deaQ6X6AkRLwyd?=
 =?us-ascii?Q?cVDriStuLalo8CUgRaty5aOycU9345ugGLPuNVJdczV3TMR3RApuMF4OIeFi?=
 =?us-ascii?Q?wff2DBAvFd/kdr8wyGXkyDRkyiKeh95M/1sfajEARVI5IPS6leZe2XRcRXRC?=
 =?us-ascii?Q?EGPvAPWiwQtgrtFZpzW7g2sJX6p/tYRko7LwkJMusLvRtHUqvbN4bcxi59LJ?=
 =?us-ascii?Q?eI3eZG5lSE/FIzDcF8Z/UjrMA+xrNw2+YFAb+ynT2Yk5Fj7txlziRS/YA1cg?=
 =?us-ascii?Q?go5/T6de+uxTPQwV4er33mnGWNhAdpJk1lMFTNwYxfNkG7hZofG9P5GI+69V?=
 =?us-ascii?Q?0RYVT4kQ9U8ZXOOeMxBjdDNjnqdz8oUGvqX4T0/d811BFKI52wA3eC3GHVcX?=
 =?us-ascii?Q?u0qQNzijA1njHlobQpcWLH2/Rcm2vXcfiSoH0VpeOjL5gh4Wdck4CzJ35Zuc?=
 =?us-ascii?Q?phu3wXQMlfQEEiXcAxmovJigD1jNNuP087qmxghVQAyPvxV+VZHGL620fyxK?=
 =?us-ascii?Q?nEHUvEzWz4IdT+Nw06VsuRuH+NKqli7Q5+H0mrj+qIdqNJCvziXW2KROxSQ/?=
 =?us-ascii?Q?ILnJ0NxTOwoW9W2Je9/Sy63YxAriFASDSMdqammFaMrNnQ0c1MzgNQdOybNB?=
 =?us-ascii?Q?vNymKcXsMcJyZJGdCEiVZpEKSjvMvmD8ku9uKzyHEUKtnRtpBtP/fadp00Zs?=
 =?us-ascii?Q?i1/r2CUewA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3c6d81-b431-4877-9c16-08de97750700
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:01.9947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGXHiQczVls45JdVVe9khi8uwbr+iwqN3N5R7wIsP5wJhh/ZFTOD+b6E8vT5nXlepB9fARuxZpQ8vAyB+CYf1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

Derive Clone and Copy for Revision and Spec. Both are small
value types (4 bytes total) and Copy makes them easier to use
in later patches that pass them across function boundaries.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 20625e8e26b7..4cf5e1ff830b 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -159,6 +159,7 @@ pub(crate) enum Architecture with TryFrom<Bounded<u32, 6>> {
     }
 }
 
+#[derive(Clone, Copy)]
 pub(crate) struct Revision {
     major: Bounded<u8, 4>,
     minor: Bounded<u8, 4>,
@@ -180,6 +181,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 /// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
+#[derive(Clone, Copy)]
 pub(crate) struct Spec {
     chipset: Chipset,
     revision: Revision,
-- 
2.53.0

