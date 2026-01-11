Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020098.outbound.protection.outlook.com [52.101.195.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89282853EE;
	Sun, 11 Jan 2026 21:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768166721; cv=fail; b=bhZET9WUnwr7AZQ/b/ajt1GwAPuWVtfeTEu7fwXF3666gy6PBAhncArgNlSSedaEFwFYRsXRER9F1WRp9lawboeBuFf8RV+SK0ZHt/nPOWO3tpkn7Q2jfodIIBCuOF+Za+3I8lcYVoEIMM74tnQ6XZ0FbsHyM5iJ2I5sTiWY5q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768166721; c=relaxed/simple;
	bh=+kRZ01hcJulf78Hcu+cZfN97EZG/wIAiwMf3DsZgyhU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=e9tsb9qgm2wTEvMunnmVXBtg+C8yyZ2yicB58It1ciQYdSuAS+RbG0E+EUlLqisFHD7YI4hJTFZ+ffs+DfwGsnGvQzD6wBQ6qVNIxkwef/VbMHZiFvBhCJtk3bJ7ABibMhlkJC1bbp50nQLcrc9MQXM7EwOSavwhAQOv1yvx0TI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mXL0lmrb; arc=fail smtp.client-ip=52.101.195.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mXL0lmrb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4Zn3/aWrBnixjHPpJRchof4tVtagKd1HwN3bOBTs1W7gZomsphVeez4zXaFst2dwiYNoqleJTCFDmKb2si2/IZXVgY6Kh5NN7UIORGeClnby9v/BhwQ1IHcFsg92U1amTtK8jtDA6VVdBjd1IZ/fSOh6/mElpaW5CMzoOQ5qfSMWRD+NLkFYJpv2/9B/mbCgYhgYGRzMqgvFk6Ec0sG3faC0JYF4JKo7D2YEDQ5TiIr9ttX6iDxV03S2fXn/QoMEhBmy3X4Sa7COh/utnj12rDkFK7kPPUM+Y+2W2mO6WAbTm8Feq8Ov4SE/uezEK23fI2uKu2k1PxtD/vCbf0jdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPxIidbLCl6/GPG05xbLE900nPcEj9RFTDS6SUvyClI=;
 b=JurQn+was9Gp3uABom4U3NMoQVUNlYm5QIGfOO8k4TLWa+jAP6Md+XOgUv1nThxqCzzvUKcwJckrBpN/yY1TXVfV7x1j8xpw4u+Geo7RBjm09CkuNe4qDtcgKSXYsB/A21ZNKVMDRsJ0PxEhDK4roHjgbqNZMDySL0U/dBsGnhJskbSB6X7o6WqoQk5C1p8h9sMHakuERHTQiI/HOV8NIVw2CKTWAc7xlf3ccET/zyBIr5XsQaZpT46c7KP6BDOWUVIZSQjtkmVRU4q3YO5Eq2dq1O/5+sxVZLH8txgIjc7Q25c80myef2s7bT+ztQZa1uUmt2ysEl60X5xVHyrMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPxIidbLCl6/GPG05xbLE900nPcEj9RFTDS6SUvyClI=;
 b=mXL0lmrbt31SoOqd6iBwvQwIFoLVm5FKIFZBvlRl/GLRWQFcv/p3Ltzdno9cMfpm3eB2mGEyvDw7sHUVNK4BOVHRgTQZPA7qfZsce63dH4fxxsZ6Ms7PqAWU8F/Yo3HQhIzF9tYQpwL7zpjC56IgZ89p4hm51fdehVFHNoDts84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1942.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 21:25:17 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 21:25:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Jan 2026 21:25:16 +0000
Message-Id: <DFM2SFY41ZGJ.BRG25XOZEFS@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 03/11] rust: macros: convert `#[vtable]` macro to use
 `syn`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Tamir Duberstein" <tamird@gmail.com>, "Igor Korotin"
 <igor.korotin.linux@gmail.com>, =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?=
 <jose.exposito89@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260107161729.3855851-1-gary@kernel.org>
 <20260107161729.3855851-4-gary@kernel.org>
 <DFLX8DNUAIJM.K5WFHHKGTWPP@kernel.org>
In-Reply-To: <DFLX8DNUAIJM.K5WFHHKGTWPP@kernel.org>
X-ClientProxiedBy: LO2P265CA0142.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::34) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1942:EE_
X-MS-Office365-Filtering-Correlation-Id: 140d9126-eb9d-4f01-200e-08de5157eab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGMxcmhlNGgwQkZKeFgzbmpKTlFwRS9CaDBUbGw1STd2L3JPK3hlWHlJM3ZE?=
 =?utf-8?B?R05Oa1dlTmVQc05KMDZoclVtK0wzMFFaWmlSVnFKWkxZWjJYSmRZS2NUU3lS?=
 =?utf-8?B?MWgvdnhTck1DMEZ0c2pqR2pSVFh2WXhoWXJyaEMwVXZ0MGRaREZQRWY1MUVO?=
 =?utf-8?B?NytZdDZkU2ZZZW54K0lXV0k5TVRxSklvazJCS1EyeFFvU0lLV1JjWlJtZHBL?=
 =?utf-8?B?VlV6Y1NpdUJ5V21QRFlhY09xY2xaRXdJVmtldXNmcUl6UjI1ckIvK2w2MjdY?=
 =?utf-8?B?ODdRZ2FtQVEyRDd4WnhodHFTdE5adG9tVjdzc3U1eXdTS1I3YU5lcWU0SnpF?=
 =?utf-8?B?UWMvWUxCb0VuYTRSSm41eWF2dHd0NzhnWkN0ZG03NlZUeTVVbk13ZEVFbnhJ?=
 =?utf-8?B?RFRlZkp2Y1YwOGxJbnJDaGFtT244R1RjL1hPQXJNSW1jK0RhclVPeVpDNytu?=
 =?utf-8?B?UVYrWmtaY2lwMndBUGZJM21WRmtrR3dHbUx1RGh2dzBEOVZObzJIOGFBWFZy?=
 =?utf-8?B?bkE5azhuaytLZUpPQXdTZjNVSXM3SUJaS0E4TW1qY3h3QWQ1TkdNdTJOb0Jw?=
 =?utf-8?B?YThOL0V4MzhQWXcyOUlPMk4rdmFJYkNURFM2dXptL1hyZjl2cGxYbHRsVDQz?=
 =?utf-8?B?TS8wTlpzcjlDUWFGcFpMakZIZ0F5YTBrTDlnanhQVEZyZWFRNE0zZ09SU1Fv?=
 =?utf-8?B?TWFSMUM3cldjcGRRZWV5empabDc1OS9iK3ZCWHFRRzM3cFdSMUZXWWJNQURE?=
 =?utf-8?B?eFlqU0RZVkV6Y2ZnVkcrU245MC9ZMyt5dXFacGMrcCs4OTV6VnllT1JFelM2?=
 =?utf-8?B?M01qWHRTK21qMnNLamlDL3VFY3grd3RkaFZNUTlPUWZTSkh3K2ZCOWFOT1kv?=
 =?utf-8?B?TVdGcE93azUzajBWbDBiVE93b25ZZkNjSlJVSGpUNmJaRWlTcUFWdlV4VHgx?=
 =?utf-8?B?RVhKdEZORUdCb1BBdi8xenNPYnRxb1MwR2lYNnUzYXdBL3hEMlhVZ25BTkhX?=
 =?utf-8?B?SGRRM3M1SXFtcnh2L3BBemF5cmFCTVE2OExSb0Q4Z0dPdk1GN2R6bk9TVWZJ?=
 =?utf-8?B?eTdaMnVLL3pJZWRMQVdaSWxjampCcW4wVVdYamM5M05WNUdqMU5YZVoyVmo2?=
 =?utf-8?B?WWp3QTFNVS9jMzFWMWJyOW5iZk1IQnJOWEg4ZHRVeUczS01QakdLWVpFd01X?=
 =?utf-8?B?KzBhSU9OUGVZdUhyOSt6QWFBdFVJTkhQTWZ6aThreDlKMHdlajJncU5GT2h3?=
 =?utf-8?B?aG11VVNpRlZQa0x4OVllUFhsR3hEcVlHYjU4NDlkTEZhNmpIMUpWdU5Iamty?=
 =?utf-8?B?QjNRYjk5dmR6cGc3Y3paNTRzR1E2eEVDYWJ6YjR5cVNFVFRPMjZteEFLNE9u?=
 =?utf-8?B?bkdYNnNxeWNLeW9aK25QNFZIbEE2ZjZsamdiS250Q2J5Wmt4dWNtUEFCNnox?=
 =?utf-8?B?bFEzOHZFVERGWE9wU3pnR0FUanhyeEFlanMwM2VwVnBNdmptN1JPOHo4UWRn?=
 =?utf-8?B?S3Bxb01BVy9UOXZ2ZUUyM09nVFYvV0REZ0ZBRHA4SzJaNXNWRGN0eDhsMCsx?=
 =?utf-8?B?SHVkeEsydkwwNjh0V0hhK3hLVldvM21WK0lzcXVubTR3NWtNU3ZXemdXNXAr?=
 =?utf-8?B?djZaN1FJS0FzSkdQTXZMbnJEdUh6MUx5d1oyWmVaUnRsNDlCbHgwbHI1RnNh?=
 =?utf-8?B?RmNrTUM2disrMmZKNzcvZjk4ZmVEcXpYMkJPY1FjcXdCQ3F6UUkxSmRkaW9q?=
 =?utf-8?B?MWltbUpBSUlDcDFZR2ZVc01POW53b2FvaDN5eE5DZXhyV1NaelhjVHF0M08w?=
 =?utf-8?B?dm95L0d4SEFhek5GcTI0SGZRU0RUMXhuSlRaVnpEMkFCNHM0TGQ4ZUV5UC9C?=
 =?utf-8?B?NDRraWVKa2U3bVVORzM1TnhackljWFI0Wmt5QVhNQitybkliaW1sSEpLejUr?=
 =?utf-8?B?OUY1cENYeENDaE9Xc0xIejN4SWU4aGZ5cnVESndKL2xZSFBjOXJad28xb0p1?=
 =?utf-8?Q?jy8AKUpyDGHZvHnXd4WBg9ECDBBlI4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blRLVnBuMkt1U0hiWkcwUG9YcEd1WnVlaEJXY3VEbEl2aDBGVjc3RmI2eGNI?=
 =?utf-8?B?Y0NnaW1Cem85MnZEa0VNek5tdWpHNkZiTk5qVVpEVVM0MXNzMkVlYUlyWjRr?=
 =?utf-8?B?bGUzSGordEZ6Snl5MW1OZnEzUjMvd3U5UVdnMmtYWTBBOWQ2c1lZcVBkd1dy?=
 =?utf-8?B?b25qdDdoVnUvREV2Qy9NSHNUVSszUEN6dXVrVmdGaTJSS1ZMWkJMWHV6NTZE?=
 =?utf-8?B?UExic01YVW9JOVpnSTNYZmx6VVdDYUZOTk9MWTJTQTFwdDRSdUkrTXpVVU15?=
 =?utf-8?B?aThEMlpDTXRZaG9vLzRxQVorRVgwd0xuZ1A5cVkvVGlVcE40bnU0bnBSbGpS?=
 =?utf-8?B?Tm9IZ0hPMmd4NlZYN21wV0lKWFRLRitlcE1zbi9YSDcydXR1cGVSbGp3Q0tP?=
 =?utf-8?B?M1RSbWhlR0w4M3Z4bHJmUzFrK2wrbU5FSFBGZk5aVEhmd29raUJBUmVCc0lv?=
 =?utf-8?B?NFBKWWdnd0ZZQnhGS1B1b1RhNE5yVXJhSkNmTVVOMUo3YWwrWmFtWDNMaTJK?=
 =?utf-8?B?YitNNHAxOVV0cnJYODBzaVBJd2hxcU5Ib3ltOXlPcFhVeGVTWS85U2g3NzBR?=
 =?utf-8?B?bFBrdE52b2tDYmtidVhkOEZmTGJ6aExQcmRKanl1eEwxVmZkc1FtelM0cU5F?=
 =?utf-8?B?TlVsR0krV3JGMzJDNHFMbzQya3VVR2V1NUFaaTI3MVQxMUxMYTVNU2dmY1RP?=
 =?utf-8?B?aUUrSURaTDc1QzJNWGREdEZtZXA1dCtneHYrR2pGbUVpWjVMQUI5L0FmU0wy?=
 =?utf-8?B?dWhPcFJKWndEci9DZ1hjS1pyZGxocE9LNmVRSVdFbGtSNm5RWDdNT1dyUnNR?=
 =?utf-8?B?c2l3eEFuRU5YOE5tTW5LVWl0aHZ4OSsvR0ZmejhERHpDcFJhR3FmSnM0Qkhx?=
 =?utf-8?B?VnRmeHdCcS9MZ2NJT1VVYjVYNUVhRTlad1lPSlQvTnN3bWE0UG4xdnpOSm5k?=
 =?utf-8?B?N3ExSGtybWR2bG94WGd6bVRyaVlRSG1Ua29OWUpEcXJwcEplNzdwMWFrWVg1?=
 =?utf-8?B?ZUVJSW9aaEVuN2UwV1ZFRGxKUlB1WTRaNXJpZ3lCY1NSZlV0azd3Nkw2c1FL?=
 =?utf-8?B?YzJvQktndTZUVmFmWUxCUmQyMDFJQkowbUd5UC9IK0lrSXRRZXBNZjh6bllR?=
 =?utf-8?B?YnMvRk9EZEFOOHZGVEhQdi9XSjhIWEp4VXppNGIzbWRtRHM1bTFycjZJclZt?=
 =?utf-8?B?WVFwNnJ2SVVjSzY3Y3MyK0J3a29hcGZKS0NkZ0NsamZmWmo5VC9FL1N6TzNT?=
 =?utf-8?B?aEFtV0NqdWp0K3JrUXluK201bGY1cmJ3dlh4Rnh5WC80ZUFxZVJaV29oZmxj?=
 =?utf-8?B?d2F1UGtDMUtDRjZUZlZ6V1AyMlpJVkVhNmtMTUZZUTBRcytQZ0Y5MVM2RmZT?=
 =?utf-8?B?WWFhZVNIVk91RFIrT1dWMDRSNTJFL1Nvai9URk1QdHNhcVNObHRHb1dzN25z?=
 =?utf-8?B?S2JGcmYyYTJlazc4Y3pWWmFBVzloZ3FuaWI5Wkp1L3JUSTlFaEtGSFBrVWo2?=
 =?utf-8?B?cGoxU1FVMC9pRmMxQzdWTjdrazR4aFVZTVBLaThldGtRTFQwemJIUWJhUDBz?=
 =?utf-8?B?K0c3T3pOeGJDWUhGeW05Qk9haTc3ekVsTVYvV2tsUmxDdWdtQWNBZ0hWU1Vk?=
 =?utf-8?B?ekh0V2Y5MnJiQk5jNTA1cCs0blJURnNNSk9NNWFxcTdlUlVKcGoyRjF5bTZW?=
 =?utf-8?B?ZVVGcVg3YVVkTi82ZWpEa2pnYmdZc200M01lUytiZHp1RXo1ZmdQbFQwZzR0?=
 =?utf-8?B?T1NlNHZ1RlNuN1dXbjc0V2pFTlljWXhjSWszY3ppalljNFd5amFkUUdwbDZX?=
 =?utf-8?B?alBrL1RSUDd4VzAxb3NaYy92cFpPWHllbHlnbVNNbTJzZUdCc0pxbThTVjJD?=
 =?utf-8?B?VGpwbEpEdlFNRTRNeGNnelV3OGJrNzNRLzJFUFpWRFh2TTE4eitqTkFnL05i?=
 =?utf-8?B?NWlSY0QwK0Z2a2xZbG9taVR3M3V2TGt6cS9jNmJNU3pDZUp6eHRMTjllbmEv?=
 =?utf-8?B?bmRicTRuUXg2dVlvRDlPQ2Rmek1FMUFuMXRBZjVWYWtOQUVzZ00wLzMxVHQy?=
 =?utf-8?B?bDdyRVU2RmUxKzk5U1RuaFdNeTZHRnBxd0g4YWNzTmtsaXFTbFBvSHNXR0xF?=
 =?utf-8?B?dVN3ZFdVZ1Yyd0NadFFjV1Y2NCtVeDN0b2UvOTkzVEg1bmptbE5WOW1sWVJr?=
 =?utf-8?B?c2lkOVp5QjVsL0dqM0ZoQzd2TWp5VmtUNFUwUDFJVnZIazYxcHppRW44Rk84?=
 =?utf-8?B?T0FWY3VOVFZveU5LRWp3MGlQMnhRSjIyS3RMeVFZdXVHbVp2d2N1OWxGNEtM?=
 =?utf-8?B?QlRHZi8yTlI3NGNKK3VHZHdtZE56TXJ0UXh4S1hpZXIxOHpzV0tldz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 140d9126-eb9d-4f01-200e-08de5157eab7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 21:25:17.6048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KQBueCY1L0VLaoqK2dDoqX8k7rlMoD7m7BTGz8Ro2UtW/VNtNRcOBNCtzxrp9T9QMcFkR0HzwuVTMrV5dCD8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1942

On Sun Jan 11, 2026 at 5:03 PM GMT, Benno Lossin wrote:
> On Wed Jan 7, 2026 at 5:15 PM CET, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>
>> `#[vtable]` is converted to use syn. This is more robust than the
>> previous heuristic-based searching of defined methods and functions.
>>
>> When doing so, the trait and impl are split into two code paths as the
>> types are distinct when parsed by `syn`.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
>> ---
>>  rust/macros/lib.rs    |   9 ++-
>>  rust/macros/vtable.rs | 163 ++++++++++++++++++++++--------------------
>>  2 files changed, 93 insertions(+), 79 deletions(-)
>
>> +        // Skip if it's declared already -- this can happen if `#[cfg]`=
 is used to selectively
>> +        // define functions.
>> +        // FIXME: `#[cfg]` should be copied and propagated to the gener=
ated consts.
>
> Do you mind creating an issue (probably difficulty medium) after this is
> merged?

I've already had a patch for this in my working branch. Following Tamir's
suggestion on how to change this patch it was trivially enough just add to =
the
series.

It'll be included in v3.

Best,
Gary
