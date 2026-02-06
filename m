Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013071.outbound.protection.outlook.com [40.93.196.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A627234251A;
	Fri,  6 Feb 2026 04:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351721; cv=fail; b=CeSYm21nlEQmSs4P+JwSKjajYmeDIQC37Aq+By+8EPynztM8p9kN43MYPWtsT71M1gLoeU/9iB7ZUxtIw4ejLdM03Qie592j/syfCT3QBmMsA1PY42GNAQnqj/jqZcSijoVzCH+ei3CliMKkMAA4bN5gyvR3pU1n7AFiAWmPfW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351721; c=relaxed/simple;
	bh=NAlutS6lYKu49LqpvAln8mayE8s5hwTDWJLFyq+/XEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SpCi9o5frlGzyvU6NLEDGvVgLQa4p90/eHblaRINMIK2kxDqkdF20FiT5/fOhc0kS9B6Nt3D1iiOga/RuWQN+SOOsZmZ8x+zR+zmS8Kp2Lbf7ZpTMzMV2Y7E75UvZVofZI4xScjjS4T2uKM36L6IZIqmGZIvgVHjkadNZN+77KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kW0kmaMN; arc=fail smtp.client-ip=40.93.196.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kW0kmaMN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+970UHUQ7qj6hXqNhn+P/XAxFXzogjq+f0dNXDyzrSKcBTwLx9l2Qv8/sEm04U2y63WX0c+wSaZLAu7rG9berEYPsfriaUybqtpH50d60ktCHCu/CnJUZTksLLdeKMLHcaMxNsjU7EQNsXKynp7cPi7vksm7YkwslgYltLSTwP5Z1rJewc6KAGSjvubeyZEAIj61IYOvWE5QuUXUMnOXyzLRHWfpPRreaFSh00RJIEVS0MPLiFyju5tup0BHoFxEcu/rxVFPJ7iDabmonBwsX1/J/r6s3hLi3S2Yyh6CIRwzQvF2tEgiMnm1I2W21sDDDLF42hIfkH037TAbDW9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WM98imav+bXAUzgwdOnP1TzoHN6WbVhh/DQsig0OY4=;
 b=Jg/bprIklYRxpMNdrHQ124t2mRoZ4EM9csbUHroMUJtzBePmBF5sYBhkJ35Ov1B2GrcuE1rwyGVtIdujxaF2v4sjDV35z5wYD6MzGpu9de7B9oUEEqPXd3iJrD+e5v+MImhn7ZeZI5Pxf6153ZeDaM7oPs+Ijty3Y1pqG9W4TDhAHkwfGG4Awk6rHZyXhXE4E3C3tK0osRG+RvFBMJeTCbO5cb/VgOszx34wAViedVPcFqOMwzslhyhccw0p5GuzEVm5hjOZAwf9ux/O4b4R99EvVxakU5JlvFctCaLnGZuWnl8jaVzuPfOUgp5tXhpD9AQ+ktEmBgmoq6tjtkqWNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WM98imav+bXAUzgwdOnP1TzoHN6WbVhh/DQsig0OY4=;
 b=kW0kmaMNsPmUWw1CXzt6B9yAoqoTaJ8VJb0kmI8szPrxTMfO3XpIxrFyDp46Fn1mOhCwpNsftJj5dHHAp7U+pWYCmWTHy/VCXyKg6YAgYqU0LETYtKogG7xqoMZSmqGdLH5PvCrFINFFkYxpL1YXh9GfI4SwIJSrEbH3c7r7tvg+XCQkdD46gK/g5JlDZj2BzvIAEM8XDdhEv3IBYpflkV1eniD0zvO0z+O8G0kICjyG3NzqOZDNt2UZ6Igc9zvKZw3qKfT6rg3v+FKwA9unADOIM9ajChFhmfs5d+CbfqjJEFvKw8zShVOy02hekkhmODwTqrcSHFFE0PA1pPMI6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 04:21:58 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:58 +0000
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
Subject: [PATCH v3 24/30] gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
Date: Thu,  5 Feb 2026 20:21:17 -0800
Message-ID: <20260206042123.303281-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:a03:333::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f12480-5d38-4c69-cc7f-08de6537447d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ExbobN1j/fWc7bLhen+9OAvp4S7Kvpg/oDJfE8Eq7C2HvDALw82DAOCI/E9A?=
 =?us-ascii?Q?WsIN20n9w1mFFu87ND+m1XIIV8wYz+vObaD59KGckIO7Py/iwsjbdStDjtZd?=
 =?us-ascii?Q?24uR+8gv3YsEYws7u1KQsNDIiEOEehqeYivyng3EGBRLDFRtLndRdGY2FfY9?=
 =?us-ascii?Q?QWeMj1TBBsQbcqMHoB5w5vWGXtm8IOdnauZ5eEsiA0bkPIKzlyloLvauAVng?=
 =?us-ascii?Q?Oyw9iiPSLVSYl01fmFs2zcsFbCMoK5ywKjZ3O/6mkvOlKlAe15IC6NK3XS8v?=
 =?us-ascii?Q?wwjO9BaKPBvsRh5PYJQVSwYA5LGDc7VZJEtx7m5mwo01O859hgeRHOHOENpE?=
 =?us-ascii?Q?9pDyLvLZvkzsvGud/9KijE7KL0ZrLiBItpPKBdVxyHsoCjxW418E0u7BZxcR?=
 =?us-ascii?Q?eLvDY5UJ06O1Cca1IXP29UjVYvGhluVxPBcVuwgWywoB6ZlFqioJ4HcR8Byq?=
 =?us-ascii?Q?fG+tRUMGmEqk8Fq9Ezoc7sgFPlK4IW3YF6hWOOmXOF3a9KgactOTqITMDqdD?=
 =?us-ascii?Q?QUVB8Y8SqpoZPpJJbx3cXYQ1+bLHwt3yG7vox46Q7Miwm+cP6oQVkwcm2Rmv?=
 =?us-ascii?Q?0ddoRNXLrcNem+fFASbrTg8MuAgQP+1wP2bOE1f3a64IkyjfW2ghZ8Q0H/6+?=
 =?us-ascii?Q?JsP0DUvyjx7GAoLXl8vNxX/pCZVDKX8x6Vmb+/8Y/iVvfARkLKcP9/Fha4mT?=
 =?us-ascii?Q?rcmIIQSLAM7oAEdCUdyVV5lADYkQBTZUR2DB4BCfvkIiYMA0DIfx+KPXrMm4?=
 =?us-ascii?Q?2LJT6qEBmMTvntkbkPhQINUETlE+hnnm1lNg2Ux63mQ7PoEQpJG0KM4Yg5ae?=
 =?us-ascii?Q?WLhPtkmlN8Wpj0R7h2mDfwqdkTuvwJP0kXnpShWQtRwLeBnA0u5yz9xWA3fY?=
 =?us-ascii?Q?U3LcPsgJyM+HnohLGjXlMFS0Cv1coDRgBzK1rzJ7cSX1okqUzaSkjhY7mxsq?=
 =?us-ascii?Q?nQ1HpLDemAtPajX4mICW+Q5biRllda49wtdWofdTVBN/y72QG7kURpLSfsek?=
 =?us-ascii?Q?YPhzDmhYCBwRgr7vNakDCm9ms+WX/s0QSvU3t7UJ42bNGtIjVFGk13PJKUbs?=
 =?us-ascii?Q?7KB877SJYcqqbctzEua8JoKXIs/1caZdT/o6q2PfGxm3QhUQldYfGZfM3h+c?=
 =?us-ascii?Q?TeQbRkRKmjpGVJ/CnOCxhY6rTsshs14ulirCnMCqRsUzZfIqq0kSPPur3eX2?=
 =?us-ascii?Q?GvJTGMW4IsmlWFOlCcecAweHEgxscrFVyW+KmwuSu2xrx4DiWr+IYZSp1tSN?=
 =?us-ascii?Q?uLnYNVzGsOSsMS9ddNAsxalCCLqkheTMC1US6rFuldW+MEqRfGBW1pyx+N95?=
 =?us-ascii?Q?1oyWq9px1L9GJIjSmMG9r1EBDOWz9kABgb/bRkxy0aYiV7cdSb5nmV4BoNlM?=
 =?us-ascii?Q?NYxyp28M57ftHhjkCCHU5Oe76HTcAjui47NXijc8pSrAl3DDDIpcboS2O+RT?=
 =?us-ascii?Q?x2T7AkfU3RgI/4AkKg+cEVkGqDdF4qnkGHQaM/H1jTgUm4/uQYOe+HmY/u0L?=
 =?us-ascii?Q?C2HL3enFl5Tfe+PUlYObFl5nKOeB3LP2TqE+QA9+gzxnFOKPcRH5qnFo46rW?=
 =?us-ascii?Q?bRC+BG/u5ABhd67I6Ow=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?webB1UknB/PVWFz3FinIXvGj/G/nVKbwB93SDng7S4kJN7SacEziz1xnzJ8b?=
 =?us-ascii?Q?CU4sgUQI5t6wbvkbJiWTAYWz8hCDQDwexjLc02ReTAvIgB+/b69GpyPZpDO6?=
 =?us-ascii?Q?s23psiFbN1yJ6UGfDu/mcSh8HHKMlHp9ePIoshIGRsinN9XNAAkfeXuDGl32?=
 =?us-ascii?Q?HM5yQUD+ndqG/eLbIxk+oW0fUm+p3HOCfawC6IaGLFX+rYm2do6adg2YEjkm?=
 =?us-ascii?Q?YNWlfcTrm7sloP8/kDpQY3RHSAMPYKTJAD68lVjweHDSlAe3A6P45kABvMcS?=
 =?us-ascii?Q?dB8R7uHTheYlFzpesy/loJL/vbe7vMR2v0gXeAo+xocKcoohY0QKurpaEKh4?=
 =?us-ascii?Q?CNDWmR9cmrrrXY7ssIhU0+jEl7P2N9/fQfLi04bmwPhIFeCCdzimr5FdxL6d?=
 =?us-ascii?Q?l/ROPAzgmWE20kL1E/uQ94V8OTAQ6qeur94QAUQcfVPN0z91xNR1YP99BHqY?=
 =?us-ascii?Q?cROH3BLZT0g5vgM4BNtP+4nTcEoUBAA8UpBLclE3T7PxKAyRNMZXXj7i4Ut/?=
 =?us-ascii?Q?oaFYMjyS7Z5Srz/MtrgMY4LmIgcXn8cm5EhAhsv26iTMf4WxbTv5Vyxj84jk?=
 =?us-ascii?Q?wuoctyNqVDud2Nb/N0OjoZWxWND4J7NQ+vebVpW7WzjrnXJNxDV5YKMinlT/?=
 =?us-ascii?Q?CXuMOPbk++mhgBMrjWwB4A5OevvfFfw7P146qgd2AKsRfIk/nSOeMzaF4pb2?=
 =?us-ascii?Q?0uENJc2AGs2kZaB5R5TLy/EXoyiwE4vNUbyyPw0KknfQFXVWYgrFKW0lYcl6?=
 =?us-ascii?Q?fus9oQdLa7hFDZAWSL8EwUD07K8OQzQmnXobWN4tND3wv3vkrkjUYeJFQSwa?=
 =?us-ascii?Q?90KZZrlOYswrrMpcSt7uLrHvowoc0Gvm9Q+ti92fnzJB2Bx8b5cMinjp/3hy?=
 =?us-ascii?Q?UWwohF8SW6nPKLCbCNlyk7dkJcZXbI1HbC+DiiLzNgrBfw43meHGsN5Bf83X?=
 =?us-ascii?Q?NfxgRVB7bphsOPrVzC86nN4aNkTGfEIFJUIzA/JMK8EzIvsqjitNs5NgFo+L?=
 =?us-ascii?Q?YE+Lln9kkk33/xLkdpJOTP54gFBr6HE5d7O0m8kYhZO4xv3mNuLGKSWwkMOj?=
 =?us-ascii?Q?SBx5pas/EglSpuhg1Y5pkUj0lvb/+kAmR2Np6Ogsb9DbgZr0mwgesoiwAzTa?=
 =?us-ascii?Q?CtiNnc5tTURCjGbAma1F4c0weQfieLzUlefCj5H67o2dnRtHj2auVQX9zNex?=
 =?us-ascii?Q?tJF6Ehy+Kma12zZ2VQy817bvPMiHd9t4RB2tuzsSmK79901c3UURnsPm5gHu?=
 =?us-ascii?Q?JbZ6FewHRuyA0j/AQDXI5pnuNTL6f0yb16Bd95neQUT8FAwEqWhRz4PUjWoR?=
 =?us-ascii?Q?RnkJVCIXQ+I7OFDRpeEq7oR3lkOiEiVdSS4W/v6st30Y+D3uBZgW9PPY7kTe?=
 =?us-ascii?Q?m9Xu1es0IOMvlDjyUHTUhNkXXKYHPU6uP50wgywylcqRP7BA6b8D72Q+cjt1?=
 =?us-ascii?Q?Q849jXRrmzxTWAf0SkGjB54PFSXerVdxrwOdVbh98k+0hLcoKUl9b3+HxvCp?=
 =?us-ascii?Q?In9qnMaq0B4qhU3BDaunKwVGxrVuiFQXKcwr8BQ36OFL5VV7rtl1efVn3Ble?=
 =?us-ascii?Q?9JXsBngC/f/w2NfQftM/84jJ/JhMFhLSGMiJOfYbpi17nb4844jTOANT7TkI?=
 =?us-ascii?Q?SQCBYcKb8XT4BLjCsq3kGLcpv2+2KEskGJZguYhZIjyvcCmjzOQmJMUQUXpr?=
 =?us-ascii?Q?lLTUBEAiBf1ZCLynsfP6jjQoRvXdtVF/aCBIi3+2F60lSG26rKIkGsYmOC2R?=
 =?us-ascii?Q?0wOEy/bxQQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f12480-5d38-4c69-cc7f-08de6537447d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:58.1379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AceDzrmGyEVGDs94mSiQOTC6TicF9akpcrHFEITSKqYBWCGiRUHW9y1bFz/dJdhJg5aX+ldsPF/4BBf0BeShCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

Hopper, Blackwell and later require more space for the non-WPR heap.

Add a new FbHal method to return the non-WPR heap size, and create a new
GH100 HAL for Hopper and GB100 HAL for Blackwell that return the
appropriate value for each GPU architecture.

Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 14 +++++++---
 drivers/gpu/nova-core/fb/hal.rs       |  7 +++--
 drivers/gpu/nova-core/fb/hal/ga102.rs |  2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 37 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/gh100.rs | 37 +++++++++++++++++++++++++++
 5 files changed, 91 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 3a2b79a5c107..7c502f15622c 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -98,6 +98,15 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+/// Calculate non-WPR heap size based on chipset architecture.
+/// This matches the logic used in FSP for consistency.
+pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
+    hal::fb_hal(chipset)
+        .non_wpr_heap_size()
+        .map(u64::from)
+        .unwrap_or(SZ_1M as u64)
+}
+
 pub(crate) struct FbRange(Range<u64>);
 
 impl FbRange {
@@ -255,9 +264,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
-
-            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
+            let heap_size = calc_non_wpr_heap_size(chipset);
+            FbRange(wpr2.start - heap_size..wpr2.start)
         };
 
         // Calculate reserved sizes. PMU reservation is a subset of the total reserved size.
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index eaa545fe9b08..ebd12247f771 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -12,6 +12,8 @@
 
 mod ga100;
 mod ga102;
+mod gb100;
+mod gh100;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -42,7 +44,8 @@ pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
-        Architecture::Ampere => ga102::GA102_HAL,
-        Architecture::Hopper | Architecture::Ada | Architecture::Blackwell => ga102::GA102_HAL,
+        Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
+        Architecture::Hopper => gh100::GH100_HAL,
+        Architecture::Blackwell => gb100::GB100_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index 734605905031..f8d8f01e3c5d 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -8,7 +8,7 @@
     regs, //
 };
 
-fn vidmem_size_ga102(bar: &Bar0) -> u64 {
+pub(super) fn vidmem_size_ga102(bar: &Bar0) -> u64 {
     regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
 }
 
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
new file mode 100644
index 000000000000..eaab3f934f6e
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gb100;
+
+impl FbHal for Gb100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        Some(0x220000)
+    }
+}
+
+const GB100: Gb100 = Gb100;
+pub(super) const GB100_HAL: &dyn FbHal = &GB100;
diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
new file mode 100644
index 000000000000..6c56b8439276
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gh100;
+
+impl FbHal for Gh100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        Some(0x200000)
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn FbHal = &GH100;
-- 
2.53.0

