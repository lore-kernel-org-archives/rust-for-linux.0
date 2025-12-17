Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012022.outbound.protection.outlook.com [40.93.195.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BF1256D;
	Wed, 17 Dec 2025 03:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765941368; cv=fail; b=iRQGwNsGCuA82J8wVikVaR2g9Z56jmgZPyUXJ+++PvmsF6lxj2IG5q936+lcBjzNwSAqCUHHvAEtVN3g38T2Z0Oqg0ZJAI0YipLcg2SlrHlZUZKke/AAFHbTSId1KhkNfn1IChIoz1wOKHA/HjunAI2G8A+E1pXkimulfpyLKLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765941368; c=relaxed/simple;
	bh=HHijpDRVlnnmAXmOpoPqg09O+QKtHQiNy5l/o4GFamA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pnlkV+G8a+ZdqRf7Geb8BqfLBum1mC3bf8KDC48OVjMxEe+g9oBi6HmTBeAMNg6Sm4XzvnINJqP0E7HDsV+gPQEWtvSmdkRvPWMd1N9HsLEbo7xJclNbZS0JjPDes6wsBkloO1qAYsj3SAqP4uHTq/bObhr2KY7rnGUXEgAKjZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X1L9spEZ; arc=fail smtp.client-ip=40.93.195.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X1L9spEZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBnHjpXNUXJJ95q2wUcZAlTP8DtO2sAJsPYIr+80ZQHqImFH9c9oTq8phZb02TmH/kzQu+kLT7eRFQbnEG0yV6iPzWTxWnu+D00di3hdyf5M7eYSKoOKBWhRER4NwCcpo1mtmzEbG5qoWooMfdbUIN5x9HcrRLJbkSMALLy1PVzgnOAUmwMbIyLO2BxXzxQ4LQzqJrTyYPXMBzdB3ZXmuV9Oi5H7M9x5M//33SDz2/ECD5GECwm2zWb8NoA0LTj3pf8S/DTWTDJsIWiHFEW9jLNr+8JzNaTLwW3NjWjUwAiWhk7hMuvI1X35G6hTgxT8poaQVThqC5Tjr27nvBCRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdMZPNsDvHs6yFGHwCqj0XoBRmRJu3zkSkOV74J3FCc=;
 b=mC0HCtfqawx8TKHH/bHO+uOpwGUBg1PWSQj389ugNLynwrfuLqTHOa8WDtl8eKrAI9AMRAwE75poBfeGX9auEeiH9YmUGWaN4cK+mLqnDWa6WcLTF1zpcH2OH1ZCuJkFnnNfp8dDS0X2nhGYWnddeK5BtgQp+itM+BP+atSZqBPc9Hfs6bnh9x7AY19FxDkf+B1RQOiAjrjy4Mrx8rCgQCsRwZYyLfbRrKejEi5hLm0OlndrVJRWaQIv5uKLe9rx5paZ1wPbHgI+7UFYbq3vF5424apE3ZsYNNvCmoroYhpFVM8BlnolDjGUoFrr93wog8Co8U6L0i4B2WyqUdcLEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdMZPNsDvHs6yFGHwCqj0XoBRmRJu3zkSkOV74J3FCc=;
 b=X1L9spEZh5wL/CGhBgpExRTUGFbZayGgg33rh7yyvc6FEUQHKmAnR7FYcxinpGJspiAxgIIwXFccpCl+ohUfH1Ma9aqmyaSY9+aDxdsrpGe79M1kTk8cwY+DCZ5eTfEQ0PQgvQNOYg23cVyinWeMUl+vZ7XNOAJTC6VvmOvhYdaZly8hGu60CaHw4zKb+i4i882WjHioTzoqKHbkuF0GL+clreSqFTKpu51uPMgOQ7sF4XBINiZDUH8w3vErmpzuOINfnNYmVpPtRGw1JrJ7wcU0aBTAzAeaTU78+A/CvNgtL3AU5ObLWTJ3GM4Ohdhp8W321ALUC+rlbptkfHJ8og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6388.namprd12.prod.outlook.com (2603:10b6:208:388::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 03:16:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 03:16:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 12:15:59 +0900
Message-Id: <DF05YSVN174B.XRTT5CHPF0N0@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] rust: Support deriving `AsBytes`/`FromBytes` on
 bindgen types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-3-b23e5277ad02@google.com>
In-Reply-To: <20251216-transmute-v2-3-b23e5277ad02@google.com>
X-ClientProxiedBy: OSTPR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:604:220::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: dd2d0371-c487-4916-7e3a-08de3d1a9c12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkZOQ3lKM0lHNzN3ekRCY2tMS0lSQitYYWZSUUdyb05wQmZsaUo2RHZZbnlr?=
 =?utf-8?B?VTdjQXhDMit3WS9ZQjdCWjYybUpUa0VRU0pONXF6VWdsUDVGYlQwaU82NG9k?=
 =?utf-8?B?bVViVHA2OG16RExCdmJQaHlQZ3R1Q0syM3A3YWxoR2dJS2Z6UWU0eXN2RWhI?=
 =?utf-8?B?aGJLZHQvTERyWFlpd1pOQWw5aWRtdU9ZYVVST1JMZ25PMDBVdW1naGJ4SGtv?=
 =?utf-8?B?VjNUNFBDc2ZFRXFxdmdLU0JjTjFuK0h4Vno1eTVhais1UUVZcmZUUmFvc3pZ?=
 =?utf-8?B?U2o5d2k1Z1J2Zi80N2dxMkJCbVN6d0ZkWnFoOWVjcmhaNmVUaWxVKzlPSFJj?=
 =?utf-8?B?OGgwdXBZSnZNYVdRaWhPQ2RINGJVNHdaRHRqTHJVZXlzcTA2NjY1N1diOHdU?=
 =?utf-8?B?T3FlbzdRbFRkcnNMdzg0TjhjbTVvWVBUOW91MzRZVU5sN3gwRjJnK1ZPaEQw?=
 =?utf-8?B?Q3NHLzh3S0FCSkxIR1V5T1VVNWRNUFhmbEZwMy9wNDBkbDYzdm9ISzFwWkQ1?=
 =?utf-8?B?cDVXcktpMnVsSkRQOS9BNTM4RDVjWEs0STBTKzhIc1NZeld4VENhNkhJQ0lN?=
 =?utf-8?B?b2NrY0paM3JqZVZNbEQ0ZXdvemt0UXZtSEJCcmhpVjlyTDdPTkViSTBrNHgz?=
 =?utf-8?B?WG12UkhUQnlpdjNkZFBEUU51SXBqcjd1aVUzVk9oS0JzM3hTWlFqOEVpNmhl?=
 =?utf-8?B?RHBsamw4TkZzNmk4c083VFVqTGZmOG90Q3Z6bzlzOFk5L3c0dTgxUmk5RWJW?=
 =?utf-8?B?Wmpsekt1c2FMT0RPNCtzeGxxSmk3VlBVYnhKK3hQTXZxa040VWRCa0FrVFR4?=
 =?utf-8?B?QnI1VWp6WHlSaDNWRFpyTTc1NWVMVU9RUHZlWFFKdW4xSVliamRKQU1vblhQ?=
 =?utf-8?B?bUR5dmI4K1djMkQ1Tzh5eTVDdDZOVGhjSzd3NUZtdUdHQlZwdHBaOGN2NGxT?=
 =?utf-8?B?UVVZMzFWOFgyNDBZdVQ1bC9Ld1l3eGRlU2dXYUZvYWdYaE0wSHNUZDdUM0ZN?=
 =?utf-8?B?d2swTHB1SStLcUUwdllQK2sxcmZvZ292WDYrdk5qZCs4L1I4eDBRcmtYTVVU?=
 =?utf-8?B?aytVaFhzLy84Zm90bGhVNW9ZcnF1eDRuTEszdzRjTHE4UkpkTUIrZWVRREtT?=
 =?utf-8?B?clRZOXl6RnYzVHRiMW9yUk8rMlU1bTZVTWMzSnphT1MrVmlKTEwwZVl3QUha?=
 =?utf-8?B?VnFwNENnaXd4K2xETW8zbEQ0OWN5dGUwaG5XeDhpOEtTZXJtbjRSeGttREFq?=
 =?utf-8?B?VlFjakNvb2FRQXVoNkMvTkV5WHUxR3U1TU9yZmVnREprRlVDRmVkT0NYUG1T?=
 =?utf-8?B?MmpYMElEcjBESHJ6aWpUK1dqMjFGRlR2T0djNzI3Z1p3MTdPZWlPUVNmVkx0?=
 =?utf-8?B?cmE2MmpXaVRSdEQ4VzBPd1E4MFBpdUgrd0c2Vm40SWVOM3RxZHpHNDB4aEk3?=
 =?utf-8?B?bGpzeUJqcUJIUWNyYzhqZ0ptRDRyMXNKZFJRaFE3UUJxRmovMDIxQllpRFlC?=
 =?utf-8?B?M1VuWXpMYnpjRkJ0SWorRUVqZXV6NDI1VXdnaVN1UlFBS3ovQzVxbUVtWVdo?=
 =?utf-8?B?R0d0dnpQTzJ0UEorMTNpeHVYL3kybGtrWVN6RkNjMEhyVG9yc2xHOHoyRDhQ?=
 =?utf-8?B?MWEyZXZFL2ViWnI3aFpFRThxR0hMMmZlY20waENUc3VRZUFtY0FFWm5nWHZO?=
 =?utf-8?B?YXhTTVRMOGNXWjlGTE1tdE9OMGp2bG9paTNPcFNRbVE0VmIzRVR6UVBQR1hP?=
 =?utf-8?B?b2taaTBiVnpMMysvM1JBQlQ4SVY0Wm1OM3d2U0trSWZEdFdTaENOVkdyWUw5?=
 =?utf-8?B?S05Kemt3TUM1anNvWjhCSU1jMnRSK3RtU0hNRlRJQjVvY0NNNCtldEMrOXA5?=
 =?utf-8?B?RmRJSGxQaU95RENIaHNiZXhiOHBncUJVOXlCTmVoZnNKalRyV3ZtNlBNamdH?=
 =?utf-8?B?b1M4bkcrcXF0dUFnWnRWOTNiMjJmR1BtZ1F3WnJ5SjBJZDd2K2IxajIxU0d1?=
 =?utf-8?Q?EvtWLc87UP+yW91OvAhbb72z1ZVacY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGsvY3JrY1VSRFpZeWFEdmtpYzZPL2NrZ3E4UmpTVjhoWEJnM1ZmRFNmR1B2?=
 =?utf-8?B?UWZIR2JTM05aZ1YxSHpad2N0UHBwaFRhYWJqMXJoYVcyMTZLWnFNQm8zMGxP?=
 =?utf-8?B?aE8ybnE0SG1DV01iZW5WTEhoTWhUVFp5UXpKaFFNbjBrNHlsZHBuUFRjcTRB?=
 =?utf-8?B?Z2JISldTV2ZGd1VzRG50a2lmS0hoZGJOWDdLNk1IUm96QWRNeEJIQmJTMEdO?=
 =?utf-8?B?cURxRFZkRFhqSDJ3d2ZlbERQd3B6eVpJNDNWY256cFJvdk5qMnFSYmJtL29W?=
 =?utf-8?B?RUlmaWYzSUFHQ1MvWFliQVcrVjB4OFFuQk9wSm5KLzdvTEp3WUlsSmpaeGhq?=
 =?utf-8?B?Z1VTY0s0aXdqUXVaekVWZDdRbXczRmUvaWZ3dHNrUGxxdUdNczZXbkpVM3Rp?=
 =?utf-8?B?eWRJZTNzTytxNURhMW5SZ0x2YWxNbVhEeDB5Nmw0eU1NTm40M01BZFZXSzc3?=
 =?utf-8?B?NmQvZFhZcC9FT0VLMk9ieGZQZGJsbStvWlFRUEIwSDFWcVdKMEZibHdYSHp0?=
 =?utf-8?B?WU8xSFpweDNGbTlRemtGalI2M3JaT25EcldGL1k4dnZ5ZkY2OVErdHQxRVhV?=
 =?utf-8?B?aUxiYlc5eWUxMk1PS3VPalFyd0g2dnFkdnlBSGJ0RmZMMG1yL0JwQ1E2RGdB?=
 =?utf-8?B?T1dGelE4TThZZklOdGhLcFVoOHhxa3ZXZjJ3dXFUQjFibDIvbml4YlZjeDRh?=
 =?utf-8?B?OWVWS3VoWmhEYUFjRDJ6WEE5Q3pLUkNCb2dYTTFqc0lnTFdQZnNzK3V6ZUV2?=
 =?utf-8?B?bGhyMDZ4UVFLamhJWWxrbS9lbFdsOGltYWZOM1BtUVViT0l2UzRXMzhrL1VP?=
 =?utf-8?B?OGRueWducUd4aE1XeVpVSWtpSlptUVRLcFJTQm9YYmdCaGlFTnJycXNsKzh3?=
 =?utf-8?B?bVNwSGJza2ZqUmQyOGt1ZlNLMGFvRXhwZmdWRG11bWF5eU5CblJEbG9mdUg2?=
 =?utf-8?B?Q3ZSVlowVmFrN0pzUHY5WnZrUC9MRjRLdDF3dE9hMHdrUldKR3JiOTRPbnpQ?=
 =?utf-8?B?b3UybDdidHJkNlF5cFljbXY4NWM2UWFRVWFCWDlmVVBzQWZXMWZyQitPNVM1?=
 =?utf-8?B?NUVQRFEwTkxtVHBZcmZLcFkrNEg4SU9IdzJLMlIwd1RMdVNTdldzSjlVYUc1?=
 =?utf-8?B?aGtkblB2NVNHRFVGaXB2dzl2SVp4MlBGL0xwOVcrdkZnQS93WHJTOGtRSnVR?=
 =?utf-8?B?SENwZTF0RldtejV2RFUvMVZRMmUwUDNpZmtNMWFZWkdTeldnUWluWFkyRW9x?=
 =?utf-8?B?K2ZwZzdadjYvcDNnUjhhZFpwdEloTERWZFBvdUpham5KSy9LMjBIaDI0U1JT?=
 =?utf-8?B?SWQ5c3FJc1pzODgwRFJrdGcyVmFvZ2JiZzhOVnBwK3NEZllDaDFkOWlJcnEy?=
 =?utf-8?B?NjdZWjlWQTlybnB2cWZuNHptUlJtcWg0WkFDVU4rN2JsWEo4aFNxdS9pa1BN?=
 =?utf-8?B?Zk1YajZOSE5ZTVluWjNlZUwvNmVGYlVvTjIxdmlKYWtncmRsWTEyZkw5dFR3?=
 =?utf-8?B?MWJOc2Q2VmFXbmg3UG01bkVhYUdUZUo2QXFacHpLNFNYSmNDZGF4aHM0dUJD?=
 =?utf-8?B?V2J4RWJIc3ZtMkRtSVpVOUJ2djJIRW5rR0xqZ3lCOTRhWFBsTzM4em81Sjhp?=
 =?utf-8?B?NEF6NEhtTGVkdDVmdzJCek5POUxxb0liYUYrZGpzcXRTYlJmcVA0QmRwK2tK?=
 =?utf-8?B?TE5aOEtwZ2pjYVVvUWV1Ri9ta2tPYy93TjBOcUlCL3ZtbTlDWld0ZW0vNXpJ?=
 =?utf-8?B?dVBJK01rSjFzVHE1SnE4QW9jajZ3VVNUNk1VbElDdXo2eExYa2VYT1ZGR25F?=
 =?utf-8?B?NXF5UHNtdW4rSXVZZ1pBMjluVU1aamtRSXFZbGNUNGVxZlM5M00xSWMwcDlC?=
 =?utf-8?B?U0E2QVpyQUpsNkZVRVhJbEVEYmJBODhDV1NQdkJJSmhXc2tLRGVuRW9rNUsz?=
 =?utf-8?B?cWF3dXJXWEJnMHpCSG8zT3gyMFN0ZW5NTFpjM25PN2lsU2xaUmNXNnBFRkxa?=
 =?utf-8?B?MGkvSlhrOUViQWMrbDlWTktpUlRSWlAxTWdGOWt4T3R6bEFWdjVZYmx5NXo1?=
 =?utf-8?B?WUhMMCtlWkVRMXlvWkNZbnlKbnViZ2d3Y3ppNG4vb1B2MEpNQmFPcWp1NjlP?=
 =?utf-8?B?UGwyQXhGQXltMzRvWjVhelQ1QWZhZGFKRFVxYjZoSFF0OUlLd2ZNTGJkd3hJ?=
 =?utf-8?Q?LGyD5XsRyGEPgauP9d2gZ+cWSBwSYOZYetYVSi8Yzguy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2d0371-c487-4916-7e3a-08de3d1a9c12
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 03:16:03.3953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNuvAeGiAGRbpbGYLEHknBAjkXay90VzP0cxOcsNnh5fuvHHd4aX8Kmp0YNVtq8za2MrhH2rNHSRQUFCwVWoxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6388

On Tue Dec 16, 2025 at 9:44 AM JST, Matthew Maurer wrote:
> To support this, we need to move the `transmute` module into a separate
> crate to allow the `bindings` crate to depend on it. Most user code is
> still expected to address the module as `kernel::transmute`, which is a
> re-export. `ffi::transmute` is now available for use in `bindings`.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Maybe this should be two commits, one for the new crate, another one to
introduce the ability to use on bindgen types.

I have tried this with the Nova bindings, and somehow could not get past
this error:

    error[E0433]: failed to resolve: could not find `ffi` in the list of im=
ported crates
      --> ../drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs:321:54
        |
    321 | #[derive(Debug, Default, Copy, Clone, MaybeZeroable, FromBytesFfi=
)]
        |                                                      ^^^^^^^^^^^^=
 could not find `ffi` in the list of imported crates
        |
        =3D note: this error originates in the derive macro `FromBytesFfi` =
(in Nightly builds, run with -Z macro-backtrace for more info)

I do have `kernel::ffi` imported in the bindings module though, so I am
not quite sure what this is about. Any idea?
