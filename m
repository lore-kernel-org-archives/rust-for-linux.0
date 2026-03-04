Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021077.outbound.protection.outlook.com [52.101.100.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5BD37F015;
	Wed,  4 Mar 2026 20:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654706; cv=fail; b=OAFSZ3Nt9mQ1lY9E9c+WbQJPRGN9skpINAzz40GFEHHNj4pVYxcyWhP9UsZ4Tw5JxF2jsEb4lLdmooMtR/aCFFxUOJwIUq6WAuNOEddQjPOVZzi0PRMpXtmLH1LbFgJ2U059m8lX562oxLhy0+VPt62OEpBcRR3zQ8RmpYRDM9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654706; c=relaxed/simple;
	bh=sd9p0ahnd8jyOlOy684ecR6Cr1QJGAl20JRf3lshIk0=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=Hr1rvQiDiIirvYX9hgkubSCLW+j8I9Jd6pFRqGFLc3VlsKqj4QQLyaCixjAHRkbHb1LjIzIl7hZRye9S7OnSYZfbSNUbm3txdVhjtDxJhTwtH2xrpdBAoRyfJPP5UZ0rnWVznav6h1qE2d4h/mzPglAEm0BtSxu78RBJyjZCJHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LSIyDquc; arc=fail smtp.client-ip=52.101.100.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LSIyDquc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0sYfy7OjW1K/vKgYzK3CPIiVp2k4GCloES5jnHp+S1WxWe9euiAs1kvteUvjHumU6c4OjyhX4NacA0638Ti6Ig4x2fyrDG2xlar0y706W3cGrJMnJPAddZuIILq5MF8Zt2dYwYqG0OlM0KawGTvzK522OlH92pZ/VGIRPqXSrsxgSQLIZIDtWeu4gd0ngGx1cdN1gWY9OCsBG4FjjVQM6bdcsQWAB7+tgyE+Y6fhgOC4+1Wm9fu9JYw2aAc18qabhKLAy7sXDd4UcDYanNHYDa9ddjZ0ePr4Ld6Vh3of0xIEfNRwszO2PSP17X/T6c4mZ3kAj4mtE319A2rpkCK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sd9p0ahnd8jyOlOy684ecR6Cr1QJGAl20JRf3lshIk0=;
 b=eo+N0QgAffBvAm/zS80jD3UZ6OHcxWMzp6GY9DHQwluCUJH87UiQjDEsE0hLsLHHoP/MM5VVUxdIKNxNLM/x+Abt3xXNpw/EAuXbe7LeBCG80UpD30VRK8p7Mmfy71jgDMGcbFLV8JEE7hT0K7AhNG1LBEvAMHyHV/nTYfmXI2u9A76BaiSDi2BdrVpyHcooMku/nPFqM0v524Kof0xd5Ic5Ze/KMB2J84XFCZIAI9/yY652vd+bRPg5YTe/RVybvjynZd5C8A9ZUc5t2eHtLCKOz+j2nctMP3Mi/4uErRZJI/vTJlug+blsE25N6FDT3DUYbQJhIXIxchzJK778lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sd9p0ahnd8jyOlOy684ecR6Cr1QJGAl20JRf3lshIk0=;
 b=LSIyDqucrOnf4uwc07jtJR4CN2T3wImn1juA+UFclqbCGr4sdhsenJq0KqN5jRT+Uvx5WOFKDCIp5wmB7A0puWbntus72c9zi9dd8amq+TW+l+yVxXnM7/RXnn9x2+i6h4ubpmATLaFJr4PgIQsaXwE1fk1ua7gET9WrKiXkNpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3101.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:162::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 20:05:02 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 20:05:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 20:05:01 +0000
Message-Id: <DGU9NBNYS3X5.1GL949T4OKY9C@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Boqun Feng" <boqun@kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
 <5e281d9c-20e0-47e1-8635-e062f18d47ff@nvidia.com>
 <DGU9EMTDIHKZ.4L5JDE53Y76J@kernel.org>
In-Reply-To: <DGU9EMTDIHKZ.4L5JDE53Y76J@kernel.org>
X-ClientProxiedBy: LO2P265CA0197.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3101:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7e60ef-be87-455d-d0a6-08de7a2951ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	Nf6hp0QPkacmPSqQokZztZAyfkoa/q8J6rnrmDF2MEA9exMM+i1wJhRkLL5uT0GUvDLkMRVMk0EXvCByE/XbqGhYOZfu7TAuE2GT91owuk798adlMEzqyxTRDEZaVweLQ843nvtDIpvZs4PdN8NomywcIUp3Y1s7afW3ygk1qrWgcbjDT11FvHfOy8GOUoUjbcr9JcXzZSzjUq54zmyUbO2ro7i+lBI0TqHGzE3ne0Wffq7+76pdR84HOEp7LZdgxat2LM0odqcN+RA6dblDhA6cREVnj6RV/JLtfgVFywx2mCMEpBp1hTpcRKDzo33MKHSFS5/F78j6o6YczhMpPmATO5Wi1L/c9MrqNy7jjzqivlVQUQshAVsyMhy+SfIlNIukIV96nfBIIKCZfSJSfnNDHjrvvU0mJo6WWSX/6bXyAuCwIS6uJrppWGyddkhT86NugZoxXDWmk0Rx4aEprDqZ4TvbYtjoKx4B0oK6tpRALKqf3+fWIe/0Em8m7QAQbrmsisJsVaYIQWQUdbUdaEHjXzqQ9VePbKfR+PcfADDnmv/lhqNopbMu6TOeGNpR6o4eGUC8JxyDxmynrdJkw088IuraJq1mNV3sXB/FlpQfogRh+hqVFS1JEXXGQPdqt9fQ88FcW6nk8XlE1A3q+gr1noUGg+O5xoT+Dx0wHdn/iw/Mw3XzwPoJxDRxD06nYvKPRHkSPjO5EtIb4C2Vpw3c2A4tXMP0KC8otdujvLM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SERsODg5MnJ1UXJaQnc2U3ZEY1A0RTVFMzFYc1pURzhvY09YckVoUnBFMDNp?=
 =?utf-8?B?T3B5bDVNbHB4RkZIMFBpV2VVRW5qRUZrSEd5M2dNeVpGUDlieVBrUlhPRHR6?=
 =?utf-8?B?YTVBUzVGREtGSVd3d213Zzk1eUdzZlc1L2RRWWo5TDhsR0RINDc3UzZDa282?=
 =?utf-8?B?QzhPMUNPZ0lKSlZOVkNjSUo2WCtJUmh6S0NrdlV4Skt5WmpyYXk2RkhteTdi?=
 =?utf-8?B?K20vS2h6NENGT0VBYktobWhBdlFNb2xPSXRkRnp0VTNvL2IyUndodEExY2I5?=
 =?utf-8?B?NnZsUmVtUjYwL0VKTGg1Zy8xdDVvWkRrM0FxYjdKMzVMQzA2Ui9acUtGZnY2?=
 =?utf-8?B?a0o5dmpnMVl0azZVZGVLTWYyNUJCczdxTFg3c2EvQzg3ZkZtOGI5QVIySkdt?=
 =?utf-8?B?Z0Y4bVhJaFF4S3MraHltSlhDQm5ZLzhzejBZVVNZVU1VemJwZ3U5Yy8wVTRa?=
 =?utf-8?B?YUZMdDFBemZmK05kMW9EWXMxU1g0YjJvOEtoeWhESXlDZFpSb20zR3hHMHpx?=
 =?utf-8?B?bjdSQjVuMUh3VjkxMklkaVJLMFFoVVo5QWZVVlhHZCtNNnVJNDVmK1A1KzZK?=
 =?utf-8?B?WkF6MXZJbDVHc045ekpUQ0wrVVplMENIblZjSXA1WlluVEVESVRuNDlUcDdo?=
 =?utf-8?B?N1kvN3BydEpzeHdhbGFxRVZwLzEyNnBKbDVWYWwyU1VMdXFZbEF0TU91VUVG?=
 =?utf-8?B?NEhRZEZyMXYxbFoyRVh4R3FpT3JLUHJ2dHBmUVhQOHRJT3dkMEdBRkhVUTRk?=
 =?utf-8?B?d0VIZkE1SVEveVlabDUvN0UvYXhNdUVKYnBKOUk5ZVRLanRTSnpWVFh5WmdW?=
 =?utf-8?B?NEZBRGNxRjQvQ083WDI3ak5YcVE2L3BKbXBaeG5nM0YwM3l2RlRtWndxbkk2?=
 =?utf-8?B?Vm84QU5odlQyTXVnREh3QXF0UVF1YThWNkliaGVhTHo0MDhSMW0wOHVLd3lV?=
 =?utf-8?B?TGY4eTFBcWFQWEgrbXZCSnhGbVhCTnhqM1ZpL1VleWVRZlNzL2NCK0c2TXEv?=
 =?utf-8?B?VGVZSkJQRC9tZWRQaU5pVDJJOEtVNGFuaFNzVDFZaEVidWpSVi9BZXN0TkpM?=
 =?utf-8?B?MEJOcHZoZVQrSm1hZmNPeS82UUZjUHJwUkRTVEQwUmZYSjJ2Qk5QNUpwYmpR?=
 =?utf-8?B?TFNDTXN1SWo3M3ZjWjlHazBMKzhFSXVZVzZmVWRUWS9Jcjh3bmlLdjhxcDJP?=
 =?utf-8?B?RmM4aVNqWGh6cjFhbjlwbWF6aXBWWHZhZ2Nma0NlcWxlb1V3R2NUZmRIa1ZW?=
 =?utf-8?B?REtEcWZ3WC9tYmRTelR3czRRMnFpYTdPRXVNSG95UTl6WEdxU2dDbmJWaXdM?=
 =?utf-8?B?SFM1Z3RkL3o3V1ozNXprV2dySnMzWVYxS3RMZXcxVFRQN3M4bFF3M3U3TnFI?=
 =?utf-8?B?OExUY21BLzZDbmFPMlpSYzdWcVRFYlVHaWphODFCNFVRelpQcFRQVVpVLzRN?=
 =?utf-8?B?YUg5UE5aWTc0K1crNVFLNFZySS9CbE9SWEErSmZHRTJ5TUFZV2pVQWxBQ2dl?=
 =?utf-8?B?UDFYUmNsbWVYOXBwc3A0dVhBMlZxT2hrLy9GZUJLTnRPclErOXAyUXlrUlk1?=
 =?utf-8?B?aUk4Y0Q5aEJTU2hrdDVsZXlBdFEySFhUZTIzVzgyWUdQWWtDelBOOFpjci9X?=
 =?utf-8?B?N2s5TFY4OGlPS2szRXNhdWc0NzYxTWE5ZkxkeUtnNVhXT1BwdjBwb2F3WXZI?=
 =?utf-8?B?WmxGVWRKNHRDbmM0ZU5yQTljRW5BOUpCTkwwUnBkWVJIYmhhT0RFUjE1RUU1?=
 =?utf-8?B?aHZaUG55bnVVcGZXNE1nN2ZML1A5SndxZEdZWmh5WDlUUGNEWUltWWFsbkMr?=
 =?utf-8?B?TDRQTGdvd1dBNDJSRkQ2M3NwdDRzMFVJMXV1QllYQzhMMHZiMDZUM1NYYy8z?=
 =?utf-8?B?c2dBMWVDOGU3bU56SndLcmRqNDRsVVpvSG9kakcvS0xXREVvOGVMYXVHRmty?=
 =?utf-8?B?NHRvUFdGODdrN092cEpJTEhsdUU3S0RvR2l6djkwcmErNmJNdmkrM1FCbTBn?=
 =?utf-8?B?VjhGN1FVa3dnSVMya0pqc1hnamliTTZJUllqQ3NKenNGdmxpcnlMeDZ3djJx?=
 =?utf-8?B?aEgreGJnMGNqbDBBK1pYRkwyaHBZSHRROEp3UFVHSnRQRmdZRG1EeVFtWmRl?=
 =?utf-8?B?dXhhZ2Z5OGphNGt5TnFpTGpSUURJM3FDSkxrM0dHblBsMGwxb3JMdVpaL0Jn?=
 =?utf-8?B?bFQ3VzgxSzk5eE9kWE0yZHVJOFZlUWEyL05hYko2dnIyRTRMeTVMbWMrOW5K?=
 =?utf-8?B?b3RCVTJqYnArWUtkNi9kZlFtOStWWjdRKy8zU1VGVml0VC9haU5mS1RjU2dT?=
 =?utf-8?B?a0RKNVREcUJYNG9DYVlISG9QSjRaMWI2WE5PbGFudE4vOXp4MmJxUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7e60ef-be87-455d-d0a6-08de7a2951ee
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:05:02.0951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NL9HAfGspuqUY9wO0M7bdyPKL+CO2onL5o+ndY+3fDLF6TrMO0rfFISKe0Z7r3Qj+AGNTixB7mb2ffwL9IQvmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3101

On Wed Mar 4, 2026 at 7:53 PM GMT, Danilo Krummrich wrote:
> On Wed Mar 4, 2026 at 8:19 PM CET, John Hubbard wrote:
>> I also want to register (haha) a strong yet unexplainable concern about
>> this. Registers as types is something I've never seen attempted, it feel=
s
>> strange and unnecessary, and just worries me.
>
> Do you want to go back to lots of defines, manual masking and shifts rath=
er than
> having a single obvious definition of a register that generates a type wi=
th
> getters and setters? Needless to say that the former is much more error p=
rone
> and less readable. :)

Elimination of manual masking and shifts don't require a nominal type syste=
m :)

I can imagine use cases where a interrupt-enabled register and interrupt-pe=
nding
register has identical bitfields, and you might want to use the same type f=
or
interrupt enabled and interrupt pending registers and might even want to us=
e
bitwise operations between them :)

Ultimately bitfields types and register-as-types are all or nothing.

Best,
Gary
