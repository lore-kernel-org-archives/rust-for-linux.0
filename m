Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794637850;
	b=bAeZIFfQFHGlpPpliHgJ8nOdsGwlGyk0A46SM4QZnuYTEoYNBZ+EbqDFbJAM0bM5gTuy
	 Vn05TCeYPE8wc3Grd5OgFasyhXjiOfyI1SSUbd8m6QUwfEJIRgdUyM5fNbn3MU3xDXsn8
	 1QFCAqBpTeaPkItZ+5aTkaEqy8MUSRCGW3XyrEGYi9iX4TN1wKjl212Lf/gvjE9vrCG4v
	 Nio7Cu9D4eDxyfc1xTUAcIXvyPqIH+eQronGo4IzLdLFWaGqHXsQ+GxfXZgmPG9LeCSRa
	 kbtn7pAFBBGi51O2aaPyyMVghMnAJf+NqdRollWjtRkoJLbyk2BeWpjKClAKotfcEjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637850;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XbImGnokoq6o7JoIiZ+apR3fDoO5DT9pbiENdElzWQ4=;
	b=nMBLlict9Od1Rr80uDLLWcY7GexzKfhf6xUvF8lfZPNTKMZbw2xTNRYXG5/0z6ePODjR
	 5mIZh4ySg5JVKnfGdyn58809+Rb/V3eu0k787cQeNt43E5Sm8ZMe1WzNh241y6yMG/Np9
	 hjyNJFsZzgmlN/AVxbhmx2qWRVOqi2muh9ZjYAMpQKFB+fijbOFFh/ecw0RnYZbSJu78y
	 9TTg67lgU3kKRWLfZhUB0D/KQXVNgeU1oyVvXHbR9vk8FYC2FRsrte6FdzBDnmJUHWYMC
	 kNZeGOFx5kTz4uPrVOVyAan6AhFTpU0s0Y8y25uEz9F3guCMDzEz3zx988oqT+XSDag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kdU2Zd9v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.31
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013031.outbound.protection.outlook.com [40.107.201.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE61606A327;
	Sat, 14 Nov 2026 06:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE61606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kdU2Zd9v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1vnz47wCA9ohGwXS+M96Q6NytOboKmGgGsem2jxvzzRHQAR0UqN1qu83r1VOGMZb1uw9WUQFdt4j8sdk6auhcn4cNOTVNks/GcDmYvGBAxmEozYTcHUMJ29BEb49DRBfYUpMaohzEbPjPYiJsfaPoL5eu+AGQoGTjzDKHaFZvwlbSdlCCDTrnZWP2wwNBoVtERo0ZSRsmnqP+a3pH52434ZUqmPfL9IrmZEYD3UQovfcYZ4Nkmzdb/k0YKeyEAQtDO8vwb19417ICWZJ5CBlc+7CuAIQGzUXF04Li2HxpEsRD4xF7ES772G0Nnl9e3SWqybUEMqvencXGRlNlL19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbImGnokoq6o7JoIiZ+apR3fDoO5DT9pbiENdElzWQ4=;
 b=h4ukX3vFxDaf0KBVeU8oGgHXTq3ESc4yGvh3P1+T4d+CBytLbnovU3Y8Rfdwm55tJyfRgt42FL+XcTJlhUbhth4Hnl9tpJOJeLA6qS6QJQE6L75trjK04QkP/LsBfEk7vlIxOY6CJCeTr4hyhhvigbaYpmjF3cD+R02+QSocZrLzogydwRboivRuE9ncIH0Ng56Df2IO4x48tXb8Se40+qJKoyFfeezKv7P7mYJ5HAVC8ZGJu+He9dMiKlgGMBVV8Ve0vbAfbQZffyPPrggSyPNu9udciE0GXQLZW+f0UdMPpn8uhFQEJu9KltZ56CxPL2xkv5gIMc7vJ4Ann7LDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbImGnokoq6o7JoIiZ+apR3fDoO5DT9pbiENdElzWQ4=;
 b=kdU2Zd9vOk9Oj5nn1sjo94VbK12nXw3rIF+D2gLCVnRnBkBOXWG2MEf7/xBGhSckLuUOtwlxSgNJwyGW7rJqKTFrfd+gbO16CQoVfjzmLD1/Hwgc/6vkAKjqYJItumZPcydqghBvpPhrukOpRH2KOmTj9A7lsPcUIfnEdxCYpEiKU/2RugHBCL0GG8ZtZNQaq8vXZzDwq7Y6GkjCcxgEHT7o5nERGI8kJpvBdTJR9+tB+I29dOl1Tq2RNUdtc5jNohD8EyRrHwIFsR2tRXKVpfiR4Hphiuhr3UGFgi+yI3JzoVlfakZspQZs4w9VRkV/PEW2s9Nb8QTjQWWbfFwOGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH7PR12MB6585.namprd12.prod.outlook.com (2603:10b6:510:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Sat, 14 Nov
 2026 06:30:46 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Sat, 14 Nov 2026
 06:30:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 15:30:42 +0900
Message-Id: <DMUQ0R92HOFF.RHMRR3F1JDES@nvidia.com>
Cc: <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <tamir@kernel.org>, <work@onurozkan.dev>,
 "spidermana" <xuyiwen14@gmail.com>
Subject: Re: [PATCH] rust: kernel: fix lifetime of copy_from_iter_raw
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Marwan Mohamed Zein" <marawanzein222@gmail.com>
References: <20261114024515.1000882-1-marawanzein222@gmail.com>
In-Reply-To: <20261114024515.1000882-1-marawanzein222@gmail.com>
X-ClientProxiedBy: TY6P286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH7PR12MB6585:EE_
X-MS-Office365-Filtering-Correlation-Id: 201ece68-5da0-484a-f2f7-08df4218d07f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|10070799003|7416014|1800799024|366016|261009223027099003|261026140227099003|261028144727099003|261022105027099003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZZGAGIQTjSzDd5yv0crV7N8Umz1fzsnt/B/rUPiBvYJzlg38InEbPwetrnItO/JElLHa6JWbGyaLGODbnFvr6k83DW7aiMgFyeJqVZqCUDADO7lNq+6N0ul/nfN/qa8WHxCLrVOx7HkXgHhmD0AYBiGjxRB6fyGXFHTjRUipvfNx8dHVBumzUvzqIKHNXpIU13ANT+B7RSfOHRb9bspq5ve6cy+7L3jR3vEysl04o34E4HT98mWtH9ySLlaqRMX70PQ9Fi9jVhSv4gsxLsGBjFBlMKUtRXAib8ZRRrm7XaruZjrCH4VEb8GBCxkT4wOnJbR6fvnhGHy5Duo4vaEBJmC2ECFqAqhX7z8X/7/vqzmqCsEc4heVzJsfv92csY93IE24xQmKjZ0U2/FipSN/Hq6k1muI9n0fm8bK60UgozaJP10s4QOg7N4jqr+Byv/NEECfT89XyjD+g57vPMIrGxA/E9KNjq6uAujkkjZKUB7jrq9l0Sp0CjNW0aVh954a+MmI/jnlTN+CJkfSHFTxLLCzVGsZORQIdLkt7Ccp4xacdcQ04xOpOBRN0Zm0TY0JjW2GnJm0todA9Wb2CEdsQ7w4XvfRcV80ieV8QIuy5A+bWvtS1HAja6MNNYDP/XS7UztcNzksc63PReLjlFQnFTOFL/nkXnkT1VX21zulKDE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(7416014)(1800799024)(366016)(261009223027099003)(261026140227099003)(261028144727099003)(261022105027099003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0xiQnB5NHZTMzJxbXVWZUExY0dTY0NBdkpsMDZoSzNiVC9vV09mUHpva0ov?=
 =?utf-8?B?djA2ejZRZjNldnRHUlUwcUtPcnVtVU04THNhN3VVT2JTdEQyL0tDUW5ISm5h?=
 =?utf-8?B?WHB3QVRVMHQwVTVQUGZGRFVQTkFJUmdISk1XYW1aZk5MdWtyWWllNWsvd3Ix?=
 =?utf-8?B?dTE5blhILzZ6RHVJWVVUcjltemlBOFJnZXVXOHEzOEhWckVGell3c1FjSkZ5?=
 =?utf-8?B?NHIwVHR6a1drV1dEMUxEYlBReHpuTjQzWmdwMHBEeGVXWHgzUGkvVy9CUHB3?=
 =?utf-8?B?Q3gva2J2OEFrbytCRUpYbWhSMUUxbHNBdzdkUDdGakdTTzRWRkp4RG03akN2?=
 =?utf-8?B?d1lnMjVSTEZqaER2b2Vzek5XNjVJOEUyWEVHcEQ4bnZIWWpFQ1BGY1A3OWR5?=
 =?utf-8?B?bnFpNWlFRDdscmoxNnJHYUtqTFlUN0dTc1dXS3JVSFhFcG9wU0tTdlNna3FH?=
 =?utf-8?B?a29Fb2l3LzR3clFwcDA5K2o3aGVhZ1dkdW9ydFdmNGZxc2pFU3BSeGo5R29T?=
 =?utf-8?B?elVvYkV4YTRIS1BUYjFGdVBNNGpDUjJUN1FnS0puUzZFR0hJQUFEN2UrM0xY?=
 =?utf-8?B?RXpyeE9Gc2svbHBxQkRTVDU4bHRqTmw0aW5aQWdtU21XcnZjVnpRSFhNTXM5?=
 =?utf-8?B?b3FRdzJWZmtUZVVpOU9RWldGT3RGTUQxVEJyc0xWek93Tk1vV1BvVUdqRUoy?=
 =?utf-8?B?ODNyYXFIN1VmOUs4UEZWWml6elpQOHV3cjgyZTZUbVNiSytxeUhncVdpQmVu?=
 =?utf-8?B?V1MzenRteTFxSGJBMnA1ZC9BTEpsamNRaEhBU1F5UGFMdGZ1VEZzSTlDR3dV?=
 =?utf-8?B?OS9OMGJXbEVWVU1uMDV4RjdrQkU1Yng1VHczajNPU09CWkJIbVJRQURGYTRS?=
 =?utf-8?B?UXk0aGhhOGVjYjl3aTNiSmorNTUzWWx5VmN5dTh0amE0QjZWZkdBQ1Y0L3ZM?=
 =?utf-8?B?c2pVbFpOdFUweERlVWdaeDVJUWVMRFNsSjNTdlo2TVhvUk9ZMDhZcnpKSTVH?=
 =?utf-8?B?M2FRcS93MTlnZTJtSnFnTlhBdkRpRk0zdWhlY2pXb0pieG5iNmZyczBzYVhP?=
 =?utf-8?B?Z0VaSGxIT0NoOTV4cndHK09qMmJtUTI3cTh6SzBWS1U5SGNBbTluQkNyQjly?=
 =?utf-8?B?Mm1DZzF5L2d0TGorREsrYUJsdW5wMG02RUtUR0xYWFFZSVdoM0kyUGNEVGJh?=
 =?utf-8?B?dDA5cmxPWVZXbjJGTjUrT2xCaXJUeXZoQVJ0aVltN0NldzR1RWNYcjBIaGhi?=
 =?utf-8?B?RG1uTjVjMVNacGlRcTVmS2t1VVJXc2p0Q3JHQjNpQkxMYnFSZ0oyRFhQeW5K?=
 =?utf-8?B?UmplUmRiZ3d3S3BhSk9USlg4V09GSUo4M1g0TEhnK0hJaDFIdnFJM0E5RXZD?=
 =?utf-8?B?TFByL2t1Q2tBckdQNTRDaXIwSGkzRUF1Z2RhdU5VVTEwbm9kaTNMQW5pOFFz?=
 =?utf-8?B?d1ZmWE4rR2s4N0s0dktuRUdwZDdGL0ZXaDV4TE5md1NnZlUvdk1FWCtFQ3RH?=
 =?utf-8?B?a0t0eU5qcjFSbnlrbDdnRnlVZko3NDE4ekUyZDB4V0NGWDNxQy9Gc2tPdTBM?=
 =?utf-8?B?d1BLdTdCOFpIN2xWK0I3bENjdVJhTEh1SjZFOEZONjRUb0tVd3Y5VE1OMjJ3?=
 =?utf-8?B?eTdseG5iWmk0T0hLUnpkc3J5R3hLK2hoZllDQ1k1dG92NEYvdWtWK25UOFph?=
 =?utf-8?B?U0t5QWcrVC9EU2h1ZGlQd0hQWnNRdFNwNWtpSTU0TzlibzAxdnluZzY5ak80?=
 =?utf-8?B?aXJ3cVVMa2xaWml5WmNVM0NXYzNrNFQvTHRQYWU2Nlg0RCsrdlhlWlYzSWI3?=
 =?utf-8?B?TStmS1ZFR0N5cDBCQXFJKytZVDVpZlV6V1BtNEloRlN6L3hvRTBzdzMxS0VB?=
 =?utf-8?B?K2pVRzJ2R1pXRXpCYnYrK1Z5UWJYQ0x6UVhZbHFaV1RTelUxS245YU9BK1M5?=
 =?utf-8?B?YXdUWTVLeHNpRlIzb3FaVnB2N3cxTXEzdWViUTljMjd2RXFRdmZWR0lvTzl1?=
 =?utf-8?B?UCt2MGhYaFlUYXFMTTBCbXpHWTJPZEk5M29NY1hVdW1BWG5xb2lyQXU5VWRp?=
 =?utf-8?B?a1ZyL0NkNnk5elR3ekQ0SUVXVlkzTW5xSktjcjFvRUszWHJ0S05lZWFlNGdB?=
 =?utf-8?B?cTQyclpKVEtYbzkxUGR6b1JMbXVwdmtmR2d1aUpsc3lyczR3UGJicFFGb3dW?=
 =?utf-8?B?M0dsUVNieGxCNHo0bzA2eTlkWHRTUDRibmczY2NzMUNWbURqMDk3dCtrQkFi?=
 =?utf-8?B?UHUvNlAvMWpFaWdnQ1o0ZEM2c2ZyOVJjZ1ZZaCtiV0x3RVdnc08xcm1tRllw?=
 =?utf-8?B?alB2RmxxU0dSb1QyOWYxTGQrWVZDUHdsL3ZzejBINVFHWFdkR1FyZWYrUjVj?=
 =?utf-8?Q?BMMn8+Gj3/pf13Wp1vuSUjudHpqQ+NxS/XXyXK28hrxpo?=
X-MS-Exchange-AntiSpam-MessageData-1: 1B0LTEnubuUeaA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201ece68-5da0-484a-f2f7-08df4218d07f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 06:30:45.7135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBwk/0Sv6sMVPRiykxMsEiYy7TYHpy+zvh9J7g9tGXRVV7CWKtVaJ7zCJhM++yhiEX54KhMGH6YrARtvqk/2BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6585

On Sat Nov 14, 2026 at 11:45 AM JST, Marwan Mohamed Zein wrote:
> From: martell0x1 <marawanzein222@gmail.com>

Please sign with a full name.

>
> The returned slice is derived from `out`, but lifetime elision
> ties it to `self` because this is a method. Explicitly bind the
> return lifetime to `out` so the returned slice cannot outlive
> its backing buffer.
>
> Reported-by: spidermana <xuyiwen14@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1265
> Signed-off-by: martell0x1 <marawanzein222@gmail.com>

On these tags as well.
