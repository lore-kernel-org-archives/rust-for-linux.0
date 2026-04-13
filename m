Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010025.outbound.protection.outlook.com [52.101.193.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB3B37FF47
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Apr 2026 04:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776053971; cv=fail; b=QW7jU7xVQAYVYXgNbQgVHXDyTnysWKjvY6y3K7zTVCpyC1pxgMnZwdVhqoOTd8on0XIkDJgdSM08sV9XNKMWksccE3Xo8uusruz4sUrSHglNlxI9bBuQbjncmc7pjcNYaj4ZBjTBiejFscNqOpuKBBCVw7foCD7DPBviGOhmr8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776053971; c=relaxed/simple;
	bh=1pnjxkL0Ua4ei9DA83kDj/Et6Vmt24PaJx7O097vbXo=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=OS4yZdGP7o+dO/X3fv9ffNNn5orVePRE2pdqb7BBuvW5JqVDG7r737pr5+3pofeXTZF4lmgh7KoRHrq77pyfH5rQPG2pbTwQQwSLI1t2J3KmZGBxFHp90EAQXdsXwcQDVi5sc/ZChskS/GcWnHuxq5QWlNyxp68GvPBSDYLt/zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aV5e+lRB; arc=fail smtp.client-ip=52.101.193.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aV5e+lRB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPN/q6XeYi6duEGHvC5F3w4X+wsDYOS0IxrNXSikOgXK3XHJ7OY8rXlsSBJ+CtqcVNt2yJKShQysUGO1cmAb2jnck/w1FANWDhyZm+AnnDRnm7X1QqZNXyt08eNZxQzpNxNjpzurEGUHZI8ZF/fzJXGgP0H/0HEjrj+DMtZtr2MF39byk8/CGwdVNeRpDJ19qVd+qW3wKResooLcAuaLmFoLyOsqB+2cANPmaAj222jaw3KGC82oL7Gs8QoZN4GSQMd3RHlw/spyZY7jy/ulNClDmRHwMhXHarihTvc6vqTjZ9V4LtyvY4Cj10iJfj0PAfSuNdue6By6NcHztLH0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGUzrbjbyKDWWTd9hp6VPNkCzWvyJ1DeH/Q5h3ZO7fM=;
 b=bQJS8B5TKRCUs3z8lnhx6AcduDcy/N+S2M8mre3uTZ2/ItJxWsgc/50Ik9ZcyIXdqiDTRm6Jr6t4GcOeuQJSQW2RbZiTcBlkHsXy84jYdqAalYsHLJxAPpX/YqkjATfH2GgNchT7Bz7034ey1juULIPbF0zRWUzSLGVaCCpkN6Op/pLp6FD7kNxVEeUKWUfTgptg+FWHzHrfVRPnf3IuRqExHo+OOTPww701VZk0wmYco4ZmnsnqM6JPDkJLrKReWzL0vtspjRiSJ6Gvf2ZVQch0tBT9d8zScOHXMgS9VkIK2QRmZ2hmoJCvo67DXtoPn399c+o+VJEmtG1vEotluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGUzrbjbyKDWWTd9hp6VPNkCzWvyJ1DeH/Q5h3ZO7fM=;
 b=aV5e+lRBMiJOZTBw8uT0uG9oeg0IhyS/huSb6BtO1odsicNMR9jVcXSwglFBFQRWZ2D9m3G0RdPx9Mpl4XDSw0b59WV9BSvHe0OWTSZM3LDDVZo8yaXVlAkwf0qZ0W+OttPR8byHWB/zfqsg8d72omtUNPzznkpTnoQRsTxDhXx7OOmNbgoyvWG1k6kaDu211fArO/uttju2vKRtXDHSwFBLhTTjeA39/kZLtftc3iihMqTHcQKZvjtCwKVPwdtavElnNcjT9/8LA1YrWz4uKAzxiaxYGcg2mG9PgYwwXtjL66c9n+gab82SPO4J3wg+Q5+8lV6MSSJziBDYdF25fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.17; Mon, 13 Apr
 2026 04:19:22 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 04:19:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 13:19:18 +0900
Message-Id: <DHRQL0KVSETV.2YWE5W5JFGHJE@nvidia.com>
Subject: Re: [PATCH 3/6] gpu: nova-core: only boot FRTS if it actually
 exists
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260410203722.1586938-1-ttabi@nvidia.com>
 <20260410203722.1586938-4-ttabi@nvidia.com>
In-Reply-To: <20260410203722.1586938-4-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb6b8c7-ac9e-41bd-3b63-08de9913d6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PMPidwI+3LZSy+IvLv7tqx99cYfwfakRDGgNF9DoTxWOJqTmrYqxqw539LY79D1xVmlxLsHCAHjhIZHOfXiMZMfEqbPfxJjRLT/1DUN7gqEJSYMsEgFLDPhKi2rGctV1ikR6NaLds12NLCkZJj47sTVUEeyhHF4xSLQHL9ocrv6YA/n5mldsENVhZIbHRefDeggRjpxwBZpzBNOXeDueLLhL1rFmej15q7eOHYOSDkLOGrxWIaV0FSIJJkYJQ5LYgtHP849tPoa/ECPTd/8SZg50ldkSIi1xPuv3VshJ2i1U40P2wHZRRRu4XrT+MObggTTfcs6mJOChG/UzcDJioVOA0WgiUMtRd2rZMcsfWJM/Rd66Y0dbKn+/TKYwCStBdkLZ0ZaHCpWvsGnz3US4qaCgM5gFygoDaiB3ul/v9xur3gRbQQ++uJeAOga3xmAI4C56rlpyG9hfSMAm0A4j/lyKZbybYFoB4vR+qLZf8gIfH/HeCui6/eGsr4ec59U/OYnjYnVamvrQtFxZOa5R0KPgatUzsYU9+PxeVs9UgkarZLhlz78GOOTi/GjQedoYQMQZPLES/YyD1MwfHEWMkGKtR39U7U6oDGJ0XVv+wpgOtUy4h2upKre5sk/YSAb2fbiMr5RAczEhRXEqeEACvARHJoaSchEjec7iII7G0bpF4vCCMIkpUpzO8LiUAaaWDRCT+HpI7D6STBYJ57PSZ3UR9qaMoN29+1ey9r+D6Go=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnFrM2duMGNGVTVObTZ1NFVBWUNjZTR2SmhZaDdZajZBZ2tldDFkZUxlNGdH?=
 =?utf-8?B?a3ZEM1ZrYXd1YzErbkV2OG8xeDZsRTNRZmpmWWFORUE4Znl5TW15MEFhUmhO?=
 =?utf-8?B?dzY1QSthRXZZMktiTGo2Zi9sb0ZrNG40c2UwSkYvWjgrUmtNUmI5TEdkdnNi?=
 =?utf-8?B?MlM2V0hEV3lkdUNNSmdqcE5iNmFkWFRYZDY1UlZDNEFWUHQwTk9lQnkzTjNM?=
 =?utf-8?B?TCsvM3pkTTJIRmFnejM4aUtBZ0ZCMVlpYldtMFRWMDVCK2dOSWJTNHBhazFZ?=
 =?utf-8?B?YjVRUnVXQ0N4VVM1QlVPRVR4UGxDeTdFdXVFRFVkMlc5Vk1IcWpOZVBxWVFF?=
 =?utf-8?B?SFF6UWp2ckx0WUhMNTJta1N2M0N1OE1NTS9IU1N4LzNsUUhzTXVVL3kvc3RG?=
 =?utf-8?B?L2FUN1FJNGtjNGR3NS96MG9BTzlJbWpyVnhxejh0azFLVVExOVJ5Sy9ISTc1?=
 =?utf-8?B?Tll5eFRtWjM1M09PaGhRM3dWU0dNRmN4T1lqQUhhbHNCL1F4Y2N0eXMwanpk?=
 =?utf-8?B?YjRaa1BFMzhtVGVNeS92N2RNZmFHMGFSQzY0YVJrcGphZzhwL3JCSlJVRG1V?=
 =?utf-8?B?d2JWUHVnZDhEa0N4RDIydDh6bE9TU1lPWkkvRW5UZDNMQWVTc3VNbTJSTHJE?=
 =?utf-8?B?ZitVekwwL0d3djZvcE56TlhDZVNiaG9VOFpYY0NKU05KL3FEM1lkVzE2YlF5?=
 =?utf-8?B?R1NveEp1VUJYd2J5d3drTkpiZkg3NFA3QjV5NURoZlRMQWI0WWJ5dWZ0ZGkv?=
 =?utf-8?B?T0NQR1YyRjBJK3RiL0FwcGNabklmQi9CZVY2R09aOU9Hczh3c3U5L3lvRFho?=
 =?utf-8?B?NkZZbWpjM2cwTU9SbWJDSVNPcDJDWjZ0OHJDWFNCTE1BbFZPWWxxMU9vVENY?=
 =?utf-8?B?TDlHRVoxSFhHWDFXZDVRYnZrRFdIbnJ4ZTFRQnV5T1ZkclpyTWxtY1NhNGpZ?=
 =?utf-8?B?cXE2SzlPWEwxMGYzNzlnazlJYUEwcHJ4QkhHMXJXR0Rpd0ZYS1pKLy8xSzVV?=
 =?utf-8?B?bUg2SW5zYllzeDhtVlVvU25XSGlnbFJ5Q3V1M0Zad2xwZ2szVTFZVEE1Tk9h?=
 =?utf-8?B?SVlVQk44UnlSUWlUa1plNUtKbjV1NjN0WlE2WWNKbVJTejBEQUx1VW1OcCtL?=
 =?utf-8?B?b3lPcFYwK2szbVZtNUMxZ2FZTmtCci9lYnZ0SVVTbDFiNjVkMTgzRXF4UEFr?=
 =?utf-8?B?NUpFNThUVm1Sa2FQMFVCQUUzRDdIRDREcGZ3ZkJlSDQweUdqZlRZbmdtd0Y0?=
 =?utf-8?B?bDA3ZGwwWXAySnN5VFN3M3daM1ptY0dVVitBOVQ3VVVsWE9Ud0ZycmErV0h3?=
 =?utf-8?B?cGlxU1FQK1BTY2NSZEJyU0ZQL1ppT3ZIRkF5UXpVZWdyckxGNXlBbFF6U0FP?=
 =?utf-8?B?bWZ3Y29uVWZaMUdQZkhlVzM5RHdTanBId2RZV29ndWxDbUZWRzRGK3c0RXN4?=
 =?utf-8?B?d2dKUEw3N2xqZXFPTmlOL1dRRVBGOWJwNFRRSjNkMjEyKzJYWnRJL1Y5YUlr?=
 =?utf-8?B?SnYxVnVQTUpNNUw4RUFTQ2EyY2lkZXlqeUlLeGNhL1lQckZmcjlHMXh1eCth?=
 =?utf-8?B?UHBNNVVTK3pxNUtSMEFYdHRNT3BlMkd4QlJrNHVhVzl0MUZaeUZ4N0JISkR1?=
 =?utf-8?B?cmZSL24vRmQxR0dhbCtHeHMydE5sSk1kSGVDZGhrZWh0OWMydlVlZisxS1Ur?=
 =?utf-8?B?SzBCRDJxL0dvVm9zWGtJMEpXeU1BMU5xN2IyY21UVklvRlFnVnJBKzVNeW1s?=
 =?utf-8?B?RWZtaERTaWJvQUNZbzA1MmdYTHZBKzhDejF1VStnQUgwQjF0cXdTNEYxS0Mz?=
 =?utf-8?B?UzFhdDZOVmlSNXRQRFYwdWJYSjR4OVVENG5sMHpTNGFFdWRQc24xZHNjWDFl?=
 =?utf-8?B?dWZnRDBsSDkyL0Y2RnduVHZ3VWtpMkhJOGJHb0ZyaGt2d2hZSk9ZQ2pFY2Ny?=
 =?utf-8?B?TkhpWlNpVFdUSVB6Rnl2bEF1SnVhTGxKVTQrS1V0Y3N3RENNbTR3WkxGNURW?=
 =?utf-8?B?VmhsYkNLZnoxRlN1ekoya0pZbUVPSTQ1T2F4Y0JNOCtMaU44TTE2VTJLR3FI?=
 =?utf-8?B?UWdZMEJsNkxodnhQRm5LQnpSUjRFZ1ZQd0lyakNSUHZOYkRqQ3d0WHBUcmN5?=
 =?utf-8?B?cWVMRFdaNDREa1hkYXo1UGVNTEk5NWJsWjUxcE82Qi8zWDVUcWg1bk0rbzhj?=
 =?utf-8?B?UUtHUUFtVG9qVC9TYVgzQ1dLMlNIcitpZDdyOGhnbzYxZUtiM1h3NUVrWWx4?=
 =?utf-8?B?ZzlYTlRPYjYwaStuVFhqcHhJMDBRc0JrbUtya0xmc1hZbVVHeXVLVmMwVElM?=
 =?utf-8?B?dUgrWDArMFlQOFZNdDl3cFpBRjJYYVorcHhyQXpSUEpUcUtaMHp2UFRzKzhi?=
 =?utf-8?Q?ziGlhOc4gfXdcz6DW7WOgtmmDrNEUl23GQ3qhUkkQd95D?=
X-MS-Exchange-AntiSpam-MessageData-1: 7Nxg2WdY5rQCHw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb6b8c7-ac9e-41bd-3b63-08de9913d6a9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 04:19:21.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnVBf6alXwglp+yIUbzWUspUxJY1el2JBQKLbNIQKuME/eSwbc5n4LsD9wdAvteEXkj39ucZtfEya9en+/MY4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035

On Sat Apr 11, 2026 at 5:37 AM JST, Timur Tabi wrote:
> On some Nvidia GPUs (i.e. GA100), the FRTS region is not allocated
> because there is no display hardware.  If the region does not exist,
> then FWSEC-FRTS should not be run.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 18f356c9178e..d50dc9f41831 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -155,7 +155,10 @@ pub(crate) fn boot(
>          let fb_layout =3D FbLayout::new(chipset, bar, &gsp_fw)?;
>          dev_dbg!(dev, "{:#x?}\n", fb_layout);
> =20
> -        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_l=
ayout)?;
> +        // Only boot FRTS if it actually exists.
> +        if !fb_layout.frts.is_empty() {
> +            Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &=
fb_layout)?;
> +        }
> =20
>          let booter_loader =3D BooterFirmware::new(
>              dev,

If FRTS is optional, WDYT about making fb_layout.frts an Option<FbRange>
and having the frts_size hal method return Option<NonZeroUsize> for
example? I think it will make it clearer in other locations that use
FRTS that it possibly might not exist.
