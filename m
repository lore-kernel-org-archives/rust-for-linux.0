Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021073.outbound.protection.outlook.com [52.101.95.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F542324B3C
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768829509; cv=fail; b=HItu55CRBwGIJQfxBZogbjVlOwmt8LcNjDDEv2o4yZDVvQPbQ3cBEcH/ANJiK/u1iuCWLoFOJ3lp6KkoOQSjpmiUg3M6SlH+/bbur5OATx7ZRzRSEeObFFhxy8S2lYUb7aVRIoxQ09gklx9bp6K2G/BbjhaqNKLQc3NIb5FdKzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768829509; c=relaxed/simple;
	bh=SEaCiOpM5xtdoKKypNB9dhS/hkEDp9a2jyhpPd5BZKI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=aVoHiECO6aR8qFQucfuQHHpcm9+/BEsnLp5ynjFrqlc7wLd7CZUWMYpAhPpqgOhb/hq9svSQj9xWW0kf/3rOj/n92ByF78+W8X8Fxm9c+xpfeiE8E7F9/j6hlgiy9yG1HtQYFdo1nIXt5JvMHniQLnpRuFLKPOYt9nr56VJoUjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Olg86VPB; arc=fail smtp.client-ip=52.101.95.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Olg86VPB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9/AWa30xP6wyr2RUUduWE+k/xkwBMEr/vCob3RRcGR9BMc8NbScvzmOnmJ80QfdFVwoeMtxRXr11JY4yr6qGpzFQyd8MKpnCx8GC++7Pnu/9COlPDeJcNrriULnCh2wW6WZCC5s2Tvp6l58St9KHoX9QfCMnId9XfTlIW9mgO2kIo4XW/4ZTT1BEKguAXUtzTu5bAf5faISecszKukU2Zj7XV8Z0UhKoAuL7yGTJfxB1+I4qeKXzo5dZ1Q1IqfCnhNsJ2jGgPtkQ/fAecbD+HIUDlm3vA5MK89XmQXlk7OjoY2QHrjHc0hmTT6kF4xmO5vk5SmxmDB2uA3Lnc2fsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SH2D3iT1uN9d8TYa91eLUZu1P5dShX9cI3kkIhx4pQE=;
 b=vgG06/tAZkltXG/4sYMrdMY9gTVOu/ZC05WiWoFWh0NBL2w1cZBPs0zAuaOZVmy+Otpy7v0Mt5fTEfiBYuX7YQ7p514uY16KFTHsLGE0GMrRI+zq6WPI3LdCseDgormRLOFHCR/GHQn+ER+8Zyjcm7/hgWBz3+4CnCp7hYoXcvLuPotwuI7OkScH7DQ95+7EwrSDmMoF+cewBFF4eaK5YrKC1WBYfOKGGrHBgt+aZudEhBKuZ7P49WTjSEJFz8/0k/iNSOXuuDJH4skT5F6hhy+W5HJ2Q8nNr23wj6Slp2zplVnEU0AHK000wyHTfgqkiunwyJLXYEAzWB3eVV/SEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SH2D3iT1uN9d8TYa91eLUZu1P5dShX9cI3kkIhx4pQE=;
 b=Olg86VPBhGjFTJ6HvxkLw1eH2L91feop0hq3lAw0gR2kGr2LZvn0mxfDMwEcg+/2OOSLBB4ubREO5qMWvpx29tv1HtvDKZcU3NhD8iHJJw3+grPDfYrrN6uWSI2IJd54loFEQIA519fTviKvWw5A2vNtTVNuMkOiB1Rv5O2sHcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6129.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:24e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 13:31:44 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 13:31:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 13:31:44 +0000
Message-Id: <DFSLQ8C5ZGZK.2NH94EL0CQLKY@garyguo.net>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Tamir Duberstein" <tamird@gmail.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v9 4/4] rust: fmt: add RawPtr for debugging pointer
 formatting
From: "Gary Guo" <gary@garyguo.net>
To: "Ke Sun" <sunke@kylinos.cn>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260119033006.1453006-1-sunke@kylinos.cn>
 <20260119043502.1534349-1-sunke@kylinos.cn>
In-Reply-To: <20260119043502.1534349-1-sunke@kylinos.cn>
X-ClientProxiedBy: LO4P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea0f365-b178-4c3a-aa23-08de575f16a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEhIcEVjYTVuQlNUd3R6WmYrL2NWRWRLMmJvalhoK0ZxcGFKRkxSd29ZMU53?=
 =?utf-8?B?OTgzZ0pqTzVSVldnRWFkM3BRdzdKeVN0TXZGTkhpMFdiRTltMHlxWVdPNGJT?=
 =?utf-8?B?RlY5S2dNazBpbHRxVWxwOGRYcktHVStzSW9IaG5CQmZsamNRMDVkYW4wallL?=
 =?utf-8?B?R0hOMUlOZ3BjelZSMU95enlvRzlxMWZzbi9ENmdXWjFjNkx6RGZaUSttTXVM?=
 =?utf-8?B?bnNGNW5ZTVB3a0o3cWpuait3eHlFSXFiTDkybjhJdVFDMGdldEw5Tjk2N0RY?=
 =?utf-8?B?MFJibWo3TVVuRnMwYmFQRG9ndUdNZ3Z1bXoxN2YvTTZnV09QZ3pOU3Z0clFx?=
 =?utf-8?B?MWhyMjRFYnBvZVZ2UTV4bU8vcWRiWFJrV2xGRSs1WUpLNzRiSlltS0lkczlw?=
 =?utf-8?B?Y0FUb0N1RjJOVUdEYVh0dGY5aHMyeS9YTGpHaGdoWS9EbGxMSlJKc29TY2Vh?=
 =?utf-8?B?RkhTVW1Dd29kaUJiOGNEazdiQjkvalgwUllmek96b2hsNWtqc1FYRitHanFn?=
 =?utf-8?B?UWRIbXl4MGdGd0grTGJGRTZSc0x4VU9YSnJSaE5VZjFUVkRPNEZTVnpkeGli?=
 =?utf-8?B?QWVxMHAvR05EdDNnV2FMS3hHWTFQc3VwOFN3ZC81Nm4rV2JxU3ovdDh6NG54?=
 =?utf-8?B?Z0ZsVklLM1oxQjhWTStCc1VwNXo2c1h4ZGh0TVN6T3V6QkR4SU1waDVPVklF?=
 =?utf-8?B?QjRiTW51NnJYV2hXUGdYckFpTW0vdkdwREx4UFhkY2NxWXdyNjdQeldwTmZT?=
 =?utf-8?B?em8vOEIvRU5IMzQzWGRhU01PdjZJa0Y4QTc1cEh0SUhOY21zTTFzWk5RWDBx?=
 =?utf-8?B?czlVMm9aWUM0ZnlwTzJadk5tejExc1VjbnB5TTV4eWMxUnBCTXRFc0ZvSS82?=
 =?utf-8?B?dEhmZTJ3TGJJUWlMNUdNMnBUaHhVMWo3MjNPL0ZrNm9RWktNeFVjZGN2N2JJ?=
 =?utf-8?B?SHVVbXBtc3JGekNVUFF3ejJDWGIyYXlRQ3RGcWlQdDNHTTJ0RlJmb1lSaUVa?=
 =?utf-8?B?aXgrKzh2am1rSms1eExOZEF3OVprcDczZHVJZm1qQVpDQjlGT3V6RTJHZDhS?=
 =?utf-8?B?dHBVYmxWaTNRa0l3RHJWRW40RURiNjdaU2FadnlkWVNCRFlOSGJ4SUFtbDQ0?=
 =?utf-8?B?NUpWNWtadFI5T3lGdW0za2pvbmtyOHh2T0ViK2JhQklJTWQyT29QdHI5QnhB?=
 =?utf-8?B?Q1ppS1JiUWRCSytLdW4rU25JbXVZOVBvR2VrV3lOZ1laY0RtU05ZN0pjeHdZ?=
 =?utf-8?B?TXFyR25UVW1JendxV2FoNEk3QkdIUzRsaWViYlljT1N5T1cxVHFzemlPTDdZ?=
 =?utf-8?B?aFdlbTN3NThSQ21CcFJteUtDR0h3M1JiWkN6NGhYYVdQMm9GOGJ2OEVjOURj?=
 =?utf-8?B?UnFMeFMrWE8xbUFwdVQzQnRzRzdKT1dYK2RIQlVFUGE2Y1ZTTHBOV2U0eWtx?=
 =?utf-8?B?Ky9FdXRDZ25aWVR3QWloYTM1U3dkaTlHRzBubXlSQmNVaWZzcSswS3MrWTFs?=
 =?utf-8?B?UVhNUGNaYTJRY09IN2tnYWRwZlhsaG5mNzNYeXhvUlllZGJUdktNSFlkcTc4?=
 =?utf-8?B?UnpydW1ZRTNUeEJKY2lER3NjM2EzdmFUdUhoSTJUNWlJL0RxYWlXOHZtSGRv?=
 =?utf-8?B?bzJYVkxvYlRCSThHNHdKUEYwcXNOQ3k0R0g2NEdoMFlQb2hmcE1XYmw0Sk9C?=
 =?utf-8?B?QkY2b1VtYTIyMEpQeFRaalRhbDhrZjF2VlM1T1pEYkNZT250Vjg4a2prQTg1?=
 =?utf-8?B?NFhVaHZjbTVQOEtJRkc3MTREUmU1R2EvMDd4TWwrSWpRNFNqUCtBdUpwUGZx?=
 =?utf-8?B?TkJmU1NWeEhBQ3c1QytXOTZzVFQ0Wkl3ZllVUEJnZy8vYUhSU2QvRWRveCt1?=
 =?utf-8?B?N1NVVXpmbEY0cVBIRGh1Q1Zla2RxRTFRamcxSVNiTm5pejJES20xUUIvTmRV?=
 =?utf-8?B?WllGSTVDNkdJM0hjaVVYY1MzTTRuRGk2UXNhR2pHNTdYWDcvT1BRYUxYcklH?=
 =?utf-8?B?am5rVWErSzhWV3puZUdySUxoeHVkSmNOYlcxWEg4eG5jVVFhcEhORjF5TURs?=
 =?utf-8?B?VmV4WkFVRXdCMHB1LzRzUkt5QXczUmx2WUlTcjdsNzlJanRqSWZFZlNkWHA2?=
 =?utf-8?Q?UKQg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzVDVmhGRDAvYkNFcDg3RHNvd0ZNNjlGaG9NV1N6UDh0UnVGYkdZMStoZFpJ?=
 =?utf-8?B?blRjZ0dKL2tNYm16OTZER21tdGVVSTdGb2JDS2JPQzBrL3BpME1nYlVsSDFZ?=
 =?utf-8?B?dlFGRGtnWnF0QWNIUzhYbHZFUEFqaG5wUkNiemcyL282ZUhxbThaNm9rSGxv?=
 =?utf-8?B?TWJDeG1NUXFseW5xVlZtNUxrc0JLdWQrZVlMVmovbk5Sd1FvNittakM0N2Fw?=
 =?utf-8?B?cit1MkkwTkQyenRMLzFCVyt2NDI1Y2QxYTBQKzUrdHczcFBURG1sY21jN05S?=
 =?utf-8?B?TFprRloxYXdCdS8vOVZDV09GM3IxUUtxWUZoOFRjNU04REFJQjFxaG5ZTUht?=
 =?utf-8?B?eTJZeXRFMU53REllQWp3eFl2a3cwejNXMEhYdGlRNStzdUs0NGtXeHZYdHpz?=
 =?utf-8?B?UGk0TDU4VEFiYUE1VGVndTJsYWJEeGRmV1lldjNaMGZORS95QXJqVkt4VVdt?=
 =?utf-8?B?eTkxU0pxNXcwSFJXT1ovN0p3OHBIQjV4ZWdFdEdlemt0MUJmenVUUG9wRDlw?=
 =?utf-8?B?THhEbGVxeTVndkVhRUVjKy9TMVF5TytpVVpHRVMzZWJWaVlKVjNEMjBqVk50?=
 =?utf-8?B?UWJBNmphWm56a3hOVWh0bGZ6bzJBL2pERyt1dDB3R2RaNzNteEJzdHpWRVU3?=
 =?utf-8?B?THkrZ2l0L3NpTzR2K1BRNWRLd2xFUDl2NVpJSEJxQmF1a29FKzZVMUtUUDRm?=
 =?utf-8?B?RHpRY2R3Mm96K1VnZ0s2d3JsRXFlbkp5N2xNM3ZHSVJwNkgybk9ybWNsSDZq?=
 =?utf-8?B?WkhQS1VnWFV4cjErdW0yUmRxcjVIMm9NNHhTMThGTU1XbS93NXcwUTl2amZa?=
 =?utf-8?B?V1Q5TUkxMzBiVDlyRmhFVHk2TVEzVmhoV3prOHhrUnBnU0F6Z0x3Y1ZORE5W?=
 =?utf-8?B?UEoremFpOG9ockxPWU1QUHNXSzBPMEhXdWxyUktmZzIzcDZDekhLMzlSS0Er?=
 =?utf-8?B?OWJoR3IxUDF3VWhVK2pvOWJ0Wm1SU2c4dUcrNEpWWjN5OGt3Yy9sQWpoMVdn?=
 =?utf-8?B?M2tEMEhTTTFnZFl6dXJFejFscFdvR0FvVVpGb2d0NjZiTUJuZ0NRbm5IaklR?=
 =?utf-8?B?VW5wK1JINkFNYWs2cy9FUFdEdDZzUDI4STNNSVZXTVJFQnJQM3RIMjBSSzNr?=
 =?utf-8?B?VTJTWnNTV25adWhvQXZqWTNaYWxHUVkyV05UL3RWdGVFMG9TU3RKeEZhMDFH?=
 =?utf-8?B?ZGRBdVkwcHFWMGsrSnQwUGNNY2Y0bXptZWZ2THY2YTlROTFEMWNYdjk2RlZt?=
 =?utf-8?B?V2R1MDhaaW5lcEJMRUQvWXJ2b1BvVnBNa2NlWEZiSVpVL1ltZG44SG1WVzNo?=
 =?utf-8?B?QlUwOEFCM2E3UWs5dUk3WVFOK0xwQTc4VnRPQmZVSDdaK29xRFZJMExsazc3?=
 =?utf-8?B?UUVwRFdwVlpiTUVtRDZ6QUY5eWJXRGdJVG1BdnlOdzVjamlwdjFsQ2UxRmdC?=
 =?utf-8?B?ZU5TY2xvMkNFTXVzZnFEeFNTS0t1cTdHU2Vza2o5R3VJR1JIaWt3SklkTTJ6?=
 =?utf-8?B?U05IdWNhOUdCOG5yR3FESkNiTENWL3dUSi9qRExBSFZEWWk5WUZKbUR1ZHpQ?=
 =?utf-8?B?WkVFZFdXMkl3bUVxdmZrVVBjSmU3L0JLWGVLQ214SXU5Uk40NVNrbjFkYk1u?=
 =?utf-8?B?dko4bHUySU91OGxSNHpGNWxaQWE3Z2ZWejFaYy90SWFmVjI0ZnkwK0tLZ01Z?=
 =?utf-8?B?RGxtSHVTci9ESmFiQmZYS3RaRHRSWVFHWVVqSjVVejRVOUNUalNFNlQ5MXRE?=
 =?utf-8?B?UW5XVnY1RUs3SzRSNlAxQS96Yy9xMWhMNkkrVElRTUVQVDRhc3IxdzZ2cm9S?=
 =?utf-8?B?QWlrY3pkZnhmdWlFZ0M4THJtbUJ3K0kvbm5mOThqQ3FOYy9PR0p2aUpUbWxj?=
 =?utf-8?B?U2RIbjd6RVFSbWZ4SEduTS8ySjFWd1RkTzhoZGY3dlNRUWlUUG9abjRoMzlV?=
 =?utf-8?B?MkVvaWFrVGJkNGRkTjdDY0xxNzFzZms5YXFtS294S25Gb00zbm9QVHdHdXJp?=
 =?utf-8?B?KytvL1Y5ZDJ2bkR4b0NqTXloNndPNkxxc0c3TzhyOXdCNVJUdUd1M25Md2dy?=
 =?utf-8?B?QVkyQ0ZaOExFREtGd0pKcUhGaGxtSys3cG4rNXdsZ1dGdkJneTVqQVZsZmJR?=
 =?utf-8?B?TDdtT0Fyd042NURyZ3VyR1JwcG9Td1hiNFlTRUhsTXpocmpWTStsZ0FWbnpi?=
 =?utf-8?B?U2VVc1lNUHBKMmtpeThlUkNZSW5zRVI1TGhvR3l4ajJ6SkFlZWF2L3c3STk3?=
 =?utf-8?B?cFBoMFpnRDBWYVhEK1piaDJlU3g0dEUydWI4YjRodmsvQXBMbWxNMU11dFdC?=
 =?utf-8?B?MDMwYjFjc1lrQXIwNXExeXpObXZLcnpuUENxM241UVd6UGpnMHZodz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea0f365-b178-4c3a-aa23-08de575f16a6
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 13:31:44.7516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jv4GDTkZVknS5i18l5rFKienY2sfWD5+nqpugzDxH5vptBLzZ8gAwFKxw93B9mraxqwDAnk3EhuoNrwpJmH3JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6129

On Mon Jan 19, 2026 at 4:35 AM GMT, Ke Sun wrote:
> Add RawPtr type that formats pointers as their raw address without
> hashing. This corresponds to the %px format specifier behavior in the
> kernel.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/kernel/fmt.rs | 45 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index 6052d9f8628bb..d023aa00c7470 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -6,7 +6,10 @@
> =20
>  pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
> =20
> -use crate::bindings;
> +use crate::{
> +    bindings,
> +    ffi::c_void, //
> +};
> =20
>  /// Internal adapter used to route allow implementations of formatting t=
raits for foreign types.
>  ///
> @@ -233,3 +236,43 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      {<T>} Adapter<&*const T>,
>      {<T>} Adapter<&*mut T>,
>  );
> +
> +/// A pointer that will be printed as its raw address (corresponds to `%=
px`).
> +///
> +/// **Warning**: This exposes the real kernel address and should only be
> +/// used for debugging purposes. Consider using [`HashedPtr`] instead fo=
r
> +/// production code.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     fmt::RawPtr,
> +///     prelude::fmt,
> +///     str::CString, //
> +/// };
> +///
> +/// let ptr =3D RawPtr(0x12345678 as *const u8);
> +/// pr_info!("Raw pointer: {:016p}\n", ptr);
> +///
> +/// // Width option test
> +/// let cstr =3D CString::try_from_fmt(fmt!("{:30p}", ptr))?;
> +/// let width_30 =3D cstr.to_str()?;
> +/// assert_eq!(width_30.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone)]
> +pub struct RawPtr<T>(pub *const T);

I wonder if this can be

    struct RawPtr<T>(T);

and then you can have

    impl<T: core::fmt::Pointer> Pointer for RawPtr<T> { ... }

this way you don't can use it for both ptr and reference, and you don't nee=
d to
care about mutability.

We could even do one step further and just have

    use core::fmt::Pointer as RawPointer;

so people can decide to allow `RawPtr` to format their custom smart pointer
types.

Best,
Gary

> +
> +impl<T> Pointer for RawPtr<T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        // Directly format the raw address - no hashing or restriction.
> +        // This corresponds to %px behavior.
> +        core::fmt::Pointer::fmt(&self.0.cast::<c_void>(), f)
> +    }
> +}
> +
> +impl_pointer_forward!(
> +    {<T>} RawPtr<T>,
> +);

