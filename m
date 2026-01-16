Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022114.outbound.protection.outlook.com [52.101.96.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DCF36999F;
	Fri, 16 Jan 2026 11:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563719; cv=fail; b=Hd7v6cpwAeZzgw8z8iFtjo0/ScwwTaMgx4KLLh0+2+IQBTBgye/pLHz4vL0XHtzE6xg/VC8VfqhAXPWBZ+FaymDzYpkEorHJNsjPR/j3JGOasi5PC24j6+P42J5pXIC3+D7QKeocL++Out33MTkZB3iRN5oLUO5IDNJpQszMpxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563719; c=relaxed/simple;
	bh=pGjIiQCP1gD2niME9zWePcO07664Ni7ioz4IaObSztM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=IplJu8z0+ikO0Zc7gSApR9E4i4hbGWbOlgNJHO2rH1xFamubJPGC5GBLudPK6S4GQhG5beglc6EHgQYDRxGq+r7zP6LwPkbrTPqBvNL7e35CeeJpKqEgY29wAStH7LbGWua/32Mfa7w89J/dLrXQ0uBrgc8JFfaiwdsRMiEF0kE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=0aAMtlpj; arc=fail smtp.client-ip=52.101.96.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="0aAMtlpj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URoz2ezizlGfTLABDsQ6dNbkFZAnzb5pCBky0DAlEKMnXlmo/DSIkHqarelbxfXs4cRnuJlnDc6BK16atzBuCjUWUbTNNkVkrMaeZFrsl8u6m2xN6JjoMuHbm4FbgewWmZhZz3cm/B+Fyp1wI7tDq6xP07l8fng/kadDMoV9Drq7sWUOyw2wxgRarAZeLOc5CrFhC1YhG0fPZK7wUichnZ99N8oP9yUK/lqWoAYfn7qLkBJcuk4cqlCpgvEMXknx15BzbypBhcvLLz8Z+dEt/8TPGI7Kqi2HXl0diVnJk8kBsrVI89CdlHYEGbsBJLhFrbzL/FoyKRKSCH0cXQPDcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddVLpdbpSURyqh4n0P+jCX5nwojVxW+gm3pu9NAMTp8=;
 b=ylw3qobZnz9y8TofsFUBRhKg2/5CT382lxCWgqXvxF/zjS0sMpPHy5AA0QykBHc/BKfpHk94avFFZ12k+6huKQS4vm6mXI8LpzE8WHp1kDK1Vh2G3JOIEU05yejl/z49L/nPTwxqsiynxKUrAyqvDCd66ik2GbC6X+dzVT7ZRYtdInEfF/r7qglFCsKpMYINtGvqs6Up7gNG3khgOHy9sBJDyfT1Hc112L3K2m7DhNDVgIXUKjbZV4EF45vx1eWfygPeCf6cX28xtI0hIozuhifBwoSnioi+44hYSoBfRGxhuOM2O+StP2QW5WdzVKhA4jYjw75I85gUEXYsdgfLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddVLpdbpSURyqh4n0P+jCX5nwojVxW+gm3pu9NAMTp8=;
 b=0aAMtlpjJOzJdFhqeKnNNhMh28H6eDlyZN3e1d2jjLDbEkuRO3ZkAZpfjZDJvF2+ufz5Ijfpmg/WeIVZpMIFNn83LauMPXXFC4lu27x86feh4cc2KvLdub39gkVa1anmI+cAlSxk03Fezt3P15q1I5imhkBBsFP+B/7O9fZtUHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2116.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:64::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 11:41:54 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 11:41:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 11:41:53 +0000
Message-Id: <DFPZIHWK6DAN.2ZOA68E8NZMM0@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 12/15] rust: pin-init: internal: init: add support
 for attributes on initializer fields
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260116105514.3794384-1-lossin@kernel.org>
 <20260116105514.3794384-13-lossin@kernel.org>
In-Reply-To: <20260116105514.3794384-13-lossin@kernel.org>
X-ClientProxiedBy: LO4P265CA0281.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2116:EE_
X-MS-Office365-Filtering-Correlation-Id: 680805f0-3d32-4a4b-1261-08de54f43f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0hXdWE4Vm84aTZ1WDBIazZxbVN5WkVGaWZ4RDJaaDE4SGVweTBKOGtzOVpN?=
 =?utf-8?B?bGRHQjFnNFV2MGFFVDdBMnVyNmY0MDN1KytOeFFuOFV3aHJxcmFrM1ovMWQz?=
 =?utf-8?B?dXJMbDUzb1hHVzk5YUxUcitsbzYrY2RJWmR1dGNOOGYxa0Q2M2NEeUpZQ3VC?=
 =?utf-8?B?TmlsZUlHbytMOWVyb1J2THZoRXRCVWtJVGxWV3JuWEZSUXFoWVQwY3FHZVFU?=
 =?utf-8?B?dnBwbUNOYnNNZlYrWmxqY2ZmMkNZbXh1YXMvY1cxbHdvL1JuVm11UExYcGdW?=
 =?utf-8?B?WStrR3FGRnNtYW8xREhBMjlYZUpsMHhyUGEzNk9jRHU1YTJwYlBVVlM4TWlj?=
 =?utf-8?B?RHFkZlVrTVlSbDNIMGxGSHhaQklYTkJSczMvMVNWTVdqTTRKOGFSRDBwT2hk?=
 =?utf-8?B?NG56R0F2L3I1QktnQ2xTUkplWHZsVzYvRlZMbmJmanl6bk1jWjdJcW1SL0tm?=
 =?utf-8?B?UTNadWcycWdNMzh3R2F5TG9wSU0ydmxMNmxpNTh6Z0Z2UnFCSmJkSlNKWGxK?=
 =?utf-8?B?STJETWt3QmNkTnd6RGZVdEc3N3FJZXlITHQrKzRJbGpxZHJMVktXcmhjRCtV?=
 =?utf-8?B?OFYvdi9ia0FuZzM1OUd5Qm8zdVB3UzI3cWZNS2ZoTGdaVlVWbGRoK0wrNGJq?=
 =?utf-8?B?Qmc0R0RENjQ2Y0RodnAwSkhHUUZMUFA0YjNmUnJ5bldpQ01VdUdKekgxdkc1?=
 =?utf-8?B?eVN6djhLbEdzTHJOcVhQeURqR1plYWphN25ldXpVZ3ZzcFY4dU85U2twd0Nq?=
 =?utf-8?B?eStlNzNFc3F3ZnM4Y1lERVl1SXpRd3p4alozMmd5T2Y5SVFyRVkxd0hmQ3Nj?=
 =?utf-8?B?YmNuZWcySEwybWVIMmRWVGhIaC96cHM4M29xZDFaclM3MzlyeUoyWEtVK0JO?=
 =?utf-8?B?ejVidGdLNFB6bWZoWUpyelkvdSt3SmtRblY2MEFVZGtQYklSOVZxdFpFWFBt?=
 =?utf-8?B?YUdGZ2Z6TmwyOXVVNDRmUWYyTS9nMTdwdW1YNWh6ekY4VUVZWUJqeTM0S3M0?=
 =?utf-8?B?Y0lNd0NBNSt0V0UrS0tDakFLSUZqclEzbzJYa0Nkb0Z0eDZYMG44Tk4zWE5R?=
 =?utf-8?B?NHdMQlFrWWJETk9aSXBZYmlrZnowODE3QlBHMjdDbEVMbUVMMHRzb0xyM3VD?=
 =?utf-8?B?U0VHRTFpOE9hSi9UcEFXbG9HT0M5TzVORkdFcjU3VmNUV1RnYzAzQkdGaUhT?=
 =?utf-8?B?TU1IYzRpOXJJSzdrQm9GSkUrV1BTVys2cFNldzlGOW1OL0YyQUtVU3N1K3Yz?=
 =?utf-8?B?NjJFM0NsZWxHMTltZzNhSlBqWmpsNEN6c0dmTlMxeWQ2Zk00aVRaVER2MzJV?=
 =?utf-8?B?TzBYR0pPelBucUlZdnoyUFZpMWV5M2tNWUJrcXBPbXUxUUNFdGEyRUVWSU01?=
 =?utf-8?B?L3dCNHFvdVV0VkVZLzlSMHNpWkYydDhNUXdnNFM2amYxZXZBOUMxL2dodTdO?=
 =?utf-8?B?cWZ5M0g0QUpySkZ4Rk1meGIxMjc4ZWNJOVQ2WW15VjNFRSsrVi8rSThIcEwr?=
 =?utf-8?B?VzZoZllXczdvb2R2ZGR4U3htUnA1Snh4ODNGMWJTN0xFdDBYcnI4RGZCY1Rw?=
 =?utf-8?B?N0c3MWJwNGdjRW9CT0tQQmZIVFJBUGs4OXd2L211WmlqQ1lnTU85bXpVYmhP?=
 =?utf-8?B?blVMNU9LSDNiOWNBQUFXQ0M0T3AwQlI0bnQ1SFo3c1hRU3RDRDNvMzJiWWwy?=
 =?utf-8?B?QW8rVUFaREFHVEtMQW5kZ3VvMitLYmJXOStTQ0pJYml0N01Ub0RlTmJKY2pa?=
 =?utf-8?B?UDFqeEVKeFNoZlU0Uy9xR0NPTjU5UlgzY2tjWVVaOUdCaXFrQnhFRlJGNjd3?=
 =?utf-8?B?emVpSmtsZlg3MFA0QllTUDVINm5VdHhmOVlFSTI1UDh2NC83YUVnOEY0dExK?=
 =?utf-8?B?SFBlTzBDVDh5Y1VWL3dyS0FXOU9jZHNHMjRSMnYxUE5BV1pxWWJSUXpWODQ4?=
 =?utf-8?B?dkI1TTA5WnZmd2ZWL2FOZHVPbUxiTUVNUGZlRzZ2YXNBMC84bGlZUVJxdXZt?=
 =?utf-8?B?dkVZbHBTOVJZa0lKamtwMG1nRVpzaXVRZndxWUpBUlRCaEFjVHU2eWZuQzg4?=
 =?utf-8?B?TVdiaEw0MDhZbkVjQWVGTDVyc2R4TW1qVVh6NVZjcG1aM0VsRzJ0Um1HVkhB?=
 =?utf-8?Q?aiwI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vy9rdFRPR0dNN3JiOUJhLzRXSG8zSEs5b2Z4dzFHWHphK2d4dC9jK3pYSXRW?=
 =?utf-8?B?dHlGeUZUVmVsZG4xc1RiangyMXo2RGRIdnZQYWl5elFOK2ZoQ0poOWxFTEMz?=
 =?utf-8?B?SlkvNWhDUlZCd3ZBNGwzenNCQ215c2lvbEJhMGhCR3ljWVdiUkRBOGJ4SDkw?=
 =?utf-8?B?SG9MWXp3TmNLT2hnTm9pbDM2RWU1ZWJ0ZTQ1Z1lRRDloQlZZc2JqUTBsUUF1?=
 =?utf-8?B?dWEwaWJwdStpMDg3L0FERkE0cE5td2Jtd2VxYjlhTEViV2R4ZktVOFdpTGlS?=
 =?utf-8?B?N05OR2FpMEZtTHFaWFZTK2xFMnpUL3Zvc1dkWlZiL1drakJJQXpXM1Fwa0pM?=
 =?utf-8?B?ZmY3RjFNTktKUTJIQTl1aVBFZndWTkNRYWVXM3BQam95Yktuc1F6Y1Rzak1D?=
 =?utf-8?B?THBFdmhwbmwwWUJBZ2R3a2ZISXZ0a2ZrZDI4N203SU1tQ3RVaUQreHdwZWM5?=
 =?utf-8?B?U3Z0T1QrUDdrTjV5Uko5a0VMOHAza09ReTZXRDBIUFVVYzY1SUhCcVpJYlpU?=
 =?utf-8?B?eG1zZjI1cTUyM0t4Nmp1RnVtVm9xTWJScityNi9wNWc0UElhMDVOci9OVDEv?=
 =?utf-8?B?Tm53aGhHaEJwMlJYZXh1aEdSdnVncjQxczRGSWd1NjY2WXJ5Vnl2ZWVoYkZM?=
 =?utf-8?B?dDdVdzJxcFo2bHRqK2pJMmRRRnFMQkdTUDZPV2xHZVl6N3I5TGxZaUhDNmY4?=
 =?utf-8?B?NEFGc2MyUlZGMm9obE9CdXE0V2NrTnpJVFdDSmZwd1lQVTlGbmxURnpGTWlS?=
 =?utf-8?B?ODYwYndaa1I5YkN2TEJSdE1WZHRLU1NXOStWck1nSXFJeVBGT3JiZnp4Q3Fw?=
 =?utf-8?B?VGdueklPVkFPTWVadlJRcFhoS0FmTmxOek5WelR1anU3ZGdWVWh4MUtwc01S?=
 =?utf-8?B?Q0hRa1hKcTlTa3VVdmRON0RTMUVkc3JIdjZWMXRwdkhsK1A1WDZqUUgrMEtN?=
 =?utf-8?B?ZnhCMzRLNVJhSTl5dmVGY0RjemtUVUZCY3YyUHFyczYwUFdVNlpsZWJLWkxI?=
 =?utf-8?B?aFdxYjEvc0hYb214RHp3dWJIUlIwUHdOcGFFRDk1RlllU25uQm44UmIxeGZo?=
 =?utf-8?B?ZU1UK0gyVDJoLzdJK2pZSkMyQzhhcFUxTWdCU2Q2TEErM0tpd3Rsczdqa0ZN?=
 =?utf-8?B?QVF3QU4yZ2tQc2FscGxEZi9aOGNWcjA1azEySGFWWEtXOHBITlZFUFJRbWVP?=
 =?utf-8?B?ZGhDWC9oUndaRTQ3aVJOTGlJVEpvSFpqT01CY0FwWUNpeURyNkUrYkR3L1Y3?=
 =?utf-8?B?WWs5RkNvYWRQU3o5bkk4NWd4eWV0M1o2WTNRaVpEdjVMbXl3QVBmRTgvRCtV?=
 =?utf-8?B?aDBIbmJYN3NuV093SkRQaDhESHlEWHp3ZVpiU0p6Y0hLSm9XeW9xTjNRK0xa?=
 =?utf-8?B?UWRXMmhPS0xCMExERGFHVDBwbDRJOE0rN1BMVmNxcllxa2VhL0s5RzgwUzk2?=
 =?utf-8?B?TXJkWWVaeERHd0NVTzlqL0t1VG92d09BcmQyNXcwbE1SOWl4YU5NSTM3Ums5?=
 =?utf-8?B?UVFDRGZFSjlKckcxSFlqNHBBMUFVREZ0RjBGQVEzWlNlZUhMWEs2MkxhZmZw?=
 =?utf-8?B?WUtXaHlYcC9TNWJ2N3BDc3J5ZC9QcS92bnRxQUJBUU5VaWUvVzFrRkRNQVc1?=
 =?utf-8?B?TCt6ZUNwakxrTE5Xck9xekNCMlNCODhmK01YVXMvMStsYURWUzIwMHI1N0th?=
 =?utf-8?B?WUxFa2xGb1Z0amhYTVNVczl0elR3OWxiekVVRVJjUkVyd0NkZEp2YUE4Vnlq?=
 =?utf-8?B?U0JlTTVnSGNIR2VVK1FYL0xvUnFDTFBCWFR4aldLeGxQS1VZVmEwUVBKakVS?=
 =?utf-8?B?alBvRHlTOHJYeDRQV1gxb25DUlY3d0JaTUdZUDkxMlhXNFh4bVYvMDdCYSt1?=
 =?utf-8?B?enJBa0x5ZFZZS1FPeEpiRmpYUkRodlJwZktlMEM3S2RrSFJ1S0FTaDZ3RmMy?=
 =?utf-8?B?cy9FejJlYm05MCtyTXpNYnVTb3Fid282QmJnNzVpTjBJeUIwbXZrSC9XbXBi?=
 =?utf-8?B?UmR1TUZjcDdQL09wNDgyL3ZwZGZSZVozMFJ2VkFNM3p6RVNENmNPU2FualNH?=
 =?utf-8?B?YU95YUcyV0JObDJVcE1Vc2FkeklHbGNBTDVoL293RnpuV08xZ2cxVjFCcDA4?=
 =?utf-8?B?N2I1V3ZMMU9wSCt5dE1UNzV5T1g2bWdwd2tPS3FYYkZ5UisxRzFQTmd1dHU2?=
 =?utf-8?B?SE1SMXFKU05SbVFWVjNHOHFuZEc0SnBnSERwaHIrRXFvaEd6aFFrWWxlNEVS?=
 =?utf-8?B?cGNxL21ZZkIrU2FTYnJNbmVzZHFJU1JncDlDQTlWRUhaN0dRaEVzb011UFlK?=
 =?utf-8?B?WnJDbTN0U25zSDAra3YwUWl0QVVUcW00ZWwzdUk4Y0RQMWJiczMrZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 680805f0-3d32-4a4b-1261-08de54f43f36
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:41:54.3105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJsYpyPChgTI7Odbf+V8VK4Q3Ec56GJs9ldGwp4okQV2MEvnGesFJIgvjgwexDsByAWj67k9LnVQ7iYts1ZNmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2116

On Fri Jan 16, 2026 at 10:54 AM GMT, Benno Lossin wrote:
> Initializer fields ought to support the same attributes that are allowed
> in struct initializers on fields. For example, `cfg` or lint levels such
> as `expect`, `allow` etc. Add parsing support for these attributes using
> syn to initializer fields and adjust the macro expansion accordingly.
>=20
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v4:
> * remove inclusion of `#[cfg_attr(...)]`
> Changes in v3: none
> Changes in v2:
> * only attach cfg attributes to non-user controlled code for fields
> ---
>  rust/pin-init/internal/src/init.rs | 69 ++++++++++++++++++++++++------
>  1 file changed, 55 insertions(+), 14 deletions(-)

