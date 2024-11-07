Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87318193070
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Nov 2024 12:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730982400; cv=fail; b=KNAxD0eL2MRPychC7pmzecgrNJgJWU+syft9H0PNrLO6U0/GbAm87DgOmSHrAmfv/CgDtbtpgmx1VeL3MWGAsWUpSdw8xFgqBZN+0eyZmUXS1+GX+ximL6UVGtCRDD7e/9tLJehS9hv1vqB8/SxlCs5S9mDg0S0swumZ8RM8EYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730982400; c=relaxed/simple;
	bh=A/ht55RpbbGRvpeN7tUu92a1RVRcBlQ9NoGrO13sANg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=iMXzC/pjb6ccFe38HTxM4DMGOKz88OGlrMIhYiy69tf1qsu3kGsChWX6nvBm/MuO5B+N990Tpap+5fkbGS5q2LNZ3+CEpi0JIxmsJ4hb0QsO2KYaKmbWOZXSo4+4+CpCakrw7HZ1EEiUZ049HfOlFNgreHAkPZGHOIoTJg3Y1vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk; spf=pass smtp.mailfrom=prevas.dk; dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b=Qh8FHJ8B; arc=fail smtp.client-ip=40.107.20.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prevas.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b="Qh8FHJ8B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nd8WPFbUKJ3UizqnndOkP7LCMnPYnpeCA6RABqnSNbFSGWSK/iQyL2WemUiOF2lxpxElHlaDh+rI3VkajXMQbhnMhiDgsJLeIjikVyGRx3xuq0rFDL2QBqi1vSOvrN8UTDREGCt694qyc2RmSS73L58PBLLHTHj/oWcmpFAvPdU9AilvpIzE66DIqB4IF8G0GX28YI7ae8YEbJiSmkg1DrmYcikge83hqKErf8f3YpE/yTif1opZN6JBf1pp0pdWVAA6uY4ToJYkClBc+/WLZev5z2ZptW2Vxewq/RxLTchU3vCqoEDmCqSqwMwMehk7wCKQiGOxnK14v3atl9Fx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4VPkk/Vri82YJw7k5dzkkTy/eli2Mo/WJFEDjTuc2A=;
 b=S0Ra2I7ljBzorgFDA+UMlDzhBMswj9ItcCCfz6SfMzhGwaRSDXnkIBskIW7RzdkFoUcMcSU6/RXEHidDKAYXIGuh4lGUjFhS74NAkP/DsW+VnvFTZYr7HHIG8s1MPnAzTXB07bDD5AQ7uFM9mcGd7MRsJjKCMyUZM+bS7GkviIXDy3f2t87ejcpvGv+tED5V+2AaUccOV65tKk7V2szC5ZjUPyvjI5cWUZ/gqf5gOAT8jp3uEUKKQHTWWuiNhKy9oRJxeBXcbJS9+Z2+im3mlWoX7jWKp8jyk9SIgBmkVGuaroI6oJUY0Dmb5QGA9cJUPCzMTHT8o/A13619f+Qt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4VPkk/Vri82YJw7k5dzkkTy/eli2Mo/WJFEDjTuc2A=;
 b=Qh8FHJ8BKeery2foROmhimJbqJofQrOjYClg4QPykeQmfSvqwBykBsh2x3uPuIduovHy30puE38Q3OponcI8bHiqA2wFk0APFkwKv2PEqAORGu5KMeG3ggUqvmObWu9OW1I2DGv/ffNMoUCA5d1td7xzRTzug0MycpJUepULQF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by DU4PR10MB8687.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:56c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 12:26:32 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 12:26:32 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Cc: rust-for-linux@vger.kernel.org,  Daniel Sedlak <daniel@sedlak.dev>,
  Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH] rust-next: make from_errno use try_from_errno
In-Reply-To: <20241105114819.14051-1-guilhermev2huehue@gmail.com> (Guilherme
	Augusto Martins da Silva's message of "Tue, 5 Nov 2024 08:48:19
	-0300")
References: <20241105114819.14051-1-guilhermev2huehue@gmail.com>
Date: Thu, 07 Nov 2024 13:26:37 +0100
Message-ID: <87bjyrgrgi.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0102.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::23) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|DU4PR10MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: f53d2435-7077-48d7-c40a-08dcff276939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GUYoEhhOIzFUsh5Zn0PyvE00hYekEtBf/awe7JBw2KdF9JiYvjioXvVx28XY?=
 =?us-ascii?Q?y/3YtlKAGA98OSR1yTPCurDqc/PSvxWh6vC5/aOPgjjOKnWT29u1ACmQkvLY?=
 =?us-ascii?Q?m28LokuDHTvxNcIJeW345MgFwhgGrFYlh6V15L22ayz7LmYRaqfqoF3kLVoD?=
 =?us-ascii?Q?ZuRJsbrhYgRyQh+fUZNduk2Rawl1Lu2/iEYt306Qsl03rGxzbrQVuLDWFWjM?=
 =?us-ascii?Q?uhppUosWHdG/JgaZpsfS7AyAg2670oypDvvNkEMRcasYK1yc8JUITx2p/mRs?=
 =?us-ascii?Q?ugkZNC9YLSLIwNPdR2wgkUPjIfZ4Saieq6O7Ldm6LXh7vM3I2zH2AVLY/ODH?=
 =?us-ascii?Q?yzch0ktJ8LfN2EllLVKfjvdtY/wkvBwRvun0U6flRM7N7pRlmsvGFS2zUM6O?=
 =?us-ascii?Q?wUzBJAeo+Qd8ajhxUR2tfAjXJFCa3iuDKMnLxpnyHYovJqVkV9e0MhTSq4Qj?=
 =?us-ascii?Q?9VcJkB8h0dgMND24uKp3pLUCptV9Uk0GAdELPTk7yOdcv5knl02L6Dc0Sajq?=
 =?us-ascii?Q?ZCQVJlqxFwvoG62W3q5yPqvcnZYePajIOlzavqx6NOBzH5PJLjJbYRg7jf1x?=
 =?us-ascii?Q?ukZT2i/4Nt/55eCORBm0alKM0bfrjUjR0NOoY0drjgMbkCNV9I1Lsad4dPAd?=
 =?us-ascii?Q?y3q0KgUJgJkNb8gPLvuHcT64Bs23d/QQTFjL66Eo3nF573/T2rpunFW+xptW?=
 =?us-ascii?Q?xQrVFV/3Pt44ivC5vAT+4utupqLP/uo/OOywFK/GjshOkNS6tvKqu9JJ67pr?=
 =?us-ascii?Q?67pgdPHT6vrOqH6AjYvC6GVPWd/4mq+57IxXMyUjTb0J/Y9Nq4ztT+b9s5xk?=
 =?us-ascii?Q?YtjoG07A7xerA1mq0wAm1L4eFp49MpUaNSqD/LSwMUo8g1Jumt/i625LFFtr?=
 =?us-ascii?Q?MW8+eODT0WgqprEjkS/ldpzyyJXSNaDv7kOyTJ7Omoc+rtL0/OPU9I/d3cD+?=
 =?us-ascii?Q?cnnbfQRQJ2oVQb101RkpVmzrtrIOtzTaUdbP9KeYf8N5aw/2+/jm4we2P0h7?=
 =?us-ascii?Q?YeZo3mg7XrFtzvta1XwGZLT49+nA4qvpAva1jyzLWY4C9TXzMLvNTh6IMgP0?=
 =?us-ascii?Q?A5cLPueWdeFTBinOuHceEyu1Ef/UyvwQPfc/9n+wz8ifr2+XE9HAJ/nr5jhV?=
 =?us-ascii?Q?ATyw+rKuv+OupuNgt4vXvPD1Glbk6Hxx01GC43T4BPmX1S5nJN5euirfprRX?=
 =?us-ascii?Q?/4ET0sNl5hogzzttDHU3l8RlZryh9olNDtgIXrTUkOYLPcECkKDHv8H/By2F?=
 =?us-ascii?Q?yr903c2M7iQ1+0qrMER2Q5b7QqAMrFODvN+29d0hTk6GwZIzJKc1qadrXy4W?=
 =?us-ascii?Q?q0XabkMAdHWVSHdWw7XTvWKX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WyLy1H6IT7aadd880KROmGCFn3XqLILQY1M2A2cmN8YFJYAZbJxDQ8LdmlaU?=
 =?us-ascii?Q?vS7EPcrSOXMwm+nSGrjgSoQe1odlmXlL1H0KyPtQBB2QpTaabX1p5cCm23+P?=
 =?us-ascii?Q?73QhpJeg7YKJn+PVAkoPMVAgwAe46pdkFExPP16hCfjULoYmcKNTBHJXA8Qv?=
 =?us-ascii?Q?TlHcltmYcHZHRyI6UQ1I8UHx4/BaOH2zbxiYJVkbRl/0cXt8RfsjRiFVxNhZ?=
 =?us-ascii?Q?+hEd7U6mmFATG5EAOR+u9xaAYHNDwG97T0nOTPYIOvql9JIRHP5+0++lKe+H?=
 =?us-ascii?Q?v60WZvbLFAXp1mw+JPlCG6Q6Dul48bp1o12fLdOhW6DwYfVW9Vh/8QdEybrY?=
 =?us-ascii?Q?PleVcx+u5s3qdJhai74h0wZ6DqSzAZhqFa+fjW15sJk12MO1pfxZR9K0+msY?=
 =?us-ascii?Q?h3R3MhHN4/KKi1rSnHb472Csundf/7ojVOQ3n9NgEnoZ0wyDKx4Ljb1wmFW8?=
 =?us-ascii?Q?QNTDIpZaJw0xpAWMq59RJzzq9XvR144s/00D5s1GuJRj8G4dNz0K8rAshHO3?=
 =?us-ascii?Q?+0SjQIcSy3BwEDP3NNyDer15W2kPwEJB9IpBFECkw3n+uAcjPAV0Yc7y8FxL?=
 =?us-ascii?Q?Y2bW/37Kh7hGtLUPcx6qRbMvElp0358YWskT+4aomKZzGwgPTvgUfQeB6ork?=
 =?us-ascii?Q?5QJ89hG/6U4mGp7oiOOVVqPEkiZ7r4zrIoJ7zJuHfeBHPaCwntPigw12Csnz?=
 =?us-ascii?Q?3Y3dYKTPt6n8NDKJYqNThY3UFt591p60ZDetGAhARj9KnMycM4XChhT9BS6M?=
 =?us-ascii?Q?mmzXnD42DsLYfePjy0xLfrSzRjvF5C/8zvZVKJPausa4i/cqMmXFpwfq6kji?=
 =?us-ascii?Q?CQb1dCS0hZkAw28efmdhF7qje4ng+Sw/B2vPZcbr7OGtn94y0fDOr+F8+yCR?=
 =?us-ascii?Q?k65wRtU/ffxT+VI0+tOxEFse32OiF5fGTenoPv1pF8sE50zLy0JuDmytv4/A?=
 =?us-ascii?Q?Y28GfScrZHmrZBqjCNxlZ1wPoREx7uiOhpCZzsNt/z6tHSMh6ZDS7xrkzuS2?=
 =?us-ascii?Q?/XwPkYGcBoDzLLtbCoTxU5QwmO8HuI8WKTRW0MkKn13CzAVp4D8/pB1s4Ksd?=
 =?us-ascii?Q?qO31EmkOXfOTcYucet5AjZA84Wm9mGbu2RClxWK+60IPVNLkgwkSW68I+aI+?=
 =?us-ascii?Q?dCosJKW8foehTEsckZumEs9Doz516/iNk4FFG7Jw5J7VxmByGk0mD1hG3+jq?=
 =?us-ascii?Q?RgYRfzCLOFOfDWlYJaXKaI/bcv5RAYKnN4cmgzUJV7BIgNFFvUEaOVCX+Xde?=
 =?us-ascii?Q?CoM5So31asCUBbZtiljAAlUuTM9wTdNjBOFPppLtnN8+C6whvbC0fKloDKg2?=
 =?us-ascii?Q?6BTIBM6BgQ3mhzmTkgId2fXrUNEApbLc4O4z5FQ6uRebKJ/rNfPn7Ry17CA/?=
 =?us-ascii?Q?Td7pnDnBW7L8K6+T60iXcEldoUc/gQOdgneDNuFolVqRu0VeXL3cSBBGzfd8?=
 =?us-ascii?Q?ZlhQBrBOZgjGJO9Z6iiPBPrCNoOsq1iE4mVKdFCDgk/FiwB6IQMsxte+X0qY?=
 =?us-ascii?Q?Vds7XPO/pZu18cXzw+NdNQ68YjZxyIyxV+A4LEYnjDxVrEynDN8aKl6uJ9gH?=
 =?us-ascii?Q?OtBbUAMxvDb9JNOgS9PUAJXreMSRFX+dGJV4tcJcJ6dMUPUsC2luyD3xXe3e?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: f53d2435-7077-48d7-c40a-08dcff276939
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 12:26:31.9715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWEq95uJ8Lb4XNqpv7fyLocEe1ANuKomoyWZ4/BN7VK35cGIoYIObrfS7K8daOIh7o1bMEcQss2cC5aU47Wlhk0QLA7IgTKcZIYV8/wqsQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8687

On Tue, Nov 05 2024, Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com> wrote:

> Modified the from_errno function to use try_from_errno to reduce code duplication while still maintaning all existing behavior and error handling and also reduces unsafe code.
>
> Co-developed-by: Daniel Sedlak <daniel@sedlak.dev>
> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
> Signed-off-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
> Suggested-by:  Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1125
> ---
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 7cd3bbab52f2..077f95cbb6ae 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -101,19 +101,17 @@ impl Error {
>      /// It is a bug to pass an out-of-range `errno`. `EINVAL` would
>      /// be returned in such a case.
>      pub fn from_errno(errno: core::ffi::c_int) -> Error {
> -        if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
> -            // TODO: Make it a `WARN_ONCE` once available.
> -            crate::pr_warn!(
> -                "attempted to create `Error` with out of range `errno`: {}",
> -                errno
> -            );
> -            return code::EINVAL;
> +        match Error::try_from_errno(errno) {
> +            Some(error) => error,
> +            None => {
> +                // TODO: Make it a `WARN_ONCE` once available.
> +                crate::pr_warn!(
> +                    "attempted to create `Error` with out of range `errno`: {}",
> +                    errno
> +                );
> +                code::EINVAL
> +            }


Not really related to the change done here, but I've often wondered why
the kernel doesn't have a dedicated EBUG that can be used in places
where a genuine kernel bug is detected at run-time, but BUG() is too
much, and we can survive by just passing some error back up the stack
(possibly with a WARN or pr_warn()). In fact, an EBUG could be useful in
userspace code as well for library code that detects some
should-not-happen inconsistency.

EINVAL is already way overused, and substituting that when a programming
error rather than bad user input is detected seems to just overload it
even more.

Rasmus
