Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7221E38655D;
	Fri, 12 Jun 2026 04:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781239265; cv=fail; b=pt2UdScBd5WG359XAnr2YV0zuBcWaa+NkqGTynbQVhgR0TIaEDpron+Z16FSQNRgL8/3xOSXtOplB90JFLVegCvIT7kz/Omvupn+ZftJaKbI3ChHf+iCe0EpxiKK3Hlxrtb/f7+RXvxnSwSvq3UuRD4pbm6fRCehefxh4wMzKOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781239265; c=relaxed/simple;
	bh=omFinZiyHFWCz27gXr0PN3/HWzhYCYNo28DekEwscWA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VoxaAiQLVOUdGqERH3Zr96k+Xi/4Fna02DMB0QZZfndXw7Ju5p7bQmXsKQiiFymaKIf9rBcBTRd0GvrELdD37TnMV3+mBNPqMAmnl8OT1TTZaFXatiM1kujatUqXspxmCA8PhuqbBM0ZpBF5leAxj8WEU1+VK0PMP0yL+a3YM2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d/Cn8dbj; arc=fail smtp.client-ip=52.101.85.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d/Cn8dbj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpOV/btZ39p2LXNrS9Cal3TJ5PHgns037C88UDQBaawo2g33qFVD/KfPsnslwlKDWVO/UXSFKu0QHje++PMIvqRrokbB/H3Fo0RqZtjOCha6sjAtNZplrccxn4dJKXd3PcTvNKPD29FLX/tDDmN3QCMOgx054DU02uZ355L4HNcIqP1Z9GGPd6uNLWfUBF7+3BguHOLr9Lkh4T5JEEetLp4zObBkAnajbS1dCGH5VRtG2rj4blbwy3Lgw6VSi7YXk40Y5vmTlibHUoiI9An+aF/tHOJzVc2OrLeGLPe1C7WM+7qsQkTysyso/0HX924Vzg/1jqrv9TOa+x/XAEW3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omFinZiyHFWCz27gXr0PN3/HWzhYCYNo28DekEwscWA=;
 b=VQQ3SYMTyKWUkov9r4iI4FATlHeCoxuLgRjkS1O3iqpMz+zWFzBORm1XqmEPQtHjg1ptDMKJBHUx3jYgcg8h/1jjSUdntgl96Ou7wF18yC0iJJG/T2QAg56NALr0EBqkTTX85Wm5qAOwzqHsnKT7dQbK9LmJ58swt8rN1jY3yqeiAUO9k2RQmSnK5jIXuxOTenH+XNng4JsQBqV/3ueyz48UWRiCzBrgVeM283tF7asa1L1vrocTzJDEoCcpWmnzCV97msslMMBZUMjPnTYyxBRD+mXKQ29fIwvkxCLWT0bB69Sjwvomro6sNqw+oG4lS8PgBivqsRCj6SIgcOaEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omFinZiyHFWCz27gXr0PN3/HWzhYCYNo28DekEwscWA=;
 b=d/Cn8dbjhc+9c0Vb1hei6XApggztAVrNXZB8A+DcYVV/VFolGh7cezUFDPUbq/GP6o8GCMYCFVNuU8/M7UJao03w9PTG6rIvXFh+j3lvhvzOJmhVjTmvc41j9zBrfhSmVxlcdbNtf36t2ybR1amwFl+9/3jamX5bfzK6YQtpxsTs7Vvz+NhE5sxkFexMQC9I5higThDNKK7JicprXywmtrk7rDVuDerYF1btaIzLT6IwLSdtGtGZJBSGm9kTBi9Gd3cDuJykGp4Flx3LKbKXrgIXMpE8Tmqy3ky78p8ClisJHtxRk4Srp+seJe8A0TJQYNOGcw/3OZJ0zJcCGBb86Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB9008.namprd12.prod.outlook.com (2603:10b6:a03:543::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 04:40:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 04:40:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 13:40:55 +0900
Message-Id: <DJ6SM9BJ7GHN.JX9HXO3ZMBPM@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Yury Norov" <yury.norov@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: bitfield: mark `Debug` impl as `#[inline]`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@kernel.org>
References: <20260611190555.2298991-1-gary@kernel.org>
In-Reply-To: <20260611190555.2298991-1-gary@kernel.org>
X-ClientProxiedBy: TYCP286CA0153.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB9008:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f78f89-f9fa-45b3-264e-08dec83ccc85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|10070799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vtWapm+65AEz5WXBNJ4/RLBQcFYf/FlfmL1EeeXFXhZljtB76xZrWxa93vP6AIFlEjhGrpLeQL8DIKRMMeL0Cdrhfqgh5PVVisoZxtmjFEfk8NKL5+uJDhLbqpfDmtwiDzFqSUqBJrecNoPqmBHURN+zqcsmdlRyuJaMwk91XQ5CESeLltMc7+XpUOnjeOZz3IxrtaIGr2adk5+pLRMI0K+ofWE5o6HSHrRTz+SIbsltHpf66pzuxTWgVtzH5dVF1h+LJK5tY7Bs+XlI3BGdTSL4UPV0Ue6FHMBAbJsuLSxo8GcUQueNkboLU+Y2HHRnSiT59tfBLASTEJZgbqjulKbarwppjl90SXFeKOvTFWxfoPRgCdtm/0tUUO2nCAF9cqF07lW0TwH7zLVHHsmsbdGDMnueWRNR1Bm8DgA/bbrbsCeZvoTQ6Yr8ty3fSfQsIJaY1syd79RJs39mKm/XW0b9hVb1EqmHGRz+i6hDOXxpP9q8iSZIEg+wjCIXlmMosrx03YcMU/L6kaFAfp1UpI7Y4YhZkpSO5c55IDlSX9KLOyiSxLEXT8AmohFPDrEYsq0YLFQ09VmhR2+pit4I7xQlkfsflM5kkOu9vQ60Ws6Y8Hev6798yOlBndg7aORZ18ak78o5iVkJai8VsO1McSdWYGQrd7YdyH0JPyQlfeGwtedP1NN0PePr7uKfoQx8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(10070799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUlWYjdjQ1BiKzIzcHl6M3NlbHFiV3hvczNpKzhJQ21Xa2dMTVIzYU1ISkpD?=
 =?utf-8?B?elV4bmoyeTRWRzhJQkxtTnNuY00zbkNSV0RLLzEvaDlUYmt5Z2FMTTdJbGs5?=
 =?utf-8?B?Y1hOK2Z6dTVraGxaQWtVVkFvVWM3TEIxU2Z4VnZ2ZGxIcXp1NXJCZVpFYWxl?=
 =?utf-8?B?UFZRNUhvRTA4UHIrZmpjSVpyNlFlUnZSN1JxL3dyT3dtVVFTckNQYjZDSG41?=
 =?utf-8?B?YmNzNWQxSEdhb3l3MDdGaThtOW02bVQ0eEpWNFVOSWV2U1lnM2RiZlpMaFUz?=
 =?utf-8?B?aXRUdlRPUGlydjZacGVmQ1oweHBVdzY4L0E2Y28wb1FEQUczcDZqeHNENE83?=
 =?utf-8?B?OHhJSUdXM2V6ZWJMeG9rSkU5NTJkL1hPWUdQM3BuRGw2RHpmamQwbC9IWTZW?=
 =?utf-8?B?aGx5cVpTaENabWdKaVpIUjQvM1R4TXVDZ2tnTW5TQVNrR25CQk1RRXNlOHFu?=
 =?utf-8?B?VGxmSTJ3c3ltVFRZVEwwNEsrYmtwQ1FXb0pma3IrR3dwY0xWWVB5TnloemJ6?=
 =?utf-8?B?RHFQa1VGc0h0b2hTRFNlMEl2WlNBeXRTQWdaWU1RdDRhelJEc28xSk92TzlN?=
 =?utf-8?B?REE5dy9OY2hpbTBuaHFhM3JpNHk3Y1JSaU9wVlZHR0pBUHhNbGxIeDRRTkxj?=
 =?utf-8?B?a2Qzekg5YkU3dGhOcFdSZ293TDN2RWg1bVdwQU9lb0hpdjJhdk8xT09BUDhm?=
 =?utf-8?B?NGRzdmNQVlE5TXhpK2szWXZxL1FNemRiY3VsWkhJdE9qelVBZTVIdk41TEdN?=
 =?utf-8?B?RDhoV2lhbDJ4cllObmxEV2taSklKL3ZHaVIyMkltR1A4WjJYbHQrK3FUZWNU?=
 =?utf-8?B?MXlweW1UVFB5TTI1OGpLU2k0SkZuN3ZJSitoK0RadjlrTmhsa3BhenZXcWJa?=
 =?utf-8?B?QzY1NjNCd0tTRFNuL1hsUk5GRDg3dS90SGdxR1R2MDZUakZTblFaK1BON0hr?=
 =?utf-8?B?TmdUdFU3b3ZhRkQzbGhweldtVi9QOXZPbjM0ZlhsNjZqcGljL1ZVV0c0RXBF?=
 =?utf-8?B?eDZacU9HYjVRaUpoanNaYWdtd0pPQTBxTUYvdDA5TDB2N1kyemY2eWR3ZmRN?=
 =?utf-8?B?S2ZkZFo5YzRoNlJSRnNFdTgzdTVtQXdscXFvcDN5VWJLWE93cTBQb1hKUjFM?=
 =?utf-8?B?YmJGbnlsbi9aTWZCc3FUYjM5VDVoeFhCR0lGNGhlZFZvTHhLZzF5T1BnRFFo?=
 =?utf-8?B?WFBBTWQvanJMd2tsTmUvR1AyL3J4Z1BkYXAzQzBReHQ5NGtmekZFUmUzdlI1?=
 =?utf-8?B?emp5Nm0wek05RUN0alNPb0hnWWVSNjJOQ0VUbGFrQmVLanlSenJRSzJLMEsx?=
 =?utf-8?B?Y2VuTmR6Q0M1ZW1JS0ZmNHlEQXR2NFZqNkNveG04OUFnanJ2VzR4NmJTSWNV?=
 =?utf-8?B?aUJsWCtLbTZrVlBncEpQdTNhWkNnRFVTcTk5djFXYkhTNEVTMG94RjVLZ3Jn?=
 =?utf-8?B?Y282d2w2cnF0T215MWRjOUJKdWlma3V5aFNIR1piVnFhRkpMNlY3TS96RFY5?=
 =?utf-8?B?TXNwd1VVRDhHMWk5di9udnB3amlrVGljS1NIUjlWYmoxcU9lYmN5VFFBb2M1?=
 =?utf-8?B?RTA3N1pIRjB0WkREeVhYWGhoRERmay83amR3bGZNQXdhSWRHaytFWWZqOXRp?=
 =?utf-8?B?MWFVVzRFRVdUV2NDNGoxY0tSYTYxdHNhTkVpMW55Uysrc0lOald5VFNLdUhX?=
 =?utf-8?B?OFNLcTRXZ20yQlMybmVKK0VrWHBvb3pPNTRSK3psTWZIakJFUkZUaCtTOEUx?=
 =?utf-8?B?cmxlemJGcUV5aFNvYnV0M1grdnZicm54eEp5US9xc2pmQ1NaRy9CV1ZrS3Qr?=
 =?utf-8?B?akpKZkNKcjAzbGJkRGFWMmxveTFINkdRaDY1aVprWlNBWVUwZ3pVeDRiUElr?=
 =?utf-8?B?dWFRMDFWOUFqOXljT2d5RStQZjQ1cmx2UGRlbEtMNWVkaGtjVmVob0cxeTlx?=
 =?utf-8?B?UldpR3FyS3VrV3p1RGF4YS9KTkljL3lDendKdzlYWmtHU1FkN1JMMFlpVUNE?=
 =?utf-8?B?dVg4WEFvWlQ0cHRRRTVWREVEV3BvbWVyeFR1Q2ZlN1N3MS9ZMzBHWnE4cWx5?=
 =?utf-8?B?OFdtSHJSak1UdG5RSE55SHp5KzU5L0tRaThWZWtwd2ZYdjhPOHdXanMrZU5p?=
 =?utf-8?B?NWZyNWE3aERXT2U5OC9oY3lWNkNGcWpGdHJFMUJTWDlRYkdBQndvVzFEZzB2?=
 =?utf-8?B?K0krbXJ4SHBnTzRQMXRuZE1OejlabzRpZHh6VHhLcTBnOUlEK0kvdXRJU1Qv?=
 =?utf-8?B?OHhkcDQ2OUt6QnFWMWFYc0tYMjF6Ylc0cGFyS0JVVjBaTkM1aVRScTBNa0p1?=
 =?utf-8?B?VVlUTWdMcXhhUUZTT2FIZDVtcTJHYTExZXN3Y0Q2cmFvWUtpWjY2M2lVRG5z?=
 =?utf-8?Q?u12uM5dEzz1tWTjiJ0nQP3LRYbcT9L/WRgdzbvvpQGqDu?=
X-MS-Exchange-AntiSpam-MessageData-1: yKpxyGWVqdYPgg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f78f89-f9fa-45b3-264e-08dec83ccc85
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 04:40:59.1945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/t7SPxWQI9YDJQnvJ4fzc7nxA9xXCVCvb00J+VHtD/RH2Shvmrfu++Zzt2fP3jqcx4b6khXLSWWROjdTsd/TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9008

On Fri Jun 12, 2026 at 4:05 AM JST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> A `Debug` impl is for debugging and is normally not used, and therefore
> should ideally not be code-generated unless used. However, Rust has no wa=
y
> of knowing if a dependent crate is going to use the trait impl or not, so
> unless it is marked as `#[inline]`, it will be code-generated in the
> defining crate (as it is not generic).
>
> Mark the impl generated by bitfield macro `#[inline]`, so they do not sta=
y
> in the binary unless used.
>
> This reduces nova-core.o .text by 17% (from 151922 bytes to 125676 bytes)=
.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Ouch, well-spotted. Thanks for this.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
