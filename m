Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011056.outbound.protection.outlook.com [40.107.208.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAB71A23A6;
	Fri,  6 Feb 2026 00:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770339009; cv=fail; b=mhZUQXvy1DNqR2oHWnOSFL8yXhCX18kAF8RJiVuZqSxCEdMeb+ZW+DB+aX7nhgWEylu4j60CJc5Xh3P6NZ5IPmGdCcGPmryu5jA6f3hVaRaYmrU+x2guO1Ab9DIs4NGXLK+thf1Ayg2Qj43XG31hRERftai4KHK5gj7ryiMRfwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770339009; c=relaxed/simple;
	bh=TDZWTZ5VCQ/QMavNYvGoPPDChInG+R+PTIGYpLUdgNE=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cix4pGJYXsykqO0bUfYjs2l2JtxdVx1sAOJ4OtlHP1sA4A5qWY7xzO+umG3OHGBxOVAjK0WqUdZlMX6uQQPRXk+ISqmBd3BoUgKV5H9qinGU1QlGLTdbfo+0Arn9+Aq2e7IYlkQtgo6TDqva4JAuev5yPUdfPubimZ1LPDgNGAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bjvQdi9C; arc=fail smtp.client-ip=40.107.208.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bjvQdi9C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYTuc52lTeXYcaq+8LWUxLFy8z0L0InYQsfVVorEPS3sB43bXUGgJgmDsP2jhkDXD+kRKq/I2GlAAN1N4ay3ol76/x1tN97sivciWb5KSaVsWanKacd8zouj8Wo511QC6lJm5iqhQ+2WQy9a83R0yrRBbSyGoJTKnzq6hSNEniKlDwLYm9I5eE1AX2PDD91yZMnxVpJb0g6wejppe76owCE2QASIK0UHfG63UVzy0mPtIHAbaj+/+fkJRvJqVloXlkNy/Z/M81fqpAt292bx9omu2z2P1pEI3QgDRBBF1SZvKQcNYieTOZjxrswlwQp2SBPqRGWHYum3xQippbxwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b14ge4piwRlAjndXkTe8jKEottKL4fMj+Gd2KGxNs0E=;
 b=K+2pl/4/zC2pQemK4Z69vnbblfHfikgp1TfZGlBmiFmBBDiXqY7uZwundaTz3dca8RsYExmwHPz5Y+YHkkkn8/1YU1qg0Ew6r+iyeszxjee73DA8AclqQr+9EgQK9cFpicQWo2TyGw4zbtoCkOPPwGRFWJ5ALA6KbVdVxffkHriy7KDFkdBGrROYUoKw2bUKzI1p7Yx+uSBI3gamUQMZS2g71tDISrocha0rhjQrTxL5eebXkHMfF+ljkYO2p49FetB7RTNolJCeXnwR2GWu7GYz5P8gSsO0Na8KMejSkPTGHGkzWYhV0du36fnZ0rWTbFZWnHPKp2EvuVePz7jRLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b14ge4piwRlAjndXkTe8jKEottKL4fMj+Gd2KGxNs0E=;
 b=bjvQdi9CdxXrvwgqXM2W9alVbjzaKc9KxpGZJ5/8ILFytoGP9Rgsf0GQOnHfrYISemhFYZA6X2neX4q5fspxwJarD5w2ctRhGOm4eiLCX/b8VSq+SxgG7wLdsW97oXusA7P87K0GKYNU+vgiK2tKCESyJsRD4d0rZrNaz8ndikUyoUQ9mBQew9qnWSI7CrJ/+dgFWKmTccTuRDnTINM3Xz9ph7AgGeDctM8r0K5/tzEkjw2lS1dHYDhHWnFpZHr2pcD9iz5KyQAD3hbqrNSRB2Ns85jPJE4hHEKEZPyMv76yahNwZxDI9ZSAxgzUktWaLOLjJi5wCr16jm1yN7BmYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA4PR12MB9833.namprd12.prod.outlook.com (2603:10b6:208:55b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 00:50:06 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 00:50:06 +0000
Message-ID: <44507281-87bc-4548-b542-addf3477921c@nvidia.com>
Date: Thu, 5 Feb 2026 19:50:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Boqun Feng <boqun@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Boqun Feng <boqun.feng@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
 <20260203121520.GN1282955@noisy.programming.kicks-ass.net>
 <20260204111234.GA3031506@noisy.programming.kicks-ass.net>
 <aYUOME2XV_ZmRk3F@tardis.local>
 <1a332333-0706-4548-8fbe-d65956f70f99@nvidia.com>
Content-Language: en-US
In-Reply-To: <1a332333-0706-4548-8fbe-d65956f70f99@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR14CA0005.namprd14.prod.outlook.com
 (2603:10b6:208:23e::10) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA4PR12MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: 3626b411-160f-4e37-730b-08de6519ab4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0c3VGJOVHppc3hzSHE4RkcvMHY0eFVBMnIvSTc0T1d4OVNzR1VHb3d6ZGx5?=
 =?utf-8?B?N2FZYUliNG1RdXpETnRNMjkySDFJY1hvbnVXYlc0OHFqV1RTVFR4cE51bDNR?=
 =?utf-8?B?YkFuc3FrWitKamFDdm5ja2ZqZSthTFN1bTJwSGVZZzA4RVJCaENUd0VEVlZW?=
 =?utf-8?B?dUpDaDNLbDFJbW5JZCt4TVh2clpaZERJTTE1bnY3NHJkOVI1SjNFZG9hQThM?=
 =?utf-8?B?aXJFaWFEdUdtTm5UbkpVaDlQaU1mcFEzdUZXVi9Weis3Z2ErYm9qTlRSTTVt?=
 =?utf-8?B?bFNkNzJwTnMwai93cG5hbUN0TjFvdFB4enQxeDljRmlBK2E2a2EwdzdYcng2?=
 =?utf-8?B?Qyt1dnVxUzNyTy9LcmJFWWxKMENXdDlkUXY4U0g3U3ViOVV1Und3cEh4L2Rl?=
 =?utf-8?B?dVBSakNHM2RZcnhxdytpYTFWOGNhNmpFc1lEMDMrSm1XcHdzWkFUNEx0L0Fr?=
 =?utf-8?B?Vng2dGx6aFZuWC94RldBNUhZNVRjM2xCOHczWmI5cUIyYUQ4OEpuMmNZQWc3?=
 =?utf-8?B?UnA5LzFMaUtDdytqQVJiTjA4ckpSRmNkRExhMTBiaUhuNVB1VWRWYTBoN0ln?=
 =?utf-8?B?cmdSb1Fpelg3ZzN4YlFVUEtMVUNXSjZBT3VpVW4yNzZkMzN1UEQzRXlkMnBU?=
 =?utf-8?B?U1ZrWUJNalhlS0xJQlNGRm0renZPVGpNRFFLekhjaW1tN1I5THM3ZHRNMDFR?=
 =?utf-8?B?aWVUVEhrSlJYUzdqTXJqNzhkdURyREM4L2pjZ1VkUXk2c0E1Sks2M2FnZ3pO?=
 =?utf-8?B?SmpOcFpnZXhNMWZZVkFtaFJtaVdYVUZVc3ErR0UwWHY1WFFTY3p1OXBVMFEy?=
 =?utf-8?B?WVBiV3JxL2hYaFZTV3JCMnI5RGpFeEl0WVplWlN6bFJSUmlvMGJab2kyeXg4?=
 =?utf-8?B?NnNQZEdDbU03VjZMV1FkbG4wMll5eFVwSDJZeFF6OG9RNXJxLzNjcHBMdnNr?=
 =?utf-8?B?bk9zT2ZmZzlsMEFxOEk4RGluTEhvRm5EVStGc3Q3M2daeHAwVWlXdmxqcEFi?=
 =?utf-8?B?NmpSUnhCUmpYRkQ3T01PWHAzVVdwcGJMMkZqTHNPRUxuQk1vREw5eEtmOTVY?=
 =?utf-8?B?Ny9RTDJaUVZ4YUtmTkcvaERPaWY5QkhrdTkxancwUmZSMGVRNUc1MTFlbkNo?=
 =?utf-8?B?Ryt2VE4ycDhSbjVVTGFleHBxOU9JTlNMTWxFRkVsb1AwemFlNlo3TmtRTFdx?=
 =?utf-8?B?RU9obzV1QTEyWUZROVJwYWdnQ2VuMm00NFliVDJBK2pUL3plUCs0b3hWZVA2?=
 =?utf-8?B?NVlXT2MwSFNLV2FqM2greXUvdXZqMDdXNEJsVElJVnRVdDhjVS9yT2l4dmxj?=
 =?utf-8?B?WGJkTlFCc0VyZmF2MkZ1Uk5ZbGh4Wmhrdml1dHBlaUx5dFRuY0NtcERLYld1?=
 =?utf-8?B?eHpCMkgzR0Vqc0phWWo5czd1YTBQY01XaituNzhSeldkVG9uMkRMb1Ftbkxo?=
 =?utf-8?B?Zm1hYml3dHU3KzV1UlZxaHltWWh3V0lsb21Yd0FLNlRXcmtzZER6dHZrRkNh?=
 =?utf-8?B?dnpPRThzb2loNUJJYU9ReDB5ejJJTFk1dkxzdUZzN0ZvN3BPTTIzbVNZcHNV?=
 =?utf-8?B?T1JoZmF4bkdhU0U2SXBrN2ZpQ1lMK0dkOWphYUYxNVZxWkFtZEZJL2VrLzlI?=
 =?utf-8?B?NXZJZXhNU0xLeXhkS3BEOGp5L2NNNzhZNDFUdUk4dWRNdzVmMmx6NTk3a21L?=
 =?utf-8?B?ODlhVVNBdWhPU2NKcEN5cVc5UVpuM09DYXFuOHBSUXFJSmpZOWs1MmtaWldV?=
 =?utf-8?B?T1dzelR3SllnL0RrZDNuL2N1dXRzTzZsaXVQTDQ1QThpTXo4ay9qKzR4cFhV?=
 =?utf-8?B?OFpiNTJtY20vTnU4N0tLUEZsSmM2SnZ0QmVZMWpNa3htUVQ2VE1VaWJhWnNk?=
 =?utf-8?B?U3FpQ0YwOHBJa3BLMTRhYkRod3hHeXFrTlg4M1dRWUd1SGZ0T2dKK3dFcXpo?=
 =?utf-8?B?Q3I4aFlFV0hKZnlNUldvWFNacHVFcFFGVWE0WWU0bDRibFBwM3graWViRFZT?=
 =?utf-8?B?R1lHR1UyUjk5VXhkOGh4UEp6dEsvald5a3R5UzRRMVVIcjcwTEwvZUxDZnVM?=
 =?utf-8?B?Vlg5bW03Wm95RnBiaklPVE1KRTFmeGt1Y2JZbEUwVFlUeW10eHovU2NNb056?=
 =?utf-8?Q?ew1E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akRFbHhVRHRvcDgvZmVIWlZPb1pSQ1FZZjN5N1ZJdWJlQUNkSVB5MXBwU293?=
 =?utf-8?B?cUJqSnBFdjZxWUFFQU9lRW5hZFh0ekZqblg2ZE1VNmdSVXowM0dNSEV0WE1t?=
 =?utf-8?B?bkM3aUJiQ2lXNy9XVCtvS3VqSmtMSFpmaTZrd1kzQy9uVDJkeFBIQURYcEJO?=
 =?utf-8?B?WVV5NEp6Z3dBem5aLzdocGExZDN1SVJlTkxYdkpXS1hYQkRKTXVHWjZpZURj?=
 =?utf-8?B?b3Y5Tis0eUdOdlVCd05PRWxydmNINDR3SWxQM3E5eVNhS1U4ZzF1bGh2dVgr?=
 =?utf-8?B?QWlkemdsVTRYZlhkTC9Sa2FTYmZDcWJZeGpmRmtSZUZyZXdNbVhHaDQ0cHAz?=
 =?utf-8?B?ZXdnS284VmwxZXVqNi9OeE9jNTA0VTFTUnorV0tFbWY1Q25WcUVmaEFtbnpi?=
 =?utf-8?B?VjFMSTFPZDZ4UVJ0V0dKN1QzbDREanpyMFlaRW1iWnBlb3hNd29OamMxMlk3?=
 =?utf-8?B?QkQxZlVONlhoR2ZiRmdlTFQ1d0FWanJRU3J6K1ZGaVNHaFd6OE9FMFVhOFpz?=
 =?utf-8?B?aUJSV0t4SDdrKzNrN2toSVVTVXhCbEZBUzFVVGE3OUkvSW1uNm1FNTZ3RGhl?=
 =?utf-8?B?dVVHZVp4bEgva1NxQWd5ZENjaFJYM0RKdlcwWGxibE5lOGpWVmM5QXJINzhn?=
 =?utf-8?B?YmNLa1lyTUxOYkp4Yk5FY0JxeUtXdkRJTWpVYmxJcXpYMFBZR0NSZGxiVWNh?=
 =?utf-8?B?dGRPWEM3U3FDN3JKd0lQZzZlSHFGSlQ1N3QzVmlVZGIvbkNMcnQ3Rkl0YnF0?=
 =?utf-8?B?QmpiNmw5ekJ3RVN0eFpTK2lmUGFxREdPOU8xUTJxMWVBOUtBS1M2T2l2Nm9k?=
 =?utf-8?B?SU8xaitqTGN1Rjhja2JBUXZNNUZFZU82YVdLVk0zWWlzd3J5Qk1VMXBSK0U3?=
 =?utf-8?B?UGNqU2pOelJvaHNWd2hPRTBVdXgwblVsazRGL3lMaURBVVgwaWdRWi9raElu?=
 =?utf-8?B?NUErTnpGQzJKS29STUxFQVN5QlRMRWhhVDE3VUFRbnVmUTVGbVQzcFh0a3RX?=
 =?utf-8?B?UnJsanpIS0szSndnZEJnTGdWY1cydzhRSWl5emwwT2EvcE5zeVpHWHREVlBo?=
 =?utf-8?B?RGh6NEhqd3Q3bHlJVnNSN1AxQXVkTFlxbjNiT0E0aWVlMmNjRkhzb21kZmxp?=
 =?utf-8?B?cG5kWm5IWEtpSmMvV2FjY3BsNXFlOHNRRXhzbDNPSG8wQzJHdzBDUFhBUkVE?=
 =?utf-8?B?Y2hqTmJFU09JV0tpeStSNWZxWXZMb1BLc0cyaG1yM0xWRzJtV0lpU0t3MnR1?=
 =?utf-8?B?czVQOEFHOExZU2dkUE1mNkJXdFdmYjkwTW9JYStrb0ppVmgyKzl2Tkx0dnZy?=
 =?utf-8?B?aTlSbVk2b2ppbG85bG85b3RuSnJQdDN3RENmc2FtMk82ZTkraHdsUjNHZDhr?=
 =?utf-8?B?N3V1c2Q2c2k3UFlTZVhBcThNbXBtZ2RrM3FDaFlIU2YveVlUOTRLVjVBY0lQ?=
 =?utf-8?B?ZmN1ajA0bUFBSFBNZERvZ1JaTU4rMW13VjA0eUJOSUNtaHhXdFZKQVpURFNn?=
 =?utf-8?B?c3BxTW16NHhBQ241RHhQNU5BbWNBTU4vdTRGTVhUQ2ZXek1Bb3ZzK0hxNWw1?=
 =?utf-8?B?WmpHOEpYVkwyVzRQUThaQkt1dlhFMnlHc1pkYUpyTEx5RHY4OU93eVYzNXda?=
 =?utf-8?B?bVJrbWV4czlPZlJJQ3IxdVZMblNYRlI5OTFnbTBQeGNLZkxrcEllbE44ZDFJ?=
 =?utf-8?B?dkNLNGlxblI4cDFmSWErckd5dlRQYWUwQWJVY1FjelNWNFNxdExpNFVkZGY1?=
 =?utf-8?B?THZrYWg0dkNGeVJUQjdZRDNOeVpEanlJRFlIcUdlbFFpQ2VSM1I1S0FML3p2?=
 =?utf-8?B?aDF5Y3ZCY25YdDZYL2lUUjVCOU5PeWlRR081ZnAxNGdtRjlzeXFKeUhtNlFX?=
 =?utf-8?B?NnRKRlFhSEZ6QSs5dGlUd0NSZWdOT2pOQ3F6dVR2V0hCZEphM3lHLzM5dGpK?=
 =?utf-8?B?STBSZE1SR3hmTkE2Y24rSW90TDloUkZSclZ3RGtXVHo1bnVEMnoza2g4RGQw?=
 =?utf-8?B?TTIzalh3T0NSa1ZLSWo5YlNOc1FaclAwa0NNOXczeGZWV21tRUJqNWVBMXU5?=
 =?utf-8?B?dDVVUzdpekkrSGxoUXRNZTI1ZnRQT1ZwUlk4Vm4wYmVqenZ3Q2dZdTJzcTFW?=
 =?utf-8?B?dlNjR01yWHorYUkzYlpSYWVEQUM3NzBGVWhmZG5CVW9oVmZJcGZWdzlBdVVu?=
 =?utf-8?B?ZUV5VGdDWjJ1SkJlVGtacWVOck84cktwbjhMc1RZSktKOFJJUk14NWFyS1Jp?=
 =?utf-8?B?TC9uZEdacHhrcUgram1QdnB0RDVoZHVYa01xUTZUc1ZERlJoRGRHMHZSZ1N4?=
 =?utf-8?B?US9CTzB2Z2IxaUVBY2RQd0grczNjZnV0Z2JXdE5iWjVqaHFnU25CUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3626b411-160f-4e37-730b-08de6519ab4c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 00:50:06.0163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3HwnQ5YhZK3wRZCF154Jn405BcE19RvZW39/BBYBnlacIfaezq8HoPjysgpm0AdBJjWAHiv/qfGk5f5CjKcjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9833



On 2/5/2026 5:17 PM, Joel Fernandes wrote:
> 
> 
> On 2/5/2026 4:40 PM, Boqun Feng wrote:
>> On Wed, Feb 04, 2026 at 12:12:34PM +0100, Peter Zijlstra wrote:
>>> On Tue, Feb 03, 2026 at 01:15:21PM +0100, Peter Zijlstra wrote:
>>>> But I'm really somewhat sad that 64bit can't do better than this.
>>>
>>> Here, the below builds and boots (albeit with warnings because printf
>>> format crap sucks).
>>>
>>
>> Thanks! I will drop patch #1 and #2 and use this one (with a commit log
>> and some more tests), given it's based on the work of Joel, Lyude and
>> me, would the following tags make sense to all of you?
>>> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> I don't know, I am not a big fan of the alternative patch because it adds a
> per-cpu counter anyway if !CONFIG_PREEMPT_LONG [1]. And it is also a much bigger
> patch than the one I wrote. Purely from an objective perspective, I would still
> want to keep my original patch because it is simple. What is really the
> objection to it?
> 
> [1]
> +#ifndef CONFIG_PREEMPT_LONG
> +/*
> + * Any 32bit architecture that still cares about performance should
> + * probably ensure this is near preempt_count.
> + */
> +DEFINE_PER_CPU(unsigned int, nmi_nesting);
> +#endif
> 
If the objection to my patch is modifying a per-cpu counter, isn't NMI a slow
path? If we agree, then keeping things simple is better IMO unless we have data
showing that it is an issue. This is code is already quite convoluted, let us
not convolute it more with 32-bit specific things.

I had tried moving it to DEFINE_PER_CPU_CACHE_HOT, but ISTR that did not work
out (I think something about a limit to how many things could be moved to cache
hot).

Happy to revise patch again with any other suggestions,

--
Joel Fernandes

