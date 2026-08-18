Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011029.outbound.protection.outlook.com [40.93.194.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D457B18A6CF;
	Tue, 18 Aug 2026 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085989; cv=fail; b=e22l5LrExRTmwjcssOioLdpt7IBXp0T+Q8FvuqRJT9gXGwC7wl9Pq8QiKoiSksr7eoBrHKPxelOUxL/g4a+7t65QiS5B5ODseMbRG6acJu4mK4Eyo1srAO479cnvO4GikBNxnq/6ag4q0YgHqzgeIAfwQmtilGWTXrZxCXAQDcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085989; c=relaxed/simple;
	bh=t5v0AOo7efAajxA2Ieu79bl7iQ5zSarewtFwO0IYmcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nFrbnlLLUxuDdZGcfQZDFROB4CwmgGEwzfKC65P9Ar+22qd80es2ainFNr02z7XOmtEVl7AxQ+00JxWIX6KISj6Dnu4L4Jbeacffi9lZWSnTVoWU4Kp40os2fBD8pceaGfa4xNBRKMnEmI/UkoeFq6R80gnE2B2Lw6+RSVfbyyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RJiygWxL; arc=fail smtp.client-ip=40.93.194.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RJiygWxL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LY7wQC0uZ0OO3iamgDQlI5ir4UROsnZ0jyvWf2MVreFQ1aH2LBfXoxSF3eEh6QDGZ6w1dPt2JWMUrsvGp9mf5GRWXKgcywHtwB0X53E18hbCFlcap4fV+LqLXYTzKBU4prNySu9ba1RqPGSrt0UrIDvGr+2i1328U1SLUME9cNsgjNz+q6jE4EXyVM58R3GoKnv9xbeBF4GiDLIy+lH4cPe62n+LAJhvzxMCpBGAlgciFl2PSLsLT34OKW2mGjKrQH3tYSHzwaYzwM0z4Gmj9XZPB95ScZgXnKvdG5APCso8hhCFy3BwT3LVQhuw1F33RyepsB3LmLLSU6Kkp8Z0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5v0AOo7efAajxA2Ieu79bl7iQ5zSarewtFwO0IYmcE=;
 b=KNLYmRvlvZQo45Qn6y563mtgD2HeXUxt5Tk90ZOEVfHs2G+Hy4Vpca+xOGMkiXXycA/0PgKLsUjztHsvmlHS3jBZz3v5aHs5Or75pOc/ZIEVJj3EM/Z/x8/Ese5481WJdDn5cP4YKvC6JYXTgaYvne4xQJfnunzppGDgp9nCDLTyo3VlucHxVvAvVPTZyXdKfYIRJ/hz6SDpVrraVUqy0ie+g8V3B/D5MeY5A5Nv0bT9wblyAJ7yPCLGDMV4scLgyU5P0ZMlJH8yJjYZAusw/FAxZE3iSCfvJMzyXy3zJT3YNf+L7a8IumGpzhBv5ZTKtv69C7wWG729UBK+7IXFOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5v0AOo7efAajxA2Ieu79bl7iQ5zSarewtFwO0IYmcE=;
 b=RJiygWxLev5ufV8czsc1P4uX9Se3CNm7KIU4T6cOIomh5Nw6hesmomPAj+9dYvRAHAUAi70NYsQnVEIH6nkZ2TUUBkDUWCgrtj7M51Re55NiJppmN7WofMs5ORkrwlVK/9tH+e93fZkiEDoPodLub7YneXv1ZepLo8K06ib/YN+UCYZ6SYM1l+jSuGw71GrWtUzxEjLtEjbvfT9TC2bjIr3FkYjIGIXCzcn5VQ9NCSjVPJ59P1rve46y8562CRIRe5/FoIQgzANeDo7FaXvPzDsv7hEuRkfM2TD/eUerNaMFwc7DR8kRF0WapV5lSqrRGfvgmDitISCbjFpH82SoDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PPFB6B4D32F9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 20:46:24 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 20:46:23 +0000
Date: Tue, 18 Aug 2026 17:46:21 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Benno Lossin <lossin@kernel.org>, linux-next@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Subject: Re: [PATCH -next] rust: fwctl: replace `__pinned_init` with
 `raw_try_init`
Message-ID: <20260818204621.GB61595@nvidia.com>
References: <20260818105350.361218-1-ojeda@kernel.org>
 <20260818125558.GB5432@nvidia.com>
 <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net>
 <20260818132022.GC5432@nvidia.com>
 <0e0c9ee9-ce44-49cf-b5c5-3764f260f1b5@sirena.org.uk>
 <20260818142300.GE5432@nvidia.com>
 <CANiq72mOqWw0gxCCcJSyWRVC_OXSt92g5HmAOx6OL4xp3fcC1w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mOqWw0gxCCcJSyWRVC_OXSt92g5HmAOx6OL4xp3fcC1w@mail.gmail.com>
X-ClientProxiedBy: YT3PR01CA0114.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::31) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PPFB6B4D32F9:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d5629b-67d2-4248-0c6b-08defd69c414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	SIwHaUS981C4J1j0gcUZj5BhGJwlpwabkZnqZIp86tG5jTtB6QfazEfyNdkCNCd+Bsn0mtcPoh6+UqKwaQHJ/abxeOzbmxQQIe6YLyQNa8vAw/Pd4Sz+DOiM42Xhx/xuib/WnNeFAWzXlHl8Fz2F3/6Q/E6dfjOG/xOrcZbrDhstcZsHgCuHsKp8R3Y+FKhb0ySNXtwGIIHUhBOamKhqC+CPHB/cbTQpAiwQ10psj8kJaHeQhkz+1s3qdZjjXIpBjUYNG7mm1bxzkOyTP18BS2hhe8edXJmpNb9JFzpArFNTcbN0MObbl3yOZgtUiJhIOfaDzKWKl7BcWxDcGnuLnCUBCInhBKyObX5yQzURimdkZHX//iJAfadoTte9/zwHGSG5f9yxnhyarrQn8XsBTcsvaHbY4mVwD0ogBpPa4L5sOsYjeK+AguO+VwY4MHkpkPsU2ad1jLz4jVOooZnbDLlZSAZRhZOKCrKhWpUV4BiFo7S8k2V3LNTK6fZw1YgQy4qw609lL7zY+lBqD0lA95o3NZAgZXAMQrtmofbrPN6sFgu25lE4YvNn3isJUkJaD8kVivnMko1IXwMbzJ5Q6+ueXvVohagT14XKoRSV2SOdxH5u99hmTR5cxc4YevRjXZgpC/TJTau4xlNX17t/IV7f1dV609D3SgsTFosbkag=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tZlrpBXrU3Daia1lXoTi0n3GOiCwaSfhq3qnmCh7FbQ1KReYiLrB+T8XnLsn?=
 =?us-ascii?Q?mox7Zq+cZ9Ot3NnlDu9IlrH9xG2vGlJue7iCQAvNBuB7mCJtGntSHsBXh8Fq?=
 =?us-ascii?Q?KWiT7az2q+gQr30nwtdR8MHghBpbUYqZtWh3LQs641SoEP2PoRRmg7z6Ajc6?=
 =?us-ascii?Q?gEdT0eG5iqKqxzOQone2j52SAzc/yqje/2vYQ2CZvTjsZ3VzZq5xJb5j6few?=
 =?us-ascii?Q?1Qk+TVHOwYwdKF2khCkFE1gYnU3HDSLDcntvCfqbhY0Esw85y1d3O90+Oc+T?=
 =?us-ascii?Q?Lw5i9gKcew1gVB4audAMeNQYTBm7FLM43PkG/CJfhKEf80/1gB8SZsli3voi?=
 =?us-ascii?Q?sbTBk3aZk77h/kyOZkw43eVj8/TqdSVFV2RQmywq1jk1Z9sFDlSeJeiOUEua?=
 =?us-ascii?Q?Z7uQCGkZkY9q0yJqzEzeWHJPkBqTrMPHwvpCtsfQuWl2A9+8QfJ/u6GPsgD8?=
 =?us-ascii?Q?0ZFN83m0DZpJTZgfCwv+e0HEFPsH2fh34bUIpIXDEasiEoFcxUPRoyDsBGIc?=
 =?us-ascii?Q?eGD3DbvMVJKTl86vKTG8ILdhiKCDfhZplHZD4lo39/PpTSEIZuKcb/CzHx0I?=
 =?us-ascii?Q?GKzqQ2rUIKqI4J+i8fsULpqErjdVViFnT7/J31U1qXh29QYRfNfVZzRCqKjK?=
 =?us-ascii?Q?QOq67fI7UAOMgFicESJnL+HbcrDdOke/BhhnPkkuO+W9wp5tMMshG88nHfWc?=
 =?us-ascii?Q?0ZD88BYgLTxJjlsIRQEtQmUCCaCd7HqE47YidYf8fN7Rp/IOnYLwR5j17m4V?=
 =?us-ascii?Q?asN3bGY49mWTmFwh6PCU1HXWYbbgvu+euQyvKS0DyzA7TCQE2EKobvBvbYcS?=
 =?us-ascii?Q?bEROKlJwzEpDQF5d09NBAUcRkbfVw7CvDn2SPpfsOL7otb23scSM0qysYO2Q?=
 =?us-ascii?Q?WwQKcMTqpDJv+YoHlVj0/irdsywK97hTzeuAHZ/M1Ac71V1drxgkj8qcOesT?=
 =?us-ascii?Q?s0mvHOnxpYYSS6MjLIornAeol25hiMTK5FJuC+bnmxcpfuFvQrMEbKZbsbDx?=
 =?us-ascii?Q?DKgickFGIK0O1eFf1O+409la3zGRbjt8yFUxmxhbyeFdk9TA908dKjc0E1Dc?=
 =?us-ascii?Q?XAVtv1xgUtEVxvKiO56uKbnTzXiypl6e/hpcv16Fx+RBirK5xADWw9cMKLbE?=
 =?us-ascii?Q?JpwodXjydGgrxofHTaSWDF5b8U8K1wkUtdgQ7YLX5A/i2pJJXMoA6AZQL0et?=
 =?us-ascii?Q?EwHJ0xGjTs2SI1wnJh1SyxJsM5LrFOpfQuCxEnUi0TZuCqinufMo8RYgmA9R?=
 =?us-ascii?Q?zTKFSZ477/EwT08em/htHFgDMXaOtbeYLGFLKkxV/KWReb2k1PoaAVLha9yg?=
 =?us-ascii?Q?dMRVL6Hf9cvO61NQgDjQjtG8NJNM/j+jWNod8EsZmxBF3d6szCAf8Yoh0p+9?=
 =?us-ascii?Q?svUG73yya2BDGY8WYqLN4FgO6QD7FfLLWBbvXFYlBwfo85B6V3Gb6JvW+S48?=
 =?us-ascii?Q?+aeVEJX61y2HsNjgxqDaKCjAgZ3AWxY5vYrTlZWAWFkm6sOB1A7t+qxVNI0q?=
 =?us-ascii?Q?dwnYfMaWEK/hWxHGqDlPf0aWcSEaIg0xv+lUW6gY3gfPLVVnJN287WWwmEy5?=
 =?us-ascii?Q?OKM6LiYWhCglKm88kbDAuQm7yik8oNpl8KQf3j/ZMnOPAErBLlhYHjeaDq9i?=
 =?us-ascii?Q?I75uPYbn2iMCnMEGWe0ZJJTsgLfcIKRq2egr5R1R/pr9e4Qp/zIpMZdstOOY?=
 =?us-ascii?Q?eispMNLxK6MsXJDWftVboPOeBj6gRcFzFigeqJf+gWmZX1q8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d5629b-67d2-4248-0c6b-08defd69c414
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 20:46:23.8762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOjqxCrcBrJEDc4WavBiHL0p7LZguiE92+1UYQX8SdHKhhmAXG1P9xWRbLmHFsq8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB6B4D32F9

On Tue, Aug 18, 2026 at 10:37:48PM +0200, Miguel Ojeda wrote:

> I hope that clarifies, and sorry for the trouble!

It is fine, just give it some thought. Your PR has a list of
conflicts, and I saw one other of these pin ones there as well.

Imagine adoption making it 10x and it won't scale. If there are things
to adjust in Rust or process or whatever now is probably a good time
to work on it.

You don't want to end up stuck later on where you can't do the
refactorings you want to do because of unmanageable merge conflicts!

Jason
