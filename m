Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022115.outbound.protection.outlook.com [52.101.96.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79E3439006;
	Tue,  5 May 2026 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984693; cv=fail; b=Qu27M3Dj1+yjNBiFQWGxO4tcG8WhoXjtKIl8XQ9yerB6QhHOLesYfuTTbd1fmFoR/R/igsHjZ9olSULoU5wAPB4gOp2OUUyvScVhRfkfj0BheY4bvpXQaU+9f9J0rKV9hGDyup+XtpNbRP8nRaE88EheZOkyF4F6nhv42wM50mI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984693; c=relaxed/simple;
	bh=sLtFTd2C4ItVEogl2wL4fCDQp6lRd1eQHY6vOm9LKDM=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=ud4tNSuE5eEg6mU5hm1KmRRPZOsnDVJr2gXuMx0kVntzVBaSH/S9hCjZxSqzU0mjFc9e995MuMnCIb40OLWSyaCo7cEsEQE5WKjccOgMqL0v/YrrQum/0wvKdli5TT3b84ZMMQkreNtV/FtunJqV2yf8vCvWnX3GUmTZ+346KmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=quSPeY7f; arc=fail smtp.client-ip=52.101.96.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="quSPeY7f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7FyB3K63sx5Ao6Fq5oizEasbEMTi0GDqSHpk85fB8sZc3pLia0AxgeMyPaSWD0YYc2tgpSLA7s+c/FzYEJWEdU9cBA8PBgkdzOVp1ziwBlhReqJchtr1oPFAMLh+gibRXMZ7cku9olUO9QbP7RHLWbvP4KG8CH9H9rdNPl8fE2xeWeYrYyxXdrEOkFXIx5knilfn7rxtGrP6dcRvl7a+RTyuqvyxq14Fck7ptX2obOoNuCeahiJsNFaSTxpskWxe3/JT8g0SHxDs5yw7M2pYVZPZ/7Wq287DNdPLM3b6j94k6vlBnYzqIbhT4atJG6g7uKalfRomQqjBXdYQClTOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=261Qag6iSsqjo2qNJP41fZaLzTjD4LD3L5MLfBxVNi0=;
 b=j/ptXZWbl26CtPUouij1lWSo7s8Y/Ixt3O9McVHq/cOu3qKGqbQlt/tYUy61drYp7X8gXGnCCFcZoOqUw1K15fvBSxRRbbez/rH27xtZOFBncKWdrMmgOfsscM2ch/Jhi9caezb/N+PpmyQ9s9s6dmp1IS9VV7s7bY56LdSTza+5is1yLTNF4VUIkSoMCbFlwCqxcuE6lxJGlUPkM0VdJl2LmHA9PEtFqRSEGHslTbP/9Ilm70vz5cBC2Rlp7pcgvZhyh/C0BMJnXEVmmMRscsmoIF5pEVT/RqeBL0J+CZvMPcYZDjAgAcn7UR6X+dd0XH6GqpHs2EicjM733i0b5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=261Qag6iSsqjo2qNJP41fZaLzTjD4LD3L5MLfBxVNi0=;
 b=quSPeY7fSH3g5RGsO7PpsJefniu6N8BuQXfmaUcHgW8sSG3NqJxheoLMmyO60y86ek9GtCvpGgte2fq+2Z2rp0zhUvP6baqBKrBIOzLLP663gIUweNwkppSylDGxg1pmB5pjert6C6XbRbBHtcjl6V/5xPqOnOBArr0xljhOiVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2078.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 12:38:08 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 12:38:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 13:38:07 +0100
Message-Id: <DIAQYXAWDBCM.8GYR67E1I13P@garyguo.net>
Subject: Re: [PATCH v2] rust: sync: add #[must_use] to GlobalGuard and
 GlobalLock::try_lock
From: "Gary Guo" <gary@garyguo.net>
To: "Ashutosh Desai" <ashutoshdesai993@gmail.com>, <ojeda@kernel.org>
Cc: <peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
 <boqun@kernel.org>, <wl@lyx.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260502160057.3402896-1-ashutoshdesai993@gmail.com>
In-Reply-To: <20260502160057.3402896-1-ashutoshdesai993@gmail.com>
X-ClientProxiedBy: LO4P123CA0429.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2078:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1172cd-1f2f-41b0-1520-08deaaa3290b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oShA4d/dBOInRFPJDaJaPzNqfavGQTD6rRlbt+gr9Pdr1NRj3bQ6oFUlauN9cq/Qo3RysLz8v1p6bVLt77hqPDieMioar70k7FXRrCdbindbY0ys4IOMFa+fj5Il8akAE7BiUfXxvJVMFTgUiHNGKIwyoxePLooMDgkTMStmncIBCWhaXe9IqUgO6Jz/1LMxZopDCCrpxJAXBnXmCCY9rjFlI15+0Ve9Wn2/nb2NzHMhV9d53R+IEjk4dEdtzjUSnKlbnvMrTKfaEw5fMU34iMHYNO3wtY+zXFiHyNfu9ZzokZAtXaicKwy9DsZSBpqz+7f21yrLvPtlqq3RpLr2d7mjN0rjN1oE/7pbS3n5Vv1v9Us6UkrDn+p0KJwb4WqVZ6xcFmuvfGmhSzP+RagDXxp3BlIBbMNql3lNhcbK+Wck0yze2w+aY2MUFGZ8LPOMI+k0e3sCgpKG7mh6zsgTgBfDUdCi/rhOIe8EqCBAkBgznh+nJ1Qyp9qDeMvxGuCuUPp9VzfDvO4hOZAWc0iCboSPkNyOnRp1VrdohPHK/144HYxKbeBfsrywJW+KnydT0RP9zgXJQRpUzzjp04NMf1NjTH5OCkHaM2EA1yQ+eQJ3jl4GRgXZLGQoPAu1offJYmwPrSY4C3B3gkicoI86S2BMYhHR56TRLUeCYQuE5brRUn8mNVaDZBqApb6L1Dyx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnNrWmtiaEh6TnFtM3NxU1A1VDQ2am13TmVSMWZwYVo3MkIvRUl1aFU4MUdN?=
 =?utf-8?B?RzZOZjFVMi9uV1pyWEFmTytpcTBndDhHL3hJVFRFTzRFa0lEenRBWVQ2QzMy?=
 =?utf-8?B?L3V1VXJhS1laRGtXK2xJbElobEdDQXdSbGZac1lZdEVmN0Fpa2xoTG1KS2lJ?=
 =?utf-8?B?RW51ZHJBMytTSVBsT1E1ekpwbEdPUkFUTEdrcDJ3b0FDRnZZcUMzdUdVeFF3?=
 =?utf-8?B?ZVVWK0EwTGJlUlFTM3hMclZBNVFVU2ZZODM2VmdqMlZQY1kxTUhhVU5UOUdp?=
 =?utf-8?B?WlZxUDh6Y2h5dnpuUjN2Yk9UeFlQSDMweFR6Q08zM0NkWjU3Z1k1MUZ0QzAr?=
 =?utf-8?B?SEF1NnVhWjVQSFBCaThDc01ZVHd5L0wrY0U3NUxUU3BwUXhFSmNacEtmOXdB?=
 =?utf-8?B?QWF4K0FHTjFIMVhJbHlsS0gyUTlmK2JiVll3eVl5cERER3RkVlhvOUxuQ1ly?=
 =?utf-8?B?V3NTRUJJczc1RFkySkhMbDQzYWVMd0NMVitRMXdVclIwSURFY2pXVGZYQUcz?=
 =?utf-8?B?dDR1b2U0MDlLVkF6ck5CYzVDVklncnBHVEdpZUZFdllqT2pFTjV6MDRDY2ZG?=
 =?utf-8?B?NWFVSEFTbFl5SjhWWktrODR1TTQ1L2ovMVdldlVIbjFBL3FNVHhLdFY2N2No?=
 =?utf-8?B?aDBheXFvelNXQmM5enJiVXRRQjVnVSsyYkRwWnJsdHI1aGUrRkpmZkh3K0ZF?=
 =?utf-8?B?czkxbVBCcjI5VnhmY1Ezb2FweHBSenRJUFE2OXNYZnZlNExybkl2eEg1RHQ4?=
 =?utf-8?B?Q2dKOElIaXFjSkdGSXkyS1dSdVB6enprMmwxUCtRbnFTZENHZ1EzeGdqaW1X?=
 =?utf-8?B?b2EwZlFra0lQcGxDS1NSd1h2Nmc0a2RXMFZDUlBRR2RhSWhoN1ZHWWRyczJw?=
 =?utf-8?B?TTdHMVA1d3NJWmhkT2V0dEUvM2h2dGJKcjRuYTNraDdHcHJNcC93bkJ6YmZx?=
 =?utf-8?B?QXZFa2xUNWVrZitlTzVqNGJRREl3ZXU2MGY2TFNpakRyMFo4TkhQRkRLcjF2?=
 =?utf-8?B?cjF6Y3Zia2N4S0xYQXZSK2FNejBtYjJCTVlFU0RuQ0tIMUNSV1gyRGJEQVFx?=
 =?utf-8?B?WURPc24xeXduUU9vbnBSbnZYSlJycHVwd2w4dGF5dTlSeWQ4NURSYXU4eXYr?=
 =?utf-8?B?ekxPOFN4Ri9yNHl0THo2eUV3YWs4RGNGaUh2clcyYWNBOVpFWkZzMkx6OG1n?=
 =?utf-8?B?RDFia0UyanJ3clJUdHVkdVNhRnZxbDhyUU1IaCtya1pudjBDdm1PZTIwb0RO?=
 =?utf-8?B?N0JGVVdzcFV4UE5nTWpEeThsOE1zZWhJNmFJTkthVzNLK3A3YXNKWnJqK3N3?=
 =?utf-8?B?STQyTWQrSzJGRFRpdTBPZmtXSEw1RThaZnY1Z0owYjlNQTRYa29PTk5ueGJh?=
 =?utf-8?B?MmkwNHI3SDJkdlNPeE1UWDRVbC9lUUkyMWlaUFZIUkRsK3doOTBZUWgzNlAx?=
 =?utf-8?B?ank5alg2SkZ5K2dyWUZIOUo1c1RhTmtpcDRyQXpnSUZIMHErWGZlK2RnR2Nq?=
 =?utf-8?B?c0FrMG5HeWRtT1YzeEQ5TnIxeTUyblpEbEpCTHJMSEVpSnJLanpVWE9zN3d1?=
 =?utf-8?B?ZnF3SnJGL0ZhbFRkbTJqUWxLc1grdzZZL2JXR3VUWHlOVDJYcTlEU3g4Tjdl?=
 =?utf-8?B?eENHY0NnUURhTGFYWER6QTBQdHpMMHlVQ3Aya3dPcDJBVVc4cC9yTmlvZDhO?=
 =?utf-8?B?WjFZcGJGZXRLQnpUaVhWZXBGSGJzTTRXaDZtNi9JcGtmWkxVVzV4YWRJcFVD?=
 =?utf-8?B?WklBRUpiZW5uVkFyaDJPWW44Y1p5aW50OFVBSGNVYy9xVDFWb2c0cG00QXha?=
 =?utf-8?B?RFAwZitaeTRKMElRaHRtOXFJT3lHaGVtVGt3UTlaZGUrUDg0dUpmOWdmdXpJ?=
 =?utf-8?B?dTcrbGZLMElJMWJmbW9wVmYwaVczNzQ5TFRTU09FeituMHZiNWpUMG5hcUdu?=
 =?utf-8?B?MndMeVEvTUFKbHV5elhkUHhKWERWWlpaaXZ0VGdEc3R5M0ppVXdFR0p4QjR2?=
 =?utf-8?B?bHRzSS93dkRweTRzTjYrM3Z6c2dTM3djL0VMb3dMZTlHMlNRVmMyNUNNUHhP?=
 =?utf-8?B?YndxcmRmU0RuYXlHRDFnUk9MTnNMSUU5MnRyd1FseU40cWh6TXIrUWxvUGIr?=
 =?utf-8?B?S2FtajlQK2lvNEh6SUlzcEFxVmZxWjBKM3prdFFXb2U3ZlFxU1pNYXYyOTBI?=
 =?utf-8?B?NVZzd1l3NzQ3Y0Y0U2RqVzNJZW00MHZCZGhmd3Zxek1oUVdZY0ROUU9GNUxr?=
 =?utf-8?B?c3k3clUrVzhJVmNpVkZNMHo1OURWdzZNTmI2Q09pSFFIaDlwMnlKUmZvb2hK?=
 =?utf-8?B?SHhRZW9YN2d5aTVnNTBIak1FZEFRd3l2eDU0ejU1TTBZQTdDbm1FUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1172cd-1f2f-41b0-1520-08deaaa3290b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 12:38:07.9846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3YKjfq88LOjh+NeQYCGj3+Iyhi/oCERPCx6ZJxBi4YAQkyTooP80eM1NV/YXUbD2/cFy0piVdl0YzRTbZ2LkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2078

On Sat May 2, 2026 at 5:00 PM BST, Ashutosh Desai wrote:
> Guard is marked #[must_use] since dropping it releases the lock. GlobalGu=
ard
> wraps Guard with identical semantics but was missing the annotation, so
> discarding it would silently compile without warning.
>=20
> Similarly, GlobalLock::try_lock was missing #[must_use]. Option<T> does n=
ot
> propagate #[must_use] from T, so the attribute needs to be on the functio=
n
> directly - same reason Lock::try_lock has it.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v2:
> - Remove explanatory comment above #[must_use] on try_lock (Alice Ryhl)
>=20
> Link to v1: https://lore.kernel.org/rust-for-linux/20260419001141.211935-=
1-ashutoshdesai993@gmail.com/
>=20
>  rust/kernel/sync/lock/global.rs | 2 ++
>  1 file changed, 2 insertions(+)

