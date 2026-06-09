Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020084.outbound.protection.outlook.com [52.101.195.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBEF3F4DF7
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 11:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005547; cv=fail; b=NCqk0dBPsqcmo0pnvGd8x0Ar6WT1vGODcaDf+BsfaFZ0DAI9eK5F74zoZN3E8WaLNCZ85kpYeRHnK3h8+goEk7FCZTviK3eiwn4/+XqbMxAYHpQclWr9dGbvFibhHWaj5vXnDroj1lGA5DSxFx91w6aVeeCAGOaOmHsIBtnXPnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005547; c=relaxed/simple;
	bh=0oTY3apOcNE1z7+JmGBi1P8NV9l7gTlYJKHv5NCQhPM=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=FKRcTXJ089RRbwxzVf+30SCGF6oK+GudOJNc4bB12IiTOILaqrqeBo2oVrfhaIpcsjYvV9sFErTtC5bXCfqo7/IuSDHWecMrBAY6ULEjjXAWr3oTxahRauWocR3V+X5oX8O+xj77OX0LNCUDgvRdqDmH9lYl6n2+ao7Jenv6+h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Wzdvs6ZM; arc=fail smtp.client-ip=52.101.195.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Wzdvs6ZM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8h5DmPEw/C4jBgBYRuNsp4dRqtuTPEdKx85DbyjueC1SKmt4pggIalJQ2tJ9wNdTnDCJkw4d/rtihQcceRoYd01hwkqdO687p+9+8Sy3jyPOiS4mcQTuCIpwkYc4+sHbVi01DvkOIrT1gzgCaCGAsVe7pwk0dLUL9PeiZCj+7QsfR5uF3M5o6+Bad2wc60P5s4O2/+6Ic1rC5ffBzXmwldo518ja6IDo5VK8uT8YLpviAtVAS8NXoEalrJPe5qybVVP/Z9XEE30jppUODrJWPXmMP3wVM3qQs+ztOctbYRdPk1uJrm0U0mTvlKO3TLvBopd58WU8KQt92R3ttpNlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgMnsnwPmofbWF2hMxOxrC9JRb8bH1WiNci/ghBsN38=;
 b=fN2ZEbW28YJzh0QD8wUJz8YMe0m5zEyghtbqTpis/4RZpwtJtzg2OlpVku2CdMAjeKAqJhzrBZU6DvYU8Crcf8Kpdie5Wk2TXJPR2IT47o9e1w6LPSrzTm7hSz5K2LSZ8jml+S7LwG7cjn385PBTXR5AdkzrhXFuq9OC8/kFxYVRPj5+EJcQQe6Ezo1IPR0T5FbrGHkH1DAK3VlQL4av9HSNwOPrdD9cwRvwTbtmsnWs6uPYONOeFFzEbI8oqTJDLGqZy+Zo4SBH2EDY0VDWWbXRwSgCGsmPL2N7QjomDAWSe1EMBz7TzPqusCMya+aFDuiRHYph14cEVu++q1ZS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgMnsnwPmofbWF2hMxOxrC9JRb8bH1WiNci/ghBsN38=;
 b=Wzdvs6ZM3JwvmDYnxWWa6HBLB/4P5+jWkCIl9Y5mdQBc6cZ1t71z9ytrmDLt3abQQKg3TWW2RZkdrhMQ1OvBq8YUCEORuL39aqiojrqdbfZncU8koIj7tv93ucT6LsIj9Ojk1RACvsf8brDhsxeA90fDQ6paSwS1oVnqDeYeGbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2350.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:119::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.15; Tue, 9 Jun 2026
 11:45:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 11:45:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 12:45:40 +0100
Message-Id: <DJ4HRUC9Z6QM.28GWOIPYZRX4O@garyguo.net>
Subject: Re: [PATCH 1/2] rust: str: use the "kernel vertical" imports style
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260609104152.261145-1-ojeda@kernel.org>
In-Reply-To: <20260609104152.261145-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P302CA0039.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2350:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e34ffd-ac27-4661-b0fd-08dec61ca20f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|6133799003|5023799004|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ah7qg7MMZUmfUKXuJr1RWD7a95VYCteCwqmNcyado5kTjBH8fwx8+lDQTlsOlUUB6eiJiW5HhBvQG5oOksk4wg2MPzGUSPuiGeIZs7Ng7NUGjlUj97hE+5dtFt/vhrAyrBvV+KfknA04/CKvzXuojdPklxNbduWOLjFVvH+cJTpgDEVND4eKDAl5lzVBFej3B2HsofAYuh3fKgNm4M3PyjLu5EcgpS84G/wkXzQZKnCO4m63OANmVOsZLYCEzuv+vU0DjM5s1OEvgyatEOiAHq293t6r+FTlytHviiBiKy1VhGiXVtyPmbe1JXg6/j3z4r74z9njdeAKlcaIIoaPIDSaxNi6Z8NeIqbx6I/ix0DNHkxQL2JMIpT3F6hjeUZvU3unjfPgbO5JZ3d3TCtARDy82HsGbnJWTSAXFopmBpGs4aN/DDREJFRTD/WmYNDJlVbzNr2YCQnkreJ009CdphdalvZQXjpFD1a18xPPWNCtJ1+Zqf6gvtsRvtqz+K+gplGFW2oEcePomi9txFY8Gmj7KUDkKX2E6YnM7FB+Gm4oajcid4JVgtDR3hChmB1ONWCtBYpNvE4kNdE0O1hjPnpCRmQF3YZEUJ4WFiO5zrhsuZ8nPsNtAFD7dZx0rgC5oXLFIBwNjH/OxqgLX7+G5yn3oyR+NSPoyx0gqDHE8QlgVaQjhqBLgCXWQQbI5kKP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(6133799003)(5023799004)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUUxM3lBNmZqaVUwdm1ZSldqWHFibjZaOW10aUxweVN3QXVSTUpFTnhRak0x?=
 =?utf-8?B?N0RqckRISzJoT1dtbTRxUFhQTjJwbCs2bE1RWlZqUzJMVHpPRUpxY1dqakp1?=
 =?utf-8?B?SE9OMUY0dW5PRE05ZFFLNFN3Q3BaNVVFdFo4OWx4MHl3cUZZS2ZxUGE1Wk1J?=
 =?utf-8?B?eXg4Vk9BM3NQbDU1THh3cmdMZ09zSFJ3R0g1WE14NVVYRVN1WWFKeURSUUJ3?=
 =?utf-8?B?a0lGVlROMzRyTUxLQjVkcVB6QW9EdFRGUXlxSGFHTVhTMkUyQjA0RHR5eFA5?=
 =?utf-8?B?bmVvcFhMd0xIdUFxeFlrd2E2RkxyelBOMzM0TTNVSW9CYUpvVzY4UXpTSkMy?=
 =?utf-8?B?b0pUbzllaWpRVWlucUpXeDcreStGeC9EYisyVUtaNWJPL0ZNQXNXYUk3RHpE?=
 =?utf-8?B?WkZGRFcxWlgxR1Z3YkJqQWhUYTlEMDFzeUNzV3NkeU5Gb2VvWEhuUDY0THZz?=
 =?utf-8?B?T1pNUUNsaXVPbEZWWGRPZUtFc2hkL0VVYnA3UjlIWnF3dHhnTys3b0VUK3BB?=
 =?utf-8?B?V2dlUDBSUzN2T2U3dWF6RVAzQXRWSVpWdUswZk13bE5ueFdNQ2hoMGVaQ3Uy?=
 =?utf-8?B?czFLZmhQTmZwcmxIdWI4UGR5ejU2ZWhUNzVneGJSdkJWeXBxQzRiQWgzaEFr?=
 =?utf-8?B?V3kyS0JJVlZQZzlRQWo5cCtpRzVnQjZCMW0rOGxnNVRVYm14MC9hdFlreFBI?=
 =?utf-8?B?Sm5oaFNaU0poUFd2UzlvWDJWUEJoY0IwLzhPd0QyOGt2TFh4bVBST0l5bit4?=
 =?utf-8?B?OHZIR05Fa3FMY1FPdnROdklKRmJHa1k5MTlGcGJYZGI0dlQzRUxrSjJKYVly?=
 =?utf-8?B?RGdlaFRLekhwWEI5WU1RdHNYOXlCb3R5eEMzeHg0bnpwV3MxQUM4eHBvSndM?=
 =?utf-8?B?WEsybXdkcGJLVXhHSXpQbWo5NzJaOFNkUU5PeTlTWURYUlRPVnpZSHQxQTM5?=
 =?utf-8?B?RE1MTnB4QjllM1MyalQyYy91eE9GcEQ0MGlWUC9zcFY2Mk1IRDh2anYyRjVt?=
 =?utf-8?B?bzM1L0RDdjg5ZmpESTFyYW04L2ZOclVKZUJCdnVncGxoVzdLOHVQU1FzMlFa?=
 =?utf-8?B?UTdvbmFQWCs0MzVYRlpxTUROVEhSWjZ0K2JZTS9MVE1SSTJqUVNGT0FtUjcv?=
 =?utf-8?B?VkVWNHhmbUYvcHV2SmZweWFUbmRrSE9leUl6cXFpcFlUWHVjVjNHMVRlaXJY?=
 =?utf-8?B?MVJsRUVVeDlNRG8xa29FaXltMW1tRmRaQmdTa2pwN3Q0ZUxYS1VPTGsvSENz?=
 =?utf-8?B?djZ1Q0QrM3cxWEVackFyTnBZNFUrcnU4ZGxVUjNSSmVSYzZIb1E3cWZNVHV2?=
 =?utf-8?B?NXJkS2NnNXV2eEVEcVlKcHhUM2xvMmNaZFgwZDhVRE5oSjlOdnBCOUVmRG1k?=
 =?utf-8?B?b2gxRHgrclRlTDRNMFpWRGhNYmFZdStNVUFrTnc5Z1hkWHZXeUhBaUhLbGlv?=
 =?utf-8?B?YksyaklYMUthYURqTmpQWEJ3MVNFdUFRN0VTK3BFR1pNckh5SGFCOUdvRHUz?=
 =?utf-8?B?VHl2Q3NpWXdibGNwVnNFcWVCd3k4YlVyaEJSTVpqaG84cmpzMGpPQ1BQV1dh?=
 =?utf-8?B?OUdmcDFjZngvMnRBdGh5Mk8xY3NNQjgyRklCZGFEdFFLb0VNbzNYRlNCZ3dT?=
 =?utf-8?B?M3d4WWYwUDRGZWZ1bWRkWU95M1U1aldVeEdCNDYzS1BsdlVPOWFXbUxBOFZ2?=
 =?utf-8?B?R1R3N3lEM2ZFRlZSQXlQQ0RLVnlYZDBjK2wzU0ZjOWg0aHJDbmk2cStLYW5m?=
 =?utf-8?B?bVpIZzRXYmxlNHB3ZTlLbGZ4eTBvOHZLdWs3MWZ3Y0xRY285RHFaL3FrcTNP?=
 =?utf-8?B?MmtoU1dSWnFxb2g3YzdLZlVlbktYMW1ES29aaDJMbXlWNXJVaHkyUEN2aW9X?=
 =?utf-8?B?YkpiWlNWT2wvejhTaFExUmExTnlkRHNLSFV6L2JoSE1uZGdyVmxhb1BUTkJT?=
 =?utf-8?B?dWFBeWNUK0hQbms5OWJXT1BiQlJ3U1Z4RElpUkJXZmlmd0IwVlRmY05nTC9s?=
 =?utf-8?B?bXZLUGZjOXpzOG1UOWNiQitVZVcxcTZ0NlZqS29sK2NPOG80UE1PTnI2YnVu?=
 =?utf-8?B?TUswWVoxUXZVVEZmamRrTGZ0Q3RvTW96TmtiT3F4OTIxZk9pNjlDRG81eWpp?=
 =?utf-8?B?b2FRaFNxNGhBdGhXRnNQMldFRFQ5OEplY2pCNVJaSkNNUTR0Y0dzQVB1aExB?=
 =?utf-8?B?S0VkNjZuQTRxdkFMQkluYVBHa1V4S1d1bkVCcGRnUm9oM3ZpMVQwNHRLaUhE?=
 =?utf-8?B?YVJtMExVeUVYVHBoblNsTWEzVEhTQzZhUWZIMUNvVk1zZThENzQ1Q2MzZ1Bh?=
 =?utf-8?B?cGg4VXBTbmxKSWd2RUZ2aFJ1emhnKzhQbWRjejZuVXUvZEM2c0RhUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e34ffd-ac27-4661-b0fd-08dec61ca20f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 11:45:41.4535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJOJJnPoUEtUplWd1FenfUM70Jc7DdHMDWLRL3p5SZSE2B2mO/hIIKzR3pa5/HmoI3IvKWEDucfPbGSq/g/H1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2350

On Tue Jun 9, 2026 at 11:41 AM BST, Miguel Ojeda wrote:
> Format the Rust prelude to use the "kernel vertical" imports style [1].
>=20
> No functional changes intended.
>=20
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/str.rs | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)

