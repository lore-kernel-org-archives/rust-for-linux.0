Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022102.outbound.protection.outlook.com [52.101.101.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86318339B37;
	Mon, 19 Jan 2026 15:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836275; cv=fail; b=SbQSOk7Z+4dsSh7Moccg0XtkV2aTaSqBSzpuF6rFBCQTYYG96v2Fofm14ibk37sp7j0PpXcoF52Rb0PH/g+Hg1YWIV2aJpmf0Pknquw/XppKyRXp5RS/I/uuY9OBoelJ9qd/bqbz92+d6ad80Wvb2AgCW9N3/U2NODvJjciW1CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836275; c=relaxed/simple;
	bh=pAXFbSMlNfeBacPuDZxgxgILGKu3xmt/vj3+/PFnvjc=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=HntPu2U/tYb3vKJdrwFUS/kcWjNog1RR+wGvR265Es7UHAPIISP+K1iUbBGgg3GhAO9DP45DjSayZwyQ1vHU49Lt9ZIf33LjWD973JhzJS6BH+CPbUBFeBrImQXB45V+LYH2Gs9aD4s+LWuoDQQYGDA5T7SlCV/tX7y53DQAGLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gkF5iF/0; arc=fail smtp.client-ip=52.101.101.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gkF5iF/0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJXx3JSC6IWLu3hjsd1pLJngcVpUca64e1BjNxrSwvHovjlRr2eVGexc7M8RAGYkjAoj6KBUM7DPEDYUgRmaKxQpd8aKbDNwA02TSiF7n4U80/NlAegAFp+kT2feeAjJPXrZqTAAL7RZ/ZrbcVfiY0NhF9bUsnLyV4vZkQ3oOkzTEcx2l1PPOnpWw8D6pc4OGXJEghCxOOqASMwsAr15XgJhGVEIaMi3p5BBShV1/CxCdeNlZlWbKHM8jQuGPWa9KVTLYv2dwGSkpDkcSg4aQhpSMHCnOEe5Czw5xk8TQv889QFuD3ozP6krZffLXtmBzizYOZzk8VIXa0D51nogNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1WWWVEdQU+fbEgqS3uaNw0+2HIoUIou7ip3RK10uXs=;
 b=Cu9kedvv5d07xy5DDBF2Zopum4hhJB77X9DlhOrb97VZMNcfcrQQDAdh4G2cx7Z63ab9wq2v3UAamTFQ3isbyoaEBzYJBwPSuTe/6A2foHjX6W/siOS2+Sg0hQZiE4aJ8i847ipW6FerhBHTQovyOri8zG3ss6erK4lnsAIp4HHrwDHemCv1Bh/VLqLSGMQNH+6+QBKUyfP5VVJYuoNViy9ZzY/9glP0S6HzM/niN+o9n5ZBF8c47Kqa9C7amGCcWDAA+QuEwLbGoMVCwizEPmrhatjcKk1JuD97ScDiC5G5LK687h/+Oz/+62VV1YdHOPINKmOp1d9QZqDVICObzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1WWWVEdQU+fbEgqS3uaNw0+2HIoUIou7ip3RK10uXs=;
 b=gkF5iF/0K64rNDqEYjWpyxKI30fa0Z+wtOFHMQ09mTfPne2COFHjwcueZoNkPcRtAyR076zcHkRgG+QPqvq7ZvGnqNXQxLp0uY/Vtf6FL1BUXoIAag32VV4WSXK7qhXxJ9TCfRnhVPmMKckckVbqK/ngZAkvjGt8cCntdenpbSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6468.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 15:24:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 15:24:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 15:24:27 +0000
Message-Id: <DFSO4J9WM5BX.1H0OSQEII0KRB@garyguo.net>
Subject: Re: [PATCH v1] rust: hrtimer: Restrict expires() to safe contexts
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <ojeda@kernel.org>
Cc: <aliceryhl@google.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>, <dakr@kernel.org>,
 <frederic@kernel.org>, <jstultz@google.com>, <lossin@kernel.org>,
 <lyude@redhat.com>, <sboyd@kernel.org>, <tglx@linutronix.de>,
 <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <M2M7QTmzyv0cuTcfmp8k-pHEgTa6pOlfONQW596m3-nM_3-fQoakLTxJy7SthiIlT_5I-07GG9On36gsydLT7g==@protonmail.internalid> <20260110115838.3109895-1-fujita.tomonori@gmail.com> <877btdpyz2.fsf@t14s.mail-host-address-is-not-set> <pDwjG06OA4rlC4rEeo6eo5jUcleIUV5jT_SGHgMmJumfm1YpZU6tXdsLV6UgaSBTvJFSVmPCgTju09jyU7Ih0Q==@protonmail.internalid> <DFSL81HEHYU6.8E3YYOXNV5C9@garyguo.net> <874iohptem.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <874iohptem.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: e7bccbdd-e566-403b-3f8a-08de576ed5e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejBDTi9LQjlaa0M3RXNKMzFTdDRyeEtoOGJKbmw2b09NY01haTJNQ1FONktW?=
 =?utf-8?B?VVVIQnp3cXFEc1ZCNnI1My91MVZiRWJpUHVkWCtCRDdoOXE4MURLV1FtSDI3?=
 =?utf-8?B?eit1aFJUbm5iZU9Zdkg2VTcreUhMTVJPN3ZyUW9BT0NQTGNMdHc2Unp2QlZQ?=
 =?utf-8?B?OEtBdjVKZWhlY2tTMmpPd0VmTXNFa1NjeWpEVXMxUGZKOUV4UjVsaHpxV2tC?=
 =?utf-8?B?L0R5a0lXUWQxYVVuZWRTTENTMW0rR0J5R0hjMXVkMm01YmNheUxJbE54cnNJ?=
 =?utf-8?B?TFliMlNEYU9adjN0ZU5mTC8wcnpTcDNWaTV5cVBQVjJ4dzd0NUlacTZMVm9V?=
 =?utf-8?B?b0UyZkJ3UHhKRHlPVithTStNa1lXUlRBZFZ6L0RYamIyTUNBbERLZk5FN1Qv?=
 =?utf-8?B?cFhOY0o3dW5RN1ZNcWpkVU05MWk2RFRlTW5DL01tTEFUV2FUMzY0b05MNmNR?=
 =?utf-8?B?QTBxQ1dsQUxQTUpJOUlSMkdpWUpTVE92dVc0eTAvS2lOcG1MVVhaSkhDRFE4?=
 =?utf-8?B?ZExoOHU4YkZXZVltRTV4OTNUNjZIOWttUjZvdS9JUkFhNVZtS1BUNDFuYzg5?=
 =?utf-8?B?dWtXSVRIR0huUnZQakxGVVdNaGhqcTJQMEh0OHRWaDk4eTYwa1B5NnRqM1FS?=
 =?utf-8?B?UnJSOGEwNTdSWE9YODdOR0ZiMnczK3pTVjFGZDBtditNY2xHN0pRSTVtOThq?=
 =?utf-8?B?aitJRlRRcXhFMk04dUs3NDZlNlNnUFJGTHptV2JDdHlkVUN5Rm5kcHlxekhR?=
 =?utf-8?B?QmlOaEtPRzdabHhWekNta0RvWWlxSzh2ODRtKzJhK3R5aWd6aTJEcE5HMkFy?=
 =?utf-8?B?WVB5Y1VsSmpCTzg4bU5UdlNQakdtZmprNUdNdUVmNVlQK2tjTnB6YjF3UDBj?=
 =?utf-8?B?eVlCQ3pmR1NvMmV4RGR5amlZZTJ1Y2ZOTDZFQVZnZ3BiVHhHWDluYnQ2SGdU?=
 =?utf-8?B?eXdXTmNLaXdidkVCTzRSZVMyNVdqdTlCaDl5anZ5aVhlSU9Xb3FsOEE1WTV4?=
 =?utf-8?B?MnhWMlRlTEZOYUNXblRJejF5eGxsaHJ1R3FHTGpWRkRETUxxSERxMGsyN1Fv?=
 =?utf-8?B?MFZIdERtNkJseFd3UjJFN0xCTkdGaFJnTXI4WURyUzV1Tm5aZ3FaUHZiRDRZ?=
 =?utf-8?B?eUlubHBHNzh3TC9paVpRdFNSUHptbW9GOG9YeGJVM1hQQ0x0SDFmZDhNTDNV?=
 =?utf-8?B?WHFFT3pXVTRRZEtrSmVrYS9ZMm9aK2ZuWEJJa2haWGVjT2IzeWdraHB6Y2xS?=
 =?utf-8?B?Vkw2Y04veG02Vjc0dEhVUG1MbWFNb25JMHlLQmNpK3pyQmdTZU1jQmZLdjZE?=
 =?utf-8?B?NkdsdnJrRTkxeWkzbThCSFFhemlYVTBWdXVhUGNwS1lNdFBTSUdQbElFd2dj?=
 =?utf-8?B?OU1SOTI2MFlVZHFzY2RCTWZGL2tkbVBxSWNPZFNBb1dlLytMZUIxWVJkb2Zp?=
 =?utf-8?B?andLaW5iQWtiUnM1L0NoT0xDVS95TUdSWjZkZStKY1dENVdGeUt1MFNEVjFV?=
 =?utf-8?B?OXY1eSt5enRZYzlmcU9jV3RwTHJpRlAvVWVRaVVQUmF2MHBJMThVbC9GV290?=
 =?utf-8?B?QytyMzlCd09QZXdxZ0Y2NjlvcVhOdXBFbXMrSmRwOG5kZVJ4bmR3c1hSaXpj?=
 =?utf-8?B?SGZvZEpOUGNCSnJQTUk0cXZFUFNPdlZ2Q0pIdmU5VFpxakFKRFNteUFQbnVa?=
 =?utf-8?B?NDM0YzhWc2xrWVB0TitkajVuRFBBOEVsT0l0V1N5djd0VmlDYTN2VzlaZ09p?=
 =?utf-8?B?Z09CV0Y4S08vWkEzNEdDY1F5SEZDT2lLaGhvQVpHUWFGS3k0T29DeFJSZGlT?=
 =?utf-8?B?ek5mdHk1N1lrVUJHdGllc0NOaHlZL2tqL1Q0WHJ3K0ZhaG1HUmNvSjRjQzFy?=
 =?utf-8?B?T0s5R3d5cVRFalovK3pFTUNtYTJFNnFZNVo0UEJTbXpUclZmUHBNamlPRjVl?=
 =?utf-8?B?eVVwY21LRmliVHUxVjNKTnd6VTdTSThSMnM4OE9PbGtPclVXT3NHWFZIS0U1?=
 =?utf-8?B?dlViczM5WUZIKy90RG45eThhZEcrT3lwc3RmQXY1OEo3eXM2clVFQlhJaWJM?=
 =?utf-8?B?LzFEMS95Y0FyTjBNWXdnR21acjNzdmdvZmVRdFRsS2JPUk1nRGtMdURYeVhZ?=
 =?utf-8?Q?aEfg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elJoaERua1dSN2dza2lZNXFhNDZvaHpraFlQVXJVUGNMcXIzeGIzRkQzTWdH?=
 =?utf-8?B?Um5WWWdrYkxVdVhHazdpdk93Z2t4Wkp2Q1B1dWx5WU42aHFlSmVsNCtUcjJJ?=
 =?utf-8?B?VCtxSU4wdHE0dEhocnJ1REVwTVdOUVJaUy9nTGhYTEV4Rm9qTU5SWmV4TzVv?=
 =?utf-8?B?QXFpQ2dMdEQ3WEFDdCtkcGR0cVJ6RHJZRFBTREQ3dDZTb0w2N3RJVk1ETlVX?=
 =?utf-8?B?MDVVU3RqaThvNUdpQmNEK1I4dElNTFIrRXdoUklSUDJuN1NRNjYvM1JGRkoz?=
 =?utf-8?B?cWxOK1ZJeE9CTjcrMGl5c1dQSjd5MzlKUXEwYWFEeG4wSHc5QjhXc3dSTEM5?=
 =?utf-8?B?QXVDSkhDa2FEWkFZSjJ2QUk0QkJLMXVYd0ovTSswVENBMnhjNnc4Zlk1M0NN?=
 =?utf-8?B?aEpRS0lQRE5OR0FWemZCN0pyNVpmZWVKTVh0bjNZa1hpSGxTTjNPMWRDVlFP?=
 =?utf-8?B?Rzc1eTIzZEtHL2EwM3hCQVhuV0ppZ00vUGQxOGxHYnFnbXhUWU8xanN0eXVh?=
 =?utf-8?B?d1Z5WHBQNElaOXRXRnVOd2tJZWFwRTI2YXdoZzFqY2lUY0hRZ25CY1JJTWl3?=
 =?utf-8?B?SGxZaEMwZlR4dnlTdUdhLzV2Rjc1emJhNFAwTDJDaFBxS3ZWbXlGS210SlVk?=
 =?utf-8?B?VElJWi9vbXBiYVFXeHVHZjl0a281YUcrVVd0d1FmRWdQRVpiQ0t0Z0hPejlI?=
 =?utf-8?B?bHNBdlNFZXNPYSt6aGVpbExMNDBZRHlkdkFkdlprdDZtcnZ0U1IyZlZXbzFZ?=
 =?utf-8?B?TEdlNkJDWjJWYUY4dXhiMW1uZmFQWDdYZXRER1Z0a29WMU4vZytMTi9DYkc0?=
 =?utf-8?B?akNXZWtjRkxkaFhQM2p3QUpZUFRQSklJdytWNTJJNTJ5SzlkRW5LMmlWYUF0?=
 =?utf-8?B?QnFVMyt2dE1BaHlaS2s1Nld5Q0pnaVVYaFA1c0l4dFN2TDZFR1haQ1VaLzQv?=
 =?utf-8?B?c3pEdmpWbTY2UkUvaDNTVGZ6Q0x6Njh5UUg5ZHdUUXFVc1p2VW9UL1dNZHBw?=
 =?utf-8?B?VUtvM0luNHNRTlhsekp6UDkvNGw3cHU5dXZpNGRNelJGbzB5c1lWSHZzMkw3?=
 =?utf-8?B?a0xZeVEyT054RkF1OGhZYmd1TmlKaXE3RDh5K0loeFhObmpFZytYVHJSa3JU?=
 =?utf-8?B?Nmp3bXAvQWNnc2hNSlJhTktxanpnaHNRdllxSWR2OVVJT1EwMkVjWG9PVzZG?=
 =?utf-8?B?N2YwdDRVaGErcEEwVHRQZ2VUVk9SQTRTdkpmR1kwVUZDbGJWamErc3lzRERi?=
 =?utf-8?B?MTRWUG5WbWdibTBVSGZ1L1AvOWdUSGdwcTBnSDlJcXBVQnJMc0pqMDFzSUcr?=
 =?utf-8?B?VnFsaGh2RmxrV1AvYlZsb0VjL1IyQXJzMUJBSFlaYnA4dEtHYWcwVjdoWVRs?=
 =?utf-8?B?WEV2bVpYVnUwbWpvODlIMGxaWkUwYWNiZWFERGh5K2ZzZXAvYStoY0Y5SmJr?=
 =?utf-8?B?SDdxa0xIdFZZMWtxTUV4bkRPTm9qTkVTWHFHM2dIcE80RHNxWjRJb0lRK0JS?=
 =?utf-8?B?R0FuelNaMmJCKzRlK2hCdXFtUTM0Tk9za2dIL01RK0FHUFpza2Yvb1lKdmdZ?=
 =?utf-8?B?ZVVxZk5RYjAzV0ZGaDNFWGsxRGMrM0xiOTB1ODRtS1ZmZTAvQmsyaWtOK3Ux?=
 =?utf-8?B?ZWJzR0drQVRrUUdUL1RwMWptQXNIZHk2bUUwZkpqUzBsYzB1dkw2UWhJYW02?=
 =?utf-8?B?akhBNFZka1YrcjhDTm44akFDOU1MN3ZIek95WGtFRS8veVZjUVRXai82MFJC?=
 =?utf-8?B?NEtlaXR2R2N2ck1XNVNjaUMzNmtHaVFTdDBmYTBnbWZOU2dUN01yNnRaUWM3?=
 =?utf-8?B?ZVB0VFhDdW1nYVE2cXo4Sko4eEhSTVNJS2ttaFZHb0RENHA2Zm9UUmo1LzJo?=
 =?utf-8?B?NHc2YzB3NkVBbUQzQWdsMTZYU2xSVW9qQiszU0FhK2w0V1A5enRlMmZUKzVH?=
 =?utf-8?B?UElPakZ2L05DcFRWNng4N0lNeEFPbG5ScXZQNGdlSFlkcTB4dzJ4dFVyQVQ1?=
 =?utf-8?B?OEhVQzVSMzRobURGQkNLQk1mSUNyWXhXWG9xUVJ3eXhiODl3VHZSeTV3VnBX?=
 =?utf-8?B?U04rdEFINmVDSG9lZ0FtamVYb3ErUElITUgxL2JoellGbG5hVE53clJsQWta?=
 =?utf-8?B?bmNOb0J2R1IyUzl0Tmp2bmwvY2l4YlRLendaQUE2cFVPU2RvKzhlWTg0YStF?=
 =?utf-8?B?cXJWbE9EYkFIUTNBWHlMREwzMTVFQVhxbENLZ0xRUml2TFhQdkh5NmxXUW92?=
 =?utf-8?B?bmUvSEN2Zmt3MlRRd2UwaUJuQVVrL0dJRzBJazBCeE90U2NKbEpYWCtiOHY3?=
 =?utf-8?B?cjdHVW1TcGVYdVdkV1pjUWhxd00xN21nS1FaM3NOODE1emtya1VUQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bccbdd-e566-403b-3f8a-08de576ed5e8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 15:24:28.0899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+sPexWz6ciTLTu1Q2MBBV/B/SdU+i+N+YCNZ0WWqMkVjd8K5sieGFJqdMjAX26KgLDKWTlppaRPNXQTxYd9Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6468

On Mon Jan 19, 2026 at 2:29 PM GMT, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Mon Jan 19, 2026 at 12:29 PM GMT, Andreas Hindborg wrote:
>>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>>
>>>> HrTimer::expires() previously read node.expires via a volatile load, w=
hich
>>>> can race with C-side updates. Rework the API so it is only callable wi=
th
>>>> exclusive access or from the callback context.
>>>>
>>>> Introduce raw_expires() with an explicit safety contract, switch
>>>> HrTimer::expires() to Pin<&mut Self>, add
>>>> HrTimerCallbackContext::expires(), and route the read through
>>>> hrtimer_get_expires() via a Rust helper.
>>>>
>>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>
>>> Patch looks good to me, but I just want to check with Lyude about their
>>> use case in the rvkms driver. I think that is why we did the racy
>>> implementation originally. In C we have stuff like this:
>>>
>>>
>>>     /**
>>>     * drm_crtc_vblank_get_vblank_timeout - Returns the vblank timeout
>>>     * @crtc: The CRTC
>>>     * @vblank_time: Returns the next vblank timestamp
>>>     *
>>>     * The helper drm_crtc_vblank_get_vblank_timeout() returns the next =
vblank
>>>     * timestamp of the CRTC's vblank timer according to the timer's exp=
iry
>>>     * time.
>>>     */
>>>     void drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktim=
e_t *vblank_time)
>>>     {
>>>       struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(crtc);
>>>       struct drm_vblank_crtc_timer *vtimer =3D &vblank->vblank_timer;
>>>       u64 cur_count;
>>>       ktime_t cur_time;
>>>
>>>       if (!READ_ONCE(vblank->enabled)) {
>>>         *vblank_time =3D ktime_get();
>>>         return;
>>>       }
>>>
>>>       /*
>>>       * A concurrent vblank timeout could update the expires field befo=
re
>>>       * we compare it with the vblank time. Hence we'd compare the old
>>>       * expiry time to the new vblank time; deducing the timer had alre=
ady
>>>       * expired. Reread until we get consistent values from both fields=
.
>>>       */
>>>       do {
>>>         cur_count =3D drm_crtc_vblank_count_and_time(crtc, &cur_time);
>>>         *vblank_time =3D READ_ONCE(vtimer->timer.node.expires);
>>>       } while (cur_count !=3D drm_crtc_vblank_count_and_time(crtc, &cur=
_time));
>>>
>>>       if (drm_WARN_ON(crtc->dev, !ktime_compare(*vblank_time, cur_time)=
))
>>>         return; /* Already expired */
>>>
>>>       /*
>>>       * To prevent races we roll the hrtimer forward before we do any
>>>       * interrupt processing - this is how real hw works (the interrupt
>>>       * is only generated after all the vblank registers are updated)
>>>       * and what the vblank core expects. Therefore we need to always
>>>       * correct the timestamp by one frame.
>>>       */
>>>       *vblank_time =3D ktime_sub(*vblank_time, vtimer->interval);
>>>     }
>>>     EXPORT_SYMBOL(drm_crtc_vblank_get_vblank_timeout);
>>>
>>>
>>> Also, we got some new docs for `read_volatile` that allow us to read
>>> memory outside Rust of any allocation that are not "valid for read" [1]=
,
>>> meaning racy reads are OK as far as I understand. So the original
>>> implementation might actually be OK, although the number might not be
>>> correct always.
>>
>> The wording is for MMIO and should not be relied on if the accessed memo=
ry is
>> C memory. Also, `HrTimer` is going to be a Rust allocation.
>
> Why do you think the wording is only valid for MMIO accesses?

Because it is intent for this paragraph, and is mentioned in the text. This
specific text is introduced to allow hardware MMIO access and the need to b=
e
able to access otherwise always-invalid pointers, such as pointers to 0 and=
 end
of address space.

>
> I guess you are right about the allocation being a Rust allocation,
> since it is allocated by Rust. However, the value we interact with is
> behind an `Opaque`, so I think treating this as a non-rust allocation
> should be fine?

No, it is not. Opaque cancels out some alias requirements but it is still a=
 Rust
allocation. Everything that Rust code interacts directly, and this includes=
 if
the allocation is made from C side, must stay follow the usual rules.

>
>>
>> Even if we don't treat it Rust allocation, it's also only "fine" in a se=
nse that
>> you don't get UB for doing it. But the value you read can still be compl=
etely
>> meaningless if the updater is not atomic (it would be valid compiler
>> implementation to, say, turn a non-atomic write into a write of a garbag=
e value
>> and then an overwrite of the actual data).
>
> This is exactly the behavior I expect. In case of concurrent writes, the
> value might be garbage, but in the absence of concurrent writes, the
> value will be correct.
>
>> I think the usage you quoted is just wrong, as on 32-bit platforms this =
could
>> well read a teared value.
>
> Referring to the C code above, it seems like what people in C land will
> do is read the value until it seems to be stable yolo ahead with that
> value.

It is non-obvious to me on why this code is correct. The updater seems to d=
o a
hrtimer_forward_now and then call into drivers to update the vblank count. =
So
in this sequence:

    CPU1                 CPU2
                         first drm_crtc_vblank_count_and_time
    hrtimer triggered        =20
    hrtimer_forward_now  READ_ONCE(expires) <- racy read
                         second drm_crtc_vblank_count_and_time
    store_vblank

you will get a teared read of garbage value while the vblank count is stabl=
e.

Best,
Gary

>
> Not saying that this is what we should do, just saying that with the
> updated docs for `ptr::read_volatile`, the original API is not UB. Also,
> I want to confirm this change with Lyude, because I seem to recall there
> was a reason we made this race possible in the first place.
>
> If nobody has a really good reason for this race being present, we
> should of course just remove it.
>
>
> Best regards,
> Andreas Hindborg

