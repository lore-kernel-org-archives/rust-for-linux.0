Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC10E32BF21;
	Tue, 10 Feb 2026 02:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691606; cv=fail; b=rzE3ezD6QJA4EbqSaSaMMA+Y6zPoZXF65loqvZluwJcJX/UQl0E+H/fyV8l5MQeq/mQEsquA9IsUkuMwIW6yqTvKI95k2KjhIpJTavbHmq0XGKQawkJwT4iZ7bSV6V6YACUw+cUVjdQ8ftBYOs1NWfWaLz5LC4PyD3i3sIOk8HE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691606; c=relaxed/simple;
	bh=rjykeWMmmveWu2ttIqh/+MtpydeyDnL9zVL/QdvZdEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DOTw4OJD5FvMmO/a31OuZKSRZAldQX05EezuGXGCAU+b4ncu7W81c8Ebd7h6sdSzPEHc82PWMzc4Mj4j7Xkc86qY1Kx0q8jamsMGPi/VW/Yfk3RZNgOflBTM6R5Ly/9XP5FNoNn2TDydm7nJsx4jdkc8yJTmKqo6LMFnIuWzXWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DLWraaNZ; arc=fail smtp.client-ip=52.101.85.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DLWraaNZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQ8aEKcN736Ds2kDLUarUbGxFWty2I2KLzZyKPinq8BSoG/k0/YYEbdwUV1/B2mMqEa6+A4KLf1mifWbSwPg3BJMvZTRw/e/TUWiBPpsHIWQjwLeo+iqb+QV5AFSwyRQXEcmrxblwrP3IC+XiTJGcUyQSAjs+ixwolJPdj7zPHWFExBMetLVOmX7Hyg1qk/X5DgrwqVNdhSydQJTpPNk2h7y2ruKYZX9Rie5P9TOPHE4CmWLpGQbvA4Gzu0e8WymeXaWj/cxFHX26MEmd+zno7j7AqgVa2TnqECDaHy34+Pj81oqUgT2RikPuiz7uYW1kff06gIjMnGsfarYm0B2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AJl6agFUhduxqRWxUfI5u8ZDRSqSnKul/om9nBi7Mg=;
 b=ZgJ8tqkth1CfkbsUpoEWWrvYiYpRk89+Q8yPKLUYUZwsDrHKo4ndomzJT2Zyz3LQeJqXTI8FncglkhaanlufVW2oywOVk63J03vYWXPa0PkVwManqqakjp967GhJTgpzwCUJt3jkqdYmWcqc60BZ8hptit5MqDAWTNKJ60y2Dtyyw89sEPOX3mC4YMxEhqqW4nTfRYF25bi88wm7o/pqS3lDufNGyF5nKLWaKEVo+gQf57iJtB4fBRbQQ+FfCIIaAp4iyrKIYhmm6xQCuJtnma5VTdvPoSEiUqWXOlnF3EKjMKP/UaKqqHuZ96o+Hdla456GiH2Chz4qx3CRlO59Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AJl6agFUhduxqRWxUfI5u8ZDRSqSnKul/om9nBi7Mg=;
 b=DLWraaNZiKfWytEde534EzXF3PMShFu/2/ByKla0RawP5MMDokLTijYz0OTpziWdXe/IHxBzGCOYqgVwLJAbw6QdWhSDCFQKbng2P7saTAqfj6FAhoMMV/YbdaDpfH8hnSCnLvbHi/yIkYymmQ3q5yfBMKiJ2e6Gx9nst242vHeeSA/n7Lc1K51xcgFdNoUu6OsTnon0wFn1TFHh0wYj3ltgk/r17c00xm2G4DEuGFItWKOxzQ3npy2xKsl/VKeWGsJtmK5vh6tRusoicXBHGRJBr1zGDnqT24xb7tz5TD5OKc0QA+JkXlBcHqcLlbgvfhlIshRgFo0eX93diQAnBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:30 +0000
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
Subject: [PATCH v4 22/33] gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
Date: Mon,  9 Feb 2026 18:45:49 -0800
Message-ID: <20260210024601.593248-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:a03:333::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: a88378ed-dd5d-4424-e8a5-08de684e9831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PljaKNuyaSQa2GDjJ++ZUAlA4UgWT3TSQoC/jWGw4bw8EtPFram0ej7fkvXr?=
 =?us-ascii?Q?/xthZbF8WAKUGeoCLCrlDV5PbxTbqD1bdRCGbMHm0nwHzCbRDggyqAbPKdUa?=
 =?us-ascii?Q?KiGmjKoNj5i5E8nMUS7zJg2qB6MfjT2EozozsudI4oFTQsXx6sK3eceDftiL?=
 =?us-ascii?Q?toZUVSx9CyAsdJuXLainJVUDoC1AWLoXvqJkuwtvbKvZiE8GUi2QYh6bvTAg?=
 =?us-ascii?Q?9eon3XdXQ1dOfHi8ZgmlFV41BBU86BBNXhknlfpX/k9/Ff0PTQakecMmO8cl?=
 =?us-ascii?Q?7Lfig5SZ4qGp5XcCJD62glOWsAqLOB9sR+fLCVIEZutWN9NP66fUbrv0ffxy?=
 =?us-ascii?Q?ZH2o3folAAF3z57qxGZPo2SEnSK54krKgMn1pA51xnIe9DbLrFTg0Ybtar63?=
 =?us-ascii?Q?KkJ9lShkEyw7xtZBkAqdhd3DbNNOfiE+6lthmjfuqKg667dBIigOPA/cecEv?=
 =?us-ascii?Q?EtwKDJ9Y+0F7ckuEx2IuLAO8aP3Zmc+kMNoe181/y717r5BDMPpFAQHvGpCR?=
 =?us-ascii?Q?j9C/gYhME9vTzHo+Em53+x63pGkNzPxWy87bEJWVdzZ7DrNMfpFj5nXGLGdu?=
 =?us-ascii?Q?U+vdvCn15SqJSI7MYfS1hooGCkOo1dXfvhj7oYF7Gmj99L6oryqGOyrHH9tw?=
 =?us-ascii?Q?TBXFfSW83o6RiQ51fYTZtemrxznHgrVIvvjNf3+iLoo30bxwo4dbsBKr4eTa?=
 =?us-ascii?Q?ly4CQbjNEv3D2kAhj5MYz9eE4gl6VeTh8gtwEYuaW92Q/q4lficxRBbfkDA5?=
 =?us-ascii?Q?DD+cBE4JwmRXJKdkLNySXSCYFSbiH6QTJr1KaMjIz9bj+BmuI2f/9LVD7LB3?=
 =?us-ascii?Q?TNn4OinM5aEnFN14maeAAh0RSOzFxq8WiSZtBlhVQShBXz7LlUx81btkL+XG?=
 =?us-ascii?Q?xtSHSYC5r2jcPifYL4pV2EqxKDn2LBo4ItSVPXu1f63QZjTIwsk4jzegJdFY?=
 =?us-ascii?Q?jOTGOsouAI0IXEX5rHn3nZaiErem2YeH9bs8f+aHDCLa/DByu6lhjdUrCRQ/?=
 =?us-ascii?Q?rUjnk4DIbFMyngVob1sHJXsoAUZGm+2JLR5MIjlCwBRKyBtmsZcqZv2KeIAA?=
 =?us-ascii?Q?oVfZ9zAfeE84eXbITCuIWifH4I3JFo5agarDLMANH1JU8tW8pmrpdPxT7+vt?=
 =?us-ascii?Q?Hy3dSG6+faAwbHN1VQfopNZ8GZ8gr9e3xTID7Ncw5HjHRjq2xneBil0DbUN2?=
 =?us-ascii?Q?nyjKAy0ZVGsulVeMScWol7Cib+5ukgxidsD0wSJZa38YA3XJwzrf82+ITUTl?=
 =?us-ascii?Q?saCfXIDGk5b+TS36OQUaLpKYqs+I7VuU9P49vZdiTFqXBykZ+jkAAJNxRfui?=
 =?us-ascii?Q?oUbN36l931gKYFpOycOBrkJkcXdFcMH6iyFt9lBQ0fT7LPI8+p9IFGMLf1Vw?=
 =?us-ascii?Q?xaD55vdRu7sE5PC4C2Su84YO5CBwdNPeQ+XTR/1NyOKCXw4wLOmuOa97uRII?=
 =?us-ascii?Q?G3Q7SjroRWTEjob6NoETPrYa+G7MAyZ0pm/2euFbFEpYhdyQ1eDJxTgeKtmT?=
 =?us-ascii?Q?dKh2JuNC2y49adUeO0XJgF+vRUJ3ASDNzvMUhu62O37xh2twuc+u+aKErZj7?=
 =?us-ascii?Q?yavJulktDNIgnBN7Efk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y24twf8OwBsYZlD6DQ0ICzOzcWKQ+FHSWN8ipHq1gy7B2XKV2IBGCuxhl3jO?=
 =?us-ascii?Q?cEDdaAWetwO+UwMDuhmnI+G68SNUBC5UDGzF9QWundc2y3D5U50ZtN70FFZE?=
 =?us-ascii?Q?67XbmfEeYYRM7gmfXJdD7rvtawq7jMgu2Y4oMS7D0jLvVDPiXx6Ott7UPPZw?=
 =?us-ascii?Q?613KmtYSUKeRYXK/gEuVdAo0kCG1giM624bBuNMvs/Bxw7Cm6u2wwZL3P7q5?=
 =?us-ascii?Q?J/2/VfORedMLa3MamcKQ2W5J8cnGT3EhqxlU4Ugrp6KLe/MAXuWp96IN4Flo?=
 =?us-ascii?Q?oiPUndZY2mB0TiBL3xOKanqD9C8lawbxGyXsxhjgGk1zmJxyF0UTZ1FijOgN?=
 =?us-ascii?Q?tv9qi60kpzZVvbxW6+CMQUoxLYJ7+PRQCJ5De/QJe2Ps1fcwudmkhj6lMyir?=
 =?us-ascii?Q?45RhHMwE+VeigzDst4qzlQfSHRrQrS8EK1D0HHdIuvBwdlo/8hu3XIP1+rnp?=
 =?us-ascii?Q?ae41eFl3Q81gkHrhIf8dehONtrhtB2zrUkrqObcfIWS66vJ6f50i8IqGHl+3?=
 =?us-ascii?Q?HFQpH96n5OWE08GsOXOcRuISfLhhRoTbQ6CQBbYV6ycHtQwYJosmRY4Jj4MG?=
 =?us-ascii?Q?tkH8/A2O1Sd+1QUSY2PQ9RbwhzCuun1G+dE6MRllNb4MR2V3C+eBBnyxSL6P?=
 =?us-ascii?Q?FMGtvQ862tcyvEKZmaL/AEmusUsrhpmvMOqfc+IsPfMi3UUmfLYnO9cFDG/B?=
 =?us-ascii?Q?bSFimq8BSOYY9Pxo7+c46dj8gBxqowzfn/O6fSo2kVoWQRFpo0VE1EfoBKs/?=
 =?us-ascii?Q?hD7BBbqrKR9y+l683w8vwJPd+qevWUBSEKt1CpqnqYPbHx0WMS3VOYvDSQ46?=
 =?us-ascii?Q?xAwxuWlewbaCIKIfLm5l6239jdDME+4sZyJAVrsCjTJ9jiMXx5oLh9zNfogd?=
 =?us-ascii?Q?ZEIUnTPn/3fHw0CzZVjV83HKBCihIeeHc+cFlxNQB7XlE28nvJWZfshnZDUz?=
 =?us-ascii?Q?RtqdmkJ+RhUCA11ipcsxsbtgD1ULkXUNUiuOivBjFVlUg17RuWx3sfxkE3WB?=
 =?us-ascii?Q?4oLH5CXR8MSehcuNyqMiZoMFlgMiu3z4uJBRJ/P8B4eJg6HRtVKU/dHi/Yig?=
 =?us-ascii?Q?D6v34+b+pypxjcHy3L+llvDSimcg60fpXOm+n6faVRXj87mQ2Z4JMXzWRIZ1?=
 =?us-ascii?Q?tBun8wgG+5zJmyVasItp7ee+LGL0cg1o6odYwI7wzmAqKV1t9HmY6//5mdLX?=
 =?us-ascii?Q?XrbDjghHbDcjczZ3FBRm6hFshiHMSnMA7Yw2DxUwnKeAjqn7Wwjghk4u2/9w?=
 =?us-ascii?Q?KLP+RQ673KPlWGhbHtvGaGPhzM0qO3g8b1L2zo7fF6H7UqVYhbqMcfTKKeUw?=
 =?us-ascii?Q?+jQJPapG7QCXI14jg4Mt2RDT5Fzf/1Ghyn0Ode+2Y1XTglgKGfVDM1Ncg65G?=
 =?us-ascii?Q?ctN+Jto0I49yWmXm+XMTYJaAJIOrswrxl7Luo3UqmIFZeDB3pz/sAdF7/Rf2?=
 =?us-ascii?Q?f0NwsipMq6PJnEMYAGo8WT7QfG/k3Jr+PH5laU90TnmPYf+rMudr04RjEqDH?=
 =?us-ascii?Q?vf6veuiXPM1dJkZapQAsx2w2W+/uQJFSk8MnJpyg9AHa2y22RoMc4NO7MzGo?=
 =?us-ascii?Q?KTrHQ+I4n1AmY/qOTAG5kn2PE/Fp+Vm8K7iKFypP4kbfmK8Uba9gCCWkQjZj?=
 =?us-ascii?Q?/x3+0k0XCQ7oNnFuvBlnTeWPZhpSKLjTv8h8ERbMPzgLKglZyLYlvd3fhwel?=
 =?us-ascii?Q?g08BtdtRWt2aTDCjzcH5kzjJndPL/SBsTWJawr4W7dKZ88dk3pBUt+4eA5gK?=
 =?us-ascii?Q?o7DUitUq7g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88378ed-dd5d-4424-e8a5-08de684e9831
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:30.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIbgSkGdSLnqklV3OgQA/A4j6AJdfNk7jjbJb9qjV6gUWwcrp+B+WdtchOL/40ORvLmexuMKwcGjkNPmWr15iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Add extract_fmc_signatures_static() to parse cryptographic signatures
from FMC ELF firmware sections. This extracts the SHA-384 hash, RSA
public key, and signature needed for Chain of Trust verification.

Also exposes the elf_section() helper from firmware.rs for use by FSP.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  4 +-
 drivers/gpu/nova-core/fsp.rs      | 76 +++++++++++++++++++++++++++++--
 2 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 9a9b969aaf79..e9101a08511f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -27,6 +27,8 @@
     },
 };
 
+pub(crate) use elf::elf_section;
+
 pub(crate) mod booter;
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
@@ -607,7 +609,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
     }
 
     /// Automatically detects ELF32 vs ELF64 based on the ELF header.
-    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         // Check ELF magic.
         if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
             return None;
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 7775f1b673c0..fca03e25134d 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -124,10 +124,10 @@ unsafe impl AsBytes for GspFmcBootParams {}
 // SAFETY: All bit patterns are valid for the primitive fields.
 unsafe impl FromBytes for GspFmcBootParams {}
 
-/// Size constraints for FSP security signatures.
+/// Size constraints for FSP security signatures (in bytes).
 const FSP_HASH_SIZE: usize = 48; // SHA-384 hash
-const FSP_PKEY_SIZE: usize = 97; // Public key size for GB202 (not 384!)
-const FSP_SIG_SIZE: usize = 96; // Signature size for GB202 (not 384!)
+const FSP_PKEY_SIZE: usize = 384; // RSA public key
+const FSP_SIG_SIZE: usize = 384; // RSA signature
 
 /// Structure to hold FMC signatures.
 #[derive(Debug, Clone, Copy)]
@@ -241,4 +241,74 @@ pub(crate) fn wait_secure_boot(
         })
         .map(|_| ())
     }
+
+    /// Extract FMC firmware signatures for Chain of Trust verification.
+    ///
+    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
+    /// Returns signatures in a heap-allocated structure to prevent stack overflow.
+    pub(crate) fn extract_fmc_signatures_static(
+        dev: &device::Device<device::Bound>,
+        fmc_fw_data: &[u8],
+    ) -> Result<KBox<FmcSignatures>> {
+        // Extract hash section (SHA-384)
+        let hash_section = crate::firmware::elf_section(fmc_fw_data, "hash")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'hash' section\n"))?;
+
+        // Extract public key section (RSA public key)
+        let pkey_section = crate::firmware::elf_section(fmc_fw_data, "publickey")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'publickey' section\n"))?;
+
+        // Extract signature section (RSA signature)
+        let sig_section = crate::firmware::elf_section(fmc_fw_data, "signature")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'signature' section\n"))?;
+
+        // Validate section sizes - hash must be exactly 48 bytes
+        if hash_section.len() != FSP_HASH_SIZE {
+            dev_err!(
+                dev,
+                "FMC hash section size {} != expected {}\n",
+                hash_section.len(),
+                FSP_HASH_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        // Public key and signature can be smaller than the fixed array sizes.
+        if pkey_section.len() > FSP_PKEY_SIZE {
+            dev_err!(
+                dev,
+                "FMC publickey section size {} > maximum {}\n",
+                pkey_section.len(),
+                FSP_PKEY_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        if sig_section.len() > FSP_SIG_SIZE {
+            dev_err!(
+                dev,
+                "FMC signature section size {} > maximum {}\n",
+                sig_section.len(),
+                FSP_SIG_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        // Allocate signature structure on heap to avoid stack overflow
+        let mut signatures = KBox::new(FmcSignatures::default(), GFP_KERNEL)?;
+
+        // Copy hash section directly (48 bytes exactly)
+        signatures.hash384.copy_from_slice(hash_section);
+
+        // Copy public key section (up to 384 bytes, zero-padded)
+        signatures.public_key[..pkey_section.len()].copy_from_slice(pkey_section);
+
+        // Copy signature section (up to 384 bytes, zero-padded)
+        signatures.signature[..sig_section.len()].copy_from_slice(sig_section);
+
+        Ok(signatures)
+    }
 }
-- 
2.53.0

