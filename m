Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012034.outbound.protection.outlook.com [40.93.195.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF808479;
	Wed,  8 Apr 2026 01:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775613313; cv=fail; b=RKxWI3kIBDn8HeIsBnEtwf+1MpJCM5C344zYwzCf2JAccNe/f97eYASbQl2CS4b6Uy9+Ua5H/h5PVtczTsdOx8cmWI5GbW18c9SZYLlgacfBQ9zmQHmZrJ/I7JGkoQfgREYW588oZT/dL2DhezqB6BXfO3ecQIbEgSqFy9L+54g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775613313; c=relaxed/simple;
	bh=fCMfwtqo4xjUi3Js5FkxO6spPEjtRCVPJ20+pXizFfc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=oGlMJmMiEtwih9dVWhBSEE0VlEF1H0t/xIof+eA1PK9o7zaflDfo+cGmMzRs4tubShMrI5dMKJOpEg7+/twSS6lONBd3sJmYPMJpJswf4q3yry6uFBYpnw1PvTRtis10mbkCui9nPRzmbt0nCu4xo3kA3uQfYpCRkN/5P4TYT44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p4ca5kQJ; arc=fail smtp.client-ip=40.93.195.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p4ca5kQJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6YwnbMUJ9AeVC/H/eArZU2UbOGsEL7UBUQPu7KJGlICDdGoashjc3vWXBr8+zIpumATHam3+LHITM+eRugA3dt2B4emctUz89fWuUh/A7jYM5aNrJaAR8QNup+BJfN66SNUXLMFUnTpQ7g4h49a+NkeSfEXkeXZ2Ud0PxfXw9lb0F2hmSbIuebuuq7l7F5JOsY/IUku8JjmQjo3Ml+ideJcyjjsPXSfWbedj4Fvt4JjYg3XMu7kyF6R+6/DMsk843P/OfyDIC4UIEdJfUOYmYGzC4a+Eld3G8A/HfRUPZ6o3wO1l/Tsu/dfWlbUOWtk6Z7jw2j8iKFGq5zFxsuVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCMfwtqo4xjUi3Js5FkxO6spPEjtRCVPJ20+pXizFfc=;
 b=Fh9PSw3DMUenOXYZPbz4jh2UJdgFpiyG5WVzfiffSJOEQnYnXaICh4Gfjhq1+C4wbzdogDoEKHZO7J/uW1u4NvJyvwoULXkli1SAf80advWFSLRRLca30srf4j3tfWVDIlr8DySeW0Sq/DatfIR7jJ3/MYaFFUjPfQ57JpIjYU5P/OIXGeTI1bOL3kd4aexe4G5cHfRXst1PUCP9px0gjeaU6LJjomw7mjymd/CK3n0AXIRkjwK95d5WTZfnRmWWLcfLGkKYrY+HGVQpl5KOYNd7PVihtNzqubSd0LvXFc+Dk9RRKHL7XYD93U2PBi8/amyY3CNppVnVGH0UmOguxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCMfwtqo4xjUi3Js5FkxO6spPEjtRCVPJ20+pXizFfc=;
 b=p4ca5kQJiX2+6OjCXGhBIMzJytbfuokR0LK/8DcmR5DsSqi6gOg6NsxymCzqcOER6+ENd43xZgv1eSmpyU1uGfWdL6lCDaL4hQXQzAaYRd16Qd4uKvp4mL0UJclIBF1dPKz+yMqmp0mlqgyQNYVj9IV4FXqfBtQGXa1gsxdnSNh7WP+lD4pycmLcL1GGmY21g15kIvXAZv868ODvu+1j7bmHl6IkCeRK8Pko/YXyy+q/ox+8ArCrlS+qi4FtAwyRW1uBMMddP5UxxbZElr+ZaPll7Q4OXZX8mKh8LS345gxEJoZAFX72B6L1ZYJ+pknzyGl6N6HzLN/ft232a6JayQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6676.namprd12.prod.outlook.com (2603:10b6:510:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 01:55:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 01:55:09 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 10:55:05 +0900
Message-Id: <DHNEDVS8M0KE.2JBNP5LELRAVR@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 30/31] gpu: nova-core: Hopper/Blackwell: new location
 for PCI config mirror
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-31-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-31-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P301CA0043.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 6addd588-0e1d-48a6-212c-08de9511dd0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9oByqwLLICriaBSZvwRN1R8urAj5F6NYjxSJ33OyVnvnCQ9op51NyRReMcX3MIcajeKyHy0dPtoIlzUHCyS2xayJDn3I6cOCNllnwBGjInlwH2Krkm/agHCEX/1tnNWtLUtrhB+otryjDgdlSSR2ylGFvz3RK+ATxKABMapFEddIsG373lxS8ahWYqkppQyMDxYRZ7R/zBz7lnJFOaP8P3uF2uF1OdhigblB46wUbAEZegByCWvl26Efva3JJ1cw4Y1jZG0fiud74e2qPU4Z99nqViGJad9eeCdFz/+ktu7y5v6PwnmIvDp5L118VoNy+3UjauZX8E/6jVMLFduJUpjBrfwZqQgcyxHdGs70Y8p8nERtLhO+/u6judHIKoFmQ9pIYTIN0jJmkz+aPNQUEXFd0xvzN1MwDJz+/1ZMLR9IQSAudxJq/mhV1u0v6oBmrLvKz7De80gDhVIYLJX7o4WVLdfkEi9y0IEEysL3jXoBFkc6nN256iyqQfX8RPBfi7g+tc7vg2Ue8vYpiwUkR9pLpJ9LZ8HDv6r6KVMynZx7aMRofXOe4XIHWGbSQKv1nOTDstkcImzLU1MGKsAv5wSzFSKs6rb3RDDcb0dISatHFRJQzJHyYRzesVMSYk1ITS0weC9Ri5Zu95ly6Xcn3C3KuKgxfClYY4JSsZKJ0gNArpvAYavT7y3eTljsqGKLzUAUXpTyzZ7ZWQwvUVdaEoLYwhRpwVMLwF3D+uUoLLU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1hNUFFaak8rUDdXZmxFNkVxMFEyUXYxMzB5SnNMaTNXK1dZZGpvNTFRSVVF?=
 =?utf-8?B?WThlVWZ1dkN3MEQwYm1sUFAwRFpCWElJQVJtTmVXNktSbzh6bmhyVWdObUNZ?=
 =?utf-8?B?b2RnRm1xYUM4ZmFrbW90bXBmeFdJck9jVkRUazMxdVVlT3V5b3JxOCtpZy9D?=
 =?utf-8?B?Ky9XS0QvZytOMGRoVzhZdHkzYVRPN1BvODJkcHZGYWF3NCtMZDZqdGlKVkNk?=
 =?utf-8?B?WFl0TnQrYlRrRFZVVVh6WHNIWm4xa1A5Q3RxMS92c3VmK2NGT2g1bnQyMTd6?=
 =?utf-8?B?c2xzdHl6U2g4UEo3REVlRE4valBVN2NyLytnQm9XV1BDMGpSZElMaUo3Wkhw?=
 =?utf-8?B?QVIrdGJtMkJ5Si9jVUx4d2Z2UE10STJBR0NvQzNqbFJ6cDBqYkhvU0laVlN5?=
 =?utf-8?B?b2VPRVdRSTBRQ0V6TEZ5akk2YXdPSURubE5pQzdRU1N6bFNOR3JNS1hpRjRH?=
 =?utf-8?B?clc2YXhvZmFCa3V4b05MQUZiMFpHRGYydWxQVm1ZUTlvbjZIM3cwWHFod2hm?=
 =?utf-8?B?Ly9tbEljc0JnRFI2aUJsUFVhYzcvMURLdlJGeWJMRHA3WVRnZGEyZFRPSlY5?=
 =?utf-8?B?cS92bDJQZUhiYk80a25EYjk5dGdDK0ROMXpVM0ZBbzdHSS9xcEx1ejViSngr?=
 =?utf-8?B?azlGL2ovcXVudUFqTWRySm9KYXJIWFIvSmFGZ1ppdnh6Ulo2bWZCL1RlQk9F?=
 =?utf-8?B?YllIT1dzajdtL0RKMTFmVG00aWdLUmhMeDJyRWNyNjdKbmFtMjhOSVNhZThU?=
 =?utf-8?B?NFZLTHVMWU5yK2Y0OEVwYUQ0SlNQZkxzSlVWSkxxTkl1SGl0Tk5maU13Vk5I?=
 =?utf-8?B?NTYwYlZiTlBXT2tES3RIV2MzbnRXaWlZQjdGSTNGeFJDSTBBbWUwdlNhaXdI?=
 =?utf-8?B?dFI5bjYyTmNZRTRzQXlGRk0vemZlNlR3ZWMrQWVFdWIzY1U4K0xTcE5UV1I3?=
 =?utf-8?B?c09wVGVsaVBhcldTU0ZMMzBKUlVXa0EzQXg1cldBOGszdjgxcjIrZC9zZzB4?=
 =?utf-8?B?MWxjNEdhWkR5dEpHQXY0K2RaOU1KcHdkUkgyL1AzYmgwZzFaYWE0bnVtTStm?=
 =?utf-8?B?aTZWU3lKR0FxUnJkUkZ4cVJmSFI1MlNJdndsM1BUVFRzcU9zYVJKYzE3bE96?=
 =?utf-8?B?YXptUWVQSXNYUGwzK3pPUEtvREpmOEFGUjRBVzR2bk9tSjR5NzJYM3Vzb29R?=
 =?utf-8?B?VWlFcVJPQVZvaDhqbkZsVDNrRkR1ZU1BNkxWcUMydGRYN3VNOFNBV05aZUNn?=
 =?utf-8?B?RGlQYjdrOXZ1OWtMRVhBZmltanpEcHJwMmg2RVd0emtITmV2akNrMVh3Y2V1?=
 =?utf-8?B?aWpZdGNBZkFKUUNwRHYzRXl1emVWQ3hxVWR5TkxKSkdtMXR0MjNvTEwvRzhU?=
 =?utf-8?B?OUtIYlJUUUcyd1dlOE55bk02a21VMWhITlBaL0s4aEhqSXl2a1NvbzNlczVN?=
 =?utf-8?B?R0Rwa1lBM2hGMElQYTNOME01ajBmOWdtbW54bm5CVlgrNjhSa3ZLRkxqb0Vl?=
 =?utf-8?B?Y3MzUWR4RWJtbXBPdmFNdDdtUkNBSW1YUGhiNHdVazZHTndvbjRTMml1T2VJ?=
 =?utf-8?B?UEx2L1QyR09QYUppdksvNnBhWks1RXZlNWxqWVQyUHVGeXhCTzJya1pYYmNk?=
 =?utf-8?B?UTdaL3MyRzhyVGFnREM2N1RxUkQxbVhpZ3Zydi9NaTJJZjdaTzd6VDMrUFg3?=
 =?utf-8?B?Z0FBc3loZWFyVDhvUGlTQVI2VEk4NEdSZkJacWFCSzBKQW9RRUsxekcvM1By?=
 =?utf-8?B?ZTFpOUZRTUFEV2ZCQ3hYaG5vcjB2djJFcnZFVmh5dUFaV1hENXM1RjREM2JR?=
 =?utf-8?B?UVhFTjk4STQvN0VNNGVxSDQ3djBGSVk5MXhKQmNHeXk0dnBJRkQ1c0pSTlhP?=
 =?utf-8?B?Si9jTHpoOEJXNWc1cHkzQTh3cnloTzFFTmM0TWRNMmFPZ1JlWTdERXkraE5X?=
 =?utf-8?B?Zy8yUzZGTllxZUh2SHZvbm5RTURKWE9walM2SjhFZDRZbWJIeTlkY1o2RHJW?=
 =?utf-8?B?dWx1TFBNRGVnT2hKOXZpaTViaFUwbWNOQVhGVkNxRktmRk1ibnFsU2UwQnBo?=
 =?utf-8?B?UndLWTZPT0RiVVZSdWYrNXQyZSt4UDVGZ0hweVFrQ2Y3UDJQY3BIV1RPZ2lr?=
 =?utf-8?B?YmVqUmZ1a1FKcjg0ekRwR3l2QmQ3WkNCZmJQdXNzUm1KR0w1Wm9Qa2UzUUo4?=
 =?utf-8?B?Mnkxck00bjVLUzNXVTA3ajIzTk45VWV6cFVLVm9sOFA5ZHFvc1M3UjlOYjNa?=
 =?utf-8?B?ZTc5VUM0bTBqSzNBa2NHcUtER0J2MWJZOXFnNGU4N0RGZXhuVTNPaGczUnVH?=
 =?utf-8?B?MThYellUODFDYmxyZncyOTh1VkUwcnFmV0tYYTBFcVhJcUhERnk2UUdsT1Rt?=
 =?utf-8?Q?h+ct395fF6m62PNnhwCYqtQ2T/CkS/bOBLGLO0zdNoysj?=
X-MS-Exchange-AntiSpam-MessageData-1: xwwZvo4cpPgEtQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6addd588-0e1d-48a6-212c-08de9511dd0f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 01:55:09.0329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDmRc4cSW1QeiPBxqtz/QxT5TgcetMtkEQ/OqoaqVoipwIWKRDFy/d6e+k1eSewGJugKG89Pmz838raQqf3ijg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6676

On Thu Mar 26, 2026 at 10:39 AM JST, John Hubbard wrote:
> Hopper and Blackwell GPUs use a different PCI config space mirror
> address (0x088000) compared to older architectures (0x088480). Update
> SetSystemInfo to accept a chipset parameter and select the correct
> address based on architecture.

The offsets in the code are different from the commit log, can you
double-check?
