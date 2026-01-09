Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020111.outbound.protection.outlook.com [52.101.196.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD5F328B47;
	Fri,  9 Jan 2026 13:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767966753; cv=fail; b=q/sZYf3/Ud12hRHySpNwt2nM2ESh3rsG/QWInWg9ij96uxRgCilOg503X8ETq8y1b8iZLtTVTuxJ3lykAVNVVGbVR+8ZkIL4GMUbMX5m6CbsjrzG04G4DQzzw5j0dBD9RNJCsEiZIaoazYTFXEDp+MzRj9M6yxgND/HO6Lid9j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767966753; c=relaxed/simple;
	bh=9g8yd0Z6SDk+O42gtMpGZkITjAgLBLR1I+iDBUwxf9o=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Hqdm2Vak0Af+4xUHXbbIlBxhOCpn2pnriuGN8PQQbviwx2b0rvKmurq4Yx5gS4SOZZsaFSf7deY3pkF4ar6V/3GVRK37IyObY+LWkyJc76f/A01S4gQD9PZ4tGBU+QszMVxBH26Xp8FJb55HG7NYhp9HhnyJTUn8DxylZihs3UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ElD0Ao6x; arc=fail smtp.client-ip=52.101.196.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ElD0Ao6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOWcX1SJLaaIjCux4mqbRZUrbzZbNoduTgWR310uk5YwZkP6zHxFk53YixxttRFKE17ORF2YnaT7axh0q4390qfwEsNKbVc5oqKNSWdJIKayzs0LbtPswMRjLZtyp/OR5sCxdFZKR/+pGieDxAK9Xr/632l8hI1Q4hPka/pBmofFn94RX7Vfqtas3gF1LOSD5tZZTOhEhuj7S9d9+4Q7H6tgU3wLZXUnGNJE1bc6leXm3G7fpslTh60oJiiSGPaJiaxV8Xh0LxVmjwgJZLHHUqtEhvw7K6QAhSuWEKRXPC/I9y0mw7HFEhE4jw3U+bdM43ZfDWKeSymVl+5eB63pRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvu4zqRLdXQm2PJyJy8CWJnMY3ugoBmO/x7KLRhA84s=;
 b=r6y+d4v1z7qiKKLUncXbG3QdDuAxBzoaxXmzedQCE/n1TnMxRcTWqSeL98Ar2OMCDxT60gsOLP/oaYnIRUoZFHN4PkKFeiDCUF2Cdyei+fyVQHzwDyYWKRBbZH2PMppVkOSi+1l7hwN56ZXXtv7pdMCA8+rsl1TYHu3ly/2O7gYvBRnE8wnva4HWrn3GDExqtYPnIL7dN3fMfwdv/xyPvqbWsFOf8zBrv2xxvqOB/VALamSeNcAVWiJZvDX0RvTNQd+B0OMaILHn0ux0LTbO/Owhl77qF3HQZmhoHnT8QLpkgD2qYBvdRarvpE83y34U+dDCp7UHAiKlBbm+fcLlbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvu4zqRLdXQm2PJyJy8CWJnMY3ugoBmO/x7KLRhA84s=;
 b=ElD0Ao6xjD4F/FDRIfxNOG8C+NWqTXo55TabBWgAiveGJhIKw+9IIqmaaxJyfgLZTD1uG13fdV7WIDlAg4QwI4g8oLX81OxouHzmRWzVRtDSwsuyHzbxHN1GRZUp6wACYYb6DcGm6JaF7T/cJLt4yewd1pIzRy0RJuhMgKNQ52s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3160.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 13:52:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 13:52:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 13:52:27 +0000
Message-Id: <DFK3WN80DXEF.28VZXRATOJ4A8@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/12] rust: pin-init: add `#[default_error(<type>)]`
 attribute to initializer macros
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-10-lossin@kernel.org>
In-Reply-To: <20260108135127.3153925-10-lossin@kernel.org>
X-ClientProxiedBy: LNXP123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::30) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3160:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e85ffb-d6e6-43e0-156b-08de4f8653ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|7416014|1800799024|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkZRby9tc3U0S21jYk8yNFYrdUFjTE10UUo4U084cHhORlVKYmpNY0pCK3I0?=
 =?utf-8?B?ektod1VsQTlJWVVXZm9pdjM5ajJMWGRpRDRSaE54RWgvOFZ2ME1SblNDREhN?=
 =?utf-8?B?OXFON3pidlhYV0J3b3BCQTZhYVJ1RzRqN2U1cG5Ka3VsdmRRU1M1K2Q1d1pX?=
 =?utf-8?B?eUE0a2J2eDRld3p3NllOdU9oNkhhbDNmTWRlaTQyai9VTytZOVZsa3crd0Jj?=
 =?utf-8?B?Z0tNVjZDZ1I4TjF4VnZzZitGR2xKRFBFd0prKytvQllWcUV2UDhRdVdLNStE?=
 =?utf-8?B?NlVOcitEUFBOU2o1V3ZmazRyUXc0WGRDOGdIZ1RWcDA1bEZWd2ZZZGI1S0pT?=
 =?utf-8?B?VUszV0V4Mm8wbStXTkZITnMxNG5Gc3lnQnR5aG1xWUtieEU1R2JQdlJ1am1u?=
 =?utf-8?B?LzUrT1ArS0hxTnJiUHNnNzNlK004a1Nyd0VJT21pbzVyL202WStvWmJpeDRy?=
 =?utf-8?B?QmRXclZzR2FJWkp6MkhId1NLdXlCUFVVaXpHU2FUK3NQWUFDWUtOVjN6Y0Fx?=
 =?utf-8?B?OHBsdkVOUUhkNlF0L0YwYVZaQitjc0NYaGUxdnJmOTIrMFcyNTVzbXhxd2Rv?=
 =?utf-8?B?RUFIN0JTMFROejZaSzA5aUN4S0tRdzY4S3RHMmZwWkVEWWhid3VaQkJBN3Jz?=
 =?utf-8?B?QlY3L0g1K1pMVVlncnpreGxGWWdlNUhjNGlCMzMranphall1a3NMVklSbUls?=
 =?utf-8?B?LytScEVBNEh4Z3QxTmFRS0VLTFlvYm1GK2VIazJzQWV5YkdJWE1oc0w0Qk94?=
 =?utf-8?B?ZEdyMjBvS1UvM3lQWjcxTVd4ZkFqdlBMdzhleTg1MHFpaGdiaUpjaFNmaldN?=
 =?utf-8?B?eEVqS0ZxRmFWQWJVSzJyS25mTjFlYjBrT1lRRTFKWERJVTdYYU03NGF6S1gz?=
 =?utf-8?B?K3UvQWJjYTFYdnQrTTBPTHZRUE1SOGd6S3gvTzFSK2g1N1hqZnVOY1M1dEY2?=
 =?utf-8?B?U3BaWnpRQ3M4eDVqcTFYN3hhN1NhRWdxM1B0MlFMUnhydVdKcDRlaG5sb05m?=
 =?utf-8?B?UWV6aHIzdTFzT013Z1lya3h3ZGVtclhwOXhDNjZxNzl0Q3VLQ2ttUzl4N0Zi?=
 =?utf-8?B?V0hHSkR3MUM0TmxTbnowcDdGUkJUbngxOVlKR2pKSEdZR0xJVDlFYTEyWUFi?=
 =?utf-8?B?L1RsZ0FWeG1BRzV2bm1pb0ppMzZkUHliMWlxNFF6NFZXZ0QyNkhhUFo3UWtU?=
 =?utf-8?B?clVCN25VNEZVd2JHM0l6SE5EZWJVYWtlUUdGUHh4VWZIa1czMDNHV3VKclp2?=
 =?utf-8?B?SUR4cGlYc3hlRUNtZnI0OVJ6Z016amd0cTAwRG8zTUdPOC9aUC9RRGtoYndD?=
 =?utf-8?B?dkdKZm5SMnNQdTVIQ29LTGVJUmZOMGs2WCswZUY3MFdRS1ROd1ZWV3N4MzlE?=
 =?utf-8?B?ck0vOHB2c3ZRMUVtS29oOGdRVEltZUJKNm5KK2t4WWFiK2RreFZ5ODlqWDR2?=
 =?utf-8?B?SlhGeDJiRTNyUnJMRFFDeUljenRpeWYxc01HMXBhWTRpaFMwVHZpMG9PL3pa?=
 =?utf-8?B?K0d2QytBWHdwS0hBRHJqZk41ZUo5OE5QdDV5emM1cno3OWxuSEZLTldEaWRE?=
 =?utf-8?B?VzIyRm1IakVsWXZ1bFFmSXhhLzFVR1c1SmVRdVdGLy9jWXUzSGpuUU1VTlJX?=
 =?utf-8?B?NEw5OWd2dHhIMVA3Z2xMNkZkQWd6VEhmUDM3a3BtOWxybURtcEhKMktCSVlE?=
 =?utf-8?B?bGx4dVF0dEE3cG5LMlJTU2kxZHBxVnh2K1N6Z1VrSlBGVURvU3pTdnlwVGhl?=
 =?utf-8?B?LzFrL2tVQUtMTElpNXEyQXZLTWFBRi96U0RPK3lJUUxOV1hXcHRRWDhScEpK?=
 =?utf-8?B?RFp2b1hock50V1lwQWJjNnFCb0pjMTN2Q2wwYVJmV2NySUs2MGUyNVlxWDFn?=
 =?utf-8?B?RGhYVDE3U3QwdFRPemk4WS9CdHRubzZsaFVaMll2cVF6aERLc1VYMDVhL3F6?=
 =?utf-8?Q?0DeQnR//a8hHWiaHnNpTh3jRVrXmJBMz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(7416014)(1800799024)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U25IMnd1Ym5WMXdNUVBNL0Q2RjI0MHpRNEFDRVZCajNteUtsU21CeDVIZEVU?=
 =?utf-8?B?eWVhWE9PZG5YNDY3bExwSUUxZUVRZUErNkYxMEZNemV0c0k1YkRVNDUrTHFD?=
 =?utf-8?B?aHVnUEJzNFJ5YjM0YlUyNWZOSUVxM3kyZXdvc1JJVjBmd1FmRUZWa0ttdzZI?=
 =?utf-8?B?V2FkRmMvZEdLbXVBZzQ2WUN5aDNvV254NVl5VEdUdjBFOFY4NFkrUEhZdWV3?=
 =?utf-8?B?bWFoMVlHcnJzSUhkU1RVZG5PZ2Jwc0wrKzdjdkhqUG5EMUd3alVoMlMxYkhZ?=
 =?utf-8?B?a1U2SDZhL0ZweFMzTERNYnRVZitnaU4yT003eEpUdjQ4c1VRc3g0K0JrK3I5?=
 =?utf-8?B?Z3NvU3QwVDg0MVZKaXhudmx6VEcxM1BRTGR5WTl0Z0VUY3J0R1dpa29KbUE3?=
 =?utf-8?B?NDdGdkN0QU9XRGcwSEVUT1NLRVZkZzd6ZjNzTkdzQ0pLb1hWK05jSDZmNmVN?=
 =?utf-8?B?UlQrUTRQbWJZOU12bXpiejd2ZlhnQXUrelM5WmVaWDlTa0FqK1pESzBWSW80?=
 =?utf-8?B?OVJNSkZrVnZPMTdSQ0Y0U3B5YTg1dXRpZjlKVlZ6REQxaTZRS1ZBUTI0Mlcy?=
 =?utf-8?B?eG5ESzl1N1g3NmdYVjdsVzVnMnFCbytmMXl6Sk9lcEp5ZjNhaW5zcFVON3dh?=
 =?utf-8?B?UnlXaHo4bEhjUXVSb210TmdBYnJtMjFDRVRQd0dlRm5NcmIxMjZwbm9VbzUr?=
 =?utf-8?B?b0ZxQkNwelAwZWpNMzF1TXJ1YnFscCtMZkkvRHBlZGM4S29yU2FNTS9lV1My?=
 =?utf-8?B?TlV2TUVDZ0s0bktKT3NWSDhiMFZaKzRMOWd3M1BVYlcvOGRrK1VWQzN3Mk5W?=
 =?utf-8?B?RWZHemEvaWpKMGJyMGJaYU56aldOdTFpOWVGYVE3d2paVmMrdlY2VlZXUzVx?=
 =?utf-8?B?ZnEyazFWb2RxZEtTMzFQcjNnekFrOFVYVmxmalp6MFVkWlB4L2ZSbGtCOE0w?=
 =?utf-8?B?LyswUHMzM2xrc0VhbDh1OEN3Y1prTzd5NzJWYWlZWVZPbWpVRXMvWEZCVE1t?=
 =?utf-8?B?ZFI4WnYyR0JVdUgxNlQzUVVQVTB6STZSUDlGVlFnNVlaWi80OHIybVBNU0N0?=
 =?utf-8?B?WDFEKzJMMFpIWklMRFBGTTk5Y0pGRjBLR3owQ1ZSL2MrUEFvRUtjdUV5eVh1?=
 =?utf-8?B?U2VCWWdUTWpjSTRLTm11cGM4bUVWVzFIUXdBbVlJWlNRckRjYkI2WjdTZ1Bx?=
 =?utf-8?B?L1BoeHJ0dllCblUwZHJTbUlmRlJaVDhYakdrL3NjZTlYM1Q5L3ZLaDRwTTdQ?=
 =?utf-8?B?M2ZZai9BTjNNY1Btc3EvVUFrWlNIalNYZlNOL3BmZWVkVHpua1BCSVd5MHlL?=
 =?utf-8?B?T1VORGJSMGFWMGovaXNndi8wMW14a3F2Ymg2OCtvTHB1dXliT0U2RnZiVXFu?=
 =?utf-8?B?cGdvdkhJd1gxa1VmcjlWemNlWGwxU0xWcVhieHRJb3lLM3RVblBXa0V3T2RU?=
 =?utf-8?B?ZndWaTkvcEZpVDdQSGZjMXhRdE5HNXJkczVUdThjM1pzUXo2UitGcEIwMnN0?=
 =?utf-8?B?THVJWlgzeFhUQWZXMFp3UVd2bjQ3N2JOU3BEZ1pTQ0pFZHp4Sk9sTzRqSy9Q?=
 =?utf-8?B?YkdlMWowUXV1R2FoT09EcjhsODBraU5mUk0wczZlYVZzUlVVTVRPMkVmcFNv?=
 =?utf-8?B?YjVvZkJnSEYzOGQzTW9pL1ZSLzk1NlVFR3JKOUVtMzdvTnBkMTZLZnZjQWJJ?=
 =?utf-8?B?c0FyR1FROE1tMWc3ZHVkZnJqbE9CZE9aVEp4Nm5WTWZyT2xBMjZFUXNqRmxW?=
 =?utf-8?B?RmMwVVJtSEVoN2FpZVNFYWFKTExZMGxhVEE2ckhiK1dXNzVFaHRqbHZ0ZEVk?=
 =?utf-8?B?U0RqaE9zSTlvcFl1M0hjMWVQZnBuWU9SY2NSSjA0Q1Q2VTcxY25GaUxkNVNY?=
 =?utf-8?B?Qi9SRWpxMmVXWmoycmNxTUVBMzRzeWxMZDJ5Rm9oV1kxT3QzSTlCTXA2VUdI?=
 =?utf-8?B?dHFibENzWVJQSjgreDFKZ0NybE9DQjBEd1VrWWxGQmpHTy9YN1FuWU9SalFZ?=
 =?utf-8?B?OENHY05vMVdSM1VaVUFzb0x4SERsc2Npd3hYeExjQUxqUWFMMjBlM0NlTHVY?=
 =?utf-8?B?cXdkVWl4OGRTd2ZxN1MzTFdaWXpkSG5aSi9lUmY2YXlrbHZiRUVxOWJNSWNY?=
 =?utf-8?B?M0FQenBKSjgzaTRxSG1TNm1CRStIdC9HTUxVMGg3dEZjck9aVklPdENFc0Fl?=
 =?utf-8?B?TFRJckRsRFlzTWpueEY0LysrUGtpb0syeFZZdExocU1ObEI0OE9BMWJVZTdD?=
 =?utf-8?B?ZnVJWElPTHdCMENvQ3gzZ0grUGxhZ0kzT1p6L3E1dmgzU0JPRWZsT3d1bjgz?=
 =?utf-8?B?NzNVYjNDM1hxNDNCSVVIVjQxR1p0ekFtaFFNL0lmTVVSZWRQZ0luUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e85ffb-d6e6-43e0-156b-08de4f8653ad
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 13:52:28.1943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2oRsxQ1sehFyaysdn4D6ba0vDkbCd5f9d2ckaNLPToa0AACz1lPrtwwVxCQDDrdQAYMl+wVGg9EZWwzVPKZsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3160

On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
> The `#[default_error(<type>)]` attribute can be used to supply a default
> type as the error used for the `[pin_]init!` macros. This way one can
> easily define custom `try_[pin_]init!` variants that default to your
> project specific error type. Just write the following declarative macro:
>
>     macro_rules! try_init {
>         ($($args:tt)*) =3D> {
>             ::pin_init::init!(
>                 #[default_error(YourCustomErrorType)]
>                 $($args)*
>             )
>         }
>     }
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/pin-init/internal/src/init.rs | 53 +++++++++++++++++++++++++++---
>  1 file changed, 49 insertions(+), 4 deletions(-)
>
> diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/=
src/init.rs
> index c02a99692980..e14bacc88f41 100644
> --- a/rust/pin-init/internal/src/init.rs
> +++ b/rust/pin-init/internal/src/init.rs
> @@ -6,10 +6,11 @@
>      parse_quote,
>      punctuated::Punctuated,
>      spanned::Spanned,
> -    token, Block, Expr, ExprCall, ExprPath, Ident, Path, Token, Type,
> +    token, Attribute, Block, Expr, ExprCall, ExprPath, Ident, Path, Toke=
n, Type,
>  };
> =20
>  pub struct Initializer {
> +    attrs: Vec<InitializerAttribute>,
>      this: Option<This>,
>      path: Path,
>      brace_token: token::Brace,
> @@ -50,23 +51,44 @@ fn ident(&self) -> Option<&Ident> {
>      }
>  }
> =20
> +enum InitializerAttribute {
> +    DefaultError(DefaultErrorAttribute),
> +}
> +
> +struct DefaultErrorAttribute {
> +    ty: Type,
> +}
> +
>  pub(crate) fn expand(
>      Initializer {
> +        attrs,
>          this,
>          path,
>          brace_token,
>          fields,
>          rest,
> -        mut error,
> +        error,
>      }: Initializer,
>      default_error: Option<&'static str>,
>      pinned: bool,
>  ) -> TokenStream {
>      let mut errors =3D TokenStream::new();
> +    let mut error =3D error.map(|(_, err)| err);
> +    if let Some(default_error) =3D attrs.iter().fold(None, |acc, attr| {
> +        #[expect(irrefutable_let_patterns)]
> +        if let InitializerAttribute::DefaultError(DefaultErrorAttribute =
{ ty }) =3D attr {
> +            Some(ty.clone())
> +        } else {
> +            acc
> +        }
> +    }) {
> +        error.get_or_insert(default_error);
> +    }
>      if let Some(default_error) =3D default_error {
> -        error.get_or_insert((Default::default(), syn::parse_str(default_=
error).unwrap()));
> +        error.get_or_insert(syn::parse_str(default_error).unwrap());
>      }
> -    let error =3D error.map(|(_, err)| err).unwrap_or_else(|| {
> +
> +    let error =3D error.unwrap_or_else(|| {
>          errors.extend(quote_spanned!(brace_token.span.close()=3D>
>              ::core::compile_error!("expected `? <type>` after `}`");
>          ));
> @@ -350,6 +372,7 @@ fn make_field_check(
> =20
>  impl Parse for Initializer {
>      fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
> +        let attrs =3D input.call(Attribute::parse_outer)?;
>          let this =3D input.peek(Token![&]).then(|| input.parse()).transp=
ose()?;
>          let path =3D input.parse()?;
>          let content;
> @@ -381,7 +404,19 @@ fn parse(input: syn::parse::ParseStream) -> syn::Res=
ult<Self> {
>              .peek(Token![?])
>              .then(|| Ok::<_, syn::Error>((input.parse()?, input.parse()?=
)))
>              .transpose()?;
> +        let attrs =3D attrs
> +            .into_iter()
> +            .map(|a| {
> +                if a.path().is_ident("default_error") {
> +                    a.parse_args::<DefaultErrorAttribute>()
> +                        .map(InitializerAttribute::DefaultError)
> +                } else {
> +                    Err(syn::Error::new_spanned(a, "unknown initializer =
attribute"))
> +                }
> +            })
> +            .collect::<Result<Vec<_>, _>>()?;
>          Ok(Self {
> +            attrs,
>              this,
>              path,
>              brace_token,
> @@ -392,6 +427,16 @@ fn parse(input: syn::parse::ParseStream) -> syn::Res=
ult<Self> {
>      }
>  }
> =20
> +impl Parse for DefaultErrorAttribute {
> +    fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
> +        let ty =3D input.parse()?;
> +        if !input.peek(End) {
> +            return Err(input.error("expected end of input"));
> +        }

I don't think you need to handle end of input explicitly. Most of `syn` wil=
l
complain if a stream has token left unparsed.

Best,
Gary

> +        Ok(Self { ty })
> +    }
> +}
> +
>  impl Parse for This {
>      fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
>          Ok(Self {

