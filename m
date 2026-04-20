Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012011.outbound.protection.outlook.com [52.101.48.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A1B343D66
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Apr 2026 01:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776648527; cv=fail; b=kSqzqTUZTfbxn9cNyFENPDWzPbVBR8vpKlmJ4EtgmKmG/ukyOIvrSZL1KUO2nP6gWwHx0goLCVP4ZM7qLI2GiJDxBw+jTVyP0OWinidPchpj9F2DsL7txVAKmIwEfqlzHD+dYHXvF6FQDBdcugRVHmjT+A6PNIl9CJbRTUmEo4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776648527; c=relaxed/simple;
	bh=86MkzPw6B1RDhNf4ZS8/myrBCBpRCEpM/UWrSbDTzew=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=U+eb9GH0+AJtHI1MYgRzTwA52sIT72FBqrc1PehACb7v0to9lqTZw0CCXyDrB3S8snmt8WcZaAdV4Jq7vcvAOAK08Vgl1yDRJQLDm3xoQa9Blp1HEhAo+HhB6YA8UVhsERZjY3bACW0K0KVYImBGpZdrOAMHP+nhyI+gR7iiG30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QX0G+UaJ; arc=fail smtp.client-ip=52.101.48.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QX0G+UaJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7ua5pXglJf9LM9n74cZEmFZvjbadAbeqHcF86ruog5KX1Nj0y+ONcB8VdBJ6McNsVyiALLCIL6/oelso7K5IF65DLpXeFI10S6hvq0t+1Nz0qSdtBQHxxdBTNy6JnI71wouwRZaHLHzRTS/ZVBJAeMPWrRlaEuBX9L8p4kUR9UisPPfuVBVYXlFJcYSgA8jew78Q4wVt4D0nRALak76hFuxdYxJA23eKaEMb8GDdxEVqUGuoBeuw8P431wJhlLOeIy+oHxY7dttxpyI8wXYgU6oKZb6DwXJhhjHH0uyE6d8Xx5JUD7Gg/toSZ3i3MWqYDoZHzda6+DTWsoa11NfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cUBPmMoWZtYTFV8a5iZQWbdZKG57aeXp++WxkfAdj4=;
 b=N0jaTrY65zFs0Hxv80TYWndX2HOiDHhzFAru1FbsLwG1ZrzrhKFICKmJ4X7TpuHGo3PFwycrItpdAl7xn2y8r1UW/WRuj61mdtjCFD4e4nU4Bs2Pi83c5Go5Lo0KEApZrHEgYxYVimUI98+z+K/S09UNPChqmN4b91RqDMB95g1rwqlLgrLb2JQit1QdIVk8myffFKxcWqgCccMYTC4ZcKKs215kXJD+nrtZLkcLH97dOV5fEb8HHxlwq5YE2RH9AZ/faIzoHlC/e9pCMleMMFq4S1VvLTfzuUYU7UgVyeTUBryLgMUnb5m1zMi9xlspcUUhUIDg8QpDbRQ1hIP0iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cUBPmMoWZtYTFV8a5iZQWbdZKG57aeXp++WxkfAdj4=;
 b=QX0G+UaJRSHEOOMt9f2jRqqINLNN5rVRBQ9u0FKn7ouSj7F4VBg9ihMiTSLAruTffMKT+U137Nl/yvm4S7JxnAS3WVlBXM1IGpuOf3we99cGBh9GW+XcOwTKc4sS6DaebUPLKeeRJT+79XnvYGx7Tt1vt81IIofF+CZmos/X1x9Vensxw3B6tIG0/3Z7RlnFGwRVzf2OUokzTetFYBbjw8GoRddGbPCINdan1+YEpnHaI7UAGT98D0nu+tIvGj+CT9Jgzn+bi5bugwayf2Vb+4Azo/w2J9peoBd/vUCR+FnssXK6rAxmm3JXIF3I04UC1CS3XSYuchRXYQtrUhDfIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN7PPF915F74166.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Mon, 20 Apr
 2026 01:28:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 01:28:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 10:28:32 +0900
Message-Id: <DHXLC2ZLHLWG.1Z3SQHOEYMYH3@nvidia.com>
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
In-Reply-To: <DHXE2MBVLV2S.3AUM31VR2XC0D@garyguo.net>
X-ClientProxiedBy: TY4PR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN7PPF915F74166:EE_
X-MS-Office365-Filtering-Correlation-Id: 873b8ba1-fc3c-42a7-de0e-08de9e7c2479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	bh8O+Invxzc+gKefAiwkpKAa9Vw3KYPxEHqvZtgTpLExxZIW5c3kWoiumcWcjtzXD3jOJqmgIPrx4gYbk1yU3/lvlxUKWizbqmnPHnhCk1/SQeVm3Da5F33lmumD6tTB2Vth2k+5pP9XvpUQ3on5FpCwbgqiSnyabomk5mKYFc9SsaLbjV0jUlPzEVqYR1AVJeB+6rwPftDRTLfW5TpiaduFHaPUT7s1f46fcPM1t7O4dIwmDWH+SR6tTdf7yz35/JHmby7DQaYGxN3+4nmjNz0AYFEgu7EeBWx/3wl9j4/bzLaZpL21bgY6mxi9ARZITl88C+5TaqAidaMm0EHUgXw9kD2CEBHiqNUU0NOytGVhPnGDK/HNxLBeyn7wQ3IsoOJcA88DnR9dtNrOoBd6cUbg9HclyukAzgY1vpaEFK47yZQ0kJsGmSi4D5KPK/E2Ti87V6NFRI8CLsxqRiWksbIVv2DZ2dPa+22k/3b5IFRjtAQan6lWq+Eac81EWuiYpTuhwFK8wTpWtuYb+Mlz1awSZn/0yTGI97wzCFUenVqTZZ5PznbG/ldWQgdd9i0MnQyouDUk/5DZ3SfFL+q05Ar+QBa3BBlnv2lwOQynCxziL1mmxmbjAws3KJsZcRfQmgm7SZmSrAZvRck5CSOAdH3miez3dX4XKfDXEyZyVtjsSAgtZqlp+gFlfLdUbyGDtpRId4/q24EkFetTnDUv+ohBvkBeJHQgqMIZjw+tSSU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk4xN3hmb0h1K0V0UGJuaXZzdllWQ3l4Yjd3REU0R0xPWjZqV1RVR1ZrUGpB?=
 =?utf-8?B?RDFOdXdHalNLdlV2SWp5T25XOW9SUDZlR2d3a2F4OHZnMWtIOUJMM1VuNERx?=
 =?utf-8?B?ZzZudjJmMXpJMExac3RMS05MNG04U2dETnFaaksrMlZlTS9HRlJoTWtLVE8x?=
 =?utf-8?B?cDhvRmYwMUlaaE5JU1RhWkZRb09obzlFd1Rnc2pVcEJLbnZSNVh1cHVjYmFz?=
 =?utf-8?B?MEFWRVRsTnFUdGYrU3BxeXVmZzhrN01UdTBJektSNDY2ZnZMVU5yUWo2ZmlZ?=
 =?utf-8?B?L0hKeHpnY3pTMEdyMWdGZVQ3Ynl5Wm44eDd0eU00a1B4VHg5NG4yaGZ3dFVC?=
 =?utf-8?B?bEVYTk1ic2RYZlBRYjNjUGVQanpIZjJmK3B5MG9uUWJOTDZFcVFWRWY1MEJP?=
 =?utf-8?B?VTIzVkI3MnBMMlQvaWJqcEVlZUtuVmpEelIxcEZyZU03SVVhSnIvZDYvaGVV?=
 =?utf-8?B?eklwQUc3Ui9QOURWOHd5K0lwWlF0R3NRaFl1Yzk3c21tdS81a2lUUXp6VVI2?=
 =?utf-8?B?OHptWGtjWGFRelVlb0s3cG51Z05naUZPNkpmRXVqZnRNYTh5bW9TeStkQlRX?=
 =?utf-8?B?TEtwU3c5dFVQajB5US9wNTBQQlNIbGtzLzZETUJiak8yeDFvZ1cwSjhMZGxU?=
 =?utf-8?B?dUtFeG04c2R5cXlHUnh4MlVWeDRtM3dIcllkdm1SeHdGNzc3Z282aCtkYzZz?=
 =?utf-8?B?YmNJS0NaVzNnUU1DTUcxSEdQKzFBZTJ4U2RkNSswWitNTWhlYnlPbWZrSGYx?=
 =?utf-8?B?ZWtkL2xsSTdEOGM5d3lWMG9VVFF4U050clFaa0VOc1lpeHNMV1p6UVBxS01E?=
 =?utf-8?B?aEY4RXBQaDdxNlJLMWlzUEZNRnEySVdxaS9saWJFaC9BalBaM3pUbkJ2UzR2?=
 =?utf-8?B?dzR2R0MwdjBCUlpCVVZMMmIwRFk5aHlXMDAyemhYOUtyVmU3OWFobC9XR0da?=
 =?utf-8?B?MXFGbTNMQ25QOVdrZXd6dlpiSFJYQ3h6Y1ZKUFo3RDZrM1RBNHBxUmMwUjZx?=
 =?utf-8?B?LytuM2lBQ0pPcHEvdjZpMldjYm91aVh0Q2dKUFJGRnRjZmxscGQwMkJsbVhr?=
 =?utf-8?B?b1NRellZWkgrUHdNSmZEYlUrT3AyNnFqYTZuWGtKeVIxNUtNbGNud29KcFMr?=
 =?utf-8?B?ekFiWWNmVjAremJRaXUzNUtxaUU4cmtUeS85Nm1id0I2ZG1PbCswWjFxWnNS?=
 =?utf-8?B?YWFuKytTaFhPQTVwam0xcGJVUEVWaWxKWFIyZEYrUDJjcXREWmRPTXVRYTVC?=
 =?utf-8?B?NzdlQkt5WXoyZzR5TWlMRkY5WmE5K3B5VkRnUWxJcWU5Unl2ZjdwQ0VKZkVv?=
 =?utf-8?B?THhKaXVkclRiUnlXblNEb2phS2tOM0NsQVVVY1pJK2JMOW1DeCtaYm5VM1E5?=
 =?utf-8?B?d0NzM1BnUjFGZG02cTRRbWQyQkk2ckY1WFR4VlRRbDBVWThjdjhHZ2FzRm5q?=
 =?utf-8?B?THlQWXFSTXZVam9OMFVLeDJseWFBNzV6VlgvaGlIcWlWeWdrdFpBaG1FbjJG?=
 =?utf-8?B?Sk4rZTFRWlk2THJXUGJySitJUEsvc3E1dUF6dHhyK1BXYXhXcVg1UGtqb3lL?=
 =?utf-8?B?eURGLzJzcWRRd0wzblF5UUdrUkR5Q3pMajZVS3htYm1hekVNNktHM2FaZzRV?=
 =?utf-8?B?aXY1QkRqWmRzTTRVak9uMHB1REZ0ZXlqellxNHpKc2ZRbjltL2I3azQ4aTBv?=
 =?utf-8?B?Yk1BSG5aTG5HeDA2NUgyQkZUdUhKRFRjNUpDeGlMeWREOXVkeXdDQ25UbE4w?=
 =?utf-8?B?TEYrS2tndUt4TTM5djlrakl0TU1ISEhkaFk4ZnRNbkFqNUZlbC9pY3ZvQTBB?=
 =?utf-8?B?SUtXSkVuQVZxenFkYWZNcEIrTXA4UWxuTExseWtSd0FmVGtNNUlrV1JvRkxr?=
 =?utf-8?B?Q3lsQy81UXRtUmUvV2dxRmhRd2NkUEVxVE9HZHU5UDhYdXlDYS9QdUhXNFRj?=
 =?utf-8?B?NnFjb2liaC9sOHVBTTczYmp2anhLaDVzeG9lTVpqWHJTd3JqYW00LzNPOUtJ?=
 =?utf-8?B?RlZ5RjhXc1J4RDhYNzBpVlRvbmtFUnBlaXdFcys0VkYxL1grTzU4TEpScENS?=
 =?utf-8?B?Njd0alpVdkgwQlV1R0R4Z25JMk0vRzVJdnptRlR5aFUwSUE2dUZKdG8rK25x?=
 =?utf-8?B?OCtaU3FoWlpHRzViKzZmVUlYTlVldkFiTTJyRzloWHpCSGhyaEIvR2VYWnpI?=
 =?utf-8?B?eExYWDRvREsvMWVrREZKeGZERVNKU1NzTHdBTkJ6TlJhL2wvUVBZdUQ3V0tG?=
 =?utf-8?B?T3ZwQmFYRzRQWXpLOFFEd2VhUmdWLzN4dVJzbjFUSi8zRVlDdlpLQXlpeWRD?=
 =?utf-8?B?ZzY2bVpxZEU0ZGRGWlE1YmRUUmRmV1ExdCtXTlFNcGZ5dXNCRmpReEVDRG5G?=
 =?utf-8?Q?CUIA/s57pM+KdzQMpkKqWOjoMz9aqEov6M8JifyOL6CWl?=
X-MS-Exchange-AntiSpam-MessageData-1: ETkA0GsX7iJPJw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873b8ba1-fc3c-42a7-de0e-08de9e7c2479
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 01:28:36.0913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OgDRUeaW70vtNYTpCoukTltxt5AsbzNZoghrbaGP/Cuc0o9SK6tMK5t3sy+Ew+1DPgOfzDNunEIRfL3NGFUjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF915F74166

On Mon Apr 20, 2026 at 4:47 AM JST, Gary Guo wrote:
> On Fri Apr 17, 2026 at 8:13 PM BST, Timur Tabi wrote:
>> Introduce FbHal method frts_size() to return the size of the FRTS
>> window.  GA100 is a special case in that there is no FRTS, and so
>> the size must be set to 0.
>>
>> Note that we cannot use supports_display() to determine the FRTS
>> size because there are other GPUs (e.g. GA102GL) that have display
>> disabled (and so supports_display() returns False), but the FRTS
>> window size still needs to be 1MB.
>>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/fb.rs           |  6 +++---
>>  drivers/gpu/nova-core/fb/hal.rs       |  3 +++
>>  drivers/gpu/nova-core/fb/hal/ga100.rs |  6 ++++++
>>  drivers/gpu/nova-core/fb/hal/ga102.rs |  4 ++++
>>  drivers/gpu/nova-core/fb/hal/tu102.rs | 11 ++++++++++-
>>  5 files changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
>> index f357fb28b22c..a305a6dac758 100644
>> --- a/drivers/gpu/nova-core/fb.rs
>> +++ b/drivers/gpu/nova-core/fb.rs
>> @@ -216,10 +216,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gs=
p_fw: &GspFirmware) -> Result<
>> =20
>>          let frts =3D {
>>              const FRTS_DOWN_ALIGN: Alignment =3D Alignment::new::<SZ_12=
8K>();
>> -            const FRTS_SIZE: u64 =3D usize_as_u64(SZ_1M);
>> -            let frts_base =3D vga_workspace.start.align_down(FRTS_DOWN_=
ALIGN) - FRTS_SIZE;
>> +            let frts_size: u64 =3D hal.frts_size();
>> +            let frts_base =3D vga_workspace.start.align_down(FRTS_DOWN_=
ALIGN) - frts_size;
>> =20
>> -            FbRange(frts_base..frts_base + FRTS_SIZE)
>> +            FbRange(frts_base..frts_base + frts_size)
>>          };
>> =20
>>          let boot =3D {
>> diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/=
hal.rs
>> index aba0abd8ee00..1c01a6cbed65 100644
>> --- a/drivers/gpu/nova-core/fb/hal.rs
>> +++ b/drivers/gpu/nova-core/fb/hal.rs
>> @@ -25,6 +25,9 @@ pub(crate) trait FbHal {
>> =20
>>      /// Returns the VRAM size, in bytes.
>>      fn vidmem_size(&self, bar: &Bar0) -> u64;
>> +
>> +    /// Returns the FRTS size, in bytes.
>> +    fn frts_size(&self) -> u64;
>>  }
>> =20
>>  /// Returns the HAL corresponding to `chipset`.
>> diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-co=
re/fb/hal/ga100.rs
>> index 1c03783cddef..2f5871d915c3 100644
>> --- a/drivers/gpu/nova-core/fb/hal/ga100.rs
>> +++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
>> @@ -66,6 +66,12 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>>          super::tu102::vidmem_size_gp102(bar)
>>      }
>> +
>> +    // GA100 is a special case where its FRTS region exists, but is emp=
ty.  We
>> +    // return a size of 0 because we still need to record where the reg=
ion starts.
>> +    fn frts_size(&self) -> u64 {
>> +        0
>> +    }
>>  }
>> =20
>>  const GA100: Ga100 =3D Ga100;
>> diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-co=
re/fb/hal/ga102.rs
>> index 4b9f0f74d0e7..3bb66f64bef7 100644
>> --- a/drivers/gpu/nova-core/fb/hal/ga102.rs
>> +++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
>> @@ -35,6 +35,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>>          vidmem_size_ga102(bar)
>>      }
>> +
>> +    fn frts_size(&self) -> u64 {
>> +        super::tu102::frts_size_tu102()
>
> I checked the patch history and it looks like this changes from v1 to v2.=
 If the
> argument that "both have the same size" then I think this just makes thin=
g more
> confusing then the purpose of deduplicating.
>
> All the methods above are either delegating to GA100 code or custom, and =
now
> this delegates to TU102 without any explanation.

The reason for this is that all chips have the same FRTS region size,
*except* GA100 which is 0. GA100 is the exception (it is also documented
as you can see in its snippet above) and should be treated as such. Thus
I'd say the current approach is correct.
