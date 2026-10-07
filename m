Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020100.outbound.protection.outlook.com [52.101.196.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F5A44BCB5;
	Wed,  7 Oct 2026 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376623; cv=fail; b=A/Pi/2MqibXSwUnX4vcGUrN31n/ez4lC+8udiSdaJFCgrth6TmQqjKPVY1qXlW7drdWr66MBtxxyvL6y6Scpmh+uqinAa9K/gjIv6wWm0PDaaMSShxZpPpgz+ioulseXSLHdf0wFeC8KMm3RCM7Ef1nI5MbwJbKZuj/ZBrxIF8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376623; c=relaxed/simple;
	bh=y0Qi2PvlFd/km4VLT6ISxs5F0/a5AHxL21KqoxTlbDQ=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=gS34eE/mgnNuvUDwXs+H+KCRAAVLASG1v6m51/v4q0QKdNRk4SnehjKRUTZW6Ty+C9K2Kajgl6tiusQSJqXrAtWLqYfgqBpXeAvUtYCWXX8jZcbRvsIhQ+AJlBBi5YJO0IbU2YFU3N5BO7YlL8Vew0ZQUBp4S8qTAqJj/hCB7Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Hd565sPq; arc=fail smtp.client-ip=52.101.196.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Hd565sPq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGfBnhzMUt2lr6XnMQZiDNay+jC9f18X54VTDLPSPy6zPpcv28k54/f5Nl30Bn6uQf2J9IWC9ftdfTJshzHYZK0qX8yafboOZRKN0T8UmmL4d7P/6oAHXKMFSKsSAVGrHRIrN0PuEWvkpJ+ETx2lp2N3Gko8GLreInHGT57MmzUvF2oJE7X+8P1rioo5tfJ6HXP87YQs8XEVm4+NMQnhuIrRI1uSPUxY2BaijCufbNdHBGYDj1CFPzf4g5G2Cpwy33dacXKyPEul0Bte0i1etQRikR6Z8oj9AjFFF7HRPiCybRCFgNwHvT9slCChCb0JzM/XDUz3sd5fbAdqyMAYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miZI4uEBDxRLsaIn1qVnY5Sy5Pw9xqlYqQ0CcDa/LFs=;
 b=fOJdy3qqqzV3f5KXd4RU8+WT9M/E9LH58E2jga/hEdVKdym/HXJGmv2P2ToaJALfESmJGADf5WFJld6eNO9lO2z9EyzqJUctYbVaduwXbBsAqIGmOeMqApK7+qzH8uYQSbiL/o2M717znuDSILZpEnKL+j3HGtqLiyW9rSWkPkM+GOs6IrYZZS4R5qQ2Y+sUs/Cl1VzvFGSjv7tVC2zF38r5Rf1gPSwfZm/LKC/6E6Hu9U2bluMUN9QVsmnN/N4V/D/o8uiDh4nHhhX4dyaG2Sk1N/fFGN3Mngty9MdbF8lfiUx9E49gQ3ExEfXwUSYjoDliKjXCWPlUk1D1FDsfXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miZI4uEBDxRLsaIn1qVnY5Sy5Pw9xqlYqQ0CcDa/LFs=;
 b=Hd565sPq+B7Eha6dROvuWGRX0TIW2TyPK3y+81Zcz0k/O06KgTuSsMHwngp4LCPb0+D3PpYAYOxe8o6uevejSyQNCFa52K8gsV2P1nvyrn0eGyh2uBtQCygCdn2IBZ9X381t8lHmB394NKuHrWvlLwe9Ren1UYJF+hiZ7pyCRBA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB8782.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:279::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Wed, 7 Oct
 2026 12:36:41 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 12:36:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 14:36:39 +0200
Message-Id: <DLYM08Y3B909.2AJAKJP0VBP77@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, <gary@garyguo.net>
Cc: <a.hindborg@kernel.org>, <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <linux-kernel@vger.kernel.org>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>, <tamird@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>
Subject: Re: [PATCH 0/8] rust: pin-init: various cleanups to prepare for
 self-reference
X-Mailer: aerc 0.22.0
References: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
 <20261007102045.1593329-1-lossin@kernel.org>
In-Reply-To: <20261007102045.1593329-1-lossin@kernel.org>
X-ClientProxiedBy: VI1PR0502CA0006.eurprd05.prod.outlook.com
 (2603:10a6:803:1::19) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a3e506-f842-48b8-3dc5-08df246fa34a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|18002099003|56012099006|10067099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	NIWnLS2bpDb3UCwfSyheINFK9DFKAzRUX/DPhBR3qNYUBKS/er9B8jN5rU5O1mwSd7uJzD3GhVVfeKnqnSzpEAqTdfebjPXY7V9V8Uk1Kq6/yCDOp+e7lVZwCaQZIr08I894urmXptQaPkXZMYc06IxF7j3OqKnwnGVa4GPx0A+k/jFB32/YP0db+sXHGgOAncFzJQF1oYNS7/tDCPYxqNrVyig0Bd2pv2Exsu4PCDHKslVBFsaJpkx4G048B7Tn+knsSxyCor5YMSWduE7oWHE+YPZ522Ap3mVNF4oZ/TtPGy4DMU7noPt5n1y/MrcFW61j8gF5SK2qrvWbek2IwXLIio/1eZoaFv6hGmhA2CtFQGmlbm9p9gJTmdCcoFD8pecQA6x9TkJBtZrZSHf6tRxO8TzPV1d6R9mD4c9BcftUsW+RsqzEMqYK34GCpYxEZA4bGEPa9ZOIosTm3W/UKFcOBfoAFTLmo8jEtyqC3J4YFhTq8yb3ev6qvOnqQ85HIljmBYiaDfaLFWUIMZy18MgA8ZAKiRBaRS+CkmErJZastbF1kEqcst65JgZQzyRM6FTsX8bUJBAps5g4XS9MgcDmbdRGgktd7Nmcb8+ZwXaA5SlunuhuGvKfUvzL/JrC5nIqdHwbFL6sFzwI+7qquf2L2QndY0iaYQyuvDUsfJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(18002099003)(56012099006)(10067099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2llK1FabGdUeTgrZnJlSFdrMlZNbE9XTk9GdUlBVkdqdVl1TklqbU5jb1FC?=
 =?utf-8?B?dk9WWHNBcE93NmMwMXc2ZTN5TnAycUJtSVJIbzNjNWUwbGtyNS8wTWlkbHVt?=
 =?utf-8?B?WnlVZzRWT2NmTjRGR0xQUVhsRWxmazUva0VlU1JVQkp1UEdta2JHWS8yUzBz?=
 =?utf-8?B?VnhSQlBCQnhSaTlSYlMwcFZtK3kya29DRDdjckw2UE1NclNqNkphTENQU1lR?=
 =?utf-8?B?ZmVrSXVwenJZODFXMG1sL3lyK1FJeDdBdTB5M2hVc1Y2VDBQOEQwc2phTHJR?=
 =?utf-8?B?bHBDSkJTUjFkaWYxUk9pUjcvVjJkZ2IrQURKdlgxT3hHNXB5b29SNnUrOWNY?=
 =?utf-8?B?eGFEWXNHNVkwd0hER2FJMGphN08yOFJkcG1aMkNUTVBESDRLaHpSaFZDNytj?=
 =?utf-8?B?dVNjNWJya291dElQYVNwWlVDV2ZodEFkQjhZUmRHeW9CWE14a05mQWhjdHlj?=
 =?utf-8?B?dHk2TEFRaGJQRWI2blpwRnFTelE3ZWRUR0NMN2dieHpKNzA5Z0RqbEFhZVRS?=
 =?utf-8?B?a0g4ZGdTSkYyTlZybTV6QzRLSEZHN3VGcDgvcHV3Um5wRHdaajdXREhubFln?=
 =?utf-8?B?UU1ZZFRrSHdDZXg2aHc3Y0JIYk9ZZ1kwRk5mdWxDdTRWcTBXcUV2VjBFVXli?=
 =?utf-8?B?aW9mRlJFd0ZMenptZlVJYURGRytNUGswZkVCNDl4QkE3M0gweSszT1dHa1Fa?=
 =?utf-8?B?blhjbEMyVlNnTGhobjg0ek9qY0lmQ2lBdlJrblhJMU9td2V5ZENvTi9qWXFo?=
 =?utf-8?B?a2xtY0g5TXhGbkt6bDdaeENHZjI3V1NKd0ZBMGo0SCtvb0g1b1ZFMnZpNlB1?=
 =?utf-8?B?T2lPQlU5bjJKek1pR00zTVgybTBmbjlRR0pMbmFiMERVN2NJUGZEcG9WYmF5?=
 =?utf-8?B?MlhpSFdpdTF5ZlpKVy9iOEEzbmw4aUNEZ01ZUnFZSjc4QStUWWxGZ2VZUFZE?=
 =?utf-8?B?WHBza1RwY0c4WFYrYVZnbkVOL3VJa1U3aWlsdWcrVitGZXBVUTlJSEw1YnRZ?=
 =?utf-8?B?SkdWQ0pwU1ZiaUlIOWcrR3BZV2Q5ak5KRXphNE9oYWRIMGZ2MDlqMkUxT09v?=
 =?utf-8?B?ZzV6MW8vQThPUld6Y3pnUlNYOUQ0RVJROFhWUlh5SGtNd1h5ZU5qYmFFdS9F?=
 =?utf-8?B?SXY4U0RmV0pPYWx2aTBDQ05EVDFkVWlLa2hGTzJKRkZwMHM4OHFpeml2NTRu?=
 =?utf-8?B?aVIzQkJNcnVOdEI2NGMrV0pVSlZLWlBsWGtxS2VlNmhwUExia2VBai90dDhO?=
 =?utf-8?B?MUZIdFZzV01qbkJ0QzZlV2tHTXB5OFdNNzVHdE1MMDZRZ1VuSjdVQXgxcENq?=
 =?utf-8?B?TG94SVBJTEJ5VDZBT2RqOHBnaVA0TE11TElaUHgzc1IvUjgyK2p5RTV6eDRp?=
 =?utf-8?B?alR6V2d2UEZyMzRaVUJlbVJkYWx0M1RTa3BINTg3SUtHVVozOERhTXBCTUlr?=
 =?utf-8?B?ZlJ5dk9mWDA0WTlQNXBXTEloT2JwVUJ3UFZGT3BzOXdYajdnYXBBK2JiZ2tX?=
 =?utf-8?B?VGYwRjNaZDVTVWhiUG5yUnE4c0ZXbHQybHRnc29IajY4Z0p2OUVqdDRkRU9T?=
 =?utf-8?B?UCtRNUFsaG4zeEdGTlFaQnRBQzc5N05YcmNtU3cySHpRUGFYSHBGVnhWamg5?=
 =?utf-8?B?OTJnKzRGREhFMXdoTjQyUzUyc3R2d3BEd1JsUUVQZmo4djJqaU13WlNYbTda?=
 =?utf-8?B?bWNaY1VCUUNLTTl5aWJiOW9Yc2N3S3hYSVd6SHk1ZUIwVDE5QUlvRkFsQ2E2?=
 =?utf-8?B?NjcxQXpBeC80YVFJUkV4SS9xVDdIWVJhSWt3N0Y0cUxKbGRRSy9oSXQ0alNW?=
 =?utf-8?B?cEFieG1UNzJKM1hKVmpXSnI1RUU2SnVINUVkUmw4eTJGL3ZKazdPNWlaSDR0?=
 =?utf-8?B?R0hGanA0NTFDUURXc2U0aWxlelJPU1ZJSG1yODVDVVJkemR1WXkxSkUyT1FD?=
 =?utf-8?B?azc3bFlManNlMXlPUDR3Mk1CRHMxSmx6ZXkyamdhT0ZMN3g4WmN4VWVVM1ox?=
 =?utf-8?B?b29IY2VqRHhGTVNzVWlPSDFoY1czVHNZSVlqZy9aN1VPclBwLytWMEM2aGtM?=
 =?utf-8?B?TXByVXBnZThFalZWQWVCM1lzMm8yUThSOVh6Qm9IUUVNNzNSL3p4dXA4OEt6?=
 =?utf-8?B?Y0g2dDg3OS9WVXFBd2RldDNhWFE2OTF3cWtINFZGT2k0OFkrdXljTitZWVEx?=
 =?utf-8?B?SUw4OXlFWnpmaHRvd2Q3N0UreDdLc3A4OG8rWWRvMjY0bVRzaUNwSmNVc0x1?=
 =?utf-8?B?emE0WUIxRlpuOUVzYzZoTjczdkdaRXRQRXA4RWZ6VnlVRXBpUjI4aVpUS0pz?=
 =?utf-8?Q?4sYSPeaHkTfjcCqSXA?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a3e506-f842-48b8-3dc5-08df246fa34a
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:36:41.0365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3G/0zEq2rYs359v40DJkxP+B2w2ntnW4mlInLf/feuOiEYQz+ni5NsjVLnelHG3Qdpznj0xzxOWpXm7kVBYItg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8782

On Wed Oct 7, 2026 at 12:20 PM CEST, Benno Lossin wrote:
> On 06 Oct 2026 17:29:30 +0200, Gary Guo <gary@garyguo.net> wrote:
>> Pin-init self reference is going to be a big feature, touching various
>> places in pin_data and init macros. Do some various cleanups to tidy up =
the
>> macro codebase, so the feature can land without much refactoring.
>>=20
>> Details in commits.
>>=20
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>> Gary Guo (8):
>>       rust: pin-init: internal: init: forget guards in reverse order
>>       rust: pin-init: internal: init: set span location of guards
>>       rust: pin-init: internal: add utility to handle generics merging
>>       rust: pin-init: internal: add utility for extract a single attribu=
te
>>       rust: pin-init: internal: pin_data: move projection struct into `c=
onst _: ()` block
>>       rust: pin-init: internal: pin_data: extract `#[cfg]` processing to=
 its own function
>>       rust: pin-init: internal: pin_data: rename `'__pin` lifetime to `'=
__this`
>>       rust: pin-init: internal: pin_data: parse into `StructInfo` before=
 generating
>>=20
>>  rust/pin-init/internal/src/init.rs     |  19 +--
>>  rust/pin-init/internal/src/lib.rs      |   3 +-
>>  rust/pin-init/internal/src/pin_data.rs | 217 +++++++++++++++++++++-----=
-------
>>  rust/pin-init/internal/src/util.rs     | 189 ++++++++++++++++++++++++++=
+-
>>  4 files changed, 341 insertions(+), 87 deletions(-)
>
> these are good improvements. looking forward to seeing the self-ref here!
>
> Acked-by: Benno Lossin <lossin@kernel.org>

Thanks, applied to pin-init-next now.

FWIW, Sashiko's suggestion doesn't apply -- unit struct was never supported=
, and
cfg for generics are not supported either (and not handled by syn's
impl/ty_generics impl).

Best,
Gary

