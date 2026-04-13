Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010057.outbound.protection.outlook.com [40.93.198.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C2E37C904
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Apr 2026 04:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776056040; cv=fail; b=sXHqhV2oD/sd4rsh0dGhdUFF7qUoICUIUROKISng90EQie/P1T/lJFb/iMhi8CoU9wb4go0XaTEL3LlU9NC5Gfc8RixoOmR0XSVvWSTv/tgxQecwzbE6uwsqrNDxd6Oa6IaPhgLRR1Zau8QLwbVy/e/p869B1p+l7l85CDJ1DhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776056040; c=relaxed/simple;
	bh=ywrSS+cXw1js0ZQtjZs4RZmi3qW6PxSO4ROuG7s2qq4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=kYH7Pp5lWvAoK7nnKYIN670zwvegprua4rVSAbWfC0P9womqMGeRtTz34+Pj4YPU2i9xVj6k5pUhbKcJp8C8E1OeYQdT2w2e6uYpHDLP0sARdOfnFcD379MTKKN82AnZVwIVdqN2wG1U3ldcNt0cSCCnqQ1s42D+AVEqqnXEWGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rowml2JF; arc=fail smtp.client-ip=40.93.198.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rowml2JF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EgnpADgoXG/H3jxO5jSAGCq4WUdOyoL3O8lXq+0XzCk/sCnlQuG1sUxj8HlweJ1ybYaPD4WlbnBT8Z+R0JuVrTDlQwSRP9gUHiFI3PA7DNCLRZXi6S8rlpdeB7fFHdSklXpp43DkA9q56+ZAPyCiebq8ekdkm86QsVPhg3ne8rqjvuGrQTzE5nF9sxiySC5xi96PqPxiO9nCuf3qf5Te6i163AcWYgvdNZRfkSKQ+BvyDGtjw1UpmDWBGFUIHK+kFFy1Xz2i6y2ocmD+ikF9cjQTeJ5sq8o9ZvYGmxBjSNEbA7nBz6Td0ehfhXhXfrcKHRnx5e+0DIOwL6HTqLlPjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqAhCVxCael4ukFj681EQDiD/+3DtsktFRXj6BQNIIg=;
 b=cjSWKFvxG5b77KJ5xf6MO/IFdsvC1n97tDo6qpsk0tLymlVdBhMieM1ZFSm4UwKUh6s//26j6rm4MfOry9oVdKGyHlpgBRL2bLnxw4O8kh6caAn2QYdQmugFChGzjID5dbyfyZs65WvIbi6r5USU1kUCRYBV2CN9V600gHsYBWA/ERu6CUbw6n+p+JX+HlvHsCUU5jFPYtRLUsqh+pQq4qEk20I4nsqMMI7YenaHZhwHb/6+NEUkDGvby8xGGd76DllfKGyGAZH4XbTI7i4ABTZeLtxU07jIs1mJ0TH4fWFAmHlJGqRW/iVF8IbU7Xwrx8eGK/6eX6g2i9sovjwxRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqAhCVxCael4ukFj681EQDiD/+3DtsktFRXj6BQNIIg=;
 b=rowml2JFab3HR9lbIN2/YztSFz/NJjQ/+QOtP0/t8hzUZ96QvEbz7iuXEFYLuRQgLRAptaNpH/Dwe0JtC2sj8/D9NwtKvoWZLZfu9jW78ZFMOxYbaGX4v3BAbo03UjY76xlxAOTvsd0zLegYjujVVmagrtg3PTAmVvalTfF8hnrr+gmz8awA6lwhJTSasp74OumdxBkDC6dCYXiG8MQE01hJd5JGYJriL1dCH7PKuBf0ftbVeKyDoRlGKlLvpTmn1REZZwfTr/arYDP+DTwS/zqhkoTWvZqnyuIpAtIsL2IJz3P5iYJMstHIBFHkz3XQw4Sqm2Xv4taplH0wEiMWcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DM4PR12MB6231.namprd12.prod.outlook.com (2603:10b6:8:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 04:53:56 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 04:53:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 13:53:52 +0900
Message-Id: <DHRRBHH7VJGB.2JGN9MQRRVQ6Q@nvidia.com>
Subject: Re: [PATCH 5/6] gpu: nova-core: skip the IFR header if present
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260410203722.1586938-1-ttabi@nvidia.com>
 <20260410203722.1586938-6-ttabi@nvidia.com>
In-Reply-To: <20260410203722.1586938-6-ttabi@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:405:3::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DM4PR12MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: f90aff43-cdc5-45dd-904a-08de9918ab41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0vd/kxn7APfz0t+5nMgWhUC3+nm02eMf83voXODeGrQ0VHdYtKsdM9350gcvVhyTj8Cu/q6flGhiX0nnb/csQtlcKqF4JMsqYXTEYpbHgLbMpTHPLHoztJOb44/p9mOMT0XUhgnG7TXeEq86ePT+07gp1kgYadrvg2c72VEkZvDgmfMScgArvkqDUnmdqniiwCnzP0zxZNhP5H3Oqf9Vo/UrOdP1VZIHLdDuzEW+d6eUVUtJ2qWNGzX+9/wqJ9KixHm3mutHxGsC5eDsZ3Wvts7UIJweycEGHyvw0aER/BD7AXC6EDp137gyOojbIGkxicwA7U9+Wvd2wUJwUh7kaFcrTdvKVzbD5/Dp3Uhatb5wA46zh9otiCWsU3R53KDvhbmiWM0dBr3rb+VjjdNokqPZuL1QRSnHEJuJcNv1HFA1bPFJj8Ddk04l8yQv0QYC0KEDRisXh2hFA/RmFXdiKwSI4mAcbXS0LwbGZQ35QzKf3lmM9xQZehRe8KB3HNyUL4+ZKJXp+ifJKknELFhnkkH1C9XF/nHtF6SIHsRCvj/pJdsyG+ftNW7xk+qYh/5W8OfoNuCc2WMKTXABLnrvzYrmYk6vNZPUtypeUGwnj6ocxNUsPS27FG1MB4OrZ6SbrJg3+TfW/YuoyZFCgb21YKc5eruCAMdz5hUvy8bpYLqHxAg5JXtrMZsdT2KJSC9Pkkvl3dvx/OeNdJXvSWPg5B0mIeTzQHQCAahjsvzdXcw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjFLWE9QNVprcVByWDcybjVyZEZYdFlJd1RIMHNlUjFEUWhlMXI0MW8vNkJR?=
 =?utf-8?B?Ni9YY1hVQSt1N2xRQThvVS95ekp6VGludWV3bjhqd29WeitJMXIzRloxZ1Q3?=
 =?utf-8?B?YnRybzRSQ3dyU0Z6dGI5RHg2L0dIR2lMQU95b0hjbit1bGFQTmVZWTlPd01R?=
 =?utf-8?B?VmlLeTVKK05sa3c2RWtwL2pxejRKa2E4V3ZDM21ncVZTVGQ0T3BWR2pSM2JP?=
 =?utf-8?B?WTZPN1p1QXRkSWZLVTk3WE5CRUEvTithMXNKdVg1MWZuZllKUnY5TVJHL1JS?=
 =?utf-8?B?QStraG5EclBEQzR2dm9ZZUhpVGNFeGNrZnZGNy9nemZYd011bktwL3NjN0h6?=
 =?utf-8?B?QW80bmxUUkR4WnoxTHBpWUdUR1RHalIxYUFHaW5xSFFocTJFd1cvUzkwUm04?=
 =?utf-8?B?bFpUYitYNVI5UlU0Y3c1eGxJdkhPV2xSdGVkN1ZTc0UwMnhMMWUrT0VEYWJ0?=
 =?utf-8?B?UnVzd2hhSkh1eVdiQ2RDd0VYQ2ZkZDdVZmRseWNyL2Z1UHJ4bHRucERRbDNJ?=
 =?utf-8?B?NElVdGFZM2dqTzUxb0dnNXczS0lCQXBSWmhjWFU1YTAyd1RVOXVnUjFaL09W?=
 =?utf-8?B?U0VOYnM5eW1yUEluNGJBZnBldkVPV3lvUkt3MThvRmdjZG9TOVlZM1VMTmYv?=
 =?utf-8?B?YTYrWFZwUXRNSnlHZnlFOWlrdGIySm9TUU9GOTJMYnB1eTE0QkE1Q0tyMHcv?=
 =?utf-8?B?d0NHNnllQTlUdWFvUFpGcmpaMVFIMkdFcjhqUnRLcEVNNGUrVi9FeEJSZEYv?=
 =?utf-8?B?UWlpZXBFVmQrUTZ6ekZhTHpvQXlNZWROd2pBcXBCMlkzdThFNFpJelowYzRs?=
 =?utf-8?B?SVNaejNHb29ueEZwWlJUd1lZWDc1YkdYeUtDUHZxVFpkR0Q4ei9heStjV2JY?=
 =?utf-8?B?cmRnYWRQUGNFS1pqQUlLNitLazluZXN6TWs4QXZTMW5nOFNVSk94NHZKb1E2?=
 =?utf-8?B?MGcyYmJrbW5kUVhhbHZpbWp3WUNFeXVLc0RiUUlDY1hGSzJWaitzbW4vVHVX?=
 =?utf-8?B?bXBaQ3NUVEZXVkhWNnU1ZkdueUZOdTBxQlRrSGNOcGRweSsvYmxSdGVkMkJq?=
 =?utf-8?B?dzRoS0VnR04zOEUvNHBVSnZVSFcvUjhSMkw5K3hLVGlrU3BwaUp5SUd0ckNU?=
 =?utf-8?B?eVFkb3VxdjlmZ1FsQjZBUWI0MFFRMEpRMzNYRFB4NGJ4bHdTWHdSTVlQU2tR?=
 =?utf-8?B?alpoNUlQUzl0NThnY3ZFcFdmWW1OdXU1N2pmRW9kTEpwRDZsVHk5NnZuUWZj?=
 =?utf-8?B?MFp2SVZtY0dQRm5NVE9tM21xSXpYL0M2bHFpNVM3aFBYeE1qd2R1TitON3Fm?=
 =?utf-8?B?cjYzTHNLVHE1SnBpQzBQWGZ5bTVjczgzbjFDbWN6dDhiWTNPUHJYdG50MFBp?=
 =?utf-8?B?TER6NXp5c1RudnV5c3JqbTA5N01RMnU2a2hKTzVSMWxIL3RtOGtSaXBQTUVj?=
 =?utf-8?B?MWJaUHM0QkJidzVWL1VKK3JoSHg2K1Z2U0FWSCtkaWsyYmdNcWpZa1dXaTJL?=
 =?utf-8?B?VHJ5ZGpaUWVQZDFuOWpXZmRkdnBSY1g4SWdMb3d5MHJSZzhwQkFWakxqTjRr?=
 =?utf-8?B?ZG4wdG1hbGVsczB5MVdWb1B4ZTVMK0dsejRjcVlDR3RHZkFYa2RqQmhsUEZi?=
 =?utf-8?B?TFJRNi9CSGhZbDEwWmdkcW10R1FuY1dBMDdOYTlEOG1DK0RvYkIrMjhkYXh0?=
 =?utf-8?B?Z25nMGZSWGpnOStudFYrdlpINTVLbVNZNFFzMEdwekRGMXc3OWFGTnNhK3dY?=
 =?utf-8?B?TktJdTlrUFZNNDRsRzJIS0lzWnB3UG40SHpQME5RSnNVY08yOWp1SjVoWkEx?=
 =?utf-8?B?UysvU2dlWkJTcmR2TlA2T1FVdjBFZHVYS0VlRW9aYWhXR1hwald2ZWtMSDBx?=
 =?utf-8?B?QzNZUXgxQ3pQRW9qWEdDQXRoUjZtakF4TDhISFY1N05WcmdCS3p1amlBZlFI?=
 =?utf-8?B?YmJlc0MyVjN6U2ZGZzgwMUpXRGZOODQ3L2RwRUFZNWl2YW1tWmE0RDhrYmFL?=
 =?utf-8?B?OEZmUVhoMVFOVkRyWnExV1U0K3JleXVVbEJLT0pWaTlUdVhrVXF4MTAvc1Ir?=
 =?utf-8?B?eWN6T1lzM0tTZlBkNVJUVlRScEZEWWRGc2xwUGVEaE9EaFpDWjBlQmh1bU1m?=
 =?utf-8?B?Tjh1cUtwQ3ptSnJmaklrSE1XS21Dek1rcmlLSCszRENTclFSTE9ZWForSlZB?=
 =?utf-8?B?VVd4M1VkSWVZTE1nNjN3TEdPNlM5R2czLzlsc3l4YWpmWllZVnBGeXJhNlFO?=
 =?utf-8?B?clBNYllvcGtuMzJhU3VsQmo1R2NZazUwZW1RMnFUYWdDVTcrZDVHaSthdFNv?=
 =?utf-8?B?eGxMSEREbTYxUVlXNEhvTTNHWTJMQ2hycEpyTE1EQk95dmRDK21ZRmR5MFZk?=
 =?utf-8?Q?lohK2baXMbLaGerWEUh3S4PvEuW+H+0cvF5o3sSewvnYf?=
X-MS-Exchange-AntiSpam-MessageData-1: 7WRYPph1CYWA5A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90aff43-cdc5-45dd-904a-08de9918ab41
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 04:53:56.5691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFP6V2UKke1oJ1h7SkiRb9T8Gle5N2jz2NlZ+9+WOn6ZGX1ZOkhGaR4GoRbUJEqsEouRjKwQyGlR66KNpyQomQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6231

On Sat Apr 11, 2026 at 5:37 AM JST, Timur Tabi wrote:
> The GPU's ROM may begin with an Init-from-ROM (IFR) header that precedes
> the PCI Expansion ROM images (VBIOS).  When present, the PROM shadow
> method must parse this header to determine the offset where the PCI ROM
> images actually begin, and adjust all subsequent reads accordingly.
>
> On most GPUs this is not needed because the IFR microcode has already
> applied the ROM offset so that PROM reads transparently skip the header.
> On GA100, for whatever reason, the IFR offset is not applied to PROM
> reads.  Therefore, the search for the PCI expansion must skip the IFR
> header, if found.

I like this commit message a lot because it made it really easy for me
to understand why we are doing this. Could we concisely put a comment in
the code as well explaining why it's necessary?

>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/vbios.rs | 39 +++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index e726594eb130..a7ec68448a4a 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -89,13 +89,50 @@ struct VbiosIterator<'a> {
>      last_found: bool,
>  }
> =20
> +/// IFR signature: ASCII "NVGI" as a little-endian u32.
> +const IFR_SIGNATURE: u32 =3D 0x4947564E;
> +/// ROM directory signature: ASCII "RFRD" as a little-endian u32.
> +const ROM_DIRECTORY_SIGNATURE: u32 =3D 0x44524652;

I wonder if we can use the bindings for some of these constants,
including the fixed value offsets below. I found these values in OpenRM
in dev_bus.h, for example (but it was in tu102 so even though the values
are the same not sure if it's semantically correct):

```
#define NV_PBUS_IFR_FMT_FIXED0                        0x00000000 /*       *=
/
#define NV_PBUS_IFR_FMT_FIXED0_SIGNATURE                    31:0 /*       *=
/
#define NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE        0x4947564E /*       *=
/
#define NV_PBUS_IFR_FMT_FIXED1                        0x00000004 /*       *=
/
#define NV_PBUS_IFR_FMT_FIXED1_VERSIONSW                    15:8 /*       *=
/
#define NV_PBUS_IFR_FMT_FIXED1_FIXED_DATA_SIZE             30:16 /*       *=
/
#define NV_PBUS_IFR_FMT_FIXED2                        0x00000008 /*       *=
/
#define NV_PBUS_IFR_FMT_FIXED2_TOTAL_DATA_SIZE              19:0 /*       *=
/
```

Unfortunately IIUC we can't use the bitfield range specifies via
bindgen, but the FIXEDX offsets and some of the signature values might
be doable via bindings. WDYT?

> +
>  impl<'a> VbiosIterator<'a> {
>      fn new(dev: &'a device::Device, bar0: &'a Bar0) -> Result<Self> {
> +        let sig =3D bar0.try_read32(ROM_OFFSET)?;
> +
> +        let current_offset =3D if sig =3D=3D IFR_SIGNATURE {
> +            let fixed1 =3D bar0.try_read32(ROM_OFFSET + 4)?;
> +            let version =3D ((fixed1 >> 8) & 0xff) as u8;
> +
> +            match version {
> +                // Note: We do not actually expect to see v1 or v2 on th=
ese GPUs
> +                1 | 2 =3D> {
> +                    let fixed_data_size =3D ((fixed1 >> 16) & 0x7fff) as=
 usize;
> +                    bar0.try_read32(ROM_OFFSET + fixed_data_size + 4)? a=
s usize

Should this be an error instead if we don't expect to see it?

> +                }
> +                3 =3D> {
> +                    let fixed2 =3D bar0.try_read32(ROM_OFFSET + 8)?;
> +                    let total_data_size =3D (fixed2 & 0x000f_ffff) as us=
ize;

What about using the bitfield! macro to define bitfields for these
things? e.g.

```
bitfield! {
    struct IfrFixed1(u32) {
        15:8 version as u8;
        30:16 fixed_data_size as u16;
    }
}

bitfield! {
    struct IfrFixed2(u32) {
        19:0 total_data_size as u32;
    }
}
```

> +                    let dir_offset =3D bar0.try_read32(ROM_OFFSET + tota=
l_data_size)? as usize + 4096;

What about making an inline constant for 4096?

> +                    let dir_sig =3D bar0.try_read32(ROM_OFFSET + dir_off=
set)?;
> +                    if dir_sig !=3D ROM_DIRECTORY_SIGNATURE {
> +                        dev_err!(dev, "could not find IFR ROM directory\=
n");
> +                        return Err(EINVAL);
> +                    }
> +                    bar0.try_read32(ROM_OFFSET + dir_offset + 8)? as usi=
ze
> +                }
> +                _ =3D> {
> +                    dev_err!(dev, "unsupported IFR header version {}\n",=
 version);
> +                    return Err(EINVAL);
> +                }
> +            }
> +        } else {
> +            0
> +        };
> +
>          Ok(Self {
>              dev,
>              bar0,
>              data: KVec::new(),
> -            current_offset: 0,
> +            current_offset,
>              last_found: false,
>          })
>      }

