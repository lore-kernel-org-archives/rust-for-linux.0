Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022105.outbound.protection.outlook.com [52.101.101.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EC619D093;
	Sun, 10 May 2026 15:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778428401; cv=fail; b=RCjkasjGfYm7Y3Thv4IQwIhv3GljyWvzPFrZen5dPo1UFkJqKFj4y9Lk4vNe9+bsaNEMOPnfK2d0L8vejrSnA4esCqEwP459Cw1J8jAA5DBQTrHkpbDq+16c6aQH62/2gxAoY3hsnMawUAEtWAE+RZrnPBCITS23QgoZWkz+zcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778428401; c=relaxed/simple;
	bh=5fAPPjJgN69aVRoIwUaOkT2ECKUTnfClXXkhVlepQJM=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=XwbAanVJG8aWbTctSEsCz/Q2adqjBJFkb0qhps48yk70SNBodUQ0+P8W3Eq/pIvOMaLCnvOUhctTZAk7/1R7miGC4lYrLvVk2s0DkPf1iyRyn1lgCqwovxKCSv/7k4NJrcMF/8RyMAi9NR3Uc/ekt4Twg7s3PlpjcGRTr7hFDj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DEgZht2O; arc=fail smtp.client-ip=52.101.101.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DEgZht2O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktBXYiAtugYKbe1VJXVBODpnkL+leUK0AMcUO0EQehfVmcIoBrlJnAdzxDFqwcyheDI/71yW0xJOD6rJ1Oa7KHb0srP3xCcM8eTcLHnrG5omVp6eSfHShWAiB3eoe1fFkA4k/i+zon8agEBirI9lkLVyaA0v8lFdzMHF9WNDhSD/LieI1QPe+zp6dCrHbWXHtd8d4ld7FDYvQn0LzPmIETZqSi1g6cc+w2+7gQDzY+08w+qtUgZVSlGExmsxTy8DVnHU6uC+LDQ1VVuRbsv1u3OebR+Ty6y7ljEABGyf2Cnbyzil2Mxm+WCQ9XNZ71QDRH5SwIRc0Fix56byfOBKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fAPPjJgN69aVRoIwUaOkT2ECKUTnfClXXkhVlepQJM=;
 b=dRU5dFUg19XxSApFnlX1pwWN2gTTZ1gn9T/yYwwS28XYWmPVTIsUyJ/F5nl+TymAUL5NYpkeW6w/YrIZ7I6RS7nMz0DzGDGV5wiAGzzqiojx+niI+8ZKMDzCpDyp/R6VN9PJp52gIL9pViCuyd6tXD09Q3hPlq0b5+2gj2dtjyEpDIhUZQs8NvI/HretkK16pvloENpYCUtDh39g5l6u5mUtyhfZd+SPZmPhj6mmPqGpkDYdMlX8/ziOaD9pM/eiLghnqWNxttr51FniroLaxlY4v3OWNIKFJ29dvCvDcs1yA5JmcFCoNkriooVqTxChRRUqUCFehZmWZNNLrOmhnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fAPPjJgN69aVRoIwUaOkT2ECKUTnfClXXkhVlepQJM=;
 b=DEgZht2Olonwn4Cl/lZ/2+D/PCl2uLpdi8q3A+Rdslb0q7OcEWVnargNlnh+QI+ZYOEb++cd9Vt7DHM3qYJyj5x94B7spdELxhY+xxhiH2v5SWqrZMBKTJiQr021QFJJhPp0NdtK6PoWESqVxi9Tuf22ARO4dazjzJocDEaEGmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7962.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:212::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:53:16 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9891.021; Sun, 10 May 2026
 15:53:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 10 May 2026 16:53:15 +0100
Message-Id: <DIF492AU2WJF.359GZYTFSWM1I@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Sasha Finkelstein"
 <k@chaosmail.tech>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RFC] Fail the build on RUST=y and RUST_IS_AVAILABLE=n
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260510-evolve-to-crab-v1-1-208df84e67be@chaosmail.tech>
 <CANiq72mHGsatZLLiXAzZnKOmktOutQbC9bs1VexKm8yJ1w_p5A@mail.gmail.com>
In-Reply-To: <CANiq72mHGsatZLLiXAzZnKOmktOutQbC9bs1VexKm8yJ1w_p5A@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0151.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: e3394737-4134-4de3-a9c0-08deaeac3fef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pbl+EDpa1bMOS4gvl11R8ARN7njJf0t0k81R+0/PDKutqwEeuNYtKYwhwjYwFW4twuPyrAHIL/bBZz/oWMgQdQxKAie5+xpSvG149dXX92Dy8H6OTBQtr6wcWBKw54vlRdrYh6Tcv8BvVqro5y1irpiAxsGor3GX/xhmZ3JzWI3It4e4FCAVwBwgc56R5DmWgP11mdZ5ojUXOkVlyb5xSkdzV/XKVzDbpVzOa+jP1gykT35gw6E6aarpRAqIjl1GD84ofiSUvYZsvMhmN1Nmz7yNkVBRYjE7eFuD4ZEz36do330CivDUxJk7p9z1GXFMEz0spEqitrLBj8VH2JOwXSEL2hmgSeJoRl511rHx3Dr69pC/GJUrQpFM5uXVE8GLkpBeHLhIoBCIm/aiLaEvl/KIciecWaU7W5IXE0LspiQNbW7DAjaPjrGzrg411S10FD4sMAom/vuGKH1F0k87ziTLMg6xqFgdjYSg+AF08qHndRb0gbLLvYLwoj4KbmHOdbvwmqty/u59vwwAXLPuRYLDxOxNe4tAsfSISxMJNBnorj+HA3JFbts30EJAjxUYPL6obR8F7++BF9U1VDziqlseKwLBOuqx/O+etFcEYc+TRnzo/NmOJo5mcwuDB9LeU2yePTuirhJTj4jMGPVc/j9KIv7TbvUenvw5Ibds9EbRGJY1Jg24iLHHIQp+kKwO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEVJNXlVdlhFd1NyTyt0NmhTYytRNXhteGd4NjJNWHBkWDlqLzRYSEQ2VW5O?=
 =?utf-8?B?bzExelpmMmRQRUg5WGhHTDB4alYwenlBN2pmM3hDZnYwNGZuSFRvTHNkZFNa?=
 =?utf-8?B?TnQ0bDVCbWFHWC94cVpqRm5NWWJGWGlDZlJNSW9CYzRycUEzZGM2NE1PRng2?=
 =?utf-8?B?cG1rT0VSVGNQamxrbys5eGU0Tk9Lak5DbS9pY0JEd3pXNFh2NGpONXRjTmU5?=
 =?utf-8?B?cDRIUlJ4UTRLNHlsQm1XOHlTenB3bU1SMHV5d3RMWW1sZTRjYkNMVjhINllL?=
 =?utf-8?B?SmlYbkxtalpWeFk4RnNqTjdFOGNhbHY1ZkZNTzYyM0JzL0o2R0lLQ0pJMWNX?=
 =?utf-8?B?UTlXVUFqTHJWYTZtNDd1a1JqcVl1cEdZUjY1cjJJNjhqR0g2djBnSm9HT0pN?=
 =?utf-8?B?VEJIekhqOWpGbkxJai9nc3RuYUFvWWhWNnYrTm1UMFh0dm03VE9MN1FTeWkz?=
 =?utf-8?B?b1JmN0JoRzk1Yjh3YW9UTGJqMWRMaEEwZVptbk5DSmVzb29YblI1KzZ3cFRp?=
 =?utf-8?B?VU94QlR2dGZTY3dFaGRwdHBBT1B1Zy90MEo2SVJDY0hxdzNZV1lBeXNjVUVN?=
 =?utf-8?B?TWovOGtRK3lrVzlJTVdBUURDdzVVNGdqcVR3NlBqYWYrSlhWWjBSdTFGeWpG?=
 =?utf-8?B?aUlpbjdzb1ByWU9aR29DNmFCTmpKbStlUXlQYnl4MGNsNEYxbUZTbnpKejky?=
 =?utf-8?B?ekpwU2cvMjNVaDJCK1pYVFY2V1hkOUJBY0IwZTF2RERSNVNYOWJIWFBmcFZo?=
 =?utf-8?B?TnlDdHZVUkd3Q2JLL05SbXRjTCtMVFBtaVI4NmNaUGdLQTMrMGg0SkRyQUp6?=
 =?utf-8?B?MitNVlJkd0pCSHVBQ1l4MmEycVhLOVBtWHNvMThyUXIyQmdtajhaVkNzTk9h?=
 =?utf-8?B?WDgxOXowVlVPNVF1c0s2OXNWYkZwdXVCYmw5OExvbXpaOWV5VG1UbFgrcDFo?=
 =?utf-8?B?bWlRcnBwZUpUWnlBSE01a2J4VXV0WlB5aWI0UjByRkUvSVhRbEh0NG9YQURW?=
 =?utf-8?B?RnU0Tmxpalc2Nk0wSXpiaFBYc1p2MVFoTC9KZkRKZXFBc1dkYWZyc3EzdXNp?=
 =?utf-8?B?QytTaG04SFo5WWtNa1VjK01vRnhZK21FSUpOemlURURRN0h2OVdNSUdGRnkw?=
 =?utf-8?B?UWtid1pyMHE5N1ZZeGpFZ3AwREV3QXV0R3ZIK0gvZS9wSGN2elJBbktubVgz?=
 =?utf-8?B?VTFIUmJ6SERQbGtWdmZDY3dLOEZHWVQwVXV5YUhCQjFmYVNMVmFYeWlBVGw3?=
 =?utf-8?B?YndncjZuR0pRaHN5L1RBNUtyYndDVGFLYnVnb0NrZDltbTI0R1ZUK20yUnJq?=
 =?utf-8?B?N3dXaVl4UjA0ajBtaWdqRW80NmRZSjZPTkhrOGdvY0J5R0FuSXdNNDlhZ0RK?=
 =?utf-8?B?YWlhcmZOek5McHIzZGFNdkVnUE5hQWQyVzc2Qm91T0pXdklXbHR6S093eUlE?=
 =?utf-8?B?RlhDTzZhWHl6VVZZUnBrb3dHWGZDalJPOHZUWSthN3BuOUw1T2N3Y3lnTG12?=
 =?utf-8?B?OGtZd2c2a3lJOE9QOC9IakdwRld5clJFMlBsYk1DbkVtdm9vckZUYTFucGEw?=
 =?utf-8?B?QWRLbEZYdDhTWmNYZHVZc3BUM0o2bmhKSUN3WDZLWURVeWgzblR1eVozS251?=
 =?utf-8?B?VHVVSUVGT1o2cnZabFh5dkVUc2Rqa0dIZlhKUnhDb3BCUzQ2RGtjOHAvSG5C?=
 =?utf-8?B?N2tIVXU5UXdVc2NGZXRaT3dGcjd0ZG9ma1BaR2xvU1FoSWNEeS9UZEZQK3JN?=
 =?utf-8?B?RUQvTTRrZWdNbHZnYXZuUmVzeWZDeStUaUlhc0xMc2xhUWtFeHRxWmNVYk9a?=
 =?utf-8?B?S0kwUUxDTy8wMVptMHJjQUVVblE1cVZiUy9pUW1Ld3pkMWFKS1RCWllZdklD?=
 =?utf-8?B?MzREeTFBaTNQN1dkeFJlb2x5alk0L2YwRlF1YjJhamFRSVhFS2cvcE9TWTRO?=
 =?utf-8?B?em9sLzhaYnZwODVrckY0eEFWRkZ6YTd2a1J2M0szbTdzV0VMUlZXM1pEVlp4?=
 =?utf-8?B?RTdvMXZDK0V5d3RIZGtkUCtXRjROd3pNYks5WXd4Ulk5TjVqZXdJcE96RDJF?=
 =?utf-8?B?cmF6UnY2WmdtaFB1Tnh6WnpFYUhlSTZwb3ExdU92MWpUcHh2M1crS21KMnpB?=
 =?utf-8?B?ZEJSMnZKb2ZDeDhpL3RicnV3ays1OTZvK3hMVmVjRWxXWXFnZldSc09IcGhZ?=
 =?utf-8?B?NElIdHR1YXJQcENOVVk0bkJPdGpSdnBSWkc5U3BaSmg0NUdyYmVTYVg0Zk1L?=
 =?utf-8?B?MWJTT0N2UlByeDdETjlobGhSRTBlZjhFZjlCbUFKdXlmaGczS1ZpZ2RGMnB3?=
 =?utf-8?B?YjRWSk9uSkNTZHBrU1dEaXNJY2ordmRJb09pQmNtSHkzbUJPZ2l3dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e3394737-4134-4de3-a9c0-08deaeac3fef
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 15:53:16.4399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8hYPnc55K1ifXuH/+h5EOhViHITAWD/NqqJj2VHznTleRS7h0zGiSMP+r1iFIUaBe1FkeKRoKYR25W4o0rvnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7962

On Sun May 10, 2026 at 2:45 PM BST, Miguel Ojeda wrote:
> On Sun, May 10, 2026 at 3:36=E2=80=AFPM Sasha Finkelstein <k@chaosmail.te=
ch> wrote:
>>
>> The current approach of silently disabling all rust drivers if the
>> toolchain is missing results in users that try to compile their own
>> kernels getting a "successful" build and then being confused about where
>> did their drivers go. In comparison, missing openssl results in a build
>> failure, not a disappearance of everything that depends on it.
>
> Yeah, it is quite confusing (though it was done on purpose).
>
> Personally, I think it may be time to finally change it.

I believe the original reason for doing so is that people can use allyescon=
fig
and it'll disable all Rust modules if they don't have a working Rust compil=
er.

Do you intend to change it so that allyesconfig needs Rust, or is there a
different mechanism to make allyesconfig ignore Rust modules?

Best,
Gary
