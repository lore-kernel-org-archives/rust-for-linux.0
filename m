Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65C755931D;
	Tue, 22 Sep 2026 15:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089484; cv=fail; b=RVQ4OB3pnhsCmYzZj6SDUSKNXFZnzty2hhYX1D6rwaJxPI36z4e07xXZioNiMgQ1xP2+qdlaaOHL4PGJzVR74fn6f3hfq4FaoI60Dnkx+OTyK987YsVn3MX0xYdTaWNHJwUpPyQrs4x4ylaJJwAuXVgRSsu32/7Kr7WFsDgI1MY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089484; c=relaxed/simple;
	bh=9ERhGYvaWnlFS0x/TDpjmolEOI5jp2MMh/3lrwNXPC4=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=LYNKwS5FqZl3uwE+2roDm6thftLAJpC3cg9OkT74xvwpG8bRgD/tg9kahXafCtXoWEgGQQBLYmyGGsAKJo45m6Ei9CoiLpwAU5KgwsSFWnignIiT6S/cUgdFcocE4pFJ9rXmgqwJb3bpKdI7qy0ycUUkPAMY/4l5cW9Utf9BNXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DMKQwUDr; arc=fail smtp.client-ip=52.101.62.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DMKQwUDr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVvds0PgGowd+NeQ/U3GQcOG/UAMlwrWiKOsWe5ZjGEpxzqsN+k6teEvKn3x99RuCU7ovCPQy3DOvcKymnRRYXu1rmy/oIVI+czYXdrZ7e5y7BBaYzDKMzd9IY2mNljCw+rZ123qXbwrv7fSOBGTs6XjMI7xKxp8f066o+2lF+82fvDpN+3OpVhO0wI5JaRQFipnEDeiwO99iHpYfnZiYSzsge++rgdE2VqN9/zuv/yT9dOoIumukqBozgbFI65GkFA4ME8C+s6dh6Q5sGKdaeh7z3yB23JVjZujgcDNYS1ABMOqNq0pqjJhiBtk9UJ96wBXgMi7obPKE3wX8LClAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RrOcBvME7v6f82zHOht26Mfw3oiy/01W9aSkwA2vQw=;
 b=mgPXVk6KADFD/xg3KZ7+DqxwO/FsPuXQAgqgTVtfbQUlDDry6zxsTR0CX0VNqH2FIUCiyL2EBzlQoWRJfur6/dTcANLdNdXmJBTq6/ZNpGhKHk/o+ba54FyiBrBlFwenoTveQW+TMWmAFF4jLWZTWJfdnrBn2Ij5bn+oI9abFQW+yYmJup9BrKdhs7Vk1JyNk5GUoEsfP0nu7Ny6eMEp2KiRK7v0ADy4B99tQuOGvPXnjZ3uyTK2ncHxYrP78ZC1qLd2GQp9ytIVlsXCdEeuUTa6IFrsuCL3t7O9/CPxh08U0yx8A+3wdQfC8QdsCyWme4r8lQ15Jvfw1CduBtc4Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RrOcBvME7v6f82zHOht26Mfw3oiy/01W9aSkwA2vQw=;
 b=DMKQwUDrSYufmHMquButyhw4sof33D14lzWmVWRkJZxOzDRi3pk0FrasB6NUjAyJch03eAbgn34PnxBbkHzC/7fm0lYOSol404oLfqXqmBHsG2CQiDRsXZpZZl1HAWwjn/I6wODly+uNInck9g+PmBao6VSWu4aPSQYoZosGSDn8ROYFqXpiSKh34NuPVUgJiseJUBlZWA7p6xyZsG+1kHZAgDvIT/u1R+QhkHm5yVuMQK2stZdpdpBOL0ZiVNDXyuAzqazeRSINnUc6ZDf95WL8yAMuU0hzQW2wyd2EeFJxM+1Qz37vJN+XQxn6YP6X583Dam/SlsA7c1CTo0EVKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH7PR12MB7188.namprd12.prod.outlook.com (2603:10b6:510:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 15:04:26 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 15:04:25 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 00:04:22 +0900
Message-Id: <DLLXR6CQZ78C.2LLHVA9ITM040@nvidia.com>
To: "Younes Akhouayri via B4 Relay" <devnull+git.younes.io@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>
Cc: <git@younes.io>, "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] rust: num: document why Integer is sealed
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260916-docs-rust-num-integer-sealing-safety-v3-1-00f950426c85@younes.io>
In-Reply-To: <20260916-docs-rust-num-integer-sealing-safety-v3-1-00f950426c85@younes.io>
X-ClientProxiedBy: TYCP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH7PR12MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0e0053-e0fc-47f4-e88e-08df18baca94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10070799003|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	e0g9zJSfbDlSd15VQ2sZUS0uC5SwBoAzAsmQAzgmCPTN8xl8KlX8rrsal6h0Mv2gUIoF13fbwKEDkV5/rUcG2tvfcfy1EnrJ7FUsMi4BA2kCrDl9HXVyxBnCI/IJend8YKYBtWx+Txi4cetuhAFU9V6bpjoaN3wqXer410xJlY9hB78/HihiSMkflFOSPyC4SMSIJFFoa1qO/duSZJH81lglnSKTViAGHaEaURtTiNbYdEuAlKvsKipYhxbl/+UlsfDMO95aoAsMFxUfZlARxjNSGdrKALHbSfyO0MRb2ev9mgjvWskIfl0AJyFLQGWwkrT70jN6BoWCBtZwJ42WdQ6LNZW+7ITkRfaEj3s56WOZ1XplUeJEbAaoTxA8G5w2ZyyZXgO5kgEaxg5yv9++1DYG5CVTSTfIzXES4vGBcV6ugZQkUhuP6T4mm+HdEUsfPO3f57pLWHB2dENTaDtETCV1lq97kXJg/BoaAc3Vmzh4x9sALDvEEk4dgBaCPqa3ZbiqoIHF9KzgLIyN9rqQE/2Xws0mq401zBk1ikcLSJyoGAoXkRXBXrW5rlMNrp8kSBEgQr0RltaJ8YLbITft495o/khAtK4Pbt0gu/B3AaJfgV+QIYy6kf/J5vPwQVCjq8gVaCa4LguHw7HO6rBYrYVdyWhmgVIEM9nTZi52FWI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10070799003)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1pyR1dTeUV4SXRrZlA4ZjJVNXp4OWJocHV3ZGorZWZYK2RwRTNDK3lWOUFE?=
 =?utf-8?B?WnFaOXFXS0xKSFQ5ajlSM2YvYmtVc2J5VUF3YUpGM3dBdGc0bTVHN01laXpZ?=
 =?utf-8?B?MzN1aXErcFFPc00vM1pzdWlDWk9reGw4K0VhdGV4ZHlEUktjQmp2OHBTYWxy?=
 =?utf-8?B?b2RKaWNOZkZyOW9DM0VjNTdOOFJURVRPSTJKNlJmbmxLYkVqVnhXa29sUFF1?=
 =?utf-8?B?MC9MZ2t5c3VyRVM1WUlXRHdvZVAybTZyQ2VJTmVyRE4xNjRMNFJ4WjhUd0Fx?=
 =?utf-8?B?OHVvbWlGKzU2bE55UW1MT1JmY1ZtTzBLYWNWVzRCSjZVWW5YUXRQY2xWT21u?=
 =?utf-8?B?OVgrU0ZBZWc0VVRDdGgwTWNLVnhwV0lNSE5IdVRPbUJVTFEzckRiVzNFSXRV?=
 =?utf-8?B?K2pMclVmSEgrT2hKN0MxYXBGTWZwTHlOa1hwY2cyL1Y5aFRXNEtCRDN0TXBY?=
 =?utf-8?B?K0tScERnZzNtRG9jZ1hWZGhOWmxrNUFHamlHT0dKK055ZEFDeTUwT2JyTUFD?=
 =?utf-8?B?YVYvRkJpaVNVdFhoaVBFVGY1aDU1U20zVXNJekFzckdDempHZVEvb2pGcTJw?=
 =?utf-8?B?YkczY1h1bE16aHI5WjE2dGQ1S0phaGw0aHhkaHUwdmZpL1RQdUJibWgycGxN?=
 =?utf-8?B?ZlArT2xFL2RSM3RyaUU5YzBDckREL2t4SXJpUW9ycnpIVW02U09jWmtjUVFv?=
 =?utf-8?B?NysxUFE1V2sycDFqWXQvODg3VFJSR0FLaFpraHNVaTRNa1NIbStWRm1USkNC?=
 =?utf-8?B?MjRoaEV5QnR0Tk1YSnhpblE4WURIWDNlbWxORWR2VTAvNlRFcjQvVm1adGxJ?=
 =?utf-8?B?U0d3bVdJbjI2cUJrK2FIRUlVa0NIUjJqSHdXZVJTeE43ZEZwZFZsMDhndldM?=
 =?utf-8?B?NDI1STFXbE5HVFl3dUovVG9nVUFJNXYxQVB1eUdESHJtY0E5S2xMQU1Gc1dn?=
 =?utf-8?B?cGJTeGdxbmdqNmlNaDJBUndjQ0ZSaWZiNFlyN1NjSERqU1dEK3lsWGpodDNq?=
 =?utf-8?B?OGhuTzdPY3VBQkJJV3BaaksrWnk0ZzBXR1NSa1daeEdWUWU2YThBV205YWUz?=
 =?utf-8?B?YXd4bG5oeEREQ1hTWHpuTmNkamM3RDZtSUtNNHBWYWE5S3lkWXdOckVXaVQr?=
 =?utf-8?B?dVROZDdnL25ocTJzczRObW9VQVRnTXRCNE9rK0Nsb3hGcFBRV2VPaHp6dy9r?=
 =?utf-8?B?L3RhL1hnbElYNTJld2dvNTN5ZmhObTNGVlVqNWlXTW82RFNyUFE4Yno2ZExW?=
 =?utf-8?B?dlVHM2RmelpGOHlQV0xQZk5ORFdpcFY4VHBsckhRanVMRXhLbmYwcSs3SHdV?=
 =?utf-8?B?UGlyNTBFc21veWRNWmN3R3BkY2VhcE9leVNla3V3clAwWG51ZUN2MVYxcHJk?=
 =?utf-8?B?VFBDL2xMaExEeklXSkJBbXNrcUltZXdWeWZoR1ovdDVnVlFTQkJrZ3lxMXBI?=
 =?utf-8?B?NE80MTlLNGd5T1lCWmQzSjVBeFF0SExweHZPNGJUdkM0QUFGaUlMVzRZbmpU?=
 =?utf-8?B?MFFvaldtZ3ZDWmdoTU5nWUwvVTJrd1hKb2tKaUV0VXFkZXBDTEszNU42ejNm?=
 =?utf-8?B?WnJVNkpjLzdJZHhlVGFFOGdNWGs1eng5ZEhUQ3hFNk5pZml6RWVZTG50dUtJ?=
 =?utf-8?B?Ym9vRlIrQ0p0R3ZpVmowTnV1VnFncVJJdnl0RWdWTXhta1VBQnNybUNqbWE2?=
 =?utf-8?B?UFpMa08zaG1UbWRZQ1J4dFBYRXQvNnVQaUl2anc1OTI2SCtBSHMwaFhtMnJB?=
 =?utf-8?B?NDUxRk5obDczQnJEOGlQK01HRHFtZlBaVUMyNjBzVU4relRISjZQRWZtK1Qr?=
 =?utf-8?B?THdYNGdYTFJ0SmNzZXhVU3NEb3ZmL3Y1S00xak4vcEVXQVlMQmV4bENmZWFv?=
 =?utf-8?B?blQ3S2dWeitpQWQ5ZWZXMUgwWWF4aXorbzlJRUxSSlJ4ZUMxMnR0V0dpSHdD?=
 =?utf-8?B?dU1aRFBoS01iUStjVHVPZk12aFQyMnVDc0k2bVE2dzRVWkRiOVl4aUp1YW1D?=
 =?utf-8?B?WnZsZjVKUkExVFdldUgrbTFLanVBTXIxcmlJOGgzazhkd3EwOGU2UmMydmk3?=
 =?utf-8?B?eFVENHF5SC83eXhYdHc4RTYyS2Z2eTJ5bkptSnVKOStuRFpIYWZHOWxZRjZ6?=
 =?utf-8?B?WkptS0RGcFg3UHJGeDQ2bytxb05LaFBTUFBKRkdmTnRCL2NmdXhCSERrSmMv?=
 =?utf-8?B?TnhBV3BNNzBqSDlSYTFMVWc0NTdpUXdzYm1GSG5Ed0xZRW9zWEVZWTFYckpC?=
 =?utf-8?B?RkpxdWN2OW5UdU5GRUc3ODNlNU1COVlqSWphL1l1TjlmblJXV1JUd1h5OUIx?=
 =?utf-8?B?TnFMMDVYamswcEtYMEdEamYrblF6d2VKcFpVWU0wMllGbjdtV1pXUVkzZXpw?=
 =?utf-8?Q?HBg+nAxfhPWOfp6Jd0cqZNN/5CMZ+o6LArwJiG8euMWrm?=
X-MS-Exchange-AntiSpam-MessageData-1: Ehtsp9kP6R/OwA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0e0053-e0fc-47f4-e88e-08df18baca94
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 15:04:25.3963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpLqO4i1ThRtXT7H53Go1l/JjxiBm3mSVPzbasfXoz3jTVzDLfNRkI2lRAHSxM37WtuMvEa0f9KwzGyvaRnm3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7188

On Thu Sep 17, 2026 at 12:10 AM JST, Younes Akhouayri via B4 Relay wrote:
> From: Younes Akhouayri <git@younes.io>
>
> Bounded relies on Integer implementations to provide primitive integer
> semantics when justifying unchecked operations.
>
> Explain why Integer is sealed next to its private supertrait. Document
> the dependency inside fits_within, so callers can rely on its result
> without repeating that explanation. Mention sealing in safety comments
> that directly rely on integer metadata, shifts or conversions.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Link: https://lore.kernel.org/all/CANiq72m8kycbfQ1teyne-OtB5d5TsUcX_WW0FC=
kWB3Ayyg-qWw@mail.gmail.com/
> Link: https://lore.kernel.org/all/DL88SQWYU15W.2CVZB5NVSSJGK@garyguo.net/
> Link: https://lore.kernel.org/all/CANiq72kx-YPPEruOFdu-Dp7GX+8=3DEt6svG+s=
QtqEmmF7kpnVyQ@mail.gmail.com/
> Link: https://lore.kernel.org/all/DLDSZ09SM8HI.3PHPYGLV2YZBX@nvidia.com/
> Signed-off-by: Younes Akhouayri <git@younes.io>
> ---
> Changes in v3:
> - Document the sealing dependency inside fits_within and restore its
>   callers' original safety comments, following Alexandre's feedback.
> - Restore extend's invariant-based comment and remove the repeated
>   sealing explanation from the second cast safety comment.
> - Link to v2: https://patch.msgid.link/20260908-docs-rust-num-integer-sea=
ling-safety-v2-1-e8c65234db82@younes.io
>
> Changes in v2:
> - Shorten the comment explaining why `Integer` is sealed.
> - Mention the seal in the `SAFETY` comments that rely on it.
> - Link to v1: https://patch.msgid.link/20260906-docs-rust-num-integer-sea=
ling-safety-v1-1-78057391302c@younes.io
>
> To: Alexandre Courbot <acourbot@nvidia.com>
> To: Yury Norov <yury.norov@gmail.com>
> To: Miguel Ojeda <ojeda@kernel.org>
> To: Boqun Feng <boqun@kernel.org>
> To: Gary Guo <gary@garyguo.net>
> To: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> To: Benno Lossin <lossin@kernel.org>
> To: Andreas Hindborg <a.hindborg@kernel.org>
> To: Alice Ryhl <aliceryhl@google.com>
> To: Trevor Gross <tmgross@umich.edu>
> To: Danilo Krummrich <dakr@kernel.org>
> To: Daniel Almeida <daniel.almeida@collabora.com>
> To: Tamir Duberstein <tamird@kernel.org>
> To: Onur =C3=96zkan <work@onurozkan.dev>
> Cc: rust-for-linux@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  rust/kernel/num.rs         |  1 +
>  rust/kernel/num/bounded.rs | 32 +++++++++++++++++++-------------
>  2 files changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> index de589792a77a..0449e84a384a 100644
> --- a/rust/kernel/num.rs
> +++ b/rust/kernel/num.rs
> @@ -21,6 +21,7 @@ pub trait Sealed {}
> =20
>  /// Describes core properties of integer types.
>  pub trait Integer:
> +    // Sealed so that unsafe code can rely on the correctness of its imp=
lementations.
>      private::Sealed
>      + Sized
>      + Copy
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index 2a2b0a4bca5e..aff35e2eb616 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -40,6 +40,8 @@ macro_rules! fits_within {
>  /// Returns `true` if `value` can be represented with at most `N` bits i=
n a `T`.
>  #[inline(always)]
>  fn fits_within<T: Integer>(value: T, num_bits: u32) -> bool {
> +    // `Integer` is sealed, so the bit width, shifts and equality have p=
rimitive integer semantics.
> +    // Unsafe code relies on this function correctly checking whether `v=
alue` fits.
>      fits_within!(value, T, num_bits)
>  }

So while I think these two hunks are indeed required...

> =20
> @@ -472,8 +474,9 @@ pub fn cast<U>(self) -> Bounded<U, N>
>          T: Integer,
>          U: Integer<Signedness =3D T::Signedness>,
>      {
> -        // SAFETY: The converted value is represented using `N` bits, `U=
` can contain `N` bits, and
> -        // `U` and `T` have the same sign, hence this conversion cannot =
fail.
> +        // SAFETY: `Integer` is sealed, so the bit widths and signedness=
 are correct. The converted
> +        // value is represented using `N` bits, `U` can contain `N` bits=
, and `U` and `T` have the
> +        // same sign, hence this conversion cannot fail.
>          let value =3D unsafe { U::try_from(self.get()).unwrap_unchecked(=
) };
> =20
>          // SAFETY: Although the backing type has changed, the value is s=
till represented within
> @@ -498,8 +501,9 @@ pub fn shr<const SHIFT: u32, const RES: u32>(self) ->=
 Bounded<T, RES> {
>          const_assert!(SHIFT < T::BITS);
>          const_assert!(RES + SHIFT >=3D N);
> =20
> -        // SAFETY: We shift the value right by `SHIFT`, reducing the num=
ber of bits needed to
> -        // represent the shifted value by as much, and just asserted tha=
t `RES >=3D N - SHIFT`.
> +        // SAFETY: `Integer` is sealed, so the shift has primitive integ=
er semantics. We reduce the
> +        // number of bits needed to represent the shifted value by `SHIF=
T`, and just asserted that
> +        // `RES >=3D N - SHIFT`.
>          unsafe { Bounded::__new(self.0 >> SHIFT) }
>      }
> =20
> @@ -550,8 +554,9 @@ pub fn shr_exact<const SHIFT: u32, const RES: u32>(se=
lf) -> Option<Bounded<T, RE
>      pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES=
> {
>          const_assert!(RES >=3D N + SHIFT);
> =20
> -        // SAFETY: We shift the value left by `SHIFT`, augmenting the nu=
mber of bits needed to
> -        // represent the shifted value by as much, and just asserted tha=
t `RES >=3D N + SHIFT`.
> +        // SAFETY: `Integer` is sealed, so the shift has primitive integ=
er semantics. We augment
> +        // the number of bits needed to represent the shifted value by `=
SHIFT`, and just asserted
> +        // that `RES >=3D N + SHIFT`.
>          unsafe { Bounded::__new(self.0 << SHIFT) }
>      }
>  }
> @@ -1028,8 +1033,9 @@ impl<T, const N: u32> From<$type> for Bounded<T, N>
>              Self: AtLeastXBits<{ <$type as Integer>::BITS as usize }>,
>          {
>              fn from(value: $type) -> Self {
> -                // SAFETY: The trait bound on `Self` guarantees that `N`=
 bits is
> -                // enough to hold any value of the source type.
> +                // SAFETY: `Integer` is sealed, so the bit widths and si=
gnedness are correct. The
> +                // trait bound on `Self` guarantees that `N` bits is eno=
ugh to hold any value of
> +                // the source type.
>                  unsafe { Self::__new(T::from(value)) }
>              }
>          }
> @@ -1104,9 +1110,9 @@ impl<T, const N: u32> From<Bounded<T, N>> for $type
>              Bounded<T, N>: FitsInXBits<{ <$type as Integer>::BITS as usi=
ze }>,
>          {
>              fn from(value: Bounded<T, N>) -> $type {
> -                // SAFETY: The trait bound on `Bounded` ensures that any=
 value it holds (which
> -                // is constrained to `N` bits) can fit into the destinat=
ion type, so this
> -                // conversion cannot fail.
> +                // SAFETY: `Integer` is sealed, so the bit widths and si=
gnedness are correct. The
> +                // trait bound on `Bounded` ensures that any value it ho=
lds (which is constrained
> +                // to `N` bits) can fit into the destination type, so th=
is conversion cannot fail.
>                  unsafe { <$type>::try_from(value.get()).unwrap_unchecked=
() }
>              }
>          }
> @@ -1137,8 +1143,8 @@ impl<T, const N: u32> From<bool> for Bounded<T, N>
>      T: Integer<Signedness =3D Unsigned> + From<bool>,
>  {
>      fn from(value: bool) -> Self {
> -        // SAFETY: A boolean is represented by `0` or `1`, so it fits wi=
thin any valid unsigned
> -        // `Bounded` width.
> +        // SAFETY: `Integer` is sealed, so `T` is a primitive unsigned i=
nteger. A boolean is
> +        // represented by `0` or `1`, so it fits within any valid unsign=
ed `Bounded` width.

... here I am not sure the remaining mentions give us much. The seal is
a property of `Integer` itself, and is documented there. So an `Integer`
bound already tells the reader that primitive semantics are guaranteed,
just as we don't justify `u32::BITS =3D=3D 32` in a SAFETY comment.
Repeating that `Integer` is sealed at every site does not add new
information, it just makes the comments more complex.

The comment on `fits_within` is legit though, since it is safe code
whose correctness the unsafe code depends on.

That being said, I know Miguel asked for these mentions on v1, and I
don't want to send you back and forth between two reviewers. Miguel,
would you be OK with keeping this to the trait comment and
`fits_within`?
