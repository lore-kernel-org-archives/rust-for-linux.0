Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E082D2EFDBA;
	Tue, 10 Feb 2026 02:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691600; cv=fail; b=GJWwH/Y42WvG4xFdqLs/S8vJNTetOUeGM3zp6CmmLcRlvfHOQRnHB48Xkkuld1+b3u91JNbcGFbOrJpaRjNitpsc8uGgAsqM4Jcik3xJ8upDzKPu52n+PcOUqrhQRsRl8ZYOt4/c2pX5a8MWJ0p3l1A75+KVo8mYLsMR5vKzjhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691600; c=relaxed/simple;
	bh=x/C7TOTZh9P2BqVw7F/CpBjhEWEk3HRTzmrQVDsl5dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LCCP4dv5zQhl6G+wci1xhi2sfpvHvDNSPPd6c9W7egGFBOovsPC7aRXVTc3qg1yl72rVO92pk/qsBJibNkoukl8j95fqk3pteMt6sBSm0tGZgmzm+2MmgdyQ8+0tumCDTy4JaEBlC1SVLs4AD1IQ3rCE42UXJmYwBRBUjB9QhZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qQVE/Mr9; arc=fail smtp.client-ip=52.101.48.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qQVE/Mr9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaojU6raYCYzFTpNBUgsrV1M3iFDTb8w89LgYPFWbjDbk2to21Bk8pHMF6lHXXMXNn++Zd1FGw6C3yjb6JTZpjGEl49L95xBOxXM2kFzkAN+dS1dfBvrNMzVeNLrnl6i/HYoQZoUMsq/qfYfFmoWwp1Xs+QO3xDdg3STmNTk5uqP12iJKCwp8gcxp3wk72gRZvybgVHdo0jFwc7zZxIrKEjzTUr9ptJFUw3E/tLZohe51l2D8llkPYFYySUpawVxgsdGiUbEVe4m2aMEnjwG1MosCg5Kqf39mVwSec4vDlp02uOF8OFf1x3svACFXs6PKzgtTYonRBHEh2jNcfsaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKqQM18tTV2pzZJqoEALv6IZvph2JeB0lYSocisCng0=;
 b=AKUe1lNP/BYR2LfVWW1d1D7vjyMPa8zamiJG5l79OB0GiEGqHwcHkeXab92Dvq6qlAELXP6uWYPPWD5gmghcZuK3CgVFYBkET9cio3gSKHrrFoG/v/l3hT2sOCYZUemvHW1RJgXuDnhvmxnw3Ho7PyHhItr3C/ZLYhln7IxPVUQuzD5AMrNrRGYSH4naf4hq0HkfUXUkp9qXErlw/zYCOoc+nJYFllcK/3pN7XBDM/bpwfo99p0/kVem21IFUdI2vp42c4sVX/qLv7lzrvkIC9qbkKiy9n9XW1MipDZXwb6bRNrbwGk6QVY4ixV+S6unrAihEwbkABZ5+6x/yzWAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKqQM18tTV2pzZJqoEALv6IZvph2JeB0lYSocisCng0=;
 b=qQVE/Mr9e3tKfA2/zgAfRzH7S9MUKFpwabpwJdym46YUf/dij/G0EjzPhie/Uiisfk0Ps55XWrLUeS96xFFlihZA3DF9M0skIqNxeFSjOIG1iBqzHYJIP87bCZ2rPJPkbcUSajV1dZ6TNDFlagDraz/A55j3Ht/4Suf917KyJYv0e+rcsANU4UJcpxhl0fGWklIp37ITzZ8AA480qsmlvCmSrGl0V5Bjk+zWgS7OvAu4ktuMoOtJkZ0HjstOlPgpeSGH4HEm04Jpvc5AN8PwTD0gU2BAQNqIcnAWoHssk6ktmtUkatcU4etNtJVCqyV7gdgMXpvuee5QvMqr7nVALw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:20 +0000
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
Subject: [PATCH v4 14/33] gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
Date: Mon,  9 Feb 2026 18:45:41 -0800
Message-ID: <20260210024601.593248-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: d8fa1259-6da4-4528-2f90-08de684e922a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4A2f+m+7Ttzk9tkeuwHF2n4gUTwFXXUrcjAT9Yceb7ibkPZgRAYgB14GdKuC?=
 =?us-ascii?Q?4tgeokDaDCuhLy5B+14zpwo73YH7IIrw0geTtRasPiZlOTmchGTc2liBzoB7?=
 =?us-ascii?Q?ENrQQwHpQm+JbV1RNIRekkM6vkxfwkosvuolqcyJ5vUW67L6R78Vyu4UfeIE?=
 =?us-ascii?Q?YgL4u+2dP+kTesE9QlnRBauNoncWUnYV8fT/j/i+eb/hmmNOAO9ypmitalrG?=
 =?us-ascii?Q?WkVoeOPcsQc476llk+W5T9VQ6X5Qi8oPCCfkvl9lQtO7bMWTW3FC+1h7ItwL?=
 =?us-ascii?Q?ahBGGuD96YtRyH0CEDryOpCeif1CyAcvMSOobDZPgrCSqFvkuOxqQhdWlzwW?=
 =?us-ascii?Q?qIgAGcr2Vcp/hl6R0sVzUCE8vujCpAX8URUX/rxIwM80SGeU2SAfIoO6nGSs?=
 =?us-ascii?Q?dx4nLhrwk80wMsdv8vWn7YUcFtT2x05sdPOtF5C97PBgjmqLwYBnEXBXu24A?=
 =?us-ascii?Q?SOHt/fDZrHl26O/6ZBrEcI5FmN77a6wNcqITQw+tqLvY7Tp5NroyfCcJNVbk?=
 =?us-ascii?Q?33klOUF0oIbaab/xXvebx1pRdaNc6uQKgI4uqjshRGz4165NSW1lVXp4atYO?=
 =?us-ascii?Q?J74rwvN2PZutLeMq7xGCJe7cU6M1uS0uolzWk+pIR6Q9DJ1u/v3hemf19fR4?=
 =?us-ascii?Q?130UNvePVVC4uu5zu4E1IM0B7jOUlQ8aODpmeRh+Nw4CZHg3Yh2LJMDhIJgv?=
 =?us-ascii?Q?we5bGMREwH8bWKG6g56ItoXPo0l83mbOAkXn6C1unpanT6/62RU6BTmLsEf+?=
 =?us-ascii?Q?pIhij8s07kpYI1nBVf+BkhN4oZNbIL2a9CRHmrXIC7iaoIynlqUeeHRdXS5G?=
 =?us-ascii?Q?syilgWCnoaRjfFdvtTriNeEjIOEwoSuzSnHAwXB8oTVJr8fputMdIsr/GQ5R?=
 =?us-ascii?Q?wuYvzprT+B9dx0hXVfFklCquhUhYWcAl8dgFoscAOkUrS0yHiE+/oZQtz9oq?=
 =?us-ascii?Q?+iF4QJPRFuJWdBpYvtxL7fOlQaF7Q+4gm1ITlHohHkQEgLFsNZ0BxaT/TBFx?=
 =?us-ascii?Q?eI7t2h45QbqKDRsUrVUDq0IEYu3DJ0yoM0/GnvzPwai5EIY5gT1bA4vIlwt9?=
 =?us-ascii?Q?jKncMEzPtE/BF4IbC6cDvh/BmlpYTUg17Jv8BXpuLuxkWPef2Z4OntTcGdu+?=
 =?us-ascii?Q?Y6Ua259AKxfYw0KTB0DkZ723cAnN55JqkF9TX4QV6iXn4NuTcapKvcXg95mz?=
 =?us-ascii?Q?/j/MqelQbYLY3otE1x+MeM55FNVMKZeQ3FKGX0viwfji2wIY/+FDVTh+PG9P?=
 =?us-ascii?Q?xa7FOT6IWNETGM9HwZc3wOAhkN4WVArq0qnyHfuYYuiWZ9tiOeMrHB50+kB6?=
 =?us-ascii?Q?Umd6vG3cvXKcV94CAPKZwOX6VhCVoPbjCZQrOa8PGo/VBW4anG5vq8ZLZOAy?=
 =?us-ascii?Q?kogYbnP1qWwIuhe+c8f8c+hbZof1T8XhWQqAS8iCx1KgPQ2jGQSa/Z7FxnPT?=
 =?us-ascii?Q?MxaZIfMqFv84pVaQOhI+o7Rd/IGzrrPdyZqAdJl4vjLD+OEHwBea39bt+ICU?=
 =?us-ascii?Q?nDJ6kpNFefEwxQKUNNXvCz7xVZs2nar3vJWn5Dar6JI55EE0r06XXlQlGB93?=
 =?us-ascii?Q?GystV6BOASNys5te/VY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4cjfG9xJ9m8YS5E7kS257nnHSjCMiAFGnWho4/tN7k2zYB8EOpsickruYIoC?=
 =?us-ascii?Q?7kjQGsbMQmmVtk7a6dCdR/IbKmHLHubMIxwmiHnP2FMu4aAfC/CdOSYmDKfw?=
 =?us-ascii?Q?29h/pzRWpbxoBxa24o5CLa8tCZlv0ioaB+LhVLmnnwWieHPNwSKjAZ17TQLl?=
 =?us-ascii?Q?bp6ZOTh4GMDaEEDHyemzZGwwVUu/wXXHerIYR/18HH8SBK9JHfeuh5+7CW+/?=
 =?us-ascii?Q?r/TOMPTr4z1BrQysf7Ie6He5NgscIe6ZQhKOOoP9KFuEkBpTTKsJhOtcNwlQ?=
 =?us-ascii?Q?Kvvgt3EFauGIN4kxiDoHloQFYJ0+CdyPIfOsdeSCxoEuTMa6e9nbWgYL740t?=
 =?us-ascii?Q?N+dwZX7GcH3Tg0ngWArlIPVsZ8ETHWGYqTB2yKZVFPWE/uklSzbk/wtyBvv4?=
 =?us-ascii?Q?ks9yJTB6feIDa/iVk8cr9QUlCTk+qgTwsBLP57QES1Hlsw7uPTXna4D2dsmO?=
 =?us-ascii?Q?xv7G7/0buxoVIv5tRDFJr7oSsvWTPXgMa7jcsf7gd9GzebP/nlaBq+PJRQwg?=
 =?us-ascii?Q?dQwE/YEE6XTkouNg9i/I2d1ImNazAGIFvzlE4nzJp78vDFxmQAU7MnWModVq?=
 =?us-ascii?Q?2SFilX1f0aGUVhbTKopQ7vs+11++xzv+1L/3m5zDyHh2IMS1oA+a3WhfqkVt?=
 =?us-ascii?Q?Co9UiDRJF4VZu5WetBF3+3PwaXbMxFuftydYhbWkP/PuYt4rSA8A2y+OvxiE?=
 =?us-ascii?Q?Pc9K3zobHhm026v7NR0pgZmgfEvb8GcowNfAcrn/U16D81N1iklb+PmZ9WzV?=
 =?us-ascii?Q?TS9pM6C/r5y/oZayrNYdnyGYXdZ0TiQFWqPNUZHUxtBhUpOHQIecym9hqwSa?=
 =?us-ascii?Q?dTWjI6vFvYO7GFavDx4lZVXtC+GF7TMGMHy87DF1steKlYoJ0M8zm0OGfhih?=
 =?us-ascii?Q?sTXqvPqEl7G8KeLxLyn8bOZF315ipXIMjcQGGCLhm9JSef26dNcIJ1FzXQ6R?=
 =?us-ascii?Q?DAWBgnqwB9a5AUc5qHSzEg6EUyizsC1jZR3FdLpVEFXzg/KZ/XxRAlyh3Z73?=
 =?us-ascii?Q?Nj05sURcN96xN/jowngwnxp2F7YuSpeDqmUGgq+Wy26GXww+PdV7O5CxPvXT?=
 =?us-ascii?Q?dfeJpICocOH+U3lu+COP375LsBMVLlgzMdyjrA2jR68oPvsoEpQ2ZXBsH5ku?=
 =?us-ascii?Q?bvHpKbAuPZWGpZjXWF/d7SCQ74oGpeSrpltCJeDgBI2y+HLAYUPK4YoEjZFV?=
 =?us-ascii?Q?U++DICmiIIk/Znd6F1b+e567FhO3WIUdTUx0fSY9+RYBXueb2foRoglW1UNH?=
 =?us-ascii?Q?zcA3rvAfzjP4QxrxyemFet+7KfS1X2oAtFitVzM+zbhhqM/0puZTihfXMDFK?=
 =?us-ascii?Q?CTufP0Pwf/s4C2ZIh9ulxH5zHPsDDQyWehgadAfW+2MZhMpnnqJXcVdiH+kU?=
 =?us-ascii?Q?nCz241ZnecLTIYISCPb9EnKsFDiB3aUtpDfgKw4W8G6PsXiw2rPJYBkoksAm?=
 =?us-ascii?Q?B+6xLWJnji4HsMgoWHpYkNSNlNV8e6cappC3k7pcRaE7kBOFKzWSwV5b53yc?=
 =?us-ascii?Q?liZ6KbKqkeCncouHE1rFHQDXxo/uQBHXJSyjW+cn9kwVnRA6JUwieVezsWpQ?=
 =?us-ascii?Q?bVBXXOws8fETVs6TJvn4L0KuIyJk0p3UFJAz07bRzqS2kKfRPX2NG/eWvtsC?=
 =?us-ascii?Q?TiyHQFFum0ITkuAm0F4qX6ncQ94VuIDTk4IGxUZcIf9G8/iOL2fVy3s8db7m?=
 =?us-ascii?Q?QwPw39KmIS3yv3DsYSqHGjIs5WGfcqJHD2CsUQO/J341Ax2FJU65avLowb84?=
 =?us-ascii?Q?SpkhAWJvhw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fa1259-6da4-4528-2f90-08de684e922a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:20.3493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2ZjmLj5BFc/oYQ657Wp0D3Wq3HUFwZpkab6pcUeKXi4qVGHE5Ij3UQbVm1Ys283zCn9Fe4bGOy8jbFmnJgCBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Add elf_section() which checks the ELF magic and class byte to
automatically dispatch to elf32_section() or elf64_section().

Update existing callers to use elf_section() instead of calling
elf64_section() directly.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 20 +++++++++++++++++---
 drivers/gpu/nova-core/firmware/gsp.rs |  4 ++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 5f3f878eef71..43a4e70aeedc 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -596,13 +596,27 @@ fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
     }
 
     /// Extract the section with name `name` from the ELF64 image `elf`.
-    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
     }
 
     /// Extract section with name `name` from the ELF32 image `elf`.
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
index 173b16cdfb16..f100b5675b7e 100644
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
                     let sigs_section = Self::get_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
-                    elf::elf64_section(firmware.data(), sigs_section)
+                    elf::elf_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
                         .and_then(|data| DmaObject::from_data(dev, data))?
                 },
-- 
2.53.0

