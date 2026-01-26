Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020110.outbound.protection.outlook.com [52.101.195.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68656E55C
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 12:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430180; cv=fail; b=YXOIXak8GDyfu4bUMOX/0Ep9tLKGZQPCr1yDHQyHpEPIsT2u60FX5IAIkXhZBT06E9b6NF7tXoGtVTmeyPsZd1wd56P/ZOKBe+Vl1m+D2ntT1CmdSB1UajVS6zIXAVXytIj55vnI1R4XVdfs2g7dOhBN1fdQmEUV2OZpPVQYM24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430180; c=relaxed/simple;
	bh=s1gOUxR9Ec/PFHipxID8QkPZqaX9Xl/G6+6DAdkEScY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=c1W9v7+xHNKyS88U4Fd/+ZZJ07pDOrpavzd0riqp7jjAZ6tpWBUXYnf0Mtki2eMVC5/pT/o2V2I2InIn2erULCTCevwb0KawAo0kWA9ElEMoFCA8Tw5gzdJ48ja6eSq6x/2yGj1fnhMO4ZmsnZ6CS/9LncjBIyyVJ1aB+vPMJXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pdcMmdCh; arc=fail smtp.client-ip=52.101.195.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pdcMmdCh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7GsNHaaEYljsaIj41gyZqA8IlFhIYkWjWL9VfMifmJTCCd4nDn2Aj0PjmnotU1fvPTurr8U/+NkeuU+JwfBMdVWFsukLov9TWatMQsxAoOSezEs0O1Zz0gUT26KrJ6nnq2QljWCZnekl7LbKLyc8gwOzPPOG3fcMyDKfoNCWXDesh4genJoSFAE9Lpf7zxhhUoYzi2gaPny633brOLTI3xaNdpW/ztRne7wGc+J64xjvjBihR/OJndZEaOEWGTTA7ilUgYtgEwtljXeZ+j8YvY8Dh7oDEGaJvA1T8NHdsCwVXpdFz4XW6y5Iu1tNWURIopE+fQr+S2wlEJKBcC+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFq0OH7SmTgkubHbQkE+hxaPGRdhp7L8E7gYasEVy1Q=;
 b=Evo1xfNALmrzHZiretCvyqLZmlsOk6S2EahmjU8qn2lgWgWp6ZgegP290MFgJUf0d3vQlOklhaFfVMspEzquch7Q7TPfYNKPP9wshUA69zL3fCwxgU8ikYOS+MSt+SPjV8f6BCtVZowB9vkE8meJooqWH5BD3wCiQDvwXcKmKR/ACzjIzdh8hOJXDSG8o1c8TEuTesuD5Xn1Sd6ty58QkEgPPWclr88SqULDCc1csp+CLsHo7CRfV5UD5OfJjItIHHfd44w41pnwwe1Cm22SOfm9g5m7gAJ/mwGJvwRtVfsBae8gDwemtc44BauQk8H5RykokHFr2XnoAoclMyCNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFq0OH7SmTgkubHbQkE+hxaPGRdhp7L8E7gYasEVy1Q=;
 b=pdcMmdChpnt39F+/1HsvK8meBzlWQvF1RBmXJ+nwj6WLdzij3UW/lrvWTP2vHs+aBheuWVX3atAGPSpTO/P8rxjRJfz6yroPRibc6kkVi0dI3rYbD+a7ou6Tp8JWWylD2BJdzbEo4+VdBWcrl0Ic1h/elqn68D+BvTr5dtiyHJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3297.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 12:22:55 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 12:22:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 12:22:54 +0000
Message-Id: <DFYINCGJDR0N.2OYLEZKS3HW1A@garyguo.net>
Cc: <ojeda@kernel.org>, <boqun.feng@gmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>
Subject: Re: [PATCH] rust: dma: add missing __rust_helper annotations
From: "Gary Guo" <gary@garyguo.net>
To: "Dirk Behme" <dirk.behme@de.bosch.com>,
 <rust-for-linux@vger.kernel.org>, <beata.michalska@arm.com>,
 <gary@garyguo.net>, <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260126071738.1670967-1-dirk.behme@de.bosch.com>
In-Reply-To: <20260126071738.1670967-1-dirk.behme@de.bosch.com>
X-ClientProxiedBy: LO6P123CA0048.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3297:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a4826e4-122b-4079-d5e9-08de5cd5a1f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2ZmOUNLRVpyOWNGczVVOWd4YWl4cmd1cS9XK0NxV283R1dJMmxCck5zSkRh?=
 =?utf-8?B?YWlsRTNkc3NjajU1N1pMRFRTZ3orNlN2T2V1M2VLSlVxdzkrSFI0UzZkb0Rl?=
 =?utf-8?B?aHlRMUhOQ2tBUTZzckUvOEJOK21ZNUc5UW9MMVNYTHVBSFVHOHY3VHcrT3Ix?=
 =?utf-8?B?U2hvSHplUW1lWTd0KzM1K0J5NUh0MjlkYnAyM0JxUUlNejBwWGZOV2xySTdY?=
 =?utf-8?B?QjRXa3BBcXdPQ2kvM3Bya3RIWTVxeE1scmcyLzB6QkpucGQ1MVppVzhwN0Z1?=
 =?utf-8?B?ZENvV0loUjN3NGVlOU1PM25CU1lucFVxS1o0T2hxOG03REJDc2VVOEE0dnE2?=
 =?utf-8?B?VnUzYTJUQlFheXFWWnNvN2tXaTRmR3p4QkNlODNlMU01aG8rWFdtamtvcjRu?=
 =?utf-8?B?OHpKdXVVTzVIZnVOQ0x0eVJYNGE5d3I0d0Jld0hrTE14T29EcFIwOUV5Y0hl?=
 =?utf-8?B?emhIZ0VlUFhIOEVVeGxMc3RtcG50WXk5VGp1QVA4WHdrUndzck56WnZBSmRv?=
 =?utf-8?B?TVlCYVUxRnk5N2ZWdUxwbjBvWlhsUTRUV3JxcHc3cmE3V0gza1Bvc1B2RjND?=
 =?utf-8?B?bExCaVNFTU0rQ1RRR0c4WVliU1dzd1RyTWlOWXJydk9TRFEvdHU3Mkd0bkpj?=
 =?utf-8?B?bGl1MEt4TkNETWwzWkpVQlNpQjdOb2tYYnNxbVJraWZGMVdvdVNodDlwUWhP?=
 =?utf-8?B?TzRxWnZta3Q4QTVZRHZQd2VsNHFHb1BORGhVclROK2NKbWwvd1YyQUhMWDUy?=
 =?utf-8?B?bzNnSEhmaTJWcFZjMkI4cFA4anBqeitWLzFNeDhKQ3BhZGt4YXF4dzVCMEIv?=
 =?utf-8?B?d0lCcU1iNTVBWlk5MEFrbnJod3JvU1Nranp5bFVmbFZ6QzhEc0FadTkrdjhx?=
 =?utf-8?B?dDIwQmV0TW1kRDkrN0czTkpaY0pMajFVMzI2Z0hGNGUwOTR1WlMwUUhJck5I?=
 =?utf-8?B?b3NBSDhxR0VmTVdmb0ZpZVJ1UVFJaUd5UHFpOEU5Smg5c3dWajUyREF4bDhM?=
 =?utf-8?B?UWZ5V1BnK3d1UW0wakRGZlZLMndBQzlkQzVoOVFxbWJPT1Q5NlY5YjZDVjM0?=
 =?utf-8?B?a2FFbXN1QnlVbU1zUEVCTE81UlhuM1luc1JtMU9QUnJONFBOMTMzbnBxMEM3?=
 =?utf-8?B?TllLaWVBaHl4cG4xV21peEd1U2VaRWhlYUlGdkEzUCtnSWJ2b1UwcCs3bUpy?=
 =?utf-8?B?S0IvL3hZYXM4cno0WEQ0Z0JIVnZ1WG1aeEtxZTZtN0NTZzZMQmxjOW8rTnFZ?=
 =?utf-8?B?MGZIazdaWWZoT2I2WEFoUXpZY1ErS0lZb0JJTEJtME9obTQ3cmg1NFFpSWtV?=
 =?utf-8?B?UDU0cUEyRTNXcmVyNVlJOHpSVzNxQi8zZ0NBdGdNWkpDN3JORzFtNnhyTkNP?=
 =?utf-8?B?MUN1WG9senQyMk1uZkt0NTlQZUZVYmpIWlhCUGxnVWdFa2hxeXU5bEtOMXNM?=
 =?utf-8?B?N2dBSXh2dTlDVHVUbU9YUUJOMFYyaG5zRWxxU1o2djc0TTE5OEY3NDNPSWk0?=
 =?utf-8?B?QmI1UDNlejJWNTduWnNMYXZmWVNmelExcURkMnFPeHVabTc5T2xyTUYrRDZt?=
 =?utf-8?B?UXBoWHBMMkZCTU9XbWlTZkJiRVA3ZlRqQ0lVdmcwSWZyaktUTXgwNG55cGpE?=
 =?utf-8?B?TFFoaTRCcm0vZ2M2VWtXSkZqb2tJaElIOFBGenRnaWRtZ3J5QWIyZUhRRkVS?=
 =?utf-8?B?VjdYY1hsNTh4Ti9sTHFGVmIvaStUOW1LTTBWS01hZW1FWmhpWTR6ZzNXeFhy?=
 =?utf-8?B?cW5zbTJ2U0ZNR3dNenNqQVNBQkU3ZmVNSWdwTFdOQWMrMFgrMFl0TCtKS3hP?=
 =?utf-8?B?Vlh5L042ZDBlRGJ3OWhERElsQ0l3OHhRR1hPZ3BhYjM0Umt1dkJPSW15azhC?=
 =?utf-8?B?VmYvTDlZK3VQVnE1QlYxNDVGWXZMdmY1bXpnMlRLbCsvRUc2RG1hVEVtV01M?=
 =?utf-8?B?WDRVdjZ6K1c0ckhQNE90anFFd1Vrek9QYWdIaTBPYUwvZ3YrWk0zM25GTlk4?=
 =?utf-8?B?VWE4WkEzVkswK2ZuS1h2N2JHVmdHQTBxR1plb2s5Mnd5ZW5WL2R5UENlS0ZM?=
 =?utf-8?B?U3ltK1RGek0ra0JZc1VFcDF2Z2VCL1Qwem9sMDBoOWRtNUxnNU1tU0x6Wkx2?=
 =?utf-8?Q?Z1bc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkxTVFAwSmdab3ByN0dFVXJqNTdjR01OQnMxVjU5NjdhR0ZWYlNiVkdLUFJV?=
 =?utf-8?B?cHpmOE93QitvUytwVUg4ZVE0eDFxNTU3T2hpK3haNzZCa0hvQjE3dElwaUtn?=
 =?utf-8?B?bk5yZzI1eGhnTVNzTGNlZ3VlVjJwQmQ0SVR1RXVnZmpZNStkVCsxbWl0eXZv?=
 =?utf-8?B?UGJXQUZNb1JKd0lWREpYZyt4ZzdMUlFIWFM3a3ZhSkl0ODE2dkdNYS9RaXpD?=
 =?utf-8?B?SmROam0raWFBWW9nMzZ1SmhLbDE0Vm9vWHRObDZYeVhlV1p0ZEpEeHJHWHYz?=
 =?utf-8?B?dm1CNENFMlJUMmlsd2JVVldTL3dpRHRhSk1yaStVK1BFV1hqWkI0Sjl4MGl3?=
 =?utf-8?B?ZEVHcTB5eVowUWNwMzJnTGFPWitySGVQclR0OHpmL0dhbGZNdzRxa05Da1hz?=
 =?utf-8?B?alVQL3V6ZzUvb21rNER0MDNpdkREMGFNYzBkTVk0YW8xOFdvcnJXaERoVEdG?=
 =?utf-8?B?KzNZZlE5eVhNVHNOT1ZXTXNnSzM1U1ViQ0ZzWGJNdTZyNlAvRTVxWStpTXR2?=
 =?utf-8?B?RFNHYmc2eDkzc3h1dVB5MkRrY01FbjRZWXRvUmtmWXZ2RjRtdE1nVXhTMEhq?=
 =?utf-8?B?ZlVDMnVIWFRsVkp4M28wcHZBN051Sm9yZmtNNHpMaUpIR1RNcHExMEo3Rncv?=
 =?utf-8?B?UGZmUmFTckJ5d3V2M2hUeG1HZ2tBTCsvNkxlS0tkVjZmcjZBdjhYMmMwcU9M?=
 =?utf-8?B?TW1DY3pYTVpvYmVRWXduVWREbWxrVVFvdUFxK3dsOWhCVWtoRldnVmNudjZC?=
 =?utf-8?B?WjdwbUlMU1ZUTXBFRUtwekVNeWlETSszYkRDZ1lNWnhISjFDQncyS05iMFJz?=
 =?utf-8?B?TXlVZk01NEZ1eFJtSXZ0K1lEMEJ4ZUdpTkJZS0JkOGZBOG92R2s2K2tibHhl?=
 =?utf-8?B?ZmIxd3dCVE5ZMlFITHJDMlhSbVlYNm9RSWZpWW5LVFo2NXJRckFnNkJ6UmJC?=
 =?utf-8?B?ZWp6YzNrTlhaU1ovbEsyREdPNnJIeTAyck9hKzRpTkltMXAzcllhZGpzbjEv?=
 =?utf-8?B?YUVFK3d2c2NteUEzVnFVNjdMeHNCK0c3OFlSZnVzajZ1NVAwVkR2aHFESEVv?=
 =?utf-8?B?MW9mTlBYa2pGTTdoWXc3NHhBcUpSNlZ0UGxLRi9CY3JrS05PMlZnM2hOTGx4?=
 =?utf-8?B?K0sxVTNsWkhRSW5HT3owSE05cHl4dU5PTU5iWEREYUZWVWJNNG9PSmJHb2tP?=
 =?utf-8?B?Kzg5eVorZnB2MXRuenZRZmh5cEtCTzd1TTF4WHI3akg5b2NrcUp2NVRsbHVE?=
 =?utf-8?B?RjJveEtSS2srYzZxdFZTeG9OLzBBN2tmL3BMcDAwQjJ1K2MxZE93eStVdFZT?=
 =?utf-8?B?WDJxSjYyem9GNDR6VHlYOVV3a1N0V0RvQlI3ZVpEeVBSd3BUQmZyQXA1WWNF?=
 =?utf-8?B?RU50SG1UYUtnQmU3RHRLVWtGNXBJOXN5bjR4UUswRm1pOFlzVWN5SlRHNWsx?=
 =?utf-8?B?UzhhcU16RnUxNE1qOVpQVEpQNFArcDR0SEVWMU9jZTZpQ3J1T1dLdUI5MzB6?=
 =?utf-8?B?elJ0eTlDdmxGL2pqRGpmdmJrUmpTa1A1WWJ1QmI5TG0xYTgxRDBOV1VPOHk2?=
 =?utf-8?B?SnJwN3ltVXJjOU45UnAwdnR4K2NINGlrY040NG5oRGtjSDhpd3pOV1RVcWpv?=
 =?utf-8?B?ZUFndnc1TkFQTTdNOXNnclhNOEtmMk5oRG1FOVYxS1hJTVFWT2FkazZueTJ2?=
 =?utf-8?B?MHFFVHVjWjZrY0hJUVBMMlprRTNoR29XelM0aVRvT0V3SEdWbjlPQmVBYTV5?=
 =?utf-8?B?V3FObVZQcXNxVmJWZGZhNEtUR3dDdmtQenE2djZaeFR4M0VCMTVIQ0FUYlJL?=
 =?utf-8?B?N1V3MVlPcTZjQnNtRisrZVhEaUxwNVJzS2psRkZEMzhiMzFhdGFLeEJkS2RE?=
 =?utf-8?B?dGdVc2ZNN3lCU3cyc0VqWHBTQ0xLckYreG5HTUpmZFVUOThaSDVNSHNDQ3Jl?=
 =?utf-8?B?SHp4czN3cVczUGN3Z3prRVg3emZ6bzJPSnVyR2VNcnpZTWYrUVlOOGxkYlFX?=
 =?utf-8?B?QW5hL3JRTlY4SlFxM0RrZlR4ZkJRZ0NIZ1laSGdoTTNaaWUrOVpvck01clJ6?=
 =?utf-8?B?eHlvd3NucVUzQ0MwQ29UdEg0M3FiOXV2eVlJOXBXUGVVTEhuYVN2UnU4elhi?=
 =?utf-8?B?ZVlGOFhwMVZlVmxUZ2VVdWZwQzVFUS85cXIydm4yL1psWHkrK01VbjZoK1cz?=
 =?utf-8?B?SlYyNHduNWROcEo3L1pKY1Zic3YwRitLRnJQZytra2dBaW9CRWdsWHk3ODBH?=
 =?utf-8?B?alRmU0x0RzkwSDAwS0IxS2JFYkowYzRhWU5hT0hoQWJsN3ZPeUFkOS9PR0RG?=
 =?utf-8?Q?hNw/rEYFEIrtmuiMNN?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4826e4-122b-4079-d5e9-08de5cd5a1f7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 12:22:54.9081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDkQLgYdX0Va1as+qAH01hUkwt8GV2TTkwUllntIeBeYUsKfaeegEr7RpZQUXNlxP9SU2SC/ZWl2ZTOEHytqPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3297

On Mon Jan 26, 2026 at 7:17 AM GMT, Dirk Behme wrote:
> The commit d8932355f8c5 ("rust: dma: add helpers for architectures
> without CONFIG_HAS_DMA") missed adding the __rust_helper annotations.
> Add them.
>=20
> Fixes: d8932355f8c5 ("rust: dma: add helpers for architectures without CO=
NFIG_HAS_DMA")
> Closes: https://lore.kernel.org/rust-for-linux/DFW4F5OSDO7A.TBUOX6RCN8G7@=
garyguo.net/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Note: This is against linux-next.git next-20260123
>=20
>  rust/helpers/dma.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

