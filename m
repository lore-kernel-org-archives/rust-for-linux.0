Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3957329E7B;
	Sat, 21 Feb 2026 02:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639820; cv=fail; b=UtWv3kRcw/YLBtTphZmzwpuMtnIaL0Wh3nOFCurqMSyWhYlqKCkDaeCq6zbeseKW4azdSufwB6WzDrk9Um7S0O2n2W3jv3QY3jiFwf1nnvYXz3BbEMkMboqI+bqO3aeAONVNuS4ETHk2gea9DYrf+hNP9Zowl1N/Yb8lW0Yrv7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639820; c=relaxed/simple;
	bh=6C4LrycisY2VvlXlNMCcMPgKrXYuRVW+vJmqE+NQiSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sbQj+D2RiOpNOvhO8LfMInGZliWnA/1gTkLAVSv2EHpzZvJZ15q0Be371ObWdmxcoZbmYTYd4aDnYIznQ3jc8u6Te3xZPJKjEEwDFCjjXpQEuAs42CdaOLXg18EONQr+IYJawHlrNajB1y2hiS6imxEeRzZsZaFKa7+IGZp3BsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GuRt2029; arc=fail smtp.client-ip=52.101.85.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GuRt2029"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJ7rS0fPQyvaw72UiEceI5PKoytNP15Lvjgwhoy+GrhExBqKbvw/jqk/hbsbWiQvD/oJCXeJLX1xhPK3AXAbHbqAfT5Vbdo/LBZ9o7DzyFPia1Y2ds4ZtSg52GobV0PJwl+mLLgJEQe87gOzYnud09XhBxFdlhx1Z5fXE2GS7RuYq9LSDhu74S3oqcU/+to/nGfOLXIVMHLhTaK8vbKES7leBMdfbID+5wkEeHGQukEDHqNuhZdsu66dejI+dCfITIAnjcAn0Dh+9dmidM5tbpQPAlwWTkJMTYl82HtMP+prxzIuklcmOsIUyCE3vP06ixu95chzJ/Ho8ZmuoSUI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcsrhMxJlMTH36XLje+Js9yBRQLav8Ji8Yx9ILZDi0g=;
 b=C+lG/J12q7TsTRthKf5se1PmiCtnFj23DQS8sFrLPd4A69T2JawQjtgpFoj8q+fM2hWTZbtTqT+p+EhAhppmdnl3gogqAH5dnBNLGIBmD2aExLKb15ftCCa6cDjQ4ieWq2hn0tTVVRcAW8JAGr02+KI+de28BqjrtZOjagURLeg4HYHoKQtJ/IJOjLb4J2jhK+fowulxKBrt6JFAr/4xzcAF9lF0MqZv0J35M1avvDlbvFSO+7Il8T+DbxK4gxlulUUx7w54NvAJ4Mz/6lWpzoKl3pZmbUL0OIdcugzBluFf+tKDGrQ9wh7oyc0bQvQb6H/8LBd4i1emU2aWVsds6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcsrhMxJlMTH36XLje+Js9yBRQLav8Ji8Yx9ILZDi0g=;
 b=GuRt2029PjkXli48lQlc4fbuMt0XMJrqOXV0inwhrc2Lu/T/gTLrbC4//JH7e+RXA40sg4A5nBg92ZfopQGSb5XbNfWk7AeyVXyuasFhBMhCPUqIDb/XV7OmuWf3f2Z5DL7I4KKkhncPr7SObtCRi5V6Grem/F/ND0zgOah8keCtOYX4JwKQY8zukAjf6Bj2JRvzu9BP7LPXzUzDr6uPnQsW3oa59kM4CfTtwD/2fxdyCvsH3D8bPdiRPGDlu7tiJS3OMhD25PW4VPysNxW6XXl4LwX3RnIMIeIhsMMnIw7ESwaQQIBeZ1UrJI2CLZhezX5FDlTLyUEAFO5+GMHVkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:10:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:06 +0000
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
Subject: [PATCH v5 10/38] gpu: nova-core: set DMA mask width based on GPU architecture
Date: Fri, 20 Feb 2026 18:09:24 -0800
Message-ID: <20260221020952.412352-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: b07a255f-41c3-47be-0e16-08de70ee5530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K+tFDigg5AkZLq+Ak0QRzxNATE7SHx2gdavVF4KiCbtxKLo25wg6f8KryhC+?=
 =?us-ascii?Q?VC/2i8KeGap6fficHZVTLyBnPYP8gvmj86i9Z4NDnpW92oZoFLbG2jWWkyH1?=
 =?us-ascii?Q?zVaKaLXyOQSKyzFrHjWGyFn2zyuPhblx3t1m/01a5pr4jF/fYyRGJMmhj/bs?=
 =?us-ascii?Q?q6yuUoiVUjpBvQB0L5Bg36mYiQ6pX+TXS+qJjUKHEoBkjelYtBDzx0Fos1WE?=
 =?us-ascii?Q?LnihGPmAkD++ZcxTV0gJ+5zNNiIeFAYhQZw4Gf5e+fNXIORxO3hAOqymh9Er?=
 =?us-ascii?Q?Q1apSZhZF117f3rCB9lf1jI38vMkCR8JhjAJPANmyzDU9DfVPG0nwsN8xCkj?=
 =?us-ascii?Q?ZrXbGrMHvpvO/bd4wRmc0uyOqFYnw1RfxHwf8cNllQoUwUWwTUxLAPVtk7oI?=
 =?us-ascii?Q?RsWeKGQ2aRlrTlk/a8L7xzVYOaPG9D6udbzx3CRNmFKxeH6L/j7smxkPkrK4?=
 =?us-ascii?Q?Hg3SRlGWcHAPLqcK8uK87Kh7hQckBEGRBtxg4a/0xNz82h4PQJJYkwQIMYgu?=
 =?us-ascii?Q?FYsj8G/RRv7UpTcUoyBc/a6YcHWqmAJLr7DH/vZL5auPvrKEn4Jznmu06+2I?=
 =?us-ascii?Q?8dkIdu9/L7RnKJtwxE6pn1vSJRRVQ2fCJ6+1cMTTZZgRAvIyfge8ORedByRo?=
 =?us-ascii?Q?gWinASzytaLq9+pAh3RyDeai1ZsM7fB05PDaK5dFeVhKc3ELcbCHnP33JfMf?=
 =?us-ascii?Q?0F+gTEnV1/5ByZGkJ0zAF6kDYGiZZEo5/dJrSebQUnKAJsd053WNqJObHgKb?=
 =?us-ascii?Q?RAWL/AER0y30Serb/4DgE2nUWdi7WV7Es1obX1wpyqiJju0LzlasMYfWRR9w?=
 =?us-ascii?Q?9TJCpRYB4yUWoa5nf3DlL9a/7bsyGI2/PfQlhk17qZAKSmhp1M6W88gOe71/?=
 =?us-ascii?Q?dEb5M6Iw2O5pRM45iesLN5ChhwCMc+jSOm1ODgW+IEr48W9528OAXWzjaItQ?=
 =?us-ascii?Q?3rO39oiylAdfUS77VqD/pXojXewrf9GknR860UCsYF5ZPRMlteml+ZpjYcyA?=
 =?us-ascii?Q?6At9L7smOqRa65te9C42u/ztwbY9EdviJNVz4nSnwdX1E/3dynRaQf/jTelz?=
 =?us-ascii?Q?WkgLGssvqy+ANOfBfnuymNJHfFuZhBI+9tJdL9ulbMl4UYnjX5G6hVqSpEYd?=
 =?us-ascii?Q?yVWRe/94FQmyMRu5BlNqIM8PjmpQdfzeuTyOcc8/OtjGwCIFR3EgQE726GKo?=
 =?us-ascii?Q?j+YnPbr91Hcw9Q63pJHW0yq634p5BTKv3BRugNQCesy9UeCQOqeb3auJ2IRh?=
 =?us-ascii?Q?YRZDC+0A9FERvLDokIbewWNwD+qjW0ecdmoQphX5ACLr4nex1ym+q9sNNLZ4?=
 =?us-ascii?Q?qgL/IoOW1lWX6BNbU3UcPf8AanbwVpvcXtfRYvwQs4ORiGlM0GGCNAn9xj0L?=
 =?us-ascii?Q?2fuyS6i3ONcM8fRRlPB4DI7pB5NJyxcX0BjxUHgA9cRfDJ/8CkhmntFqU4Dg?=
 =?us-ascii?Q?BMTzUkkvfy5q7lBpd+5DlTySnRIwUNXjcK35fDD7rKK7zH/NK15DiXxvZXNi?=
 =?us-ascii?Q?7x2quZ6nGumgsPYsgvbx4GKkKCyBobBJsa6tmhxMvZpk60SE6uR/XeTLnr19?=
 =?us-ascii?Q?dkLXO0uHHgsgBNvyf3c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/gNiIdgGE6VcoLe7jQTegOXCImW9IsThEim14Cot5cePnJPcluDGZZB9F1VM?=
 =?us-ascii?Q?EuxN9J31HS/0FKRs3702P/lXUYB7XX49IEcS7G0sutAw9aG5k9t9VSghdfgN?=
 =?us-ascii?Q?BNS0JFUsxmOCgY7NzCbgCLQ2tRKXlDUlexVqShFqEqBWhYK5uS6+m1YAKVWo?=
 =?us-ascii?Q?pR3/IeZ/vAgBbBldBLtv7GQ1uHmsuRlrjfaBrq2ur/nSwHkKSMYK11XrjFAX?=
 =?us-ascii?Q?oXZKbmn5ylv3591bLNNFfitViH2/PDF8EvR2lPE+UnHoeI2odI6lWCyNal5N?=
 =?us-ascii?Q?R9dg1ph+BQJOPuyl1jNopPMuL4vpupUHj9jdoSOdX2ur95ayAO85H1e43kYc?=
 =?us-ascii?Q?+Nipq7AYmn5J3txhL7/o48m8gVBts3v0m70LKyiI+azrxvRHLSOYPB2rqiXt?=
 =?us-ascii?Q?RWrdbu/5icVTDdRoWfeMW5FiYcKQ/CJw5iickaUrq9S0C5JZXDKxlNCFumnn?=
 =?us-ascii?Q?+xYpvnImonFesLg0eyHaQW4Z7vzcBvgHQKp9xXdNJiwjonT7CczOGy+rkuSO?=
 =?us-ascii?Q?vECecN5IlQb7VtfAlfzNVsqABv94WbClwOE+kWk2rSQdCtxe3fk+RI+giRxU?=
 =?us-ascii?Q?hSPcKsvCMwd2/m1Kz+/cKYLeqzmPRAu+s06BRaxcFl3OgiC5zqYBD4JyTmhO?=
 =?us-ascii?Q?BePjiV4hWQUP74PYw3nIqcvb2p9yVmcxrooyqFUpMNbpxjAxTDY0r6OQ6Din?=
 =?us-ascii?Q?uPRvKGAvvPXrONyIFS1vzU1eDaZWw8i6lZbOYIta28hIvkgJGOY4xPHEK74F?=
 =?us-ascii?Q?NSy5od8BoF+zqqEC2UeL9IS9qCFyup+dfDgpPGgvOzCEHlDYuDxIFktmls4b?=
 =?us-ascii?Q?ImC6bu3Y+8p0DUBQkQ8Gm1+PCKcA43pigXKAG1VnKU9OiogsK46tLxiasUmK?=
 =?us-ascii?Q?YoQLwBerjBs/YMDRHl65LQaI71q3ahku9O2pqTYcYfvdxMsGsupWTyCsmrJW?=
 =?us-ascii?Q?79N6t+fOsTEk0j9K6D8DlrNFGd1Cw5nTcNhBH7HHdOmItlm+WPsUvAELj5e0?=
 =?us-ascii?Q?iyqfkbEr6/JnfTd8L5FBqrarVaBWFLZNHKdt7YTKZO80Id1CK+eCUahdeliZ?=
 =?us-ascii?Q?czUqxLMHJAmwFQamML+0divtKhBH3Tgex7A+OIOGH22i3JTfXPGhagPEvNMl?=
 =?us-ascii?Q?0ljzS+HFZEPRJpuHf8vPwOEthEAFNZ9vBE+9hvbUDTYUdo6q6HgloAkuFgC1?=
 =?us-ascii?Q?Iaxo17HcQtJ2sIaB8nxmcKSq9JBeAeaRlKyHrtsxDZ7UqvisWclHyfKPY68V?=
 =?us-ascii?Q?qMvgwuTNIIBbwhIqwxpqFaBSS90c/DtKwKx+41QWkm5u0gMzn2uxrjqEsC2w?=
 =?us-ascii?Q?LHHq1iqxUqE5w7jDG+UFDEuU73eb/dLBLvRTEI5dAkcqgmOhhfGEHpIkfzqL?=
 =?us-ascii?Q?c8QBb30AaGMqQSg1Ub/Ior1ADoi0bo7NWCIUpq0FyYum67eEnTolS8lbr+Af?=
 =?us-ascii?Q?uX5VTDbgst+6t3YIYNxnY0Q5YHTbteEGcNcgcFiACDdrfIfOfXP/EeW+U3gV?=
 =?us-ascii?Q?CF4gy/x4t4np4PNlQbzj56yk27lk9odVmDWx318vNvCTBI/+JWwu89YUclQP?=
 =?us-ascii?Q?0uTxnUderDSbSl5kpnUUY74vxj0UlE/BRtAJy/gHN6ysP4uZsj4wE7Tbbxhu?=
 =?us-ascii?Q?Qh+ZOyEyzOxwz8iVJsvY8uyqtETjLjMWBzzw1suX0I7ZP6rnrvKGd57nBKRq?=
 =?us-ascii?Q?psdtvD+VIxdGOaEMewGR734Cv06UyyfkpcV1wWIEJbPuUHKA4NO0NmjKJhIv?=
 =?us-ascii?Q?OwXb5xNpoA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07a255f-41c3-47be-0e16-08de70ee5530
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:06.8242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXO1rr+j4bmeLxG+iXxV93yZLjtElqaZXx++PNFpEo/Cz4fbeYxHE2T193dlWH43yZ5hSzW4kR/BAgaK2borlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

Replace the hardcoded 47-bit DMA mask with per-architecture values.
Hopper and Blackwell support 52-bit DMA addresses, while Turing,
Ampere, and Ada use 47-bit.

Add Architecture::dma_mask() as a const method with an exhaustive
match, so that new architectures will get a compile-time reminder
to specify their DMA mask width.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 93bf1c7b3ea1..f6af75656861 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -159,9 +159,18 @@ pub(crate) enum Architecture {
     Blackwell = 0x1b,
 }
 
-// TODO: Set the DMA mask per-architecture. Hopper and Blackwell support 52-bit
-// DMA addresses. For now, use 47-bit which is correct for Turing, Ampere, and Ada.
-const GPU_DMA_BITS: u32 = 47;
+impl Architecture {
+    /// Returns the DMA mask supported by this architecture.
+    ///
+    /// Hopper and Blackwell support 52-bit DMA addresses, while earlier architectures
+    /// (Turing, Ampere, Ada) support 47-bit DMA addresses.
+    pub(crate) const fn dma_mask(&self) -> DmaMask {
+        match self {
+            Self::Turing | Self::Ampere | Self::Ada => DmaMask::new::<47>(),
+            Self::Hopper | Self::Blackwell => DmaMask::new::<52>(),
+        }
+    }
+}
 
 impl TryFrom<u8> for Architecture {
     type Error = Error;
@@ -301,7 +310,7 @@ pub(crate) fn new<'a>(
             // SAFETY: No concurrent DMA allocations or mappings can be made because
             // the device is still being probed and therefore isn't being used by
             // other threads of execution.
-            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
+            unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch().dma_mask())? };
 
             let chipset = spec.chipset();
 
-- 
2.53.0

