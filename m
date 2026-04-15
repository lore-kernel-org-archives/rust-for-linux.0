Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021140.outbound.protection.outlook.com [52.101.95.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE063B389E
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261072; cv=fail; b=Rq6pEr8/pdmkf+7exKf1A2z593o4pFLYn4m+Yg+MvVa+rE1aDjeV2lxFqwwHcXq08kdW3ZRApsjwmMuNgxZ7bzMy1Ot6xA+G6zHV9Bwu+CSFFdS6803CIV59UCDTGfFnqyGBgvXycrFJHVUqb4nKMl5KIwNdpzeu4M7SFoJh/qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261072; c=relaxed/simple;
	bh=nnWyvtmHCNYPFMUhRQkLVQNnQpVGfaiLoD/ZiSRFBrk=;
	h=Content-Type:Date:Message-Id:From:To:Subject:References:
	 In-Reply-To:MIME-Version; b=ta6CYscxsBu+kLrMFwjSpSuziGWW7ds70mv1yRv4dVIkIM+sfnsNm+c8kWahntggGkUzf1zxZH8WFO6GDNT8suGmbNm9zGwKzZ7JDnzXK0z6FnGOA6GIws1jspPYpN8xml5kVPJoJ077ZIBnFEsEe/HAbpcLjzBfVShD1L+XOHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=lvCmrVNl; arc=fail smtp.client-ip=52.101.95.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="lvCmrVNl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amh2LRtwNaB+IXfvzMVtcTD3OTPotLFcR3cqaOldspYCZ5OX7UVXFp85Aiojo+7z1HdZsMERSomfCY2yLEeAMXrePZQOBXS0zHhzF18CabdHBTCByUT3UuuGwZyrzUS6mOPUcK7DA7AVvGETddE6VC6YCLeaZEEiwv4ig2pMyJmaj/BIEFDpG6RAOdKechnqZ15cu0ci4qYIM4RgGA0Jk05zq+n7UeejGEldxURI75OoAVVYDBNfjrnRepTm/wnZPmqQhK4QipHLQLGUDuJxKcmmyMi5Tbl1r+SibzePsSlTQqZRQriEU8RI86cpeXn6NEvRaUQXoXyOPXnni+nAfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riZFy7fFJgs4oncYzr78svfNqvqI4ay7FOxT0SN7H2w=;
 b=ugMxIg6Q371lS/x+O5vG7lOpz8qoxC+HAc/DQDQPzZBnP8i4KGe8AtBd6r46zWAz6/1kOfr9J50S/8tXo10+zpg+d5MmrFAyAAF3NHSY73ZnwzRjeoJvistW7mPxFzf5REarcdSP/e1dPsvm2gWE3wKfo1BqBvOAbTogOPi2ux/FD55OoPxykBnYdwwnPN9JWkbn4wzibIVECJagC9luDc99CXt35NcD/XCqQ2SPnxZtJ/ArguF2SGcv0DvTTwO3yqk4tydwy5QyE6jkp3Ur+rfgRJ0VMeCAYnmqcXmL+4Na/8EDzJdlk9IDiDC09HQ4jjFU/iQ0Lkm8wocHUQJ5kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riZFy7fFJgs4oncYzr78svfNqvqI4ay7FOxT0SN7H2w=;
 b=lvCmrVNlwtLIHNmw61EUoa/zECzRAkFcuQbj8jcBziepe9+YtsDgreRliQzOzVZ6hoe965q1apj3s+Nf+dHXd3BwTtKHSjs5FMO5krMh41VGbSfUVRbI/lm6j9x29UB19HHFzw4xxfYoQW60JOSulpjFkJlviMpcu2O1FzErb4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB1913.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 13:51:04 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 13:51:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 14:51:03 +0100
Message-Id: <DHTRZVKNN3TP.1NALV3Q9B6GPY@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] gpu: nova-core: enable GA100
X-Mailer: aerc 0.21.0
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-7-ttabi@nvidia.com>
In-Reply-To: <20260414235047.439322-7-ttabi@nvidia.com>
X-ClientProxiedBy: LNXP265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB1913:EE_
X-MS-Office365-Filtering-Correlation-Id: 9800f79e-32b3-410c-bcda-08de9af60943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zSZ7b5kZY2uNpdb4FtpacvTiyed9ZwhypCK+o3tUj86RfUO7kSn28dR8Jl7GmU618L7UhdBoYgGCpu/LXGBQI122z2SXKUG/YSXQ4jyvMaaKxAQaDBtsmT3WGx+j5154+uniJFZOOUFRzu+3NlC8RMg/gz5VM3aM5Q6KnrNcJ25YzIc2aESi/lt4JdavLbQth6xljoVmDgAEkeHGT7a8BcefabFnAxfykCIDn9xlQ5wvaPEKMD5vx2ZcilM1fQlmltxXhnKlRM/tY6s+zP/FyWit7VTUaEueBi+BQjLfPR1AqNuOPJdEe8sHrQbqbEYij0ly+Qq+Uo/1ng9kd2h468AZD/bCV4+fpayounXVLCHzxi52NNLmoardZXk10Ll5ToDM9xBVX3JQ1gyRrjA8CofpUG0pr91ELAFtIyxODtio2GX5JyiYb5W84fFZXEubUWlZ4sX471pJabXNfwDaW6A/Xp/aZTDTSsiaaNA6rEKQ6dN3AM7g9GTIEMaWhZISk4ggIMMCD3HDp21FkG0vPNataAqtmirMiYnFG177r+f+TJhKPFG0EnUCiCcsKFqglJPDiO2gph5WZVmyVZlEdL9y8mFEpZmwqgJS6hc6W44Imrt1CqX3ZMy6XmzdFd9etskeCLYmZ6PaIcWBUOhL1Sxp9yDtqmRTYwEQ3jrRXvF77Q/5uJeIXNDvS/ieQBXwdfzVNeQwoHFoeyFgaUpCW5ypxe8AK3W4QFCaB+oXWgM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjJMYUtVNFZvTnd3ZjlFNDRQeTVHSHNFYmJOeWthSXMrRlZDRXZ2ZjVaaSti?=
 =?utf-8?B?S3QyQjc5K3VJblNudjlGdHNvcUNFZ2E2L013eW1DRVJMUlU2ZUZYWEpCeGpW?=
 =?utf-8?B?Q2FtekdBaitqV2lzdEw5QitHdlV6eUhQcGN5WDRzdS9vUW9nNWwyV3ExbFBG?=
 =?utf-8?B?T3laQVN0OE9GRityU0lKZGhKZ2RRVkUxK3Zmalg3NFhYOEhrZG0wbm1ycmN0?=
 =?utf-8?B?Z2IzUTIyQ2N3VjI1Rlp0TVZhSmtpL0R2SHArNkpwMkJmOHRkNG4vSlJVY0Ni?=
 =?utf-8?B?L0NOUUFpTjBtREZiclpEbUkxL0M5TGtBYU9tamVRZkQ0Z0xxbGhYcForOFFV?=
 =?utf-8?B?ckFKeVloTDYza1RHNVg2TGxWb3lERVJoeko5bXVBWXdOc2I3OHQ1ZXJHYzRD?=
 =?utf-8?B?cHFCQmN5Y09xeWxUMERCdWxKWGs0VENSeDR1UlNLZi91YUhTM0pWOW1TL1NP?=
 =?utf-8?B?RmxOcXhJRUdrMWFUb0ZURUphWW1ienVQS3ROL3BQOUpjRzdJRUlSS3FVcnJN?=
 =?utf-8?B?UTlJWG8rZjRzOUVSNnRDSG5ZWERDMUd6WVNFejNtTG1RTDJadmpYMGRVTURB?=
 =?utf-8?B?NjdwbEd1T0d5aWJXelhtV0R5cGQrd0tKK1VKSElONmUvdzBILzByVi9HM0lV?=
 =?utf-8?B?NFIveURkY3lvY1h5M2V4eTF0TEVCZzJ5RngwSEJza1BuYUxKU2tYbS8yZnJY?=
 =?utf-8?B?aHMya3NBUFRkc2llOXBGRUJSb0NJS1QySC9lWndob1lIYzNJN2JjRnFjTUZD?=
 =?utf-8?B?N2x0WHEzdHJLN1pyZk5FSlRtdVg4TTBRbzJTdHB2bVQ5NWtPM29XdHd2NEth?=
 =?utf-8?B?RHk1SStXYU52d0FYcE1aMGYzeU1GZDlwNmFmeUVyc1hPSE1TMHd0RENiVk91?=
 =?utf-8?B?aFBuQ3hPY09MNnhuRVEyTHYzbzRJRDhOQ1g1MGMxbVBHRTdjVSt4d3g1TlA5?=
 =?utf-8?B?cnFxQnk5OTM1TWtNYWdEYzdDM3lKRmNEZENzV0pHQy9ySEx1SHZPTnNjaW1o?=
 =?utf-8?B?SzFSY2FtQ2N5ZW43VXUzK05EN3Nqc1IzM0ZEQ1Qxc1NjeGpJT0VVZUlSdFdu?=
 =?utf-8?B?UkpiY3k5UEpVUVJka3pvSWNZSWM3ZzNmdUN6UHczbUpGUmNGdGVtM1dtVFdP?=
 =?utf-8?B?VFRFbm1sejRPVUZ4QTRYM05iSEs1RWdubXVZaTQwT2VsZkM5WnNjZlZOb0FF?=
 =?utf-8?B?eVJZSzM3THhDOEpjNGk5c1RvNkhVeC90c0FsSjk0TnNBVm8xSzFuY0pCZm8z?=
 =?utf-8?B?MW1maEFoWVdicDRNMytOa3hmY1Rtd2o2YXdOWURZNFYxOEZtUVRyaStPS1RZ?=
 =?utf-8?B?MnR2dms2cmFab2tSaU1EZmU1cFpwWGNWS2hCSmdVZEdlV3ZWa28wZUk0YXJI?=
 =?utf-8?B?Sms4UnhsWXNNUnhJM2wxVDI0bmJMb0d4eXZaQXdDd2tadm5mVXZrU2RGOTgz?=
 =?utf-8?B?czEzdFBpcXNzQ3FTZ0VLOGE1SXBDajhYVTFpSW9zR1lQUWV2bDhNOWlaRW9i?=
 =?utf-8?B?eE5zbE9Lb2QxNmtqZG1SZ1psTFE0MHBlcHlvZUZ6czJnZ0V6RGhvNmFkYTV3?=
 =?utf-8?B?M3EwSWIwdmttVUlPWkw0U3g4OHFrNnZzQnBxQjRveTN5eVhCbThhSTRhRUk0?=
 =?utf-8?B?UHUvSDhBc3dOaTlVUTBsaE5TZGFzOXgyTmxBU2R1dEU5bEc5VisrakdQUy83?=
 =?utf-8?B?cFlIdXFGckViOGZMeGhnZ2xXOUIzNnhVS0hLbGJlMmhFK2p4RE1Ha0s2WldQ?=
 =?utf-8?B?OWRyZ1Z6dmxlcUxrVmJPWW1HY0VhQTM4Tkc4aENta2FBMm1PQU1rTzhOMUcw?=
 =?utf-8?B?aWN5aC9QRlMzQUNUU2FaOFRjazI2cjJveGtESDdCd1Npa1ZiN21yUXIweWJF?=
 =?utf-8?B?NU54dkM1dWJ0Smtia1lwQ05VOFBCOUY2eUtCSzJOZUtuSUNyS1VmWUM1Z200?=
 =?utf-8?B?R2k5WERKQ0d3YVJoN3RkeTgzcVZ3UVJyWHp3dVdtYi9MSUduamxFOTZNSE1Z?=
 =?utf-8?B?bzd4eWFWTU1rQmppaXlpc0xIUEVMbjBGSGhBcUlBUm9sWk5FV2tzVHVweDNE?=
 =?utf-8?B?dndRK01uK2dXU2JNdndVeHlCVURJcEFVV2VmcUhvNlFYQUZraDJmbWwxdkxq?=
 =?utf-8?B?Z05ra2lkL3ZLQjVGZUFpSU1GVmplWm4yckUyZzUraG4xcHhJQmFzbWtIN0RB?=
 =?utf-8?B?YUpkSXViWW5FSnQ5ZFVjVUluR2dveDVjMzVrSTRBL25uY2svZnp3V1B1N2J2?=
 =?utf-8?B?ZWVnYWpScmk4aDBJNUx1Mkl2OHZQL3d4dDdjZkl0eWRCK0VGV1IzSGt2YWJs?=
 =?utf-8?B?RjVPSTZPYUx5Q2x5L0t1S1hxTi9ISVhCQXFaMmN2SVZjcEdFUlluUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9800f79e-32b3-410c-bcda-08de9af60943
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 13:51:04.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jw76B5vLyrKoAzzLbdXkocR0JbNv1uNbPuKXrCJ8BRWny2aicHdFLI8YJmNKPSe0tA8Sp4FPEXDJ/mZHhYRaww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1913

On Wed Apr 15, 2026 at 12:50 AM BST, Timur Tabi wrote:
> GA100 is a compute-only variant of GA102 that boots GSP-RM like a
> Turing, although it also has its own unique requirements.
>
> Now that all the pieces are in place, we can enable GA100 support.
> Although architecturally like an Ampere, GA100 uses the same GSP-RM
> firmware files as Turing, and therefore must boot it like Turing does.
> However, as a compute-only part, GA100 has no display engine.

This should go into the code as a comment.

Best,
Gary

>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/hal.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/=
falcon/hal.rs
> index 71df33c79884..510046d4a577 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -77,13 +77,12 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
>      use Chipset::*;
> =20
>      let hal =3D match chipset {
> -        TU102 | TU104 | TU106 | TU116 | TU117 =3D> {
> +        TU102 | TU104 | TU106 | TU116 | TU117 | GA100 =3D> {
>              KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn=
 FalconHal<E>>
>          }
>          GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | =
AD106 | AD107 =3D> {
>              KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn=
 FalconHal<E>>
>          }
> -        _ =3D> return Err(ENOTSUPP),
>      };
> =20
>      Ok(hal)

