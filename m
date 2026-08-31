Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BE2344D9B;
	Mon, 31 Aug 2026 01:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788138531; cv=fail; b=Qal9vVJ9jNaejmWnmUqNa/LrN43LmpHT0el9gW6X1P+PSfsVOP2vzTzMsbMjgo8cq7UWFB/rXwUuKVYxWoiet2WPLPRnYWcIUY0tI2/ITY0SOGub7lRZiFun5p7hmIfoGrUOgRNR3or37KBwPrgd9483n9NrZoBABPtcTztJcSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788138531; c=relaxed/simple;
	bh=YDq0FHBTgoxbWNc8P4nCsLDyAZ8+BtLUxk37tADqZ1Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=EhZrmY0r8zuk1j0jjFJJuTysokY8b/6qGneCIBIOxkvGBxK+5P5lCZuEBPF2+aFzkPTa5Z94tzzMbxdvWDyE4rfCVUvkZE9iVOZn35qZQqpnXM2+ww7UsNlAVSAuW8WFW6KDqxA/lWJuKDviamdF+pCLJq1OFKdITh+0JyQ8epA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ex2/70zg; arc=fail smtp.client-ip=52.101.46.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ex2/70zg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsywTBmFDczzCgFICSB3cfEymJ7tqVioLjcspu8/vW08lXF+cx6u2riCO4m8AAC5JaLNW3M9DM3/6kytOcevpmWs656rse0D7XZ3LSoE4GQu+n0aTaCD+L0GVrYSGcLGrEeZqD4heIybIL4pEyDpI0/uU42wDRe9SF/9YqXgg/TX2MyhvX8YnoKrs3I5Dev+JUuCEj44g6DVVHv/dEmE2kPHNa1wKs7JuaXYuTEvmTZ4QEmGzXMCYpbd/ApnA6RJkxTY/MJVqJ/JTTWz7Djjn/YxwnGpHzNsykkss94esGL7ZwzDNkvvaIfr7G3nGvXDqjKsySsOIUAz7C+SKp2rVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDq0FHBTgoxbWNc8P4nCsLDyAZ8+BtLUxk37tADqZ1Q=;
 b=G2Yv434q/YvEFagWm9pYuemdUxWTeUM7hgY64MvrD7d437YUbWvIPDaRRuV7JTJQLMuiCfRQtsH1q/NHbI8b54/x2sKXXJGP3Y4e3i86Gx5K4g2EBC8H9mGrwicvMQyQXJRSWcalLwptE6AeXZqLIrxjrHpRgyI3HUhHalt+GGdw6+qUkhT+DBV88ROGzChsbxVSs/W3NspJ2oXC/3czpUcXKr0LzW1/puAy0CzZFefDBgSIiCPW+WgZE4SP2wh2NqLNqEJLE/jEo91SzlbzI308v6uMZUE0JpDLgBfND92JtPETtVbho7c+qit9T+KJniGwqZAaE7QC20p3/RYfDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDq0FHBTgoxbWNc8P4nCsLDyAZ8+BtLUxk37tADqZ1Q=;
 b=Ex2/70zgexAfOfcBCmxiDnaU09ez+hqVcpHHkyhpjj0LpN4ycL+8K7dsC6o3TbAvMLY1B3d5mdGu4FBMlOhWiOAZYB82CWeZCad6yOc5n73qn+EE896WSeEqtxM2RdL5CT+Mq0jwax5uvXXu38EhnVd6ma/7TGDQkZ9RKZTUh75KStDy2jY8jhM/hMDvKBJuePwrsaX+9iWMXQIUkTNFaEjcxy1i9zQGzD61K8lVQj9WTc5DlgziHlh9/V3u9qlw+9wleVAgRUDooM/XmuQVB1+rT3oN4Q8jyZcuE80vnt48RMdPRofuSt6zEdv9djP9IuAYhLtHvsLH0Xj/v8+FSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 31 Aug
 2026 01:08:46 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 01:08:46 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 10:08:43 +0900
Message-Id: <DL2Q7DG3HIF1.6IU0VQX54L2A@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Burak Emir"
 <burak.emir@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: bitmap: document panics in `next_bit` and
 `next_zero_bit`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Georgios Androutsopoulos" <georgeandrout13@gmail.com>
Content-Transfer-Encoding: quoted-printable
References: <20260828133543.2259029-1-georgeandrout13@gmail.com>
In-Reply-To: <20260828133543.2259029-1-georgeandrout13@gmail.com>
X-ClientProxiedBy: TY4P286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::9) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 28902d78-4bc2-4959-6cbc-08df06fc6872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|23010399003|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MBaqIO++JKfAZKp/g4WZDVNnucEv2A8qInpTuurAL2l32DoSz+SIf2KLx5gxR0oSyScnqDLX36lNRx8jHTzma249nE9yw19Gxhd82XYnrWZlF80yNVQTyl0rUE3/OKwg91QJLv1fRTkLCn+5GRZmA/tGUDpOXngkC6TrL3EKqWJaa6ufx1wGRp+drL394rO6KYQnU+9XGHGERv3EkM75vb1RRgkfai55mJ+Mzb3pLPhrGJB51xOT/ZGHENZSLgWZ78XrLaY0OdOToOaR35+DkNZlKzijhPE900lgUlnCOOu9Jal6yYTwsZL82/Mp19WK8un+/YQsc6PMuSFxqLVr8DGOkgAPvwyrc35KZXynImmT/uNTdsxMkkusNX339fKhCG4h8pZhBcpAa0N9PLcmYZadMSCtOHuBa73kKM7xZx+zUF/53BEfr3BPVtzGyJA7gnKF/0CuEoBiPmLGnqsLUIEIx9eozPmii4qtgjb4/gOpc/t8cUgNVaKdeQTJrdDkyMRXxfbfUyBaA4qee5RpEVw6zsyK+GHnzP7r2bzNWSj8OMmvqJuine+QTR19zNNkGnDsovhqY+z+mDq8ZU5MlWDpKsQUFEMtmkyUEgBMStQdVesYsNLf2hRiYFU7H96Ru3AQXRBkRnTZdOl2lVcJSoktHvonbKR83OvX4aMCbwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(23010399003)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkJMOFYyMnF2VjVOaEw0cm9nMlExT3NkVE5UNjRpalN6UUxSbWd5NlhBOG5u?=
 =?utf-8?B?OEN4QUt4bHRoQzlhMWlPcHpCclAvNGtQN2lDZEpqZ0t5ekJOSlE2T01aVlpZ?=
 =?utf-8?B?RFRrVUVhWkNqdkZmZFBHL3k2UzBKS0NrL3NVZ1RPUWNkYjY1UjM2UWcvajdB?=
 =?utf-8?B?U21JK2lURTJzenZrQWRqSDY4aDZzMFdWRFd1YlJxOE9YMUY1bTI1YUtvdVdp?=
 =?utf-8?B?Uy9Kam1uWm1nQWdFVy9xeG43djdRTFRWYnNkTVNGRzVYUFk2WFN6bEVZM2xT?=
 =?utf-8?B?ckp0Y21keHBsdlVENlNmUkhlOEN0dmNyNDFYR3FWcnpDZHRNZGxNSXpiUVo4?=
 =?utf-8?B?a0lMLzBrdUgvK2VJY1NmMmFOaGJ4MmJwRnVkYVlqYjZyaWIvalBBVDRPWSs5?=
 =?utf-8?B?RnorSVU3dlkwRWZJSjlyWDBnQ1Zrb1VWdkwxcWhKYjBMdkMzZ2lVMkt5SGts?=
 =?utf-8?B?OE5pMVpZVkNsajBhYlB5d1BxUlhjSW9hNFFES2xJNUJsQWYwMFBVeDJlcDVE?=
 =?utf-8?B?dDBRYmw2MU00ckFqL3k0bmhsbjBTUmJRbFdrRUE1dU1pbGFrNlRxdzBQdHVs?=
 =?utf-8?B?Y0l5SXdVZnd6b3dnUHZzUjNpL2NQVDFhanFrY0JhckZBM0hsTzRyYWo2UUQv?=
 =?utf-8?B?N0EwM3pSZThFVFNMZ0hzT1VHbjZGTloyQkgwejRrQ2F2aGZCUjMvTklXNmxs?=
 =?utf-8?B?dEE4aVF2eFVkbURvVXEzTEdqaTh5TVA1Q0pCdk9pdkh1MjJvdjlNK0NuSkRs?=
 =?utf-8?B?aWZOa2lyTG1Ba0JqVk8wMkVrWEJROW5PSUJQUzFOMnVjOE1HQllkV1pNTVRM?=
 =?utf-8?B?dUloRldEdW9CZDBLZUc5NE5MZWJqRGRMUVU3WUZ5RGNtbmQ2YWE2ZkZhM29N?=
 =?utf-8?B?eTdYbTViK25NWmN6R0N6Y0NOM3hkODV4cFJPQkZBRzVrWGwwYVo1aWFGZjBo?=
 =?utf-8?B?NUtTdWxqbDNaR2E4ZmxMVzc5ZDZXc2lmSm9qRjIwNXA0Q0xlcE4xdWlxdzY5?=
 =?utf-8?B?OGZBS29RWVNEeE14LzBjcld0VVR1RDhMVllKeG5hWjB6ZllMZ3RaSWhSOWFF?=
 =?utf-8?B?Y3NkaG5Zckt0Zm9uajNVTDZjdFhUUjY4V01yYTRlSlZuZHdxZXIwYytQd3JP?=
 =?utf-8?B?Y0YycXpwVTBJYUpoZDZpakQ1NUlKVDlXNkNkRTlZbDVwREJRS2VVbXNxYUVQ?=
 =?utf-8?B?TnJ5RVJPKzlyTjQ2UWV5Tnl6VW9PQkhheUF0TUlLOVYrVmhpTWdMZUlBM3Mr?=
 =?utf-8?B?U05MNnhqZGRxMVJ1eE5id2UyS0M5VmM0SXJvcGxDRGpmSDZsQXNTL3J4ZVBr?=
 =?utf-8?B?RDBQd1drWUp6Wkl0Mlg5R2I0VFljNThHU2dMZ21hYXZXTjB0U0tmV1N2Rzg1?=
 =?utf-8?B?UW51TUNTMlF3YTYxaUpTajZpL1laamtsZnRKdTZaRktmbm51UkpnVXBXZVpL?=
 =?utf-8?B?L21DQW1yM25vNDZVRWJwY1cvc1BEVTNVeEZvNW90R2RCTTdHR0FkVms0Mlpp?=
 =?utf-8?B?ZUZ0eEpsQVpIdXFTWU03dnhaWkRjSUlCRi8za2JqdXoyelJqcFJzVkhjQ25h?=
 =?utf-8?B?RG8rQzJkMjBVK0tuSHpHNFkvU2dmeGxYUjl1Z0NBT0ttd01vdVNOT3hBZHBY?=
 =?utf-8?B?MUZ5ZFNTWkRYVXllUHI4VTJKMHU1ZjJzRlZxZUxSZ0NmZkxQdkJTOGMyalNV?=
 =?utf-8?B?YjhRajZlbnhnbzk1NVp1SEhqaEpITEIyamdFRm9wcCs1S1JCTmFsaE82UkNB?=
 =?utf-8?B?UHplaFA4RU5uaE5jODlqSHRXY1N1Q1FPVmxuaENKeDQxU2FqbWdmK0R3ZEZh?=
 =?utf-8?B?VWdUZTBoN1Q3MzZHTXY0amh4QTNpZVlaSmxHTXJhUFQ3ejdHaCtUMTJORWpv?=
 =?utf-8?B?eVBZL3NIQjVkV1NveUo4MkhRc3lYdjFpRlBpc1ZWcFhodEtnVHVHVEczdzdo?=
 =?utf-8?B?MDZwbktDL3drVDFwdVlSTGhMek8wUFVsUHpnSGs5cCtRdnJqZmFmZUdmVWY3?=
 =?utf-8?B?WU1ockxBUk1hbEkyVis5QXZFZ2JOdlRBUFc1YlBCbVVLSHlWUTRHUkgxeUlH?=
 =?utf-8?B?OFo3VUNuZmpjanNPMmdKT285dERPRlBGMzhjVlp4dzIyeUJsVTZGYkF1ekUz?=
 =?utf-8?B?aEVYRW50eGdQM2s5U3c4TGVTcVZHSUxvS3ZFNVc5WHdOTVFyZEFtTXQ3V0x3?=
 =?utf-8?B?QXFCV3pCandMQUtBUmFJREpNTURUeFhpdEg1SFBmd0Y3dkR3YjZDU09JNHRD?=
 =?utf-8?B?QXdsMTg4dkdOQXJ1L3IrbkNFbGVKRFZlRmJmMUxONHhFM3hpWFd4MXNnQmFu?=
 =?utf-8?B?bFhEZnl3VEZVVlB1cUliRlUybkNZV0U0WHdiWEs0cWhLQStwK1VEYmVodnVu?=
 =?utf-8?Q?NhOMTgldjEX395CvAzSg2gSkbxAbKgmPOqqX8xND1T083?=
X-MS-Exchange-AntiSpam-MessageData-1: lkUH3NHXsDL81g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28902d78-4bc2-4959-6cbc-08df06fc6872
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 01:08:46.5818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMEK/DMiKjWTcuwhuDX0lwmxKw27Qd0hfJnbeBkRPFNNCUESaE+lRxTXnFBiAWEvP3WRkjxdx7zVMKrBQO6Kgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119

On Fri Aug 28, 2026 at 10:35 PM JST, Georgios Androutsopoulos wrote:
> `next_bit()` and `next_zero_bit()` use `bitmap_assert!()` to check
> that `start` is less than `self.len()`, which panics when
> `CONFIG_RUST_BITMAP_HARDENED` is enabled. However, neither function
> has a `# Panics` section, and both document that `None` is returned
> for exactly the input that triggers the panic.
>
> Update the documentation of `next_bit()` and `next_zero_bit()` to add
> the missing `# Panics` sections, add the missing blank doc comment line
> before `Returns` in `next_zero_bit()`, and simplify the wording.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1252

Should this be `Closes:` instead of `Link:`?

> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>

As I mentioned earlier I hope we can stop panicking on these [1], but
meanwhile it's indeed a good idea to have a Panic section.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

[1] https://lore.kernel.org/DKUKM1RPFDA7.1MBU5EY40OJ4J@nvidia.com
