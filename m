Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011013.outbound.protection.outlook.com [40.93.194.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22413C3456;
	Wed, 25 Mar 2026 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436110; cv=fail; b=Xk3Q9h+oHrFFO6Cl6wD/jwc/IgCaF1QdyEZ2PA9mdNvbOTJ68eWA4sZrHDHNhRk3U7F+4J2gia6OZe0f3Yr4MSaU1zha52Pbkl2+U6NbOyEDFyi14JKaunuSkFpHaaqAxW7YmiYg3FfVxAHA4pvb9VsxREDQ8NHhSbPoqCGoBKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436110; c=relaxed/simple;
	bh=wX8U4wtwfNhxvF9BEBOdOy0ergn00BwBtTSKxp5QGC8=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=SSgy8+6yAZ0swO+yrshnVZGhXG3MlbiSbjoH573RBHsRGnETP61MwTxL5z7WAqOtocJO/B72S2sun9CUiSgnEw43lu3wcOIRvax0kNtBYmmQ8Og3kHNsBDt1x6gouhs+BP/inGxyzCCP8hY0vydN72qnDUqQnQAlGhj77RGpyRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D3e8L15s; arc=fail smtp.client-ip=40.93.194.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D3e8L15s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvunzoNCedrt7VxJTUkT1uJJHYafbMHSP/8ynDedcOOG+2FB0ZbQo5ZpzLIM28FDlABUloahkBAWjIsdBC903H+cJCL+ZJf8gbkxyMyFLt3R49E4hzv2Clr3Vl/tFV3vE96SW3L18W/+VYo6ayUASVtQ1GHCQ5f4GELrXr//LVgfGt2/ZZFVwBxHaPGBCi87KDnTMl7nZnKsOeLvAOZ8F/39D1XV5TWfWlPvC/eJW+g+2pSZJABfnrhHPEcd//vGL/pgnqznXqnwuMojgksVlBH4M5Oaalami7O0Tx4DvErN+cjmSwNAWWVak1cbFQlk/EJttGG9KB6s0Z825wzFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkY/obPRq47212ChYdwLoi+j64SNCvlnS2JN5wdk8UY=;
 b=mBmtlDB3lZPZ5nzB8LIrTiWkxk5TXlRoMaI1poP2UM1n3hTXN8as4YlofqEjrQ+GSyh/CBaBtoTBnuhfLj4PP6Lo6cOyu8guJku2BdMms7kPRo/SJLN5mHnUY0CvkW4ZE8LfvE5VGdaglYg/BGULzCtVvLIh6KQzCdipv4XBgd+A8DYz5/B2BESCl9Q0kaiTLOKISGGIy3A6DiN9DKRrJyzRa3rrKlJwwiGa+Aoatjmy1uY4P9H0XD+6LgEEDQAhp4a16PWw3a72LP1Oax8MRHhn3V3gwFFiSEpfbOm23+Aspd6w6whlmiPj0KKp6grlnkIjCKNQDTCmiGXcuJFlSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkY/obPRq47212ChYdwLoi+j64SNCvlnS2JN5wdk8UY=;
 b=D3e8L15szBJRAwp6kYq3s4Fvs0owy2ImkyudpjqoW6m2uu0AtVjIu78w3P7maV9cqVCYw0P5KL/9LiYfX7n3OGEUEqNVTBNHXpHTjUBx5kUlC9iagj25X3P/JeydPW2K1gPpwfiTeIPF9AOZXQBf4CkzUAHDjokPDzjymVHVoicvE58yosioFmPL3FjLCK8TsObnCOk1y1b83/3mQXLw3bjiKalrUVvzhGvf1OPVw/N33xGgDmtHanIEaeLc/LO80n70FnRa6UT5uef9d+Oukg+5vnf8Yaqr1jGSoYYxj9DlIaQAtuvM0wRrMTDU6lFBIbJPV5vNZhC8PRAPDNSKRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7291.namprd12.prod.outlook.com (2603:10b6:930:54::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:53:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 10:53:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW
 boot waiting
From: Alexandre Courbot <acourbot@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20260325035242.368661-7-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-7-jhubbard@nvidia.com>
Date: Wed, 25 Mar 2026 19:53:41 +0900
Message-Id: <177443602197.105362.14648260973264175300.b4-review@b4>
X-Mailer: b4 0.15.0
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: ccdd641c-9b5b-4416-8f4c-08de8a5ccd8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	f2V0n13AwXKnyVi9SX7RHhZIcVLrjaEjC/I9MVY1omDOhfYLZPuN7rwLyAEomvcjG95o9W60O49iYfukVKK+l0m++crpYbg4FHxyydH1yyxFYngB93/lkEwYLA+QUB3aXyvTRJvrtaxpkFdj7kwcyq1y2LdtM+Iv4Lo3Fs1AdNFzuQe1iDQicD6XwOXSy5g7ONtkDXd3GypvNdF6r8P0lbURdO1HpdowJwJsq6svOMcudrdsQoAjB6U+Hk9jEb16Ub7QGNuMPRl0jsTippWisNQvLIYEtnEcg7N9Ke9lWm9YdAQC5R8C8IJimHgWtASnyW2dv//QynGgoqOBupTxm1hjiMPDWvfM/6j1Zdyl+d73kwHO3GDu9HiXVQs8lVdazArk5FJtRjnkR5Fm5Jsbpitx64qEDGHtJsZFcAdYbjiY+DEJvX0Jw+YKIXar4mgqJ4KvzNjAXJRm6485ONNEksgtCB6gyK753KAXczxXue3LguDcZviZklcUWtoRE73lSjqS6Ia2Pv42OiSP6Rz9pakJx1QDWcXqTyeI8S0qZoYDd9BK7Cuk++XcqQZt9PhGhIvHTFF3PhtzfZkraG31KpblHZ2i6vyfmTSN1/HpSBHUPWO3t/61skeJkyO7IL7cgkmEDX7MBG9MWV1HsvrIiWemubdhZQg2lBIApgh0EXbskH8Zs1lF883bbkMyLDhSK8Q9JiNWNu4Ygj6MmvBEwTdhK/fR7ikAmGtk03YtZVI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE5ZMldMUVFvS1pkSjNxVnhiVU1JT202am4vemJ6b2Q0U1ltUTRzaFhncS9Y?=
 =?utf-8?B?am5zQWViWTdNWEsvZUJEOGVrY1ZyMW5KdjFpSWFWOTNoc2F1U1pTK0hFYWhl?=
 =?utf-8?B?aFJMRCt5eUNKeUo4Q2k5OGdYbEkwYktlazFXRGhhUGZGOElMU2MraEpRMTZs?=
 =?utf-8?B?Vi9oaGFBQXVvcTZBNE1PVEFqOGp5a2tFVUFvdVJJajdLcHNhWlJHTW4zbGVV?=
 =?utf-8?B?cjlrNkpoYU9uK0h2VGY1NnpOSDBnZ1hOS0V4c2hqZ0ZsZ2ppVFJVdnpXL3FI?=
 =?utf-8?B?eDJzTjR6ZHFxN3RaVGk2ZklsM3k1aDdKdWxhSHl1RGVvR1ptZUMyazlKVTF6?=
 =?utf-8?B?VXhVcU5mTDV3RTlhVWlXK2RlSzBPN0N2K3JwQ3ZnazljVm5oR09LSjk1b3ky?=
 =?utf-8?B?b3c0ckRwdkh6VW9yOHJhblFPVHNxL3ZIdXByd05JRk1wMDFtSElJMDNTRDY4?=
 =?utf-8?B?Ulc3ckYzSlljM0hWRjVVS2xDMjhnWDJRWWFMZlUxYlZOM0NMb3hpUGEzcXBq?=
 =?utf-8?B?OUFYdGh0djN2R2szTnZGcUVveUd2bVNBVkZ2UTlFUnRyK1JPOGlBVGJPUTZw?=
 =?utf-8?B?dC9GdWdqRjNoUStFTStWL2wxdXFmdDRlWStPODJHVUNURTdMYnZGaHQvMWxE?=
 =?utf-8?B?djVGUGtWeDlUTVVzTzFKYUxFWCs4SE5EVE43clNXQUxXcXZvNnBDeDUrQW4x?=
 =?utf-8?B?VGJBbW5Kck02d0tMZEJVSW1JNnNlTS9meWFRSWh6SGVnbThtRjBhNHBNV2Va?=
 =?utf-8?B?eS9XQ093M2dla1p1MXZ6bUV3TlJPS3VmRDFpUFFmNzhGL3pHcXp5cnlnQmVZ?=
 =?utf-8?B?TTBhMDg5dVRDR1JLOHQ5cVFPY1ZHMVlZeVBMazMreU5aQ2MxZUpiU2dqZGZw?=
 =?utf-8?B?UVdnc1ZqaTJlQkV1RjJjMURibDZhWHpONWEwZjJIbzNEbzhjREh3dTRrWlFj?=
 =?utf-8?B?aGdpaHVVZXRTU0U3VGRyVmJta2VDUy9TVmFUSVQ0Uld0ZnlwSUJFRFBKQzRG?=
 =?utf-8?B?WGpPb2V2UUUvWVROZENHZ2orT3V2dWVwS2EyT0RWTkdnTjc2QmpNTDJFSUNT?=
 =?utf-8?B?aTl3VXUrdTlYbVF2RUpWYzByL0VKd2htejQzMWo3OWhiaUkxNklDSGlpb052?=
 =?utf-8?B?MndTc241bmNiQS80eEQvQVhySlNrVytIVGxOaFk5cjlPZExxbytDSWNaR25W?=
 =?utf-8?B?SURtNkhPN1Z2dHI0MWFXTHQvdWN2V2hzaWpSblFKU3VRdDhrYWdpS05EZnpD?=
 =?utf-8?B?NDluTldKcnhFMGFiakNVYWQwZklBNUc4UXRwNGUycmJtcHhwTVJiRmR6WTVs?=
 =?utf-8?B?MWZCM05VNm1iVmpOUTZmMEZWUURkWmYvQkdXZllxN1VYL0JFcFRnamdNQjJ0?=
 =?utf-8?B?SVpTZlBLMkZ2VG5WeGoydFJsTDd5b2RMZkh1cSt1YWZjWTJtbkpzeHV2ekQr?=
 =?utf-8?B?MHhRY2JjNUJXY2p2aGJHRm94dlFRQmdoWDE0cE5WK1AzSjhEQ1ZKOE0rVVVL?=
 =?utf-8?B?ZVJrOUhhRVQvbHZUWnAyR1dRUE9rYnhkYm5PWForbUdNcGdGa3JZTHFVMmtU?=
 =?utf-8?B?OVdPTkd3UzNGZ3NhdzRGaW5iOTAxZHRNbFJMSHFkTDloeUdsckJwSEh2UFJw?=
 =?utf-8?B?bk1Gdncwc0lmcVNyblRJTnA1UEhnTFFZYW9xaHBwK2NzL3FLMFRrOWxCVzdh?=
 =?utf-8?B?Q2VUUSs0ZlZLeW4zbVRBcUxGWXM0V3RTVkhtOEoyTmtNTS9kVms4V2FrZ0lz?=
 =?utf-8?B?dFFOUjI4eTk3NWRjUGpkdVZ6dlhHWHlCREw2STBibzB5aGNObkpiakJkS1ZO?=
 =?utf-8?B?NTE5MDBRL2NXZ25vZzFPbVNEVis4UHBZVThIUjlyczdyT1MyV2V4dUVpVnhW?=
 =?utf-8?B?djk3a0lDQURTdkg1UFo1MnY4aE4rdlBab1Npdk9SKy9hcFVaT3ZLK3UwZGhp?=
 =?utf-8?B?VE5WZkFrbElRYTJPWElxNTZKdlYzd2lhbGVsUWN2U3ZUQnExSVd3Q29sbWpL?=
 =?utf-8?B?bnJzTWo3T0VobmUrRXE5cjRJM3VlSDBSVHhkaVdYZjcrV0JwVUJXZGhZYTMx?=
 =?utf-8?B?NWhxV21MYVhDOCtDQ1l5T3VOVFRzK0owcjF2OUxZYlREVDJjYWRDSU5oMUJ4?=
 =?utf-8?B?ZzFWNitsS3ZJbzNNOGU3b05OZVV1OTJlOVdRdE1oRTBPMlZoa1lvN2V0K2tw?=
 =?utf-8?B?c3VNZm5IUkF3dGVJemt2SVo0UWJzemJyekJTOXNKVk16NG15TTNrSDFkdCtn?=
 =?utf-8?B?eFRNZERaTk5wZ1NLVHhaR0VJdGRhcnNJdWEvREpTRmd5WGE3OXRVTGpWTEZE?=
 =?utf-8?B?UklhZlg1TzY1RXZRNWpJYllMU3hEeEN0WU9IT3ZiSUluRTRDcmNMeXRDc2Jn?=
 =?utf-8?Q?jFpcLHuWgNmTE1J8S0h6DXQYP40KfiuzsI59IMOlLYPyJ?=
X-MS-Exchange-AntiSpam-MessageData-1: 1ltyMZnozyzU5w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccdd641c-9b5b-4416-8f4c-08de8a5ccd8b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:53:52.6084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0RJea7zAd42OAHFPeiUzA1CeGEjSiSHNcZewrNerIZgUtRr3rzxaIL3fSeMHm0RAZIog/asYoxwEOLFp+yXmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7291

On Tue, 24 Mar 2026 20:52:17 -0700, John Hubbard <jhubbard@nvidia.com> wrote:
> diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
> new file mode 100644
> index 000000000000..2f9e18e67a35
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gpu/hal.rs
> @@ -0,0 +1,42 @@
> [ ... skip 18 lines ... ]
> +struct Tu102;
> +struct Gh100;
> +
> +impl GpuHal for Tu102 {
> +    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
> +        gfw::wait_gfw_boot_completion(bar)

My suggestion was to move the body of `gfw::wait_gfw_boot_completion`
here and remove the `gfw` module entirely. But let's do that as a
follow-up.

-- 
Alexandre Courbot <acourbot@nvidia.com>
