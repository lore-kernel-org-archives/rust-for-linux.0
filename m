Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022075.outbound.protection.outlook.com [52.101.101.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB97F2147E6
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260945; cv=fail; b=CrEnaG0eEjM7+yY3JoXInYeVK5USuvehY1PCCWLrDbfIfIAp4XCi8CX84+yf7/+8R8aAc63d/I/0HQg89mCi87Vr8/aShARLB7DpKfy5t5U4BypCqiEHeUgA1jr3fuZ+XCxMG/eHHcIQbIVoPY0uhyKorFIJxxICxfwuJtuleqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260945; c=relaxed/simple;
	bh=ohyMKjshnbTAMcKM9l5T9NC6Q4L6OVqtqrU3tmniRXg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cWoEdLZNVBp5Olwbaualm08wjMYtzrxEotW+CT+IjNxmzb63+QOHqqu1uPBCOU+RUxkHapwdb4jJiLrtqs2DpyIn5N4F9fz4w9VWQcL9pTsEZZrUWWmX+8nB0rZMd4dlzk/I111TEXwXTh6Gvh7aPDdj8VOAwFvLb/s5HjBoSU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=SrxUb5x3; arc=fail smtp.client-ip=52.101.101.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="SrxUb5x3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caW8vHZoS1z1rwCZHYZAFufXcTz7K30LQQi6Qs5p/r/RpE+4axlMhSHWHneIlUp6i/Y+V5ca/awiVEAh8wYcQkX53j0jeRfJwbxnbb/W6VRLaBvXFrjj6Ss4CvOrTWN8VQHhU9ywHpC3qfrKJOYIJoaVBGOmwoi4zF494yOWlH8fPXQug63ucugQkusjJUxJONxUUnDu3vl1fQpGdtHbJEqD10/R8Rc0+/YQf8w5n0b70LJWE1TncFSovbQAQ2wRc52pNZV5AtJWEw/H2jNjDXODQVIJG6tuZBLGwzmYyZJj3UBwgYI2N6aczzw7OOjyVlDYYm7yBGn3H4V/lCYaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVz+Vq2tLZe45Vx4ckeMeVsUK4Ozn0o71mFU8iOfLRY=;
 b=f5Pmnv0548LyZCZepwGB9dtoLNHHrU0Z4OIwBYg8CjfG+OvFuGtqAz/1MHs0zK9WiEKQRJi89tboTIR0gmgrVCWkiN7NRo1AzuxCIJ5R85k6geFh4AhG4ozJfmOEqy9mO11sYoVdk3dluN5HZGNC4IYl9rCDK48OW9kG1dC341ml7tf2UNJS/s5FWiNfHbmoitQZCkFZz84YvL8tBlXhXHgBSjpbOvKCF5zlXDLCvlNGGH+pXpZnOrTSQGCiIFEyFU54ysaHh3TMwVfuIor3F+jZodoku8PU+3+sWhWNlR8+ayztMzgWEGdgni9ZqQk3jhSeVRzSUEcOo/rCcBB0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVz+Vq2tLZe45Vx4ckeMeVsUK4Ozn0o71mFU8iOfLRY=;
 b=SrxUb5x3hj0whK22H8fLmet+ceP2BxjIWbzwrwVhV/hWDi+JQvDsFKM+0bUSw5lAu/SI1Poo/7O1KPKsC1JqoCRobU9S1Z7Z0sQFCDLE7DKHuPRYk3Az4GA9re2XGtwj6a0B9gnVsEtbqpsTU8iMrnUqLJfg/WX0RUNpB8q5jcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOVP265MB8584.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 13:48:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 13:48:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 14:48:55 +0100
Message-Id: <DHTRY8R0QQP7.18II4DQCILU5M@garyguo.net>
Subject: Re: [PATCH v2 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-5-ttabi@nvidia.com>
In-Reply-To: <20260414235047.439322-5-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P123CA0133.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOVP265MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d60c7f-19bc-41fd-38a7-08de9af5bce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KrB+cAjNO7sTXBB0TyoEu9CiIivKpyrisq5xTYWAI0x0QybCI3K0RNSye+uM2+G9S1jWqFX+MFLeUINCdt+p0h7/JclVqaa7cysS35kez9xYP2VYLOHMea2AhlUSZ20At8vJUrvDwP7ZCnLlbjYC0q3vhNHz+qR1+EqWRYot1cDDOwyQttneNFcpC8iEJpVEPQTgq5bi/CcxR9v1qKgIz5W+MOND+j4tkyqAMMZu9p69764wC/QtXfQ0bSXdPkjvtYafkTiPJi3NMn0DbOwmdIB+hGZFzLi5zDZsVmWUd6WoKYf7cOwfwTx7mG0wVnlqCdBsBv+Bx00FNWsXQtq9j/Ctalrj9yeraCCzcwQg3Oe82ta79y0ZAFNAnnF1F7ZOmPoX6q2X5MmxjbZfiz0lxtOgc7nmbgaVaC9ZGuc1wcOIm7MWrAnnH7/WdKuAGrIDXu0S5J47loycYM5j1hDOU5a9/qHYBBvdPnV6PTSHkMGJwq+Ll/79COCAmA9iAb0ujaUUgfCj7r385fyEkW/0XAnQf8LU63PxOtPSL8PD1aC5FV/YFHt8G0nhiowvY0PoLDhNGieCBa7p/7ChYqQiiRk07kH0ucAUIwATSutSqoOhUtP1YErkLmnPC4jrgt8eXLNhZEtGtYZaS253HmQ2YvedrNgL44XSxQkGw/d+YDPhH8KCnX/lE4skDd8BpWiPQ3p39Mea71SdLHY1bMyz1zIBQYKIFlnY1SPZmHoHb/s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3gvMjR5T3I3RGF3N0ZjY0pBYUhKVS8yekFyVGxUVy9vTCt2ZFluU0d5bHJ6?=
 =?utf-8?B?OGFEMFFkSWN6bjdRckttK1FYbmhYa3lQa2k2bktpeWhrUEwvY0dPZDJOaEY2?=
 =?utf-8?B?V3JjdXhGYXowUnNuZDdNMUw4R0M3dS9vQkY4c3ZxeS9vczdtR1djSkt5MUFw?=
 =?utf-8?B?cC9ZeGlBcVcra3BNQmNqWXBJOEsxRTFCWStSNDczWlk4ek5iRU5VRGlkZGpm?=
 =?utf-8?B?a084Q2FGbUkzVjAzZmxUUVFycnYrcXFhZkNMWHhnQW4xdjl6ckoxTE5OVU1G?=
 =?utf-8?B?R0swTWxScjJhS0tMZTNYRVlwVXBmQkM0c1JZV2lGRDExRnlTczJwTWxQcUla?=
 =?utf-8?B?U0o1dE1qTVFHbWxuaWQveDZzR2ZmOHNjYTVkYjJSTTY0NnFBT3dMLzFnWkpH?=
 =?utf-8?B?dlY5Q1NGUkF6aCtQOWpyR1ZQOEJvc2ZnQy9XVTFUekNBM001c2xTUmRNc1c3?=
 =?utf-8?B?UDU2d3F0VHc2RDBCSmNvNW10ZHhBeWZYOW14R1Vjb3N4QURRQUw2Nm9hVlo5?=
 =?utf-8?B?QkhtY05PZ0J0SmpXYmQvS2RMblBKRXZTbzlxc1ZiRktpcERMZ1dUdkh2cCtl?=
 =?utf-8?B?UzhyYjhGckpmRHJzTjNYLzdrejJ4SzFBenV1MmJzOCt5Vk5FcHFTeFVuK3p3?=
 =?utf-8?B?bkZ2UzRMR3BlWEJjTmJGL0ZHL2RCVmM4NTlsQVNrR0kvUnRpN2s3aVQvR28v?=
 =?utf-8?B?MkdpMFBjemMxMHVER1JreUV3MDN4Wmt4YjErbk55N01YeVRudXN6Tzlmb1pU?=
 =?utf-8?B?aUFreDNmc1V0VkZiaEFxb2xqZHdYMTlZbXhWVlNqdUZCZDA0S1Z6OFhyb0d2?=
 =?utf-8?B?RmVmY1ZXeXIwUExPQXIwek9ES3Mzc1UyeUl0STZZOE9zWWNLWVRod1ZKSStH?=
 =?utf-8?B?YkQ4VzBHVkRRTXBneDczNlMvT1pPZk0zeElEQnU5aDQ3bjFzTWZaM2VJaVUv?=
 =?utf-8?B?ZXd4L0RJOWRZeWVvcGF3bmxJaHNKcVd4eHdoSFVwRHJIVTY0L1ZzVTE5Qkg3?=
 =?utf-8?B?UThIc2VkSm4xMXM2cUVzN0E4anFZcWUwcHBJNkZHNlFwUzR3Z2JqVFlJWTVo?=
 =?utf-8?B?dnR3bTdNYjcrWUlrUkNKZm1WcmpHKzY4MTB3VVBiaEExVEMzeFE1VE96WVRK?=
 =?utf-8?B?a2psb3A0c2J0SERacERnMXV0TWhjSmliTFE1YkxLVStQZTFoNTBTTENPNzlZ?=
 =?utf-8?B?eE9Pek5qa05CdzBuV0dwRmxXQXBIRGZVSGprU204UlJnQjJ2TFNIcHJvM1Fk?=
 =?utf-8?B?VmpPSzRzZDFvd3QvSXNHVzRJRGJaTGZEWXR5bmhWZVkrN2piQk5JZ005ZEll?=
 =?utf-8?B?V2gvbXJYcXl2a2MxWEU0MzJJbTc5WllIeVQ3R1RCbjlPQ3Y4TCszR3Y1bmpz?=
 =?utf-8?B?RmM2Z2ZkNnppUnJIWHJyNjV0cGFTTmhtNGJFMTBnMTBacloxYUliK2dGTXFU?=
 =?utf-8?B?T29Ua0JnczV2MTZ2VzZQcUQ2VTlHWUcyeVRyMjluTGNIR0xoRkxwTjZlS1lj?=
 =?utf-8?B?bE5KWG0vL2toT2xJZmhDM1o5RnVuOEdrRk1DemFmdFltSm1LbFpINTRQZzhK?=
 =?utf-8?B?R014Qk1ESHJ2Slp1UmNEV0M1UzJKQXdSbVhiS0V0b3RaaWRPZmdpU2VscTAv?=
 =?utf-8?B?VkUrMFJYeCtDeG9obFo0TEMvT1Y5c1NPTEY4VDJ4ZGRBOEEwZW1JVUZzMEgy?=
 =?utf-8?B?MHVCbVVMdUJnQmpEbFRqKzJzTmRhY1Q5RXIyREtHMmVvRFUrU1IyVWJOejI3?=
 =?utf-8?B?Vy9TOXVLa2ZHY0FkK3pxQlQyR3pBY3EzZGdjdFFJdHFxTmpySkh6RFozTzhD?=
 =?utf-8?B?aDNYTElCUjN5VmRmNE5jdEYrZU9yZ2U3NE5nQlpESEF2a2RtSTEvUzJORnVo?=
 =?utf-8?B?bmQ0WmQ3TkdZekRDZU5UOG9ZdGx3RmtYbGUzL2RraUdrZEVqVFlKaHd0YXNQ?=
 =?utf-8?B?dVl2MUVTbHYrd3NmWVFhN3dzV3NuWjhCZ245S1BjU2oyZ0Q4NzBkMm5lMWZk?=
 =?utf-8?B?Lytja1NhODNsMGNiVTBLRExzKzhjZnYzdXJ4SklTYXZRWVNNNVpycHgxNWJx?=
 =?utf-8?B?TS9mZDB5TS92dG0zc0VnV0N4NkplaUs0UWZTWU5OSWZsRFV0TnNZRXIrK3Za?=
 =?utf-8?B?Z1dHMGlIQXBjMjV5cWNFcW10RDJFRHlqcmdwbDIvSmFuZHI3ZHY4dGlsQnIz?=
 =?utf-8?B?Q1NlVFRaakRQMkZtUE5mWU8zVVQ2KzJqaWtnOWdHYk44RUpPQ0IzYk9BY2ho?=
 =?utf-8?B?c0V4NTBIQ3NBMk5ndmYvV2lOT0UvanJyVy9KWERmU2lDRlZaS0t4d1pjY2s3?=
 =?utf-8?B?bzU1cVF1R3hVTENoeE5waUZYNktqTDB6eWdXbWxCdmdsVHorVW1HQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d60c7f-19bc-41fd-38a7-08de9af5bce6
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 13:48:56.0922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcIJxtPndqHFV91gW76QmmrW5c9KH73hF1lOGX7Uy7wcfFS1QUi9DhdAHvtknLMeCjlBZwxvo1GUw5yjRO0ddw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8584

On Wed Apr 15, 2026 at 12:50 AM BST, Timur Tabi wrote:
> Introduce FbHal method frts_size() to return the size of the FRTS
> window.  GA100 is a special case in that there is no FRTS, and so
> the size must be set to 0.
>
> Note that we cannot use supports_display() to determine the FRTS
> size because there are other GPUs (e.g. GA102GL) that have display
> disabled (and so supports_display() returns False), but the FRTS
> window size still needs to be 1MB.

Do we want to special case 0, or shoul we use `None` instead to represent t=
hat
FRTS region dopes not exist?

Best,
Gary

>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs           |  6 +++---
>  drivers/gpu/nova-core/fb/hal.rs       |  3 +++
>  drivers/gpu/nova-core/fb/hal/ga100.rs |  5 +++++
>  drivers/gpu/nova-core/fb/hal/ga102.rs |  4 ++++
>  drivers/gpu/nova-core/fb/hal/tu102.rs | 12 +++++++++++-
>  5 files changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index f357fb28b22c..a305a6dac758 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -216,10 +216,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp=
_fw: &GspFirmware) -> Result<
> =20
>          let frts =3D {
>              const FRTS_DOWN_ALIGN: Alignment =3D Alignment::new::<SZ_128=
K>();
> -            const FRTS_SIZE: u64 =3D usize_as_u64(SZ_1M);
> -            let frts_base =3D vga_workspace.start.align_down(FRTS_DOWN_A=
LIGN) - FRTS_SIZE;
> +            let frts_size: u64 =3D hal.frts_size();
> +            let frts_base =3D vga_workspace.start.align_down(FRTS_DOWN_A=
LIGN) - frts_size;
> =20
> -            FbRange(frts_base..frts_base + FRTS_SIZE)
> +            FbRange(frts_base..frts_base + frts_size)
>          };
> =20
>          let boot =3D {
> diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/h=
al.rs
> index aba0abd8ee00..1c01a6cbed65 100644
> --- a/drivers/gpu/nova-core/fb/hal.rs
> +++ b/drivers/gpu/nova-core/fb/hal.rs
> @@ -25,6 +25,9 @@ pub(crate) trait FbHal {
> =20
>      /// Returns the VRAM size, in bytes.
>      fn vidmem_size(&self, bar: &Bar0) -> u64;
> +
> +    /// Returns the FRTS size, in bytes.
> +    fn frts_size(&self) -> u64;
>  }
> =20
>  /// Returns the HAL corresponding to `chipset`.
> diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-cor=
e/fb/hal/ga100.rs
> index 1c03783cddef..0e7d91fbd130 100644
> --- a/drivers/gpu/nova-core/fb/hal/ga100.rs
> +++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
> @@ -66,6 +66,11 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>          super::tu102::vidmem_size_gp102(bar)
>      }
> +
> +    // GA100 is a special case where it has no FRTS.
> +    fn frts_size(&self) -> u64 {
> +        0
> +    }
>  }
> =20
>  const GA100: Ga100 =3D Ga100;
> diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-cor=
e/fb/hal/ga102.rs
> index 4b9f0f74d0e7..3bb66f64bef7 100644
> --- a/drivers/gpu/nova-core/fb/hal/ga102.rs
> +++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
> @@ -35,6 +35,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>          vidmem_size_ga102(bar)
>      }
> +
> +    fn frts_size(&self) -> u64 {
> +        super::tu102::frts_size_tu102()
> +    }
>  }
> =20
>  const GA102: Ga102 =3D Ga102;
> diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-cor=
e/fb/hal/tu102.rs
> index 281bb796e198..3c85bf1b627b 100644
> --- a/drivers/gpu/nova-core/fb/hal/tu102.rs
> +++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
> @@ -2,12 +2,14 @@
> =20
>  use kernel::{
>      io::Io,
> -    prelude::*, //
> +    prelude::*,
> +    sizes::*, //
>  };
> =20
>  use crate::{
>      driver::Bar0,
>      fb::hal::FbHal,
> +    num::*,
>      regs, //
>  };
> =20
> @@ -38,6 +40,10 @@ pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
>          .usable_fb_size()
>  }
> =20
> +pub(super) const fn frts_size_tu102() -> u64 {
> +    usize_as_u64(SZ_1M)
> +}
> +
>  struct Tu102;
> =20
>  impl FbHal for Tu102 {
> @@ -56,6 +62,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>          vidmem_size_gp102(bar)
>      }
> +
> +    fn frts_size(&self) -> u64 {
> +        frts_size_tu102()
> +    }
>  }
> =20
>  const TU102: Tu102 =3D Tu102;

