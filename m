Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020108.outbound.protection.outlook.com [52.101.195.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8828368276;
	Wed, 28 Jan 2026 15:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612748; cv=fail; b=l63N8yyNAp7W/5ygrj0YWZVnPqJgSNYoEPyG6ksy+Rb/X5BQXtIGlsqfQpncQuFreRAeewr8pNSe3mzLedHKg+0jbQm8oKiRlKMP6O64PP4ZjFeLhsVo3kZ6yXsepShH16YGeiXixx71ox7RrZ/rith22lB6Sif6xYONojORygI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612748; c=relaxed/simple;
	bh=GOWap9s8wOi+egQhXp0UnBP2l+WgcBzzGnj3VdFjYAA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=UHpZenhdohqwU7GBc8CYxnOnbVC0fIoTBKeMgFLnNPDMkEsEmnyVSYKc1lK8uCZ4og9RGIkPywwxUYPzvtNR6ZU8dO0cKeS4+0B+zl92GeB6IVLAaK75G3lrjemga57gEJXfQxR0nJnPH6mS25CCsvUv6T8c/1jXvZlsYisHwfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iwzLTmiv; arc=fail smtp.client-ip=52.101.195.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iwzLTmiv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvcnaZXhV1QS01owU9Gp2sociGia0qJ/x6NvmBa8+msKPuDi4Y2ij4fGJaR6QxdnWnT1zv0B1KOb9BMqepfwySEzOll1GC4/y3l2j/xBxYGPVi3AbH7OoHx1E9VkARHCXdvxUVtSlud23KubA2AfMG3mM0ZewzAUSZR+3PXW44dWoNM3iPTfiV65f/GciWMSjVpWjXjEsKFRG0gfTUGU5fC0pk75zMH3wmM8RkHNeHFGAmG+YRPjnZ7YO57rx439ksloKBMG11QIED5+p0uNblY5vUyjnUgjE83jgPoaKa75PUFCJnsU+4bgS+Udiw33Ms9huwi/7Fc1G04oVCJMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOWap9s8wOi+egQhXp0UnBP2l+WgcBzzGnj3VdFjYAA=;
 b=mbQm+N6Gx6vsPrtHr3H3U72lHKYbs3X1qBNnGvn2QfStykcgYT+AUh0izzRzlv7VJivhJRWrF0nfBrgmAm8tomDm4VRqefQAE24Lp/dpbWCz2ISjh1NTa+tAIZvTsqgihTKnoRIdsXu0MBy0gDLDKyX6oLgOlxRomL7ebZrtBH6l8sAGPnAsmjBw+xRLYUtn2slUdckJCOb1TJNDWXDkMxweK5qkkmUdwEpFsfe7UvWC5nWqH1HJW0DhpfvJ8haXvTm52uEA2pxGyrO/odpk+T4D8ksPjDFQU2SmQb3YCAwrpxcpe7isqTsOi1juqcDlz+R9tylW5592PG1LoqccNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOWap9s8wOi+egQhXp0UnBP2l+WgcBzzGnj3VdFjYAA=;
 b=iwzLTmivXt/wJ4qFaWiUhw2OTCMNyr5zlJdwl0AfscSR/viCv5vo+zUA67Xj3sPGzNWcadEtxbrQMFEAkt9lnrNIsHaM8ahOC4cp7th0Q0DgBJnoPqjQ6qc3SFWcRgzb/Of92vB/uVbSIQ3RCqx3pJ+DZEQXCqD2YSxrZyiE4LM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2707.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 15:05:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 15:05:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 15:05:37 +0000
Message-Id: <DG0BD0NGT1HH.1PVFYFO0CCT6N@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment
 of values
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
 <DG0AIMJXPP65.1PTB9I0KQS4LI@nvidia.com>
 <DG0AU8J5K0SA.2SJVFWGAI98RZ@garyguo.net> <aXohLx77gHe9b_oJ@google.com>
In-Reply-To: <aXohLx77gHe9b_oJ@google.com>
X-ClientProxiedBy: LO2P265CA0134.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::26) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2707:EE_
X-MS-Office365-Filtering-Correlation-Id: a1269fe4-6c0f-43e4-ab93-08de5e7eb1fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1I3UU9HUlhEU2h4U2ZkTlBML09FbitvUktna2NsemlZY2lPbVYvSjdkRzg1?=
 =?utf-8?B?K0VSTEtrMDhVU2RDWEpYQ2pocmdrU1hJSkZZTXBzMG9VMlBXT2NSbDgwcDlo?=
 =?utf-8?B?Y3laUlZVOTlJK2dVd0FTWVBUV0UzOE1SaDZrWkJlMmFTdG4rL2ZTcHRDcHEw?=
 =?utf-8?B?dGNoejAwcStJY2hQTDZ0Mmd1ckcrZTNDc1hIRWNJRDNNeEwzY3pkYi9ETXc2?=
 =?utf-8?B?Vlc2dVBtRHpUQUpFdjdBZ0NXRHYycnd3cUlKU284TnhRVWRwL0dQWVNOb1ht?=
 =?utf-8?B?SjlKUFdMcElpdVE1czJ4SEhBQU4ybWV0VFVZWEUyRFFNczhkVXM1VW9UR0ZU?=
 =?utf-8?B?V0U2VElyc1VPR1NwZ2VScWlCa1dJNGxidGM1UVRSQWE4dmxTVjA1bVJ1M2pq?=
 =?utf-8?B?WVRSMVNBdTAzUmNteS93bFNEVmYvbFpNa2VMQjhkVStnem00VDZ2SWVWN2lU?=
 =?utf-8?B?Qmp4M3k5bmVIeUl4ZDJ2cUxMdytRYnRuSUl0TnN2aUhzWWg0K0tDbHBBWWJx?=
 =?utf-8?B?RjNhY3I2TWhveit3NFBHZkVJZjhzOFFFQUl2bUIrcEhUOXRlcTBZM3dXVGhx?=
 =?utf-8?B?WWVCRVc2bHhzSGV5U2pmMDA1c2M1dlB5bGtoUnpPeWtLbmxYUXZqdjZvczVK?=
 =?utf-8?B?ekx6Qy9kRjZWYW12WCtuMUZtckg0RTFpTkVHeTg2U21DMnYzRGJGZGpMUFRM?=
 =?utf-8?B?NUprUTBoOUhNSzBuS1lFL2pBTXovakE5SHdzM2pxeVcxNG5YNERWTDJORVF4?=
 =?utf-8?B?WTBzT1FETFRNbThkSm5rOUYxWVdJaGczR3ZCdTlpbG1wRWdsYnVrZDJVVHU2?=
 =?utf-8?B?Ty9mZmlUMFluVXhoSGJjT1VDOTJoUnQ4UUlHNkN2dnVIRDM0Ry9KMERKUjJN?=
 =?utf-8?B?Ym5hOHpZbXhyb0NvU2ZzSGdMOTZpcWo5eFU2V2VHYlNzK0ZHYUV6OVVKNmdY?=
 =?utf-8?B?TERodlU2YzRURHpYZDdDeXVyOWZ3QjZCVU1rV0U0Wk5IZVJKWE1OU2xiNHZS?=
 =?utf-8?B?YzF1d1o5MXR4cnN6RVVod2Ewc3hHcDllczBxcFg3cGxyd0NTcDloNWZJb1hi?=
 =?utf-8?B?eHl1K3ZDRm5adnFnZW1qL3k2M3JneEtqQTFibERXY0xLdnhIMkJ5cmczS242?=
 =?utf-8?B?VWdwNGNkRWpsM2lXMDBTeG5FQ3BTUzQ2K3F0TDJpNWxVS3VYbXU0QnloRUd3?=
 =?utf-8?B?cWVURkFuK05lNHBqam1Dem03em5ZTDA4Y09MZ2daOUhmUW1UcC9QVUV1dlZz?=
 =?utf-8?B?NHpwOURZb3ZWc2hva1hCd0RaLzhQR2h1NEFNSXBWa0lvUDhzNWUxR0lWSkQr?=
 =?utf-8?B?dDdHWTErVFlkWW5IM0Z0cUZNamN0RXArNXA5M0pxOGI3TlU0THF1aVVqaFU5?=
 =?utf-8?B?WDJLb056UDY1SE9rMjQzUmtUYUNDT1lkREFRSlF0bEx1SjlVN0tLNzRuaW9M?=
 =?utf-8?B?eWtxd0k2dlNYaW1KeUtlbkxxb0VWNmxFYkM4eGJqeklZQ1ljSEtibHFPKzF6?=
 =?utf-8?B?WndHWW96WTd2M3VnVU9SU21aN0dteWNndHF4VnN3VElHSUttazN5RGJOL2k1?=
 =?utf-8?B?a2pPeE96dDJGaFZ4VnNiQU5BZFNTR3Q3VHdMWXBQem02Z2w2MjNsMWpOUHJp?=
 =?utf-8?B?Q0cyOGVla0RqODd0N1lvVG5WdmtLTWo1Vk9JdngvK0lkUENuMnFsbUVLU1dJ?=
 =?utf-8?B?aVhoTXA0d2I5U1pDa0I0VERseVFNQnJEa1JFb0RyeFU1ZExXUFRmTWZEV2RV?=
 =?utf-8?B?LzRweWQwTFlkUi94d2l2TlBZZGwyYTk0RnBmM2FPaUhqWmpvUmlESDZsMHMr?=
 =?utf-8?B?TllBRlRJVEhRNXpSTG93MlAvT3kvNTVHOHg3bitka2diRnFTYXBFcHZkMzUw?=
 =?utf-8?B?Yk5ObjRMcTEraHBVZG55NDRJTWljdkVYNFlNK3dhd1JLQ2ZseThVVGhqU3NQ?=
 =?utf-8?B?UlBUYVdNWTZqRTlOeHRKMXNKbWRjYjJhWXZ6eFF6cTZhTHJzWEdPckJwc2I4?=
 =?utf-8?B?SS9GNzdicVd6V0ExRGlvV0R1RWMwNTAzdjVYK2EvSktVbXQydG5MSktYbGxM?=
 =?utf-8?B?V09mT0hTcTlLbnl5RCtNSVpyNE9WVlJsR01aYk00dGp0WVlOOFVLVHQ0MnUy?=
 =?utf-8?Q?OB3g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTZsbWtNQlRjNDlkYlg3NGpmVHF0V2tEaUgvbk1jSVk1SzlaREFmWExiWHpG?=
 =?utf-8?B?cGFJT3pzRWVjdXZwWHYzcnVUWWxBTTNuS3E5TnFpSGMxMDk0d05IRnRlZE5s?=
 =?utf-8?B?OGQvN0Q4bE44S3Z4dXZpYXVNRHowcVB5MkNpd3J5Q2htdXN0cHc4d21KZU1z?=
 =?utf-8?B?K2JqN0lwY2dURmxycTJVMWRjOHlHZjFCNnFyZ0dUb1NtMzNJS0FpMjdYek5n?=
 =?utf-8?B?K3VuT0REMmFuaWpId3Bvdk5lM0hWYzM4M0o0Vy9hYWF3REZUN0FHQ1JvYTN5?=
 =?utf-8?B?MGNEMUQ2Z25jVkJ0T2xmdVVZMWZmTERsMUcwSXdlTkNyVUFYODQwYXEzSDB1?=
 =?utf-8?B?RDdzajhHa3h3L0ZJVENEUUllemcxUjVjYlhHSzFFL1dzRWprcnVMTFZNeVBI?=
 =?utf-8?B?Nmc0a3drMWlaSUhUOTUvWldUSlZpWjNKc0F1M2xQNHJOM1YwNXpveEtrVUZu?=
 =?utf-8?B?QWo2bktDQUJyY0ladWViOEs5UWpxR0RLakJmc1B5czdZODRiRkhURTF2Mnlu?=
 =?utf-8?B?RGVFTlhxZHFvUlY1NGxmS0s5T2w3bmQrQzA3U0p2SUhSREdzbGpxaFlnamZB?=
 =?utf-8?B?TFN2aUFmcTNaSDhnK01uWW5KZkNVU1VBOEVsdDlrdnd2N1BrTEhKMnkrS082?=
 =?utf-8?B?eEpFUktoTGhiU3BFc1g1Y3RuNUlMblB2NjJncUVTSnpVSHdUdDdQSVp5dmFj?=
 =?utf-8?B?L2poejFicnRSaE9zRktOMjdlTWRzTkFCT1ViMDYzVllZT1g5QThYcEI3NXpZ?=
 =?utf-8?B?NkxHMHBUNUcwdFE4b0IwQnlhSjFLYlBLUkp0cThBL0dTOE5LUnR4NzMzaXhV?=
 =?utf-8?B?QyszOFJFeFc5b3lLbGZVRWUyU2hMdXdNdWFyWGlXNThwSnBmcVpHM2Q0eURj?=
 =?utf-8?B?Y2ZqVHduOFR4eHVSQkJFOUpXa3lLTTJGUTltTzgxTUd3VnNwalhyS3R0YTgw?=
 =?utf-8?B?UHdjd2w0U3BYQWFKTmxxMVZaenFLRkI0WFpDV2RxN3o2Q09JM240VUNuVFNG?=
 =?utf-8?B?QW5leUQ4eE1PUU9GZmZzY2FJVHJXUTk3dHRId3JPdFNCZGlOQ3Mwd0dsVmEz?=
 =?utf-8?B?RndqcmFnanY0UElKSVBMTWE3SHJFRExNOXhLZ3M5SWFrWHlqYUN1RHcrVEdE?=
 =?utf-8?B?elNETzlYMkZHSGNCR25WcFdCc2pNem5aL3JUekpDSHV0dGovSUxFQis2cHI3?=
 =?utf-8?B?MkVGdjFSSnRRVUhBOStmQXl4MzN3NUpSU0hJRTVSSDdsL1hldW9QN0NxcHE1?=
 =?utf-8?B?aUY4VnlseE5vTnBzWm9tMENLcUZVc0E1TEozRWQzcElIUVFaNjBtVEtSenFV?=
 =?utf-8?B?OWVVSWszTm9oTWJGcTV0bWZ6RkkzdHN5amxxQVdRMFJBR091OVkrczIrd1l5?=
 =?utf-8?B?Y0R0K1VPUk04S3FNSG5nbHc2RWdxbDR2RFI0MjFubERuTjFMVDlKb3hSQm5t?=
 =?utf-8?B?aUUrOG1FUFFsdE84MGNsQ1NzNGZFNUJRWkVpaURaL2loOFpWMjZpVzZXOWQ5?=
 =?utf-8?B?dzJiOU1URHlTYXBlSUlzd2lveS90cGFZdWRMa0xPdEZBUFNrbFRGT0hNTEhE?=
 =?utf-8?B?Z1lJT2Iwb1RaVmhYWEk4am9tYnloSWlueFl1N0ROdjczaWNIY21yZFlaWFZy?=
 =?utf-8?B?aFBFR29QNHR6ay85N3Q3QmJmbGpueTA1QWFrWkpkWlZqZ0hRc3FGcUF4MGFY?=
 =?utf-8?B?VmdwZFpDZEYrYTljNzZ0V21KZmhJVkNPWXpvOHlPQWNXWkxySllCZWN0ZlJx?=
 =?utf-8?B?KzVlRGxJaTFSRnFCUDE5bldDRGZPaGFmUElPVE1pSnlidEp5T3B1aTFDdjNW?=
 =?utf-8?B?QkNJTnd4K1R3ZjdqQ3JZcFF2dVpIemg1bVhSSTBGV1A5SVdPQ0FjZGZ1Y2lV?=
 =?utf-8?B?VGxHOUcyV3RjZ1Jjb0RtQkwwWW1sTHhYY2xHZjlmMjkwaVFpVEd2eWwxTE9r?=
 =?utf-8?B?S2FORXdhMDc4c1BtZVl4RTZuSDhaVU9iYk9YYnBad2VYWHQ0L0pyejdSWC9t?=
 =?utf-8?B?R0dGYTB4Rm14NXg2WHI2OGFhQU0vS2pRcHczTi9PMXI2Q1F6d1JUMCs0Q3l5?=
 =?utf-8?B?OTRtaFQrM1l4SWtlYUI4WVpNSDZNeEtxVlV0bTcxbkpLZWkzbTR1Uks3RDRa?=
 =?utf-8?B?d1JPTFdNY3BmSFdUTHlXK0FrZnZzRGZrV3o4b3IzTzl5UEZ0ejV6VGJCVkdi?=
 =?utf-8?B?ZmZzOEg0K3pvcGY3NWZEeTY5ZngvZ3h6MzZ6RUVHbEk5ZGJXTUhhNzgwcDBN?=
 =?utf-8?B?V0VET3hMaWdJczVpS0htWTIvdTA3d3hCdTU5M0U1NThHWkJCOHVFNkZ0VUlD?=
 =?utf-8?B?dUdwczRLcFRYTk84MDQyaUdLcVJHd3ZXNkhId0x4OFBBSUdNZFBNUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a1269fe4-6c0f-43e4-ab93-08de5e7eb1fc
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:05:37.9363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhASiplAqJvTRIg1kucerIL1snYFi0DqmUMMNJMsgUe9u0W10LIcm5O3VxHKLXYvIanindssrwzSdUma7+kLLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2707

On Wed Jan 28, 2026 at 2:46 PM GMT, Alice Ryhl wrote:
> On Wed, Jan 28, 2026 at 02:41:05PM +0000, Gary Guo wrote:
>> On Wed Jan 28, 2026 at 2:25 PM GMT, Alexandre Courbot wrote:
>> > On Wed Jan 28, 2026 at 11:05 PM JST, Andreas Hindborg wrote:
>> > While 64 bytes is the most common cache line size, AFAIK this is not
>> > a universal value? Can we expose and use `L1_CACHE_BYTES` here?
>>=20
>> On all archs that we do support today, I think the value is always 64. H=
owever
>> it'd worth putting a FIXME or TODO (or assertion, maybe?) in case new ar=
chs gets
>> addded where this isn't true.
>
> Are you sure? From Tokio:
>
>> Starting from Intel's Sandy Bridge, spatial prefetcher is now pulling pa=
irs of 64-byte cache
>> lines at a time, so we have to align to 128 bytes rather than 64.

A cache line is still 64B, even if a prefetcher might pull in multiple cach=
e
lines.

The hardware prefetcher usually only engage when a sequential access patter=
n is
discovered. So if you're doing array access with increasing index, it would
engage and pull in next cache line; however if you are performing random ac=
cess
(e.g. following a link list), it would not engage, as otherwise you're
effectively having half the number of cache lines available in your L1 cach=
e.

If the software need to fight the hardware prefetcher in general (where the=
re's
no regular seqential access pattern) by spreading things further apart in
memory, it means that the hardware prefetcher has failed its task and is a =
bad
design :)

>>
>> Sources:
>> - https://www.intel.com/content/dam/www/public/us/en/documents/manuals/6=
4-ia-32-architectures-optimization-manual.pdf
>> - https://github.com/facebook/folly/blob/1b5288e6eea6df074758f877c849b6e=
73bbb9fbb/folly/lang/Align.h#L107
>>
>> ARM's big.LITTLE architecture has asymmetric cores and "big" cores have =
128-byte cache line size.
>>
>> Sources:
>> - https://www.mono-project.com/news/2016/09/12/arm64-icache/

arch/arm64/include/asm/cache.h defines L1_CACHE_BYTES as 64.

>>
>> powerpc64 has 128-byte cache line size.
>>
>> Sources:
>> - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489=
d4d2/src/internal/cpu/cpu_ppc64x.go#L9

There's no PPC support today in kernel Rust today.

Best,
Gary

>
> https://github.com/tokio-rs/tokio/blob/master/tokio/src/util/cacheline.rs=
#L85

