Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB443A4537
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Apr 2026 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689476; cv=fail; b=GQlU0Aseqi+qe59rkknJTwirEdb+bbO/d4lgrOGL3bN67rfbEKXy/p0ELjgQDPDDaykYocq+t/H92rsayiKSuDyFuPKsCWIw+90hlt1AmaSsg98vOjSudPtJRX+SWZyU8KHQWgWxdl4D73Hp6pxxl4hrt1SHzs++xb7DWFo9Y6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689476; c=relaxed/simple;
	bh=uw2Dj1ECJSBwKA/KvCRv2hLnb3zUizqz+EnyM3bGHy8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BGTmvivvAWsPxU0ab3z3PT4qYHyo4BdjmHDUXYaz+GABq8FKn8qhj2o5eFyz4qK/dMdBIs58rqikR9aP8GgQlJ3i7AxpcsiEvb9VizZbvFAdpvtdCDnUv4yMc7oEaAFYmYiNnttyKF29x0sO1LD6EgyXYHcINsgv2TtvuzKZDnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hSueb2Vl; arc=fail smtp.client-ip=52.101.61.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hSueb2Vl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/euT4bCVyHh4BvuAEcqRK032XO4rnwEGICGwOVZTbSlbNXkJUFiFOLK5oG+Mnfqc+rajmNR4ksM8Ca8lmcw/dh9GWQRUM08J2qbbizuFWD11tvdk3bATl6UZTlSMSbQW4G3jS5SHzgjrebhg+ztOOGvFVz+Ffcj0f1zgVKZL3yeHrXF1/4XIqOyXnjxgRJS0fykU9XxmskjPZo9F+MngkAWkWK93A/3USBhFJLmcoVScydtSd5RTIMgxkJWFOaJgV86+r9dPk6LZrF9TcmLYLvM3XyJPHhefTVRCCFHRXXIglj66Uom1PEQKoGtGDGL28GBUkbmVRTvaQwmTPWi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygs4jULFp6cu0a2mKGlJf2ct7LY9/TSKv6OGqGl7rig=;
 b=QcuxsT0tUeS3G/sPkcVuPl+Bf4y/4Vq80yEZwUTYZ7GmaST2phumKXrsm927w3XLjX9ScXFw7xvHSWG9DeMDwv3gvtUr2cC8rzDF6Jbyv3+6IsIArdwcIyBzlmQsUhY9UqKYO/piFlI2jWobM+9S5oyFgInbHpeQtv7ptFXFLyspt5EER9rxNR+5/dRWXatJFo1+Exc6O3AFY5JkowGfYtWA3t6RE9aEGGNCPlkpSWCZf0UqBiaqH+rTC1lTFmVBSNC6khZ1oQQSyIApre4DzJZCHCkozbE87Gghss1C9fWegnlNZvLMKBAJTlWBuY043MojfJ7wtPU/QJnmy8Pptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygs4jULFp6cu0a2mKGlJf2ct7LY9/TSKv6OGqGl7rig=;
 b=hSueb2VlZdsx9t3no7SvDKMO4lOZfcs+eKq6UaWAms4JtnN2X7UFAPDAnXFGuIimIoa3XdUoCwLY6jAIbM3lqJ9GK32TVzzFRielNjPQyxyd0Nj6PDeDwaDszgDoXc4mdncU0tj/4Z6OY7cOV1a/XiUSb97d2CyFoY7pkQWxZPLT/XEdoSpe3OaNHWTqB4MQhQQ0UtKobmwBwz9elCdyCQ18hLNz6DlC67sStTQqmOMOExWv8rNZkoCpir/BVdUOK9q1Ye9iQc60CxCBvLDUmB0S1F54/LLt2iUHRXZBYvsNAE35Fg/lwGyOCsekaIWlVgregNEYOXezL/W1k1s26g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PPF0316D269B.namprd12.prod.outlook.com (2603:10b6:61f:fc00::604) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.8; Mon, 20 Apr
 2026 12:51:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 12:51:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 21:50:58 +0900
Message-Id: <DHXZULC2O3CE.2PNA9P12ZPC2B@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260417191359.1307434-1-ttabi@nvidia.com>
 <20260417191359.1307434-5-ttabi@nvidia.com>
 <DHXE2MBVLV2S.3AUM31VR2XC0D@garyguo.net>
 <DHXLC2ZLHLWG.1Z3SQHOEYMYH3@nvidia.com>
 <DHXWPED46OYC.U21Z21V0PM3C@garyguo.net>
In-Reply-To: <DHXWPED46OYC.U21Z21V0PM3C@garyguo.net>
X-ClientProxiedBy: TYCP286CA0286.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee2a6c1-1733-4e0d-6597-08de9edb7a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qFxdJqU32FXtvh6IDA6QnOvR8JzWw35swNAHr2yDGr2T+gGNjr2k1uTOoJk+SFDEM5y4EHI9Qr1FQnSeMLshvDe/9XBlrJbzGhLk7/QJyp5Kk0ExY9xY3aeNyhWUF0MYU4ppT2CZ9t7vbRzorf4JWMdMlxlx+qUJWoon44Z0od6Xcaxsti1xEW/P3agQJeLJOj7pJYy1Q+FeurIYEH+lXGCdh+JNFzCyDg7b2dpPvSZR/0KF0/Wv6MuF8vCey3pyrAFSXkcrs7TYa5pl2cVQ/uoC4aWzhyaKJ1FbmJ9txTS4/Idibdh/wJR8SQrYrGl1PKwCxEYK4S5aNhJFnWDCxAEDjF3KXZEyFU+QyZIP3TxqQ8NuxGlu6X3/APJ03PEG98iWmekxOO/waTy21BpNONak8Zk4SbcOyHJlX+1ljks3OzOvLjTB2dyUU/G4VHJoKDoZZy9gtbLwkv1d7jpn+yh2yY9BkKU16/EvwIjDoBxdxxhMtU+3yKWoQoRjOxm1pxxjgXFfmKw6ndBdDwNFsUSpgVTjah5IxmoznqPs8nU13Y+JKlP2ON69h+OWlAu6wJcj5N3RWueWK3hVTsHWiFt8QcCSuGWl/7T8wn0P5RMEkPQkJNB/+XKgFtY0wNIqiGy3ZIgPTyQOGgC3MmIppa5ui4mywfhtgAuFr9mcBMmypMNNlSpJv9yCTgBmwG0Rba/XVd3QrZl5HzzaUMLoW+Jt4vbP6ByXSck2bHfRLgU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K01reFZZZEJxNy8vUmVYdlljRzh5OFBZK1JXMWJVVFpENUsxa0ErWThzNmlE?=
 =?utf-8?B?aDYvb1hubnkwWXpRTEE3VE44NitVOGFCcDBoNUV3eHlBK2RueFZmWWE5S0tE?=
 =?utf-8?B?QTV0VEt0OWxRcXZFWlc3b25wRWN0dUxEWFR2WHdqNVNQSGNPSFVBRko3Uk1a?=
 =?utf-8?B?eDdVREs2ZjNUb0NiTHcrQ1B6V0RmYXZxY2VmVTRmS1hIbVB5MVBFNGIrYkp5?=
 =?utf-8?B?NWJaV1dHalNhaTZSU0lDajVDUSsrU1ZTZ01pNkJZNFJuS0hJSFFGUUtucmhr?=
 =?utf-8?B?ZEJ5L0hRR1NqYlpwbHoxV25obUR4UTJnWUw3U0lYMyszWCt1MFgxQ0V0UFlK?=
 =?utf-8?B?Y0gyOUljU3hQUFdXZ0NEV0FoUWJTUXR2TTdmc2c5ZFV2bXRFajVjS05GRlNi?=
 =?utf-8?B?bUR1N1ZWRFVQYTg3Zzh5cnBUbnpDZDNtTi84bHUrRWRXWkoxOU0wRTBmWjZB?=
 =?utf-8?B?S1d1TGdnVEJrbDlML1BnRXBpdmtISWxjSWNHalVwVGkvbFZySEVvZEdCZm8w?=
 =?utf-8?B?N216UEdCblV6UWxGVTAxL2J4RWpCcnV0dmFQQ1RydTd6bWZrTVBLamhTQTZK?=
 =?utf-8?B?ZHZFWTdEWDBGZUFpK3dLOVZ4TGd5R1o3Z0hlUkNFTHhLK1dybnpZYTRPR1Bs?=
 =?utf-8?B?SkdCMDNZdk9Gc0VRdGFpb0RmV2UycFU2anczSzd4eGhuZGx6amtOZVRWRWJG?=
 =?utf-8?B?OFYyOHZKSnFkai8xT0Rqd0Q0bVQ0S2g0dGtEQkt0R1VxQ1NkTzNvNTFjSW54?=
 =?utf-8?B?b2NlUHFIYVZ1NUhIMHg3d2ZoQVRBeEdKUk4zN2RXVklvcUQ0NXZjajhlcndm?=
 =?utf-8?B?a0V6YVN0RUUvOG9VNXJWc2thaWZwTGIxL0ZUWmQ4VXEvTDBzUFp4Mm5SYmc1?=
 =?utf-8?B?b3JWS0FSMDZzdnltaFBLR0tOL2F2cGsyUkhlMGp4V0RnSHZlTnFOU21qbk5H?=
 =?utf-8?B?TTZudEZHWDdzb0l6UlU1dGZ2MnhXdFZ1c2l4eDVPdTl3V24ySkphcGd6QTd3?=
 =?utf-8?B?eXdWMmJjMFhMM3J5bDY1ZHpGL1Z4bEJjaHdsUjF4cVFXNTIrNzFIaXZPalBZ?=
 =?utf-8?B?d1hmZVg0Tis0eHh4SDBkeU1hRGUyaTJXaFZPbzdTL0ZuM3M1cTR6K212RFMw?=
 =?utf-8?B?aEVrYWJ2dnE0dGhqZ1lSOXpJMDAzSkd5Vjl4REVJbHc1VUE4U0IyR09KcUZK?=
 =?utf-8?B?bGhnQ0VlMmhrZlRpMjJ1TlFrUEVJbVpBMllDUlkyVVZRQTUyWC8rMDFjdEZC?=
 =?utf-8?B?SzR0bTdNT0NuTDdLWFVuK2Y4cG5LcWI4K3A0UFFGTW5xdWg5UW5zdHdicUxU?=
 =?utf-8?B?Ri9TWnFSZjRFa0VmUEZHWUpWaDE3QkUzRUwwck5yZWNIM2NIcTV2TW9iR292?=
 =?utf-8?B?OG5KdFJHQmpSNjdoRjVwRXNGci9pWmV1QmFUMUkxa0szTytablpUeDZ0MkJR?=
 =?utf-8?B?L3ptNDNzd3hxVTBDbEZQWlhPUmZhWkJFQlhZWXpWSEhaWjZzOEpHZUlWTGxi?=
 =?utf-8?B?elBLZzc0M2JIVk5oa003K0xMZkxoV3VNVmVoRmJGMGVaMkw3dHN6aUJ1cWVX?=
 =?utf-8?B?cXdsenU5VVhOQVEzS3FkWW9JTHFLVkhCTHJsVllwdldvQWFIQWF5NXVZeElS?=
 =?utf-8?B?ZGRQN3dkenlHUE53R3RPa2U5WDBBbEUvK2hJSE0zbVFBOEVqOUVDZnVtYVRC?=
 =?utf-8?B?d29oUFhaWklvWXpick5FaUluWE9USi9jZkJFUEFzcEJWUk1WUngycWE1cXIz?=
 =?utf-8?B?REJtVmpZQ3ZlTEUyOEQvVTJQL0dxN3k5SE9GbExidzZzY3FUcm5YNldJV1NS?=
 =?utf-8?B?VHQ2dDU2QkRIWmtVTWJPNlNWT0p2M0E0bnNCeUczY3M0cmh3TFAyWXk4ZXRN?=
 =?utf-8?B?SnVFeUZQdzMyOUdPUHVnNnZQakpLOWt3cENxQ0hvd21MKzZ6d1dEak1VVHNE?=
 =?utf-8?B?WWZHVWR6dVlrb1FSMzNBUHR3bHg5R1RhSDgwbkxVdVFNakRsL0xyNzBhNnhq?=
 =?utf-8?B?Y1hmUnhpNGkybUJCMjhaMVo2bm4wanJBeWJSQm95Z1VIQ0NVc0xJcHkwVjc0?=
 =?utf-8?B?bzFzbU9jalZCbXlkMlo3ZGVTVXk5MUl2UHBleVZXdGZnckRXVEZMa1VBR1BC?=
 =?utf-8?B?Z0tjRzBiOHJEM29vNW9sWXpSeXkzWlJNNlFlbWdNNzVhb0FreVdEbW9wNUFo?=
 =?utf-8?B?ZDB0RGgwOVdSZzdXVGNMWU8vcGQ0RDQ0YnQzY3dzU3NsUzkxZ2tFQkN5K2xy?=
 =?utf-8?B?aExGZ1N1bDZnQ3FabFNvNk5wSWw0YmpZZEJ6WDRXY0U1cEc2a2R1amt3UzZX?=
 =?utf-8?B?YTFNZGt5R3dRYmZJK1RReE5mRzFMNnNBVUoyc3ZqSFppQ1NqN1RlSFhVVHBW?=
 =?utf-8?Q?zqypAgEQ136ftlKobcb6KTkBNZQyM2RCekLdLqi3lxRDS?=
X-MS-Exchange-AntiSpam-MessageData-1: eMS9xwjA1xO3hQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee2a6c1-1733-4e0d-6597-08de9edb7a48
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 12:51:05.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5qB5n/3CorGePXm461XbGBgFXXQqcTvjHxLCKjm+USshpuYxmTTVOaEFRNXojEqYH1Cu0rpDAGPXxx9oRtlyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B

On Mon Apr 20, 2026 at 7:23 PM JST, Gary Guo wrote:
> On Mon Apr 20, 2026 at 2:28 AM BST, Alexandre Courbot wrote:
>> On Mon Apr 20, 2026 at 4:47 AM JST, Gary Guo wrote:
>>> On Fri Apr 17, 2026 at 8:13 PM BST, Timur Tabi wrote:
>>>> Introduce FbHal method frts_size() to return the size of the FRTS
>>>> window.  GA100 is a special case in that there is no FRTS, and so
>>>> the size must be set to 0.
>>>>
>>>> Note that we cannot use supports_display() to determine the FRTS
>>>> size because there are other GPUs (e.g. GA102GL) that have display
>>>> disabled (and so supports_display() returns False), but the FRTS
>>>> window size still needs to be 1MB.
>>>>
>>>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>>>> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
>>>> ---
>>>>  drivers/gpu/nova-core/fb.rs           |  6 +++---
>>>>  drivers/gpu/nova-core/fb/hal.rs       |  3 +++
>>>>  drivers/gpu/nova-core/fb/hal/ga100.rs |  6 ++++++
>>>>  drivers/gpu/nova-core/fb/hal/ga102.rs |  4 ++++
>>>>  drivers/gpu/nova-core/fb/hal/tu102.rs | 11 ++++++++++-
>>>>  5 files changed, 26 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
>>>> index f357fb28b22c..a305a6dac758 100644
>>>> --- a/drivers/gpu/nova-core/fb.rs
>>>> +++ b/drivers/gpu/nova-core/fb.rs
>>>> @@ -216,10 +216,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, =
gsp_fw: &GspFirmware) -> Result<
>>>> =20
>>>>          let frts =3D {
>>>>              const FRTS_DOWN_ALIGN: Alignment =3D Alignment::new::<SZ_=
128K>();
>>>> -            const FRTS_SIZE: u64 =3D usize_as_u64(SZ_1M);
>>>> -            let frts_base =3D vga_workspace.start.align_down(FRTS_DOW=
N_ALIGN) - FRTS_SIZE;
>>>> +            let frts_size: u64 =3D hal.frts_size();
>>>> +            let frts_base =3D vga_workspace.start.align_down(FRTS_DOW=
N_ALIGN) - frts_size;
>>>> =20
>>>> -            FbRange(frts_base..frts_base + FRTS_SIZE)
>>>> +            FbRange(frts_base..frts_base + frts_size)
>>>>          };
>>>> =20
>>>>          let boot =3D {
>>>> diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/f=
b/hal.rs
>>>> index aba0abd8ee00..1c01a6cbed65 100644
>>>> --- a/drivers/gpu/nova-core/fb/hal.rs
>>>> +++ b/drivers/gpu/nova-core/fb/hal.rs
>>>> @@ -25,6 +25,9 @@ pub(crate) trait FbHal {
>>>> =20
>>>>      /// Returns the VRAM size, in bytes.
>>>>      fn vidmem_size(&self, bar: &Bar0) -> u64;
>>>> +
>>>> +    /// Returns the FRTS size, in bytes.
>>>> +    fn frts_size(&self) -> u64;
>>>>  }
>>>> =20
>>>>  /// Returns the HAL corresponding to `chipset`.
>>>> diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-=
core/fb/hal/ga100.rs
>>>> index 1c03783cddef..2f5871d915c3 100644
>>>> --- a/drivers/gpu/nova-core/fb/hal/ga100.rs
>>>> +++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
>>>> @@ -66,6 +66,12 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>>>>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>>>>          super::tu102::vidmem_size_gp102(bar)
>>>>      }
>>>> +
>>>> +    // GA100 is a special case where its FRTS region exists, but is e=
mpty.  We
>>>> +    // return a size of 0 because we still need to record where the r=
egion starts.
>>>> +    fn frts_size(&self) -> u64 {
>>>> +        0
>>>> +    }
>>>>  }
>>>> =20
>>>>  const GA100: Ga100 =3D Ga100;
>>>> diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-=
core/fb/hal/ga102.rs
>>>> index 4b9f0f74d0e7..3bb66f64bef7 100644
>>>> --- a/drivers/gpu/nova-core/fb/hal/ga102.rs
>>>> +++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
>>>> @@ -35,6 +35,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>>>>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>>>>          vidmem_size_ga102(bar)
>>>>      }
>>>> +
>>>> +    fn frts_size(&self) -> u64 {
>>>> +        super::tu102::frts_size_tu102()
>>>
>>> I checked the patch history and it looks like this changes from v1 to v=
2. If the
>>> argument that "both have the same size" then I think this just makes th=
ing more
>>> confusing then the purpose of deduplicating.
>>>
>>> All the methods above are either delegating to GA100 code or custom, an=
d now
>>> this delegates to TU102 without any explanation.
>>
>> The reason for this is that all chips have the same FRTS region size,
>> *except* GA100 which is 0. GA100 is the exception (it is also documented
>> as you can see in its snippet above) and should be treated as such. Thus
>> I'd say the current approach is correct.
>
> Then it should be:
>
>     trait FbHal {
>         fn frts_size(&self) -> u64 {
>             u64::SZ_1M
>         }
>     }
>
> and only have it overriden on GA100.

Mmm we can discuss the design of the HAL, but this is beyond the scope
of this series which just follows what other modules do.=20

>
> Or better, use a boolean, I find Nouveau's C code clearer in this regard:
>
>     /*
> 	 * Calculate FB layout. FRTS is a memory region created by the FWSEC-FRT=
S firmware.
> 	 * FWSEC comes from VBIOS.  So on systems with no VBIOS (e.g. GA100), th=
e FRTS does
> 	 * not exist.  Therefore, use the existence of VBIOS to determine whethe=
r to reserve
> 	 * an FRTS region.
> 	 */
> 	gsp->fb.wpr2.frts.size =3D device->bios ? 0x100000 : 0;
>
> so we could simiarly do
>
>     fn has_frts(&self) -> bool;
>
> Or
>
>     fn has_vbios(&self) -> bool;
>

The boolean-based approach might make more sense if there is really no
other possible size for the FRTS (which the Nouveau code seems to
suggest). I'll let Timur answer that one.

> (BTW, I suppose the FRTS region really does not exist, but the start addr=
ess
> matters because firmware does some checks on the start address to ensure =
it's
> within a specific region regardless whether the size is 0?)

And that one as well. :)
