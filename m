Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010042.outbound.protection.outlook.com [40.93.198.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D59C47AF42
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786626271; cv=fail; b=c9MJcnJMaqQ+n1OCkkKPZDwZM2+utrOLfT1VuTdiV8fbgmadtXIQfZfChTsZRGGohViddkb7pyZ10WGMKeDO4lzc8xs/Z8si5bJKZDzO45E6bQdZngtdfjHG2dHmWYTFXsobbLIp9SobCxq/MHFRyLrIXS9tBWCK0WQb8ahfbr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786626271; c=relaxed/simple;
	bh=2UMU7ccboqxSbdFzDMOhhcHeTmhc/bZX8gRdtfltYFw=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=IZPfLWoHy2DS/DQ6ne4ArGUwbvK7wHxf/iKcCnDNkbW/Q3fhYTI7QuiXqRwfBtUk8akFUaX5+0J9z+uKwPbMvOqZ2b5XKClEU+AkGUlwWjxczRqFeCD510uZrk88WC3wOsGx0aYu8oV20+0RSDvQoINI1WZcW/nGwrFescvuc8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KKjvXo9N; arc=fail smtp.client-ip=40.93.198.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KKjvXo9N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOT1ZOdrLtXgVaWPHpFeTz5J0F08zpTFjPnaZALSAQ0Twh4xmv3PEfRnH/1R3GfFNa1vDlEuYjSViipN+ui7NV0W28GwtQuoggYSwZIpLOTZqTQ9B0NMQclVg/q18pGlvPkDkCGmnJ7BjRVq0NIjDgax3NMEfk0L0tv8CFO7LT8Cxn1p15GQ6uQyFTk/PM9AjrUXvC1sN7RUlpz+x9o8dqEvHzTy2AWqt5advuEbRLlCWPpgFsYNddaCUkt/HiEMjLxHZtjCNa8m3Pogd7HKGdh830Yv8xD3ZQL9NJrigH25s+vLJ3BZsbei4sBhJ29SUfowhFXiPppni9LnZOvelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UMU7ccboqxSbdFzDMOhhcHeTmhc/bZX8gRdtfltYFw=;
 b=lto/pAEd442azEwmPHMHlIy1BoyGFQCrfk3CzCVCH25CZag0qt+MOcqEcfGJbQGJ5tkcRRzXPGFQmto3GmYG2HZUzcr2d+UKCM2Gkzb9J/75g3SHlydKdWEwC8nwiSWXYdP+tjK+dbHbtDFjCqn4weC+JAjBUDOGL/T7l6sMWGWclNQx00bY1pYclPYpw3EdoOE9T3ehwnr3O8lMltTG7IgeogHGkm3/1tgYeIVo7j6ndJGw1Zao6VX9cMUhzDQVycG8cE/u0etuDBlm1n+LCsy5DkGw9ZIvlkj0YHIZUjhlTFw0XrDtwrm3TO6IYvPITadpMoJlnswdoT3/n+tjAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UMU7ccboqxSbdFzDMOhhcHeTmhc/bZX8gRdtfltYFw=;
 b=KKjvXo9NjNvraNt7l9u3O0dUJvFDUVUpc6tNszr85cTOEe5RedsxvB4qAqwCp+N0STe9h/1Payw2SP5NZcUtp2o+BcsTcsUdBlSGkcTB/swKFUolcJjLwfeRkkLyXr6sUNZsZfrzPgyfTXvl8hxDvD2haEO2hUBo1i97lAl56Okhlu7SDYWa0MDDmaSc1i0lseQQj+BzqAnBrSL5ANyZQxV6HyM+uE9TnE2ko3pe1P6thdWzXUe8wB5sfSwCzk6JWI+e9yPsT1cnY5fyNHhGwEcr0cfAd822zZtmsnaV8Sd8/zSrw81LlmS3fPMof2cPM1wnswnGWxVjpUSn6PTa3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV3PR12MB9215.namprd12.prod.outlook.com (2603:10b6:408:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 13:04:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0315.008; Thu, 13 Aug 2026
 13:04:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 22:04:22 +0900
Message-Id: <DKNU5IBDCA44.28C93KM4IQS44@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Younes Akhouayri" <git@younes.io>
Cc: "Rust For Linux" <rust-for-linux@vger.kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "Ojeda" <ojeda@kernel.org>, "Yu Whisper Personal"
 <yu.whisper.personal@gmail.com>
Subject: Re: From<bool> and Bounded's invariant for signed N = 1
References: <OzuVxu0--J-9@younes.io>
In-Reply-To: <OzuVxu0--J-9@younes.io>
X-ClientProxiedBy: OS3P286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f5::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV3PR12MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: 2247efcb-61a8-4e3d-695a-08def93b6755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	K81/YPd09qS9jgMgk/HfMiwU8iRn1SrLWu7wulKm0zyIpEpV2iHfbX1ejNCkzyiXxH4nC8h0x68/6L/Pi6X8dSubHdkZrLJtsXd2Hr2MPWuLrXkREGNGtLohd4/0Yz6aJgezSQJ9wIlbJOcQdwJSKkeTHzIC7gplYT+I4uVbfWReoKO4ydfrcU99gyVR1/utBG7oyUaf0k9fYHR5NQSs42HAQOqzvRMLQ2dTxJp2ImeAuJrZARudNNnDe85y8qAEiubVWI3eO7KpVYnG2hUcv3QAEWT7ssPNahI5fon5c+zdkOydccHKjBKGCrOZVVWpbbR81cMabGYvHV9RTSNhYgCW7t/XahCDxKn/sOpP0aTk5GzVZfGqugU51KKxSTD0iqi4M9B9Fho8eak1+MtJ1SmEvHFiej3atf6O4oHITiHJq5mL5vHJ/DPm5IDGVK/fu0BYEEDY9NUWCsYNgveLLEP/38+cRzhqxjfidbQHcfGTnkHkKuFyBhACrQfFJ8Tz2eW7PPr0T2cIwqJ17Jli7KXruGZIBMHClhQHoOoArVNVulCh8J7j2KuRx2H7wfWeVEbJDwsHJq+BF1+X7S7Rm+ceyuEt0MpybxZIuWYeZjKYpOSU5TRq1K2lYN5RBMvqhfpX9s7ThhIiLcv5NKmGcGit4/h2DKbIFnYAtigpZbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDRKblRRNW5yT2h5bmxGanE5VVNwNURsUllDaUhHNEVMcE03VEo4TTBzUWdo?=
 =?utf-8?B?MXlVTUovdzlTRkxkTjZURlNJTEpuZkJQVTN5VzZ5WGVsM00xbjNudVRwZUFV?=
 =?utf-8?B?bGwyT2Jab2FjaU4zZTl0SXp2cXZwRTdKTEVTY0txZlZ4WldHM2ZtclliUVBX?=
 =?utf-8?B?aFo5U1ZxdVBXUDk1RzV3T1lpWkFtRDRKcVBiZU5FSXhwM2daaVU1dmkrTWNJ?=
 =?utf-8?B?Q045Q3c5R0k2ZUdNM1FLZUd3WVhiVG9sTWdKU3lxNlVlRDNOWDhpN0pZV0dq?=
 =?utf-8?B?NmNydks1NDVwMkJxYjlnQ2V5Z2lJYzBVR2xkRGRNKzFKeHNmcDhZNkxGWHdI?=
 =?utf-8?B?V1E3WGxZZjJWcEpydWtrZmRTOVMrK2FZUnFvckw1eS9YVFpFZ2hzT2lQdEZy?=
 =?utf-8?B?akxUeXMvK0NOTEpZcHlJdUxVdlNSUUc0MHE2dWJGODJWZDcwL0Nwa3ZWZTcw?=
 =?utf-8?B?TlNvYkF6M2RuMzBUbG9JZFRJTlVBVGFLdXZsUEE0RDlscEpxc0NTRXdXaWVW?=
 =?utf-8?B?NmNwVm1XYmxBcmQ0OHdrQnFINmpnNnFvY1dVOTNyNFNRN3lKN2pTR3BSMVho?=
 =?utf-8?B?bkUwc3p1c1BjRFpEcElOMFpoeE5DYi82RDIyZnNISkRoNDZzRVpoL3JPUWln?=
 =?utf-8?B?ZDc2N0psY2JuRUhoN3daUWpYaFNrbDR5cU5uQmxVdEdsVkFjNzVzV21nUDZS?=
 =?utf-8?B?MjZ3MXlMNFBvOVVPWTl5Wm1lUE9vQ3RzZ0RxUjFsRm9QejZSNUg4VkU4dGNR?=
 =?utf-8?B?RjBHeVp1bjZ4NmJ0SkV4MUQ1M1ZwcFNHdnRRNll3TkV1MEloSzNFL2FvWDFw?=
 =?utf-8?B?eFVHQ0tvVk93K0dRQTBIZ3o4enZCOTB4eU1FaTdvdTVlYVd6T1JFSWlyaXFn?=
 =?utf-8?B?NU1IUUFlZlVTbklqejV4ajZOeCtYalYzN3NONjQ4OFdvTng3dFoyR3lmQmdZ?=
 =?utf-8?B?OXBGRkVBTFM0eWJMTDVQWGtqc3FXcFNVa0RvUUM3TTZOdGo0RUxlYUZiZkpV?=
 =?utf-8?B?UnZORHIxd1VsbnJMOWk5TUtVMk1GTEsvYXQ3aGpTeGdjMzZEZjI5K1ZjdUNB?=
 =?utf-8?B?NnpMZUpZeHBHWEZDcVZBUzFac1Erb3czaWVLUzlrOWpDbS9MTmdWek1jSGNM?=
 =?utf-8?B?UjFOaTV5d3hPa090WlVmc1hQV1ZmaFJCNDBMdEZUOXowWEVXdzRKZmh4NGF4?=
 =?utf-8?B?L01EeldUZFAxSWF5U0dmZzNSVER5UjMzZVptVmhkY0FuVWRQbm5UWVRWTDdO?=
 =?utf-8?B?ZlMxWUpnU1RYc2l6eW1mTVRRbjFORHFoQWg4Q09hN05pbVF1Y21yYlo4ajFs?=
 =?utf-8?B?NFM5U1lTeWRJYUV2aW1NbG10UE8xQU5ZRWh4MnA2QkFOYnZCbTRaTFY5Z2xs?=
 =?utf-8?B?NitrVWZHZDlDV21JcHhFNWdXREIvQ0wybk4zUHNTalNvSDBYTmpKMzhSWXRM?=
 =?utf-8?B?ZDJsQ2psS25vazhEc0NZbnZKVitzd1FHcUpGZWRoTUJuV28yNGg3cFVvc25W?=
 =?utf-8?B?TVVXWXd3LzQwL3ZiUy9oYXBRMUFweERnaFh0Tk4ycTFxOXVhTTk3MEFvclRr?=
 =?utf-8?B?N2NjZnpOMHp3K3FXOVEzYWFmZm9odXdpZk5KNXZ4ZkNROFVvR2F0ei9FVEhh?=
 =?utf-8?B?V25XT1J4UEpkSkZFTWRyeXpRVkloQmVUbzFpNWw2RmxmaW4wWmYvbytmT0Vk?=
 =?utf-8?B?WHpkOUdyRllJbXY0ZFVpejZiWFpxR0J0LzYvL3Q5TUZOZGRiOUZBUk1xL0JJ?=
 =?utf-8?B?dlZFYmVsc3cvUkFaZVo5R2laQ2lTekJtdGlRNHhQdUNzcmxPRjllS3Uzczgy?=
 =?utf-8?B?WVJocnBsN0o5cVgyT2xyK21JWkZPMjJJTDlnd0RjMkswNzdxM3pnSytkUkV3?=
 =?utf-8?B?SFl1dTk0LzRpV2s2T3hodnFCZUZyTTRZV2EwMTlkQUR2YU1tMXZ2QWdaSTFL?=
 =?utf-8?B?WGJ6YXdzd0VuTWo3S2xwRmkvU2NJVTJEYTJ4dVJVRW4wSDF5dzJ6cDk0aGZo?=
 =?utf-8?B?ZVNiYk1XVWgxZjNZbWpNUXowNURqSThQSHZwOUVwa2ozZ2FFK2loVFJNWFc0?=
 =?utf-8?B?WHJ5L0tTR2d0c2VMc3lsQkplU3orMDBJbnREMmhmQWR0NWxhR0w1UHlHcjE4?=
 =?utf-8?B?SS8rVVowYmUxZ0JnQ2c2SHR5RFptL1R1VlZpY21uS2pRNm56cmJMcUd6WDRq?=
 =?utf-8?B?NTNraVBhYjlacEhoRElia0I0UXdlcERJNEFoWmtJTy9KeHhUMHZnZXVGQS9r?=
 =?utf-8?B?Nm1CLzIvM1l5SlhhTmM1aXdCQTRaQzZxaEduY05XOW93RGxtK1BoWTV0NVQ2?=
 =?utf-8?B?cHBFWWwxaUxPQmk4ek9aU2MyQTNCZTV6QmlFL0xyd1pPcmxrNGdrR1dvYkFl?=
 =?utf-8?Q?OWQ0SRQMK20/TqACEeueSZkEAyRl+gkjY4333Kan7485u?=
X-MS-Exchange-AntiSpam-MessageData-1: FnYQ9NfAR7ONgg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2247efcb-61a8-4e3d-695a-08def93b6755
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 13:04:26.7014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bB1HuMsJBAt9bsG1zlVZTjv8XWnjV5E+5qi9mpiRVtc0IaWxMAr10NcJVKCXI0KDOojjSgV5IeDLHZai78yfjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215

On Thu Aug 13, 2026 at 6:46 PM JST, Younes Akhouayri wrote:
> Hi,
>
> There seems to be an invariant violation in the generic From<bool>
> implementation for Bounded.
>
> As I understand it, Bounded<i8, 1> can represent only -1 and 0, while
> i8::from(true) produces 1. However, this safe code is accepted:
>
> let value: Bounded<i8, 1> =3D true.into();
> let _raw: i8 =3D *value;
>
> Bounded::<i8, 1>::try_new(1) rejects the same value, but From<bool>
> passes it directly to the unsafe __new() constructor. The resulting
> Bounded value violates the invariant relied upon by Deref, whose
> failure branch calls unreachable_unchecked().
>
> Am I missing an intended constraint on this conversion? If not, it
> seems the signed N =3D 1 case needs to be excluded or handled
> differently.
>
> Any thoughts?

I think you are correct. There is a `Signedness` associated type on the
`Integer` trait, so it should be trivial to exclude signed integers - do
you want to send a patch for that?
