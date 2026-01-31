Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C893376B8;
	Sat, 31 Jan 2026 00:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820996; cv=fail; b=u8gIJ3f769MyNeFtChbLzAOQRRMgNSGqWBeexbvkFYUGRwSEtLVVHiw70PpsULT18gHpqGL78xtk6nLo7mOPu2pWjdlHGd2CozImNKVmtNzCPScRJiOMMv7qHNi4KK0NY3QucVtY5noJuuA3ipdV8xz5XXaNb3VZukUXySD/6rU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820996; c=relaxed/simple;
	bh=J4WXpgY6uMRkiOhlXNhDo26L6PIWMj/s2kHxg+n25xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=evn04xUUK2lvd92b4FIJXS7BGkQwpngbJ131IxiYSJg+tYzg80sxTYahZHxM52MhXheHP9PW4DUtCO2rUHBCKqMvCbGMtNaV9Cn6XywVgqgHRKztQe1utjivBbrMRNEoecmklYKvsscuUDewyxTTIXSdox4FLW62Ft49nc1+QXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NrqffYNe; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NrqffYNe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUTUuyVYg6NB3a/B8I1dE9onT6QTonCHfF95vNexTPsFZgwpJ8SWzpn/5aiwvnG1myuKT0u79VMJ38mjT9o9GHOKgmyEQUMXxWcPw+Lq8cAB5NaPbFhUKOM9DbmYslDkBQWXAiDo3+dAEDewgxUDOpj1hyxhbHyYFRIaAqp8+wORVwgFkxIAsg7LuwQvlEHKvbekiLI7t897Z754lg2ROG9A2AnVEFh3lVGLB04K5K4tGHnVN9gquN+K+OJxA9esgo2JXlFsuOdaREOrlDyUzsSzYRUD8GEgwyc3uLlxOJviuJ3Yhr6BCDyZomoTfCPB1deadxHydmlK46oxU+k6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iME5cvqDsISuGSmZhFJpmp3oedbFOWxLTWd0vZ4SU8E=;
 b=pJZSybnXMIJE+gR1P2AVtP6R7h4vx/oA1Rh6LO3sto1xlwFPIGMo8mJL6hPxZQ+SFjpEPtpeISHeVFrl+pvIXEHULqHnEowv/BtBNF0C1Cze4m/6Nybp5aW6UzjrwGX8eWUy9J0RC06SmRF6gdD/6hu/vo0b2CSxKb6GwDv7bRRU5EDoYjRfeKE31qdJPR/JbxHB+eGqQ74rmuUju078EIcD15MUvddQ81SjX26rXAjmsn/iGMrxuGi+yhnq8HqHU+MnI6GTCZo2vv6XiUUuxbGiO9cFRmQjXk6dbIZzpkLHDWU8V3YbhbXzKXTWh2H29TcxVzGz8dKWThFywFBrAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iME5cvqDsISuGSmZhFJpmp3oedbFOWxLTWd0vZ4SU8E=;
 b=NrqffYNeZri6OYhK/rcvJSnf7SPKsXODh9jG3F13La/4yLzZeR84atQGVWuVRUuzcS6o63E8dWsQbw7KKv3klKNKG6LBWEK4VyASARACzTBtRVccPqGWYKDQGiVYTBHJNnMYKC5LxI8vDgq4iMSszY+0UJQMfEMK3pEVEUpTdXeb5+AN24iciGbtX+lOO1plAsarsQ3ydLb1B96OqbrefmYkM9aDzO2HGdN9IDeoVDr5xgFRTmiuZopciBD06bNhSGqcXUklCjJo6J8EXQf5b/5N57CsG/LC5Owttd21wnPJ9dW7qQsuKU+E+1FPJx9OmTKLRaEH/pO/2e5Xafu5Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:26 +0000
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
Subject: [PATCH v2 13/30] gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
Date: Fri, 30 Jan 2026 16:55:47 -0800
Message-ID: <20260131005604.454172-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 503f12a5-dfb0-43f3-50d8-08de60638f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QrshJ2E1q3BmSjtsqBzTCWq1SpoIkB8LZlQ6anCtrPHIvznn9pwMLY12E1Nd?=
 =?us-ascii?Q?CBm4uWssOrSDkVhTZfYrD99sf14N8q4dYhJLcFztg7Z8XbT9rhQZ0hvaa2Zp?=
 =?us-ascii?Q?ULS3JrspRKycpbt3AzkYd6NTOdIoqQawWAR3sKgqjGwv2jX6GFo25ehUuH2z?=
 =?us-ascii?Q?R1+uQ4yDkUioXSWwV3QoComC092NXLwGfdVnkpRmoElGY869aU3BpDF/Y1DH?=
 =?us-ascii?Q?FO6kPkAAHFJtmAq+zuv2gK8La5TT9DJUkg8aq2gENw1Q5wFOcF0QQNs+6XUJ?=
 =?us-ascii?Q?tA399DPcfLuhDDVcyaNODLvlCfN6QAg6fylbZ6+ojUwu6qOKOSQprskZe1aI?=
 =?us-ascii?Q?b0VGx2rCm4Yf6f+IAuKCtSDeAOJNPp0fz5FyHtFjziY80gDGsyc3F9PsSbsh?=
 =?us-ascii?Q?uVNHPmh0X+ZcbkzxbreJC6D/BtKcYe4nTCWxDlP5zM5nOOmzPGpJkPPIDHh/?=
 =?us-ascii?Q?ieGv1A1k+pPvxMQtbhqKhy56POrLOEc6MFQnJVDhGQp/ngd/zFukqbV7XdtK?=
 =?us-ascii?Q?lwgqDH9gvAGVWiTmtj2BhQOBFYnAmeHPaD+yftUkkcwORSlUmQA/M46q+B3h?=
 =?us-ascii?Q?FNWam6I2jRLUPUtF8F6ie6kOSrlCwBw6045dwBbX9s5LVig3ryuR7UPe2UDk?=
 =?us-ascii?Q?HI3WqIKDqo/X5ZaHZ41vKljxjXS770ICasChsaw6BGsSF15gkuqABhqqxQz3?=
 =?us-ascii?Q?JDH5TqeGj/qS8R/nlg9POLnGIXCYteHg8GKeFgImT0w+OgShjksQA0m2zu+M?=
 =?us-ascii?Q?2kQFpOpzjSvoPxu0hXIfo7w8/BsJp6J70kwKeUAwQy81bWWSz+C9k+vyjG7c?=
 =?us-ascii?Q?sIKaWrjk2CXlBCgexZcS1Gci9PgS60l/QtQ17XZFXdd9P0MCRHJOb3SwUX2Y?=
 =?us-ascii?Q?Sv8lSeh2TdzqsFQPL94pwoAlg/9SQzFoeP6kgvaTj1MfvSwFSC6JZjZNByd5?=
 =?us-ascii?Q?3zEvjJIhH0B52bx99UD6RGFIunvpPeZYSUkpm2mG+WkrLFMWv3QSJw1/TUN+?=
 =?us-ascii?Q?sjD/NG8LMKHEY8Y/s9puZ0CZIUpN5eseSlv5jIibfUaDxBW6DRWim5P8Gj8B?=
 =?us-ascii?Q?UcWVMogyocTuxreppug//uRRc3Em5RCJhI+6kpwKXNEJJ1VoeLBIVVqnW67j?=
 =?us-ascii?Q?mG7hQdSqtnWhWU3GFtCoFj4298L5P1/fWUDfo4RG3mE6vt3Pej4OTnWK+Ex4?=
 =?us-ascii?Q?PP/gZ1WZEkhIVoNJAJZfbGcjrWbLy6pYajKN4aF2ax9zNSVYO8/SOTVxU6qu?=
 =?us-ascii?Q?3img9GnkykD2vqL2ULm2BGGtF7ub/JhlxiUtbqzZOTS92XkFX6x+c8g33dqz?=
 =?us-ascii?Q?0XblwjhlCwS1eae9nCGd0FjiYib3xH6/4iilcw/AwBHfQLwWAcfqdTtAIvT8?=
 =?us-ascii?Q?PoFKdnh3puaJAkFX0vGxt/tKPCQ1NwQJTb1lWi2IUZULABIxE/5A4RX/oz3G?=
 =?us-ascii?Q?yh/P9Xuft1/le9j1hyAtO8jjePSeRbncLQowN6weR1lO02spLABhMc+SWj9L?=
 =?us-ascii?Q?k/BoG1o20XqR5iHAMyzLZxwvG/og2In2UFNeki+G4z9M8/3zHthCv3I6q0AJ?=
 =?us-ascii?Q?HMvMr2mk2xZAQ/z6AsY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YoQlmzXSPamBIa7ekMDvXnYo7uuS2JdyGQHP635OgOseQe8nYeHy4QhexD7H?=
 =?us-ascii?Q?8spwRtZeJWRbSjbEEDZWgsc7gVoZw1E7DylCSMenYN5WOU7xp6N03Ibf+13d?=
 =?us-ascii?Q?FdYL77DcD9qGrsN6auxSSknLnwBmWOKHb2w2snSBkzyjzU1FrTJGaykvacux?=
 =?us-ascii?Q?75QPlI4DTJnWKQ8ZiWRNljGaS7d1pZ2qsga2tEMceDGzJfLz2DlhiA2lAO0B?=
 =?us-ascii?Q?knIo3Pt0IEYscX0HYl+cbavxl8pjRwlAkoKWoUEx38+ZUAFeUBR6U4p3xMGN?=
 =?us-ascii?Q?fz/CMiLROVPlT5zusJczzrTHUWzGGCaBtIQcEE1RuxPyroWQWAPIn5ug2e9Z?=
 =?us-ascii?Q?1RjjWIhirKu5hGQ0bx97KMoua5xFN34fs/UREycTsO0lPacEdVgZQn1hv0Iv?=
 =?us-ascii?Q?S8i2pYbyjHE8KG94vOVVPXgCl/wI6r7qym465V3/5ifaIG86wXuiomD+i1hF?=
 =?us-ascii?Q?XD5YPLDOks5jCCDT5GieFEwPwXXk2Ht3J7CYXphUqolpN9yHGEXkCBUgl+h2?=
 =?us-ascii?Q?KZ1xcvwfeQVuVxb9S45SByMfYStr3i0G056VmLH6ggcwkXpIBz3fiRn24LVS?=
 =?us-ascii?Q?QNsv202azwjBXc7Tx349eK7M25TSpe7/cmiX6nPUDMNCVpJOfSvQ+AxMIhSH?=
 =?us-ascii?Q?MLb2qmDjx3d0InbJuGarmmd9qDJUBat9bxdif83C/ee4tnNKCMlTevp5XpJx?=
 =?us-ascii?Q?6gAImwxA1Vo+58fC+/EloJICrGRWJh4E/TWh24KyQg8pr/vIn/YwamGqWSNE?=
 =?us-ascii?Q?UV1dDspEWPvlAjrQ8tnmXVua9ezTpMzs25uA9ZNVnU6SsmzuWSt61WrREm4G?=
 =?us-ascii?Q?eTPpbFhfjsjLI//d+pr6PVsr/rQrRMd+T0S73yq8PFMdhFCB/vJRcAMZBPsz?=
 =?us-ascii?Q?M2OBoYjQNmbs4gFPllX0UGW1Ifwhn6n21lYkEVnU/6xxInQMZrVmgWi4Cjlk?=
 =?us-ascii?Q?HDuGMUn//e8W3fERIf8Gt+BRMKDKfuVSOJha0Xxae5pPnVQwFABu2EI5wR+v?=
 =?us-ascii?Q?Jqa9RcWx//aZjfOJSCPt3BuQ50sb1mAzPcsszCmDlWjGyePCZdxmFfAs1LP1?=
 =?us-ascii?Q?6Z6Hb+yAvmdFcN0CwolJPxSQ7KuciH/MUWeDvEGmXLW/zX0b/qW9GxeZzXuB?=
 =?us-ascii?Q?oAvpej2w/VrSloVlH+44pabw2YF5rAEULHkcmh1OWE8S0ONW2qqz4Z5fVTxJ?=
 =?us-ascii?Q?H3QsxqpD7kWdE7qE15xxRdCQZiQjrov5ZBQN+2hjj32XGhfxabyVYrE1ram8?=
 =?us-ascii?Q?fInM3dRvLY4iG3lufJ1Zwmn8WMyvzY6A1QFhNn5m0oN67v4PNglUWZv/3n6Q?=
 =?us-ascii?Q?/v3zvU0BtXQfE9ae8oyygWIA04kaI08/S0YnbXaJFUAuoCY0U0tECp6OF+fn?=
 =?us-ascii?Q?KN5BMkOwgT1V1D26OebdSmjkL1VJJ72G/HSPhnyzNLbQGG4X/r9ack2Cs9B3?=
 =?us-ascii?Q?gwnHRMfgvhjQIBKA1piyaP1/lPVt/kJoJWsLLM1rrtASv/0C5Fg+N8D14m3O?=
 =?us-ascii?Q?vyf+2c4HFnUwEecqTqxHiWF6qYmh6OQXMSsv+1Aln5ML2zYpKOhbSPZaQku1?=
 =?us-ascii?Q?dpKCKsRwnlIul6mtiuUdSQZ3BxojT9CE4B/aVXLVUg8+WjgolWrKHHd/Ga/d?=
 =?us-ascii?Q?Mmfa1yPYuX/aKU4gkgGZDUrko5gq0iXXJgncYY8YzJ6mG9Frw9gyNgeVKcvi?=
 =?us-ascii?Q?OzkcE6sHR02uYL4e0zo1WulffYWjEsmPzyF2C8bcFFs5OaJ29GNTHkc1Rk2m?=
 =?us-ascii?Q?aMhyNx5DfA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 503f12a5-dfb0-43f3-50d8-08de60638f69
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:25.8791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWszKvk+1qHQVGRh19MqfUOXoaskolOcG+CETYEh8ctKTKujo15q6OAPgJLpQ0BMx3JH1IKmoHIanLi4GSSc1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

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
2.52.0

