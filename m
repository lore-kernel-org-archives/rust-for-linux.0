Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D96623BF9B
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Jul 2025 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506821; cv=fail; b=p1NxnPhAGA+DhQuxqFpoEvNbE8Mxr0SDhb0c02C3ZKfn/SXKDPsPgSmX+bYuOucJkaWXKBd3iGfwWRawFc9u95JJffQ8NV6skYx+4ABbLzTiIpzoV5POffZeo5MqiFQLXP0Jm6nnn6QWWPk2WCSb7xEtFAJ5kOhRmJwlUDcHmis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506821; c=relaxed/simple;
	bh=w7cY/yRH5hSou35jjiY0wOKyb1WRUDWlQ1t9ffN66ug=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aFvNHhhoNhefrcZJNIjP2JFhHNLGjbvPM8mNuL2/iMUX0QNB6j8JP7dq1tyjM/sOhJdiOgHq5K0Pt6sXnm5xPQcWEEnq1f5xP7PDfexidb1RPEn3AeubV+RW6AO3826J8Vdz4RQqsW77PaYRMl2i8rRYL0XQPY6xMrK9mtoZJmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ebXy/AuQ; arc=fail smtp.client-ip=40.107.223.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ebXy/AuQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hx5EXt4GJcv/N45HHbrJ0N6SE7LTGNPmTnGTjoHqsGI3Md0tNxdVglmWnThvnTcNsg4f5KqhyL1dz5J9TNbUJQyZxKQOwfBZ2g19Mm7iECsXPxs8B/YmSDYtiZbvyPVOKY0o2JmbdSaNkIlhjxI4XQ+YKiUeoe//TOGqp+E7SppHmY1TJzEyss5m7VU2n+Jl+3FYD9JfYZrI74ydjfwXH4dbkYvkP5x5qXOrTPCRNy+kGpFzd6b9gn4rUj9QiJJujhQcY1keUxfeTMGsg1mQoX0cArc3UdkNb+p1FJR7rAvDgYPYnjz82IcLqHtM9E7XcJzb52SIENv2RS4gPaOBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iuz2k4X7/xad41Z26GGs9SrC4U9T+JleilcYYhugDBc=;
 b=UzN8iMmEJXt1WbENvINWXqoaH449Yj/6nXfsjc/vRgve7S5pTV64Srkt7WFVKlV3ttfhGOwM5ftDMok5zRjT1hZsys7qWpE8qgI4G1qhClML6xY0o0qeoHofMYhM4d1YgixLSm/LHbU3qdQKxL4kacsSsQDxs+Jp306NkaMWODLwQwM9NCxbow/xV47xlZ4kucG0E47LoWCvuMXraFIsMXqOaRS8tSDyZpkMLGtf3MR3dHD0c4r5SQHmGXcnxLYvRBTUCbAlTVy/iYzkUOHh6jKSXqsZXT/0zyPqSLmXqvU+VoNBS5r5Fyd9s06LzM7QtzF32xqf7uUGvhTUDKiJPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iuz2k4X7/xad41Z26GGs9SrC4U9T+JleilcYYhugDBc=;
 b=ebXy/AuQiSFJ8d2EZQRGdL94To2IDmopFrMl/cLqRLNQbU8TIJ9k6BDoJYjW+XWxAw8iej9+/jMnRlHPfBBTgrNpvr4S38Mm2ykzVjW28cBFW+SwY9XBTB1C6Qs6Sq3v0/0EMH5+Xea95SwlIbd+yukegNzEEckfklO91PlouOZK5Ggv8Dz1APdNfGDrI/1TJJK//8O74bA0B8oJdaQbLcjM1Iu9UpDcBoe4mGl/S/4t5Vtep2KDJVWR4vXvdYUPAOTVOnj9Id24DAe20W8wVrlX/BlTVUnzeMxEtaC5nJ6FUuA3UOElDarPN3ijWUpLaAm/QzhKIaYQSvq7z/Zz3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY3PR12MB9704.namprd12.prod.outlook.com (2603:10b6:930:102::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 15:26:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Mon, 14 Jul 2025
 15:26:56 +0000
Message-ID: <f4242f00-3b82-46ff-8591-77542d8dbb4b@nvidia.com>
Date: Mon, 14 Jul 2025 11:26:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: define named constants for magic numbers
To: Alexandre Courbot <acourbot@nvidia.com>, Quaternions <krakow20@gmail.com>
Cc: rust-for-linux@vger.kernel.org
References: <20250711113327.39201-1-krakow20@gmail.com>
 <20250711113327.39201-2-krakow20@gmail.com>
 <DB97X8JAJFI4.3G1I8ZPC1MWLS@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DB97X8JAJFI4.3G1I8ZPC1MWLS@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:208:329::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY3PR12MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f60d88d-9122-409f-6492-08ddc2eade28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWFBWUtyVUhkVzUzUDcwN1kvRkJtZGREeGROTkdRZjlLMXZaUDN6aWdMWUNo?=
 =?utf-8?B?S1BKUlBlR3Zta1JNaHdqandXNVEwaElQMnYyYzY1YS9JRmVkVlZmRDlVb1hw?=
 =?utf-8?B?V1pvaHY3VzhqbzhwQStuM3o4QVlERVNCSHNmc3grZmZTN1ptUXhnWk1qWjhT?=
 =?utf-8?B?TStFU1lRdlFBS0dvM2F0WUF6WTNxOUdzUHVzVk44YlRLdEh1YWwwWUxnM0Ux?=
 =?utf-8?B?UW5TUStzTVplTitLWUhVYUo1T0JHQ3VQRXhhQkpjZXFmZEx4YjM4TWtkVnJx?=
 =?utf-8?B?SmMzTHV5QWU4amJLTUxZQ2E2MU9zRlJTMlpxM1FhUHpZYkFkWWxrTnFRZHJF?=
 =?utf-8?B?Z1VDc0tOQ1gvQW5oZ0VmM25Id29VWVJsakNTYlJhODFBam9pdDhLeEhnYnU3?=
 =?utf-8?B?M2p2ZFJUTVh4bHRIUG5idkQ0eGJqWmJuYTZGc3oxNGR0dC85aFpkSDFKRXlu?=
 =?utf-8?B?aWFLME1rQWZKVUU5bEo4b2NZeHVON0h1eHpRaWhnb0dVNlhMWklzbCs0dFJh?=
 =?utf-8?B?OFdDYmJRWXpvV0xkL0FJbUhyTEJlVm8yNit3eG5QbFd5dE1taUk2dDJ5d2tG?=
 =?utf-8?B?aFlXOUd5RWN0c3pwQ2RYUVo4VXRmNndDS0dyL2FTYUQwRVZNay9EeXlZdHQz?=
 =?utf-8?B?ekVVdWcvS3d5c0tFczE2aDc4S3lRZmIrQ21UNkZLaUhsWUNVTG9jcUhTSUJl?=
 =?utf-8?B?VzZnRy84SkRYa0JtQkErWjNRV0xpVy9vUGVES3RWUkEzbmpYNFFrT0JzWFY1?=
 =?utf-8?B?amZLVmhEbFh3blQwMFE4VXIvbUNvbkJpcEhBRUxMbkxmRTYzckhBS2FWV1pu?=
 =?utf-8?B?TENhT3IybE9YSVBxZTFWRENyMmtMakpPSFlzcTNpNzN1SGNnVThWYzFZKzlX?=
 =?utf-8?B?N1E1cXZCbVRvY2REaVpRRmh5SnZ6NG13bzFpbkhaakY5UkNoOU43cmhmK0xj?=
 =?utf-8?B?cktTSE5PSkZ1K05VdlF2QzkrUkY2NUw1bjVYS01sVnJIbGp2QVB1T2gvMnlQ?=
 =?utf-8?B?R1VBaEN3ZHJXNGxHSU9hQUs5OUErZEk4YS9kZjRiK0ZWcUkwaWp4K3hpK0R5?=
 =?utf-8?B?YzM5bWNkeGVzdlo1dlhRcHladGZOcFZNbkp5c1lkaEx5Zy9WdktFSlV3a0Rj?=
 =?utf-8?B?UGNMMm1xL0xVYldZRmF0M3hEYUhVRXIwV1JVNFBrK0Y1WDNOZkdWUDdOYzdu?=
 =?utf-8?B?cEZiMGZlemZpVjRiNkRKV0FSZ21pTE9seDBLNzNjNVR5VmpaQ05hazZwVlN3?=
 =?utf-8?B?MTQwUnE1NEJSQUVZSm5DME5hcTJITDdtenBOemdoY2JSVTBRS2JPd2IwQ1po?=
 =?utf-8?B?TG55QWdIaUsyZjZqcHNGaitwcDNkOXBRSjFISHV5bUpBSHZ2N2d2OXl3WFNM?=
 =?utf-8?B?dTdnU211dnRsZ0hON3hIZXd6blNWbDBINktQWldvR3Y2ZXNFWGlzalNxelFp?=
 =?utf-8?B?c0psMTFjQkEvZ29IVWVwUFlFTGg2M2szWU94MGErYXlWZEN4NWxHOUpFLyt0?=
 =?utf-8?B?VzU3T2RrQXFlZlZNaStaUXhaSkwzTnJDS1p5ZXE4R2NiM3pwWHBCUURqMTJo?=
 =?utf-8?B?cmp4TnNTa08wUlNEd3dwL0hwT0JRRGhYUEZJOHh3THZ0TTZJa2YxN0hLUTNj?=
 =?utf-8?B?bFZtU1FhRVhRTUlyYUJuTVZxMVdWdEdUSzhhN2dzOGljVWYraDlPeDhLTGdD?=
 =?utf-8?B?MUFEb0JXZlpveEpDYjdXd1lFMENUOWNkOTlka3BGcDcxOWxULytYbnEzTzBk?=
 =?utf-8?B?YUNzd1ViYXZndXkxS3ZLd0dLWk9MSEhrU09DbmhBK2wyR1VzbkxkamhSVVRq?=
 =?utf-8?B?S2Z2aEtucWZwQ2FPWGFjZ3pGclNlelhNeDNWN0hZUERZMW5MRWEyOGZ2NUFm?=
 =?utf-8?B?TzY2ZHN5Rk5nMDdxd1gzUitTQmttYTVNM1lXS1FmZmhkS0gzTElyNHpMQVZ2?=
 =?utf-8?Q?SJArI9KRKCs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGF0Si83TzU3eE5hRU4yVDQ4NDFXUFgrcC9YNkxMYzRZcWdEcXVqSDNNV29V?=
 =?utf-8?B?U1kwUFBWK3c4ODJIcFg1R2hNUnVGa3UzWDNPSjZmRVdnVDNUSkZvbWZyWU1J?=
 =?utf-8?B?MW0yTXlKSXpaNWZjd2l4STVpUDFBVFpoM1NZVHBFZDZOd0YzeTVPTUIrTEJW?=
 =?utf-8?B?RFhlRlphR1FkQzhWVTRTL2ZXdEZsZVAxRStUbndZeEhabjE1WkJkL3VaMWRp?=
 =?utf-8?B?c0l4akN1Q0Z3dmJjcWRVa000eEhmNFQvL2lyTGVJUDlYdElCRGR5NkZISU1J?=
 =?utf-8?B?MjFCLzlsNGVqWW9iV3RRVVV5RDBjcHEwd3NNbHZaQzd4V0lmM1U0RklvTkhr?=
 =?utf-8?B?OElGRFdNYUlWY3dvZmwxL0NETlNvNlJYNklXaXF3dzhFTjBjUm1weFBETWsx?=
 =?utf-8?B?RVowVnZxY2p4clVDdENNMGVObk1qTmtSbU9JNWdONVhCaGI0QUt4SXZkSWRZ?=
 =?utf-8?B?ZnBVdWtkc2FweDF3cVRiN052Tm5ndGxCOUZMc3JwNUE3SWZiUGdjbmlCK0Vt?=
 =?utf-8?B?bXlaV01CNjhCL1hCWWRvS3J0WW4wUkN1RzZqNHcrYTFnU252WHpCek5lbXZS?=
 =?utf-8?B?d2QrRkl6MUZVREFnOWJTU2FvdW9kczRnTnVLaU1Rck1pY0g0S1Y3Mm82dEh4?=
 =?utf-8?B?a0p6V2VpZHFaREZyMGpsK1hHcDZmM1A1KzNPOXZWTU4vdWZmYVRDRngzYzVk?=
 =?utf-8?B?ZURZbEk4NzE1UXNWK2NKSVBGelkzUElMUkxQeUVLaXl5RHhBNWM1YzhBM3Bm?=
 =?utf-8?B?cmNTQm0wSXMzSzBUTUwxbXVHaEFzb1ZZbUZBUExwbWdpQTZNMm5iTGhha1E1?=
 =?utf-8?B?cGMrLzJ5ZG90U3Z2L3RrRHRNYlV4T09LblFRNkt4ZVdRRUJVSEpkR3N4Y2hi?=
 =?utf-8?B?cHlXd0piclhpUSs4UW5sK2pnUjBUa05mTmp5Ny9kWWo1NkJ0UktxWFFENW14?=
 =?utf-8?B?SHNWS0xtdXRZaVhYWnlWM3RFUE1iL3UrRXI2NWZpVDIwRFY4cVJjdFdtemRi?=
 =?utf-8?B?SFV2a2RqMCt6YXdUcmJ1RUhtKzBBNGZ5TFphcHVKVkh5Z2VhQkFLQWNuc3pG?=
 =?utf-8?B?a0FJcHROVkIxRWs2R0Z0TDYxRzR0Wkd2eVgyK0pzT1ZlejI3cHVtdktnZlB2?=
 =?utf-8?B?Y210RGxTRURWUjljYjFqVVAvYmc5Qzd2bVFwVUtycEN6NDZKTDl6R2t3R2Z0?=
 =?utf-8?B?RW9jYyt4VEhzSGkyMGdraU1CYk1FZHN3cDFubit0QlZXbFJ5WVRieWJ2MlJP?=
 =?utf-8?B?TmFRSUxpaTdlZVM4aHVHTy9pZHdKdGVRSTFmNnlidGZXcjBaem8xa05Nckhn?=
 =?utf-8?B?anNndEpKdzNJUkxOVEN0Z1NhM2kwTTRKVDdRQXR5aS9EK0JlaTBvM0VUWElo?=
 =?utf-8?B?RmduTFRlRGgrNG53b05BUFpPT2ZQdjJVQXF1RWNjaFQyU3BCbFhjd2ZwQTFT?=
 =?utf-8?B?dlNyWnFYNDN0Z2RNN2s5VVEwMENpWE9qaDhscGtvUis2MmZZbEpNQlhJRDM4?=
 =?utf-8?B?MVNZa0tNblZmNzA5Tk1yOFVsWE12Tzc3RE9YQ2xYSWliaURtdVUzdGlJdys1?=
 =?utf-8?B?b0gxR2ZybmxWdlVtdWFkNGdBbXgvbG1hNDJLR2tNdUpUaVg1ZEJRQUVpQmJk?=
 =?utf-8?B?bW9rVXRwNkdQZ0k3TnJ3c1pGVnVidXZ0K24zMkY4SDRxTnNjVzVGOGE3SmM0?=
 =?utf-8?B?RHpVRC9CeFZ0NTc2SUZBU3BEeGdJa2NxY0wrd1YyZ0REUXc3cXVwVXNXTU1l?=
 =?utf-8?B?MSsxVFliendFdFBpTC9LSTJuYTB0cjN4bWs5RG9yaE1VVHdGSllVRGF3T3dh?=
 =?utf-8?B?ZE1WdEhid01BM1RPbXRDZDBJbFpmYnhmNUtBWTBjMkZtVVlBSDV1R0RxWkRh?=
 =?utf-8?B?NkNpRU53NXZYeEhMK0FBZEhsdmp3Y1ZLTG9RMW44c2ErbHQ3YTRWVjNFM2k3?=
 =?utf-8?B?elBadnphS3NFVk1GZTVSV2MwRUN6WDF0ZU5TU0F0WEx6VnVrWHk4VUsxeDNE?=
 =?utf-8?B?dkFRdG02ZGZ2anorVXExK1JYdmdXWDVybWZBa0RYSm0zcEFUS1FlV3I5SzB6?=
 =?utf-8?B?TEZPVGtmQnJsMWxDbzFnL1dEaGQ5aHVkdy9PM1MzeWJvM3RvblJ6QURnRTZN?=
 =?utf-8?Q?eDE+ozKyPHTMDoreBIW2mN9BR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f60d88d-9122-409f-6492-08ddc2eade28
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 15:26:56.3322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMJOdX1zfe0byQX4X8q/+we6K0tKZyce46H/x+9tZ6PhThxdxVR2xmWckMB5/twzvDnS2Wp9QsdntxNgNQTYSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9704



On 7/11/2025 8:18 AM, Alexandre Courbot wrote:
> On Fri Jul 11, 2025 at 8:33 PM JST, Quaternions wrote:
>> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
>> ---
>>  drivers/gpu/nova-core/vbios.rs | 15 ++++++++++-----
>>  1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
>> index 5b5d9f38cbb3..d456c494374d 100644
>> --- a/drivers/gpu/nova-core/vbios.rs
>> +++ b/drivers/gpu/nova-core/vbios.rs
>> @@ -364,8 +364,9 @@ struct BitHeader {
>>  }
>>
>>  impl BitHeader {
>> +    const MIN_LEN: usize = 12;
>>      fn new(data: &[u8]) -> Result<Self> {
>> -        if data.len() < 12 {
>> +        if data.len() < Self::MIN_LEN {
>>              return Err(EINVAL);
>>          }
> 
> Mmm looking at the these functions makes me think that maybe we should
> rather:
> 
> - Make `BitHeader` (and the other structs affected by this patch)
>   `#[repr(C)]`,
> - Wait until the `FromBytes` patchset lands [1],
> - ... and simply implement `FromBytes` on these structures to replace
>   this code, which is basically a little-endian deserializer. Since Nova
>   has no plan to run on big-endian targets at the moment, this should
>   work fine, and removes the need to define constants for the sizes of
>   these types and use indices that are always error-prone.
> 
> Or at the very least, we make these structs `#[repr(C)]` and change the
> implementation to be done in terms of `size_of` and `offset_of`, which,
> while more verbose, also promises better correctness.
> 
> [1] https://lore.kernel.org/rust-for-linux/20250624042802.105623-1-christiansantoslima21@gmail.com/

I agree. I wish for FromBytes to be merged soon because we are also continuing
to use our own version of it in several new and upcoming code paths in
nova-core.  A conversion to using FromBytes and simplifying the vbios.rs code
(along with repr(C)) is much appreciated. Maybe a patchset like that can
reference the in-flight FromBytes patches.

thanks,

 - Joel




