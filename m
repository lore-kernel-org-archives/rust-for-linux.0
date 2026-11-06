Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962869;
	b=yoftcsOexwdZCrzm+MmF+6bUjq6yUBQmNuVDIuoLvh7w3KAV8zF+eCrmxUjT3hbe8Grh
	 7qsuUUpwjirNHzQOnqXDY/Ouruo44iL4DJ3foc02c+4aWJiuRB1GDkymZd/380C4tysk+
	 iN47aGWC2isE0/OZ8UA9p9iC0aHl72vHgpQ1sTzpdeuXeV2yN4Y69+A+jQnSMPtY6NSgR
	 3YqT91ILDouK/1pvV5RSqJXV/DSYzjC6dixYwLY8heVL+vfWat/sRMq2IflV7GAFtsGFw
	 t3IOwOQ5yTSIiZHPGI3Uw3fT1VAhkyuinBrn8YuL2DqFwRb2uBa8WICOY/53zTnpu/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962869;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rPcVz2OhvGzAVPw4VtXhvXs4pdk5k0i52VDeAfxIkaA=;
	b=5nnnlDgD4+LLfb1DjBqlMuxxq7TqkZGrxwErTjlfq4WIHzil5hVOgVjOHV6fJieZ+Cmr
	 zNfrsbsT05XEhdqcYPRFwGIqFHdLpXz8BT4ov9ihjcQalw6d7tZpL7qdWTMxf9cH6Q1PC
	 K3+lmbFA2MHfJe3lSAcV0jg5PyOlHctoBmFwQfNtY4uN9LZSHdUzgjbY9QP9Przqae5Y0
	 P8lzm0/ERVxIn2joi7yzf0NboCcZ2priyj+GxO+PQkhNM7qCgZ2LTHNYoyGWVyT/zj0M1
	 APqJXBHo+JJxog0g5mFQinfGX+v6NeRJRf0PVL+WjMh86aKJExDvC4BbdUBlR46/RKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bEZ6AKNC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.8
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC9A606A326;
	Fri,  6 Nov 2026 11:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC9A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bEZ6AKNC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQ+Nv5tX8tDCHZkyz7DaOfp+dBZEIDoqD78TBFp3ItF8+ipX5E7IekNwwE1aVdq9ve3Ehkb9WHXVrfV0njDfaM8SzYDpOnSgKURFeXS+gUl+cZQ/HPe5k0+kAv//Lsib61zZ1opTy74UINLJEaYGNW1wiiUk79wA0tECiWx3wxz70BXIGNIbOyxQjChExY8dT+m7ya7Lod5rf0utv7aFHSJlRhk7DDNzx2tPW3MJpagKsYzDD057XviDEF2UHUbo4ZU/JLTAq3Mbg9bWVBi4/dmj9QImhkkPGD+wLX7q84U7aBnjzn5vH3GljAATAo8PCxw4lv3psJFZ+u6mKcwJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPcVz2OhvGzAVPw4VtXhvXs4pdk5k0i52VDeAfxIkaA=;
 b=wvR8zoDPf3VvTCAqW6gkrOAzoGwMX/EOfA4jT8aHdOw3NBGHsL8IpKnFmYsdbmot1hIzaO4VQMBJc4dU6GFNsClrpl4nygjVrQaXGdolYY02TJj1TaoGCoMgKawwKVEeS81W8HpQOgAyp4ivB7Bp+AuoiXf1/dx+wkca5SKnc5Ci/7tcuApeXRguL5c2zm9SQYxQEhr46SXfxa98D+lcuPWdfatYoym5Ce3A/5e/yp8jgFQWark44z+i9EZTcAlJXdbQmrfgVfDrSX2rRtaAHamx8vSrfxw0y4wtd5ThR1qOyHp7nGf/pYeSZAr+EjauBj+oSsnJ0ql+VFfxGUIKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPcVz2OhvGzAVPw4VtXhvXs4pdk5k0i52VDeAfxIkaA=;
 b=bEZ6AKNCvmt+fdrfNXsTWYxFry6retSf0Glvgs0PdzthhQeiuaY8Dyifzmrc/V7fMpzCCAHSCBoPYGot91ztRuM11H/7z+eJjygxu457zZr61XkYdPesKvyguIsEKYahhWNrqFgeE3XW7t/xWPSqM4cEXVRWMxcmSR2kjeDb52+d6WrP6crI2W5zlxAIedujovlrWcRI7h0szxTyWpb6t5/Gw5bzVzuVgN76KDQ17hweVDw3IUT+j4Rmhwgq1XfbmIdWzQd0vUJzUpgJ2WLJANrvT2mmtCFml/IhBQ3w6e/3d93kU7Sh+j01N2JBD/sUiDabQ03GoDwXvNxlh5B7xw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB5792.namprd12.prod.outlook.com (2603:10b6:8:77::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 10:57:03 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 10:57:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 19:57:00 +0900
Message-Id: <DMO2OAFX8PB7.3ECEC1L3JIDMN@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] gpu: nova-core: place the generic bootloader at the
 top of IMEM
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
 <20261103-r000-fw-v1-2-e3d38fc130e3@nvidia.com>
 <DMNAN7KX22SC.QQ5HURCU332A@nvidia.com>
In-Reply-To: <DMNAN7KX22SC.QQ5HURCU332A@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0162.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::20) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: f785acc0-af70-472f-bce2-08df3bf4b099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|10070799003|376014|18002099003|22082099003|10067099003|4143699003|11063799006|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022115727099003|261021121427099003|261021135927099003|261022075727099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	o5n0MTk+Y1utqzTeQxaEZjLls61M1NZ2fnDD6ZMKMh3eSwwdHmjJ8IKmUE0bQqZozcbnrn2tl+NU6TRKWd/1jXpemY3Bx3Pq8SfzYUz3Blu8nT9SF/GChOFafBmbXok71ReZMDwTfasdUl0kPqO0bLS26/TViKmlJtN7WPjJpk7g+21Ai/qitRFkCKOdD2oAqupM9xpuyWiWwgQByjjfsxZlEcuHqhAONjM7iXpH5rAFbu3WTfS2UZq5/zWibYYVDgvwhOXcRumKBR1RPAeLNau36vH+gRpg5x6EPhPUz8L8/heBqhE4y0wUMMGFf/OP5dCmGZdfXSNnIpX6lSed9nZgdfCWTvsi+Bo0+7VAt0d8jDKwTS5whwRiC1KI1eg9guWUdGzkJyRAT8gYQiZBlskKcMA6zh4Hrcdq+HACc+ZtQ9vT+6U1Yw0AhTg4OcsB5SfHZC7C4NtjhnUhdE0nM1n6d3b+qbz4vl9QhJUmo91y4LGgfMqtYUpQNYomphG3BUQUgL9Ga4ILD9jy7ngDCkadzNQ37keMLLhtPDVaSUpVGuSZPdUd6psJfnVwT98RaXlhHpowxuYfg1EV866dtVjKh2352DA3bu0rlRGMQAU8xcY0nD/xmVy1d1LNSHnfH3h9qvPUbIMOuKTf+zi8XPlNHRu9UokLn9M80UYKtBE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(376014)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022115727099003)(261021121427099003)(261021135927099003)(261022075727099003)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2pRamx5QjNNeGZnWUpwamZNUVArU1NXWFBvY1I1Um9xcjZXQk9GL0VGZ2h5?=
 =?utf-8?B?NVRGZE5sb2JHS0RqcHZ3Ym1taXZWTHg0Rkc4NlIrWGhDQmlwSktrcEEyOFlD?=
 =?utf-8?B?aEFpZXJMeFVYbTdacmtHdTA3aXBLTzFQZFd5TUVEQTRCRU4wQTNlWmFROElw?=
 =?utf-8?B?QU5WcEs3aDVxSDNqNWZPQXlUbTdLa0R2RVN0bHQrR0lVYjUvOE5VM0Y2blIr?=
 =?utf-8?B?WnREZU1VL3pFQVp1U1dxd3BCMVJXWU90TXZ1QVRwamo1QkU4ZWpvd1BzTzY2?=
 =?utf-8?B?SFNRU3Z4Y3VwbEFudVQ3VG96R1JLWXlCVW9pT3RMTnFTb0R3allJT2RRQmJY?=
 =?utf-8?B?bEc3eFlpblREMGlyRmlmV2tDR1FnU2VXYyt0NGhHM01iNVQrM0wzRFJPNjBQ?=
 =?utf-8?B?c0ZNZHBsRG9YeTd0YWgzWXI2cGZCcXpCY2NFY3h4dkt1TS9wV2taWk5YT2sy?=
 =?utf-8?B?MVgxTzFLY3VNZDB6akhhQ25WbXBwcGJKZ2tPSGVLWnlpQkx6NlFlcSs1bUds?=
 =?utf-8?B?WmJ2Tk1yRm9PSzhDY1ppZCtQeHJiblVRdFZJZ0pxaklsTlAzTFVrSnRWK1lo?=
 =?utf-8?B?RVhuZW9iVVY2ZERneVNLd0lsZEdPNVdicDAraTd6US8zRCtHNTdHY2hrTXNO?=
 =?utf-8?B?U1cyNGYyYU1TL2N5VE4rcE9xekFWTnBITGgzNjZOVnU5dWFrelJ4K2RiRXlj?=
 =?utf-8?B?TW5EdkZ5RkpzallySlg4ZWZ0NVRuYWppMVpYY0NyV3ZYZk00TE5mSXhpajdo?=
 =?utf-8?B?NHFHazI4aUd0RW9jNXpLWHNzdkJXdGRDOEt6MmNkUUtCeWtnYnF2Vm9QdFBV?=
 =?utf-8?B?aFQ1WTluZXgzODh0Y2tTdWpmdFVkME5IanJVT2ZLUy9FRFNrMlJqWFZhT1px?=
 =?utf-8?B?Q2xVM2VUOVBxOXF5VEl3ajN6aWxaaUFvcGVaZUpTVnI2dWRQKzhYZmhWUW5w?=
 =?utf-8?B?SDBpd0RvcWs3c2w3UGJpZXNTaGlJYjVtVXd1bjlXU3IvY3lsYTRBU1ZmK2h3?=
 =?utf-8?B?dUNiajZNSWdSdllXRENxKzVFMXQ1KzQ1SzR0Z3c1aGo0RUtJWklSZE1TMzgz?=
 =?utf-8?B?VnVYbkxrMCt4eEVPdUh0aDhMOFBLRWxFcjVTWXpyMXFTZ2R0bUlsdUwvVUZt?=
 =?utf-8?B?SHUvMGszTGpOZi9UdUJaVmt3eXloa1YyaFZCbU5hcG5NMHRrZW9paUE4UTRv?=
 =?utf-8?B?dWV6WVlWRE5RN20xUU14SUdrMS9qeG5DQ0kyMTdPbmdYZVNZRGRQU1ZiWWFE?=
 =?utf-8?B?S25Fb2hjbE5wNFhIdVQ5WXcvVmFhTUFLcHVzWUFzckM3S0h6Z1RSaWt0UHNZ?=
 =?utf-8?B?UlNkTElBSER5V3JYVERDM1lRVWwxZld5SnkwQ1k2NlY2RDNwUmpySFhHV053?=
 =?utf-8?B?ajYrQXhNOUttVFFCU2hmOHdsOXc4d1J5ZFlDRTFSY3h5NmI4SWdxeE1WOTg4?=
 =?utf-8?B?ZkF0RXVWN2loeVNPeFFDV3lrK3dhSkV5U21WSjM3VXY0dVpPSWt5MXI1T0FV?=
 =?utf-8?B?YjVrYjVIWGVoTDA0RXp2SGtWQ3djUVk1OVBSM0w2RjlzSnRzQk9nQ0JGSElB?=
 =?utf-8?B?a0xsbUk4SDhac3VaVFBkN2hraklFK3pRblhORVdYT25vcXhHTWpYZWdDWHc3?=
 =?utf-8?B?R3gwWHlBMXNWSGhsUG1BL3RtZzlIdkFTeDVpa2h2c2hNaUYwNmtQcm04U1JE?=
 =?utf-8?B?bnhMaXRuU1VJU1I3K2QwMFlVd1JKKyt3aFJ2djFNREhVZ1FSaENibWFSODhI?=
 =?utf-8?B?Vk02OStORXptMW93OThiOE04UGRLSUVQSUdrK3hmTlBPbE1SSG52bnl0MDBr?=
 =?utf-8?B?Y0NlOGc1aEpocUpHLytBMW1jZldyK1k1NGR0K1cvNnNvNzNreWtSdkRIb3BX?=
 =?utf-8?B?QXU0ZmtiaC8yVVdScWVHSnd6Nlc1cm0zK0dSV2JqOEhUdGlDK3haMmdQa0xP?=
 =?utf-8?B?Y1NkWFZWQjhmQUpGd040emw2NjkvSTIrcDlVQUJIUlB2Um42cng1cW5LdDla?=
 =?utf-8?B?d21yVGtWTHVWWElGZE42ZENnQ3BFc3RLcnNCbzgwVVBWejl3Q3Z2RFBzcmVI?=
 =?utf-8?B?c0dTVmsxcGo2Uit6V0JIeC90SkZHNmJZRXBpQWVhLzl6V21XdmpQWmtFQ00y?=
 =?utf-8?B?YnY0ZDRqRUtpak0zQlh0d2kzbDZkVUtXb2hHbTdGaUtQK2hWQ3BWdkpyVEFh?=
 =?utf-8?B?cDFCV2JKWGJBUnBTdlhQdGZTV1hqWW55Y3ZINFQvZWFBKzhIRVlMbm9kcEkr?=
 =?utf-8?B?bzJKWmJBL3RKVjRyaG8vTC8wTDB2MDgvYWVpalpkT0QwUmJaUDJHaFZnODFP?=
 =?utf-8?B?RTRTM3Rsalc0K0ZGOFhRTm9nMXNWYmE1eFN5Rzl5cjhFUGowemNDem9zbjBZ?=
 =?utf-8?Q?jPl/8cZfVL5Y7Gywqvcz19WSM33YIZxJ2Kwq8BeIx8+G9?=
X-MS-Exchange-AntiSpam-MessageData-1: p2b7dEdNyf9i6g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f785acc0-af70-472f-bce2-08df3bf4b099
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:57:03.2993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+kD3muiRsbOOOJG4b1rMq98AM38CdE3c+045Jq2J6mlQZ5/OeWKkkGQcwvFDowYuql7FGhyatB8PlXqNTubpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5792

On Thu Nov 5, 2026 at 9:59 PM JST, Eliot Courtney wrote:
<...>
>> -    pub(crate) fn new(dev: &device::Device<device::Bound>, chipset: Chi=
pset) -> Result<Self> {
>> +    pub(crate) fn new(
>> +        dev: &device::Device<device::Bound>,
>> +        chipset: Chipset,
>> +        falcon: &Falcon<'_, Gsp>,
>> +    ) -> Result<Self> {
>>          let fw =3D request_tlv(dev, chipset, "gen_bootloader")?;
>>          let tlv =3D Tlv::new(fw.data())?;
>>          dev_dbg!(
>> @@ -68,9 +73,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>,=
 chipset: Chipset) -> Resu
>>              ucode
>>          };
>> =20
>> -        // The bootloader's code must be loaded in the area right below=
 the first 64K of IMEM.
>> -        const BOOTLOADER_LOAD_CEILING: usize =3D sizes::SZ_64K;
>> -        let imem_dst_start =3D BOOTLOADER_LOAD_CEILING
>> +        // The top of IMEM, above the blocks that the bootloader loads =
the image into.
>> +        let imem_dst_start =3D falcon
>> +            .imem_size()
>>              .checked_sub(ucode.len())
>>              .ok_or(EOVERFLOW)?;
>
> `imem_size` is 8:0 (so 9 bits), and multiplied by 256. So it can be max
> ~2^17. Then we subtract off ucode.len() and do u16::try_from, so that
> could fail. I don't know if any real hardware actually hits this though.
> This value (`imem_dst_start`) eventually gets written into
> NV_PFALCON_FALCON_IMEMC::offs which is 15:0 in nova. According to openrm
> though, it's 15:0 for turing, and after that it's 23:0. So maybe worth
> checking (then we'd widen `imem_dst_start` etc to u32). I think it
> probably 'just works' fine to switch to u32 and change
> NV_PFALCON_FALCON_IMEMC::offs to 23:0, even for turing, and would be the
> same behaviour as nouveau afaict.

Oh, nice catch. The bootloader only runs on Turing and GA100, and as you
pointed out on Turing `IMEMC::offs` is 16 bits, but on GA100 it will be 24
bits and if GA100 signals more than 64KB of IMEM then this will fail.

Widening the `IMEMC::offs` definition for all GPUs should just work
indeed, so let's do that. On Turing we are basically guaranteed that the
upper 8 bits will never be set. I'll use a `Bounded` to keep things
within the acceptable range as early as possible.
