Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B55E4D8CE
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 22:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767218843; cv=fail; b=cmUMfSZkXvHYk+jfLXsoDCIWdDtzxD4q/OVD2e8NVrP4daay746sAhv1DC2GtqvoTCXkuAfvSh50sgBe6RG6lbH6ww3CKANp0QqcNpAn2uVzHEcc/jfMbNXy8+NzKGQJUIgA46ze9jcQ7xYBEsR1L3t0jS5xlRipKjHASEuG+fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767218843; c=relaxed/simple;
	bh=fVJlTtoOsRUSRdI/++hEOl8HyBxiDnsrS11XESCdGY0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XnowtCg2/vQMA+cJTVUX/PDmFT2stnaEv3fqRC24vVZNfZHcOZIzwMg9BtwrYxS5EiQRjEcZAtVsUKPgdRhUQRtcJQ/VkSP5GQdx/KZImdBEfnPB/8Pt4gvrgN7dPhWDPA3XwHnGHrtjrKbVB1ddQZWEu3Ku6JtW6elJ9aryUIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=reR/JpGd; arc=fail smtp.client-ip=52.101.48.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="reR/JpGd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2sxyIH9zYbNuV7qB+XUWdDSIbHXyb5t3oI5oLdot2A/mSKHgARt/tXxbBjwutT3beUL094jeg6PuYqGaEgTVTCAoJDfNSQpcUQqoFQmrC/0ssMrWAr7Nn1e5PLmnAlSEhthGznrXQxT2NoYRRL06U+yNq1AS4wUGKrndHZjET1v9I+6jPgsksFb0HFJL5eSOFDqO2THNkardCaq6AUwgQE8H1QnbCn7ZtSpxL3AxFzGrzKwIKx6E+MO4jlRjlDbEEQMc8crokR7OKsm6TAAvBaNSEru0lTpNw1FuJplyFyYBh2Y8IkprXyCjNZC7Bp5upW4Kia4JJ0toKe/hrl6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nz2Kt79fJplMQHTMJ/R6NL8IqvQKsjtIGKNv7ZMXX8=;
 b=tkOEJx5XGfB4kbb5vprC4RmK2iyLi8K+zXKGnKpdbYTt7lJhSoJM2GaznQ3mr0nXtd/2ie0yzCJxUzY4oaoyhgu2i9QM7vCVyojcWc7FgzKBCIhhM/X1REtjJKuVXo4F6HL5JptKnwzDn7ebi0uMHWcXAFSPRU6M/3o6Qd/f/w0ZRgdH2/xFx7Kq01ZhzgoB3Q+G9aFjwcahucmwIdziWtiXhgOtmmO7Rj0u/rmeBOKoyERnsPKYOqEWqLYXiFIVvb/FEVJ5HRF1+nOCJbi+6IbtHOGO/RjohMMnE84Z3GYzgBRNmITmQa7RbQtcVwalTUeeTLcVfQsrr4kYdOnrnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nz2Kt79fJplMQHTMJ/R6NL8IqvQKsjtIGKNv7ZMXX8=;
 b=reR/JpGdaTsbZQoNbKEs1Rdmf5OZG4JlF2dhki5yhma9SfsEBAudnCSS581Q1MT0NssIszATwfME4HQs+vLbgSMKVyC+s4e2lfUQ7YropmE7CJcAIc8hkWNTfE81XN5dqf8TD+hOSBKDCZGXr+JZyWSFoIlf2tlZK7a1U6k76i0MsQJHZ1yxWj8J0Rh5AjnzWUmLziT4suL0s/lNPmyFIVYEFwlKHlzPBoFeqninu1KnelKi3o5TbdG+UW6MQfenT2zT7V3miA9ANGY3o06KzgpLly87sOK8tAeX0yhaxM4kmuqASDdCaKH1hmxga9n+VM1IiYjmaLP1NdCuIIjb6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA5PPF80B25317E.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 22:07:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 22:07:13 +0000
Message-ID: <9e93c2ca-4495-4654-9726-b2c70fa85c86@nvidia.com>
Date: Wed, 31 Dec 2025 14:07:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] gpu: nova-core: move some functions into the HAL
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-7-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251218032955.979623-7-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA5PPF80B25317E:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db0b84f-6f2f-4822-db3d-08de48b8f358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MytPTlNxd0MxbXA5eG1xazBwK1F2L3B5NWtOVHpHZmVKTUdIOE8ycEJPME0v?=
 =?utf-8?B?cW56UEV4clBhUlVYd1FTM0V0QUQzK1I0OWp0WVlKUHdrL1pSNkMzb3pxVVBw?=
 =?utf-8?B?OWNlQ3NlQTNBbTRYb1c0amVzSUVrMkVWQU9OMjRtRE5nMjNVdTNJWlg4RHVO?=
 =?utf-8?B?VWhiMGFDUmR3dTBOc09VWlpPeHB1a2dyWXNpMERmU1QwZFBIaFJxM0FzMENn?=
 =?utf-8?B?c01TWVVVOGpxOXNMM3NkR1RsRDVCWHBnVmFYdGZVNWo4ckR2WVZnQ2Joa2J5?=
 =?utf-8?B?NFRQV0lTRzYycVBXNlBrZWszV3lQZ0RkTHVpbE45T0FBWW9XM0hhVFovMllJ?=
 =?utf-8?B?ZWY4UVdSY0l3aGVhbWRISU42akFmalNFdVZnSnFoMkxFNEJSTnNUd3gxNzZX?=
 =?utf-8?B?SVNJNitCams2WFZWcmZTem55c2lnOEhyMUcycTY3alk5SFRCS0NCWCt5Qkhy?=
 =?utf-8?B?d1IxRHFRY3phSjd5NUpldTBCek1tUmlLdzlVUVBBNWVuK3g2VnBCRkU2dzcw?=
 =?utf-8?B?OE9yRFFlRmxCVjdPMnliMWRVcGlyR2R1K01kL0RFYzB0NFdCQ1hhbmlRaGt2?=
 =?utf-8?B?RXllTEtwdFAxR09KcjlkNnRyVHJEVG9jMEtRaFVXMVRoR2Q5MFNwR3FNWjg1?=
 =?utf-8?B?TkxadW92WDR2RGV3YkQwZ3VEbDdaV2VJbVFWeUdwbG1UUW9tazJKTGhacEdK?=
 =?utf-8?B?b2hsVEVIZ0oxM0FPNkE1SnkxTTQwbTRxUTNWL0U4M2JBSVhQcU5mektESnhm?=
 =?utf-8?B?L1hDU2pZUUFVb0FUcjFFemd0Z3RtbkVwL2l2R2xuWHpDc3l4Qk0xVGcxNHBz?=
 =?utf-8?B?emZWUlV5R3B3eW9pM3QzcDVrbFZGcmw0bit1ZmY4ejhPM3lqcjlpWUo4c1Bk?=
 =?utf-8?B?YmV5Z0hJWHVTb2hQMncxR1kxVk5KRy9JbG9rd2lPaFFEOW1ZdGxWNDYxKy9G?=
 =?utf-8?B?M3FUZ3lYQ1g4RHdPOFlHZUI2TXl1VWg1Q3hhSm1mbUtST2NobWdaeG5JdEFr?=
 =?utf-8?B?djlGMkZDMEJBMVY1VlZQcGlOa1lNY3oxUXB2R0E2bUJSVDZadHJrOERNOWZ0?=
 =?utf-8?B?Y3Z4VkdOTFhEaC9UdCtNa3RRTFVWa0QyY2paSjRSbDViOUwyb1RUeEM4SG5a?=
 =?utf-8?B?YXBBWmliL0p1aVpIcW5GeVpscGJQbWJXemhXa3Vvc01FcS8yWGIwVTkxd0l1?=
 =?utf-8?B?dURwdzZqQjRJQ3AzVThtZVhmN09CaWJROXkrc1lyTUtudlNTM0tabzBLVTI3?=
 =?utf-8?B?ZHB1ejRvVThKOWdlR2ZvS3YzNnZKdStuTVYzdTNxT3NjZENWb1dKS1JVeXc2?=
 =?utf-8?B?RkphbENrOUplZExaZ3dkVkd4V3R5N1JKWE5vTmQzMld3TEpsb3d1eUtxKzZm?=
 =?utf-8?B?ZVZ3TmhmMkQ2TVdHcjJCVFhhOVFISkhPbkNvdHZFdU9XeFNOYzZRTitYMXZV?=
 =?utf-8?B?VWFCZ2FYTThZZDBMSTl6Njg1am5SU3J1WjVJa1VKSDZ5a241RmVqck1Cc2pl?=
 =?utf-8?B?ZHZXaVlKazFLek5FT0VYdUo0VmExZUpVSm5ZdDRFN1p1bnllTi8ybnZ1c2Rp?=
 =?utf-8?B?WHIvSjQwQ0dabXhVUXB5NTZDSmRiaExBNk1jWVpQUndseWpweDVuOENSUEdN?=
 =?utf-8?B?WkNkalErczlWcFlSZm9qZWFObHdaSndXNUVnaHJCL1FnZ0ZIR1VEVmwxUGxL?=
 =?utf-8?B?cEc4SnhjcXdtdXQrbXR5aFRyRm1abVdudlBYR3FLcGQvZWVXdm5yME1WTmdu?=
 =?utf-8?B?VUlrTTNqenVKbXFTYS9FOVFkTnF5aFlJczBTYkloT2dTZnFnR0pOY1NMdTFL?=
 =?utf-8?B?RHpTeHY2SThEZUpZSlpPWE56MkpFOG1mK0J1bjVsMU9EdG9ZZlRZTmxPV1hW?=
 =?utf-8?B?dTFEYVBEWGdtMklWdUw4eVNaR3B3bDVnTmJTUUgyL1ZuV29MWmxoZVJTbVk4?=
 =?utf-8?Q?Za8NFHuo9cRl9JFgLM1E1ixJoK1S0B9E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0pYZ21rK1A1b3JWN2tYK29mbTAzYjZ5bHkwdVpoWkFEYWUrbjNYdi9aZ0hy?=
 =?utf-8?B?UkNJNWIyeHRSUS9jTWN3LzRaQyt0Vkx6SjFJN0N3Y2JXdzNNeEpkbThpMVVk?=
 =?utf-8?B?ajE0aHpBYThQaHBNWDBFcnhPUy8zZlRLeURKbGMxZ1BUVDJCclArb1MyOXNX?=
 =?utf-8?B?azZLc09salFEaEZoaTZ1UkNrajlIaEFjV3ZZRUZyemlLdzhnOE5aQi8yTkx0?=
 =?utf-8?B?UzIzRXVDazdBVnNvbG1uSXkveC9jMnRDQW5TY1BOeW1jVlpiK2hEZlNuMWxy?=
 =?utf-8?B?WStqd0IrWXVkbzgyS1NQdVZvU1c0dC9VR3BKWS9iaUJRaU8yckpLQUppeStT?=
 =?utf-8?B?V0h6MzdQdHRZUmI4Q0xkakJhRWVxUnpNem9iWVZFdU9GOVlRT2hTZFJZaWFr?=
 =?utf-8?B?V0VpMmR4SUFQb2FzWHpOS1U4K1lPQ0RQWm4yTElwbGc2KzBMbU5VVC9BSzBP?=
 =?utf-8?B?R21QeFV1S21WSVFWUS9xTE1UdkkvbnllOEsxdXlyTTRGcG9OZGlXcCtJQjZG?=
 =?utf-8?B?OGp5OFh4VFFCZ3gyb0JqMDVWMzRrNk9XSk16U0NFZTIvV3ZJUkpvMk1WUUZr?=
 =?utf-8?B?dEYxbTVBRk4vV1I0SXhTODJlZjJtTXFpRldQWTN3ODdWT3VoN2JtaytsSGVn?=
 =?utf-8?B?YzFXbmFSQTQrUTlQaW1YcnBkT0w3OVpqVUoyRVJnUXZDbXh2UnNuelRKK2NJ?=
 =?utf-8?B?dTRUYzNhSTkyZFk0QnU4ZFpRaWFHVWJ6N1h1NFZydGgzNWhHUHFuQmttbGY2?=
 =?utf-8?B?dzFwNytyakVNbXFYVHRQSExTK2svVVFQZW8vUnJVV3NTeWdvOFFRaHluRVRF?=
 =?utf-8?B?dHEvcHB2UGJSY2JpOHJTeDM2a1RQZVpWUjFENWRsSXBrUW5ETUpqcE9DS1FP?=
 =?utf-8?B?K1lCdU5XNTdSTXhxUERmb0p5Tm5uMDZVUCtRbjVTV0dkSFpRb0o5ZUIrWjg2?=
 =?utf-8?B?VGFRTjZCY1BIb3ZOYWJacVBrMXdKU2R2YTBiazJTNnUxWEc1cm0raEloY1Ro?=
 =?utf-8?B?OFFaaTg3anlOWEJZekRYU0JVTXNZUzJGQnUxNngyQVRHNjNzMklpUFIrQmZu?=
 =?utf-8?B?d1NSam5PbkZwdUhrekpXYXdNb0dKbHdZUjZMZFA4OHN6VlgvKzVrS3AxRGlm?=
 =?utf-8?B?TlhNM0tUeHgzbDRYdi9ud1BsVVdmQjg3MktmWlpKckhUSldSdlpmUUtjZXRj?=
 =?utf-8?B?OGFDVmJIbWVWczQydWVhQUUxS1luOWtkU2JaNEM3QVJOSG1nYkJhVDRxSjc5?=
 =?utf-8?B?Mjd1alArd2lmaWI3cEZNR3doSWpuTVg0aURIWXJCaGszQ1NUSEpoWkR0YmlT?=
 =?utf-8?B?dUNFOGozenZ4K0NPbkFQQ0hjbHlBZGl6dWVFYmV3RWo2NFJBaGtUUFlHVVNn?=
 =?utf-8?B?YTNXWXJoVkhmZnBKZzlnYUJiWVhkS3AzWDN6UVltdjB3eHdyYXk5ekFuRS84?=
 =?utf-8?B?Yms1MVdOR3dFQno2dU0yNHZLQXNFdnAxUUFteVBSMU44QU9URjdTWVpJbWk1?=
 =?utf-8?B?cWZSZUNOazhBY3ArTkFxaVc0NVJ6VDlhS1hENW11YzhMVUpXWlJwdmhaQzRC?=
 =?utf-8?B?WVFLbGZ5N3NMRkM0VmZ1eHZtSHo0MWd4YWVoQS8zMjdoS2VaRHcxZnc1VW4x?=
 =?utf-8?B?MERJNXg2Z3JVZ1Q3elgvQk1IYjVRcncrWElNMGhGcFJhWW5paEpjK3BzM1hT?=
 =?utf-8?B?N2grclAwczlQSkN6Y3UxUUg3T1BMMFRuTnE1d3ByNS9vZGpadk9COExzL1pm?=
 =?utf-8?B?UTRiV1pqRHVxeU8vQ25lbFh4QVN1ZzdOWklsbHo5UzdiaEhvNitJS2pMcmFk?=
 =?utf-8?B?R1JUM08xMFk5dG42ZjZibk53cHBybzZPMStxbnNJK1FTbXgrRzIvVzV3TEpj?=
 =?utf-8?B?aEU0dUhrWU8zTWRVelp3cHo4cWxhRUdMaUp3QjZrandkR2IyMWNqMm1JRytG?=
 =?utf-8?B?RWhocEgva29FOWxvZU9HTk9PQkowOXZxTVdGMFkyRXNzNzJtNlIxOGozZUgr?=
 =?utf-8?B?aG5HeWUzelE5YktabjFrYW83TXUyQkxkWGJqaGFrTnVDMTFqSDNJRTlMbk9x?=
 =?utf-8?B?K2kvVWt3S3cycjZsOFFLYWRNRjJtZlpUd2NjdnlJbDRZamx2UWkzOXBSOWxG?=
 =?utf-8?B?N0xWZ0pjTW8wRDJQNW90OS81QXR5WEZGcHVMZ2FkMzBjRVpyendkQmlNMHEx?=
 =?utf-8?B?akMvOHRaU255bU9tVURFRGUrZ1ozdk5ZRHJGT1pGKzYrUWdMK1dpS0gyNno5?=
 =?utf-8?B?c2pMcGY2TGtQUTlSWHViTUp0YXVzL1cyVThFMHlXVmNtUjFaUWdZQVJJdVlv?=
 =?utf-8?B?aWlpV052cnJlUXVKOG5RZXFKcStBTWhBODhRd0RWKzRoUzNRRUtuQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db0b84f-6f2f-4822-db3d-08de48b8f358
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 22:07:12.8977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sKSWBL09et3o43Efzm7V6lA/TZI6Rg89aG5kIh2CL1S8oXiiG4yDaLPtyFb1jyaGQHgMeOOKlRjWvhIqiFHuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF80B25317E

On 12/17/25 7:29 PM, Timur Tabi wrote:
> A few Falcon methods are actually GPU-specific, so move them
> into the HAL.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs           | 45 ++---------------------
>  drivers/gpu/nova-core/falcon/hal.rs       | 10 +++++
>  drivers/gpu/nova-core/falcon/hal/ga102.rs | 43 ++++++++++++++++++++++
>  3 files changed, 56 insertions(+), 42 deletions(-)


Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard

> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index 44a1a531a361..6b54c0ca458a 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -13,7 +13,6 @@
>      prelude::*,
>      sync::aref::ARef,
>      time::{
> -        delay::fsleep,
>          Delta, //
>      },
>  };
> @@ -394,48 +393,11 @@ pub(crate) fn dma_reset(&self, bar: &Bar0) {
>          regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
>      }
>  
> -    /// Wait for memory scrubbing to complete.
> -    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
> -        // TIMEOUT: memory scrubbing should complete in less than 20ms.
> -        read_poll_timeout(
> -            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
> -            |r| r.mem_scrubbing_done(),
> -            Delta::ZERO,
> -            Delta::from_millis(20),
> -        )
> -        .map(|_| ())
> -    }
> -
> -    /// Reset the falcon engine.
> -    fn reset_eng(&self, bar: &Bar0) -> Result {
> -        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
> -
> -        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
> -        // RESET_READY so a non-failing timeout is used.
> -        let _ = read_poll_timeout(
> -            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
> -            |r| r.reset_ready(),
> -            Delta::ZERO,
> -            Delta::from_micros(150),
> -        );
> -
> -        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
> -
> -        // TIMEOUT: falcon engine should not take more than 10us to reset.
> -        fsleep(Delta::from_micros(10));
> -
> -        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
> -
> -        self.reset_wait_mem_scrubbing(bar)?;
> -
> -        Ok(())
> -    }
> -
>      /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
>      pub(crate) fn reset(&self, bar: &Bar0) -> Result {
> -        self.reset_eng(bar)?;
> +        self.hal.reset_eng(bar)?;
>          self.hal.select_core(self, bar)?;
> -        self.reset_wait_mem_scrubbing(bar)?;
> +        self.hal.reset_wait_mem_scrubbing(bar)?;
>  
>          regs::NV_PFALCON_FALCON_RM::default()
>              .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
> @@ -665,8 +627,7 @@ pub(crate) fn signature_reg_fuse_version(
>      ///
>      /// Returns `true` if the RISC-V core is active, `false` otherwise.
>      pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
> -        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
> -        cpuctl.active_stat()
> +        self.hal.is_riscv_active(bar)
>      }
>  
>      /// Write the application version to the OS register.
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
> index 8dc56a28ad65..c77a1568ea96 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -37,6 +37,16 @@ fn signature_reg_fuse_version(
>  
>      /// Program the boot ROM registers prior to starting a secure firmware.
>      fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result;
> +
> +    /// Check if the RISC-V core is active.
> +    /// Returns `true` if the RISC-V core is active, `false` otherwise.
> +    fn is_riscv_active(&self, bar: &Bar0) -> bool;
> +
> +    /// Wait for memory scrubbing to complete.
> +    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result;
> +
> +    /// Reset the falcon engine.
> +    fn reset_eng(&self, bar: &Bar0) -> Result;
>  }
>  
>  /// Returns a boxed falcon HAL adequate for `chipset`.
> diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
> index 69a7a95cac16..232d51a4921f 100644
> --- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
> +++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
> @@ -6,6 +6,7 @@
>      device,
>      io::poll::read_poll_timeout,
>      prelude::*,
> +    time::delay::fsleep,
>      time::Delta, //
>  };
>  
> @@ -117,4 +118,46 @@ fn signature_reg_fuse_version(
>      fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result {
>          program_brom_ga102::<E>(bar, params)
>      }
> +
> +    fn is_riscv_active(&self, bar: &Bar0) -> bool {
> +        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
> +        cpuctl.active_stat()
> +    }
> +
> +    /// Wait for memory scrubbing to complete.
> +    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
> +        // TIMEOUT: memory scrubbing should complete in less than 20ms.
> +        read_poll_timeout(
> +            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
> +            |r| r.mem_scrubbing_done(),
> +            Delta::ZERO,
> +            Delta::from_millis(20),
> +        )
> +        .map(|_| ())
> +    }
> +
> +    /// Reset the falcon engine.
> +    fn reset_eng(&self, bar: &Bar0) -> Result {
> +        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
> +
> +        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
> +        // RESET_READY so a non-failing timeout is used.
> +        let _ = read_poll_timeout(
> +            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
> +            |r| r.reset_ready(),
> +            Delta::ZERO,
> +            Delta::from_micros(150),
> +        );
> +
> +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
> +
> +        // TIMEOUT: falcon engine should not take more than 10us to reset.
> +        fsleep(Delta::from_micros(10));
> +
> +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
> +
> +        self.reset_wait_mem_scrubbing(bar)?;
> +
> +        Ok(())
> +    }
>  }


