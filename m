Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022091.outbound.protection.outlook.com [52.101.101.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AA83E92B4
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776272124; cv=fail; b=qM1EZ54SStcodUp3nNEosLemf7412s/yOqjWjALDvlRM9vcvf5cZjwQASLMowq7At8GfAj2CDCMrRIF6XGDa+GjUhfQsvnS3GiI/6yKP3U9rNv2aLuJJ6zjLPuMjHiBnTs0f5xHTVdte9At1JbuH2Ul9c7dS/yRGBpEfA+qDcsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776272124; c=relaxed/simple;
	bh=aPl1oodUbGi8YoStMUhUd0l/ouXBV/7j5xZsoXiP4k0=;
	h=Content-Type:Date:Message-Id:To:Subject:From:References:
	 In-Reply-To:MIME-Version; b=ufvhqN4gqyiDOfe6viciNqdclw8BToQFF2MHV+Lx3S1DNVwkGWAY2qZVUEC12NpWYC2KrBBHjnNp9ulnXnUjzjbqfVMWKnUk5cQpuNS60uh70bSVd8B8muLPtLOfjrGRUpc+f4LnAc8pGtOHvcLppHRtJPSIHq0Kffz1fF6V9zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=AVoSK0oY; arc=fail smtp.client-ip=52.101.101.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="AVoSK0oY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3HOx3CPk908a+bIuxarI9eZ7/axahG2TFhT9UYwGWk7jdGjtGK6ea55UyyKRbW+g75g1o9XwE1SuO8VooTEE2hEXnOTTcB1W0uxKS9r0lPZn+k0FD8THObxpVkh/f3DswDz+NaO7vn8md6oWcyPtbfKeiWwXjgHoTf7xMqXWweEmD8/MM/U8tT3+NgEIjJV8tQ/C8unUgQ8sSb1jPCEVSGw9fY8B5OvYFsLetttpMhpqnRH1o+4R9XFvM2//g0KxI1nuxgc1GL4hqA1CHlC6CZQmbE/36Qm0+1327As3eWeMDz+0m3HqUpNpZHqAyi05KQquMpX0YkmrU6lS+SXJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPl1oodUbGi8YoStMUhUd0l/ouXBV/7j5xZsoXiP4k0=;
 b=NuI61J0tml/SWFCuteNRQEajyKTvBZnanLvQ7Lyj4e26zzDoHhEfpF5WpOXg9OziMYy6VE0piau1PtMLd1TBs17DSDhBcvWdaBOLbdWJPinSqmUqa+lFb4iKDCJxHV8TVPjLxm2JRvNhng685bOZM9XuOi1YBT+uXcNGRlvVjMonZn4gGzbrT85r8Vo8lkOfDriA1Kqz5StGxl5Ydbx9Q2/gHES9WAlqxEgK2F3AMFWTEHxMKzteztoyho/aoDHEwFOymoS8CeXtb3VaLXT5WRIVi/wdbq+zpDdE/i9kRhcJC3UoSZNFfgoQqqd0nsiw0kR7bxLRc7GKtaSib999nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPl1oodUbGi8YoStMUhUd0l/ouXBV/7j5xZsoXiP4k0=;
 b=AVoSK0oYDXtFQtPIVbVhF9SU4FRw2KzrJO/kUdnuCEb+Po66TGDWL5z/dlN54ZItuiR3+S5pL31nBboJhrLV19N8L2QUpcnxD1jYFwAaBrrPh1ML3hY7mN42RRDfvhTyT8i/+FBtcAiV1vxOXzI3xjX423GKL/3UHaYnaYEPah4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB3485.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 16:55:20 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 16:55:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 17:55:19 +0100
Message-Id: <DHTVWYLLMFFM.286A2CN2A13S0@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] gpu: nova-core: use correct fwsignature for
 GA100
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-2-ttabi@nvidia.com>
 <DHTRVSYVZKQ4.O3G9J0M423B4@garyguo.net>
 <fa185d19ea0e43a55a32af1e76fc1a29534a264a.camel@nvidia.com>
In-Reply-To: <fa185d19ea0e43a55a32af1e76fc1a29534a264a.camel@nvidia.com>
X-ClientProxiedBy: LO2P265CA0348.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::24) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB3485:EE_
X-MS-Office365-Filtering-Correlation-Id: 38bf1e86-795e-4eff-9960-08de9b0fc717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	peSYQBsBt/9Ggq6z3NJm+tVWRsh8Y57zm5GiOVpSqCANWQ8h/TZxJrxFNbFNOm1KfnfvkoePj6HiAYijOmFcy1VSv6uMM/P6FkbPiwDNMtk3Rytiso2zcIlsZE9agCIEbhDMUrZ2mZKo2gKrOSOyI2yksVM6kUiE1agYZgRjkbmgUKc9JCjGB7wRtd96rbpe9G0eJFROm4XoXGr4mSdMGuG904jW9HvhLYDaWdgZbCzoDUL9RpgT0sQDrQIPfUAjPOAq4tsUPI7QdGYKl2oznhowrO1igGrLS//+gzPth3bBrlnP/VxnurdhtLriI7C0yKTrFp8ykByWaxVkOkE7h88FiDl837BdTIpBTnV9Y0ze1fslxOXKMWs4pPLr3RE5/GNr9RfE3ySDXfu/UPRz/QS6nJsIpB3msFICX0UsGg3YhN0PipdLSTKREdYYywxDfMPkQwmgGdCdSfOVTZVsnKcPMEOvH95S9I8xWghRsMaqnpAX9x+Xbd7Os82IhBbmt/34vsdIKlQx4oXsr/kRfmcz+oggLvkAA72KunGL1oozrPSetB8LpbB05u2o3YWRMTtneurSFpQdWUU6De9O3nevSHlRefbzfUm1StYthEVKqVnkt51gwpwRjBYFWHQ5zJoA0dQx6XQsj4X0OHiz/y7KzyLG99PRC4vWL6LYHlgjAEd2w8/8f9o9x5p/bGpwV8wwv+LsgBCaCmFziSuUeo6RiiRi1uZcB/Qtef8lfrQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHB3RTNIdHpERGxaK25mNDhKNzd0THNZT2p0R05icWk1em9hWDBtdTdSbVJj?=
 =?utf-8?B?cnFtOXArNVJ1TVZJbFhkVDV0MEpOTVZLNERvLzE4Q2NVT0lPQ1AyUlcxTjRJ?=
 =?utf-8?B?ZUxNNFdXTmF1amdGRkFVY21GUTZneEprQXpNS0s5WjJ0ZGFsT0hkTER3OEpY?=
 =?utf-8?B?NWpXMW5GNXZRWHpnNGZqTjhvb3ZrYVAzN0JxOVJFazhPNlZzYVFUblFKWmp3?=
 =?utf-8?B?OW12UGtQRHR6VDkwSVlreFY3RTFqRXRYUDJsUFV4Y0xPRG96ODEwQk5kNFR4?=
 =?utf-8?B?bjk4NTZQTU1yR1RxVCtJV1FOdnlqeW1yMzVJc0drYlppVU5iS1ZxYVJXTUdm?=
 =?utf-8?B?Wmt5ZzRzQk5JSzdPSkZUZzY4ekVoZkNuYU02TElHcld2REFmRWRmL1hydkFS?=
 =?utf-8?B?OXV0bGFxMWxvWGJpb3R0NmE1NFVHcFpXYXNxdWk5VGYwRlkwY2I1YUwwcVYx?=
 =?utf-8?B?YUFuRjN2TXZnejVqeFYxdzJsRVMwTm43YVlWejFTaTY2TGtqTVl1TEZuR3FQ?=
 =?utf-8?B?b1JXcWVqMGl3Zm93STllMHQxTFJDVGZpRVF4MmxPSDVnZWUrWnNCYVlIUTdw?=
 =?utf-8?B?QmJPby9RYVRDOWV0ZkppSHl0em44M1FROUk5cmp2aHc5dThma0EzeEt2ZVdT?=
 =?utf-8?B?UHU2cGVMazVBbk1zM0dZbW1aUWFSeGt3MUlvd2ZlSmNDYjByWVBRaFJUOVpP?=
 =?utf-8?B?RnBNZUtnMEtQdUxJbVRDVk1zTUNiMHlJS3hxUWswR0REQjFGbGdlSUhkcHR0?=
 =?utf-8?B?c2tvZ0ZhL0lvUTE2b3o5T2hRWERDS2R1Wm9yVDNVWG1VZ2YweE9pK25USEVj?=
 =?utf-8?B?OW0yR3ZNSDhibGZKOWVuTFJCek9ibzNRUkVXelRVZWkzSS9oTmRTWDF6cVJo?=
 =?utf-8?B?SFVEakdseU52aEg1ZVo3enh4Vm8wMEJBU29rS3p6dmpWSVRyUlhBbzJDRXpp?=
 =?utf-8?B?a0kxL1BMNTNPNmNpNkNZTTNIZHNHZ0U1NUZiSm13K0NpOEFNL2sycm5iZDJN?=
 =?utf-8?B?L2FNWnNqY3BLZmZkQnl6NFUxaGY5eVdJK1NWQzZDMFROQjRXL0dhZGJBU1Nj?=
 =?utf-8?B?b1dVOXlQRHVuNWorVkxmcXhYMFVQVHZRdGFqVS9EempTMGlzb2FUZFZiUGZH?=
 =?utf-8?B?SEpxRHhZR003RjRoS3dIOEtzeGlZMjRqT1RtUmZKRU9aTUhLdDJZNTNFSEZG?=
 =?utf-8?B?cTJ2TDBYNUFvRGJld1FIWURoYWFMNnRsWUNrSFVSM2QzQVZIWVBaTTZPOUN3?=
 =?utf-8?B?Sk9KdkNvTUY3NklYVEhxejl4MnZKK0hQNVdtejh0TzlwVUI0bUkxRzk4QTE0?=
 =?utf-8?B?aXNTbEdGQ3FIQ2dIOGFJS0ZzSFowV2VJa3BrQmFVVzQvUWtSaUJ1SjhKVHNS?=
 =?utf-8?B?R0hvZWZTd3Zlc0FQOW4xUVF0bTF2OVhCRnd3RHZGS0F2SnQ4RklNWUlNcHpH?=
 =?utf-8?B?U0NVL0YvNk1ROXRHblJuSytnZWRQZm15YlpLdXFsRFVXVlV0UmpCYm94L0Qy?=
 =?utf-8?B?NmhIdXVxRmh6emYvWGV4dGxKeW5BVjZXZnZGc0w4Y0JUK2hZK2lMSGhRM1BZ?=
 =?utf-8?B?VVRVdTBDQ0hzTDRLSjRvOTYzcWZIOVRHdDduaHRKMWs0dkx2cU9VdzFWQm4v?=
 =?utf-8?B?UmZqUEU1SXllSmJmalB4M1RHcThnV1BXSHloU1ZDNWFRN21wMFRpRHRFYXFL?=
 =?utf-8?B?ZmQ1RVZCS1NUQm54eW41VEhveVZQVU1yNjhxemo2RWRoY0pGYzh0eVAvKzFN?=
 =?utf-8?B?SWZ1Mjh5WlRvMzhGM09ZRFdlTGREeW9YZXBSWTJWdUwzNlVVL3ZFUFhOMU9T?=
 =?utf-8?B?N0NLRE8xa1I3VEJZdDUyRFU3SGlXWm1MVXFvdzd1bWFNaUJsaVF4Zm84UVVL?=
 =?utf-8?B?NE8xaG03YTVKSkJOY3RuSnZGTXV6aGJNKzBxUDg3MlFkY3FpNVQ4ZEE1MHJZ?=
 =?utf-8?B?VkcwMUVvMVB4cHYxTytITWZJYXkrUTlyY29lTzBURHByUFBhSjlQVVhOdTA3?=
 =?utf-8?B?NmFwNHE0YlJwVm15Q3dJbm8zRkhPaUVWeG1MZlpHSW5Ec3ZGelR6UkhkZEta?=
 =?utf-8?B?M3Q1R3FNaTFZckJ5K0VzVDVkcnhyNldRK0ptQ0wwdnJ3ZEFhdk5acExzU2xo?=
 =?utf-8?B?YmR1aW44OEFLNFJwSVBldW9EcXByWHN0Q29DR0xmYTgrSnJpSFpBdTBjV1Qy?=
 =?utf-8?B?L2FRbHJuaCs0dmN1ZHUxSjVCVnBNR0l2OHF4WUx2MGhLaE9EejZRRndBaVFF?=
 =?utf-8?B?b01RZEFuQkkxL1RPNXJRcHJBTE9Zd1pydWlucy9lY1VHaWlRWWVzSzhUaWZt?=
 =?utf-8?B?ajEvWUh6UnZtWi9oY010MEdlb0JmenN2TlozSlpLQlhIcGFNSmkxdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bf1e86-795e-4eff-9960-08de9b0fc717
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:55:20.1071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q03nQNVLtnwToyNtUxleuBu4E824yZxbyncQ9ff1oVV+ifc+no0ICFkaBeFpQQ0WK7qWy9vgMdanwzI33Mi0wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3485

On Wed Apr 15, 2026 at 5:45 PM BST, Timur Tabi wrote:
> On Wed, 2026-04-15 at 14:45 +0100, Gary Guo wrote:
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Architecture::Turing =3D> ".fwsignature_tu10x",
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 // GA100 uses the same firmware as Turing
>>=20
>> This comment should be removed.
>
> This is relevant because GA102 does not, even though both GA100 and GA102=
 are Amperes.
>
> I could word it better, but it's an important factoid.

It's an important factoid, but it's not relevant here for fwsignature, righ=
t?
It doesn't use `fwsignature_tu...` so the factoid does not belong here.

Best,
Gary
