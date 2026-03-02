Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021098.outbound.protection.outlook.com [52.101.100.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE74D375AB6;
	Mon,  2 Mar 2026 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461331; cv=fail; b=AWE18YVeze6cpukq84S0TdekgG12AQmI+DCkbSCh/izM+8EFYudx7INJVmjbMGLOVcKAXjbI9+K/42n9S0jm4qZKsNs0itMavesdUQwYjdCrUizRbpFMe8vUshMYt0YDUsvtgvFf2Tlpv5zrCZzb/9NVWNw2JjuGWi3mF8OT7N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461331; c=relaxed/simple;
	bh=e/Pu/5+yUVksIquSxG7pQaHTkXiN48wdBg4gKk0RKVc=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=KmXO/N/qPeI20ITZoK5sqkJvGFjYaHCLUCjeQaMhARa9oNQAKtejUJSCp13ZBvftNHlOhpjVLB5DhTcjHnJIqnPkQIfQcsl4P81UD/vYQeFPr5NJgMUevQht59g3Wo0Eh59sURNXtBzLWyzKDmZs0nkn99ZFN5DDePYteUTcT0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FjQt8473; arc=fail smtp.client-ip=52.101.100.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FjQt8473"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pz5DLkFX1XACc44yn3qsQvVwSM9R0o5p+QaYIoqBIeZBgJmbihseeLwdRBw7LnTJoDkrm1d7qHDrqDUp2sdDpLiV8N1F7cTUgB17+FasYw3e6WqQE2HxE084F431jTzcRbHhCs5J4Uu6G30durReeEnOrPJSP5MBosMfJJJhcvDAOVqEvCYQH3v0tFp6nEL+N/MU6n8dDEzamAWxTSToXsGCjUuCaRYzgbq2VGNg8nST1BVpth4eZG50yTyyAEnzyYOico+P3mO/diQxrTXI9Cu8fETZj+Xxq4ASmsoGXNiLTr01D+lRfumsxZ5RCsYnihKTM9Ul6ORTqo+czIuSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH37/dX7fC7t2dcYlnv48tx6YtJyd1anLiqGF0o46SQ=;
 b=Ymy9tvAlZikjLGPhAAf9xQWX9tLVekfxet2ThiuycS75ttWoGQ0n5/N2LLCklffkWFtrgNwDpB3x7yS64SKrmjLIcscFPNB5cReJVWnwRCDDfs3J81kG2cKoYc4MvCIoCsdNqfrWtJIhaUsA6wuwHjnS3aR/XIOU9HLl+kqEnMtDRSODRbSN9fLIC0cUpJehWL1+xorvlORXJXXHA/7ORGw+/7+OtomtSKilPQjBxR7edsvox1vGs2bF80n2QSTvKRPp/Yn4+5f9fg4wGHh/PETZoAnnitTO5AzqCA1yGxoU3BvP5DCV8gK5gjaSF8vgPH5YtTZ6WoOuZdKHD+Ov/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH37/dX7fC7t2dcYlnv48tx6YtJyd1anLiqGF0o46SQ=;
 b=FjQt84737nz15h0wk1lZmhIGYVZlTkEK6eMsjx+oTJPYecp+Nhk1Jj/ElevgXBxkvHMgYBaIG1bYc5ifRfNQVqBSeMUdZgSVzqQlN8BqzD104aleUjvBRwBjBjwQKizoMRJYWjkDntzdmCyOw5tnkCCUri74cK2e2ltwL+ttYfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6727.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 14:22:05 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 14:22:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 14:22:04 +0000
Message-Id: <DGSD3NICC14Q.9NRO7N4YCRAH@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
Cc: "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 7/9] gpu: nova-core: gsp: add command_size helper
X-Mailer: aerc 0.21.0
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
 <20260302-cmdq-continuation-v4-7-c011f15aad58@nvidia.com>
In-Reply-To: <20260302-cmdq-continuation-v4-7-c011f15aad58@nvidia.com>
X-ClientProxiedBy: LO4P123CA0479.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: dba252db-7eef-4b30-58b7-08de78671446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	i+X26pcz7EQjBAtAJaxyEeNwZEBKGJADExefvUUNMzSiqzOrlJdzse0xUhbBw/hlb8KgV+77DPppH+GtngAPSUCLL6gx0NKH2f8vQBBApnN6An81vXz63wdXvr6ILW517Obf668RIaRnzR14XS2dhsv4zpgz9UqE7zQXnMQmVxIm/T1w7oAjubZ9Mx/HrnzAL7LZF4UG793EMOTw9gIKJJpTfANC5a3wONTys6veyB33yPtluhfsQNXPr3DN3FKLHguodI7D9X4NEHFsy4pgboX5aKbkZuJRJE045p8Yr302pG8sq9kq+LjV4QDX/fL/5yMOuB1Oa5wOkTYkwzwyE85Gd3qklFIP3XhBJv3b5lN/g6GGzUKbxDFposb5UE5QZ/NNLj8Q7yYF3E0FHfhQzXtYgyr/WNCTIyfZ3uy5U7L6+lBv8YZEIE9YZk5lCqYA+E5znuYhLYCDAyyF+MLhYRJ0CHvtowVLjUS7Gy5G9+NU+M0/h6vntZeEIXCUCT/1lfmDMGF0pevpPnhM/iQFCw1F7wCRL9tN9+fchHb3Wa2pUafF/TvGG2G5blUaUhGgcMQdFr1qtNZKZvcILWFVmT0oFmNzbkMfCWwAq6FRC4Nr36uIfOE9Tsa21SkdBUAbh6RYulgEof+IEz1eVP0cJGDh98DHlg+7STW8e485ch1MQtvlQaogG71XkJZR98WQxHUO1W6crIj0M1ePtLZkf2x4zwdmPzr15SGAku616eMZKCw7POG1/ox65YnEIZXpfAOVaUgsA6e3C6aLUf0Bfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWRLS2c0UWhrc3B1aVptb2VrRGVyalFIOFpURVl4TVBGeG8waVYrL09vc2RV?=
 =?utf-8?B?NFI0Y3FsWmtkYTBiTG9iVmY4R0svbjRmUUlLTEFuaE1OdkZBY3lXNFNlczQw?=
 =?utf-8?B?dGZ5NjQ0MTB5YXdkRU9MNC9WN2V1Vlo4RUVndmVyeFZyanJkQjdhdXJOMytu?=
 =?utf-8?B?WktZQk1MRnd6OG9aaTBVb2JsNnBvcEpjS2RISVpnaU9NejFuemZlbm54Snlq?=
 =?utf-8?B?T092OWJkdkg4VFVnT3BoZFdOc3Q3VkNNQlpvTG1oalM4amM2U2xkL2Jzb3ls?=
 =?utf-8?B?MlNpTUFsU1dZWmVHQ3ZmdUJ2bFFrUTVnOG1kMmRQbU9ZcVBkcllaRXVaWDRT?=
 =?utf-8?B?OE10bk1ZdGxkZ1UyaEV6Sk52L25rOTJ3UHJzV0FSa2wwTWVtVnRRZTlkb3d3?=
 =?utf-8?B?OFdUYTZKd0FoSi9IUVkwZEFpaWYwZGYrSGVFam5QaFlIYzd2U1ZkQ2JubFBO?=
 =?utf-8?B?S3BlVkdvRTlDSTNxdVFwaVVoRTRKNDFyaGQ1OUpaQTZPTE5naThNY0dCSHc5?=
 =?utf-8?B?dUx4c3h0dDFRL1FhOG1pREgrNUZ2WTJtSWRWZ1Evd2lVdFNVLzFKbWxCS3Jz?=
 =?utf-8?B?MUozcUlzVnozM1lCUU1BQ2Q0YUFnWlg5aDBlQUZXdmR6Q3phc2tlMWZCUk1X?=
 =?utf-8?B?OUFYeVl2TlFFdGtOWjVHeGZKTVRPeGt4djQrdlFFcXJLSmkwZVRFbXFkdkgy?=
 =?utf-8?B?SGViVi9NaXB4U0J4UnM0SnRzTmUyaXFYV0dnWW5pU0Z6ZnR1cnc3VlpCTGRF?=
 =?utf-8?B?T0NyenZncGhLZmpuWlQ4N1B6OG8xcVJPQVRjMXFmTXc2cmRGY28zNUdBY0NW?=
 =?utf-8?B?MVU0QzY3N1pEOC9zRXFIdEM3MHBFM2NwdEFZSXl2elYvaFRyY2M1SGtXdHdu?=
 =?utf-8?B?c1Z5TUZ6VmxMUU1SbkF1V3N1eHB2Tm1NVWdVdVZFb1czZk15YmtDTTdQcE5p?=
 =?utf-8?B?MjBRRkRiV0k4bVRoWThCeFplbmV4WVdHREJSQ05KTTBMTGllcWh1MXloV3d2?=
 =?utf-8?B?NlNud2dFWEZFbHpQQ0NBWEcrb0QzbmlkMkQrM1FpSXNlSEVhV3JaWHNURGNZ?=
 =?utf-8?B?ZStTUHRySmR5WkNQbVExZC9JbXdwRmNJUnAvMHJLdHA1YWRldlVIYVJkenlM?=
 =?utf-8?B?UVQ3MnRjdzJQSEFGTGhRbzYvYjlRdFVDaXhMT1pTMFgyek9sKzZWd3BnVmpm?=
 =?utf-8?B?QmFFdFE4YXVCYW9zREhzeExGRVZpcGVnSDNDcndwdWM0SWRTVzE0U0tyM3JB?=
 =?utf-8?B?UGluTHNOaUdRdDhyUmcvbTAvTXRnZExaK2FJZ2hVU1pRMjhqSlJNYW9nRHpM?=
 =?utf-8?B?UlJQM3NtdThtd0s4M1FVSWp1azRFS2RhTmZJUkU3ZWlXdTJGR2JaS296bVEr?=
 =?utf-8?B?ck1ObFlyMDVoVVhkZnNwSXI4TVVLZCszS1RWV2UvcDFxalFRc2l5MTRLNU01?=
 =?utf-8?B?V3RueS9VUVlEMHJjNlEzSmI0SmtNd3ptaDhDSWlaZzlCMjB0U0xFRG5Ia09Z?=
 =?utf-8?B?aDIvVVZ3a2pZbU9CU0oydXNrR3hhUjhpVzg4Tm0yVkNkVFJvNll1RWtpbjVL?=
 =?utf-8?B?RlFtT3dJV1RieVZDeFFuRWNvL1RRRDRxZXhmMkFrdVRxTHZ5ejBrRWUrRFly?=
 =?utf-8?B?ZzdLU0owT2J4WCtnb0ZhdnNTNGVhU08rSVVHYWlhSzZ3UW4zOEhxbXhkaFR3?=
 =?utf-8?B?ZVJpbGV2Vk5jbkRQWkx6d21TUU81VmZKQmx5Y25FVFJBVDNqYStPOU1MRXl6?=
 =?utf-8?B?OFhXdkdpNjZZdW9WdklNTXIxeDNpek0yczJHTWZJYytGV1kxTDF4Y2pEYmQx?=
 =?utf-8?B?ZGNacUVJS3ZzUG41cTM2SjVHUVE3Mmk5R2Nvc0tkbG5FOUZDS01ZblRQeFdI?=
 =?utf-8?B?Tnh6a09DalkySzdxMkZVcFNURU1aejNYeSsvUlhuOStmK2k2bmFpaUtPMVh6?=
 =?utf-8?B?cVZSWndlS0VOcDZrdjRxdlhJZk41b1VjS1VTSFM2eWNqbStobHFkN3p5OEN3?=
 =?utf-8?B?blNlSUltbUcrdmhjaHQzMXFwYURqZGpQSTBMRmUydzVGMHdrUE90YVc0QXd2?=
 =?utf-8?B?OG5xMEY1UDBsRjlwcHlnWEc2R2lVUG9wTGJzdnJiaHJiQUlKY0RkdjI0Q0JC?=
 =?utf-8?B?ZEVFYThOT0ZKcGd3NGthMFY4RUQ0L1MrM2Q0TW9hbkttbTUvTzY1R1g3bWpT?=
 =?utf-8?B?ZXllU2w3NGg2enRFNDdBV0loRVY2WGFSUW1COENSUFJqQXFNV3RvdmVhYWFz?=
 =?utf-8?B?aTgzdVU2TCt5elJvbjlpdDdsdlFMNW1YUGpoQXozTlo2TnVnWVBueElCZE81?=
 =?utf-8?B?S3NGM1R1cE56aDRmZEZlVDIrb2x1eC9ESm8raGFuOEgyOUN1WFhJZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dba252db-7eef-4b30-58b7-08de78671446
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:22:05.1428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQDSAs+NK13sFlnUm3jAkUQlZfuTuapzQoRkZa0SPri77mcH0R+jPD/hvxajKgl6Afjr7xpZLfLhAymeH24KlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6727

On Mon Mar 2, 2026 at 11:42 AM GMT, Eliot Courtney wrote:
> Add a helper function which computes the size of a command.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 9f74f0898d90..4a663a5b3437 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -450,6 +450,15 @@ struct GspMessage<'a> {
>      contents: (&'a [u8], &'a [u8]),
>  }
> =20
> +/// Computes the total size of the command (including its variable-lengt=
h payload) without the
> +/// [`GspMsgElement`] header.
> +fn command_size<M>(command: &M) -> usize
> +where
> +    M: CommandToGsp,
> +{
> +    size_of::<M::Command>() + command.variable_payload_len()
> +}
> +

This could just a provided method on `CommandToGsp`?

Best,
Gary

>  /// GSP command queue.
>  ///
>  /// Provides the ability to send commands and receive messages from the =
GSP using a shared memory
> @@ -526,7 +535,7 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, =
command: M) -> Result
>          // This allows all error types, including `Infallible`, to be us=
ed for `M::InitError`.
>          Error: From<M::InitError>,
>      {
> -        let command_size =3D size_of::<M::Command>() + command.variable_=
payload_len();
> +        let command_size =3D command_size(&command);
>          let dst =3D self
>              .gsp_mem
>              .allocate_command(command_size, Delta::from_secs(1))?;

