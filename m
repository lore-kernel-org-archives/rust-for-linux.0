Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020130.outbound.protection.outlook.com [52.101.195.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6632B1C84A2;
	Wed, 30 Sep 2026 15:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782715; cv=fail; b=mfZvrlDISC8yYF2ARz38KT/VTCn9NDxjgFtVxdyA+Css0TL89bU6Si08FbwUeUr644CoN+hQBy/mWwBO56NodEZGVkbHnKB0c6zTbKdOnI6Xmf3tDEorX2IdEG4Ggr6qNQqGmw+AsP+RAhBlayHpbUW1EtzS+g92sNWYuB8xln4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782715; c=relaxed/simple;
	bh=gSfHm2qx/nAC1KgHpywk/WymlsSN31xLuIjtMr4yA5s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ZL3HUAyWTBCAvT4Z7eOILkRCWs9sy/pditlJ4W/JnVyl69nN2wUpJ0v/FzkU7QggeqCGs1lnPlMLcgP53tWNY8fXMCvgEoeCeRFJdt7OaM0Ar37oY9oMCJu6QpnUMOD/btny3anSldwZscQzNUf63Lrow0HyJOn3LWsuHWTPp6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CCaPPeAR; arc=fail smtp.client-ip=52.101.195.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CCaPPeAR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zj/SYGrESRiguoxeORvbvEF1W7bJcVZJe3e6X2tHLQeryfkLPJIIc641DXomtREfHX2tAaChrEQ/jAWQu5pVeTgZj3IaGy4FDL0gyx/p12xdJm2IPNDahUa/fzA+7E1CksIAjGQPPT5IilzleZ0gT7Hy3pbxEw4e16vxNTIPe+DkR5OVeQzTt2Xoh6A259N9GxN6QndCmsKxdhW4dlRWt8XXkyo2Heg7hqoq878MJ5Yn3Ni8FYty9dCgCDIMEh5+UkfwwintpX+KCjwuGRbEZDB6QwDwSwVGrVCGWd9o1krTC6DZfDP/kBA4XaJjh7E80/KJR0unQLDx8SLMQkT98A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJ25spxMi654kZIrGnKUggCeaEZ4wxdvxYNm79rjWaw=;
 b=XiUY+SI+ulzQUi6jkXpxoq/qnGzglR3lrGsnbvojugycVzptlh+/VFp92JGwaiBeYnJe8VK7LYCAVjYKOditGKdbeAQZ8TKEAGPZulfwOPdXhxm0lP52q4jHzRn5OP66QQ1D2c+d+IItVu0PW7Y7/7it+wkH+7nGvaR3JJqXjeDsPzpX9ZQoWULwwhBmkwikbntVuFSDr7rVUc+Tha+MkK9Sj4DUPGLabZ4hbmSlukobyX3g2LjYJzJVPh6uIuzfIBUjHCTCjhKQE53TzO0OKtNqgxOVqHcMsMKivKDmAy8cRPc5E0E2Xt2v892ALS2rrK0Yx0OHwpuEMq7bkI217A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJ25spxMi654kZIrGnKUggCeaEZ4wxdvxYNm79rjWaw=;
 b=CCaPPeARvIWtE4/6UyVPf+3oK/7O0PCofx5xoRnrueSKAoyACOQLOHLqczseVxHgaMplVBgCvepW/2V+cx0siWtH6lar+GneaaqH3q6Qa+MkRR2JvbFfzRvd0fDwUpaOH+GppCsWY8YXLnX6hsBJEoVOMpRSz/Jx4Z8j9acAIBc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LNXP265MB2428.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:137::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 15:38:27 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 15:38:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 16:38:27 +0100
Message-Id: <DLSRHMIM794A.31RWT94783D97@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] rust: pin-init: upstream synchronization for 7.4
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20260928-dev-pin-init-sync-v1-0-e591c8e9cf0e@garyguo.net>
In-Reply-To: <20260928-dev-pin-init-sync-v1-0-e591c8e9cf0e@garyguo.net>
X-ClientProxiedBy: LO4P123CA0418.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::9) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LNXP265MB2428:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa5a0b2-f238-447e-0273-08df1f08df55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|376014|366016|1800799024|7416014|921020|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VJbFOEBFpiqUICKuByQxwp4UrAGpaN5ndECS/knxkkxDJymtlBtJIPqf7x/1BiMzjjLEb3dhLGOZSP6eQ9z3CTSRiOefUjsOsho0zXOHjYC7pvXzgzb/qsZg518RrJyxSP8kpkJiVO5z7euJgzPSwEGLDILTCTLjOpMY39iERGjJw8ou8mwh+0J3uRJz3wp6Td6C/UKzcqP0NOziFpPcnDUeXMRiY6GiPbm1xVD5kcupBT07iu3M/V2PVWJJA1GT1YEGwqfWw5cUYAT7B1cd1vJRpFMswMwrJ+G67pbPLsyZh5FsXZjdL/H15xG41gzM/QDIDsg/q9/ICfNUXkB5M2rFdDgdOWx16sR5cQCwDk6iQPG5lSHZ1pvESUUD6Xut8cxX9+3jI8uTTxPpvH52g1TiVYm/yEjgKuDcshMVj4CSuOa5zLeYsN3kcM10cAHaBHRp5Ll9QltnDIR6os/e0sqMPKt+u+n/A4LSP6yUq9UVdJkTn0k+XkHxamFBIx//jJ/DG73dPwdzTBhoRcoLoNiBzytFhqL37b1b5jJEhYPQjW3pfEPGMWdWAaiT7rheNTMiW/DmPvw07REaHDrhmflXPNdGqCVFGz8CatIIEwey4qDhr93nl6Q5/JVBEp4z9+YTF3/muXP8r9jGKvSKVS2vyDjQJnHuCzQ5I3308tKgpVcN5v+o+mz4deyqstWkYNXdEqzsX/RPg0DPoeoRrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(366016)(1800799024)(7416014)(921020)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3I3Q3F3SGRrS2NaZlNVZlhNRjFpVlR3eG15ZWtvWHFYNGZCV2RrcGZJdU45?=
 =?utf-8?B?YlJJSnJsbXp2dUdxQVRaeThGaGNlQ2I3ZHlxWnFVZm9WZEIveVI3MU1DNkVj?=
 =?utf-8?B?ajlWZjJGNzFLeE5Ha0hCS21oQkdtN2RNcUVKZFYwdmkxNDdRcjZhYnlOSnVw?=
 =?utf-8?B?RllmcVEwY01mRXRPRDk5NzJ6N3Y5VDkrQy9LR3V6b2VnM1lLdG5pc1E1RjA4?=
 =?utf-8?B?cE52ZlJTNkF3VXllT1lTazVqd0QzYk1McFJTRDlUdlc5OXFtam12amllWllL?=
 =?utf-8?B?QTA1VzlXQzFNSDFoVTFyMXhXYi9tSDBnbjhlWGJLeXIwQjlzcERmUHFqRVF3?=
 =?utf-8?B?c3dFTDJlM000VnRGSE1MenlXQVJ3ZENMRGNNSXQ5WVdqY1RGaTNTdGhoUW5P?=
 =?utf-8?B?UHJpYzVPRSs3RTduc3FlWUI3eklHc3pJYy9ydTB6Y0R1NElZSlpoQUdTdTl4?=
 =?utf-8?B?bDhYaDhxVzV0elAreElLK3V3eGhnQmowVVZ0dkVqN0d2RWIzSEhET253M1FF?=
 =?utf-8?B?L3VQd0JwMU1TN2hMeEdSQVlLOGdvbTN4TzlKazVockIxVEFsUkl3c0lNak4v?=
 =?utf-8?B?bXVFZGJnb3BpUDhGQ0FaYXpCOGd1Q21QRE1YMHlFak5kL3R1Ym9nMXNubEhC?=
 =?utf-8?B?ZERIckhhTmVCZzdyTnVlaEFLVDZIcExzODFNdEU0cnc5NFI0U09ac0d4ZEZE?=
 =?utf-8?B?Z2QxWTR6WHBuYlQxRzliL016RW9NN1ViNUNWR2FQSnNkSktxQWlHbGNkTEFN?=
 =?utf-8?B?OVNjVGNmdUdNUjk0aCtDbkxUUGc0bFB6NHNEenBhNjRBZmdmc3VlM2hBSzFZ?=
 =?utf-8?B?WTNidmtSUjY3YmpYaHJmSEFxM1U4ZXdTR2pDTFJxTlZJOTl5ZVhSUXdheGFN?=
 =?utf-8?B?VlZBZnU1RHlDdDlFMWQ2Y2JHOXFyMS9NYkJqOVYyMXgxMWVXSml6SFdhRkhF?=
 =?utf-8?B?S2pqK2ZzNU1CaCtMUTdNbklBSU5tUVZ0LzVsWjlFd3N4V0hYRlQyQy81aXdl?=
 =?utf-8?B?RWNHNE1ISGpFK1lHRm13ZFB0bnJWUlplRFEvRjV3OXM5RmYyaE8zSHhpamEv?=
 =?utf-8?B?d3J0UWR1OVNxRE5sbWhCRjRmNTdFallEVk1KSDFJcXhhRzhpOGZxY3cvdCt2?=
 =?utf-8?B?cVJHYzdrd25jYVNoWHhUVUZRYXVsbkpqekJHNllNVUI1bENLejFGR0s4cG1q?=
 =?utf-8?B?eW5yNEFCWE1jVXZnUmR2WHQ1YUlBS202ZEppU0lmeWluYm1RN1Z0ejk2QzZS?=
 =?utf-8?B?ekVSQXBuUThnOFE1WHJkamtITW9yNjc0RjJOeTVjWTdiN0luakwyMWNSc2ZJ?=
 =?utf-8?B?SUN4MXlDaWNoYXluSU9BeDNnaWJqSWN5WHRaYit0WUZMTXFsZmhablcvOGNy?=
 =?utf-8?B?SzJVd2ozNEQwc2Y5QlNWNnFidHMzRTNCSkZKZHJzK2ZEeW5ZTk1SdFBqcHNC?=
 =?utf-8?B?bDZPTmlYRzk1ZWNZSEZ6ckRQbWxvNDFvNWtTV0pHYm1ITnI5T0pqTDVIUmgv?=
 =?utf-8?B?ZERkNkRmbUZQWHp4T2piaTVxT0hWVnlCQ2wzVmdSZWIzdlNZVXJqYm1nMVhk?=
 =?utf-8?B?c0YxeHc2eEx3TXdFb0dpOGdkeVhnL3VNWHUzNXIzS3RwWnZ1Qk5oUnNKYWhN?=
 =?utf-8?B?MWdsQzdua0NLaUJiRE5ZMnZMV2h4THFFZS85dnhueUJnTDl1dFJJcGg5UGV5?=
 =?utf-8?B?K2FIdEFRVUFYb0NpS3dPZU5uT014RXBwMHRBK3FneU1PRnRMMTBCbTIzQWNG?=
 =?utf-8?B?QU1lUExrWURZd01MVlN2M29lNmNmeXhiR2xJVzI2b0pZTjljQlpvNlBEbHZH?=
 =?utf-8?B?OWhQaitMVGlkcG5oVzltcW1ZVzJacjdrTXU5WkNWMFY3Vk81OEdPRmFUMkFI?=
 =?utf-8?B?dWhkanc5MVNNMGVhc3lGb2tOU0dxTDJHd2RLUUtEMUJtbEhEUXRZeUxiVFQr?=
 =?utf-8?B?MnNWZUdKRVZhcG5HNUdEVFBZMnlmZnQ1U2hxUzVaUi9FV0x5UXZIek9zQkZC?=
 =?utf-8?B?OExoU2VibGJDbUYvbDZJNTNoVmtqcGJDVDU2Q0dXMElMYm0zUXByYUJHVWE0?=
 =?utf-8?B?TlVYdEFEK2pHVUo5OUlNd2k0eEJNWTdmVmhyYytKeGR0dGVkKzBTWEtaOVlV?=
 =?utf-8?B?bUp1bVB1dTJETXFYWk9WTUUrU3diTUNScFhXcW5HUm1wbVhLL1hWYkpONkV0?=
 =?utf-8?B?QURmUGtzSnNzNW41WHF3dnlhazdCdWVFUVc4dFZTTTJXeDZMamNmKzRNcnFY?=
 =?utf-8?B?bUREb1BTMkppbGM5dEhING9jekNWTkE3NnluNFAvTHp2K21hTTFBUFE5RWZQ?=
 =?utf-8?B?ODlHNUpuRmg1bTBYaTA5QWljalMyZXZVV1dvS0piZWlabkwvbEZCQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa5a0b2-f238-447e-0273-08df1f08df55
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:38:27.7889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrK2yFHxjGCzDxvhAO+tEpUYcYWbihzZgpgrug/PjHetgUI11DKWCPYkPkSrRduqDCZWhYEKsx5obdDM+of2pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2428

On Mon Sep 28, 2026 at 6:32 PM BST, Gary Guo wrote:
> This sync series contain two upstream PRs:
>
> - Several additional diagnostics improvements
>   https://github.com/Rust-for-Linux/pin-init/pull/179
>
> - internal: init: allow reborrow of Pin<&mut T> bindings
>   https://github.com/Rust-for-Linux/pin-init/pull/180
>
> The upstream PRs have test suites coverage which is not part of the kerne=
l
> tree. Reviews/testings are welcome from either GitHub or the mailing list=
.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> Gary Guo (3):
>       rust: pin-init: internal: init: allow reborrow of `Pin<&mut T>` bin=
dings
>       rust: pin-init: internal: init: improve diagnostics from field chec=
ks
>       rust: pin-init: internal: init: use span of `<-` or `:` for the ini=
t/write call.

Applied to pin-init-next. Thanks all!

Best,
Gary

>
>  rust/pin-init/internal/src/init.rs | 106 +++++++++++++++++++++++++------=
------
>  1 file changed, 71 insertions(+), 35 deletions(-)
> ---
> base-commit: 95593ed3616194c9498cc190cd1a3693ff4bca37
> change-id: 20260928-dev-pin-init-sync-93e81b019c3c
>
> Best regards,
> -- =20
> Gary Guo <gary@garyguo.net>


