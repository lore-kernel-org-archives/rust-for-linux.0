Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011065.outbound.protection.outlook.com [40.93.194.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C902033858A;
	Fri,  6 Feb 2026 04:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351704; cv=fail; b=piCHjEg169WDYZnn+PK9/QKszbZ2kwc8WHKFWJQwexfrBzchJ3R/45nUNvsb7n4hHZBdp83lNrpoCfypXk/tRJPDKmURNIXgSQfCefULuI9POAEI7QkFjrY+Yg4RrIAwpA29QBZW77C/HptQg6ZA8dcNPuU0Z2S4bhblbAAZRfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351704; c=relaxed/simple;
	bh=HWd9IwpCrUXqR7dfS2u14hBdjEAYZCLH0SiUYJGxns4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mDSVcH3h0j8SOTsllG3ymzNiGqUQ9F1DGCSxMdIlUeJ5iOhrOoh2HwTUJnEwG69xLQxwEfO3ued6wjTeiinW3M4YKuCB6uVYAwOAtkrZKxjtBSlEu65Ly383S0NV+y8SDD5xxszt3mLuX4qMc0KtHvqWDEphwW2L/xjUlXv1Hq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l9Vg5Rdn; arc=fail smtp.client-ip=40.93.194.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l9Vg5Rdn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIPJ1E3kEMTO86nwqMOKtnrdjI+W5R8AmLXpPuDzb8GtGsMOA9mCK8BBRYAoaBlpady2CvoTn83n6WximNUHILO4pmTrueT0wMRn1VM//Vr+X0vaDtWY6ZKWgnqGvTHE0XIHrb/mAkAeHgZxkNQ0lAS5AKXnqTYuKLt/dMsn+UMAbWTSosZmCm5/ApWI5YDJuASf3ewwK4wdqA+95j/i24KOdyrOm8kUPWuWV+VD2Bb+4k0G1pzqpMLchmkuXjPrHNcNJNhVJfATlGNnK3AJvTtbyT9AzhxxJ2A+NzchQ/v5oa8njyO5WHQP6jfAsaYIM+/i/gjoUsEBrV4PfCl/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TD20Yi9ZNK5oTd2CkE+fdOZg0waIS/6zSDxO5l2iLnE=;
 b=TiA5XuyO7CMeqGK22myazn6Dxq45nHshmwcSQTqOjjn/ctaxM19l2l8SRJiOSsx1lMtsON4TPQHLwLHnGVTG5hRk7LnVvLAJNLQav99t9BLRNN/4tKndgoFOLPoaj+x7PsBgq9IM0NwfO2qvA3ri6OXWLjvHIgCJc1PuYaGkAzglLIpKXlPOlEWiSsugq/e/MiwiRgPBYae3tdH+iUKNzURuZ3diN5TZycSYGDDP3vDRP7i6EkH3K4Ftg1Yr9B6eUV43scUSxh3kZ2hI5vjPJRl8LT9NvhmsC+nYts8JcORnwcPyamL43/rjGws3Mx+s7wrLDbn4Ry1vGFw9jRAeNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TD20Yi9ZNK5oTd2CkE+fdOZg0waIS/6zSDxO5l2iLnE=;
 b=l9Vg5RdncubkyfuLuRZZu/SeC6ESfBpkc4Kcmx0w9bBCYLlJc7JU6KqASqtLKfQ8xDISH/1WGF9qOCgRnOxpZ8Fy3LFB1vMLDUETCNrbeI+dtABuUnHa7XeBvh1Bjf3j9Idl7TVyICNWN6W9sHf4gB6vvE9vZtrnzNeFQO1xxtrARk3Lt5JaBewBUdFhDRurL3BwNapxLfgVmA7Hsw8D0h1x7mAvfUzUbjb1kM0IjHA3Qtg+0O9lJEDmJZfaf8TcIkxz2bkYmXbL48YsdGEp+2Lm9eGjrIPa01V0oKZc5C1t5T65RIxXyt9PmP6jYPwzawmueoyCyY6cCr30/7cV7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:39 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:39 +0000
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
Subject: [PATCH v3 10/30] gpu: nova-core: factor out a section_name_eq() function
Date: Thu,  5 Feb 2026 20:21:03 -0800
Message-ID: <20260206042123.303281-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:217::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: abb77f28-8479-4a43-8d0c-08de65373960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NDMxOWDwRbHucFrty8PJfpXPnsBi8ZkhD3YnlIMOyLOhlXjBm4s6Ht1qnyxI?=
 =?us-ascii?Q?H5Og4IF35iFFOHM889VsOwtrzF7NnftGvjjgB5CoUMPmk1o++vCtof3g+dod?=
 =?us-ascii?Q?8DBJVe7u6WPKctsVRnA7LSaU6ZkAeozZf0Fmh8zaB3xhOK4sUCbb1OeUywZh?=
 =?us-ascii?Q?RJ2OdXDOorSL1XVcSpDJMI9Qxn54n/4ZZBsyyFQkBNXxnYkO3Hd0TfMrVbea?=
 =?us-ascii?Q?7A4pW48f+Xp/0X0M6qNAjp6Mahb8KKQdn0X385pweD0weHVHie+cfJ9uvSRF?=
 =?us-ascii?Q?sWQyQ1KRpsLK5yiy/6sNXiCf8DfnrGLEBjWRaPwRjq+aMYEczviSvZnhbOwT?=
 =?us-ascii?Q?wPsoiqWw3U3BpMzLCbxMQ21Y/830tiYPRduQq/Mmwu3Moa03vQOwJMED4Lwh?=
 =?us-ascii?Q?PGOvMB1w3M/axkeRjPQ2uBfcviSVTyS87j/IKTnaTdPQs6ksr2+nIqMJAt+D?=
 =?us-ascii?Q?CxlYmuIj9vUE7L8k+G2sIqNYsF/U9lT4EvoRVeQNMt1QBWB8jha9OSzzbeHp?=
 =?us-ascii?Q?jSW6JOrFIwO/mDkoI3mDlmIjwDS4Nn0jLMe4eXeivi5Ae7cZI9OKIXL8ish0?=
 =?us-ascii?Q?cf2hFnnUJyL5RZICEiM6v/jFEgdXZLm1bPuIRwENquY+3k4UQMh5WkaUK3tw?=
 =?us-ascii?Q?SrhgSMQL1rUhHtAptz66dMRupYfzpi0pA8ct6tUfDFCc3OcPH30fR5m799Cp?=
 =?us-ascii?Q?0k5rgfT08m2C/0fDv13E2R1FB5BpGbhV3GDKZ76kQUKSLmn6pXc261xg/u6K?=
 =?us-ascii?Q?JCAqm5/nFixTOt9XmjZNFE/4LYWoIq1FFnlOKx6FvZYDOjj04DcrQWKuOzol?=
 =?us-ascii?Q?oIzaVM6xyZ2HJsAi6RAaliet79OisHVTzVK7Oqag5YyC5UsVJ5kxtp0N99by?=
 =?us-ascii?Q?Bn09PiRWlYWMQoIhc58hqBGD270bLoUuAur71i+W43HteqkHK1tB+yys7iG5?=
 =?us-ascii?Q?NlkVp4sZ+KSecAWCUkUk/ulUnbpGwUUfZHjcdzSF16rrKkmSoFr/p1SjnE6b?=
 =?us-ascii?Q?g0Azq+m4Old2eEWAUubOtP2U5X99vg0K/Mf6LQniXwpHjLv7/uPPvzCmlkP1?=
 =?us-ascii?Q?irDm7uVvaetbqktj6XYhyNvAm8cHATtA3CfX9EeNvxFDtttG5AkW0uSpyNeE?=
 =?us-ascii?Q?WL8Y+hAVAf1riuFfGDnoh/rZPWGZsDIYkDdXapKgBcnvaXbMPUt+HFSG3FXy?=
 =?us-ascii?Q?QF5JMhhazhjMfkiHt/nypM/Fh633FW97v7SKfGsaBn/2QBvlKQlXMALuv4f9?=
 =?us-ascii?Q?ro81p3iHmgUIBGrj4YkvdpuNvPi8DFxXR6TGIZuGHdgVgT+pybx5fTorCyHd?=
 =?us-ascii?Q?WADUvOC2olerORKPG4+7xKodNwbT6rm6aJgzQbLqRK59HC/waj89dw7t0jKs?=
 =?us-ascii?Q?bElaHb7V/t10RwfuivMTQg54DRurd31f29tke/GCH6rJ3FExkD+PdLle1kUO?=
 =?us-ascii?Q?aOFd5pGJ/KUvVLhc/wMZB1BpA/siF6tv361i9BLiOJyoBKd5FMbs9WLMtGjC?=
 =?us-ascii?Q?K5iPGb8xnEK/gA90PCS9EdsYUOmIOphp7YYD50kn3L6bha88XHGXsTpNdva2?=
 =?us-ascii?Q?7GzetXmpVjmJ1xsGMZM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ux5Z9dUMZb3MGrLJSKmh7ke9QSjoYEfQquRan4WLE2wLjFyY/+FXdI69n1J?=
 =?us-ascii?Q?h6939hUDu5oEKANQOszSPZR5zgj+e/JNisxDJbcHrTSoR5gJ4KfUvtM/E8Wl?=
 =?us-ascii?Q?vs012AoLUu/5JZmc15FMFMuPulrnBRJpOr392lbSp6eVncldRIzHUEYMu3gg?=
 =?us-ascii?Q?2RND1tQRg2VatLE+PZcjIjpZXqA3jePrpkk0pIDXdrGDA7BzX9K3A9Y8n/AT?=
 =?us-ascii?Q?ZBXgtwm4iZdg1BWwnotmPEuF8Uwj2PYCM6P1A/m93VbNIfGJdMf8B8S3JOI1?=
 =?us-ascii?Q?a9MUqziVhtRXTdtZ/8bt3R1RcBSNsZ85d6JI/XRO4cPqtyd83fugElsFgBBN?=
 =?us-ascii?Q?eeIdMbi8h/jz+pqw8DKtC/i0rfrza3FIukV6xXU9Nky+O6Vio8Y2eKBQSf89?=
 =?us-ascii?Q?IHusjMOxrRhOEx4+rAGCG3wgRpjlguVnmtDl/NtiZt6Q6b8xub0LMcDDgJDZ?=
 =?us-ascii?Q?mNSK9E2hBKUv6GTTP9mCeqvow0j+B/qjf2JVNX6qBgbO1XzBnob+6GCYRJry?=
 =?us-ascii?Q?stH1kGcsglBZQbW9lzXZiisxUk+WfRYF9snKSLob9eqJ3LgR1ZyVBGU2UQEM?=
 =?us-ascii?Q?++Sim0n/DlAlghgMKi8fqKcTgtEPWvQaygFQlTJo7Ay6AU9xWVCDMKl4rs0K?=
 =?us-ascii?Q?JTT2LJY5VsW5AW74KN6hHjVeWJWwopSu6PYI+/TdHGOFD1ozf9RTe7TZKO8b?=
 =?us-ascii?Q?1E+1NxQb/Uhcr5qBtSwkcR9TEM5OvbaDwkKOpUfRjMMc8vmgLsuj9FMEpZeS?=
 =?us-ascii?Q?b5ZOxBeBrd8HNxquJlz9Kti/KjBDKT7+zaJH1NCS3hLD90x2tPPjmJvPaTWz?=
 =?us-ascii?Q?/6+xsELlTmE6QNivk7Vfp0N8ohGsQOErQsOiczQkscX7xw1TIMB3IZpPd/Rf?=
 =?us-ascii?Q?rSbnuHl3fDxj2IrX015Cy9Hxk41M6ClaVC1+6AyKqzwc76lK4nFghfRZgoZE?=
 =?us-ascii?Q?2tg9q2LrOVSPpzssFfW7glCPOMXdwiOBls9oh+iG1FJ3VEvtkMdk2QDG3pwq?=
 =?us-ascii?Q?tuDr9jFNORRb2Z9zzKjg5txV2sUij6EB3VBZiHfDkan18UWSMznLT6X+yWTe?=
 =?us-ascii?Q?wqs5rFspqHhkNNTjN41D/2MksKKvjuXguGVVONdeYzbY9WT+L2T58O46EL9c?=
 =?us-ascii?Q?sF3+F/ygCRcWfkSRzQ0HSLim02IvvLy52/I7MYXKFJQ8/RN6ahYxG0FDz1Wx?=
 =?us-ascii?Q?aduBeWEIqYvcEV0tap6msjvT6R5h6Cy5iYZnMK5Ie4YsMF6FiDFvbtMMhBa3?=
 =?us-ascii?Q?Iab6kC77VcDxSE0kJdW/xMia5x+Ue35B+AHFTkb3nZZlxOkaEvGvkMh8xN0m?=
 =?us-ascii?Q?d6YXGrzrSqsQSOqVQbkQjWfZtKtyh6x3LX13iyppCHlAMJCYtbPqjmUZsLOh?=
 =?us-ascii?Q?8rPoTaKBdm2a+NYqycNOlluksingn+x+Kzjt/cuDlKVO0+Ks/79bTjzk5ahy?=
 =?us-ascii?Q?8lOrPcvJiIERRtqPl6lRz/7iNZ8IupdwxVpGJWZ/Axm8gThpWnJ8fRVsndDX?=
 =?us-ascii?Q?425HPkgTfa5vXagShs80LnyxjZ0zqFO9/2tPMKX5/p5aEeEOqfwn0GJwIpwX?=
 =?us-ascii?Q?KQ7yyZCX8T9Fdh/iqnG5b6Pibu4IRy8ETrrMEv6G2zP0tUird84KIDO6n9Oi?=
 =?us-ascii?Q?kG0mw9nsCKTHkF8rnQnYDiuDf4WEpGocp4r40MXUpnWdl3ppzIkCqzFdSkM/?=
 =?us-ascii?Q?k7sonZH8y/psBy4xZAZwN/hZsVxJS0gpR+C/fYER0XC4KCNMb6WW/wsuVXGV?=
 =?us-ascii?Q?CA/+0Nxgwg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb77f28-8479-4a43-8d0c-08de65373960
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:39.5037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vSH81JmvOzuDFZkEdw6sM85WdvNsv6nN18fhLqmx9uaf8bWwNo9Gw+9R0dWSX/mNPGIPOUGMJT3hwMWZiDedA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

Factor out a chunk of complexity into a new subroutine. This is an
incremental step in adding ELF32 support to the existing ELF64 section
support, for handling GPU firmware.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 40 ++++++++++++-------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index a0201ac8ccb4..72cefc3142ea 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -464,6 +464,13 @@ unsafe impl FromBytes for Elf64Hdr {}
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64SHdr {}
 
+    /// Returns a NULL-terminated string from the ELF image at `offset`.
+    fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
+        let idx = usize::try_from(offset).ok()?;
+        let bytes = elf.get(idx..)?;
+        CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
+    }
+
     /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
     pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
         let hdr = &elf
@@ -490,32 +497,15 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a
             .and_then(Elf64SHdr::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
-        shdr.find(|&sh| {
-            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
-                return false;
-            };
-
-            let Some(name_idx) = strhdr
-                .0
-                .sh_offset
-                .checked_add(u64::from(hdr.0.sh_name))
-                .and_then(|idx| usize::try_from(idx).ok())
-            else {
-                return false;
-            };
-
-            // Get the start of the name.
-            elf.get(name_idx..)
-                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
-                // Convert into str.
-                .and_then(|c_str| c_str.to_str().ok())
-                // Check that the name matches.
-                .map(|str| str == name)
-                .unwrap_or(false)
-        })
-        // Return the slice containing the section.
-        .and_then(|sh| {
+        shdr.find_map(|sh| {
             let hdr = Elf64SHdr::from_bytes(sh)?;
+            let name_offset = strhdr.0.sh_offset.checked_add(u64::from(hdr.0.sh_name))?;
+            let section_name = elf_str(elf, name_offset)?;
+
+            if section_name != name {
+                return None;
+            }
+
             let start = usize::try_from(hdr.0.sh_offset).ok()?;
             let end = usize::try_from(hdr.0.sh_size)
                 .ok()
-- 
2.53.0

