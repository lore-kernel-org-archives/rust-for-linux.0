Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012050.outbound.protection.outlook.com [52.101.48.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCB834B197;
	Tue, 10 Mar 2026 11:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141676; cv=fail; b=jqR/AwB2WaVeFsFYesDNDun7yrC47HQa2ZzCOfK52ujyMBJMz5hAwqVE5RoWxWNq560+xYMdQr2fw0uU/cNQhe15vYxP2dGnHBslb6E0b/QPix7dNsAJbVK7QkcbLRWbfsCHXi60+Nx2mT+9MZqWueFrWIRgumD1UCT5IuLNcAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141676; c=relaxed/simple;
	bh=53NIa6WhkpyDRUY+LMQ1PMYugLN8SEALgQpIcuNHSWY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=oyw7qVPu8LI2YC5cqYbK/bfBeycZvNqn3mKmjh1kQesZ8QWCKbwWtEHThpSgv6xcYbufsIL19MLAqAsnZmRXdGMxXPpgGVeTw91PcLsXPPW3NmlOCeLKNNs9TxkgwlL7xlM74v44mybCx+6q6hmnyX9UAuYTc38uY84B7q7ldpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n/r1RmQz; arc=fail smtp.client-ip=52.101.48.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n/r1RmQz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPnmvBq7nS+w/hqUyO8ZGTwDPwnJoKWllC+W/vASsC1gpK/Ph3FRLP7DdwSLiWqoPUfRQRQHzHDV9YQ9qRasi7UpxeYv4+OlibKpFs/H1iVCqlrInL1AfOfwVIMp11Hm+IacJVJhCmDJ7xz7PyfUgE/Foyi9oaghJTrjHWAg6m/jRGcBRmBlVeDRmhRxHZQF8i865pJm7bbje9xHRYeTUSBCIwhdfx/VRKZbYXVanSgyHmhgeiMS8X6D2eXY6lUda5HwI+wQQjnZvryVgXuEb7wejiMasaxhEYphipZmzQvvj20nRWQCZc6ZOjwAFqFjliUE3orshH1/ilK2AFkoOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53NIa6WhkpyDRUY+LMQ1PMYugLN8SEALgQpIcuNHSWY=;
 b=eH9nL2bg3Jqh7zxxKhIT1sqG+GkxJmVvd+zA7+izas67/ONF6sb6oZORjq+2AJmevImSz1zFnZiuU3LFlg7YEaJCsF3pUdUwacqKPiAE9hZ7ZbzWM+KED3soOwtJ7gglwLVDZ3TlbF1BGVIEA5QZtxm/hEnjJ+DjVRfvWguXzF2rw+A8SdsZEUrHVUm0tTnWPZCG5ikIq6situL86JQboUVx0XJlPji/ZfXPDNQR2sbH5vwktYbITGwMlFW5I8IfuSSLo8caW12RVKHJrKFxhST4hczhEG1GCBr63Jeb67nOVR9WX/e4y22AXd9+u9OlicXo6PK7viiy6c1xECafHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53NIa6WhkpyDRUY+LMQ1PMYugLN8SEALgQpIcuNHSWY=;
 b=n/r1RmQzKLr3p2kKgUia99adKQxRau/cOjbaj9AqZZcH+JDz701vH71rgDor1+cm6uX6It43S7f5uvWwM1VadEjxkbV2k6MfAQsTVZYtUm9EzGtUggSBkbpHSaPh/EfGbuk1gbo2w75jWf9AdQxEyAiAaneCBt0kDvafAUdcGsW3iim/AT11gf397BgJbWzbEy2esmlZ6l0OYjSaRwaa8/NlacUdBxZXE8ek2w1rDp/9jQUawuCwQPnDU7noJCjflZmthpmsLZYRsXLfsJbgmxUraHrnEMWxVfxibidZcA7ekboX6W4+CbfSdymFW4ZiT/jd6c3hJGD5Emz2DSU8Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 11:21:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 11:21:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 20:21:08 +0900
Message-Id: <DGZ29HCV7469.TSJW6A4QSWJW@nvidia.com>
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
Subject: Re: [PATCH v6 06/34] gpu: nova-core: apply the one "use" item per
 line policy to commands.rs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-7-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-7-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P286CA0038.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4143:EE_
X-MS-Office365-Filtering-Correlation-Id: 2033de74-ca96-4bba-ee50-08de7e97229c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	ONMBbWFS+OOOfRhcoTS8CtF5Al+RGzOCqc1WPNVOQlvNE8+y5G/68df3lvitDefBEFgUrS8kx7WAiMN861jRuydPqptv3OLuLhtzZ8y0Th+s3Kj+JjWFi2xxbGUIInvyR2g4RsA2fw1y7oHpP5zSUghmc4OTPsFQoZUZ42H7JjyWVMFMY6l65/JlK8NrYKt1kJUW5rm3DPG/idW/PYyoQiS7UBobyxXY9UlkQbtIeVo/DFuxdXo3B0qys+7Pe42iIY+WwtatBGiFDP0B66DPYDBw8awi1qcpUJghGWmXrfvzBYWItfr56fQq6XkcPxRYwK4E27ws0DevnzajmCpjr3Nf8ZQebbCY7YA0ojSq5fjLZo31JEGH7gNQnu5JbqkDZugIJZjM/IuCIIVWM0lDlz8SkazUERSi5soD7KWSe8/1gbOoN3K9TvJL5pUAWRG1wgYuGsRLOqzo8WI5N+BIVP1xcZVgy7saLI+DR3gkRCOz6lgWAFOY0PAuN+2UOyEchQDSJtHodz77yVVVyjs+eawkMRMeHu/AeHB8Sr7IhYQM8dubUwlzh82rBOGJakRtVB9G+Ax3pJ3JAdfgmlC0SOCrg9dzwD5njVdVzzpMx8MVAcJkXbttV/NnuoYTPF1KBYSFYlw5IHxpiZ8KPt3xhKqwxzPphPMHnZAO0+rF5RzgiGpVVzXfUHc05XOyowYS+lDkvIpArELR3ntQltVZ7fPilvaPtSCYkxdLJsbueXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2VkOGJJT0hpZXpFczRCbWZDVEJIak50MkYrSW9YcXdoU1IwalVYdjdyU2J4?=
 =?utf-8?B?NU5FWVlOTzFueVhtSEpvdnM5M21EN2pMV25OMkQxckNwSksxVnExdUFRdFRK?=
 =?utf-8?B?eW1nNlFQWW5WSVY1eW1Hek5lRXFQWm1QQzFZa2R5WVpIeHlJOHNyV3NLVzlo?=
 =?utf-8?B?VTYwdWoxR042S2dLMWNwYTJjcTZLN1dENmlCNTZjMXZiU213VFFuWlZUdkVh?=
 =?utf-8?B?bEU4Q0J5K0F4ZDNNZHZJb3J6dkZ1ZDJIUmcrWnJYOHF0QU9WZGtXN2MyUE85?=
 =?utf-8?B?c3JOQUJScDhMSytrUllQdUlSQ294WUoyM25nVTliSUI4L0JZWjJNT2JtaUt0?=
 =?utf-8?B?L2tTUFp6Sm43czNhTDRQZEEweXhjMUxLRzI3OTgxQloxQVNDNnk2bFdMT1dS?=
 =?utf-8?B?OEI1Z1hjSXVTY1F4bFBNZzVXeXdyc3I0UzBCd2FqSTlvMnZvU3NrMHBmSERG?=
 =?utf-8?B?V0pzdXpnQzVQbFZyREdpVE9hRS9RenFzZnFwOTlVYSt6Uy9JUEU5dFRRcklI?=
 =?utf-8?B?aHVZcFd1Q25HZDQvbVVkMUYxT3VRLzk0NE9jbCtBOXV6QmVndG5HRGFOb3h2?=
 =?utf-8?B?UWxlT1lENndMUmVMR2JhejBSSUpyUUpNSTBWQi9lVnlwQjUxd0dIaFJxZTVE?=
 =?utf-8?B?NmRGc2JPNFJSTXlkU1RWcEZLQjc2MC9odk1hV2VQczdQdEl1TDhHLzJEMXJ4?=
 =?utf-8?B?QnFhRS91RGdRRnFMZlpDKytGYnAxa2srcEt3d0xpTlcvejJ6MmRWTHZ4cFoz?=
 =?utf-8?B?ZXA2WEhJZnFEdkEyWnJPcWNKUXpacTdnKzhOOWNCZVJGdDNETzdTUDlHZHg2?=
 =?utf-8?B?UjBNeGNYZWhvK3dhcW1ENzNraGhzUFkxOHBqZ1ZNZUZYemlWS1grTVZoZHNo?=
 =?utf-8?B?RHJJc0NsNi9ydU5LSUprd0JVVUFDek95NXNUMzEwTFdPOVZUaFNxYVBqaEhS?=
 =?utf-8?B?dVR1YUJERmJRcVlxbktlbGdqUmdKNHpBU3o3K2xOT21rT0t2b2F3WnBDN054?=
 =?utf-8?B?d3N2SDBTMXpHVTVIM0IwWWhkcnNQWnBVWFNNQStNSzhjcXZWZE9lZlNTSmQy?=
 =?utf-8?B?RkVWWVFtb25UcFd4U3VaMlRJNGg4UjAzM0ZScllFTE5KYlRGMG85VUNRQzlO?=
 =?utf-8?B?Q3gxVm1BT1pGaW5uQXprVGJmZUVoVU1kQ0xXQkFYOHBLN2tML2FsWjUycDBL?=
 =?utf-8?B?eC84Nm1WempSUy9Sa2MxS2FTSGtPRjhWSHNCc2IxbDR4RzZncFplRHhMNWlz?=
 =?utf-8?B?RnhFMWtqNEJUeDJXMVBGcm5iRGRoOFFiTDdJSVh0TC8xZ0RibC9Ha1piWExj?=
 =?utf-8?B?L2tjMWxSOUR5dndtYWVOb0phMkdXUWlQa3JsZzRpRmxkMFdTYnFvUGFjQ2Jq?=
 =?utf-8?B?VnkvNjNoREZ4OUpUekd0WUhYeGdlVlQwM2hpbDFmNmY3Vm8xQVBwclFER01i?=
 =?utf-8?B?bHE0WXhEN3QyMmlMenZwQjBsVXhLQVpDVWhsMXp6TWJyLzFGN1puOFk4d3Ez?=
 =?utf-8?B?SE9odjExWVNNcXRsZXdrc0hpVXBRVTVCby9uMFpwaytycWpPNFFIZ0ZTTS9E?=
 =?utf-8?B?WHUyQWtJYnoyWXFsN0RFZ1I2eHJYRG5YQ2d5d3oxUG96N1VmUFVMUTJWZjNs?=
 =?utf-8?B?MGVkUGMwaGVZZFpLNmlXaXQwWHJhY1pGOStUUUtyMFhyVjdkUVc5Uk15Vlc4?=
 =?utf-8?B?Uk1GM3p1bGhVeXdIbDFaMnVqY1V4WE1FYjFrRTJHMkJ3TUV6NGtNNDZRb3lG?=
 =?utf-8?B?WjJoNWIzU2RiNmV4MHhySUlCN2JLTTFReXB1MmtGUUtkd05Jb1pGaWVKOWFP?=
 =?utf-8?B?dnBCTm5OZEZjR3RHc2JGaTNFZ3BpYjhoVmxKWm5PYjRpSWdmUHhiaC9KMmFa?=
 =?utf-8?B?ZVg5dHBZRkl5ZVo0aGoxME5JS0hHaHhvNW5JeWJKL1ZJVWZ4Q1NYRTI2S1Vl?=
 =?utf-8?B?ZzlGclk1VXErN2lIeWhHOXpkQnhJeEJZK1VWUEZjbVE1a0FvVWVTOFphdUEr?=
 =?utf-8?B?TU82ckx5TW5BeHFiblNjM2tiZldsWHlsUmUyUEVzNE5MSFBpWkNmdDhpUmlY?=
 =?utf-8?B?Z1ZFSmRQL1o1eUdOWGR0c2F1Lzdsak9WZTFwUzBIVDAzaThteVhJT3UwQURS?=
 =?utf-8?B?THNURGp1ZytnUllGN1BnRlUxSGJMMVBTb2VaeFlvSUphZ1QvTnNxY3hleHoy?=
 =?utf-8?B?b2Q0V3lSUmZGLzUzVTloKzVXODB1LzdnbTFQYXVrNzhLNExIcEI0S09MbW1H?=
 =?utf-8?B?Vi9EdDhTZnkrNUdXNTVoVEpJZnJXbUZ6aFZFWmZ5cFZ2c09oVGE2cU0wUm5E?=
 =?utf-8?B?ZUJoZ1hxQ3RoZ09Nd2c0eWZTUTVXT3pwWlhUNGRSajhtOW1MdnpTcGtqd1V0?=
 =?utf-8?Q?twdjucdzZs+qAkrW5UcmJXxL+82AMPCRdtHegzI6yB8Pc?=
X-MS-Exchange-AntiSpam-MessageData-1: GcxbA6464yhm4A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2033de74-ca96-4bba-ee50-08de7e97229c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 11:21:12.0491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfPKuLnW/6dp0fF1ulF1csKaWz7JDz3JMOHtui8jbmqqNcrGc3lJ5Xfvc/PQRYaJh3cVaI2ZTkXShYQvoo1f7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143

On Tue Mar 10, 2026 at 11:10 AM JST, John Hubbard wrote:
> As per [1], we need one "use" item per line, in order to reduce merge
> conflicts. Furthermore, we need a trailing ", //" in order to tell
> rustfmt(1) to leave it alone.
>
> This does that for commands.rs, which is the only file in nova-core that
> has any remaining instances of the old style.
>
> [1] https://docs.kernel.org/rust/coding-guidelines.html#imports
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Applied to drm-rust-next, thanks! There is no reason to delay this fix.
