Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.87
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793602816;
	b=gSeJcBckWV54rr3vDG5FVMuaNVD9NTPEiUA8M58a4VaDghg0GtZlqmxsqSns8mImzuEh
	 63G3MRmIVDeJeZhc8GB4L7ZozZH0X+CnAqzh2NRNKfbQBRBSeQlWsRlAoSbGsA3nQIZp2
	 NNzYloRrpMhIbfcUq3bX9at5bcLPp5E+VlGlQFLn+WfXCHymV9XVYKg+h3fgW0yvezzar
	 95B5jzu2WOaiEt9tcDilCBKLaF+TcK5+MPTMj5gzsh6/ipJ14XeEO8ZctMKjAPf6g6azO
	 DEJeqW0OZ8Ss51j2tVK1L4UEebghPMvL3QPOTcLhLoNVvuXIKFGe6JeLeHWZeWtWzyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602816;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=grLOE6b7Zb2zFOhzuFg52BLxbPwonEZS5IuXAG66wUg=;
	b=dJSW+eElbmWv8CIYKXRcihimTCnnxZIKnh1Ki8NfwfnVwCtN8BPuog7nU1mWT7R/jCtV
	 mWeO/+gYgGzMh1QWXn0PyARfe+pd/SOkQZ7FCQ1pYW0gpe/Bp6TtCypNTE0WVd8VbLzJZ
	 Z0mEn2TEmiiwlPEvSDpDq2stXiT38OtEZovuwt2ZXuhJ4J67gG/UuSOA2PnDb4haNz/b8
	 e13NMlsJd6pxL3Bfn3rwp58woTpv0j+UzeRFnT6oOk4t1A1zfKYUwLQ1hg7hF6i2S9luq
	 Sq/KAHk1/UMbj/vxRemYQXcToIr31f5gOmqSYbt0J/kl7li0dHBJfxbYqETnTySYfzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=JDbIN3Wv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.87
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022087.outbound.protection.outlook.com [52.101.101.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76163606A324;
	Mon,  2 Nov 2026 07:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76163606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=JDbIN3Wv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9fCQL9Z6idwthVOW7Kj6JJr6IONtKPCf1xYH0JGmeG8PVCV2e2yU/pVqOjE01tpPyg7L3jmFnMbg1zeJr/cHOm3aKN4Nt0hYYcZ1N4YN1HLZTMpa5bRcJ2Bh2ozww4a4oN9UuEFKxlhJWGOPaQcie9wdWh6v5JDbxwodJUXIiiNLxkIEK4gyTsEZrMsoQ/xnYpQysz8kOkmybhniE6UQh0bYvNkOqeQq3X+5JrJafbp2YcvFqHwskFO82dYSsdD1lgSWzrSW/rKiERkdgU4TBJXF1dfvEmXGtsXVQ3a5rOMLpGxCEg69qqPckZU21j2BGGsL/xkfnjwzPdr6CurTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grLOE6b7Zb2zFOhzuFg52BLxbPwonEZS5IuXAG66wUg=;
 b=O6DwFYhhqHIMsOxEq3KgedP+tXCGu6+tiuADgGb5boydpQhkPHsku/C52WIaFJAJbmoRHAE1H0/oQcQyJN0SD75fs0pv7rsqCnoPqhO8qy5aXIAeEhW5g727PTy/36wEJMUlV76SAwNgSTCN1moX71v6hzj642ZAH3KgCglsW10l+CV7Pfxk8driiz94UbNUBiuVFoISypXByzsqefhS6cwKjL+KhWo6CRccm9zgS/dOlm6+LoNkrmKPXWXt9DG+KTmrEVeVipWhiS2oc1hypd6foy0KjFNE9Z5f6lo5repJkjaKsCxgDCk+8E5DjDaw5gHT/khoqQXGPPVBJ35vxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grLOE6b7Zb2zFOhzuFg52BLxbPwonEZS5IuXAG66wUg=;
 b=JDbIN3WvPboifc8rOlUe1ftD77ForYoLGw3PDqdaM3QkEN+yf3ZRLfQaup6JOoRxqPHZXQPgRhIPgUdREGpUCc6TGBFdEtiFK307WkRlU8KjJs8n172ov3/0BTjqzGFBNQ1WlsXSzd9xJ/5lhyLohIS4nG5mZYy1DWf0FfQV73A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LOAP265MB8516.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:00:12 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 07:00:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 14:59:54 +0800
Message-Id: <DMKJ4KS0K06Z.3ONOOG7PWEYWC@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Philipp Stanner" <phasta@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Waiman Long"
 <longman@redhat.com>, "Gary Guo" <gary@garyguo.net>, "Alice Ryhl"
 <aliceryhl@google.com>, "Lyude Paul" <lyude@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4] rust: sync: Accept errors for Lock payload data
X-Mailer: aerc 0.22.0
References: <20261022160725.2215244-2-phasta@kernel.org>
In-Reply-To: <20261022160725.2215244-2-phasta@kernel.org>
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LOAP265MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 68af947f-c990-4409-e226-08df38aef009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|10070799003|10067099003|22082099003|18002099003|921020|56012099006|261021123027099003|261021121427099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	hEKK/8/+mmWjcnDVKhT0tTyN45xyGFIdmz323uxp1Lb0Gis9pbmT56oZNdhlMfn32KhHBFMVOFURcyOY+J1SGs16cKLKl0J2ScTZi//QcHJVGodJRLNm0l3Mtv6OnTjjDclRTgQ5+SQh5LgKMjI5TsGjpDsgd6hrIasOCu1Rl6d1chVTfSCRocdo1JvOsRWmt6Iq4KSYcaY79r8zSGxADFelpNZBorOKrB3NR4NOwzXC+6f/zUUOBzlbe5xMh6miSWVN+BcDAIQt9qi2qEnK9UKp/aANq7nI1dJka2qGbUq3oXl+znuB8Szw2A0NDN+FhWgxK6ZmAyPq6G9nSNl7gbDtHz2WCP2Wp3t/1YbmBZjtZ7xZznA+WrEhJaS37C4++a1Dl0UfmFRS80sJwzjJUPakptTHMYkJ2LYxPViIn+6UgpmGHA1tBgwKuqoSPMW1L++Q44xxGXrtHpTT+TRdm4zqpxlX5gMb+y5KrBXZD6a9YHsiaywih2RbGqmWG4HysPBNX9Z8KK/NU+Gkxq1rwb0dYKMpKe8iaNfuBne4CQ0frRZLN3dNnACQGeJliZg76+VwYV7eweNH3mAPcfD4wXP6rLJoSPhtY/wXW/6VVLNYyLrekUI7oB927hohImAAoDRWj+gpHCQltH0+8HXOwZyKfPGb/3AiGNgqZVpBVOjGyxbESRefK2AEd1qpA/Av7I/NOht74y0Fiic+Sdl/QA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(10070799003)(10067099003)(22082099003)(18002099003)(921020)(56012099006)(261021123027099003)(261021121427099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2h1TWJvWHlVMDh0bGhocGdodWdKb1k3QmFLZm5aTGFSUGZaNndUQ2l3Y2gw?=
 =?utf-8?B?SXpuVGFLNmcvaTdSemVBRnRLVkUyNXM1d2xBalA4Qk03SnVuMDJtS3hvMkdm?=
 =?utf-8?B?Uk5DZEZXSHZjZTY1RjVlaFhaZEp2M2E0MTh4ZWNNaWpveW85cllVRWR6MGNS?=
 =?utf-8?B?ZkwwNFFldllzMU0rNGJlWXNSUkRleUoxZzVUb0srWkxtVnBpOVoraExFdjYz?=
 =?utf-8?B?LzRzNG5nL0Y3VWVLZUFEeFpQdjZUSGdIVFh3cG9sZUt4ZDBXcStWWlM1ODN6?=
 =?utf-8?B?WnJsSU4wUDJhcTFDa2w4Uk83bWFVQXJ6Snd4Y05PSDE5ZXgzcXFzTDNtdG5V?=
 =?utf-8?B?elZDZGdMVEo5cGVCQmlBVG01WlBVbUJLSmozaUJNNDVvVzh4STRoSURTVHdh?=
 =?utf-8?B?L2dmK2pyMGhnVHpTaTdVUTBvaEtIbDhQQWQ0M0x3L1lBMllKN2E3cFhUWkpW?=
 =?utf-8?B?cG11R2xPNzVRRTdDUnVkNi81Q3AweDJvQ1hDWTRzdng0ZllJTHZTK3cyeFc3?=
 =?utf-8?B?bkxodXl2TDk2Y3JtZTlrUFkyZTNUalM2MmVUSkVyTnYvUjdqM29YWW1YZzk1?=
 =?utf-8?B?cGVWRU1OYnZ4cklab0VyMUQ1TG1pMktVWDFMWVcvYmdES0J2TWN1bnUyYzdw?=
 =?utf-8?B?MzhVUkE4MXlGeDFYYnhHaTlkeGJxV0dCZklTQ0JTTDBMaGpCS0g4ZGFyRVVX?=
 =?utf-8?B?bmtMd3ZrUXJoOTM1ZlNaMmVWNE1qVjNVd1pqSkhHaGd0YTFhSUhUN1F5N2M4?=
 =?utf-8?B?bDgvRWxHb2xqd1I1aTVlUU5ldGlZNXU4ZzF4aitXOWtrOXVWNW55OVNzV1J6?=
 =?utf-8?B?UEhoQ0FKWTdzSlM3NXdDMThwYXdsT2lwWUp4Qm9hMDIyMzFxU2NWSElKMGIz?=
 =?utf-8?B?cHhOdDRtSEtXQnNtMTVFaUhiSkRmZjB0VkVBQjJmam1KQ1c1WmNTVDBsdWs2?=
 =?utf-8?B?VjAzOGFkQjMxSi9RY2pyOG1USzRuOU1nNm9WQk5hVVZ1Z2VjdjZaZzJaYWRo?=
 =?utf-8?B?Nk91SGJqVzBJaUt0Mmg2L3hpaU0yU2s0NlI1TklON1BQSldOdkp5NXF1eWZu?=
 =?utf-8?B?NkN1am5FMVUyclRlTko1THY4dTR5VVZac3FKb3Uxa0YxYmppcEdyWk9XTmFY?=
 =?utf-8?B?Mzg1bmVHWVJEMktpcGRWcFVtUXBVZk8vL3poM2l4MU00WjFuVzhVSGk2ZldK?=
 =?utf-8?B?VzkrYitvWVAxMytacjZMcHY3YVJDZnpGU3o2UXpUSFIyOEZnUUQ0ajJDNSty?=
 =?utf-8?B?WC84UzJsUXBxV3FTTTZnR0VhMkppcmNMRGlEd3dlUHRJL2FmWlh2YytrN1Zs?=
 =?utf-8?B?LzUvVVpTenR6UEt3Zmk3ZzdVS2RTVGg0Y1o1dWZpR2l2MjZ6cTFLZXJFZDZR?=
 =?utf-8?B?dUdHVUJpd1JKT1NzY1Y3aGlvUHphemZZdURhOTVmcWVZV09KYm5IeG5heEd4?=
 =?utf-8?B?SGwyZE5iNGZXc2FFVjZCRy9qME1qK25uM2w0ZXJsMFpaYnhNa0tjM1RpR2FX?=
 =?utf-8?B?Z2lmNnRwK0tVdVdGNnRxK2JQMlNSTEtCcFV4MExQR3RVZ1YxTy9DdGNvbTR5?=
 =?utf-8?B?S0wxNFBrZG5ocHE1WjJpUDlSUDVocVVORFBYT0lzZ0s2WEVNRWI0WjBOMzYw?=
 =?utf-8?B?ZmpIK1lFRWwvdmJNNnRJMHlmakM0RzB4NEFyeTJKdGkxYUMxTmJEc21ucEMx?=
 =?utf-8?B?Tmx5RWJYK2VkaENwOTlQRnhWWVRqdi9Ea1h1aS8vK2pyZUF6WWZIWkVBS3BN?=
 =?utf-8?B?QzVhQXZkUk14M2lTUjBRdWNLeG50RHNZdTNtSHpFclpOLzY1SXFnWENGU2JB?=
 =?utf-8?B?M29lMW9UcDlnVGwvOG5OTHhHdDRBVzUzeXdTZnVENVdoRDhZTklhZGNFb0t6?=
 =?utf-8?B?WkZ2MHowbFF4NkNaaUJ2dk55QjBZajRwckNBN0FEQWRTbmErazRULytiR3lU?=
 =?utf-8?B?UUorUDFDVUhzdDUwNHAvOUI2cmlwakNDZCs1TWxDTFdsYjVHREFvamdMYTNk?=
 =?utf-8?B?RXFQUGx3c0h6c2dvVXY0S3lpVm1MVFl0MC9NNjE2dzJrcWJGVUtabndDT3l4?=
 =?utf-8?B?bGdFTGl4YzJUcG9lMlc5MTZlNG1veE1kaWNaYnM2aEtBU0hGdnZVWEVyLzQy?=
 =?utf-8?B?RE01T2NZSVJhQ3cvQzAwNFY5akkrK1VYSHRIZGozSUJGaHZGcW1nRkVrMkxX?=
 =?utf-8?B?c2RNT3dhWkxaaEpjYUZzR2dKNnltQWRpQUNrLzVjYndhS25yWGhmcHl2MVhi?=
 =?utf-8?B?QUtvdTdEN1VwQ0RpMVBHYzRGN3RINjB5L3lSQXd0UVFDN0g3NHBub1lyWm1n?=
 =?utf-8?B?R0k0bElOaUE0dmxSMU9lbVNQRjRqN25UUHdUdWdpdzQrZ1dBbUJsbndPSFp3?=
 =?utf-8?Q?3DGTTfaYQUDAA+A1Wo/xbA2PtOAZADO1jGF9J?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 68af947f-c990-4409-e226-08df38aef009
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:00:11.4082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q57xmyWv8D1aMt/Ode3ihUehpYHlUHtVC56aJCUKYlZ5gmCwisikp9PMdfDLCw1KTXw9O8Ciu4PYBHLzBjRDNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB8516

On Fri Oct 23, 2026 at 12:07 AM CST, Philipp Stanner wrote:
> The `Lock` baseclass currently does not allow for fallible user-data.
> This can cause conflicts when used with other primitives, for example
> when a lock shall be pin-initialized with payload data that is fallible.
>
> Add support for the lock base class so that it works with
> try_pin_init!(). Adjust spinlock and mutex accordingly.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v4:
>   - Do imports at appropriate places. (Gary)
>   - Remove unnecessary changes from pin_init to try_pin_init. (Gary)
>   - re-run rustfmt.
>
> Changes in v3:
>   - Vertical formatting for imports
>
> Changes in v2:
>   - Don't import prelude in doctests. (Gary)
>   - Keep using pin_init! over try_pin_init! in Lock::new(). (Gary)
> ---
>  rust/kernel/sync/lock.rs          | 28 +++++++++++++++++++++-------
>  rust/kernel/sync/lock/spinlock.rs |  5 +----
>  2 files changed, 22 insertions(+), 11 deletions(-)

