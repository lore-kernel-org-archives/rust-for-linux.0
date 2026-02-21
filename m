Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DEA31ED86;
	Sat, 21 Feb 2026 02:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639862; cv=fail; b=aQy4s7pOFGa/Gq5sNAiM+P2xC+Co3u9e4ZCbmCq+AB8GR+uI2V96dZJq0NESKebbXH68fRWHw9nIeDj2Hi/oBnh5s2pjGAgZvNATLW2SQM2olK18FJWzKjcLDAk2iMGbabUfQZcDC9w1XcIuYGPUNX+wkfMLjsz1cqGmc4750fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639862; c=relaxed/simple;
	bh=9Vjz7b6cYxoJEtzCGYKGDuibMFoINIkP9nEsbzXb8oA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PsGnQZv0Et5+nF7pboMrdvMjnFk7s+CMiKdAperRH2s6l9OnzWD0q8ejqhTNwhtgjH1d5flUU978tA7mBY5AVqCiLBNI4KZYveIe43xSOu5QNdNif7Q3G/ZTvWMeXiDQDSMPwQB+AywgyC1FP+ga/UcwgMcUKHg7Ab5DgDfH3Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KYvvNM4n; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KYvvNM4n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgfnTmKqWQERsTmghBpQpiINuZR6uzmrnzBczQAESpCr8eljvSiHo7C0g8xjfI/bJe02bGEpx40SsG43/ly4xJrNlHmVuzeu07ETNgIEJ8u8ZvLAsCNy7nddqs/zTKu8fjdty1xKjI5+OJdnwWWH7GvuvedRKOf9ExJDVHJ0fkWiolD364HRdnh7kM/wb2pVv9dFvVcRcJotyL9ATO9RMycrf5YF25LS2Nm3CtVWM+VnlFC+Sl9AbSaxsRmNkyzsdpYs96uCS1YaFQyGGXfiGg/J24vNwDU7Esx8IfbB/Jj0VThSCzpGH8+62LF3znp2AgnjvPGy0aeZ/p5WSOsZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1inqL8SXzuatt7S21l/nZA5wmzArFoR5Qr6PTj4leLE=;
 b=xDbyuR+8FCsLnWvKlmcD0IBhcQSCVWnDK9Iie9AMP5g7SERqz1Zc8spzvt+6bDKn/ez7aT+ZBwnzQuREXQNpeXFV0eXfir3YDf3v5z95iwHTZZD+E/B4Y+CNhvKOc3kWynMx5w+2whzq5ekbwqmqIqQPks1zIiej5bMCfeVNHgdVslhvQ+rzQnh/2n3bQNHlv7cUq9dapqmuF0t2k2Zjza9xklROpSZ7eQnSyXkqa9fMR1+ykihVObZ76CwK6bV9YMud/ENXlAKWaKmPVOOFC01KXxQGaof2KXe+QdE/keuphDgIerWsqIaBdVBJ8rw1qj601To5w09cv+uR6BGnlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1inqL8SXzuatt7S21l/nZA5wmzArFoR5Qr6PTj4leLE=;
 b=KYvvNM4n839IJvboWQekDd2Nld4zPIBMjY61ODavrmjhtmmZ/yQ1Vpcf4PixHhOmLbSS9I43nuygRJPuPaBgFNlRBMKL6+LhrwQwuIsGalKGhIrwRnwR1SR0jYXPMb9xaA9mORuSvF7EGeLrq2WZjNVWv3SGyG8DB7FT07UyLixRyWsiJ73dqzvcNuUueldlmHaNm9e10WSo7QaJ6qmWHHgxDG9fZ19H/vVKq2ujuh2R9pNGnNYV4hZwJu3G4AbCoDsC94az6b5soSjaUv63evkgBP1ukkRCSknG56F7wtNt5DomccCChlc/1CQTYGTzjiT45zQyOb01n79uqyk/jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:14 +0000
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
Subject: [PATCH v5 16/38] gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
Date: Fri, 20 Feb 2026 18:09:30 -0800
Message-ID: <20260221020952.412352-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 861c7e76-74a6-4d69-21d3-08de70ee598b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IICXPaWGRxvHTEKGosGON2emrRGo6UhGpV1UDpfxiJmbSqIXog62RNqj1MuH?=
 =?us-ascii?Q?qLSB7XVUKoz9Q2Qft1UKVWEHyZzAkg9VQ+3rRvSLDB85oK8seq64iITCNiJO?=
 =?us-ascii?Q?9kowUcA+OTyzqYUn7jxgN3rDetr+i3pbSkiqZetNvvBUYCCr+4hFlmIJo570?=
 =?us-ascii?Q?4G/TrR5/XmUkUet5kMTZceJgcI57zslOX3iPycfvoCMX1kw2RQ1+gLu+wvha?=
 =?us-ascii?Q?ZXiFgbIuRQ7IoJnqSrLB8R2N06+NjSRdQZBtPqYRhUIIcj0xctQ0C0Ev5piy?=
 =?us-ascii?Q?6beYAXL6CTp9TtvA4PWuwVAmX1Mg54i2kPL8UeV9y7EAJOTnOxE3AEexbeJP?=
 =?us-ascii?Q?qAykXcVMa0rCrVeKHXeVzgDWXX3RH44hgxiAxKjMEJoZTK4sbKkozhEzG3oF?=
 =?us-ascii?Q?tjZQ5E4oQ23tVDK2em0qoqvzYIls/u+AX9YAui4GwgLVF7nVYW95nOe+KedU?=
 =?us-ascii?Q?d+8vHOq7d2nZQ6h4ZLOQ947EyKUgbWnL7Bm9sW2odXpE1PMkw0nKKeoaaKwz?=
 =?us-ascii?Q?D6V5iOrwUSQvgyrr9SoKhH5GdOfn3LoWZrlFZcbnb8L0dtOo2lTNr0lB8xDV?=
 =?us-ascii?Q?NAcRY2uAOiWZSp5jZ3UZ3GM/IrwXwGHYpervMayjUXb8C9eGM+opwzIM6Ixe?=
 =?us-ascii?Q?WGHO1waR8nbRX1qz7mCk6RXwQ3JxQwsShBNL2dP+/EOUX305jf3HnFzrv7mq?=
 =?us-ascii?Q?uuGybZMF6naM0Fv0anS3ZKKMmygjATfoucebED5IRHC0iEYuwInotSR3VVjP?=
 =?us-ascii?Q?aUeX+DSDALKoOH1BCVfMBI+sOdrC59FVfTv7PG6oAumeQ3qwsPiKp4Ep0I7u?=
 =?us-ascii?Q?wcCLJIISgoIsNTetnh9ZBfDPLy4ODe6kg0vhlTT3o2MilvZrYv1umlLNS+eo?=
 =?us-ascii?Q?pVGJZfi/+eQls1jwO6qstQ0cnxdUGFSmANTeJ2+AIF/QjDeXAvSAuatzBtyc?=
 =?us-ascii?Q?BaEcUg70IOms8J7Z20CcR6hWy7JEKTSQqCCeEnlDGMs4fk5AZ1/YYSQkT3yT?=
 =?us-ascii?Q?Q6htQgC1fkJ989BQ05eVaVCMLUcwZKNiVFV8ZcLwrVQ+fl14vASI72mzyomR?=
 =?us-ascii?Q?ZG8+M4+WLwDvB2i8KIKq9fBh3ObJ8Isg3Z0SasJImp38alanKAWNT6S3k4mA?=
 =?us-ascii?Q?xeK3zKqZzPSw8316vgWXSqPQjJUp9Dfq5DfWvpZX+ETDc6ThLCoAATT5dXWE?=
 =?us-ascii?Q?dBtfpW3xki9hamU6gpAeHd8Y0SKO8zNbBjSSa+MxL0nOmTmIOR7I1wb58Smo?=
 =?us-ascii?Q?Yb1AzPFUL6Y5Rbr3AbkmGl9J5PPY9J1cbziY2kIAFQtEG5GFZ9nHKUllua6I?=
 =?us-ascii?Q?hWbaMeF35OJ2myYMoH4EpVRho51l1wacCj0InVdcYhzUpUGFBf9WfWbYTc+a?=
 =?us-ascii?Q?yIMnvOfk8RTwsC2UXFNv/yYIfMHT94d+rJMEWz4Xe0ThSIXG9D44PXsRfcXc?=
 =?us-ascii?Q?ynCqDOYSVtq7kQB5Mq4J3/TKUvT5sRTcHXJbrM+hJzd1EJHrILIGmaxOxhzZ?=
 =?us-ascii?Q?YlebQE+s3AEp/xd0yEDRFLkSltyWWhQNII43ooGocT3cnIysV7XFh2tptHnT?=
 =?us-ascii?Q?3EWgfakLi36qPgmLP64=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6DSuqMWdII0uSXz8D54nMETuPA3/B3pFiHvGnjQ6uFknBWkqTcMOeWe1jbea?=
 =?us-ascii?Q?jN2bI7CVyX9GZh3ye4DPXpp84qu+uVLVOe/NWaOS1RCmN1T4akTHrtpLCjMm?=
 =?us-ascii?Q?0BdsnQDzh+JCHp+P5YLNrIkLLYYG96adAq4NGNl77f9Fl1KpCfwKww9XP9uY?=
 =?us-ascii?Q?T4ckFsWA7bvt5u1WakQInFf9IWCxVhM4DB60/laKr07HIeNfsZW/WTSKiY/J?=
 =?us-ascii?Q?zzHs3QvYZxWVhcETFTrLSLf31FCwK/hyOQthp11Y+lfyI/UNndHuWNdInH4m?=
 =?us-ascii?Q?Emmorl/2fU3iRJYX+k1EVPIJs/jVsoJbndtnY3HnfvPUq7Z3CG9ZA2k9bYzC?=
 =?us-ascii?Q?QTgxRo20OVAgWN+nqux2MC0TwnJW8OkTGoAW/XxOPKgYtj8zthxQA0kesYbB?=
 =?us-ascii?Q?vRis/49RVDkPQUG+Fp0qQRT6BJPT8A+V/RCoXN+n/MIVJjtNgCF0ECLJ9x5R?=
 =?us-ascii?Q?dK2DYuYAOT1CyTCfZYUbSxkc6r+Ym4Ue0q8mUSi96zT6wf6lzcOQkr4MgJ6q?=
 =?us-ascii?Q?v7ZCNWgv8yW5gYypHO6ccQ38YoTe60taVl/+iaBlNwxewlvK10aScM9CdP1j?=
 =?us-ascii?Q?xyCjXV1YukYZPHwOedUxiPUZy+PHoLpQOPmpeG/XT34XoItKUEeVgVsoMw8a?=
 =?us-ascii?Q?pJKlAWKFe3AwRMp7LGX0E90RxH+Dn6KGcWWJOE8lCf/rSunfBmh1FRRpQkfa?=
 =?us-ascii?Q?njG9r0kLk1EdoBJ8vcSh69Zb6xBjM+nJ0Jw/UCV9Fwz0izAp0hj0HkUa3TIw?=
 =?us-ascii?Q?Br/W+gPMhFntePs5tCHZ4kf87zq7BTH17SAnPtuv+X9V02JtcO+hBuzkb1Q/?=
 =?us-ascii?Q?iiwF6T64EHZrAQqCwUdQmTLgN7lHnK7RmYtpYhIUgh6H/EPhabms6nfXEgy6?=
 =?us-ascii?Q?ad+/q2RkhN6SUNkmEgA3DNUB6MYl7hwxVahOk1v0xh5Yb6edhteNeoqrKRh2?=
 =?us-ascii?Q?5kBWFfFH3sOSLrElr9TPmOXkKJO/bxF7YnzudnqIGAhhbOkdO3RXXf8lXGs6?=
 =?us-ascii?Q?5BdVyhTzk4iaPJvbcRum11mXsObEt7m7mFOI5DXVUQUxg50kdI198x9vn9Jx?=
 =?us-ascii?Q?0OH85R1isDOGYiK9TSLAIFlMDXb8X/J881oPwWSQ+guYQt2Bo82jx9yI7URS?=
 =?us-ascii?Q?Lze+8Com1q1G/Hd/JHpR9HisqB17NeyBxOqnD/SnyEutlrZ9v2Bprjm0i4Ly?=
 =?us-ascii?Q?1Zyaap7XotXHL9mTcIBe6WxJWrWUv1LmMZCS60Tjcb5AVQzEzJ33LjEbm2gC?=
 =?us-ascii?Q?i5DAzAI1wO0qazFdcFBmv5C3OqWfpNbu26emJoF/NJjBGyBsF0COqt0zHrSL?=
 =?us-ascii?Q?xQyWkrM7xNAtK6bTs8NG2n2iRO91Uc1+HTp7r99rVIoloQCXw/Tx6ZFM7aWr?=
 =?us-ascii?Q?ASnR/uj8PBoH3wngMI7+hAuLr7sXxAaid/UFvWW+UXrIi0LrIFQbbxT3OiRs?=
 =?us-ascii?Q?wUsY1S4QeTCPQN7e0NheO6wgbXtN/IzKpz2ewFYK8SGwIH8iAfdvz49yjqvO?=
 =?us-ascii?Q?WGuFLl/NAGklF+VAmMO3govqaTovuDaUyNsFJNwcWMg8oCiO8Z7bIKsEv2DA?=
 =?us-ascii?Q?TuqUdJ6oNQt79VRy+KzEaWh225+49Em8XVX624YrwnhOe8HZAhZf/gHIuXIj?=
 =?us-ascii?Q?gJBlEr6SNSTizXvu94iGV1Yki+EFQI3wMvdhqsQtYLKW0AZS4hCRAfTqHW2a?=
 =?us-ascii?Q?SHHOVUMeb69piy9h5VHRJga+R8ennQdO+skoOTcE7gKDl6/FlmdO61dtfeK+?=
 =?us-ascii?Q?D5b8gxLJBg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861c7e76-74a6-4d69-21d3-08de70ee598b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:14.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EA6n/wvF5e5b93Z9oTNxLvDdMweAcbRhV6AWhRvY8hAyrWRMB/+E1uVKW9Lw+vR2w33o0EBHUAVoT0RLDXSD8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add elf_section() which automatically detects ELF32 vs ELF64 based on
the ELF header's class byte, and dispatches to the appropriate parser.
Switch gsp.rs callers from elf64_section() to elf_section(), making
both elf32_section() and elf64_section() private.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 20 +++++++++++++++++---
 drivers/gpu/nova-core/firmware/gsp.rs |  4 ++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index d94dd3468f3c..57a919b7e0e8 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -596,13 +596,27 @@ fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
     }
 
     /// Extract the section with name `name` from the ELF64 image `elf`.
-    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
     }
 
     /// Extract the section with name `name` from the ELF32 image `elf`.
-    #[expect(dead_code)]
-    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf32Hdr, Elf32SHdr>(elf, name)
     }
+
+    /// Automatically detects ELF32 vs ELF64 based on the ELF header.
+    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        // Check ELF magic.
+        if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
+            return None;
+        }
+
+        // Check ELF class: 1 = 32-bit, 2 = 64-bit.
+        match elf.get(4)? {
+            1 => elf32_section(elf, name),
+            2 => elf64_section(elf, name),
+            _ => None,
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index f247deb06633..52e7337c041c 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -105,7 +105,7 @@ pub(crate) fn new<'a>(
         pin_init::pin_init_scope(move || {
             let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-            let fw_section = elf::elf64_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
+            let fw_section = elf::elf_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
 
             let size = fw_section.len();
 
@@ -162,7 +162,7 @@ pub(crate) fn new<'a>(
                 signatures: {
                     let sigs_section = Self::find_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
-                    elf::elf64_section(firmware.data(), sigs_section)
+                    elf::elf_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
                         .and_then(|data| DmaObject::from_data(dev, data))?
                 },
-- 
2.53.0

