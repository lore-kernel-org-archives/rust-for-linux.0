Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021143.outbound.protection.outlook.com [52.101.95.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A625650AC34;
	Tue, 29 Sep 2026 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699233; cv=fail; b=GsnIaUMvSHeLUmFuQI9+S+FSf5McxyYEariGwvvgm5UXd8pXtYudaqRNHlTzfAhwiOxEQL8oIdO3b4ESt7O1UQmmC9Vm7SNGDdQ10SM0UIMZPSbh+Oi2Y7MSyxdnANDZVWa4jO+Sg+OUHWd6blMFfp0QjobnT1OxpGD3vSZ0rbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699233; c=relaxed/simple;
	bh=7zQyNrlBJHaCQFrWbM5cr6kOzCUiZxCVhVbnVoJV5f8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=qauZFOQpJsULeQfeX+Yf6rYgvISddKfKdq3LDUiUYQuKB+q2xPojLrMZh2QCzs4u8gpH4XQpMEXVc+2aupQ1UWnG7pqGQ0o6hOfp1oOZaDxCdYWR/ASrfbZ6PkeT/Ba9oFkvxIUyrMjE4NEy/kcSoFiE2wCOJJ51ey1uwRYZCAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fq5+0OKk; arc=fail smtp.client-ip=52.101.95.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fq5+0OKk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIbkzWG5TDcHfGVo6alIk8xOq1y3bciQgTf/5sNKNo/isijUgUjb8JxbkDNRBTw/+I8k2+HOkEFE+96PWHJSlkUleHZE5p8X748ifQelNOjXDneU1jEu4dQtCMXTgHtiwTKf0/LDYN//ivhC1riOi8nW0Lc/fupTD2m7HoUBZaZYv+R/fVQRuKILYKY9mo3eM+x3ACd/zBtfHQbgrvjKjEhnrGmfnFfJJwshLgeb2ZIeNmLytIzcevGIYj2/Pjt00NFzHW7jvsQZJVaiojJLSimZ/NLNm2KvR/uxy+N5Vqi275ssGqNdzZR10liiBo9zrA9lBLqlwXH48QRUVUnwiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpD0OYvdaSrgykN5NeHdIoIYmy2YhekFoAZmT/Ldwt0=;
 b=Rhw9wPyqfWwvODyoMzrvFErF5iml/TfEvUDZ0ED38dXB1G8NMBpzHlw3Y4/vk5kGa6e2oPvt/gOtlqyCcdVZh/QypMKMQTDiWRZEqGVYIeKUgF8FTS4ZooxUXsPl6H+oEJdpE8mIhVboiZTmCZ6dRX/196u/PXjcOEkoVI5rIBt2s2iYHaa//TzXaSG0b868vxZ4335Rma6QF7+ggRvFtO9Z6swcrkTZvuS13tI3mWLfOcSh4f4qQtjx2GM8tg8CZGeadSttDdUPA0GKKGnZkMmwpJ+WOBeFz85l8/JUIcRQ47VI57sMlIQQhiiWga8uo6nxey5WfACz1FvrvLjufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpD0OYvdaSrgykN5NeHdIoIYmy2YhekFoAZmT/Ldwt0=;
 b=fq5+0OKk6iRQDFZJ98ZWKW2wLJ8oErP/Fioke3Wjs3ChHMdk0k+v6KnNr4+PVZCQ+N0j2k843WJZhPx63WZwomBNEA5KT87xY80j6nBTdUExPr01//QqpvXOKdSox5Xg9f5Hp/JaV0ZsQx62QGAW0wb00H5nmrMLlK98f+HTyos=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB2177.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:65::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 16:27:08 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 16:27:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 17:27:07 +0100
Message-Id: <DLRXWCDEG6SI.3CSRAS5AWC64Q@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, "Uladzislau
 Rezki" <urezki@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Tamir Duberstein" <tamird@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: alloc: add `NumaNode::id()` accessor
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260929-numa-node-id-v2-1-fdd2c0a49412@kernel.org>
In-Reply-To: <20260929-numa-node-id-v2-1-fdd2c0a49412@kernel.org>
X-ClientProxiedBy: LO4P123CA0271.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::6) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB2177:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b06b4b-18c9-4d22-36ee-08df1e468173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10070799003|22082099003|18002099003|10067099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	5f3zBJ1tWsefU5lRvY8gRdFqkhCpV+FC7DTZO55Uk+XaqbnqPxNI6DT9PGopok3EiztnxBlibg+HHmGH/iYEgWRadiFK/U/IFnKwHlL5WxNth0OoKsW15b5Cn/5olVWkqFffiRYZp4WLPpYR14LntZ10tZYQKGGB0swhw2xzSw0w0iyYOW/9HcJQn7Ps8/ggkDvqr3tz1UXEJ48kAVR2OOiE4wUv5/lVkDKFxzfu+Sc6eMLTzmOwU4cwGO7Pp/AxC3INPoEYXRT9jyjs2CaETYumAshTH539E0cyWAAhqv/z0X2Ot5NeRReARz5DZz4c8PDBIW+PVXfLU4/ofWIwh2fAQLHsGUvcAHPsC0gnqhdSCxGe71heyrPmBAh/nW6/eY4BeRJ9TX+ZCrN23HWTvoSCJa3sJLSLMeWl11cfqVRN/PvNJubxXI1ZCg+tRqgGaZiVZ6mDcPTrrR/QPe7aV3KX2/NEW7D8icT8E5apfCTXkaO09pesbUZMWMKQlGatCxCwrb3auKT+n9KtEyifdJn6FRxKfgpL0+fj4/y3e/DmGh4oMAR14yrjVFgIml5zgn2wFu65svBA1bopM2vUH+Ak5pEESRP7P8RlQsNFEXo1wjkBDPH9u4qH//phA9c9EwzJcZVixVcjmsqM8jhgtgVZR4DYmCgEPGZ6mQW5MfE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10070799003)(22082099003)(18002099003)(10067099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2thUklRQUxlSTBBUW5ZNmhyNzhjenIrTW04aTJySFl3OS9DRExvZjB3ZUpX?=
 =?utf-8?B?a21XSUY3dVVIOHR6TkpFQWpsVmx5WWYrTTdGMTBVYXdRWTNYdytlcmZNTTBJ?=
 =?utf-8?B?cFg5d2ppWmtSd013V0VVRXEzd2g2VFdwUWd2QjlnaXRCZnZsQ3E1OHV0dEkv?=
 =?utf-8?B?ZVFjN1NpRHlPNm15aFFrR05id0NZcHkxTWt4TzRicHJXYXo5MHcwUTNPbnBD?=
 =?utf-8?B?SzRSZnFjakFyU01yTTZOcmJCaVNxdncrMkhMdDhKVGQ2ZFEzRUpoSFFvTkU1?=
 =?utf-8?B?TE4rZEtxWUxmN0dSVzJFa0hkSEh6WHZiV3ljTFFxcE9HQnBTZ01GYTdxRSts?=
 =?utf-8?B?RGZ4SVQvVjlsQTRIS3lpTEpjTi9TQmFwTENjWjlOT2tGMjFPcFlVZ21VWUgw?=
 =?utf-8?B?VXFFOGlaSjJpVjdKZStHTklBQkEyZitQM3IrdW9ndnBhUzJmclBHUWUxTFdx?=
 =?utf-8?B?dEQ1djYvbEVRTUp0WEpJUzR4TjFydjkyNmVmVnNSWFNzeVV3V2N2N3REcTQ5?=
 =?utf-8?B?aTdMSE1QMzk4WjJ2MG9PdWVscjR2Q1MrMzhwRVpWRTVXL0RTM2pHRlpER0V5?=
 =?utf-8?B?aGZBaWc2eldYY1REK3lOSnNIcmdENnZGV0NHb3FEcHhDOUdxNGVteFg0cmZ0?=
 =?utf-8?B?Vll5bkcyTFpxNlMvNmRlcVpiWlBQZTlreERIYjZGS2gvTHgwY1hua2J6SVdR?=
 =?utf-8?B?VWQ5cHd1YW94dmROdWt1YS9aQ3VDL09wMTFiV0RzWEdEbE0xMS9PaWhkKy9X?=
 =?utf-8?B?aXB2aFZOL1EyQlhhSUxBK3U1ekhkSUJDcExhVG1TSTdGTjRDbG1tcUlMcUww?=
 =?utf-8?B?b0tkaFNSRGxybUsydE5zWm5wcjkvaWZXbWpkaytLckpRWkFUZE5XZFdKK2NS?=
 =?utf-8?B?YXlra3dsQmtNYmR6cFg4YTRheVNJUFh4QmZxK3NJa0hMc0JKYUdFS0VzM0hY?=
 =?utf-8?B?Z2JGU3JsTlh6djRjWlRDNVFqZjBDNXdLSDIwb0dzVmREZEVNS0tKRUxhZ1JD?=
 =?utf-8?B?YTkwcmo3TURaai9Ka01mbjNQZi9PWS9id0JPdXhnTXFCMGNRcDdVMCtKcEox?=
 =?utf-8?B?dk95Y2t4V3RQZGVkOU90cXcrT252b01KRnFUQlIyQjR0a1R2Qk1sTjVia2Yw?=
 =?utf-8?B?SXBjTDlTZkoySlAyUFoyUmt3dC9kTU9pc2djRmFVNk9ybE8vY01SemIwd25W?=
 =?utf-8?B?K1NEYlU3c0dkTWl1ZXFQR1gwcHlxaTVNaTZGajVXRjV6QSttMWNsWEVDTHZE?=
 =?utf-8?B?ZmVWaUVKbVBTK0I0RFBRQmp6bkVQVTlQV09hdHQrUUk3OUVvNk9jdUE3VUpm?=
 =?utf-8?B?T01aRVJjL1h0akZtWjlSVHlzMXI5enowTHpHT1lxczlPK3Yyb0JtN0ZmbXBw?=
 =?utf-8?B?TjN0YWJVZnVFdGFiYUFjSlhCZnowNHlaTVZ0RG9rVFV6eGkzUUh6aDJrL0JE?=
 =?utf-8?B?S0s5S1EwSklkQXJzbGZUcjFEUzhYcjY0NWJDaEp6em1kc2RqWFU4L0ZONTE0?=
 =?utf-8?B?cmwrd25Rb1JCRjFKTE5PdXRKRXMzck01UFVSRnZLYTBhVFIrQWFHYmpWamFX?=
 =?utf-8?B?VzBqM2VTN0NrcllYNFRMTjZOY01uYWJNbTFQaDQvUnpuUk16RVY3WGNONWN2?=
 =?utf-8?B?RGlCR1p5Vit6TXZzTExtenBqenpzVHhIZGwxVVJnU012amE5U2tYUUJZbnJI?=
 =?utf-8?B?N2kyVS8rMnhkWW1PR1VudmI4dlMvUlZjMFdQRjVuRjJVTXpCclh2LzNtSjdM?=
 =?utf-8?B?bGZjL3FhTFVYUVQ1NjJsWTAwanppaEZMQ2dwcjJZM1pPU3BzTHYwZFJ6SlJF?=
 =?utf-8?B?c3JDUlhsOUFoa25KN0ZncXRva1RkNTNxRldIdDUyUFFNR3QxUW5WUEtUMjRF?=
 =?utf-8?B?NUowQ0h2OFdTVW1mSkJ2RWJlZUhBKzBIMW9vNC8wSy9jeHI1Q2JlNkpSektP?=
 =?utf-8?B?eXhtTFVCelNKb1lHQmozRkU5TS95Rm1OMnVkSStEY0tpZWFmdi9TQnE2MEFu?=
 =?utf-8?B?OExGSVNmem81SERsbHpVY3MvZ21oaVcxSUY5NUhJOUk5QUxTUWlmdGI4QUFW?=
 =?utf-8?B?ZjVUTUFIYlA4VlBVbDJBcU5uZEozRkI2YlE1QVBpcU5TcUhsbWVpditkUWFt?=
 =?utf-8?B?Z2s0c29CRmRsZThCdmo4M2hiNGw1Rm5JRm5TS2d0ZHprdGJCSFFoQWZkLy9h?=
 =?utf-8?B?MUs5N3c5dXYyUk5iWlZrbyswc0psOE5GMUdTcDZITGpHanhFMXBFQ2NWamN2?=
 =?utf-8?B?akxZMXd1U1JFQ3ZCdG5MQ1U3Sy9jRDErMGlNQS9YampPZi9rWnhibFgwMWVO?=
 =?utf-8?B?TEI3dHlxUldDeVg5RGprMmMrbUozWks5dU5YOXN0WmF5cXNyTnJ4UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b06b4b-18c9-4d22-36ee-08df1e468173
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:27:07.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUFSJFzD/qWetYCTV3UQFI6z5GADVM3LmIy2bnkyhNxIu1yXjblzUltCwvU+WAGRETKWNMg9Zyfdo/DpnmnbfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2177

On Tue Sep 29, 2026 at 4:18 PM BST, Andreas Hindborg wrote:
> `NumaNode` wraps an `i32` but offers no way to read it back. Add a
> trivial `id()` getter so callers that need to pass the node id to a
> C binding can recover the underlying `c_int` without reaching into
> the private field.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v2:
> - Rebase on v7.3-rc5.
> - Add `#[inline]` attribute (Alice, Gary).
> - Link to v1: https://msgid.link/20260608-numa-node-id-v1-1-28480299c62d@=
kernel.org
> ---
> This will be used by an upcoming change that adds a home node parameter t=
o
> the block layer `TagSet::new()` constructor.
> ---
>  rust/kernel/alloc.rs | 6 ++++++
>  1 file changed, 6 insertions(+)

