Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021126.outbound.protection.outlook.com [52.101.95.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2139475;
	Sat, 17 Jan 2026 16:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768668542; cv=fail; b=fX2ZEyWZOvo+QAMLLuNVBtcFJGUc4XOAuy/ejlIxlw9pHWV1+1pNxPctU8iChDczll6wR2yuEadVVZAhc1bi057UdMiW2MpZYyJSTIlYhmu79CGnC7HsvBqansyRG5dvu4zmFeaB6XOrn5cNof6QdaQRuy0W/Uu08jzolibxrlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768668542; c=relaxed/simple;
	bh=2IjmlUNxNk4bkWnQ9Al56UTZbn7lpSTzFZAmH6MbenU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PL8qj4gqiDaqJgrDmBaTmjK4or5QlOFLrROFvz8l7/9SsWiBkkn8t9JWYhpX2TOMBGC395ZEmgFrkABC4JIY0UyCJix7quawIQKGwLK+xS9r64AuNVamrKLEs231RI0MM++QVYzOlV4WrM+Zt3MZUlmHzvoeSJiNwkQ7j2aLBjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DmfmcCWI; arc=fail smtp.client-ip=52.101.95.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DmfmcCWI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBFttfXaYJPGVy3rj9cfRzQwXmT6I3Q179UynOytdEvg4hhBSnMi3PZ0J6x8HyG7S/zv2NOk1Zms2hOY/yDbpx3GQsZtpay8xgQv5utblPfDl5aK5xkjTw4V1ez3XGfqlp3bnCX/OMCTKKpCu6UCp/LCLTwO9hrhvuMOuikIdxqb6zGZqcWgVDTioifzBv+zUDh2Tlqve9su6ohNV2pT0w1qXGKgA8oc7JO/pl00tc8JjZ2RMnbHxRQdLgnzNVJEn3b6/4bQ34AvtBpJR4bSOjKGQ2zWnLPmD/ekD0uMkVecyxQRhsoBSBvTKhxW0f1u/P+t+jsa3VP5Lcutw1Ifiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IjmlUNxNk4bkWnQ9Al56UTZbn7lpSTzFZAmH6MbenU=;
 b=Lh9VahP9XBdIsjzToegIsp/ge+MpssftaS4z53MxLaMKYMAyvup8aWXF5t08HZ3rIwZzKr3sHPG+WVoF6464803Mq6vD+1tLlLEEGWTn+kFFkxSmZKU8LhG7hKiwMvtGOlhSgT5C9FUO4fznDDVct6DWi7/hx1r+6FFWWO1xntc0oo2tl2TcdD8GwNq97M6G8sfDc/Nmkx+Z7ZpIrCOYRCiI7DGfZwiS1rR17J2N7cFPExz7FD5v/Q8qWqagCiwjiB026IXrX3pQyyr4AqXqaWGNbYbKXW9gkfNoieqA98QsxLsdQXpqH+AH323KtdNhjSD4xMe+f9OumJC5af4yKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IjmlUNxNk4bkWnQ9Al56UTZbn7lpSTzFZAmH6MbenU=;
 b=DmfmcCWIkkxTd8v/JDUZWLeTVnRRIsBT99XjVfrHEKMk5jR1HG3sPTr7Htv22beygB/QPntoJGt21Bt1SRLp+lLY13lARGkFTaQG6XzWi4/W55Lh7KP2yxe1RGwzWIy5hjT6HsdZD4K8kb9877/kpsYnuAmw1PD4WgZQPQh9b8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6350.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sat, 17 Jan
 2026 16:48:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.009; Sat, 17 Jan 2026
 16:48:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 16:48:57 +0000
Message-Id: <DFR0O5DP2BNY.1SI7IWT0J1YU4@garyguo.net>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: ptr: replace unneeded use of `build_assert`
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20251216-ptr_assert-v1-1-d8b2d5c5741d@nvidia.com>
 <CAH5fLgjP6O0KTsm+dioy0VUm791zrktLTkAtQsG2uN3JSQFUVw@mail.gmail.com>
 <DFQJEAPGK791.17H92ET2Z9B8Z@nvidia.com>
 <CANiq72k-69Q2iZ4zwyUZ3QOXXkiUc1zSDeO6AuhyDWnsTWv_Pw@mail.gmail.com>
In-Reply-To: <CANiq72k-69Q2iZ4zwyUZ3QOXXkiUc1zSDeO6AuhyDWnsTWv_Pw@mail.gmail.com>
X-ClientProxiedBy: LO6P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: e3864281-b60d-44a5-b102-08de55e84f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm11T1FLdCtIT1k1VVdGVEJFYTJ0eEY2YmpoWUdLM1o2cGVVQTdxVUZoUGV2?=
 =?utf-8?B?TVZscUh5OVdXWmVBZjk2dWNMQ0krNWdXVTBmSitDS2NNWHdmREFrU1VyczF1?=
 =?utf-8?B?aHB5WUVOY0JuZDVpdFdUSFZ1L0pYTHVTNUx4WlZyS09waGQzRkVHUXk1VXl6?=
 =?utf-8?B?OXJONW9iSFE4N2RsRnNvN0tta2s5TCtRMXNRSnVUUFl1WUpib082WnFEMC9W?=
 =?utf-8?B?aFN1SWx2NnZWUTF3a050aW1YUGsrQm1SSXRxeDV3SmdnWk1nRXVvQmF4SVJk?=
 =?utf-8?B?QmN5TGQvUTAxall2TjIxVzQ3eXpBQ28rNG9MbndZc0R5NGdRT2ljSXU1SjUr?=
 =?utf-8?B?OFd1T20zaVYvK1lxVlVmV2hhVHRHeGFFN3pQRjRFYlA0Q2lNVDFrNGMyclFh?=
 =?utf-8?B?L3orNXlDVU5pcXhoc3hVZVlDdXM3endTMHl5RFkvSURWWHVQeFNtS3Fsa0x4?=
 =?utf-8?B?YVZWQXQ1RkF2TUxEVGk5R0NxNWhmSjZPdnZtQUhTSkY4UmJEL2NuTTlqcksz?=
 =?utf-8?B?M0NDRSt1U2VYcGlSYlBKWld4Yy9ZcmJXS2l2Z2xVVkdQS0tKTHY3WG5CS3pm?=
 =?utf-8?B?eGs0UHZPcXBqay9qemhNR0Mwd3ROZzRLeStJNnZwZE1JUUcwYVBjbE13NjhI?=
 =?utf-8?B?dlBwV2ZTakEwZ010WTRXenJHdDNXOHhYL0ZPeTVNWFV1blZmdmFNZW9BM3dw?=
 =?utf-8?B?emV1NGtteG1Dc1RtR2tYM1ROempaZTBBUWIrSDVzazhNdGhRU1gwZysxRmxC?=
 =?utf-8?B?dDlOZnFKM2x5MUs5STJ1d09XTk1GdmdtcnJoZ24vUFBTWDdYTElUZmpkMVRu?=
 =?utf-8?B?UFdHa05TaDBXc2JqSTI3WUE3ZmNqWmgvRVZCTEhPSlRCbHlVNzc3MnN2MWVF?=
 =?utf-8?B?NDZERHoxamtYdkhFN2E3ZktpMnA0Vm1vK3oxa1hCN2lmRWwwZWM1by9ZWFdk?=
 =?utf-8?B?S2xMMkZiWHVEbnFTemY5eUZ3Z043VmhVYzlHY1NITHBuUEozZCtrOXJHMUZi?=
 =?utf-8?B?TE9ScTFLZndGOE90YkpacjRhS1ZTSzl3cFRCclgvcWtOQkRPZmVHV3NqYS9V?=
 =?utf-8?B?RHV4WmdaV2puK01hek0wclNvNy9hS0srdE5iSGlFVkQ5TXlRRitQanRZNDFK?=
 =?utf-8?B?bXhJVzl1NnVNN0N2K2tXcjRhYmd1QlhnYUs2Zmp0WEJBc1g5MjlsZlVFWGJm?=
 =?utf-8?B?dml3bXBVUTlZZEFxYUZhOGlVeDJ6T2xkeU8zNUQvZm9nOFJ4aHAraHJSS2F5?=
 =?utf-8?B?MFZrRlFMYmJmaDNSakJHTXN1SWVHR2FTVE4rVzVKek4wVFVHRVY1SVA1ZFlP?=
 =?utf-8?B?ZEFYRGxSOXg1R25iQmwvTno4a0g1Rk5lMy9jdmZWYTV6bUdSL1N6TWtIMTU1?=
 =?utf-8?B?Z0JPZmlqNUVocXNlcysxdmxaTDBVSkplNVNMRk5mL3ZhQytDd2d6WFZuNkdi?=
 =?utf-8?B?UUZEZzdUTUc3YUoydzZHYU9qL0k4YWY2VzIzd01OQ2Ruc3d4QlBOZ0tFZFFn?=
 =?utf-8?B?Z0c2MmZnZENUWEFTQ1VGZkpxV2xOcHp4OUhHeUdVa05jSFFodU5leGwxcmVp?=
 =?utf-8?B?NkIySTh1Z3l5R1NtZUovcit3czdqcWZmWkU3WXNRK2lZRlF1cU9IeVFVYnlh?=
 =?utf-8?B?Qmo1WnBXVS9mUU54aVphbDZEdVNBZ1dFWGNyeEpURnVnOUZWOXM4OTRNbHVh?=
 =?utf-8?B?SUNVSS95ZjR2WTNJdVFSMXl4ZXF5YmUrNDJQMmoveEpLN2dwTFhSMkR5bFEx?=
 =?utf-8?B?czBXdi8wbTUxWXhGWXJVOWp2ajhJb2pRUUZRMlh2UDNLSGI3THpzNjRYQjB2?=
 =?utf-8?B?TWc5THZxUFczKzFnbThKNFgwOHFPOUpuekJOTGZlb1poaFB1TjBZU081SEVD?=
 =?utf-8?B?cTdVZWt4NWlSWmNxY2lnaHh3V1hCOWdCZzIxbGlrVjRLZU1NN3pRRjdvTGFO?=
 =?utf-8?B?WjBFOGM5MWF2MFRyWGswNHBUb3l1NmF3TXdkNlVrS2pCcHJpQzdrSnF0K1JU?=
 =?utf-8?B?aGt5ZlIxWDZjbVV2S3VWbjB0RFl0cGFCY2tmc2lJWVNJTEs2R0hYYjV0S2FT?=
 =?utf-8?B?VkFYVFFWdXNMUzlITTkvV0tKMCtZdDBDeFY3QzNWUmR3V3dQWkh2SElCeTkr?=
 =?utf-8?Q?PQ48=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG55aUtUK2F5YXNmODVGRG1IdDJKYmZqeElyV2hqRXFWQVY1ZVpoc1NrbC9w?=
 =?utf-8?B?bUJ1NHc1ejZGaHJ2em5XK3E1NEJGV3d3Um1DUlVCK2lNNmFoYmtyeTVVN2N4?=
 =?utf-8?B?eWJicUZnOVUraVY2M0ZDRHRPdktlRzFOeDBQUEtjR0RtWXplVS9waVhsQnJw?=
 =?utf-8?B?aU5HbG1GWlNJMlZDMzRHdTdHblZFMkpMOVByZFZBb2VSSWtPbW1kd290cjAw?=
 =?utf-8?B?MURyUm5wTW5jdXd1VHNKWkJwZjRIdWE4ZHBNQUI2NW8zRkttODJqN1VZRHFV?=
 =?utf-8?B?TWttR2ZpcTZVOW42UkM3QTJUbXc2cGFrZUFZeUU2SW55UktjQURnekJPVko0?=
 =?utf-8?B?cjlwajZ3cjcrYlNaKzYyRzRKWVc3dDRNTG5kRUlYZkIzNFlKeWtPN0dtTTlI?=
 =?utf-8?B?a2h4aDUzdkczekM2ZnhwZGVUYWE0RVdRQnorL3VCdUxoaWdwSFR6MzczTmpR?=
 =?utf-8?B?dGdXSkE0R2NqbmVack5LcE92N2YrNHpWVHJsT0E0ZUNjNVpJaDhqb0Vrbkxx?=
 =?utf-8?B?K3V0cnJzZnM1Nkt3eGl0NXFRUXp4ZGQ0b3JxZ3kvdk9zWS9GS0JQVXZKbHln?=
 =?utf-8?B?T05oYzdlY1VZY2JNQW1mWTcrZW9RbGlWTGxYQ0pGQ2s3YmNDQWsxb0VMOEJR?=
 =?utf-8?B?MjhRbTRlVWNVRmlsV1JCdXdBUSttdWY2dzUybzVrT09rNGVEZTdiRmxJN1kz?=
 =?utf-8?B?QjVua1p4T2h5MUhYU1hjdGhKaStPWGV4cTVjSHlPWjg4alhZOSt4MHF0R1Vx?=
 =?utf-8?B?d0tnRjR3dkJQSWR2Z2Rybm81NXRCMVBURGtWc01SRStCK0ZIbEJtYmxweWtz?=
 =?utf-8?B?NmJob2RZRFdxdEVIOUdvemtnVU42WWw2TDhjNlFYQXJ0ZEJvdUt6WjdoQW5N?=
 =?utf-8?B?aS9xVWUrY2gvMzNJZEhZRG1rMmc4WS9MdkhLL3JNQTBPeWtadEpVYU9ENCtX?=
 =?utf-8?B?NEd6WnB2M3ArVnlZQXBIOExJazZvdmhsWlBKV2ptMHhBNmpKQ25SY2poUGli?=
 =?utf-8?B?TVBMNE00dyt4RHFOci9oQlpLSi9sUzlKSE5UVWptZ25PQS9EeVRkNmdCQStB?=
 =?utf-8?B?bUY2Zks4ZTRQVW5YQTljV2haMVFPTjhrWDREZUUwWDBhczAvTEVwdkpsTnJz?=
 =?utf-8?B?MVl1MUpoeUdRRGt3VzdSL2VWcExpbW0zbUFxOVBaMVc2VFYrdlhzN1hvY2s0?=
 =?utf-8?B?Q0txWUh4eE13RS81NVJ3SlEwaW9wZVczWlBqZXBWSXE1bmQzQWsvdk1mQzND?=
 =?utf-8?B?enZEemhhV2p4cmgvd0pSR3VwZEtsd0cvUEE4TnhReFRzYVd4OEpOV3FFak5J?=
 =?utf-8?B?ajRxWHNvQ05sVHBycHJKQjM4S3pYKzlGM3psWkVxVnNuSWpEOVhDcGl1R2Q1?=
 =?utf-8?B?eWFaVEVsWGprTGlQcCtoSVpPbHJtVVN5M0Y0elc0TDBvQkY3SzRTeVN1SEFm?=
 =?utf-8?B?UEtrMkY1WlpTcC9sQTF2MzFaY3R6VzZtcFhQVS9WUklWcERmMk02cDdjWTVh?=
 =?utf-8?B?NCtuam5lMzcxRzNTYlN2djJ5ZGFMSmtkM3hHWER1OXkzSmViNGNtbDhZRDky?=
 =?utf-8?B?UWRCNW5JZDRaM1BaOHRoM0xLY1NOdnhaOWNrSFZTZ29DZFFWUWhhNHFFd0F2?=
 =?utf-8?B?WE13SzZaU0VvVWhUTGpyOU9qbkpKWTlPRW05eFp0Sk91bFpxWkdEdHR6QUNT?=
 =?utf-8?B?MGNGSkx2djBWVGlUWjJ2RVVjYngyMjIrZm9NcGhpS01QZ3czeTFteFhTRDUx?=
 =?utf-8?B?MXh2cncwc2hkRFVuUlFKdzZCalZXK3JRZHltUjZzRmZNSHFIZk9tOVJ4dEtM?=
 =?utf-8?B?SE1lTWdQU1lpOU81UDBYa2psU25sTGI2dE1QdDFuSWJXdUc2cWtFTTFyaWRW?=
 =?utf-8?B?Y1dLVWQxYlRLSlUzbGR3V1QvOXVNaVJPV1ZKME80VzZKbjVhaHFzMzBiT2dX?=
 =?utf-8?B?NlZRa2lPYXYvS2s5OGgrN0R2MWhlWlAzVUdVUkgrdHA0MTdFYjVCSW85R0E1?=
 =?utf-8?B?WS9VRFQ0U3gzQTk0ZXI3T0lOazA4ZzBSc2JVYTJVOW9GYnhUcm0rQUEzWWFG?=
 =?utf-8?B?UmxzSWdUcWpycDZjcmFmVjZUN0cvV01mYWVtQjVGc3hwd3dhR2lrWTd1VFB2?=
 =?utf-8?B?QmFxL0g2d0hXTG5iajJCSVE2RVVKSVA5LzJCcGNOamhOSFZ2R0E5ellPbVBz?=
 =?utf-8?B?eFpiM3Z0UVN3KyszbmowTndJS0lOZTgvajNDdGhOeFJEbjhNQXJVaHBlb1FP?=
 =?utf-8?B?TldQLzBmc1FyYlJKV1lLdVl1ZUlUMXpoQ2NnVFFMY2M5cnhBcUM3aWpwWjVm?=
 =?utf-8?B?dUNNTFRqQlFoMTI0a3BiV0tBNzJBbW54UDNGdVllZFh0NjRSeEpYMmdIYVAw?=
 =?utf-8?Q?2raX7IEiF3q+1/haD3uDF4th7CtlqCFdvZNOi?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e3864281-b60d-44a5-b102-08de55e84f3a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 16:48:58.3728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1K0AEK8GzUxj73HpZOs/tfX8YK9vEPPnSzGpY2gvfpcZHuphzgw9uusK5dt09+KmMJNjkcCqitRWWzPOEa/Q+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6350

On Sat Jan 17, 2026 at 2:30 PM GMT, Miguel Ojeda wrote:
> On Sat, Jan 17, 2026 at 4:17=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>rtable taking this through the Rust tree for this
>> cycle?
>
> That file is maintained in the Rust tree, so it should be taken
> through the Rust tree barring other reasons, yeah. I didn't start
> applying yet for -next.
>
> (By the way, we have `static_assert!` for this -- we should probably
> discuss if we want to start using `const { ... }` more instead.)

static_assert! creates an item and thus cannot refer to generic parameters.

Best,
Gary
