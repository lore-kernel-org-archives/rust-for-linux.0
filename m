Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010054.outbound.protection.outlook.com [52.101.61.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CDA2E540C;
	Fri,  6 Feb 2026 04:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351707; cv=fail; b=NVoSdldr5pVNNfnrv7ZDsCZj7H1Wwh5e4699kQ9WQYsffiTIpAMuRGxYbj8obFyt70Cvez3QvBiYkFpDj2E0OgYG/6Js5ughEFFUuqsXmwi31DYBQm8G7K2lSOSWdzsLQs+OwgTE6B61aRPAnelNh2MTnGtKyFgpO9Mjvafzcgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351707; c=relaxed/simple;
	bh=/x4AL0YlGIsFeSOYwxwHWynA1uQQr+GAeOiqNingy0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kEhOEnV7USmlR3WHQK15rIKoFrDH07rMtWpmYhMj/OuFtILdjgDzDl0bp7NarFbuc26wEZUwe34bZPpNQ197LpQNM73amlGF2LvxLwr4UWTs+KCtZtwTePSo4N9XwJg6aPhdazKce7f5FvIRJapVODGcnxobPZ3xQJTdlFYhYjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mNzXaPxk; arc=fail smtp.client-ip=52.101.61.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mNzXaPxk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRsOd8sJVWKz8l06kaDQ8oysTPVbXGUReshdXvwqFMsLOUSuKYaCjOpi8KFXWKLUpIHfoq/svpyoyTPl6IUGfafqVbUcYT53A2kjwNBc3Hr2bjRYawDa4Zd3q4DdIPKdvVuNlY1VKCHzqE8JsW8ccOiT3R2yWTIgFRP0yLbOObDpdZ8/UH4gbOFhGMUVjr5raSY8o1K6T+KFm3VuqqFg2Mvmi+601PFh2JKU29t/YvFiCnp9JmuX0zo0I4YfyIvPQK1Tkkd/ouvnVAyvcVVamjMgXnUC89gEsJobeVgEy8aDr9TQdIdCQJZJ+sEyX0GISGHtF9FA55jas5mho1JEuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcrw+ujC1FvnHOzW0591xzV+nPfp2dRJSFzFab8NHFc=;
 b=incoBsTp+3x2p1THfcYxure0Ox6vybJdtZ6k16iQyWLfQRJ4MvYWlusS/5xhs/TdR7wEY1Ih3CcgFQ1qj91o0V/Q6sqm0tQ+vg+CMYfefUZI3d+jI1BfHZiq2AJpLtf/MVZRbrg8BSaNUHciZ9rg8GQ4hebUfATPVtOn+VnsPsISrjQqTTDzlM+fdhWKfY0WUSwTIYIpv3m2xYat/d1sJxKviPhGjxa6UMUW9W1yZMqNMwOLf3HZhStNd3GzEgqI/u15QPOnDqmgXyjEyvV5OdW8iBh0jRzejMR4nCV5FGcFmUHaiXF3qkojOu0dYX7qWax8w5qSa5rfMfJ+hAu4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcrw+ujC1FvnHOzW0591xzV+nPfp2dRJSFzFab8NHFc=;
 b=mNzXaPxk+S2F7reKzNevcbPME+4L8gyuhBKGFfBbUkKh+iNL7c4njMBgQkRbP58Er7xJ0r5eJXuqO8CN3HILsqvakqIiR/dFHoaX4bZnHpNXCQgQ9e+NyWHGX9+EcCNX628juDsw/8HRgNGlYkMKsnBkSEOyTFwNAcjyKgJnxSFYtrYCVvoDTz2MwlIsxj6gclyDLExg5bUCW9H+Fd+j14YrSFnSnPjSYGgQTdChjBCXZ3GsQk5e9BEot7ZvOrm3j38txC6n8j7Uqp7ipLgvAiwe4GJuJai1R2esz6e9udnxuAv1VeJIT/I6wbxjWIf0aInS1CylwKYGp9joUIGD+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:43 +0000
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
Subject: [PATCH v3 13/30] gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
Date: Thu,  5 Feb 2026 20:21:06 -0800
Message-ID: <20260206042123.303281-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:a03:333::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ef6c52-67ae-4e32-cdfa-08de65373bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3fv7mybT4S31dMMhpTXaK2OMO5BRh4dsFHkNlnve36PtKzrG3LHuyI0B7Yap?=
 =?us-ascii?Q?L3CVdEe5MzBpERuW4v8QuCAOBnW+AgsnIK9kKpBanDJ0bxI+vTbvnKu/1oke?=
 =?us-ascii?Q?++A0vfjoSE+gGbyKf4O7pNpUtG+5dKtAwgDiMwig20XPdOLbts4NZ2qDBLIV?=
 =?us-ascii?Q?lDte5EI4HRlzm/C+xY99x4jFu/cO4iUD5eq6KmUohACq8Yw2ggs35r4Rwq+n?=
 =?us-ascii?Q?6u+1KHWcbVdozevL2VuKa796XR0V4xfkwjZAMaisJ57mCxy0yeRnwCAmxX4D?=
 =?us-ascii?Q?NZcRGgD0PPEoMmpw6hcmw6ERfMWLafGv9XY2aTaQMETWWbEDsU213aXqNv2U?=
 =?us-ascii?Q?72xjTgMLCU1T9SqTZ6ld32VYbm1lUek7guwVEulhysHryjYKVU26NZcp0InC?=
 =?us-ascii?Q?6kcdMbiQeYUvx2TZw3tGei3Rt+hKl6yhfTYoO1JoEKuDqFOxEls2WsTdNkiX?=
 =?us-ascii?Q?uq62ai/u9i3YSnbJHbJA7BIrSd8zIKp4JbYhYzOGQl2+RxCA7AigQK+9CmEb?=
 =?us-ascii?Q?3ng7pOHJfh/Pz7uTXPx7ebW0OgKGBMkh9KDOjdhT9WndyaFAKDH1aSAnikUZ?=
 =?us-ascii?Q?tMnFea+LDkJYcCQ6V9KlPNbZZLSs2fgCcUBmQy3fBqICZo3ZUqzbdan6dEEZ?=
 =?us-ascii?Q?nl692x3qLs8LNDtSsdW6/L9WcGJOi+DALG0IJHX43FUABlaHPfMZBfCYxGyR?=
 =?us-ascii?Q?pFNhdO/UbMhmuTKSOPPxpMp9U9OEsrj28c9iCmnFrg2T6qya+vXF/szND+Zq?=
 =?us-ascii?Q?Zygz8X9py7WJNuXLnLDyabNFfbrvOqJSVcb0DkM2hqaIyDAxLqvVK5ZA3E1z?=
 =?us-ascii?Q?PzJn3qESZzjGLjNcGP7S3FtFCZDARvibtrdeVkchCWq53V39DwIL+qWebVjd?=
 =?us-ascii?Q?YqRawGpiC4jOZH55N+ISTt/IuJJkkS/PaxiZ/80WRe4x9x8OI22zZ+iBKvse?=
 =?us-ascii?Q?UZbC+QF3IpbpziVD4CP6gZ2btkaGG7h18GhrzzsUuglKWUlBfKle/Ze6+IJj?=
 =?us-ascii?Q?vIS/fOdM2hfFJwumCLUpy/YxmY8UpHk2avhBDaFa6X3/7+aAt0TlMrV6i7re?=
 =?us-ascii?Q?w6hMqW9AIwkvMWn1El27Es1RFHh+aQxjkz6qbl/vUTcaNXplqwLhyBn/q0vM?=
 =?us-ascii?Q?ZcODNvQDIaSyUi9jP6GHzIS1ydlEAWV+tNbiAb1uODXphFv0XOOvt0LwIt7s?=
 =?us-ascii?Q?eVTORAjiXyfNQfucDy0b3/MjjBssiiPwibNMRQAv0R7muDNxsXley+tqpk75?=
 =?us-ascii?Q?f/+zuOKfP1dkEfD/ps5d9VVSwdm6l6MgD5xjiv3dSkcS4JcPiPJI1uYm+q52?=
 =?us-ascii?Q?gJfiiate2zaI83od19iIByzEpc0SIEOty5eEIdRNYpjyS5/R8471gSfwulMb?=
 =?us-ascii?Q?k/AQShlSPqhpH7Li1uGS5Q3c7IUYvFGJZ+OI3qHdZ/NpGaLL3pxgNqFpm6Nw?=
 =?us-ascii?Q?MgHuwn/IvP+tJP3QrrA6ebVCLw2tkuUZMy89a8sfmauyegzRq1yeWX5LFo7d?=
 =?us-ascii?Q?SSfWcxMoZOAhmhe9ZlHoHQiRG5vo1wTSX/7a/H/LeMciywoBB8dXoN9RYt9E?=
 =?us-ascii?Q?bsOrszAl4z56BrhGVuM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b090fBp3Az3EJD60dUx+pC2jWXzSHLXtYNdX9pk0rMlcR2MYxzqdRxJIuJUB?=
 =?us-ascii?Q?FMCrzTT2n6DBkL6cYDBUmbc8sGEKovNHW1mcg25xaBePySWtjn83ag8LQwfq?=
 =?us-ascii?Q?y/E7MUqxAeN73gLXledZCpDKhCghnzMwpir227tbi+7lrTaHzpaSeHprksUI?=
 =?us-ascii?Q?JFsViL1JF0iEiSB6pAQKgN1TvE3zm3nciZMIuU4JW9k+rGDp1Yye+XaMQ94A?=
 =?us-ascii?Q?gbLsLcJxFhCyKTGu8JlTycRDTzTwrrHFU5oSbTD9SP8z+ljv/tQRLZlruEhl?=
 =?us-ascii?Q?2D3hQ67xCPX9gcDbg1/Ne8n86JXREIDPlGjvcOXS5kFGyX6kDGEyXXhUbsLe?=
 =?us-ascii?Q?A7oF1ekln7Z4AE6xFYnLLjhUBHfohzJr0dh0YXJBYD/0Ct1IvfzB4WXTQJ7o?=
 =?us-ascii?Q?5qlxBcT8TmxTefuix48KAX5ER5OvN6o5oFjaDeVwgkFoojCSSnTZB/g57WoY?=
 =?us-ascii?Q?tshi3TC/ROa09CG1bdyCVtpNZv14Sgc4vUue569TdDIgHr9ZeL4655X2MmRB?=
 =?us-ascii?Q?fMT/t3UT+h75pjKcQp4cj8nfz0ec5hIDTdsmH+Z8HIOEnnlHTAHHMKStgXQs?=
 =?us-ascii?Q?+V2GWakc7SFl7niyEUi0slMcDUBPMWwWTgyh7Ce69wMDCx2fjd9P2vpdV3FZ?=
 =?us-ascii?Q?0C9dNhkc0zBS90QR0468o1jkuFiu3akZ+Pa/5tCYjWiikVBMcWq1MWOlf9jk?=
 =?us-ascii?Q?IWx1Shk1wyCF542SQNROPIYRulugYrnM+x2RwKxF1bdnv7Qdardws9cG9ngk?=
 =?us-ascii?Q?3ygJOHzi+TuqDCyRQiwgxfA1ivlWRLlBJYJca3bMWX0r4WIfIBx8C/7cEWlu?=
 =?us-ascii?Q?qwjPBGlnWn7ITFlMZdr+OXiTY0kEwGJSbhTLpYDY3UTl88xMaBFjobomhOTk?=
 =?us-ascii?Q?N3gBBuV2kqsve8oyBPq7V8U/k5oOI0y1v7ZwFLrpy53vpLw1C2fuF6fi6i37?=
 =?us-ascii?Q?Mz2gqPq4nmjunCpgqXf1iun2WsU2+fpUMptLoAh9K6HS9nX2rpiSh37JZnkG?=
 =?us-ascii?Q?S387XMqSjRv/rTgTUWXjtiENOsnFF+Z3nRk8NXZsWvjTwvqDZsxkwhcdvHt1?=
 =?us-ascii?Q?SX70qCTtkv99sgk9b6EAhzMr3v9yU7glc/p1wNMyByjXUEavzqgC8eBVX+mQ?=
 =?us-ascii?Q?7dsK3xLW1JLi4fyXEDfUKXPJ+xbGbZuNUQny7SfJEWDQA1RBZP2Vih48tQqN?=
 =?us-ascii?Q?dw0cfcVJJQGTPwBz8cWUwa15tPKwmelzNS3NmPl341AV96VG/ffef2cAhEiC?=
 =?us-ascii?Q?UxHmdE6MUqONe9/2hfSkkjcPEQV7a+ZopV2y3TeEZHQugPH1yeuImQGS5gLk?=
 =?us-ascii?Q?0e7usW+CqyYhx+Q5yGWnDX+LMMsCQrqTmrHA7NA77tbE1rX5a/h0+8ZJCqPo?=
 =?us-ascii?Q?Qm7K1PLV+llHRMfORuJSdXmOm3PVcNNXjmt42idtjC2ty3lZ5ZxrTt/bi7W4?=
 =?us-ascii?Q?VqY38tZQxmgZjA9iQKODvppt99YAXQIC0V6eDwOAjIAz94+nEAp/woaMY70l?=
 =?us-ascii?Q?/eg1cMT9Cq/i1/wYj4dyaXHo57ag4CeuqO2jhCxzcL5iFMvBcWD4tiqVtlUI?=
 =?us-ascii?Q?BLr7QwkJky5B8iZq5qua4cYLNYZZyrQZ3/TQZYfpBxmgEFRtyiM5jVwQW4Nu?=
 =?us-ascii?Q?lhL9U+FsoeAEg6IKm4cpT+lghjEG3gQ1iMiRSX4BzCeP5WxcT6TnDkNJky1i?=
 =?us-ascii?Q?Mh0UrSNi/rDixOySxMmznEg5aqtGwu+2OlcJJUfuaGisPTCPsDa6gtWSuUhy?=
 =?us-ascii?Q?E8Y4GH6kjg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ef6c52-67ae-4e32-cdfa-08de65373bc8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:43.4952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1kN6amok0cEFF//xHewWgeTTTIzJez9SyCWkMGboKLXChdRSyARbUH8GjDAZd5UEpfx5qo0ljW7PA5uXRbS/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

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
index d482dca8cce1..02a66b89cce9 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -103,7 +103,7 @@ pub(crate) fn new<'a>(
         pin_init::pin_init_scope(move || {
             let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-            let fw_section = elf::elf64_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
+            let fw_section = elf::elf_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
 
             let size = fw_section.len();
 
@@ -160,7 +160,7 @@ pub(crate) fn new<'a>(
                 signatures: {
                     let sigs_section = Self::get_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
-                    elf::elf64_section(firmware.data(), sigs_section)
+                    elf::elf_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
                         .and_then(|data| DmaObject::from_data(dev, data))?
                 },
-- 
2.53.0

