Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021128.outbound.protection.outlook.com [52.101.100.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D872D5C7A;
	Wed, 14 Jan 2026 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768416711; cv=fail; b=lZtAbrHaqE6I1ZaqJ+UWgzxxOjXgdbLBl/3W+uFd+Ghk00nC7dHRhMQ46VlB1HzCAK9XAQ5YvDDgvlCAp1wXWPo5oouTi/X2UdDcxZpI9heBOP++8qe8tLvnueIbn/J7mwO8K5NCCWNcSMGWyrxLepSJ3TCe67QxZlOOI5O0m/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768416711; c=relaxed/simple;
	bh=RRjWM2fHij9ZQ+rA8KLZWL+JjzBdcO6yTcaDQP/ROTs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=al7PfjhjjtJbQK9Mq7WpiqRAghy5UwfUrqevzRErVNrud7XydVLghku0keCkjjySM+SCnzD3CVJZnO42e4nvDvagEAZX8gUJM/b6y7QFflPO1Mv53dVje9U/amWWEj9hKxwMvLbqcnwzprPlMitt5FwWvQjwjpFSeeWPZTdQZdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dYg/X3y2; arc=fail smtp.client-ip=52.101.100.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dYg/X3y2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuWu9s93psq6jG/0BYQzwklyFmFzHuAybnfvi3TwXpJ+z8pyhNuTTWp/wrDcncSN6KelMTh6HlMvzAkb1j83MDA4ZwuZQ7QpyBq8ruZdnOE3jczp6jd3kct3xHq4Kwxsaxs4oKDtfW+g3M5ZtdMr3WxFTs0wqPrvKcik3GauglRNr5x16+bWwtxgnAjsUTeTPhmHoecBOoTzfPkfVW9f/i8xbHmdOYU1ds3PzMhEgOmsqH+HDhJO+QxOI3g2u0gsvSpMHZTYfDBIHdPjvgkNlCQNlTJIP5WcfCmbCVnrVRwjTLoBYUluv3rXLyNGXS9t4WkMrQF/8eyz2r0bMRDuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgDgKuKJOeOkfW0fCOJHt5EcYA0ByDls4CDDbq0a2gc=;
 b=JKZyzFTzsIwJftPkGYAU0+Yu5CSwgPFXn7dRWFLjyM+E53qWhM5Y4MNKuASKxgkIYWbXMDsXi9IJcxhwfLMy6Km8DTdIOPy5hDw+dW6NdvV9MRhXNiEEpJjo0usd0081VNfKp7kmitA3vfAyIU+SiaBk2MxbAlbi2Oe2KKN1jtm12R9YIZvv6C+7uk0bSIoeSOiJthOynKey45ErDxWOk7H/I1b3y2EdQ0cBuCYvQB+5eyI6+YakdUWZP+ACrF7mclstG5Yo9suqrQqT7q37V8nZ4BMRBpsz2UEjDZGBWswp0kOG3dJOQAxjWCVASaURU0WcVaGXP0I18cOCr1ZJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgDgKuKJOeOkfW0fCOJHt5EcYA0ByDls4CDDbq0a2gc=;
 b=dYg/X3y2BmoJMcVGr2S+MJjXBvajQ1POQxSgnKQkV8F4aeUhpAyr5Y855zftjZvfphnPxKJuSfHCeiU0IqcB6dDzMbiSkJ4+ygAnxQeCUFYUMQ330hkEpZOC12t4HzRVxoRPIXGUPfvOhksu1LIiCAwpBtb3+tfNkhjrR00vH3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOCP265MB8612.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Wed, 14 Jan
 2026 18:51:47 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:51:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:51:46 +0000
Message-Id: <DFOJEJJNB870.273KZQUUZGYP7@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 09/15] rust: pin-init: rewrite the initializer macros
 using `syn`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Tamir Duberstein" <tamird@gmail.com>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Alban Kurti"
 <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-10-lossin@kernel.org>
In-Reply-To: <20260114181934.1782470-10-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOCP265MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac6cc1f-cc17-4477-8601-08de539df803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFJ1eHo4VVdldzFRL2MzQlpxWCt4RG10eXp6QzlTTTM1ODg4VnJHNmdyT2xk?=
 =?utf-8?B?Nkh1RjNtRjV0WUtIS3dyM3A1WWdlVTgrUWtzd3RVYnZ1dTYzVk0vSEwvWFhZ?=
 =?utf-8?B?WmdRcW9JaG5zSWYyTGxwVE1ETkN5UmM2U3VySmEvblFsV3RVWnYydFd6WHlo?=
 =?utf-8?B?K3g1a0tGUHpUTDl0bSt5am1NQVhuQUJjcEh0L3IzeXlQRHZKMXZYQTFuVFRZ?=
 =?utf-8?B?K1pBVnNENHBuRGdaMmZxWTRzZ0lDa0oreDZxMkx2OGc4YVhjMjJWdWFPa0Nz?=
 =?utf-8?B?T3NuRG9KYTU3cG9aWC9FOGxpMzF2Rlp5enRDM21yWXREYldGU3cxOTM3Y1ZF?=
 =?utf-8?B?Z2hZMStLS3FTdjg1S3NCZ1lhRE9vZExWeFJ5Z2t1VkQzcityWDdXeDlwSW9v?=
 =?utf-8?B?MDVVcWxjU2pSSHlRRktPNHRjdzFZUXFqTmQ5ZUNpSE1tYThUczJXM00wV3dl?=
 =?utf-8?B?N0ppekNPL3M3bWdRU3pZS0gyNTRxQjI5cVA4WHBwWDFybm4rMVp3S2I4SEY4?=
 =?utf-8?B?c3NWSi9admEyS1VELyt3eDRqLzJ5Yk50M3g1WTNMRlMxaTZHNDJFNlgwOVhO?=
 =?utf-8?B?cWJIZmpHRTI3VXFMRk9uYzU2disxUi8wVFJ1UE9zYVlVOE9ZRkY2NThCczJU?=
 =?utf-8?B?NGNiNFRkUjAzMzZUZUhGMkFVVFV1bEtnVU9LeG9iNHlmSjk5VnI5NVk5SnBu?=
 =?utf-8?B?eGdKMis5RnpZZjZSakl3eVEvRUhEODJ3VWsrd1hmM0crOUNYeVBjbmJ1OHhS?=
 =?utf-8?B?Z1lmOEJVYlpiOTgzVXJOdXhQUWE2bWYvYW1pSkpKZGJHM1RGVmxOUm9MRmhn?=
 =?utf-8?B?OGxpTGswSDhJWDJrYWtsNUxabWdVUGhlQXZBbHdqcTc5UUtodnZmcjNSQ0li?=
 =?utf-8?B?bTRubHEzMmZzZUNaM2cweTlWQUVPbFMxbjFDSGpoNmRqYjV4NTRUUWRqRjFw?=
 =?utf-8?B?N0FUOGcrMnZjQU1JbGhDY1ZnVnQvbjJaMFc1ekdRd3BRcGhzWGhyVmpNUHNI?=
 =?utf-8?B?UDR1cFpKRi91ZDd2eEVlNG5xVEhIOXFJZDhGemNaRFhKdGFjbXpXNXVMOTFJ?=
 =?utf-8?B?V0tIZ3pkd3lLNXdiTmxGYU91VUJ2RFZ6TjNkeHFEZG5EU1RaTnJYRjM5UHdu?=
 =?utf-8?B?dVE5NmdORmFQMTZvdXhqS2lyc2gwWGIybWYxSzZqZkc2ZTcyeEllUG5xUTg2?=
 =?utf-8?B?Q2hJNXlWNXpEWi9YRGpKdHovM3lCWVFCajltdktnWFVXRlZmVEFZQ1ZEcHhs?=
 =?utf-8?B?bG5OQkE0VVQvQUhkRDdRRHptTWNOWFlVQkVLUlp0SEJhc05ZWFZxOWNZTkQ4?=
 =?utf-8?B?SUR2dkNrUVpzY2xFSXRPZUVqZWxoWXVFZ1hsaDZxdVY0aEw5YVY2L2dsRFI0?=
 =?utf-8?B?VDlBdk1mMlh1cFBIMkYxTC9RUklETmhBckVhNXkwa2laT1I4WVBIbGFaUlE2?=
 =?utf-8?B?UWRwRXVvQTRsOVBiU0FaeDYvMEZUb0pocmxRYXBaU2VKdFFkY1lMdlgxb29V?=
 =?utf-8?B?OWdRdS82Y2pqZmFTYW1CZkVNbExHTDlxVjE3UW8rTDV1MDNDZng5anBRbmhu?=
 =?utf-8?B?OG9iam1HL2VrOExyYTB5TStuTkJZaEEvb3FtbTFnZjdOaXhqMDE4UGhaYTFp?=
 =?utf-8?B?V2pIVVAxb2dnMFhPemxjeUNZSi9nUXlWOXNlOGUxZWZmYXYxOVNMTDM5bGxh?=
 =?utf-8?B?VDB0MCtBTHR5Zkhsb1pMOGV6QWk2ZjhGdmhxYVRFeUtySlRFQ2pWRFoxRC91?=
 =?utf-8?B?YXg3MzlSYTFJSE1BVVRZUGxqNXJaUUtxTkJOMnFsak9NM01CdWd1MG1CQmY4?=
 =?utf-8?B?QlNFM29idjVTTG8yMUJwL2RCd3hZajQzSjhvc04vRFVIRWFXYlNpekFnbmVo?=
 =?utf-8?B?ODVJOGlYM1NCbEFld3BYT2RjSE11WEhDRzlzSjYyWWpPUUEyZGc1OGZPbW9H?=
 =?utf-8?B?K21VN21lRWsvSkdzLzl5dmE3UmtUV0VsNUZRMkJjRHkyVHNUQndhZCsxanpj?=
 =?utf-8?B?VlMvc3RvQm9hVGZOenRMckFRWmRzeno3Sks1cWhhczEzZ3VTSjhpcDlaVW1M?=
 =?utf-8?B?WlRMcE5mZ0s4R0cvbThkVkJTd1JRaXRHQzRvUUFwZzVBMnF1K0IwQmxrSC8y?=
 =?utf-8?B?T0lQWGNmTlpsaU5lNmhHc3M3TDAwcTJnbVFtTmVQbkh4dXhDYXBSclVWYmFB?=
 =?utf-8?B?NkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2J4R0JaUUFsVTQ5S1hvaU4weklzYitlU0l3dnF1d0YxS0RlVkh6TUt3MUFo?=
 =?utf-8?B?eUNrdVlCVmJMS2tYclRyb0xsVkU4clZwZVJBTk52eEFndUZWT2gyY0NUWjMy?=
 =?utf-8?B?bEFUZDMxaHBNbkhJQTBxdVdLclZRR2ZtZVBMWm9leTg3dWdHM1dsSW5GeEN5?=
 =?utf-8?B?MGxEeitVdDNsMDJQLzBBb25qVEJWOVFLM2pyS0M1bGprOGxQN3kyWjFwWms2?=
 =?utf-8?B?ZWFqSmpSTXg3WmZzenI1amtQRk9xQ1ZUMC90NDZ0aGtDRE1SN3pwckR0MG4y?=
 =?utf-8?B?cmpkREFHRTQreEIzWDZkUUVzUGxwV3BZU2JGbHlKVkJvcUZLV1BzcXdjUGFk?=
 =?utf-8?B?dmNnU2Y2Rm0ydFBsLy9wOVBRTXBwMHl6S25icFJKMUF6eGNUb0Vtc21GcTBD?=
 =?utf-8?B?czlxVFFaa3Y5WjBvTTNYd3FURjVxdVVQd1VUMW5pRzZNblFvV0JRRzhvbVVr?=
 =?utf-8?B?QmthZ2JsUENQWFJTQjlDQXQyZUVmQVgyVE5WK2pJQUt4M0VwZ1pkczIxUnpq?=
 =?utf-8?B?Ulc5Z3hKT3ljQ2poSytWRVFObE5paGtQY2JMOTBEOE5BSUJnVVZ4eUhJUGh2?=
 =?utf-8?B?clZSaXFsWVdBMG92MWx6MnpheGM3VXVlbEdDOEh6aXdxYnl6SHlRNmh2dEpN?=
 =?utf-8?B?M3lmc1dMSHA0K2x4R3FmbW5uUEU1c1RNTk1zSGF6ajNtN2lvVmw3OE85Nzdn?=
 =?utf-8?B?dkUwUkpkYkJMdit1YlEwZDY1Zk5ZcFdoSHJtL1U0dDhJOFUwSmpkeFo3Tld6?=
 =?utf-8?B?VFBLdjk1YUZrNk9kZUpaQzE1YUk4djhuWTFyT3hBSlNkTzZqU2ZvTkoxM1o1?=
 =?utf-8?B?UU9nZndjUFBwUWNOY1VNZGJubWwrbENQMUFZU2lndFFGdUoreDdFQmwrenV1?=
 =?utf-8?B?U2ZkaWR4alh1Wk1vd1hmOEd3ZVNBVlVRNWRiTmFwUHc3bEZoSHVlYnRTSjZO?=
 =?utf-8?B?REVaaExSVkdoSWc0SFJUM09HaUJkTEZCSWpLWnp4aGNPSzY1SGFIc3hZVUFp?=
 =?utf-8?B?ckd1OGxRTlZ5VnZRNGx1S2Z3dlc3T1JPU3pjYmFIbFJhODE3MXBNY2JYa21R?=
 =?utf-8?B?TjUvNW9mb1FOSTh2V2xrQU56S294MnI5ZVZiTHdadG9jS1hIYTM0ajFzdUlw?=
 =?utf-8?B?YmlVdXp3ZnFidnorZmpNcnYvYkFDdkt0VCswU1k1MlFCOC9vUWJZWFdVV01a?=
 =?utf-8?B?U3J6bVJ4YTJac044OFpnSjg1SUJUZlpyOG1kYmp1dU5yVG01dkxBOTJmMTYw?=
 =?utf-8?B?K3ZLblp6ODBvWnZzbTJwVjF1Tit0Nyt4ZmZDNjNjRHFzanlDOTUrS1ZuLzdt?=
 =?utf-8?B?ZW9YTW9Cd1cvR3p2dDZkOEx0Vk5lY2NMek53NGkrTnNwWlhLZDhlL0JnUXR1?=
 =?utf-8?B?MlJiNDg3RFVlYVFhMW8rNzZpUllOaXFEMUFpUDdoeE1jWTVDV3p6V3VHMmg0?=
 =?utf-8?B?ZmxXUmJDMmZWL2tEU25lQmtDdzdZOWUrSHg2aGlET0d0UG5qd2JMS3ozclAx?=
 =?utf-8?B?S000b0xmL2FRVFppeVl3eVJwcXdkT1RvbGVLcUFNUXNENkV6T0lFc2lLYkIw?=
 =?utf-8?B?M003YTlMZHVGWmlsR3d5UlpEVmtTUm4wVEZUS05Gc3YweWpmUUkrVURRWXVP?=
 =?utf-8?B?ekJTRTZVODFXSVMxakxkZ3RRL2RNZkx1NHZYMWtRYnFKWEJYUjVBVUsrMHFv?=
 =?utf-8?B?UlNLRnVSQ0p5eUs4OEJpb2VyaHlPdnFkT2pHRWdnaEZXYWFSb0pMY0dsOGNW?=
 =?utf-8?B?MTlvY044QURuamZ0WDFqL2VnNlVYdXBXSy9wcmRKTk5KdmpLMEtrWmpLSmtn?=
 =?utf-8?B?M29vKzkyN3pVcmlhVjNoL1JXWkhub2ZpbEtvK3dIUmVXNVRqRndEMHJJTUtO?=
 =?utf-8?B?aGtXUkRmMEhOaE1DVFMyK2VSenpxNG91bG1wL3FRT250dXpDd1F1U3QwRlpF?=
 =?utf-8?B?ZFljUUtMWWJlM1BlSUlkOWdMeGpsU1ZSR1E5cFJURHpUVEp5MTloenR6Q1hL?=
 =?utf-8?B?YUtvODNLWm8yUWtQTVl6MW1oQUsxNlZ4bTBDZENaT2NVOVJBOXJLaGc5elpZ?=
 =?utf-8?B?QWV0cFJXdm1PNDgxem8wM0ttQ3VUMjR3bUR0ZEljUlphSWlWSTJXU3dGdUJp?=
 =?utf-8?B?M2ltZWVoMGsxK1JHVDN0WUIvU1BybXAyaUIyTTBqR1BvRjdJTUR3engzQzdW?=
 =?utf-8?B?N3kwdTFqdkM5UFd6eUQ5OEhMajQ5UFhYU1cvMGZJTjBMVCswaEgxT3Z2WDNx?=
 =?utf-8?B?Tk5ZQTVadFFTaVpTeUExZVViZnNONWYyTGF5NExnd3B1a2VmMzNidTljQ2RI?=
 =?utf-8?B?b0hWTVdDZFhKZlF3R1QrYlBGZ3QvaUwwd1dOQUtQMzFWYWo4T1hSUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac6cc1f-cc17-4477-8601-08de539df803
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:51:46.9831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8pKs8SMDuj/Fa58zju1KqqoHNRpoIZeATdJA8i/qFUl2z23iojF23fADWYFk1tSCVo6Nfa9IpJ6yD5EmtSwMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOCP265MB8612

On Wed Jan 14, 2026 at 6:18 PM GMT, Benno Lossin wrote:
> Rewrite the initializer macros `[pin_]init!` using `syn`. No functional
> changes intended aside from improved error messages on syntactic and
> semantical errors. For example if one forgets to use `<-` with an
> initializer (and instead uses `:`):
>
> <snip>
>
> Importantly, this error gives much more accurate span locations,
> pointing to the offending field, rather than the entire macro
> invocation.
>=20
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v3:
> * use DiagCtxt error handling
> Changes in v2:
> * fix clippy error
> * add missing SPDX-License-Identifier
> * improve error handling
> * improve default error evaluation
> * added missing comment from pre-rewrite code
> ---
>  rust/pin-init/internal/src/init.rs | 445 ++++++++++++++
>  rust/pin-init/internal/src/lib.rs  |  13 +
>  rust/pin-init/src/lib.rs           |  56 +-
>  rust/pin-init/src/macros.rs        | 951 -----------------------------
>  4 files changed, 460 insertions(+), 1005 deletions(-)
>  create mode 100644 rust/pin-init/internal/src/init.rs
>  delete mode 100644 rust/pin-init/src/macros.rs

