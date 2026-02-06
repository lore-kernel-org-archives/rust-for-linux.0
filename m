Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801CF33C19C;
	Fri,  6 Feb 2026 04:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351706; cv=fail; b=GAyLWKNmcE9HOuXkU/78JMIxlMYEIpfek2QiJR6N1mQNCjBXVGVROkELRn9lArcTqtR2V4uldeFSW9gmfj3tJ1muHxx9WArekOWv0JCn5Ao0a6wA0rEb9XOnQBESWzDqsFGyYEUJz7Al7wSO6VlNGysG+y5O+1ZF8yEH5Hs1+44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351706; c=relaxed/simple;
	bh=CWV/yeH8gI6J+X4Q2o0yJwKCy+4N19FAXVbOnMOgSjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IyWIFfVSOZ0xBsr5EoWKhv7Q0VEuajnH1hVR9NDe178VlJ0DNPVPhyNoT7+fIm/5wDZG3ZlGpzm0OBacsdN+ymTHGMx1pr+lAQeIPEiavuCvVXu6mkvd66xzARoYJbSCJXg6Z7TRhKjYS0Noc+LDH0z+szecqqvOGFCLK+aF++o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AvXdjmR/; arc=fail smtp.client-ip=40.107.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AvXdjmR/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6dYnKZ623cM0wobHi+QcqvsjkiB4Kc8zdMJ4tqvfib1dNqBiCdOy47mcAndZQSQOD3a5zKGxKPk84UZUnURBVpV7iSsiUued+p6oGnj/mwfYbYTmnmNo9+LvyDPuXc1qRD0ehh7h1+gTN8csZGUgkP8ON9ERH70xDa2nLDJlj68fyKdjxhULAmYnKZCnek7DqAyk6HWrM47vmhr4Q/n1wd9L/+8MNj3ZJiXJTkSf4ZJZWcJYrGZRgXuJpxGwvSkcVzUqvvVcs5IneEiE+1c2Hhi+fxrSVp2L1f0d+/wMeb3P8zTx3lGcMwDh7Pagf6O0BWn6GK+foyXL8egyOnhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjAi3+G/SFKfernVHDSlcL62HXndpVDdl0C+niOcSnM=;
 b=n1NzsN25vhloj5gaQS5/Ado8d60tjUr5KAtW2IijN1TODUvPCpRmAe2DK19QKDVI81w94urkmZmp7tNLH8IuEY8xccISR82AlzkXHQoplo1lCcp0nG2KCJSqaLXe6XcYgoVAaZM7/5bjp6xehQqyeuYcdXlIegjALiTjcUp/+5ipYcplwFXRGYG1vxMJHalqeMqaxWzkGkyaDRrXr3Mva1gw1cLtwV0rcXAb0WLVtySZruAnQnYUgwbfQ/aQcdwk6worF1MZuympWE7aOPKpoMJQNngNY2Fc/AtY9YxDD5zo94So1g8ll9Ocjdex1ZQ6ANej8E4SZKQA1MgJofUQeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjAi3+G/SFKfernVHDSlcL62HXndpVDdl0C+niOcSnM=;
 b=AvXdjmR/QtDULv/YJvhqavbpmJSwSn0ko3TRmRCAWoSdawQNf1yAFvC5QfLhkbK8jdweCS05EgjfLq3heWo8V+C9WylErcZrUEjFuphFaJNwFXb5FxKBxm6wEZVWDAC+kC+Ylmy3c+keb3Cng6/I0qkgKeXOlOa6n/9sWBG9Hs2TtOm0i4bpGNwfTOg7DB6eb9YGAFHfBZ+T2v9kIiKkq/0KsqYy0qECqZlr5rjlqBFU9685dCjEF/mlDD3vkAene+qQIB5113KekXdJbDZ/F1xbevpXTIk7KvjGQ8/05mKMbyeNA6qK3e8FIAgGWEPWNd0v+lza0gfUn7pmF93hKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:42 +0000
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
Subject: [PATCH v3 12/30] gpu: nova-core: add support for 32-bit firmware images
Date: Thu,  5 Feb 2026 20:21:05 -0800
Message-ID: <20260206042123.303281-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a91510-6c10-46c3-1057-08de65373b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iYcE4uAKEFlrVZ7oDLiWGdHOPbgEs9s8qkHnYU1nGRiGB/e8w/LoMV+FAvOw?=
 =?us-ascii?Q?GC34baWEUkyblf/+SaX9+nZYZ5hyrbA565TZdGa4HXHX/O8XeblySgYf59JP?=
 =?us-ascii?Q?e5rEOdvA8HktfhbR/u+Y1lxEVkegdxK3GMvxZJPUfvMW8zBrr5hYno6951Le?=
 =?us-ascii?Q?Ws35hH7+gixzD4OvPjd025DatfvNuDp5RFcjp/R7lF28Pw/ArU4RdDm58ugP?=
 =?us-ascii?Q?lijw+wJLhkDz/z61/+bJhtpEopfCJGZ7Cu5iVCIlwI7/0B+pezcl8QutXddy?=
 =?us-ascii?Q?m8E+9pzgax6F48hlEsQRCbW0k61yvjFzpchBIhCOlPw6jEKSZkaTXaeuKONQ?=
 =?us-ascii?Q?atavJzGpA+J8+pv1zqFpdFxJs/2W4CT8cdvvAZ0Hj+n9A5Hp2zRb5qK3rsBB?=
 =?us-ascii?Q?ooEC68x5u+Q+jr9V/j6C2Ujoow0ZnMrCviCsDjpTfI5ZBHYDaa0Vqtzjr4IU?=
 =?us-ascii?Q?cQSYaG75b5RqbyAoVKP+KATpFPQtu8W559KmtNRWFq992+uajSMIK8d1HIas?=
 =?us-ascii?Q?6GEnM03uM9ZrphFaqvJeXFVcLuhZ+vC7R/rxkn94XqdX+bHYrzsEKtxnLHzg?=
 =?us-ascii?Q?K6Nt0iNkTdofI+LeqGSUj8JfqKD1s68nKPo+mZ6AhPw6oWZgWE13MlaG3f7F?=
 =?us-ascii?Q?qwK8MNsygHfH1dV0i4fginGXINNSmcOTcc+Za74u8Pgbgx6C1eWWDK7764Zb?=
 =?us-ascii?Q?9mCgpnbVoEThqeWTdTwMN3dQGPHsNtduUrIrqHNdczToyPoio0HGWea30mpG?=
 =?us-ascii?Q?FnUTwFo7F0Bx1rAmBHxQjy4b46EbHPhUd63zkJV1YCuSD/TKjHnEzn/TCxw5?=
 =?us-ascii?Q?rGX46qiXucnIpBXzbyGHf8X5NBqVRKzC/G0MrqoY6of3ExqfaNZ8SKYfmr0D?=
 =?us-ascii?Q?wgoigJTR9/PKVdK8YSiL1XWiQ+VX7wOvPcqbUv/aYrts019gfyyrWNVvgpka?=
 =?us-ascii?Q?YpR0g7cU3X0CUtC9cTk2pnzj5tFixf4CZN8aaGUuN82skff2AuYP/LwUIi8S?=
 =?us-ascii?Q?o8LqZuT8SH2TgOP86Qq2FyKDqZsRLdl3nsYmb8EVVNhJZeKvUSi8lZSET2wy?=
 =?us-ascii?Q?729EJZ/adjL6W8lXknESy3VukwpmN7njt8+DM77cepdozCw+adUvKAuy8Vsb?=
 =?us-ascii?Q?TpoPnNscqc2gFfSTfH9ew2eDWU0IprgJ8ANFbxQvmwtcxi3LOpccY4dMPBiX?=
 =?us-ascii?Q?FnJgoMka/NoiNJuovOf3WBSh3LYGrgvSZAmPZpvMX9tN+lW9aOv9+8dYrS+T?=
 =?us-ascii?Q?WZ7z2eIQOknhS5RS6WsUxa81fdTkNyE7MvCSxhAlluYRa6sGPLWBmIEnZOxX?=
 =?us-ascii?Q?RvI5EVx7k5C9x+9vcZaioA+oOjJaIKovfM2QouvVep4faHfwuTFUgKXgDXKL?=
 =?us-ascii?Q?My5N60n4T2zw/XXEhhYpFJDupKQFIqzG/PorBug/4XyWGTd91l/jEV3Gom6p?=
 =?us-ascii?Q?ohwgm5J4qsF1MKp4kA/2BBO37n7z4DWhKNrPt//alUa8hCJlsfa06ZoPZAfr?=
 =?us-ascii?Q?36LtL+b/uTw9vYZtb07HJti5Tv9PfKg1gz7JJspGi0X8gngLfwvrDLhuh6qX?=
 =?us-ascii?Q?i1coiacdTxv/t+OGF9Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gaN9eMYGNlXwwNUNXVQFrsirCmY37JBGM33CCz96/uNpKCuiNdTcFzzaoC2Z?=
 =?us-ascii?Q?ynN4prOLJZGI1QZoynXTwsRHOib4TKycgedU9Th11hjgwNiUVm0dDdEk3hI6?=
 =?us-ascii?Q?8NyRnQbvQuF8kYGHwt0Fkow3tq2oOosseEJpXnh8yveHMvQ6pTn8wLa6Gx40?=
 =?us-ascii?Q?p/y8K231Yukpv5fFRw8TOUUxcPdCSxcMRl0WMwVE7HOoVfoXAQbcVRBl7NHb?=
 =?us-ascii?Q?fgE6fetwK/DzcJua/LGa6ZQwc+nu6S9Ad91od/jzZFjyqQ0t/bQIxsKCTCXe?=
 =?us-ascii?Q?idZf8C1aXI6by5gJwFR3qeUM34Bf5x85DAKIsLkvRmyCNk16aWrpJRuJDd5J?=
 =?us-ascii?Q?Yf5lSywBOiU7jCX7BhBS8M7700mQ6qlIoJbtU/Zz9kQ1o/Cxtfg8juK9NA2R?=
 =?us-ascii?Q?ExKvQR51GO47AzXCEdMS/tdkVE7MwIUN9IwMSRRBRGbuqYy2caqSWRnp8nq/?=
 =?us-ascii?Q?9oLo3rDL0tJdx/01t+g2esWDwNXJx7tTI2lf9wdoPP48ndrEfOTGH2lZ3zfr?=
 =?us-ascii?Q?ColyGox/2QhJH3zx5eFAzcuRdu2I/ojhC0d6u5JQgpVz1AZ1TGG7UxCPAchL?=
 =?us-ascii?Q?DY4wWxEAg/1ZmIEI0yi9hDp+TE5yrbfnRDNgXw3NXpONZfTaS9JZxzQyR6YA?=
 =?us-ascii?Q?OxI7TEEDirn/26WBzt5dOI0Y01zEsUEgqEIq0AUyJsplPypWPQ8ik1UX/tu4?=
 =?us-ascii?Q?Vgg96DQdSW4l1kRXTRm0AjsvQ6JVJL2Z8IcTDBSj45XbOvpxtN7j7dFRTfnz?=
 =?us-ascii?Q?x57x6hcQLsqnHmgsbE1Uc8zrTMyGlb286UTJWrC5z5jZ6uo2CpbUIJa7gd/n?=
 =?us-ascii?Q?4fXOTIPE0Ke+BJAHpGnBpYcSOk1xJIL+2qaMcSkRj9bflOth9YCuNcxT+1m1?=
 =?us-ascii?Q?U+rf6T9srk+9AZQf5zF7cyiBMCuCGwZNIi7t0wjxUNnTPQGZs267c65mpDqj?=
 =?us-ascii?Q?OFetMSGBTtWqtWp6VcGVPzRxsByAno8LYAuMi62YCEMvRx7nuPeXcFwUaqbl?=
 =?us-ascii?Q?JmV0RkZlnwQcyYo1GYAoNbYHYGeono/R0ob+agqHDQhd1uaC/7tha/w+lYbE?=
 =?us-ascii?Q?YKIvct+qHFj4aOCHY7Ih0ownJNSGpMftNv//LkUikweyH56bZmAoHap828ob?=
 =?us-ascii?Q?3OcREoJOgf59hyuEAaWH5qiYVeq75w1GIcoLTDRMXY0S7YX7Oxylnm9rDB8c?=
 =?us-ascii?Q?w/KZBaK4a9fDO98KIrSSpDHUFXnoy5O6gBgiChQd+8PGEyIYUXYYiAv2QZIY?=
 =?us-ascii?Q?qG3eUMhZwDvy9ebEGRhsgZBIUpsRr/buuxxOrpmWY0ogSzgQuNUEQf1adjwt?=
 =?us-ascii?Q?rNbkwPE6MLDnsj17KsE+hJajK4U23Ym1LBEAMZhyAtxpH3MRSdrnORmkV2/a?=
 =?us-ascii?Q?sB7AB4+rLGFZvHK7it5KMZEHrM1gy7jN1DdDAYnfouRp/tdRS9QjQihHWfNY?=
 =?us-ascii?Q?wNfNnxvZM5SnQbNlXoqtxYFsxZcW/Nhi0kHfxaHrDZ/62nrO8hVqKufU4gD8?=
 =?us-ascii?Q?lsU6SJn4jiZ13m98xIOW9iRqlh9N6/i4VVCkl4RNSm4bs9x/5F8IgVhBQUuw?=
 =?us-ascii?Q?qJs/1EXa41ToZTp1N2l0pn9+PCmRrr+wRSyQUXmhllQbG9qxMx/1nmHGQ1hd?=
 =?us-ascii?Q?rbavICYgKpF7NjeyWzNKkL9htRrrFCwUb0cZ0jZlIwQQ8xadu28zi9sFGQVC?=
 =?us-ascii?Q?wxCJav8vHvu3E4D4lhbld4r9Th9iJ0XuQrlOhtvNCtmBsmH+K+KLxjPN29fS?=
 =?us-ascii?Q?+iJXOHwfAQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a91510-6c10-46c3-1057-08de65373b06
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:42.2467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jVMhEJdAwAVh2JDaTQOID/5uPAB1+mBGPTicx/yw4UqFa1uRMheOtrQzD9PT/B5kxu3v4Y0RhAZHFKGVkSSpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

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

