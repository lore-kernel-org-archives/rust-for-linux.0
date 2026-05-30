Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4F13438BB;
	Sat, 30 May 2026 03:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110614; cv=fail; b=S3n8H4Y0gjuzcp2Mq4vwnpp+s/+6RTxikle0Olbx+h8A8TBDDLzBP/ZY/nj4F9FrJuilRRiZM4vXgJCK93HHnKR33CRxbFM3JJfxx4Rie6ZgbKcCQcj9lXE0rffFXDi8OC4Qi8TKXCpcyEJWiOylparUPitnKMe69+dzqF2dJF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110614; c=relaxed/simple;
	bh=ZPvwr64HU1HLsyYJekzJID5lGCRdNiJ6IMGYl0La034=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OVhASaVZl14lBGzdfkPI9Zg+bQwyiYE/w43XZfv5djoQeW3luNB/NwLWFgwhZuEVVtBiDgV1cb4klnIZJYWP1D+ZUca6kRUeXZHhtYPyZETyWAWzBwCHEESe7IZCM7FpumvRJfWfCU45CBuWleoZeB176fg5QBb7GeIJRUU1CpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OGoMmwF+; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OGoMmwF+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AL6ivnRiTL14e9SvEoIo9rODiaMn5xTVMxKD6UkHZL8Xa6Shb1RTIR2tkWn/OmYp8KH4f8hMe+6/z9XWBBJzKN+2Jz/WbYrqkusTnCHNYbbetCVjMe2P1j0VqHvqizaXS8g7AvnHuBi34M0SbWOFE4KVp8LJ2NgCkcdyM4RHg86fhwwEEAZEWcSmB7JJwXGU/7s6qRL7rckYq7dGgmalVwzed6ZcGQLVvTUUBsNesuJs2tPIPl7i05iUb/lUG9lnNqVAERNZk8gkawyjBmYpT6TZqLtSCH1Wkh3BS6CVizCEbnKyZsRT8CiwmBnyF8VkeukUwSrw1+bJ9K8sfIrDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILOPLKkiDd2iRYlapuiCWGTFtncOxXnHo/sbgE95CTs=;
 b=IdfzRS6K/GaNnIsoqOvVMyB/53FpFtQyMSE70Mc8yHdmSzz4e7J1Q9wLMBFeiSudOunqJe0KI2Xsnjpxq7MuksrzZ+cK9UF2LqhO1SN6/7a9pTjtmHmMBc6gQbhBANY7mFWFiXQ+6l1ouXzym+jdSOErbz006Q7wYZ2xFfNlehlYp6/VI7PAdesdcT31oVR4bVYNwPhQOlNirxVQIEmfTtJWc7WANGElMmFq7sxUxP2BUyKHXDttkmxq1uWUG4C/RD6FenojEFuEvKtGxWCzHJ14J9lLioA/1kP2NN/5EYjlZMCg34+6lGJb60z1H5GvviWHyZ/WtL17SE/LVaeUJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILOPLKkiDd2iRYlapuiCWGTFtncOxXnHo/sbgE95CTs=;
 b=OGoMmwF+cg53v7T2ZSBqhgO2Hbu/YxslevLAoLbR2XGbn/At8Ib85XzuIeItgmTlYipCnylrzZt3G7gW7DGZMPxVxX7ZdF6jEtimfxgVoNIHitEdFBumJnz50N27QUD/aq8F7edos2AEKzmi5coVD8xiDSLIVN1Nu74mH2ng9kqBWNj/t2GssaEaq3kKgAwYpj9T8PJVOJpUcYrdAhoIbuUb4mCguqvu0G7Am32ZVBUDEUiepkasdyZK74vKrifVfrAIbk3QnWBp2tlGfUUPtiA/em0f3RhYBN2ciGO1JCyNBushO25N3x78tQAcDRcjLC3ty+kb2l/y+K4LUmXSGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:05 +0000
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
Subject: [PATCH v11 08/22] gpu: nova-core: add support for 32-bit firmware images
Date: Fri, 29 May 2026 20:09:39 -0700
Message-ID: <20260530030953.740561-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 532c6d8e-cd3d-4b27-278e-08debdf8f2db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	C+RSV+wpT2DX/lIdURjBsrPlTzmoecsMhl3FR9pgGgmuCkP3d8TMxkD7s69fPg2MSwFSCIGIkcgZQDjRBLz15BElkvdTlksMTVnPeoSVJvsVJG63kPaifmy+mIVtsv+PFsd5ifYEwr75Elip9qM1S/pO8r1y352wr9ySbKS8VBz0eID+fgMFktOuWBqg8Vsg15uYNsSmF3FUUNdMkpM8309ZUtjg8Ds2ZKwNoUR1nhrPP2C57wtQmSCDYnT/HvEXBXKB6667H8tdMlTWz37wP0n00IZYtDzOKTtTj+UEKt6TtnljTTyH5rhK4peNC5JwtHxXzt4+SISy1sSap2Ek/JY4aAC7AIEWZHUSKEcmZarvdsBKK4HoNp+Nq0/gVUmPxp5h8+XfvUvS+4toMeCR+NHPHbhaKvoTUw27CAuGXGBNaV5yM9hxwsCcY+OoIgc3zqhy1eXjEjYT5c0kUewV9+gbhvEZb7C7ygwki6Ru7Utvtd4O6sKv4n3EK2IVD/y84tIvQqstDNsRjjsmCpJM7LNJs0XtLYSKPCFoTj7AmbVb0up4ld4ri/Wq8mkncsVrlKA399G0Kk4mGWDmpJ6s8Q8GMaOhA+0/QUUldkOiSUUeb2dmyipARu8Pm0AG6kB+Tfv2xE+8w+Q5/kqnIYkv0WwE1R6h8+s3x04lf2VanKnpwC6w7+5EJGOe6VocPL+7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bjaSk8T+K3ELJnXixERXiX9MST2MjZVa3zz2r/RmTeuI78fIb/27RuBk3sbj?=
 =?us-ascii?Q?K+MRcLB67nNrnB34FI/gzCGZGPgzEfhaC0IIJx4dYZtd5fQT4UXNFs3um4yy?=
 =?us-ascii?Q?itm5/QjPct2zZt24Tdfc0TdDvp/k7Ht62uLPmZnnXucDer9s9gc0cCQex1+z?=
 =?us-ascii?Q?GOaGr39570HLsakwJkm9lkd3HxDSVoL2PBDw12WQI7VwTxn9m7Rnh6E1HDmz?=
 =?us-ascii?Q?n42MPYLdUSnUvSiT1aNzfHqxOYbHk0RSBGBckjy+gPTJf5+/M69qIFnpGYBG?=
 =?us-ascii?Q?e1N3g0TfNvcdOlYn94hOi4QAX2Y+9NF5tKexwOLGYxnUu60eJjlRy0Ax9ISS?=
 =?us-ascii?Q?rwpL1HKGUOLWAAvx6lz3AhycJdiNeHknnrLY8j4TsmHRmEZqpF0Wsergm/Fm?=
 =?us-ascii?Q?TrJuFxvZhYxXxVl/4umxrqpl32OgU/OHdZQucv7dBOGU3lFbAp2JmNIHYcPp?=
 =?us-ascii?Q?cfItW26Wv/M/+FybZZ+FoGyv5Av3b3h+XqwooBhve8g/TWSJl8ateD8Y6vji?=
 =?us-ascii?Q?3W/pf8LJRJ7+oseoWhFu614IQboyEjUIwkpiKqGCqgTAAe2LZmcBkt6+coIM?=
 =?us-ascii?Q?rBcp8BLq/e6CeE7XtJ616ic2vOB2TCkGgX+U+QsqCi/eSFgr+vKHNUUcxvcy?=
 =?us-ascii?Q?0WIE4BaSQ9p2dE48zVO/5SUCKsjLqnGAJ/10+2tQa9zCNS5dX8N+sQgK4/dA?=
 =?us-ascii?Q?lbK+UbHoT4T3eSC1lgg93KV3yRkLkei03xHcZuoWKfNvMlQ0E51xQRRW20yj?=
 =?us-ascii?Q?ejox09yZWUHpZAXlPWRa2OQMkfUU6cvzvZ6GBmTDUOCiVmzk64xqJ4KbZXpL?=
 =?us-ascii?Q?+rA2Vgc7yu5neoOJfoxkcfCzy6heh81kmphhkM5HQT9mt8UjHQnyj6y741Hk?=
 =?us-ascii?Q?4ki9UL/VAMTebUm+dcx4dZKrZzkltMx3o9l47llyZ3clNkmD4Nj5GB0lzjwI?=
 =?us-ascii?Q?/th7eKTltTp7MzbWaUtqDCTYQH2tx8l8yz5HECfVJc/S5jVZUb5zCrm1IPV+?=
 =?us-ascii?Q?3YEH0MbgPqg+ufjgpb9/+eH81WTymwoMI5Dqbegxrx8tx6QRV9rIR8lmjIzd?=
 =?us-ascii?Q?OJbiHyGpCeABhVcbFo1os+gvKfNht+oXGAHFrgJNDZ5UEzPJi/0lgI3h/Zii?=
 =?us-ascii?Q?6m4xsNGN/kjWhTem1wgBxRRWozrR4aYP8y++4+hd5R1fEed3l2So81DVQSja?=
 =?us-ascii?Q?24uiS8ApKe8d53+DtFkW1R5lOCADrw8mHPf3AzNFltfw4P8xeU07snou9y4F?=
 =?us-ascii?Q?XfZdyUagXkbyzM7typRvhMH92h/XjAUQZ7SuEmNxG8xrHCT7HKsNRaNJWxGc?=
 =?us-ascii?Q?knsiMQKWI1J4ONYTJRl4T/FPNascdjW6fCtQ9JotpSHCURtQ7Z7lga+FHk9w?=
 =?us-ascii?Q?obLz+jfJAZ6GHL+cCxuy+tz0inNOWbonpXGBqXzXpceDCtkYtcYVEW7aKVwK?=
 =?us-ascii?Q?Z/pMcDqXGfKBCgxtWhJ0NPT4ExQe7ou8WMlcAdYhl7FudAGBtd0LhcLH0gS3?=
 =?us-ascii?Q?DoMOrWkUzMsIjU/nlXkQYSj4YUEhDD8xr+E/uUoW8ltoKJ6wJjay0hJW4yHx?=
 =?us-ascii?Q?16LKmgu5Bv5ciNb3ZN4mcOqm2lqVE++UShVe57NjKLj9Do9/89N1maIUfhLi?=
 =?us-ascii?Q?2VrLqdkkcpemQ3rK5vrl5RAf9aybLtrwxLDZYWJbIzPBbXGmZbMXoR9+iZ1f?=
 =?us-ascii?Q?YBU7CSVPXWxP+6ckMgJfPTxKkj5YjlVrnKUzg+dqIP2M/wV8sZZ2EsG2RoFd?=
 =?us-ascii?Q?3pXkESVpUQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 532c6d8e-cd3d-4b27-278e-08debdf8f2db
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:05.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwkn49l++9RsH2K4/hZuIblzT8aWZ8y7oKpJitCdrSSX6pPZ8FJ7RG4wVXrcwLrKx8uk0QXJMyZ5qN530Fys5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

Some GPU firmware images are packaged as 32-bit ELF rather than 64-bit.
Add a 32-bit implementation of the shared ELF section-parsing
abstraction so those images can be parsed alongside the existing 64-bit
path.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 53 +++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 38088e950980..e4dcc9a87b7e 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -534,6 +534,53 @@ impl ElfFormat for Elf64Format {
         type SectionHeader = Elf64SHdr;
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
+    struct Elf32Format;
+
+    impl ElfFormat for Elf32Format {
+        type Header = Elf32Hdr;
+        type SectionHeader = Elf32SHdr;
+    }
+
     /// Returns a NULL-terminated string from the ELF image at `offset`.
     fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         let idx = usize::try_from(offset).ok()?;
@@ -586,4 +633,10 @@ fn elf_section_generic<'a, F>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
     pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Format>(elf, name)
     }
+
+    /// Extract the section with name `name` from the ELF32 image `elf`.
+    #[expect(dead_code)]
+    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf32Format>(elf, name)
+    }
 }
-- 
2.54.0

