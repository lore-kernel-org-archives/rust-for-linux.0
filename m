Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020095.outbound.protection.outlook.com [52.101.196.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326C236655C;
	Fri, 16 Jan 2026 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563667; cv=fail; b=P0nK9EawE4TdUugMApefON5rMojA8o9WOLToA7mZx0Lb00eVMColm1Od0RtD5BSB2W++sesiap127WQasY3881am2PtS9vt71zxe5b9XNdyOfw2wQ7p4Bt9NffauifSiAHOsIVA80wuMFX7TWYqbqeItfC76p1g7uTXKWZJf08g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563667; c=relaxed/simple;
	bh=dY0F4TUeNyv33tG7jd8FWBPvuROxCZEh0/EZ9gnVrBw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AV1pQPcFRtWJDUbalnwWiqAo5Gst9JVhAUShCLn25mp880GSCGWUYmI9mClvB+igz1H2Y0gxi1U8QPQlDAz3frZmMB4inp6kFAznC8r+oGB7Vz2mioPIyj5M4aR4ubhGCNDTWRbiqqowGSKrLIn7KR90Qw0zb9gaXjoSWcRjv58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ypfuMj/U; arc=fail smtp.client-ip=52.101.196.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ypfuMj/U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVesokaf4i0YBWY/JoGWlaioj9Ryqc5jSLrwjdzzLP85rP4Rslug7bZHH3CZKWArFuvdlSQnl/EV6K7KA7+Ar+l5vQAX+4wwyMKxTvOkhjdmuyBefZGlZ+dssWmsWBuKoV+spu242jpZASExzPZ0ghotUDE9aIhqoaYCebJ/nPt2PPVLCiHNTIl9ZQjRNuWcssg1fO7apxDovqwYn+C2H/d1hIGtgkPHTFmRVL3+8aS6nqfrzBdeDa3hngVXaw5ZqkAEVC5QKSwSd4FsrXUe/ChnQ5eBpVkO9s59EC+LkIKEcs0jQK1CHzid40srygmRAA7VN1ovOXXYpJ7+pvM8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bT2WwNflEpTas20OYpFC6XOnekMqt8U4q5MrSd7njU=;
 b=wyVFSX4y6kOcw0DbKdGGRmk7v/K4AOG8sjt5e3YMkS5JAfKkT3UaOgaGgCO28InWImARq0J6GkSrD2ofTDp0DRPLnQUKvkvoykBbpkwpRRhE1wZpJJrZGR8NTFeJlbK8E2N8E8EIGoAKTdjhvLewiIlxpvEbXjCn+vcfXzwYyZi7BrzPIS4csCSlbu/BgIPO6zJfwk/FAr1fZ31NbEO7dI+PxCt6nctiaA2SZgVfDJzCgAxGCGOH6ehbn2NC2jwIo2zxp2tasGOK1+wEcWH66VIoL5XgiRTmJvFfVg6l4Ih2f8ofw9dx6yBFYD6ze4V/AKfac+SsWieGIJVnTULpwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bT2WwNflEpTas20OYpFC6XOnekMqt8U4q5MrSd7njU=;
 b=ypfuMj/UdHr11XESu714LOmE8hooeg9FQDhx3LEdOnGiVV7SSthOMO3ji4GmiPHya6XRPtPt0hUS1tsPGyw391QSINK/ARN2FvlP+RlFvBilaJuJOte1mmP7Qq1TP03pNKgPr8XZMVJzII4OdDJ5XjbSDZmCSzbWePTKOYz4wa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB1970.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:64::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 11:40:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 11:40:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 11:40:58 +0000
Message-Id: <DFPZHSI6P9B5.2DOP6FF093V85@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 07/15] rust: pin-init: rewrite `#[pin_data]` using
 `syn`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@Kloenk.dev>, "Tamir Duberstein" <tamird@gmail.com>,
 "Alban Kurti" <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260116105514.3794384-1-lossin@kernel.org>
 <20260116105514.3794384-8-lossin@kernel.org>
In-Reply-To: <20260116105514.3794384-8-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0252.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB1970:EE_
X-MS-Office365-Filtering-Correlation-Id: 505fc157-2829-480f-cbb9-08de54f41e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|366016|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVgxU0xVVTBheE1vSW9MRGtPLzUwaTRCenpFVlNwRGlEZnJGcFJQVWZleWJV?=
 =?utf-8?B?Mi96cWxUNjJ5WEpmNmk5MmhmN3dTcTdTRkw3ZTN2ZlpKeHQrNjVMZTI5TlpJ?=
 =?utf-8?B?SzBKL3RUcmdXM0xxRTJZZzdmbENFbWJUeExXRTdRWnB4WWhFU2xpbVdKMHY0?=
 =?utf-8?B?a1NwRmNBL09zaTM5cWUyOFZaTlVMVThyT3RnWGdkd2xNR3Q2ejEveS9zSlFh?=
 =?utf-8?B?bHpUNnJOa2ZsUjJiWitFTlR5UjVyb2dQcHQwRkJaUTNDejlRRkpHMWVmNHk3?=
 =?utf-8?B?Yy9kankxZEJ0TCtXMXkvU2tiTzhJSVFkOXhITmx5ZEE0RTA0djNZeXVTWG1K?=
 =?utf-8?B?M1YybzFxYzFXb1E3eVJFUnFDYVZzUHNqZVBWWFk1bjZ2WjhrRWxoSXV4WExO?=
 =?utf-8?B?djI5RnNEM1YzVTZKcXZNUWQ2Y2R6ZDhJcnZTV0N6eHk1NkJVYjFueklQTW9C?=
 =?utf-8?B?TTdxV2Nsblo4L21hU2RxZ2tMWmFqa2wyS0hZZlpad2tMYy85ZElubG13RVAz?=
 =?utf-8?B?RXhvR0hjK2xaNVBJVlVsaWdrcnphWkJKRlBSTUh5akxlU3NQK3pleWZiYkZn?=
 =?utf-8?B?T1VPTU1DK29jMkFIaTN4QmgzVGhMZmxSemcrc3RNVlBQa0lKUG9VOG9qdkIx?=
 =?utf-8?B?SWdNR05NWlpMSllnTGo3Wm11L1BEVTRRM0E2emxPYzh4STJnazlab20vci9s?=
 =?utf-8?B?eDN4d1JGWlBNM3NnQnp0YWU2WlI4WWkrSSs4SVBpaG8vMGZOSkh6b0NDRmJ6?=
 =?utf-8?B?am5jdThJcXAya3NkK09QajFEMERleVhlK1c1T2g5d3BJazkvYkxLd01UUEN3?=
 =?utf-8?B?OWxIZzRKZnRhVHdUQU13azZVVVdOM3Nqckh0LzRLZDVnNm81b2ppNXFKMnZk?=
 =?utf-8?B?N1ZMUlNEQ1oyWmhZZmZFU2hQL3YwS0p2MmhkZE41b1ZUUnRIUzhOM1RzVXVV?=
 =?utf-8?B?Y2Yxazluc1JQN0tRblFFdDE3dVF6ck4xdHdpbmZ0RS81cDI5eC9SZ09XNW1z?=
 =?utf-8?B?Yk1tMFk1a2c2S0lJVmlCUUg3Zmxib1E4T01FQXl4TEpJRWpJVmtFNEVSOTVo?=
 =?utf-8?B?VnhnWDg2Nkg0S08yUUNBTkZ1Z1UwdGlEZFJEUS81bWhJdE5RblFPOS9mdk41?=
 =?utf-8?B?bml2VkY5UklwYXdYUnV3N2taS2JLWHJzNmFiVTF5ZXBCZSs2WGhmeWQwTDhO?=
 =?utf-8?B?NHVZaDhGRWVDakMzU29CaWhiakg1TlFTUHdlQjZ4VHBxRVJKcXE5a0dvNVVL?=
 =?utf-8?B?R3RSZjZ2b0J5ajJJaXJ2VXdrbTVFamVIMTNyU25DejJwVUNja0ZIZis2V0FU?=
 =?utf-8?B?eVl6VE1rbEg5SVJ3bmhKeXh5RFF5cUhuZWhpS2Qzam5wcmdEYTlRYTVoNFNR?=
 =?utf-8?B?S2pyTDhJUVN3M092RzZzVkNHQ0hWSHlqVVd1YXAwbjZ3RjJHKytZcGxTWDdy?=
 =?utf-8?B?bVRYM1A0M2Yzd1BkcHpXOXdCQUlmK2VHKytzUnNieGtkR1g2WU5sRzZoYWRO?=
 =?utf-8?B?LzYzencrUGgrci81TzJXU1h3MituYnhCQ24yUzFXL2JBdW0zNzliWUliSUNz?=
 =?utf-8?B?WFU5ditNYWFvUXZSdlBSUVlzZmlxOENlcjlyUjlEelJkUC9scXJpempqQVRH?=
 =?utf-8?B?dndlN250RWQ3SkRnYW94U0Q4NitvTWlvcExXZUxGdWZMN2hYTnRCMmplNTFz?=
 =?utf-8?B?Rjl2ei8wTE1mWXNoMWFrTmVLaHFpanZqSDdneGxEczRtK2svdmdiNWN2Y0lQ?=
 =?utf-8?B?MkQ1MGNEVUFNa3pGTmFhS0pUSlpmV2hycDhGZzFDYThZSE9qREVpZnJSdi9j?=
 =?utf-8?B?a2owUFUvZlBtQzloazJIYWdHRmwzWTdPRnJVMzhqajBRcjY3QVVLT2tLa1ZK?=
 =?utf-8?B?dWJpYXBTekZjd01JSWV2QzQ4K3BTNUkwK0tsV2pQSjNJcFhpY0I1bW1nK0JU?=
 =?utf-8?B?alVQUkJVMVIvaGV0VklMbTluWTYvMGs0WmlMbDR3YkdrTkVNTmJDWmcvM000?=
 =?utf-8?B?V0cwVW5PbjE0blE0SG9TT292ZVNjQkpHZEROdjVUR3ZwaG1Va2ZEeXN4RWt3?=
 =?utf-8?B?dG5TNzdOT1IyeWk3OUI4amZGWHZuQ042VFFibkI3YXMzekZwOFVFZFpyL0dF?=
 =?utf-8?B?OTA3NlhSb0FJVEwxOWx6YTFVTE9JNXM5Rm9NNzBHYytlYWVPbDFWcVBQSmg2?=
 =?utf-8?B?OEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(366016)(376014)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blRpdW14VlRXQUFEV0Q4dFl6YlVLT1ZzUTN1WGptYlUyUlA1c242QncxUzkr?=
 =?utf-8?B?T0JJYzBkaG9FV21IQlhPa0QrdlF6NnJqSnVHZWZZckNKMWZ1WnZpQ3kzbTFQ?=
 =?utf-8?B?MExiMHUwRmUxR0RicjJybGJwZmZNalNWSlFYUmZ2NGNXSnRsMTRQamM3RmNW?=
 =?utf-8?B?RWI4NkM1ZkpnZG5sRUR0TlJPdEs2dVVqRmNpN3ZoNW4vaWcvNU1DZkFWcGdK?=
 =?utf-8?B?OFdVbW5XU3k3R3FPK3hTS09WSWdVRnVmV3dvbHVMb1B1WlFvQlVocStmTk1O?=
 =?utf-8?B?NlFwaDRRSEVRMVVzNDRycGJ1Vnd2cWxXbXVTT3YrdTl4SXZXR1J1UGt6OVVr?=
 =?utf-8?B?ck9KdGpLS09VeGZuazlLcjh3V29yNGQ3VWhVcE96Zk5JWUhoUzdmZGVmNjlY?=
 =?utf-8?B?Q3FMTng4WkthaTNjMVgyUFlGRG4rMlE2VW5UcENOMmhiVDAxWHlhaHVuK0E4?=
 =?utf-8?B?SE1DckVjcnBWVDE2UzEwd3lHbmdnQ3A1emFZOHZreXdVN0RXeWpzbWllZEJ2?=
 =?utf-8?B?Y0ZoZTRsbzBWbk80ZHlUeDN1cHhxekMxR0pYbW9CM3EvcnFydVBWSVZSWkZD?=
 =?utf-8?B?dWtmb2RxVE02TGYzWVN6Q2FkeWxqblpYcTJnOU10TmVSOGxlWU8wSSs3NFVv?=
 =?utf-8?B?QkJ1ZFNXN0FyNXMzZW5rWHZ2OWd1NmE4TUg4SDBOUVpHQ3NPR0I5RGI1OEdE?=
 =?utf-8?B?M0kvcEdGVmZVdU5qR3Y3bHVoMVRHSTZWWnlqVHN3T3JaQWZGVmQwY0JPK2hB?=
 =?utf-8?B?T3FPTE8xY25SaWJsOCtkMk9GMnpzNGcyYzdicEV6NFA1Y2lraXZWSW1WVDlv?=
 =?utf-8?B?bkVrY2dtNXFDTDhKOEJ5T0htWndYRVl6TTg3bStKVnFwL2kyQkxHZ1ZRV3o3?=
 =?utf-8?B?TGxoaldrS01zK0Y4cHg4RDJrZWp2UW80UE93RFJQVTBZNGMxc1YwMUtPbXI0?=
 =?utf-8?B?ekkzN3REdWc2VHJDZ05Ea3Npc3Y1ZXJwZW05U1ovSldhQ3ZyZzUrRnpiVnZh?=
 =?utf-8?B?RVVUR25mS0hwMzJzUlY2Z1dYMjFjSkRqK1lBZ3NISlRvZVFSZ0N3aXQvQ0o4?=
 =?utf-8?B?TjFUTWRLNXpmWHJOdGQ3c2psVTVDa2R0SXJ4YmdiUUVkYktzY2dLUDNSc0N6?=
 =?utf-8?B?dENFeUpNb3J0WXZPTGVieVdvMkhiNXJHbUVhOW1yN1N1REJWZ0FkSkl1VE5Q?=
 =?utf-8?B?blo2bWtRbWI5cFRMZENtNmpqeWhNTnNmeGUyeXAxanRMek5XVE52bzJiR0Q1?=
 =?utf-8?B?aERQK1pHTHd3MDlCRGYrUGNTZW5PS1ZkenpRWFc2QUgxeExzMk8vYzh4MnJL?=
 =?utf-8?B?RHM5aFZBSm82VWRCWlB2WmZmaGVPaDF4dXVPRzZuS01Nd01pQzZJb3pUNlJu?=
 =?utf-8?B?eG5vNGVOcTNlZ3FpTGQ5ajR4cWYrZmdvSGk5NUpLeFcxcTR2ZktrWlFidDVx?=
 =?utf-8?B?QVBUcGl2U2FWMlpiQjNVRldIKzdVRTBTaUpadnhYeitHdHhnZlAxaGlHbXRx?=
 =?utf-8?B?UHlMYTJ6OG5Gblh2Z2tPOW9GUXBXdUxwcENPTzYzTWFXQzE1eWp6Wmh2ZGVG?=
 =?utf-8?B?eEhKTGRXdURmV0p0amEwZEpqb2ttMWdQNTd3VFFRSjFtbDA0QlNFcElxVmtz?=
 =?utf-8?B?OHhCZ3NLeFMyMnVHRCs3OTUvTzNhazhHMUFTMVpWNzdjYml6L240eWJZNmhS?=
 =?utf-8?B?Q2xCRjhRcTJNK3l0bGlQMGZrSmxmWnVEK3IzZlpuS2RJelNBYytGbkFaSFdE?=
 =?utf-8?B?NGFndGNGdFozUEVSREQ2MlJpUHNyTlgzUlZaMmRWMFhscVVRSWQzdW9oOC9z?=
 =?utf-8?B?Q29sZFB3bVVWakx4cmhYMW1FeGdQb1JGL3R6N09vZ0ZSRXpIR2tVK3A0ajVW?=
 =?utf-8?B?SlV3UHhRZXZsV3dFaDFhdVV4ajVzSmxsWkFkSGo4bVFiT2drMGZsMFZ0a3VO?=
 =?utf-8?B?aG1tb0I2S0tvaE55ekVSWDh3NnpJVlRycDF6VlFEYmk1TTUvbGxHQjZjUFBk?=
 =?utf-8?B?UkM5QUttNjVlVFlyV2xyb3daV1EycTYxM2pMOU1Vc3FweEFxK0RJY0RUOVor?=
 =?utf-8?B?bFJXZnYwTDF6QlJtbmNwbFNRS0JLWGdNazRLdHN4NlNDYTNnamZpUzVmQVJZ?=
 =?utf-8?B?ZkpqZ2RWMkc4QkVjVEJwdFEvL0xuVjhwbkRzWElITTNWMm5HRG02OXZxdU9U?=
 =?utf-8?B?N1F6WXUrRDV4dVhNMWlacXpjem44bmRKUVlJRWpZKzdXd1NUU2k3dTNzVUJx?=
 =?utf-8?B?M1BwVURmSEllZm1KcGlrOHQ4ckwrc1MrdVhnNUlaQlUvZkNxWHg1ZEFFNUxI?=
 =?utf-8?B?ejkxSk1LdU1IbndDbnNvUmF4Y2ViRklvMkd2K1lRcW9BYnc0VDhaZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 505fc157-2829-480f-cbb9-08de54f41e51
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:40:59.1474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaqsFke5Jnx8yLZXBobFtI2zTS2vl1ciSRFzMPLm68CIE7T6cY73RFBIWL2lwp2OneUXvkH4oCqtADaEpJGbCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1970

On Fri Jan 16, 2026 at 10:54 AM GMT, Benno Lossin wrote:
> Rewrite the attribute macro `#[pin_data]` using `syn`. No functional
> changes intended aside from improved error messages on syntactic and
> semantical errors. For example if one forgets a comma at the end of a
> field:
>=20
>     #[pin_data]
>     struct Foo {
>         a: Box<Foo>
>         b: Box<Foo>
>     }
>=20
> The declarative macro reports the following errors:
>=20
>     error: expected `,`, or `}`, found `b`
>      --> tests/ui/compile-fail/pin_data/missing_comma.rs:5:16
>       |
>     5 |     a: Box<Foo>
>       |                ^ help: try adding a comma: `,`
>=20
>     error: recursion limit reached while expanding `$crate::__pin_data!`
>      --> tests/ui/compile-fail/pin_data/missing_comma.rs:3:1
>       |
>     3 | #[pin_data]
>       | ^^^^^^^^^^^
>       |
>       =3D help: consider increasing the recursion limit by adding a `#![r=
ecursion_limit =3D "256"]` attribute to your crate (`$CRATE`)
>       =3D note: this error originates in the macro `$crate::__pin_data` w=
hich comes from the expansion of the attribute macro `pin_data` (in Nightly=
 builds, run with -Z macro-backtrace for more info)
>=20
> The new `syn` version reports:
>=20
>     error: expected `,`, or `}`, found `b`
>      --> tests/ui/compile-fail/pin_data/missing_comma.rs:5:16
>       |
>     5 |     a: Box<Foo>
>       |                ^ help: try adding a comma: `,`
>=20
>     error: expected `,`
>      --> tests/ui/compile-fail/pin_data/missing_comma.rs:6:5
>       |
>     6 |     b: Box<Foo>
>       |     ^
>=20
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v4:
> * improve parsing
> * consolidate generics handling
> * improve handling of `#[pin]` attributes
> Changes in v3:
> * use DiagCtxt error handling
> Changes in v2:
> * improved error handling
> * fix clippy warnings
> * fix typos and variable names
> * collect the information about the pinned/not pinned fields only once
>   at the beginning
> ---
>  rust/pin-init/internal/src/helpers.rs  | 149 ------
>  rust/pin-init/internal/src/lib.rs      |   7 +-
>  rust/pin-init/internal/src/pin_data.rs | 611 ++++++++++++++++++++-----
>  rust/pin-init/src/macros.rs            | 574 -----------------------
>  4 files changed, 503 insertions(+), 838 deletions(-)
>  delete mode 100644 rust/pin-init/internal/src/helpers.rs

