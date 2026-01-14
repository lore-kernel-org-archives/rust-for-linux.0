Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020104.outbound.protection.outlook.com [52.101.195.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF5833B6E7;
	Wed, 14 Jan 2026 18:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768417126; cv=fail; b=ThPCqyQoBvRp6wfIsNXxOKQwxvUb6MY10+Anii8Sk9Sl1C9+jSPeTSiyCVz8z8+Ndv7D4W2HmCpYEfZDB3WEHB9nePjzBHCxvC+obN0LJxUQ12qEwom/wHy2m9wfIAy2goPu5HZlTOe3fxm+3pnK1kHAFTXweqszNM3oCkP/+JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768417126; c=relaxed/simple;
	bh=X4YVfq3QbWriRjxHoK82PEsFPA0Jy+AKsCMKeI3XRpc=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=AS9XpY0oY2+z2tWIKUSb0mDjDSGmZTAjl8iqpxAz12+ysHS7mMrXZdzdT263bRkDhBkTtr4Ol/Z1j8PbOXXseo47rXshQo0k/XapoeApa1QOBEr/QdwEIkxQ6Gbk70lNSZTVovQrbRHm+Dy6XPx4cwjBEqDJAEpd03znf0t5a7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YSX5e/UQ; arc=fail smtp.client-ip=52.101.195.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YSX5e/UQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4/k51EViAbEyGJo2TijFdS/lOwJRL/K4oUdcFBqD3YbpM+JSuxLPpkUbH1ovG+E4nBAiUJjrwteBxt12Amni87YaofiC3vGKPQi6OsXL1fQkGFeqcrRrD7XGGDdkUHhvoFsSm8EXBhJ76gkoGssWUMLHf8Lta0PU1q/bGdkTgThbvOpqr8GJm8XrtN1ahBxKTecKguFBS0DIZx8kAkxaPJvMYo9bnI6PcH63pmIaGini3mnMgVCFAEmSEdIAYEMPgpi3j5z6GsV7TDFIbwHhdiB8RrBl0SciSS1sz+u57JgAdtj0XGRHKRPnZeOopuHTEYq42QOCi4Kx1wKg/Z2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxC7IWAkZar2kKs5YdJ3YFoY5jj8WxFp9Gnzb3nsj3U=;
 b=HCUgy6pM2JaOtyf/gwHCbwn3TkG4DxbIDCIpEPFhwNp+MLcQI3AttMPYkBmR9xHhgVI8+IVO6PtT0UIBWSfyvlWfc+f1QYm4N8HNymf3ZNnut064CFMKLYPrzxQfGmAyBt4mDREoM66G05kykrk7V0YIAbO1nq/JhlVO//f9d6hR+TzVunOLRhKennML3kXJTR3IYXSBq/Bh9oXDqkbSrDHCe5y5hVlK3lfrrSayXkgz56ajD6s1+tVPlwx2CNHlZcBkDTnWZ16IKEPhKg3Vz8xU3od2yXKScPTk14CeNVV3QRgkk0UgF7HWhdELDW4HwL87oUDAFmAo39FlAExgDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxC7IWAkZar2kKs5YdJ3YFoY5jj8WxFp9Gnzb3nsj3U=;
 b=YSX5e/UQWoR3E2u+xBJ32EsVXawlht8P4q92NcqlT1Tcc6KU6J35v566llJ0mQJAkIWsSyTMKMVOXr8RBD/CA37KCWbxRi5jmuxaNrLIrOuCGs7uYruMkUhfiPQXiS4tSG/mfgvTteQvBJRDBmijnz3aS6VS9KLzF3aghX8bbUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6219.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:273::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 18:58:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:58:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:58:40 +0000
Message-Id: <DFOJJTV5PAXE.3E5P6MHNX2AC0@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 13/15] rust: pin-init: internal: init: add escape
 hatch for referencing initialized fields
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-14-lossin@kernel.org>
In-Reply-To: <20260114181934.1782470-14-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 10fd86c1-fbd3-4c05-be8f-08de539eeee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S011OWhUMEJLYzdGMWVVVEU2dk5QS3JSMm9NQkxLa3JuYkpEdEYrbWkvSEts?=
 =?utf-8?B?RDcxVlNxcWVrNGFtdVNrUmxMNHBpOHNYVFRJeG5ZN0Z1Q0JLWlBPYWFwWlpo?=
 =?utf-8?B?OTZkVnZhMHJYeW9HYXRpZDJmcTNxRWFiRjFzNEt6WEJpTzQ2bzU1U1krdHl4?=
 =?utf-8?B?ejY2TFRxK3dhb292aUNRelJSWDMyL2pISXlzSTNTTy9QcG5YR2tLWkVRZmNP?=
 =?utf-8?B?OWN6VUlpa0JaMHhpOWlzQWFPVVlCQU1jdStORm54MW9DaVh2aUdIdUkrM1Y2?=
 =?utf-8?B?cVJmUkZUZFE2VkxPWi9rUkpLc2VDMFZhMm5uRVJaQzlzViszZU5UYkFlemZC?=
 =?utf-8?B?N3dnRGpEdURvaHMxdUVFSVNVeUVrTzNzelhtS0lSNWhFVXIyRUd3Tm9SaVlq?=
 =?utf-8?B?MEY5UnFwanhqcXlkV1dSNmJINW5nTjkyN3ZHQ205ak9uTWd3Tm5NcS85dE5q?=
 =?utf-8?B?bnc4LytJWTR2RzY1cS9GQ1FZd205dUM1L1hvRVFNajlLSk9LNkc4VWNobDVG?=
 =?utf-8?B?T05zOWVVSkRtZXI2dC9xT0lqUWQxWml4MzFMdFQwLzF1RHdDTzJoUE1CYXJW?=
 =?utf-8?B?dU4wNUYwR2UrNXp6QzdFSGpETTdad1A4Y2Jyb0FlazY5QnByNjk5RjR3ZC9t?=
 =?utf-8?B?YkpKOFhjc2JDWmhMVGZBV1VDdnhjazg5d2twZDRBT2pZY2loK1BCeUYyWjFV?=
 =?utf-8?B?NFFGRXp6ellCR2NDbVVrUWZsZUkyOHYwb0RRUlJ5amsvN0hpV0dWZnJZcU5T?=
 =?utf-8?B?RGU5N1RzemNjMElXczQrMzBpOFhQeG5yaTVsajhuNklFR3JFVlN1RUJvenlk?=
 =?utf-8?B?MWRvbEx1NkJaSnV0dVJJUjdGUDkwTG1hZG1SNjNibzVUYklyd1d0MTdESzhp?=
 =?utf-8?B?KzNHb0lsOG5GWXhhWkx2T0h5blZSSkxnaXFzYnNpd3QvVEdXclVCVFRFd0JF?=
 =?utf-8?B?aWd3RWlYZ0wvQ1ZScWxYaXAvdWRMS1AyV054U2R0aEEwUVhDV3U3ZXZBaVB6?=
 =?utf-8?B?NGVvS21WUnp3S1NUaVF4Wm5yRkxKR0x3NmZPdFFpVEFLYnlqOVY4b1ZtcStP?=
 =?utf-8?B?UDJZKzZ1cUUxTXVYbklRVTF2aU56OG0ybWdmL1ZmamhERUhDM1N6TzcwZm9K?=
 =?utf-8?B?dnB5a1Y4ejd5Rk11K0ZBY0pBMlQ0WXUzdDBsSlVwTGxBRUN4Yi81RVdkV2Ja?=
 =?utf-8?B?OXhudW1Zb3BBbVhkcjBaQms5eE1nWjNZSFhmOURxMVdvRmdSRDRzS0lhM29D?=
 =?utf-8?B?clBmRXViOHNzZEoxSzNkRk95eFJoRHF3VHF0UTB3NWJvUlRTRkdJbWdRYTFM?=
 =?utf-8?B?SG1XUUZXNUN1WXFvcXhFRHdXcTY4amsvVEYzS0o2a3FaMG0zcjB2ZFZTUTdu?=
 =?utf-8?B?VzNid3dRVDBGT0djWUFWcHlnZk5kQml6Q0FCK05FZFlHTXRVK0V6WXFvVnpE?=
 =?utf-8?B?U3ZESUdGV3JLOVdxUk80ZXZ5TlkzS1RvcFBRUUtSWHg3NDJzcFk0Z3ZnYXhi?=
 =?utf-8?B?SkdtZW1zdE9lcHV1dzVLT2hMZVA4MEtkZnFxMk5QcW84dzE2Z0FVSzVJWmho?=
 =?utf-8?B?M3RpT0pPSnpoR3RxQUhHTE9IM3ZMU1dQcXlhQXViVStoNTArSFJvSlJlWmE1?=
 =?utf-8?B?dGR2MzBSVTBmenV4U0FWNkJRbDdHNUlIM1Q2c3NHYXVGdGxETGZCQUN1R0VW?=
 =?utf-8?B?ODhHNDRXVndhVzF1amlMeW1USERwa2N2dFRKcU01YTJwZmdrOWVHTGovR21B?=
 =?utf-8?B?MFRpOW9lVVdEdXNldzJORG82QThjR2VwZytqYktYMGQzeko0eGZvOHZmWWlt?=
 =?utf-8?B?SWxuUkhOKzk2dTFxOXhwelpuQkhSdTluRFIzdUloK084Yk5GczNvUDBpMHhH?=
 =?utf-8?B?Y0IxSDZVMnMyMWNjZGdlc0Q2YW5OMjFjZm1naFQwZDFlSUwxWnVKV3hVU1Mr?=
 =?utf-8?B?VWgrWGx3VFJvanVIQVExV0tnamF5RzVUUHNsV0NpWWU2YVhaMkEzQ2QzYk9Q?=
 =?utf-8?B?VkVNaHV0VURhNXA5WkVWZFFHblZLV2t2dFZwQlFkK1JkYVFNZnJMQXdpK0dZ?=
 =?utf-8?B?bytqRGg2bEFNMzNaZkNaK0VxTVMwMzRRdXFzakM4NnRZZUtmakFiU3BjVTZG?=
 =?utf-8?Q?9lf8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVFoWmZDcHUzOEFja2IxSUdBWUtTYzNsL0Y4OHZIcTAyWHYyOS9RYXNrclFw?=
 =?utf-8?B?cWFFVnZkWEQyNGZKOW1JNHVTSlNsdHU2L0NORlM2NGJJcVlyaHVCdFpCMVpM?=
 =?utf-8?B?T21WT1U4dmtxdnJlSTdZdE5qZ0hBNXF0MUxpOVhKODZmUXNmTmxxV0plMGJw?=
 =?utf-8?B?VDM3dlFFd2x4cFBrZHdmZzV1S2NZR3k1NjgvVEZNSVlkVVFOTXFCcWxFalpR?=
 =?utf-8?B?Z2RtaDh6eDZWMXBRMlFpUElRRVdCblVYQ2pvQmtjUlh1MzQ4MmFzdWJiQytP?=
 =?utf-8?B?eTZyVUU2Wjd5V3lWQW9QUStid1dHY3Y2WUE4VFh5N1puUzRiVXdWNFN0UnBp?=
 =?utf-8?B?ZmszcGZONFRUYXFHcDUyZzV6NWtQb1ZiSjBIMloxaEtIZUh0Tzh1OEEzbHI0?=
 =?utf-8?B?VFAvaXFnVjZDS0VHYjExMzhxQTNoalZ1TVJnRXl6ZytlYWZ5ZGFieEduenpv?=
 =?utf-8?B?RnMwRmwxb2ZSMEZkdnltSjgzaFhUYTRMWFZWWmlZWUxXQlJLL2wzTnJ2WG5M?=
 =?utf-8?B?MHpobEV6L1hVY00vSkJnWUhDN21mUTQwb2NUZDZ4a2V4eXQ2OVRXUytHb2FI?=
 =?utf-8?B?SkRjcVpkbUl0T1hUTTRRVE82ODNZTitUYWRiVmxUck0zb1N5TmZjWmxWa0dG?=
 =?utf-8?B?ZnMvNm5KWnpxdXpkT1VERXoyMTMwK25kWGl5aTFtS09VSmVTcnovbXBLSlBy?=
 =?utf-8?B?dXVjZjRyY2dDcG15Y3ZQUU9RM0l3cHFlN2FWdVVGRE1MM1YxdjFNUXNLU0Rw?=
 =?utf-8?B?N1Boa1V3RDJoMVJmdnROMG5GZVhIVGczQk11Z2E1WlJGU2dJNGZEMzBJYXB2?=
 =?utf-8?B?U29HVTZxOUZaa0ZIdFJ4RC9uU1RLNDg4NzlIekZCRnorTHBWak80Rmt2Wktk?=
 =?utf-8?B?WGxGNGRNeXRvalVlTTdUQ2NTRCs3SHJxMm5nOE44QXhOTzRnU1BTNmdCcUhm?=
 =?utf-8?B?NDV1YlRyYXkvb3E0MDZiSmpkTmNFT3BwTlJkS256Y3pCcURGWG12NEJINkth?=
 =?utf-8?B?Z2xVT05KUGlDOFB1Ym9NSWpUMzl4OHRsRjRKMXVwR2k4K1crU3RYTFNTWDJs?=
 =?utf-8?B?RTBxNWVrcCtWU2FaVlYrQTV2NTZnR3U1N2ZOQUtHdWZqRDVmMmQxMnNYSFov?=
 =?utf-8?B?Q1UzLzFwUk9sNE5tRXVDcVJURHVlSDV4TFUxK2V4Z0xJUXRHT1k4K0paWXVQ?=
 =?utf-8?B?bFdCZVhmcmZaNWRCREF1UGFDVGQ5eEIyWE1PWDZLSlhhRVg4cVB2T21HSFNO?=
 =?utf-8?B?LzVCeHNsYjJjeVliNlF6UUZLRFhveGJjVUxzK2xUbXlFMVpWMDlxQit1YVJz?=
 =?utf-8?B?RzRCTG5Bb0tDRGxoWkxiaUlBLzZ4bHA4UDg4N0lnWUloR2xNTXVTdVF5NjhV?=
 =?utf-8?B?M2J4RHpFRE5jNG9yQitpUG5sRzJYZVJWTGFYNmZCektiVWZLS3FTeFR1NTUv?=
 =?utf-8?B?Z1pBaVV5ZGtpOGRINjUxaU9tdkZITm94aFh1Mi9jVlB1SUpjT0IxR1lyejZ6?=
 =?utf-8?B?aHp4bkllSUxIVmhYUWRXRHBWWGRFMVM4MjcvazF0alNwL0tycUh3aEI1eFNY?=
 =?utf-8?B?RzR5T0FsYlFkaWhBK1UrN05FOHdLUGJ3bjlwbnZTYjNGQVdpc21ob0tFQm1o?=
 =?utf-8?B?dkJvUEdzSHhlcVpGbnNSYmR6cE1PMTZYLzdtNDRWa3hmSGh1cHRxeWYwVDEx?=
 =?utf-8?B?MFBrWklpd2hKZVZVenNORHFVWUZicCtyVzZGUnlvTkRVNFQrQzF6dEZRVFdE?=
 =?utf-8?B?WEZBQ0Q3ZGVIckZGUklvRnBqRVpDam9iblgwcWtWNHg2WFhtOVN3VjZvcHBZ?=
 =?utf-8?B?SzlBT25mbUVqVUdZbUkrWDdsc21nNHEzWUNDdWZ0Mmt1cERYV05aeGhOMllm?=
 =?utf-8?B?WU1MNEI2dllFL2UrUkI0emRlU2ZFY0ZjTWQzVDEvNjZFSUhiZDBPZSt0OWts?=
 =?utf-8?B?b1VGcGlkU3VZRW52Q1p4ZFowaE1WVFFLWDdCS1N5ajhSQzEzN2JTaDIrVG14?=
 =?utf-8?B?SU0zaWlMdks5Ujd4Tlk5UnBGSnpqa01UTXFQejVRMXdyMy84bFRRTGF5N0c4?=
 =?utf-8?B?U2p6V08za1dNM3V4YitEVkc1R05iTnV6anloTVJnRWxzbi9DU01OSHF1UXA5?=
 =?utf-8?B?L3pUOVJqdVI5eWhsa3NFU08vaWpwM0xMSlZ5UDJrb1lPbHVEWkF1R3d1NkEw?=
 =?utf-8?B?STdIUGhySzA4cUtzVmZIMWtwMjBxYnVuRG83ekNvejVoSzdvekNqZGtsazFH?=
 =?utf-8?B?RGNwajFSbThLVm52eTBUb3VnL2QwN2hkTTNxcUlDMUtzeXdKb3dTYlpuUU5t?=
 =?utf-8?B?b20xZStuSmU5NTU1VzFVeUlrZ2VZYktPNnljS2F4eUZvNWZUWEFKZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fd86c1-fbd3-4c05-be8f-08de539eeee9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:58:41.2019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6K6B7tpYupsaQoDySzFZBb3cocJX3RhPku1U/oIZyw2X2ULc9QVHT1/DXZmhCtwcXKsEuVAEwrf1TaJVzrTYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6219

On Wed Jan 14, 2026 at 6:18 PM GMT, Benno Lossin wrote:
> The initializer macro emits mutable references for already initialized
> fields, which allows modifying or accessing them later in code blocks or
> when initializing other fields. This behavior results in compiler errors
> when combining with packed structs, since those do not permit creating
> references to misaligned fields. For example:
>=20
>     #[repr(C, packed)]
>     struct Foo {
>         a: i8,
>         b: i32,
>     }
>=20
>     fn main() {
>         let _ =3D init!(Foo { a: -42, b: 42 });
>     }
>=20
> This will lead to an error like this:
>=20
>     error[E0793]: reference to field of packed struct is unaligned
>       --> tests/ui/compile-fail/init/packed_struct.rs:10:13
>        |
>     10 |     let _ =3D init!(Foo { a: -42, b: 42 });
>        |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>        |
>        =3D note: this struct is 1-byte aligned, but the type of this fiel=
d may require higher alignment
>        =3D note: creating a misaligned reference is undefined behavior (e=
ven if that reference is never dereferenced)
>        =3D help: copy the field contents to a local variable, or replace =
the reference with a raw pointer and use `read_unaligned`/`write_unaligned`=
 (loads and stores via `*p` must be properly aligned even when using raw po=
inters)
>        =3D note: this error originates in the macro `init` (in Nightly bu=
ilds, run with -Z macro-backtrace for more info)
>=20
> This was requested by Janne Grunau [1] and will most certainly be used
> by the kernel when we eventually end up with trying to initialize packed
> structs.
>=20
> Thus add an initializer attribute `#[disable_initialized_field_access]`
> that does what the name suggests: do not generate references to already
> initialized fields.
>=20
> There is space for future work: add yet another attribute which can be
> applied on fields of initializers that ask for said field to be made
> accessible. We can add that when the need arises.
>=20
> Requested-by: Janne Grunau <j@jannau.net>
> Link: https://lore.kernel.org/all/20251206170214.GE1097212@robin.jannau.n=
et [1]
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v3: none
> Changes in v2:
> * silence clippy warning
> ---
>  rust/pin-init/internal/src/init.rs | 76 +++++++++++++++++++++---------
>  1 file changed, 53 insertions(+), 23 deletions(-)

