Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.85
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243050;
	b=RHBOXmVrXTKTXW5tmgkP9VnfGQzJSMgW6qao8olSjVG5UrceqciILNbkI20Xd0WFa51d
	 8ri3JtYdEJtiY1EmszbcC2fafJeas/MIj0PO9KmCISVQ9zFkUBNIbbluic5mOTyiVPLZ+
	 +mZ1QIVcy3jy+vBULtFnv/POLACKgIdUQGNsiM6bNAs0YTgAM5OLCf0OFjFpPt5xoCQpW
	 ulKNbkEOd/bv9sY2vnKOstBYNqWodhVpe+rsMTbRwrQq6ElbxXR6MLtaEljLTz34Q2gAZ
	 Jv2ywY/3QzNNOntqJjdBwb8KrC8RwpkbTuZRrHZeauFuRDXMitIPRFL/enf8iFFz8Rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243050;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=umxHRr0bwF4CF3RmK/VZJMzJGzqjH0iP22tVSnYZGPE=;
	b=IUyr/OjIeN7vxZHIIZITKShusjV1Fa1fh8Aby6nF2s/58A1Y26dh3kVXUIMPLxVndFdM
	 jJ0FzzQPHJ1D+a4rzaaz5tdGikjGl9ZhK/8r2BIZXxbdaOdyAC7Wm5+B6XQgu4L7LYydu
	 xWivgkKtwRIboL4EUslZnr+ObMe05XGJr2vxKtuYCiThJ9YI9vCJ4ZQawhqF/6bG4xaSc
	 Ke0VBG+5y9sJT50Z8VrvN5Klw1ACsQIG9hUoQCEZQ44EccLrFL7b1GYIlUi3izUxoNgqR
	 820l4+fLkgl20wjmR6uzX7b1HkjmvovwG3bUbQ7l5neKfY/5HC8iu70erqXc5sEAWBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=M2UK8tVT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.85
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020085.outbound.protection.outlook.com [52.101.195.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5D9606A321;
	Mon,  9 Nov 2026 16:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA5D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=M2UK8tVT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMj5AJqQ2Q2aRVmXyeqw3B0EfEZDwt2TL8rPh5IXAXtAjvytL5std++Wxy5gaGIpk4zeSTxR43yWEgbCZ0I7QducX+aKBVSrrYV63fkaBABFAtB+uPhLbnaYdPse/90p1XnfSts3WoyMgzRLr3w8/8mQtOVgq6VJxycEwqzWyr5D0qB0pyPWEI7ZVEWsZ69ab6TyUnHh9+t0AVZyu2sVVltO4zfiPqGO1pc0Vwl87wCiW9IwTzaiFFxUOFepheqWsw3oZd7aGOM+LuVfZdh9vRdyz3xG3E/3l+oLSLx3yoDNe3EYFiBgEYmm3NkYJNphvzvefcGOsL1EVaMXx1eOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umxHRr0bwF4CF3RmK/VZJMzJGzqjH0iP22tVSnYZGPE=;
 b=Ty5mkuA91zRk1pYYUoFknaXXEF0MSEsODtHj311v0gqK9ypssd+NZsqWCvDVLfZyVQgZCOcPwGnXsa3GJ21fawcLYix5ftZcj+EKFs8IJuCSRN5rLRIRacRNy36aMfBsWsQ1zuDRgvXhw5eOhYDh5Jm5/yz3VFT0CvE0MYcbqHa6axPKEKJRtppuIGueoV8y4MAxnDW43HI56PZopf6SA+C0fMOdgsVYusYH0o+YFZ+QdOM6mQny+ohPtppfINbUQdoAoW6CN7zgSIb2VH7I7COrfkgbdbI0db8PLGa+buzMrcZOOc5Fk3qFSC/q3u8o/qMuXJTP7RkFckw8TNwJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umxHRr0bwF4CF3RmK/VZJMzJGzqjH0iP22tVSnYZGPE=;
 b=M2UK8tVTtCOUoCpPxwHDUP4Lx4QacLjXxJqiKVFNK0Sn4CYslyR9e5awD4KubHJBvS/JvymVz/i3squU4/yqBIb3mo7GId8RVt+VUn8x86z7H8E+iMwiqzGO79IHtUrJra3DdkoRdHVnHPL52/yH6M7PHOqt8g/vUnaLHYWlWTQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CWLP265MB6657.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 16:50:46 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 16:50:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 16:50:45 +0000
Message-Id: <DMQU2RZATGHR.1HI8FE2P58O7V@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Thomas Gleixner" <tglx@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 "Uladzislau Rezki" <urezki@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] rust: alloc: move `NumaNode` to the `numa`
 module
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-3-e968ce5ee613@kernel.org>
 <DLSQY2IKU5IO.3BFLXTCTJ5I6U@garyguo.net>
 <878q3hopt6.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <878q3hopt6.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P123CA0266.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::19) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CWLP265MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f8f1ba-8ad8-4dce-0148-08df3e8199c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|23010399003|921020|261021121427099003|56012099006|261009223027099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|4143699003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	9Wbtk5RYXLaK/67Euh+uvpmvzBlJZ9+My5+J4vvOqDGFvFzUI2ziYq2KCdde1F9BKKIH/wUL68o43CJ2EhxcOEGDntKa7yI7FiP7MOmUXatqE5VH2TRzQx0R1cQn/LwoHSguPR9uVH4XOxQt2HKmqCNskMxWSXd9jSc7U21NSHSVf6+ucIhkTcFP2weR7C6gNvLIwiNA3Iu8OY286UbwcR9KNkLKT6YwGzYk6LH2ViXUuZS4pRr3QUVSSwMQ76XyzcuNR1kkOKFLGeQeUYwtEaNSbF1cjBD8OHOBZb/8UKrsNr4un6/Fq01lxwu4wI/d9WyPiwWVVoA0PTPBTYux8ffZk+rDa5flkXR83lmE9s+0VzoUecgXqtxPlKFofB+fm9HekiuP9mUQ0POyOz5S4UQXhnvAs1SWS7dfsdwj4TiCMxUcw2Y2PSHiBqwQxg9IMw8Yy7J0Fj1ogI9bQFO3mazNgS1x1mdHmzcOfmbMwMHHJqUgEIQ8i3Kgfd0k1xknPtMOOemouriAXHKSrw62c1Q4hn08UWSYh+C1kmeWSaAc6QGl6QNvkqtVF7kGcHOLIP5+xGLCsv86xlpCVxjEfo6YFnEJV65nSxNsIRx5nC8CZTFf0Ylc7uM+oyCkK7801HLkl08dhnvOepWfbEaUdA3DX24TA5JdJITwV05QAmAO/E+mADFRu1CQLnbk8pQy21tXkYkGLhcunEHpXb5GCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(23010399003)(921020)(261021121427099003)(56012099006)(261009223027099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(4143699003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vy9VTlJtYVVmeUNsRmhUQjZMSmdBRXVQUGtpRDVrWVFCMmIyRnh5cmd0Z0Ji?=
 =?utf-8?B?TlJ1ZEdiWUJUZDhMU3FZTVdGTmlnTFlPdzRlV0JsbiswMmxFNnBTSUxTRG9L?=
 =?utf-8?B?cjczQ09TeTZpY0RrdDdjV0FxUmxHNDdyVnF3ZitjNjh5aHA0NncyaXYrUHRv?=
 =?utf-8?B?Q0NoaThHdWZBTlQwQitSQVJxL0F6dnlkUXBJb0RtUTl0S3ErOTR1MGJ0NUF2?=
 =?utf-8?B?VlJGOEt3cjJCa0c4cS9JVzdiTm1OMWNFL01SblpnT05UK1d6d1N5VjM0U1JB?=
 =?utf-8?B?NXprcEZsb0pkeHExWTJqcXR4RVcvS1RYRmtPVC94bURKVW1JeXdKK2JwVFZL?=
 =?utf-8?B?UytKUWZoTjVSdi9qYWoxSWE2eDl5a056d3llbG5SaHloemFhc0x3QkN0K2NP?=
 =?utf-8?B?cFI5WjRwMk1NdlZVZUMzbWlhTHg1M1hCODdtMTd3aU9oMGdnRVh5d3VPelAz?=
 =?utf-8?B?V20wR21PRVd3UVlZWGZpSTcycHE3Ri8vams2Vkh6TmRHOWZEK3hyY1BjVXlJ?=
 =?utf-8?B?N0dlL2xpeXQ2T0dXMWU4ZWE1bXQzakNGOWM2em43Qm1zN0dCZGZIRkM0UGdB?=
 =?utf-8?B?a3kvVDV5MmVDZ0ZlK1NZWHZ2OEhxS3BjRkhpd01nTVB5NHZ6L2c2K2ROazNQ?=
 =?utf-8?B?SDI4NXlsRDhXcm5Ybm94UFRlbFFUK1loSSt6OHVJSy9qQzJuWHNqcG5jZlAy?=
 =?utf-8?B?M2dTYXhKeG91UkhoejF1N0ZLaW5FNEVtT0ZFVFBiS2wvUno1VFZYSm00TXpH?=
 =?utf-8?B?b0dSVUxSeHg5ZW1BcC9sbEhrWnJNRENBNEZnTXVZZjRCeHB5WU5iQ3RocVJ4?=
 =?utf-8?B?RVNYNG85WFpCM3pxQkUzcm1JR1k2cFQ4cTB3L2JUaW9YR3RPU0NIbStlczJ1?=
 =?utf-8?B?TzREeEJvR2VDRkVrcVhiV25DWG0rZkJjdlhtWm4vR0ZOU3EzeGJCYUVsTFhx?=
 =?utf-8?B?dWViZ3VMQjA2QkdpZXE2bThlUTBSMTIzWW1IclNROVRSZHQrNEJWV0FQYTNU?=
 =?utf-8?B?aDFwNXNLUXpzTEgyK3pOSDg0S2xkMGlBcnNOSXkwL3NqSDhzdlMwQ3hkSHdL?=
 =?utf-8?B?T0VjbWFlSzdhYlRJM1BhNGk0ODNoVkgrU0w4Vlc5OEd2U05ibmZKNDJCbll0?=
 =?utf-8?B?WERXNXNqV3d0YmlFbXdJUkwzckcyeU00WEExeHZidEhld0NoT3VrdWJvNlQ3?=
 =?utf-8?B?MjVxNVRvVWZwazFqeVZobmZ0dWxIQko4TE03NHB5dkFMZERGTzd0TStnUFBZ?=
 =?utf-8?B?RnlBQlFROGNjUWxWMWdtRkZRcDBEOGk2TCtoajF0QVovVDFjQ0ZvWmVBbEhU?=
 =?utf-8?B?ZlNRazhzYlV1aDBqYzZ3MC93WStVTlZibWk2T0g3MTlOY1p1UjZFM3JnWE1j?=
 =?utf-8?B?WDV2emQ0VHlKYm1vRGxMUTBaZzQxQkZqRUV3b3pGakNWU25Qakl2eUg4VEhY?=
 =?utf-8?B?MjNlNkk0K0FYdHRTZ3BHSFJ5NUF0OGNreFJmdDN0bUFoTVU2N1VDVEpxQlRD?=
 =?utf-8?B?cXZHQi9xaXY3UUc5WVBLSWl2M2wzWjdlWFB3UHl5R2U0bmFMTFpoTWl3c0NH?=
 =?utf-8?B?UjFLZitmWkNEdDhuZkU0N1B3K0lmMzVTcUcxQlA3dWt0RU1wWjJCL1Rudmoz?=
 =?utf-8?B?S2xhSzRCQmh0anh6eXJQTTA3UUVFUVc3RVVFaXl4SEdvWHlBZVdXWVBGSWl4?=
 =?utf-8?B?QksveXZveERUUHE5TTlzWVhQUGMySFJ3WHV1SHVkY05QZU9VWGRTTGpYcEI3?=
 =?utf-8?B?bjVSamF0TW41MCtpU1poMFNHMUdZRnppZXQxUmtMQ2VMeUhHYkNtdVI1eWxh?=
 =?utf-8?B?ei9UL3ordUpqK1kzQVZYczIrS2lGTm9YcVlJQTNyQjRkK1lEaEdDRmsxcG56?=
 =?utf-8?B?TDI1MXdGY0N1dlI5ZlRWWHJKNDFVY3ZBWUpVSlpyQmpHbFMxTjNzZ0VHTzdp?=
 =?utf-8?B?UVRoU296Z3cvVlA3K3J3SEp3a3RlUEIvL2FmcTZhWS84TVFrclFYZWt0SXBr?=
 =?utf-8?B?MTRtaDM4Zll2T0JNOXlHM3kvN2ExQUd4RTRtTEJoOGJmVzgxYmtNWGhCNkgv?=
 =?utf-8?B?WmtVVkdMYWNJNkhiczJ0M0pGY055dW5oSFVTZ1JPaVRFT2gza3pHOVdtU1Vs?=
 =?utf-8?B?dWRlVGVaVlR4UUIyTC9rOUxNby82UUJYR20zaTlwNVJlaUF4eWdkZjhxVHVM?=
 =?utf-8?B?OHdYd0psU1hEM3ViNnZvQVQ4SVNMUGV1TU9jbUFSV3ZNV0Q3OGZDTHVtVGRn?=
 =?utf-8?B?bGppWkJPak11VWRGV2h1YWRtMkVnMWRuYktyOEw1L3VHRHZhR21URjlXMGxB?=
 =?utf-8?B?Vmt0MEREbEZ5dDQ5OGtqcHAweTJmRllvby85eXdXWm9pSXAyWmw2Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f8f1ba-8ad8-4dce-0148-08df3e8199c6
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 16:50:46.4286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PrO/JXvaWum9kv8GPhmlxpOnwnQp7DDej5ylzDpmAYAGvlXnVhu5w6BAkU7pgvPFt4R6RQHEiqKAaKwmZ5Bpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6657

On Wed Oct 28, 2026 at 2:36 PM GMT, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>>> diff --git a/rust/kernel/numa.rs b/rust/kernel/numa.rs
>>> index 164e622d325f..4a3a880308f3 100644
>>> --- a/rust/kernel/numa.rs
>>> +++ b/rust/kernel/numa.rs
>>> @@ -4,12 +4,15 @@
>>>  //!
>>>  //! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodem=
ask.h)
>>> =20
>>> -use crate::bindings;
>>>  #[cfg(CONFIG_NUMA)]
>>>  use crate::sync::atomic::{
>>>      Atomic,
>>>      Relaxed, //
>>>  };
>>> +use crate::{
>>> +    bindings,
>>> +    prelude::*, //
>>> +};
>>> =20
>>>  /// Returns the number of online NUMA nodes.
>>>  #[inline]
>>> @@ -27,3 +30,33 @@ pub fn num_online_nodes() -> u32 {
>>>          bindings::nr_online_nodes
>>>      }
>>>  }
>>> +
>>> +/// Non Uniform Memory Access (NUMA) node identifier.
>>> +#[derive(Clone, Copy, PartialEq)]
>>> +pub struct NumaNode(i32);
>>
>> FWIW the C type is nodemask_t and this should have mask in the name too.=
 It is
>> not an identifier. That said, this is an existing issue, so shouldn't bl=
ock the
>> move.
>
> What makes you say this? This is not a mask, it is a numa node id, which
> is represented as i32. `NUMA_NO_NODE` is a valid id.
>
> I am using this to specify domain for block mq queues. If you take a
> look at the allocation path:
>
>   blk_mq_alloc_queue
>   blk_alloc_queue
>   slab_alloc_node
>
> It's an id, named `numa_node`, `node_id`, `node`. Not a mask. Unless I
> missed something?

Right, I got myself confused because NUMA_NO_NODE is defined in
nodemask_types.h.

If it's just an ID, would it make more sense to have `Option<NumaNode>` and
`None` to represent no node preference?

Best,
Gary
