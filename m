Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020093.outbound.protection.outlook.com [52.101.195.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBE429B8E8;
	Sat, 10 Jan 2026 19:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072818; cv=fail; b=eRdp4GTKA7DdMDOw4Wx0ZUPmzyIw3630qSpnhRHrgy0yhz6WynJlAW4zifa6ApFyJ7Ap0UYLKAtz7x25sYQxQICNDfNBuCcT3LBBQY682d6WDU3iq02hEoY2OCJ3n4h2jQ/1WEl0LM+KtjoJymWfBI4hzGBp7Jb3Krbium/+HDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072818; c=relaxed/simple;
	bh=/Z0MWF0MEftUPfAwjSG5Kmy1JWyo3eQ9ayvpan8YepI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WkiNeyx3RCQkUAszG2ZBWoN4EV64N32ho8TfZXEx6ISep4wurCj0I0x8r0+vYmXfyKqMZu5NtojQRyoIMy7i32gpUDiP7euc1A7fBhWBM+tSrpLtpfqecxzMJsTXig8XMUoIianGC0MNLi0S7PfqrHpZZD8dzB5XDmIQLGf9fbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=o/drQyMk; arc=fail smtp.client-ip=52.101.195.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="o/drQyMk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpGxvkKYx7G/RDITtUJvWvUvdbNtKQMEeEhx66IY67apZ0ezz+CuO89yFzlQqI+ftCVKsWvnkFGzbwSjoB4O3XTmH/ByAsOiRDSukWZT1wp3j22fzMcjepEcKkTi+Pu6I37igQvyb18IszBJZB6WEevTjig9l6brWBobABCfaTTzW5937Bz2w2Osm7eiuZG12wEtpPPM/16PAmBph2fef4dfhNrL/GziZ7p+zIILOKbSgoVXl565HhUkUwvQGFfCNhIDZ5bQLvHiSg1TOYAc/MNSWGLhtcUt5tBDYaS0YTVNpbuy1X93qVwJXzKT0DkiR4o2LNy5uesdYrcAX+w9Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7b9Iu6XMu884AHP8CBvnpgT5mt3/3hRqdCFsCEjfUM=;
 b=hqc6SKjU5EfL0wwNaXVo6jSwfI2fsBJOQ4FBbmqN2ZaA4Vf/WRmA4gO9vrXo5cGShqYfoPMDPQlY5X4NkpZQSkG9mykbhp3rcDRYvDI+4se9X8ACrcj/dXHPFwnkHrpwZv1OoXEm4KMIdZVrBtC0CCxK6/K0iZ2TFY66ENNi/YjIAfzPVc00IuBOPavucV/KAYTnplJ6FiePfVI7INUWTdRzgsUqjBjM1McA5T5S4518dz4whchF7fVGAXJXjFb79ONzkd3E7lPmu0tEHbVNMnuS/M6nIeLV1597CyUl5aRXBLwoOnVQezbCjkEn/Dh6cw9dUBWK3RrS9kP2xfZRtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7b9Iu6XMu884AHP8CBvnpgT5mt3/3hRqdCFsCEjfUM=;
 b=o/drQyMkptTPrG0b5B/DK9Jp91pLJKYQa6SnxJo/YtLGwmJ8gkL3RLftuazFDBvi+I9mcRX61HUeu+fOmZteSl1U7BIj2Hh3n+5FzBPHSlmuhbCiFssbZt1gFEiKR6ZAp7S1Ow5umuJKJLggxpxThMD/Q3CFRIuGydBl7C7Mtpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6518.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Sat, 10 Jan
 2026 19:20:11 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Sat, 10 Jan 2026
 19:20:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Jan 2026 19:20:10 +0000
Message-Id: <DFL5I47BBJOB.3RLOS601BRLFU@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 08/12] rust: pin-init: rewrite the initializer macros
 using `syn`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>, "Alban Kurti" <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-9-lossin@kernel.org>
 <DFK3R2EK1JGL.FFW73JGUSGP5@garyguo.net>
 <DFL43YZQJFBM.3D4VE24MIKLYZ@kernel.org>
In-Reply-To: <DFL43YZQJFBM.3D4VE24MIKLYZ@kernel.org>
X-ClientProxiedBy: LO4P123CA0417.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c165313-078a-49e5-2f37-08de507d4665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGttQlpUejNEaGIraFpkQlY4RkYrWm51U2dET3I1bHd4alpxQ2ovMzR5MUcx?=
 =?utf-8?B?ZzF2TGs0SFBSNWVhQUk0UVJHZlF6ck05OXB6dEd1UW92bklyRnRNWWhSaGk2?=
 =?utf-8?B?UjI0WGJ3eFU5K2xjNnIvb0pYcUJHWUx2c213VVQyUXNselhTcmtVWVJjTVpu?=
 =?utf-8?B?ZUpIUnVlSnJadkZLTkF0TkdwY3RXdEpTQy9yQ2ZyQlM0N1U4b052eXNET2ZV?=
 =?utf-8?B?T3E4amRZdmhtVncvdFpoQ0RvaS9BWVYvcmJaTDJ2SnAyMnVqN3lpcnZ2REp4?=
 =?utf-8?B?T3VlM0RzV3Y4UjNHa0ZmdHN4aVd2TTBGczVEdWZBWUw3ODl5NllBYjNsNW0v?=
 =?utf-8?B?eGZWMXh1Qy8ydFVNTm0yMEs0L2dKellVOVM0YlU5MXFYU01IYy9NU0RmNkc3?=
 =?utf-8?B?UW4yN3ptbjVQVjJNd1pNMDVob3ZiZzNNL25vajVxdklZVGE2enllZjNNVFBO?=
 =?utf-8?B?NDVOUCtqU0I1cDd4cVNsSnVLZWVTd09DdTJnUm1wbFRuRnYrczdZSGRaTHFT?=
 =?utf-8?B?dW5rZEhuNFZyVzJKMzV4b043N3gvWjI5cDV1NjA1djlwcGZodEJsTmxBeFNq?=
 =?utf-8?B?Z1FzQXc3RXhRaUVPMldSb1ViVGhRRjVMNURRVTRwTEFpMWkwSHdPbHJON2RC?=
 =?utf-8?B?ZEFsRlpPYy9zZEk2cTBEdEFRUFh0ZHlSUU5NSkk0K2VKOHpNZGI3TDExMDht?=
 =?utf-8?B?TUtrUnh4azZjTVovZjlLaFNPcXI1a3lzMGZFdE9tQmxIMnJuRzluOXdQYzdX?=
 =?utf-8?B?d0o4cUdRdmRFaUExTnhqaUs0V0IxQUVQYkNqaXhPRFE4Rjhkck5ScGxlOFR4?=
 =?utf-8?B?N1VxNFRzQ3FXMHIwNWh2bUtRek8vTVZ0K1BMSEM2a050SWllRzBIN3BXV25I?=
 =?utf-8?B?NGs1K0YzUDBKMEVVOHlOMURsS29nQ1N4amg0MWtQRlprS25DN21JNCtmSThn?=
 =?utf-8?B?RUxjeldTeW5nNnNUbGJPai9DMi9ZNVZjeHlPMFFYM3B5Qk5KOVdOd1VSWWVy?=
 =?utf-8?B?Vk5URngzMUJzZGZ4dk5VVTVzdXZtaGs1Wmh4dWpRaCs1SjdORzJsOVpQODYr?=
 =?utf-8?B?YzAxMmRxUFJLNGg1Sll4K0drM1l3UmpISko0WmNwUmRBTDkwT0plbE1rdUM3?=
 =?utf-8?B?M2JmSHhNZkc3dVJHdDhIWTVjZHZIMCtkNWtKM1BUMnZDQVBWT0dWeXpVN0U0?=
 =?utf-8?B?ZW9pbWE5WUNTNlRoM3hMeHFEU2pWbjF6N2FTaDR0WjZUYVViMHJMK0E3R1hI?=
 =?utf-8?B?dDE0YS9wci9vbmRCOTd4L3BOQTlVK1dsdCtzYnAyQmdycy9pUS96ZFN5bDZj?=
 =?utf-8?B?SDVWVncvZ1lSN0tscFFRaVBPd1NJam1pclU1OFNncWloaG5MWlhNQngwSStN?=
 =?utf-8?B?eXVjUGxDYVgzN0lVWWloVTBWR1FQcXdBb2RhOVlSVGo1ci9VVEJQcytITVVz?=
 =?utf-8?B?MjdLRjA5ZW51aXFpVGR6aGVRRGM4dEplRmpFR0p1Qzh4OEp0YllRVm1NVFhz?=
 =?utf-8?B?L1FSNVNzSnlRMjkzbXdEMkhYSFNIWm9iME5GRjJtaUh6MlRpZW9BTDRNeE5S?=
 =?utf-8?B?SzBkL3B4Vnd3RGM3R3lpQ3owZ0xyZ05UMmI5dlpZTHREMUVuQm9KeG4zT0Q1?=
 =?utf-8?B?NkllTWcwU3FUdEgxMUVWTHdKbXJBQno5Y1NjdGNsdXQvMzVEVnRaTDRsZkJn?=
 =?utf-8?B?dys2UzR5bVczdURsS3grQmxGTGN3T3MxdHhIRUxTL090UWRpcnhRaHoxU2dp?=
 =?utf-8?B?MGo1cU9wQTlLRVQ1dVlhTm52aTZwaGZlUjY2bjRqT01yNXYzYi9QWTVmMmF1?=
 =?utf-8?B?OWZ4VXZHOG02YjA4NVBzbUZLZ1l6eFJxSkNiT3JTVGxRTnYxMFU4NW5oSGU4?=
 =?utf-8?B?cnpDeS9FYWVoR0RDZ2pCMTcyRnVGcWRVeEhmcmVqVFlxWGw5MkM0TlJ3UFRm?=
 =?utf-8?B?R2hZTEdyUVI3VTBtTUQ3d3FrN2JBSkpQSC91cExDRXlYQ0h0V0pZaHBaNTVi?=
 =?utf-8?Q?Z+TmjFJRcShcCgL6Fxh2wlHExxDm7w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk1LdVc4dGo4NGJqQjFuWTBVOE5VQVcrTDBUM2hSMkIzYjJkR3YwNkFEV0VB?=
 =?utf-8?B?Qit1NUErOE1hczdCeW00djZVS2FuRnZtelUra0E0SURZb2RCdWZYclQ4anBr?=
 =?utf-8?B?bjFaWTd4aTU5eGMzMTZOM3JyK0dnbjVWUTc0Y2pPSFlpYjZuKzNndnN2TW5F?=
 =?utf-8?B?UkQrMWY1eDVmWnEzUDNxUzRIcnp0ZkMrZ0YrQlJzUFRYR0cxbyt2VlZZSUtx?=
 =?utf-8?B?aVdqWjhMaEZndXhldVZzM2ovb0FCS2JoMFBKR3A0ZE9UeWJKRWV5dUw4VS9C?=
 =?utf-8?B?KzdlV1RuanhPbXQybVAxT05lVy84VUtmKzVUaExJVHZvTmJLM2cyQ2pEam5i?=
 =?utf-8?B?R2YrVVBpWFhvdkRDNjcrSTNIQXYrRmtMR0ZrajQ0UWtzMmtxRkNHalMwclhP?=
 =?utf-8?B?YStGd0NXeGpDKzFtYkc5VVpxL3QzNnV0eVl1bHByb1RiVlJscmpGVnZjT0Yv?=
 =?utf-8?B?RDIzODZtU0JsQjJpZUNYRWQxZGtYS0hHZmhHRndHdHlZYURxK2RZaW1QWmdY?=
 =?utf-8?B?dndJaGtSb0x1bXdyanBENUVDRndaSUY2SGl1UFFNT2hPSnJXcWRnTnVEVUx5?=
 =?utf-8?B?ajFjNVpMOG5XS1FEc29OTFZ0bU83RHNQd1FNclJCZUl6Wktpd3g5RUhiOUo3?=
 =?utf-8?B?NzdlUVNRM21GN1dKWmZ5YVdJSE1PYVhtZ1BORDlRcjVRT2pRN3Y2MXN5Y3E0?=
 =?utf-8?B?cEREdnBVejNHcUtmbHlqTVZTaWthellHdngyKzh2aG5uV2orWWltdm01Zmlp?=
 =?utf-8?B?ZlJzNFBtcHlNV2RsaWNYY3FIeGpKcWszbVVHaHZLK2VWeXJsaS8wUjN2SXJX?=
 =?utf-8?B?VnVlSlFndU9TbUZBbTVCeVVJRDREYmxsUnVaUUNMRWFreVNCQ0llM0FhYWIx?=
 =?utf-8?B?Rk81N3JxRUJEUllJalpOUHYranBGaFZWTnZ6eHE4U0tRYzBjdmhBWW9aUk1j?=
 =?utf-8?B?YVhjbS9oSDhrZkExU2lHZ0hVbllrZU8xN3F5RVV0Z1FNZSt6T2hGSXFRWUhC?=
 =?utf-8?B?SDBFV1FEM0diUXhDZWFSdnQwbHp5M3Jhc0UvUTBnNEZnZE15ZFJVWTA3a3pX?=
 =?utf-8?B?WlE3bFlEOXVzdHdudzZuaklBYUFnRGdzelQxWUtpYmhEWnZJRHNTZGE2cXNN?=
 =?utf-8?B?d1NEbEhxNk5OOVd0Q1htS1dUa0U4eFRTalBpa3cwT2pRUEdvbCtxbysyL3ox?=
 =?utf-8?B?ODVLR0s5VWVLbCs5Uk43WmpIeVE2dk9ad3UrbmJDNkRiYTd0VzNBTCtiVHY0?=
 =?utf-8?B?Tnhza1hKMDVYUlV4UnVpaWVSdlU0YUszUXVMM09oWHVnSkkzTDBaYVNWMkV3?=
 =?utf-8?B?cjhPRlMrQ1VYWDJYTmEwdFJtdkt5TW1oaUZaNzlDalZ1T0h6aEVMcEljTFZ4?=
 =?utf-8?B?SWZkUXo1eWZyQzJoNmdBekdrRGhjQVkyaTVSQjNTNUUrVGl0RVQxanRUakhR?=
 =?utf-8?B?QlZQNzFWNlhWb09VYWNRRFNnU3FZeW82c0VrMWd6MXg5NVVlOGtQN3hxaFhD?=
 =?utf-8?B?aVhkUUpCdE9EdEttWCtNcUl4RWk4UWVaTHFidjl2aDFyWFFPWk4xUUZhWnNi?=
 =?utf-8?B?N1ZWVDBlZDZyQmZtTWRBbEVIeWptaDNPVTBGdlUzY0VMcEVEZkJJM29Hektu?=
 =?utf-8?B?Yk1jZHBnb285R0lyTmhrUXByTXFqbDNIZ3Z3RGtjN3NuY1BWVGdaeFB4aEo4?=
 =?utf-8?B?VGdLWEp3Zjh2WVprS0R2MFhMeVZCSWxEWUk3cDlXRk5LK3FBcTRDbHoyZ1ZD?=
 =?utf-8?B?aE5zSEE5VHB2U2xPTkJ3cGZjV3psUThhSWxqRVBzUFlLbDY4VzQ5bktWcWtH?=
 =?utf-8?B?SldyYkVtRmpiZ2xLR0JYRkRiNDgyZTRoM0ptU1hZVW5MdllrRUFlTE5uaS9m?=
 =?utf-8?B?eXRDaVpaNDB0V3h4MXpiSDdpcVlGM3BDQUxzeFducHFWdUdFVnZ1MXNSaEM2?=
 =?utf-8?B?cTlxOWVQQ2VRRytWbHQ3SWdPYWxwZmUwZ3lSN3BDZHlIc0RiM0VmMzVPWVpU?=
 =?utf-8?B?NGhZRzQrME9KOUhaZjNNVTkrZGhaV004SDczdTF2aHVBR1lHTFNRTThIWFBv?=
 =?utf-8?B?SGZUbFlPL2EzUExYVEMvQXZLM2h0SmtQdHdnUnVzZnkyNWM2dm01Q09COGRH?=
 =?utf-8?B?YTRmZW04Z2VJb2U2dWFTNXIyaDc0cUZ1TG45UVFlSE4wWTdrNzRheHJNWW1R?=
 =?utf-8?B?cU1tWFZCclZFbEY0WTFHV3VNMkIxaU1QaW1NejRpckswR0ZYRXVUNk9EdUNX?=
 =?utf-8?B?M3hudlU0V3ZKMW45c0RHcXJyQzh2R0FYdE1vNk5MYlhSL0dvOTVaeUQyYWhL?=
 =?utf-8?B?THl4QUFNaGxlN1JTc2phOUgzRXBnMFlOZExkT3N0WkZ5ZzIvMWlvUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c165313-078a-49e5-2f37-08de507d4665
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 19:20:11.5878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXQx4AkXCdpLTOGZsTMxApy4BbGN9uM/rrxUZIyO9XmzSr3gj6f+R9htQq5avfBi0hm+FrS+GNqjpi05ZYfvcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6518

On Sat Jan 10, 2026 at 6:14 PM GMT, Benno Lossin wrote:
> On Fri Jan 9, 2026 at 2:45 PM CET, Gary Guo wrote:
>> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>>> +                quote! {
>>> +                    {
>>> +                        #value_prep
>>> +                        // SAFETY: TODO
>>> +                        unsafe { #write(::core::ptr::addr_of_mut!((*#s=
lot).#ident), #value_ident) };
>>
>> This should be `&raw mut` now?
>
> Yes, but that involves adding workarounds for 1.81 and earlier. I'll
> leave it for a future series.

You can just enable `raw_ref_op` feature globally. We've already enabled it=
 for
the kernel crate.

Best,
Gary

