Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012012.outbound.protection.outlook.com [40.107.200.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743B234104E;
	Fri,  6 Feb 2026 04:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351718; cv=fail; b=XogURiIwDpBm+fkFuCYSOtDby41cHVaYI/ZvNGL5chNU4AOCzuIrV9+cBaeP3t8DXJghPmA6ADe35YADK+tcxR/DHTl+mWnBRrbLnjQixhiNFKZq1M056xsmIEK77PLzGAP8fQEpY8CgJr3/1GdsWqVANUY3y3xIledDb9PY1ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351718; c=relaxed/simple;
	bh=H7YFW2AQGobyN2NElJKmKBWrxKBMYj8zsdkmLWioBa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tdxkXaHzjXVtPJ2+dRFWmrXyuvzUn29FIFNRmFFCDk6STGL0VetYVT9GazBehLNrCnMTWvZhP+9pyaDGKu/V9bPtOiwUGI6wNIWuoETPBbNj+CI7uGRaKIg//q517HAiMNPc4FnCoCz4pAGEkABy1bFqOCOTl+6jJRsyliau7UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XHZu5Nis; arc=fail smtp.client-ip=40.107.200.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XHZu5Nis"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVR5hlgr1xM6HyzqR2hoipvvKwF327AcSYt167kcapIXJOnNTUMlv1NBVcyct4QgNRMoVL8vHZ1mS2JeG6hGXYXe5JILgrCRK/aqHASYiECtUH65UUJ7tx9QW508CS4pj3k/NU5WDl+QWIHkUZu7u6aPhqrY0uRy04Aba6m9t1tzOjGCFwGvjE07qxdCWoKPQiCqJ0Lfg5azbiT1UN/rQIhWQ/flvX06NUUUz7XuzxmgBs/7VRF4F2+J5BZbNMOqpPBVL/aB/l2fXsujspELWPObA5G7ssCvv+QvZD+nanAHAxf43po6M1bxa/ipmChPe9quNV49sGNoo+jZxNTKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITX/+GVREfRm5JNBjDKL/GnSUNYB7SMp2fPzQStGf6k=;
 b=FOuoUPwVOw6Ql95BBUGaZ0CzzDiEwFNpIuUM6ul3bar/NGgPOrQSkxW7LkkFC7LB1wo53m4JU1nqHBU7zPBPqEM3tycfnrf0wDnKQFKDo7yYihDtIwWU30tscNsTH/wi6u/m8GWn57LxmafkKGoIiS7+2acMDxa6vy3x14RYcZv3iOJmH4XlU3Ma/NcPoDMRMAx5mpqAiByrmQNVQ3Yf39BI7c1xZpQn5083BG9sxt63gB6cRYDjp5X3cbPXIzYrDTlhshAri+gm6Wkd1rOzQdMtUyp2IV1mjSqbkXt/FkAj4QhDPY/RglBbsVkvKJpmxBgTxWQXLnt/iVu/vetKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITX/+GVREfRm5JNBjDKL/GnSUNYB7SMp2fPzQStGf6k=;
 b=XHZu5NisU0mPnR8y4/LYCmfnwPdVX5bjyXx8lgpj8PAOivItk6wGqslaZa8awBBB7JG2nPHNDA5W/ml6Q4MXAXrPhHYipExFd5H3xC/BdYf1xOyZSv7ZioKjCI9U1jZ431Hp3M68N2LocbGvlXM9+jYPcWRBgoEGbIZZbfRzlf0nhjI+AtRPfhSmURbWz4p0Pi5QqV7qnkBwjvIvCgzAexebsnGIH9Juby2Yr6y27u5lqEjx797oXsV0k7hGDGFqckRlDYxAuxYkrpGdsTDcq+9rj2oNb95NoIsynCe3/f0OlnQ3P3B6K3DyHygVe96uOx5xv/a0MnC+K80cL/+XWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 04:21:55 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:55 +0000
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
Subject: [PATCH v3 22/30] gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
Date: Thu,  5 Feb 2026 20:21:15 -0800
Message-ID: <20260206042123.303281-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:217::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d33d137-45ce-4ebf-0ff5-08de653742e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rLFD9dzd6OjFv5oHMzQjVRmTDM2OcAWwufSCnikxxRKrhDQ6JWmxZLgMcQFv?=
 =?us-ascii?Q?U3cS41z03yRAxV3FiQFAgatTnCDXX7t9jXzzYu9j/vlsNxqgaYGHkEAkr+WR?=
 =?us-ascii?Q?L8Jqx7oR3FPgKNd2EyoSlzpCJbiSr9GJmHBRUNHoyJMxLm1p7EVqwJkwAWjY?=
 =?us-ascii?Q?B2ZNPMval98HUy2+CDw1CjGKhIfE0J/kYH9gXeBhVq3tCtUQ2gwSrOvNy0xJ?=
 =?us-ascii?Q?fRdrdIPjewlwZroxHr8NbrxxBuZ7XrKe1tEgJMXQ9ZRf/6ogiAcJ1ZZTHutH?=
 =?us-ascii?Q?iwc/D9z+TIr4XbLqf50bT3Mh+EIyW/74/4tC2e9LrGVZjXu0YUh+s8/2g7KV?=
 =?us-ascii?Q?YfLvRr4UQATgge88MDdxb1++ele1A9KoDQEz+Ns2UruRcr41TN1FLuMnv7YL?=
 =?us-ascii?Q?bXpchA03OQP3rrEJPWMePTVmbaNeQDG1DefJwHcIn1OyU4lKLPk5kGyDLgmy?=
 =?us-ascii?Q?zkJ7ZL6su2uef52A+VXtdSFvfyF/qx4afvZi0sKkqGJYQU/euUZc6b4ngg+W?=
 =?us-ascii?Q?txb0mhCvAJ76QUgrwCXQQ6MxVJ8TMqFha1rlqFnjTcmJePr+rfjnI/ecEDvZ?=
 =?us-ascii?Q?FK7PmrQaZhtRS71creRh2t3pGuHeEf0tRbW6g28TiTHn0WLeNFGoV+AbHdwe?=
 =?us-ascii?Q?B4dHL6+kh0j8G/lGj6YP1hyqAKdOdI6NTIkXTJS6KK724Cl6fuKoHgRMTkO/?=
 =?us-ascii?Q?Qlb24mHxjh5fAM5KRzwzjVZcOjUsvGpCAUp0+BSSFnpJJYTpF4rhDVbIZzCC?=
 =?us-ascii?Q?jMY2cXhJDwId01UppklLKrqFjwwQfH+owl1Uw0DNGSyr8vq2eVHSVsw81QDC?=
 =?us-ascii?Q?J6a+ABTQKQE45CnLWUkNcAtUySFnC9PD0Yia3P3Ab+YrCgKWjXJXHkUlT8Ak?=
 =?us-ascii?Q?yMLzwEy92YHtqb4DpwGQPfhY1wBpkNQWf3GLG5usHqxKNEs1tU3AaPOD7iiF?=
 =?us-ascii?Q?zNwfGUMPGhr0IWqKeSe4Hw1TDybbpzBla6EoP/W03tMR0lDbfhZBt537cHKS?=
 =?us-ascii?Q?ws8tedUuDZRlD4MIwPtQSl13B5rKjxich6tYhpv+ZeqVh1zYjH+SeQLdlfv4?=
 =?us-ascii?Q?OLWsf8jiuJrVyG4saI6nhR2hNNeLVw4R3W22+K+SnfTeArh8Xmt4LttkqPw4?=
 =?us-ascii?Q?H5Anr4Hr8FuGI2w3OjXaVIV3KfWZOHFvaXiXOLM4oo/NtUGasO3CzywQqnn5?=
 =?us-ascii?Q?dnmVTgvZWxexzHJ/XHKmwhRflLgPHjShpiOO3o9+moaXOluvZO9uhRnAAnHp?=
 =?us-ascii?Q?hEL/N6G06qS7rccpm65pK/jTcqJLTz+WuQvLyzJ+RffX51XOW+HMcEItHPha?=
 =?us-ascii?Q?aiGUJTnoRjCTRi5LgjCBsfEhHwl439IONEGwgRmvbIBR2H9s8DrvM84V9xoY?=
 =?us-ascii?Q?oSx03PYdjasxww9s9liRcGVPArcOuqEVeDcf5HsMAthHT2VBWdoSJ6V9D99x?=
 =?us-ascii?Q?upDJsbWgBCYk8u7E6Lwd5n8k1g9RcpxQPhSfMtm6QwxnUu4vhYRLPQI2UgaK?=
 =?us-ascii?Q?BMmynatbl2QJ0oT9iyUvK4doBdAzK4C+M8hkzltSkMYe3N6VwJus+a6VHDfh?=
 =?us-ascii?Q?XgQklLDs+KlSt63H/f4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3wLf7Alf9+6EPcEHTtTJD4Lj9z341ekNxaFp9Xw1lWhOEyY0S2Oy0HOw7jrv?=
 =?us-ascii?Q?AfGc8842URnsq7Kt0yqYjkSlRzdWjAp2Xh7iU/QqT+hjDvJRU6NVc78peDxE?=
 =?us-ascii?Q?vkDYRk4z+zFqeJwVIYWiQN98BNK2Dmop/ce4yuIW0OjW7YVc2BViiWA9JPD9?=
 =?us-ascii?Q?ujmqinvYBlMKMUeQivtDiRFtvZboMILKUFgjK79f1Pam+p9GM9jKQhvsZwhL?=
 =?us-ascii?Q?3eHfuRchXzOZspXHVXX9y60scmacatxDrqd35hcxFXD+BN6GiQyBF3EQI6sI?=
 =?us-ascii?Q?Z8e5+mBWKwH3mcQns5ZBOjshitF4bRcNOaMGaXloczIog8cjrBRgEJcZWeU/?=
 =?us-ascii?Q?4DvZ9FtO9wiJExSneN8+iKAwHSzDXBJbccXybXounAvok9uwpGuL1tBEeJz9?=
 =?us-ascii?Q?sjJAsDnTCxWlfKWFqiwd+xf/9vSShNX1/fRx6f5aw4lbjFmHy17wO7+6x2ZK?=
 =?us-ascii?Q?Z5kxlaN2vDYZHLk/IGHdkX6bLVw1sbBVGE0SSnVizHsnw/wmar5YFRG4/ZRj?=
 =?us-ascii?Q?26bAl8tBpJ2WKQQSdBvnrfpeqpNHf5XYzoC+eRXp+okA00v86nK+IS0QKXqU?=
 =?us-ascii?Q?QSRoS+uAaNu57GqB/RkFnmxU/XwPgCmCwkcQ/9SCEeSKLDrrL5B2KLpZmWTl?=
 =?us-ascii?Q?/NhPdZxqeZ1nDd69zVGE8JVc7W+vxrfg7COXczSRe4D+c7cyxuG+FkuJpSm4?=
 =?us-ascii?Q?UoebemgJV6LMJSjNYs3kLoXq53teALT3mi6bVxfzOMDa8yqZyqzV5ODOGOmX?=
 =?us-ascii?Q?WmxT1GW4QVKxTerJDCkA7c4Opiia91PMK7sCJ7eY4vLJOOGKWGY9HohrtliQ?=
 =?us-ascii?Q?Bz5T2g5U/XU22qVg+XLQNM/FfWgRcBBxylnvVZUY4INvDYyTjuop5DaW/Ucn?=
 =?us-ascii?Q?h0lSE662Bnnk2F0mKdX2QKiG4x6KGo03FGOvlWtMFZ+iSqVsgjW9k3tEYZn6?=
 =?us-ascii?Q?I8D5t9lfuo2aYGnvYGw4KanyOmQtkFS1O0y6rOUmXrYjU/AQdF9XZdKEmGoo?=
 =?us-ascii?Q?XruCe3SfcyzUBSr7cW7xQOh62AzGE8LUxwMnNOemVU77Gg0Q/bAJKKkYvb0S?=
 =?us-ascii?Q?i7aLaWwVixMEwlPldGMPOSQWMcCqlvDQxbDZ9JI63Vcg4LHpvZBOSWeG78en?=
 =?us-ascii?Q?otJOj1uMaH9+lVhE5fRNsiBJfKweGv99bAGRzKy1DrYcpcwo8CwZE0R50q5X?=
 =?us-ascii?Q?7T4F8N8VZCrTPQ90Eg3FGg9yrPXk2LEhVR75pJ+Rj5ASzwDar6ZKzJaABWHZ?=
 =?us-ascii?Q?WvN2y+AGpsBzd0JPDmfyVyEwAVS4v/mZbOXn90xvFmH1ttA5HmKzeTMNx+QD?=
 =?us-ascii?Q?gpedEii4PSlIehQjeDwbnIW/nkaVWl3C+3pWJ4WMIU7D52YJ/GIm/Bzelr6B?=
 =?us-ascii?Q?nYs4k9NwGcxEjjbmI8BzqojQDrglx2j8vATu/OcRiDRvNYz1VJf+fAYfIFpm?=
 =?us-ascii?Q?IUPdasWWakR0cGQPZ4/wQAe/KoeqYRaxho8Jh6r0CQI9FnACq4oXEzPLw+5x?=
 =?us-ascii?Q?FxzIMBzV3XehY4oDZRG7grqpQrBOxs3T0jwFhE5LPUx+aeoCgSFh6+kmpA6M?=
 =?us-ascii?Q?5WqlgHN7KFkn0wfnV7RuJR2VoglJ+l7DYxjQTTO4Yew2ZDvZTpHo7TFB6lsE?=
 =?us-ascii?Q?vJGz5Fp2XUm0oEz03hl97SXwoAe6KKgZQk6V0L+5D2qXgwrfGF4Te3zi4WIM?=
 =?us-ascii?Q?4fZtR94FhUcyexZ05CFkJZPmWqWQ2B1xIYty1TwhGsC4vQxhVMxBWcYsQcLp?=
 =?us-ascii?Q?+sTHO1//JA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d33d137-45ce-4ebf-0ff5-08de653742e9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:55.4483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfKRZwsTCZyP23+3lVDyY1MZWeZPOZQd0sx8gNzWbY+MmPAgDbCMNHkrMUHAJOyW3uuHqRw6aroP8xLXsxwNSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

Add send_sync_fsp() which sends an MCTP/NVDM message to FSP and waits
for the response. This handles the low-level protocol details including
header validation, error checking, and timeout handling.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs |   3 -
 drivers/gpu/nova-core/fsp.rs        | 101 ++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 081b9fce9278..33d0408eb852 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -93,7 +93,6 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
     ///
     /// The FSP message queue is not circular - pointers are reset to 0 after each
     /// message exchange, so `tail >= head` is always true when data is present.
-    #[expect(unused)]
     pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
         let head = regs::NV_PFSP_MSGQ_HEAD::read(bar).address();
         let tail = regs::NV_PFSP_MSGQ_TAIL::read(bar).address();
@@ -116,7 +115,6 @@ pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
     ///
     /// # Returns
     /// `Ok(())` on success, `Err(EINVAL)` if packet is empty or not 4-byte aligned
-    #[expect(unused)]
     pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
         if packet.is_empty() {
             return Err(EINVAL);
@@ -148,7 +146,6 @@ pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
     ///
     /// # Returns
     /// `Ok(bytes_read)` on success, `Err(EINVAL)` if size is 0, exceeds buffer, or not aligned
-    #[expect(unused)]
     pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
         if size == 0 || size > buffer.len() {
             return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 45c9d9720587..616c6bc3a7b0 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -22,6 +22,9 @@
 
 use crate::regs::FSP_BOOT_COMPLETE_SUCCESS;
 
+/// FSP message timeout in milliseconds.
+const FSP_MSG_TIMEOUT_MS: i64 = 2000;
+
 /// FSP secure boot completion timeout in milliseconds.
 const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 4000;
 
@@ -330,4 +333,102 @@ pub(crate) fn extract_fmc_signatures_static(
 
         Ok(signatures)
     }
+
+    /// Send message to FSP and wait for response.
+    fn send_sync_fsp(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        nvdm_type: u32,
+        packet: &[u8],
+    ) -> Result<()> {
+        // Send message
+        fsp_falcon.send_msg(bar, packet)?;
+
+        // Wait for response
+        let timeout = Delta::from_millis(FSP_MSG_TIMEOUT_MS);
+        let packet_size = read_poll_timeout(
+            || Ok(fsp_falcon.poll_msgq(bar)),
+            |&size| size > 0,
+            Delta::ZERO,
+            timeout,
+        )
+        .map_err(|_| {
+            dev_err!(dev, "FSP response timeout\n");
+            ETIMEDOUT
+        })?;
+
+        // Receive response
+        let packet_size = packet_size as usize;
+        let mut response_buf = KVec::<u8>::new();
+        response_buf.resize(packet_size, 0, GFP_KERNEL)?;
+        fsp_falcon.recv_msg(bar, &mut response_buf, packet_size)?;
+
+        // Parse response
+        if response_buf.len() < core::mem::size_of::<FspResponse>() {
+            dev_err!(dev, "FSP response too small: {}\n", response_buf.len());
+            return Err(EIO);
+        }
+
+        let response = FspResponse::from_bytes(&response_buf[..]).ok_or(EIO)?;
+
+        // Copy packed struct fields to avoid alignment issues
+        let mctp_header = response.mctp_header;
+        let nvdm_header = response.nvdm_header;
+        let command_nvdm_type = response.response.command_nvdm_type;
+        let error_code = response.response.error_code;
+
+        // Validate MCTP header
+        let mctp_som = (mctp_header >> 31) & 1;
+        let mctp_eom = (mctp_header >> 30) & 1;
+        if mctp_som != 1 || mctp_eom != 1 {
+            dev_err!(
+                dev,
+                "Unexpected MCTP header in FSP reply: {:#x}\n",
+                mctp_header
+            );
+            return Err(EIO);
+        }
+
+        // Validate NVDM header
+        let nvdm_msg_type = nvdm_header & 0x7f;
+        let nvdm_vendor_id = (nvdm_header >> 8) & 0xffff;
+        let nvdm_type_resp = (nvdm_header >> 24) & 0xff;
+
+        if nvdm_msg_type != mctp::MSG_TYPE_VENDOR_PCI
+            || nvdm_vendor_id != mctp::VENDOR_ID_NV
+            || nvdm_type_resp != mctp::NVDM_TYPE_FSP_RESPONSE
+        {
+            dev_err!(
+                dev,
+                "Unexpected NVDM header in FSP reply: {:#x}\n",
+                nvdm_header
+            );
+            return Err(EIO);
+        }
+
+        // Check command type matches
+        if command_nvdm_type != nvdm_type {
+            dev_err!(
+                dev,
+                "Expected NVDM type {:#x} in reply, got {:#x}\n",
+                nvdm_type,
+                command_nvdm_type
+            );
+            return Err(EIO);
+        }
+
+        // Check for errors
+        if error_code != 0 {
+            dev_err!(
+                dev,
+                "NVDM command {:#x} failed with error {:#x}\n",
+                nvdm_type,
+                error_code
+            );
+            return Err(EIO);
+        }
+
+        Ok(())
+    }
 }
-- 
2.53.0

