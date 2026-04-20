Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C096173;
	Mon, 20 Apr 2026 07:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776668567; cv=fail; b=Pybi6w7X4PQ08XfiIGrmXzCV3rsv1iVvHSAHjA/LmuxJAAyEaL1h9xexuWfCh1jRcWpW4sSVkFXFonnXB5KbnLlriMSb9hVAKQrshcAvHn87OrhAmfbgUw3UJuHgVDBogfeyB/sAeX4c/9ASCskmhOmX8y6WoBKHpGpiHAmWLmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776668567; c=relaxed/simple;
	bh=d6UmpC2c4SLoXvHiXZcZmLFdf6aL26g/L89wmbDXAs0=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=E0q1CJ6C9YKDq0VLgejZLLauSJedaplan+klyD2LNvpDWe4WFZa6JZ+4DN6Vn2PRPCM4GnVtdwSNMj/TZV+EXMfg+6Tu1YIzvkIQOusuk5z4OnWLrwLSo0qbOn/GPDmLVRE6Y8tAcH9z2pIGO6iQ5d5e+bDpiiUm41yPPm7yTkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rA9QmKHi; arc=fail smtp.client-ip=52.101.57.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rA9QmKHi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpRkRPAH9OsuFZISJ/lV2J8m1UR+VAmCYvAx1lW60dpFZMsJb14VWZQu9iwmEjhCZOllrQHDNsLmtzYlddDjz+Piz5vygI2cH1uDy6wjPJ4rC/bXfO3zy76p6fJXh23X2ZFODXQl5Mk73MrNZskwvVtu4NQSbaigY/RJSV48HzeYqyx2uhWxL5H6mmJnQ6DvNk1B6DiCL/WRfzKp+eqa1UMFV38CeuQnbV3h4HTRD+enIPWHsRZMlzcnDhKqYcDVFUPy0mP1G16yOwdK5moODnAH68It6580J7P87pJBXT7O+ttkYUscdCZ/EitP6Cr5yBtBI886uZnre3FbbMi1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiTadx4V3dPK3TkvIiJplJik0OWOGp1upejTNlkwtTI=;
 b=EsTjVQDnPnW8SkvnoecnH5SDKc4SF6mnYzNF8sgX0glnFMFlh2RVphKYqC7jbRtcVSBh+N0v4nBQENrDUFIe91/7aAL482JxKTUaItCAZr+Wx8/ZBt8SkPVo1vTt4oFp2MeULcFCed/GY3+mXTT8yvY7/a6Q561SaYAbDzfCDiIRDUjXGEwU8b5QC/AenGBhwLjkGERXresGLKW5qn7fxNkH+Nwil0srgOvlXb2tPuHJFVhmu0peOdh8VzCw5xAGw1gDuqMPxRf4nWGRx6SSIFGaR8nSv6DQDSV9y74mxtgUsCrsHDAI6lG6G9MyHcaA607b6buSHLJl4zjXePFy5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiTadx4V3dPK3TkvIiJplJik0OWOGp1upejTNlkwtTI=;
 b=rA9QmKHiMlw3ziugUNf0XAdvK/ohs+ZqCkBR3/WP7ejQorO8j3A8mlOEJBwOMq080LQ4LAL8lsozrNV94gDHs9mh7xOt1Jni2awUqAWb3kJb9rpph1RjQkZadrKTruLXksDSNMlADakdPW5h5iwH+W9OnQuBd04iXPgoQAFiykNNDM5CqcuLy+3f5mbYKfn3OsVLMz8VK4pIwzLHOTUcH3Q0ON8mK/RpqlyTtYMF1PJJWBFua//YzTV0H0dF6x4gICKVh0tFLNw3xZi3Dn6LjyznqStBYIElt2mwxkZp1DufYr8a4FHxfXEa5iRXi8QFvHHaukPSuBildIVFbVBffQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6876.namprd12.prod.outlook.com (2603:10b6:303:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.8; Mon, 20 Apr
 2026 07:02:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 07:02:40 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 16:02:36 +0900
Message-Id: <DHXSFVDH55RR.3I3MSEMNRQDSQ@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
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
Subject: Re: [PATCH v10 27/28] gpu: nova-core: Hopper/Blackwell: larger WPR2
 (GSP) heap
Content-Transfer-Encoding: quoted-printable
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-28-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-28-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 18499707-b59b-4d1b-fb08-08de9eaacfcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wwZt6JfhU0unBMT9SovDoanTa85a6OTH/oJ4I4klWTqSeHp/3dZ+WW0zvujPirG8bvbMNRtVz9KnA/lSh2UWGfZ/SVjnvjqmGfoB66dH+Vpg7BehBk4tT0vJeNyhEvhefibHrYHNb9otb34w/B3AuT9UjZougoPec7unBAdiBd8dDhFMwoukSLTpmV7R0fwhDumADeo88Abiy6smdxgZyMNknh+EJ/fb718uKU7J1PQpCH/W3zlDitCdU5riRMs4jhQmb9qFZsB042ONZjDW5UHom8qMHphPlnTlFZ4XUqp7OqUJxAvZBreLoMhqLk0msOmoELMrJRLREdB/VuII1S0upbySnZASv5fzMeYHCYC18kcnRO8+F4XS6y0KauVvy3SmD77qtWu+FB16AZa1mw4n2AL4+P19WoRHBLFZcTKLU6GuBEPYK0kQkGkq9sVstL0PUt2XybIgdGjBliXxIbUzdgKX/+Dmk97av6qjKHZWwexm+eAescpBT6lPGpLDPt+bpLzY7ZkhGiCijLQAH/TApFpqBLuudEMvqvv+ZrfRnmJiJf6CBrUma3CVYJm1iWAUVM3cPd5PKQPzNfN+yZdOZQ6hvIWWLMd11Q81NAtn+Uk7TZ3+vhXYiU/YpT7+jKAGYGsIEPQXsWJR9axuiwza+ZagoGdEvQyG7PlWy87vJPtXEF5drB5YOTsFEOp/Bd8UubDKqvCcqiKsHwwStypeYe2A9Ko2OSB0g//lWhk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkIwUWduSU9MMExQOGNkVmZrKytJNVNUZG9OQ2FoOTJDenFyUncwY2FlWjk1?=
 =?utf-8?B?bDdZVzB5NHl3QW9XaCs4Ris2Wk55VWY5TDdxenBMNGV2a0ZJVitVVjNZYnJL?=
 =?utf-8?B?V1kwRmNlcVF3a0hsRzYrMDBoUDNQcnowT214NFl3bzVRVUNqamxZalJ0QjRy?=
 =?utf-8?B?aFBGRTQ4N1ZtYTdOZnZJZk96Z3lZbWhra2pnZ3pDU2NVbTNIUHVYUkh0Y0NO?=
 =?utf-8?B?bzJxbWc0UU1uQ3ljNkNaTVpTanMyK0RNTHZKRkluYWE1aTJKaGV1aE93Tm81?=
 =?utf-8?B?ZU9qVUI5TFVNeExzYlkzRUtoNUZUaVRIZmJmOHhHc2FicHZlRjVKRnlkcklo?=
 =?utf-8?B?Y0FUVkpJWnZhUFovbXlGNndLb2g4RzE1TDdrL2pLK2liL3E1dk9jWFlpTkFo?=
 =?utf-8?B?cnJXbUZwVUNxZlhtOEVzRTZqMnpqbHBCWHNvR2tRaUtEa3FvbytVV2ZKUVlU?=
 =?utf-8?B?Zjh2ZU5NK1ZxQ1FuOU9kdHNlSlFvaURxNVRNU1V0Qlc5UmlhMTNhWUhUSHZ0?=
 =?utf-8?B?UzJ4eFhiSndMQUpzOU42M3BuRFMzL3VSSENhZHVIMFV1ZjRMdVZtT005R2cy?=
 =?utf-8?B?bktYWEVTK1RVdzFuZDVtNm5SRU03TS90cGFYSHArQ0NMN3dyU0xMQ2l6UUpG?=
 =?utf-8?B?WGNDMWNkcDdkOWdZbjVsUE8xVVVjSkZiWTVZWTN1L3F2eUp3V3M3UG9GWEU3?=
 =?utf-8?B?NHl3bkJHWkpuL21hSWp4cCtYRHdHbjRub2VYNmc3VnZwMVhDczdXdjBZTUhu?=
 =?utf-8?B?V25Ld0Q0dDZCMytUSmJyL0tJd2M1N0c0V3ErTTB1L1NOYTR2L09BUDcxanZX?=
 =?utf-8?B?K3UvamRFWndHaW9JSTBiMFh3V0pRZjkzbzJ5alBsT0NYbDdWN3NsVTFBSWZC?=
 =?utf-8?B?QlF5MllidGpmSmhiKy82eFZYSHJUK3A2ZGc2aE4yZE5xMzdPWHdCMU9YVVc3?=
 =?utf-8?B?NStXZFZ1akpmcXJXcEZEMXh4eW9oZGhnSVpWVGI0L1dCNm5zNHhWOW9yQTZ2?=
 =?utf-8?B?T3g0S3lVejMySHBmSnVtNlRXaGhvN2ZVNkxCUnFxN2NvSHRsTFg2ZGo4MUd1?=
 =?utf-8?B?dWJ0MHh5aGRtdXd5aktYdzVuQ3BUQ3ZvNWJ1M3YwRllIRU1JcFk4cnREVHo5?=
 =?utf-8?B?NHVvWFRtWWc4RnpDSm5rTzI2c05acmUvazJSSkdWQzlERko0TU5uTzhYWGlB?=
 =?utf-8?B?MXRmZHpiME5ZanZkbmhOSDRBS29LdjNvR2hmR0lna1ZyK1V6cEo0cWhqaVUx?=
 =?utf-8?B?WWZSNFZqQUdodU92N1VYTytxMVNnUmZ1Qi8vNnhVdnR1dXBsVW5NSEFBY09G?=
 =?utf-8?B?dlorNXEzbmE3dDd6RFh6ajdCRmNrM1o5UklKekU3TFh1bnZkaDJ4YWpBQy9Z?=
 =?utf-8?B?Y0Q0M0gwOUtBTm1KQTZBTWlGZ0dRYXJDeW9ZekthNk14dS9jbE4yQjZvYnRa?=
 =?utf-8?B?T0NHRDVPNURqVU5JU2dlQTA0eGYzb2hSM2RZcGtqazNROURuMFpFSFBVT0Iw?=
 =?utf-8?B?eWZoTE82VlEvSXRHZlFyNXVzMW1zMFdqODh6eFRIY1UrYlpKTFZrMnJsODls?=
 =?utf-8?B?KzI2OCtZMlBTV21WVXBGbisxWXpnVE5RV3hlK2FNalpUVnFGYWJBVzhacmp1?=
 =?utf-8?B?cm8xZ3ZIMFBtL2VMYUNENmtsUHBkaERJVklCa2JzYlJlbmhJemdJSFBiM2Rh?=
 =?utf-8?B?NXRkc2tUdzhSbGNjS01aSkJFRmZIWnBwL2lyQ0dSMTR0QXZ1aHExZjJRSUNk?=
 =?utf-8?B?Z0cyY1NYN3V3SDZaVXRaVWNkU3pyZUVPSEc4ZFZ2UmtnSFV4ZFhmRUUwRlhm?=
 =?utf-8?B?cGdRZ25CdC93KzQvL20rWlh6NitiYjhPd1VwYmpXQ1VTUEtCZTE3Qkw4UEMv?=
 =?utf-8?B?QlFlTEZCejBKbEpzck9scFZQMlUrbFBTUWxqK1BuQlR2V2lnV0xTMDRUWXdC?=
 =?utf-8?B?OTNRRjM5MVk0Y0NvcHhGdmVDWU1ZWmR6VUtxd1hudU5EL1NnSmZDTTNqQUJQ?=
 =?utf-8?B?NktxQnVhbEJqL0ZlWEQ0cng0OWxpelI4SmltZmJKdVhNVjR2V21oa0lsSk1s?=
 =?utf-8?B?L3UweSs4aFNScUdhYlQrNXBMdVV1QVVkbjloMEFzUG9ydExBblJWeXJ6SVZR?=
 =?utf-8?B?Z0owZEkvWFRJeE02c0xEeURiZHV2ZFRTYlRDWHNWT2xFem04akJObGtnVTE1?=
 =?utf-8?B?K0kwRnhTdDAwTExjNktIUkxnb1AyTzVIY21qSjc5SnZabnhENTF5ekxkVmZ6?=
 =?utf-8?B?dUtxK29ZWFd3TUhIN3YvU092dGlTc3R1elFGNGdOU09abDVHOWVtM3RSTDZO?=
 =?utf-8?B?aFBvTm5UQ3BGOW9Dekt0WGF3UElxSUlqeWc0MHJDeTJGckZUMEJoTklRemRV?=
 =?utf-8?Q?eccrAJEc/qO/PcoybXdQMq0MekPSxU2VIETEj8gTtSRyw?=
X-MS-Exchange-AntiSpam-MessageData-1: tBlDubrDm004Pw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18499707-b59b-4d1b-fb08-08de9eaacfcd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 07:02:40.3580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKUq92GtSIo2hhBEevU1Xhqbk/WVIs0zuCsuHgLnvWYLBBGUwxPxsGhlpr0G7tRJaO/n1lt3Yg3caBs93iZgjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6876

On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
> Hopper, Blackwell and later GPUs require a larger heap for WPR2.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Let's also move this one to the beginning of the series (right after the
new location of "larger non-WPR heap" sounds adequate).

> ---
>  drivers/gpu/nova-core/gsp/fw.rs | 61 +++++++++++++++++++++++++--------
>  1 file changed, 47 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 5d36604ea1a3..7352952e4ef1 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -103,21 +103,40 @@ enum GspFwHeapParams {}
>  /// Minimum required alignment for the GSP heap.
>  const GSP_HEAP_ALIGNMENT: Alignment =3D Alignment::new::<{ 1 << 20 }>();
> =20
> +// These constants override the generated bindings for architecture-spec=
ific heap sizing.

Err nope, we can and should update the bindings to also include these
new values, as they exist in OpenRM and can change with firmware
updates.

> +//
> +// 14MB for Hopper/Blackwell+.
> +const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 =3D 14 * u64::SZ_1M;

This constant for instance exists as-is in OpenRM, so that's an easy one.

> +// 142MB client alloc for ~188MB total.
> +const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 =3D 142 * u64::SZ_1=
M;

This one though... I could not find the origin for this value in OpenRM
- it seems to use the same value for all chipsets, without any
particular expection for GH100+. And if I follow this behavior in
nova-core my GB203 probes just fine.

> +// Hopper/Blackwell+ minimum heap size: 170MB (88 + 12 + 70).
> +// See Open RM: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB for th=
e base 88MB,
> +// plus Hopper+ additions in kgspCalculateGspFwHeapSize_GH100.

I also could not find `kgspCalculateGspFwHeapSize_GH100` in both the
`570.144` tag and the `main` branch of OpenRM, can you elaborate on the
origin of this value?

From what I can infer, this `12 + 70` corresponds to OpenRM's
`BULLSEYE_ROOT_HEAP_ALLOC_RM_DATA_SECTION_SIZE_DELTA` and
`BULLSEYE_ROOT_HEAP_ALLOC_BAREMETAL_LIBOS_HEAP_SIZE_DELTA`. These values
have also changed in `main`, so if we use them we should import them
through the bindings.

But first let me question whether we need this at all, as these
`BULLSEYE*` value are only used if some build feature of OpenRM is
enabled.

Again, with the original value for this my GB203 probes without any
issue, so it would be nice to confirm if and why we are diverging from
what OpenRM seems to be doing.

> +const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_HOPPER: u64 =3D =
170;

> +
>  impl GspFwHeapParams {
>      /// Returns the amount of GSP-RM heap memory used during GSP-RM boot=
 and initialization (up to
>      /// and including the first client subdevice allocation).
> -    fn base_rm_size(_chipset: Chipset) -> u64 {
> -        // TODO: this needs to be updated to return the correct value fo=
r Hopper+ once support for
> -        // them is added:
> -        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
> -        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
> +    fn base_rm_size(chipset: Chipset) -> u64 {
> +        use crate::gpu::Architecture;
> +        match chipset.arch() {
> +            Architecture::Hopper | Architecture::BlackwellGB10x | Archit=
ecture::BlackwellGB20x =3D> {
> +                GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
> +            }
> +            _ =3D> u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU=
10X),

Let's do an exhaustive match, we will want to check the correct value
for newly-added architectures.
