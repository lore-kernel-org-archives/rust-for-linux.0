Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021072.outbound.protection.outlook.com [52.101.95.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D338C33C199;
	Wed, 21 Jan 2026 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769022629; cv=fail; b=jsVA5MXO0CEUqSJjgSaEnn8FbZOzqyNPpwZT683Q0YLXozKceAxJlnA9ddDIN9LikrUvnspujh6QrRM+QWzjpOOV7gD6T73d7vt9PZIl444nDlSulbB9R3ukSNUGBWFFPlO74EMGCQxi0PB7cKBhF1jWiqVK8Whr1fcn5yAfLNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769022629; c=relaxed/simple;
	bh=ExUJ3Wz1SQy+8Fgs78C1cpy2xaj5l1HsmIMNj3QEeqE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=h/j9axSkpYD535J9rsTx6VhxTeMoSMijIzm6pl8NUaggwkYIWCdNc5yS+YTG49m4zjcKi8sf/QP3EEjisQHmA7A5uz+96akTfiR4ckZrGd1e3NKOPNwkGeFHhXwuxYDZRfOR4VNVcFXKzQ2/4jf3w8Z8BLX57BYoVBDu7CoNm04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=yoZa6q1B; arc=fail smtp.client-ip=52.101.95.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="yoZa6q1B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrrAfx+Ft/O05ZlAyO/NYF05PVrNoA1sCPzMAKhqt6PyogHTUsirPafJmHO8BDiVE0BBbdJKr5EljMWh25Ojn9GYIZk+eZ+NaauF51cL3QPQnc34iUszYw8y4KY6AKZ7kKDAUo8kAj301fODictSWAFbwTD2zM8E6vVt9HSwgEdm+2HSk/LJpVOfhSRFg9rWMLI4ALxcQb04VyCgZxF1DOvpfkhhd2OmPVNEY28W6ot0XgggG4woynYRgqymlmYhLWDyDF3khJ5NWTlUN65k+ISFXtZ+w8Oh2gRTI/MK+mVLz8SCJmTqImvSlbU0lBYLvFl1HQx5hE96Vf9lhq08qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExUJ3Wz1SQy+8Fgs78C1cpy2xaj5l1HsmIMNj3QEeqE=;
 b=SdUZOo2X+bRVay4kZjTxYfMmjQGTngkTMBURsZRC5nzzsRWfRNrY80zwqtuZ5CUm/3u7kJcHC/FEOsqWZNIUg8RlhewcbGbeU4dgVnC8otM/N4EtFHNiOYH0szjGBe/xwmXjJ2vbkMvzgLhgJc4rGS+fvD6/HE9XEn4W9uBVT4JzMbaf585HuwVUOMcHIrjonCU1lVRRdAHJ6o0nQMRolk5ozHLDuPuzxkaw2pt68GXNKp5FCy7klHWdNpe9dPvmJXQpF0uJNhm1wegmrgOtof+CmnYWGX08+bITXcgtl8EUwHqOwxyz/gke3DmBIYcRNzAJbW97Qo1mICxnEuAybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExUJ3Wz1SQy+8Fgs78C1cpy2xaj5l1HsmIMNj3QEeqE=;
 b=yoZa6q1BflEI4MDDvojVDFJVkJtuzdLh74IM6So6Mf6nldWjxZthKJwLqQzFrGxxzDi8u8dIA7EzIDBzXsP4q5+U56+Bk14fspWDa0pe1rae/D3+a9015SbIVJ3PupCrejrOMOkAQRrZTeycP85/bx7HDvOPZRPBRgIcxTnJbfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2242.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:63::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 19:10:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.009; Wed, 21 Jan 2026
 19:10:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 19:10:22 +0000
Message-Id: <DFUI6LMASTMK.2WI00LMY5FTSP@garyguo.net>
Cc: "Daniel Gomez" <da.gomez@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/10] rust: xarray: fix false positive lockdep warnings
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Tamir Duberstein" <tamird@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-10-9e5ffd5e3cf0@kernel.org>
 <L-BdidfnzrZLOC35Y3KX2Y4TUkcBRy3f70o2nc8XRz2yHxUR9D1O_ECPqnfScNWnrN6sHRQNdGbZEspB39xTEQ==@protonmail.internalid> <DFUE4FBOIF4Z.22DLDSQS06LO4@garyguo.net> <87fr7yu6x8.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87fr7yu6x8.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO2P265CA0501.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2242:EE_
X-MS-Office365-Filtering-Correlation-Id: 6438a8d1-9ba0-4894-04c4-08de5920ba15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlE2UXNzK1BPZFRMbFZDQ0JzWExCZFVVYlQ5bWxSWkRiK2MvZDc5ZTFCMzdN?=
 =?utf-8?B?UEdiVE1ZNTRibWY1Q0RtaHhOZkh3NkUrZWpkRTR1R2FQQWJwelN3b3lvQlBu?=
 =?utf-8?B?dWdrTG1oWVhNUTQvR0k2Z3dSQ1hYQWdGMGpyQ3JMb0wzQ0QvUms4enJwNE9h?=
 =?utf-8?B?WHprZFpyKys1eXJaOEIrKzZFT1FrU2x5U2VQSnFLNE52U2U3cDc1RjIrd3Fr?=
 =?utf-8?B?c3B6ZjJSc3ZtTEJkLzZyTVJWcVQyOEZwWkJHZm5YZU9JSk01S2NadVJycHJx?=
 =?utf-8?B?OFZVOUZyMU80ZGNnRUs5eDNBUTU1b290eVBrTzdrdlEybzF6MWdmTjdPNC9l?=
 =?utf-8?B?SGJCc3VrWDAwVzFlLzhxVlJ5M3dWSlNEb0NTNWEwRkRmUmtyT0hmNEhvc01E?=
 =?utf-8?B?dHJuRnc1N2lIV3RjZzBUS2lSRTRnbGk1T21WUkFsSVJOU1VVcWxMbzFmVHk3?=
 =?utf-8?B?ajdsT2dhRitHRUFEbnQ1a3NiTjVrelNmN0VTNTNmUCtGLzcwUjF1ZWpsT1RB?=
 =?utf-8?B?eFF4MEVjbHBZVktEaGYzSVZiV3NvSzBmd3QrUHZtRW95WmpzQnIrUmVpNHR6?=
 =?utf-8?B?aVI1YUlYNm1sd2lHREpsR3M1SCsyQzlUTnVndHR6K0dKMmQ1aXk1SDNyNE13?=
 =?utf-8?B?TUJjWTlXSFlEK0FvSkFraEFJNzgycmptWndqd2xYRUFRNmpRRXBNTE8vQSs2?=
 =?utf-8?B?UzRFQzBiV0UzUU1xNlpxZjhrcFpOM3M5WXVwTmwzMkdwSTlXaGNuYStCTCtN?=
 =?utf-8?B?V0dCSDZIK3AxVUw3ZStKdkRnd01KTEFvc3lxd0tZbUhyeXVRMUo3ZmZXdlcy?=
 =?utf-8?B?RFlqKzMwTmFFL0RqWjBUdC84Ri9uU0NrbWJVcDYzaEhlaTNoTTMyN2RLOENW?=
 =?utf-8?B?NTRHZ25TT0VTZHE5eTVwa3l4bENwZXUvdjlSR2JjL20rWkNHbURGZjd1eS9v?=
 =?utf-8?B?RDRsN2x5WERYL2d6anZnZ1lpMDVJYnBINTV2SEpnRmtHWmF4djFjYm1jWng5?=
 =?utf-8?B?c2htZkFaNGN3b0EwOWlwb3pyaVEwVXA4dmk3NGFwVVFaOTVJRTZwYTRNYUow?=
 =?utf-8?B?SFZkOWxCWW05V00yY0ZMVmlyaU9qL0VBTGxWMVpGaXczRllMQTFBYnc2Qldl?=
 =?utf-8?B?S2dMWFBvSGV1K0t1aDJFVjlQNkhCYVhKc1JTL25HaG5NbkF5LzhCaW9CUXpM?=
 =?utf-8?B?NDJmM3FzZ1NkT3FmOG5KajUxREQvaEorRk95TXlKMWtkMEYwdnhRNkNtRSsw?=
 =?utf-8?B?akY4OENCYzhWbFFGTEZPWU5rWktWWnR3Z2FDR1d6ZzlpelV0WDBReXhRbmQ0?=
 =?utf-8?B?Vi9nTjZnV3NyTXEzYVJOVC9Xc2FTVjROZVp1V2NNQU5TMkt0NFExdzVBRG0w?=
 =?utf-8?B?ZUh6cGdVN3gzWVJ1TVFEcG8vZ3g0ZHpRT25rVk0vN20vUHpiVldONnhmdzhp?=
 =?utf-8?B?aHliQ0pLdE1GcVM0ZVdSOS9nRWFQd2xuTzFoRGl3M2p0eUdGeGRZSWd1Mkw0?=
 =?utf-8?B?STQ2SWhrcy9Iazl3clF6TEhuSm5OUzdhbWI3Q3pXRmUxRGdEMHlEdThnM2Jt?=
 =?utf-8?B?SFVDWVBYcTRmUGNjSUxmQ1JTdjBkbVFDbjk4aDNzendrL2J3QlgwNXZ6Rk01?=
 =?utf-8?B?TEdQREJKWU1LenBLREEwN3VtUTNiVGVNVWpkTWZnaXE1anltci9pVzRxcTZ6?=
 =?utf-8?B?WnNnbFBUcTAwWFQwb1VDVXFmNi9wSWVNV0FrR2E3cjlzK3pXQ2JLdXFPd2N4?=
 =?utf-8?B?bHJQM3pOQTZxMy9PME9LYUdBZEc4MGJtNHU2Si8rbXRzdTV2bTAvN3JLZDMz?=
 =?utf-8?B?UTJqTEhkOU5SMDMxaDVtNVNXTlVNQTJBREJFTkxMbXY3R1BVWFp4MnpaT1Er?=
 =?utf-8?B?KzMwMEI1NUZhZk1UMUVQZXZiVWVxZ3ZRaFFIbHRCZmt4eWpEK2FFWm5relJ2?=
 =?utf-8?B?UXQ1MGg4SnRlZyt6ZTRjeHQzU0N1SWtoUFFiTXJaZ01MMHVER29TK2RNOXdu?=
 =?utf-8?B?NGNWUm42d3BJZFhFVmtjMkQ1dytndXRXL0RMQTBua0hXMUxRNFBOZVFMRlJ5?=
 =?utf-8?B?a1k1WE12U1JMQUNjWWNaOXRFVmIveklBZml2Rm1Mc2NDNUEyNEF5Q3lvYjlh?=
 =?utf-8?B?LzE3U05pSGtsTjZOdUdveCtydVlqeXVhTHFXRkMySGU1Z1FNMzlqSGlvWElX?=
 =?utf-8?B?aXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTVoQVNWZUpOZnpVM2hhN2xZdDQzYmg0OTE5bCtqcHBBVnVxTXg2cWpUNlhr?=
 =?utf-8?B?ZTkwNmdBN0hQWndKMG1aWjhWVWZhbmtkUE1jRFgvWWVtZG16TWlQbmRBRXg3?=
 =?utf-8?B?RE44SjlkSkpxL0h0QzdOWHlidGIyOURhMFhjaFlIMW40OTdHMFJkM0k0dW5x?=
 =?utf-8?B?MWJaVHhzbk1FL2VLVnVwR1JUUERTZ3ZMQlNHNEFYc1hlUGk4SkRrMjMvZHF1?=
 =?utf-8?B?TGZEbjVOa01oVzRrdHAzT09xUFduSjNRUEU3bUtQaU5NcHhHaDQ3UDM3T0xq?=
 =?utf-8?B?QkJtZkpEQVFoOGszRlFyQzdOOEovWkJvN2xNZytJSzlGSmVyY0hTemFIblNj?=
 =?utf-8?B?anQ4QktjWG04ZzRMdThGSWNkL0U3ZGlQc1l6eFM4YUxoUS9BNU9lZHhETVNj?=
 =?utf-8?B?anI0blg5UWtLRHpuSUtRS2hnZ3lmY3lwMHBPN0RXekdVakNIckZrTXhmaytR?=
 =?utf-8?B?b21zTE9qU3FvN3RLeUM4SVlYZDdlaDdKYUZxWENJK29YaGllcFIyU2Z5REFo?=
 =?utf-8?B?K0hsc3VlVHdxdkp0WUNveGN3WFdIbmdvT3F0dXN2M3YwckhkYVlhd1ZlWVJE?=
 =?utf-8?B?dlNNU3NmbzlaUWNCWmx2QmJoMXlPSnEwRkV6VGl1WFBBcFZuUm41aU9xNVcx?=
 =?utf-8?B?bUpsU0luZEhDWGlUb0Rzc2FrNDdYdWtPL2hMcXhEdUNZU2Q1a0tCMzJBNVJp?=
 =?utf-8?B?OWgybFFJYTFuU1ZlcUxZdExZQ3hEbmJRNDFGZ2xUeGhEWGgrTWkzRkoxaVRu?=
 =?utf-8?B?NHB6N0QwMTBxakJwODc3ZzRyN21RcU1hUC9pbW5RZndmUThWak1LM001Y2h5?=
 =?utf-8?B?VWZmK2FLSjdPU2pzWFd5b1JvbkxCZDdOTU1oVlBEYk12YVJLYStHNCtrdDFp?=
 =?utf-8?B?VGhMbzVuTU5KRlExUEgwemRUSDNWa2hVUHFQcHNnT2R6ckJla2syMC9xVGI4?=
 =?utf-8?B?OGdPS2xpeHlzclBmVWlRK3hwZXN6VnhYN1pudGdZQ2JTMGlEWlowTTZVRzBp?=
 =?utf-8?B?VlkzY2hiNWZQU0xVc2thazVvVVNTVG1ZRjZuUEozVzFWbXJ0azIvVDYwaDRp?=
 =?utf-8?B?UXU0QktYRmRObVd5Q3JHODYzZHN0VUJiampDRkMwZ2Y2aWxxeUdYVStWd043?=
 =?utf-8?B?Q1krQUR4YnR2bDZudy9acUlXVjFnODFWaEVsQjVoWk1hdjBNcDU2OWMxWjdk?=
 =?utf-8?B?THhmU1plZFhBUDJadEhDV2ZWbnBoYkRQMlprOS8wSkFoaEQ2MnFkTVZyc2Zn?=
 =?utf-8?B?WFRiYVFKWlhYTUU3R1Z2YTExNGRqclloUEkvaXVWLy9QZ0U0ZEp5V2dTUEhJ?=
 =?utf-8?B?MysvRlFyYTRVR1dhNncyL1daN284cGJVMWRyRUZCWkVUQUR0N1RIRllvcW1H?=
 =?utf-8?B?RkkvQTVKQ3dhcldIQTJhckR4eUZUdUgyeXArSzZrZmJpL0JxL3gyVTJNWFZI?=
 =?utf-8?B?N2RPK2JIWnQ1OWpjQ0twbnJrQ3gyWEozNlZ6bk9tY2hOd3ByRk5MOE5SY1Na?=
 =?utf-8?B?Nlo2bnVFRGtnRTFtLzk4MzB6dTZ5QlJYRjlUVnZ4a0dGNDlraWJiaEN0cTNm?=
 =?utf-8?B?L3cyTEJldVV2K3hOVk9QWUxXUW1HY1FGV1g5V1d5REFuRkpGRnd6M1lyTnVk?=
 =?utf-8?B?dTVrUWhmbVlDVmp2UlFzV05Bbm9yS3NvbzllK29nVEIxVHJNQmdkem8xV1pz?=
 =?utf-8?B?RFY2RXNIcTdYNUx1QldKYkptTGQ3NUE2YktIREs4Y3Jib1h2djB3dTY4SURT?=
 =?utf-8?B?SDhUdXQwQ2hnYWxrRFhlcWRmVnI2MjAzd09QdHA2by84TUs5cUtuM3VYRndk?=
 =?utf-8?B?SnJ5VFNvb1FBNEJITndBQUZORWJBdllzcVE3TzUrTEF0eHV6ZXFkV0tETzZS?=
 =?utf-8?B?QUIrVmN0SnhMMlpXdEhkMzVreVdwZjlWQy9VM001OThwQnpEOTJ5bzN1RVBE?=
 =?utf-8?B?RmxTcmp3Qk5nVjVzbXRPd2g0eUJUajRJRHd4WmlnN3JoeWtTT2NVZmw0dDU3?=
 =?utf-8?B?Qkk0UFNkR3NZTWloVTlPV1h3N0tuYzRtbGNoWlNpd1R3S3dsQnFIbGxrVkhh?=
 =?utf-8?B?MERUZmVqbUZsSkwvL1VEMlZIT0xBc05DY0h3SVk2cm1la3gvYS90WE5McEVT?=
 =?utf-8?B?YmlWWENwN0lFNStqRkRrd21HdHdhVXpreG1qZHo4SWVMek5EOUFab0dndXZH?=
 =?utf-8?B?US9Yb3I4U1FlaCtlSkpUdjFuaWNYM2lyWUdXMkZMQWVwTkRGUHlTcDRvSVJI?=
 =?utf-8?B?MGw1WHVJUnZ0QmFRTjAzek80UGhFT1J6blZ3RFZqSXB2TjBudE5qaFVsWk1Z?=
 =?utf-8?B?Z3haSlZmTVYwalFUaVI0ai9HNC9KZWpTMTF2N1FCd0U3RmtqRVo3UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6438a8d1-9ba0-4894-04c4-08de5920ba15
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 19:10:22.9628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnFW8WC9aCKd0Zm8SvuCz5OKnJbLSF/kL/Skv1JUvjAyJgsGTJOsl6UNiT45JjejYQnEQQbSnVAHvhs4gut/sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2242

On Wed Jan 21, 2026 at 7:01 PM GMT, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Wed Dec 3, 2025 at 10:26 PM GMT, Andreas Hindborg wrote:
>>> Replace the `xa_init_flags` helper with direct initialization of XArray
>>> structures using `__spin_lock_init`. This allows each XArray to have
>>> its own lock class key for lockdep, preventing false positive warnings
>>> about lock ordering violations.
>>>
>>
>> Isn't this potentially a problem on the C side as well? `xa_init_flags` =
is a
>> static inline function, which means that the lock class is going to be t=
he same
>> if a single C compilation unit initializes multiple xarrays -- unlike wh=
en you
>> use spin_lock_init, where each callsite gets a different lock class.
>>
>> Best,
>> Gary
>>
>>> Add a `new_xarray!` macro that automatically generates a unique lock
>>> class key for each XArray instantiation site. The macro accepts an
>>> optional name parameter and uses the `optional_name!` and
>>> `static_lock_class!` macros to generate appropriate names and lock
>>> classes.
>
> My intuition about this was that when the C static function is inlined, a
> new static address is used for each place the function is inlined. Is
> this not correct?

No, the static inside static functions still have the normal static semanti=
cs.
There's a single copy regardless how many times the function is inlined.

So you have a unique copy per compilation unit.

Best,
Gary

>
> Best regards,
> Andreas Hindborg

