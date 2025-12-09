Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012020.outbound.protection.outlook.com [40.93.195.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C23221F11
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 00:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765240055; cv=fail; b=YHp7x4/8OL6sv3Ck3F7eLfKZU/HDK4ITzdfEc+k1/wkMUoij8sNhSJo7k3AwM0TrTrQiYCYemp7wGEc/CUGu8+cRu0n+bVOezMfQU/yQK7fsyPcXs9MfL/yNgQCZoqOzWHB7pqZeM0CSEkcH3v4y36IwsgpzkVzyDS34t6cK1qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765240055; c=relaxed/simple;
	bh=9VwiCzKBm3T0HtnlTuz83osbe/MN0XwIiiEC3hgHQC0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=rqUTyXF6Cvt6245sCXi7F6AxdZpCLdA/YtcSPB7yeD+QGzE6gn8cxgS5oR8SDzA/R0zTg+3XahKKxqNHf9IJFI/JwZVpzyNJDnMbvpfFLR4TXSA0a66SHIT4JAfiSv9zQu4UZdWFNsE3W+wx7EkFXr8zpSkT99Ghj1pBjGVPjsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TCSBiVAn; arc=fail smtp.client-ip=40.93.195.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TCSBiVAn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKgkegmz+ChdWMvmKpu4HV322GBD7e3KXH+NfR8jRUUReTIdjD/rohTToo9tqgSmA1nqlr0rGv9RQxMQxLV1unVAj3k+sxA6kw/M4fbEz4ghv1FU7s/lopTGJM8U8Xnzg0Dad3+8tz8/l9n6NWRAvG96Iu1310yGa3V4Qr1W9BEt39S7SnhbUcREH5t6VieJoMVQzVbDfTMgsmg+8mxVY/ANtpo4sYstOVmzIbFMMzp06UdKo6ZhqP3PZCbnonRvtv9VStAvqU77byur4BVkyCtFRzUvvAZqSE+9j+SpDqLldacuwcEKjehTmnnOjjMR1ziX1WFdkXtLUL+OeFe9wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNVqhfb+Pw1P6WuyePRtsjJeQC8z1DN2Ma1TAfJFxDc=;
 b=iCQhR0HgxxzCfJz/0L8i3w6t+Oy8Tk0r1a65vdko0DY7AH1SqB/NOD1HsR9YZC32B3cwJtUrwurgl64gDr7tS//csobK10EhopS/ylHHC8EYmZoQ4sYCyGSIq28g7ASU9Nk9nHzEJGiUczQtZgnkSSjNLkSGF//SnoOJCY+0uDqDMFAGjHLBug20Fwn79GLP4AUBeL2Bb5+AlUE7x8P6PDMrvpeIzt6XDEF+Sss8r2Kr2vISCtbH2LmDToY2YyCdZwejL7Bmne4h26RrCKaSh+SW+TYdxf7J+dl0YkhXDC6R2LZzTcIWDTpuH1bQfdHFJedoI48Jm3Yfg7M6IMNghw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNVqhfb+Pw1P6WuyePRtsjJeQC8z1DN2Ma1TAfJFxDc=;
 b=TCSBiVAncYCVmtRM2CZ54IINNZ2RM933JSzD78o7MsDz1nHOpNzhka6mwZ5on5jhZT93gxmYniSH/gFllkS8/Klp/Oz5A+soV4XJ4J9yPsglwU1f8hG3ew9yAhYV9ijE3id/OwYBaHlrdmPE4fMpQvJ3/JP/RDagtBUY2KcX4Lm1IF9MYFRjo2QgkQs49exk/hWGjq4vtYzIUUuJ8+C9oyHOcFtEMYLB8urNL2qU6g6uMi8lllaHTsSzua/WVjw//Nzm2SsbyBrV9dQOx4DQUadjcFrtV8UYK2MVuEma9I6hiJ7wlyyK41ntNSikJfUqKLiGGcSAoPi1MygSXnxiZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7372.namprd12.prod.outlook.com (2603:10b6:806:29b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 00:27:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Tue, 9 Dec 2025
 00:27:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Dec 2025 09:27:25 +0900
Message-Id: <DET9DDRLLQYT.1LUXV5C3U6ABB@nvidia.com>
Cc: <alex.gaynor@gmail.com>, <ojeda@kernel.org>, <peterz@infradead.org>,
 <will@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <lossin@kernel.org>, <mark.rutland@arm.com>,
 <rust-for-linux@vger.kernel.org>, <tmgross@umich.edu>
Subject: Re: [PATCH v2 3/4] rust: sync: atomic: Add i8/i16 load and store
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <acourbot@nvidia.com>,
 <boqun.feng@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
 <20251117001035.4068507-4-fujita.tomonori@gmail.com>
 <DESI62R10XIZ.245BISU72Z2V8@nvidia.com>
 <20251209.081456.1519886345847572170.fujita.tomonori@gmail.com>
In-Reply-To: <20251209.081456.1519886345847572170.fujita.tomonori@gmail.com>
X-ClientProxiedBy: TY4P286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf29bc4-d3e8-46b9-35bc-08de36b9bcaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dm1PeVUrYnJXMTFrRk51L1RxaHJ3UlpOTUN0U2VSK1B5U3lPY1dBNFRWeE1r?=
 =?utf-8?B?TTExUVRXTmliS0wzRVlYTnB0M1IzcVFZZFRkWjliR0lkRzVvcmIvNVdTZE1H?=
 =?utf-8?B?bzIrem05UVdvY0hLSEQ5MC8xZ1VxcHFWSE53MlI0azZMTldRaTljdHZ1SkE0?=
 =?utf-8?B?WTkxblBUb2hxK2ZKa0hacC9EOEowS3FPMkZZQm5aYmQ5ODZKbnlwK2lUL09p?=
 =?utf-8?B?YUZkbmRoYlJkTXJpVkV6VmhlRzYxSUtpNzZmZ2JxVlMrKzNWWkxrclNMT0x0?=
 =?utf-8?B?SDZNQTdUWlJCQ1lVOE5keitBQWlrdWRBYUh5L1UrNlRlekxHL0pwYzB5UlE3?=
 =?utf-8?B?Y09ldFNHbm5MZUkrQmtkUmxMSFBvd2tDUmtvNjVudnZIMjBYd3NLVDk1RmVv?=
 =?utf-8?B?ZjJSMHdxVURVbFRRMjBSNmVCSCt5Q3pwMGFUa3VwUTJoRjFaU3BHR1lUVkVM?=
 =?utf-8?B?NUZQVUlIZENRTEpmMU96ZjUvTitwVWQxdURyTUp0RWZkcnFqWE9sczEwdDUx?=
 =?utf-8?B?OEx3TU91MS9vR0h4TzhNdjZLY29FVFR2ZGhVQ3ZhYXFoTWNRd3didWJ2WCs1?=
 =?utf-8?B?Wk5aQWFUVjErdGhWYmZuOXVaRWVEcVlVa3FOWWhSR0JkTHFIK3J0YTZYcFBG?=
 =?utf-8?B?OFlVYUhzREw5MW9ib2ZrRFM4dGJBNEtIbVFtR3E0SVFNOTdSVEo1RWg4NHRW?=
 =?utf-8?B?S3JVOVQrbTVobDhVUDBBUmFuRDBYSlJNM3pNOTFML3dwQU4vUVpJelRXSDAz?=
 =?utf-8?B?azFQT2tybVZuL2JuRGFLUllhRHUxZ1ZCbnhCVCs3SWJ6WTdVMzJlYlNYWCta?=
 =?utf-8?B?V0ovbXhnQzNLeUVUd1VHL3BzaWV1eHQzR0J3RmQzOHR5OTFpaHdGVHh3ek1a?=
 =?utf-8?B?VlozVlM5eFBwWnA3VldrN3ZLTUdCb0hqamkvMGFOUDQxcVZXM1BFdmE3K1pY?=
 =?utf-8?B?N3ZnYitGZXFUMThhTUI0Mndxei9jaHVFaVdKRFhNSm1IT1VRZVBrdXVqdUgy?=
 =?utf-8?B?bTE2TXNCS1RNa1NLcWMxeEYxU2dCU2x0a2tqcjBLazBLM1pmNlhnaUFtMm1Y?=
 =?utf-8?B?OW53MnUxNFZGQWRGc05JaWJ2MlJuREM1ZHpwNWszQVk3RDJkc2l5ekNQOS8z?=
 =?utf-8?B?dzg3ZHhlbllpSnlyRnZPTldlMkNLODBJL3hQRXpOQmxGMXJlL1kySmphdng1?=
 =?utf-8?B?UXhoQ3RTMUdtN092SW5xWStsZk0xVHpsZjdWV1hEeTV3OEpHN3pRSVBEMGUr?=
 =?utf-8?B?TWpUZWRNM2tWUlNZQ1NiZEhCaFFtV0Zoclpjcml6SHlvOTJMNUNYa3dZaHVP?=
 =?utf-8?B?VC9RL2hmSWo2dTFuQldXZ1JTblhRYWl2MU1LVHh6TEtjcW5lWXF2QUVKWXJ4?=
 =?utf-8?B?a2UrVEkzS3RpcFIyc3NZc1QrVnBqS2VIRUNMZk1mbkJ6U3JValhRd1ppM1dW?=
 =?utf-8?B?anFHOXphcy90RFVmbVNpWW41U1dZVU1SVEM1VTJONVQ5S1pObUdCKzJmTFh1?=
 =?utf-8?B?Zm00T3hOcGJVTWt0dEFFSlNCUHYxYld5WmZqZk15Y2V5T25wQ0JTOXVYRXlX?=
 =?utf-8?B?VXhkWE1KNlhIRmJlVUVHY3NuRzRyZ1BrRmZBSXArZ2xhUXZZR2FadDQrWFZV?=
 =?utf-8?B?RFd2WTExZW52cXQ0bzA0d1JzZjQxcXB0aW13d1hJcEhXZXNkKzc0dW52UGZB?=
 =?utf-8?B?SEpHU1o0blRWSlNDeVJsT2EyQzdLMzdTeGpRVjJyM043UVh5Uy9VZEc3ODBj?=
 =?utf-8?B?SFZWQkVOK0duUnNYVlFYeXJUVVI2S2hSOHdETTZjOWVaaFJwUFVMK1F6S3FK?=
 =?utf-8?B?VWF4Q0V6TVVmd05CT0RJYkdwVVdPOS9rUTV2SnppaGd5ME5TZW5RemZ4bUFO?=
 =?utf-8?B?VzMzSTJra2wrMTZHWlJIUW1zYkptTUNLTW5ZRlR5VHZ5b21qUzE2S3B5NThY?=
 =?utf-8?Q?pnfsPQ820eM0C9BPlyh9bm8KaxEbUP62?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K28wa0FTUlM2cjdKSVh2K3ZoL0dWTVh1QXdOK1dIUkVHd1ZJWmt3VzFHTG5r?=
 =?utf-8?B?UUxaRFo2SlBsN09ZTG1XYVQ5UGtVSkxNeWNFdUM3WS9HaXlVZ0xYZmoya2Vj?=
 =?utf-8?B?M2w3TEk1R0ROUDhFVUszRmtYVFhlNkRDcmJpR2doaTVRZmJ5dlAwUWRlUlVt?=
 =?utf-8?B?RkV2ZWpYeEkyWEpCdDJxZVlQZXNlc1B2SlpsSDB1S0ZqSks3UC96K25maS8z?=
 =?utf-8?B?V0tmZnZ0U09oNU9YdERPN2JCWHpIVEY1SDArelUxWVAxczJxL2lyVitGd05K?=
 =?utf-8?B?RVorK3NFVmpqWGVBWXVYeWFySGh5cWcydjFDaGFMY05QV3daV0Q4VlhsdS9L?=
 =?utf-8?B?cDFXbk5NeXJFWDQrSW5oTHdZQktSekt2cEJkS1U5a3ZocTR6aXZBMVJjL2xh?=
 =?utf-8?B?aDZPNDF1L2c3YlhYQmZ0M25mMGk0Z0tiU1RxajZjSEd6MWRidG9BeEFIUXJZ?=
 =?utf-8?B?aHZLdjlkcS9EbG1qWWVuRUJ0LzJKZEtScGpNUlhtZkFhb01TSXVxbHFKQktJ?=
 =?utf-8?B?cnJFbXY1NzZUV3BpTkw3ZkhiSUV1cjZlUGxuam1keHQvTEdWamwyamRXWnhi?=
 =?utf-8?B?cHhxL2xEdU5qZUFRdVFVT3FuR0ptWUxiYUlTeXM5d0UrRWhZWEVUbFUvS016?=
 =?utf-8?B?WXBaaEhmM2s4azU0emEzQWJUSFFFNFFFS3BjeDVQM2ZaRDJZbDNmVVBtRlR1?=
 =?utf-8?B?TkNSYXhxOERHOG50MFgrLzI4RkI3UVJTekRLWXZ3dXgrcUJ6cHU1UE5qZTdq?=
 =?utf-8?B?Y3pYcEljUUdxYmxxSk9RanR2UGFjN0MySmFUbjRZeE56bmVvVnljS3J4aUhp?=
 =?utf-8?B?ekR4blJKTExMRU9vUFBRb3g2ajRGZTBrZFJpbnYxU291YnhpaVYxR3FHcVVk?=
 =?utf-8?B?ZmZyMVJRcG9Rc3hGMnY1V2Y4MHIxYkNYUHg3UlZyYkQ2Q0tOQ2RBcjh1NzRt?=
 =?utf-8?B?TDREVlF2cmoxMHJES0w2K2wzMFhJSjF5Tm5yMHRzRDJVZ0FvRnVqTHlaOFF4?=
 =?utf-8?B?UHlTNUR0V09lZ3cxUUZLTEhJWWlTVHVxZS9ucUNaaW1TbXhZc0hvNGQ2N3dS?=
 =?utf-8?B?b0dra2JJbEhJS2ZKTzJLKzNiVU5SMVZvanQrcEJGV1hlYUMvUHd0ekxIcHVy?=
 =?utf-8?B?Y09TVTRqYW05c2FPWHFRZUp5a0VFWFRHVU1xckRYK3NzdytzSFhvdEcxSTVl?=
 =?utf-8?B?dy8xQ0NuWVVRM29GT1BwS0ViTXpDNkxxWGtFMUtoYS9FcE5yZ0t3SnFUU3Q4?=
 =?utf-8?B?YjlRdjN1RmJPTTBRKzZIV2d4V0J6Tk1MVWFNcGM2NmhoMzNUblMrVWZKeDIx?=
 =?utf-8?B?UG9JNEcxN0dYdjJBNTlXb2drUUVqWVpSVHJub0VwejU1dnd6b3E0SzIvb1E2?=
 =?utf-8?B?K3BtYW5LNWJJcHdZVkZnQ2RzUmExNTJUNm1zVmFiQzNUQlZVS1JpSHpBdDY2?=
 =?utf-8?B?WTVHSUNVTU1lL2JUZFJqQmF2MkFIWVprOGhMYUJzTkYwWlhzUGF5THlwS2hp?=
 =?utf-8?B?YkhQYVhzUXNJa0FINCtHN0pIMnk2eVpsbzVmODJpWWN2QW5vZVVRNUZRSm10?=
 =?utf-8?B?KzJURWcyZGZ4WnFDYWwyRGs1R2o3VUdZbFdGaXBrS2p0U3FXQy9iOWxKWk10?=
 =?utf-8?B?ZzdiSVQ3aXY3aEtqMnZEUm4yVzdZMUMrZHZ1QWlUZDRlS0tpNXVYbGMva1F1?=
 =?utf-8?B?NmpHK25UUFlpRW82U1dYU3Y1TFE2WHVtMFc0RXpCQjdaaUtrRit5T2RFOEdF?=
 =?utf-8?B?M28ySWRIK2d5M1g5bmFHU0MzcmZ4czhZcFNPYU9mM05FYUdaOFpYRXY0d1RH?=
 =?utf-8?B?U1lGLzRLNndhM0tURFVYQWdwOXo3Zms1MStVTHVVL0JlYXNtYVNod2V6aHF4?=
 =?utf-8?B?ZWtIK2x0TzdwMUJqcHFjQzFQVUJWSE0rRHpLNm0xOFB4bXY3TnNsUnhheUsw?=
 =?utf-8?B?RDNuTDQwVEdmcnNSRVAyYkJ2NitBU0Z0cnY1cjRJMzRyWTVTTFZWZnZCUnBO?=
 =?utf-8?B?T0lhSkVjL3BrOHREMEZwSkYrQUhVOEdsdzdONkp4T1oxdkhJTExyQ2E2UGR6?=
 =?utf-8?B?SXRVTmc2dkxKZUtXM2FyMFFpZHZiTFVJK1RzRDFPTEh2bU4zSFY1QlFHYWI1?=
 =?utf-8?B?cERJZEdJQ3B0ZHR3OUFxV0pVWVFiYll4SE9tRFNIV1F0SDNvbXNhL0NGVXI3?=
 =?utf-8?Q?zQ0H8ckxEutzU7YR1mOaIgyYoWQU4+uOpBPmkV4YXRaf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf29bc4-d3e8-46b9-35bc-08de36b9bcaa
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 00:27:29.7959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVOUQ/1dMSbAMky6QGWszNF2aM3STVMnqt2H7qfwSdE9pg265jKjRc0pKG6U3/F3zh2CV94z7qZtZpW2iNzGmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7372

On Tue Dec 9, 2025 at 8:14 AM JST, FUJITA Tomonori wrote:
> On Mon, 08 Dec 2025 12:08:23 +0900
> "Alexandre Courbot" <acourbot@nvidia.com> wrote:
>
>> On Mon Nov 17, 2025 at 9:10 AM JST, FUJITA Tomonori wrote:
>>> Add atomic operation support for i8 and i16 types using volatile
>>> read/write and smp_load_acquire/smp_store_release helpers.
>>>
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>> ---
>>>  rust/kernel/sync/atomic/internal.rs  | 48 ++++++++++++++++++++++++++++
>>>  rust/kernel/sync/atomic/predefine.rs | 14 +++++++-
>>>  2 files changed, 61 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/ato=
mic/internal.rs
>>> index 6fdd8e59f45b..4c9f4f76dbdf 100644
>>> --- a/rust/kernel/sync/atomic/internal.rs
>>> +++ b/rust/kernel/sync/atomic/internal.rs
>>> @@ -263,3 +263,51 @@ fn fetch_add[acquire, release, relaxed](a: &Atomic=
Repr<Self>, v: Self::Delta) ->
>>>          }
>>>      }
>>>  );
>>> +
>>> +impl private::Sealed for i8 {}
>>> +impl private::Sealed for i16 {}
>>> +
>>> +impl AtomicImpl for i8 {
>>> +    type Delta =3D Self;
>>> +}
>>> +
>>> +impl AtomicImpl for i16 {
>>> +    type Delta =3D Self;
>>> +}
>>=20
>> I'd suggest putting these next to the impls for `i32` and `i64`, for cla=
rity.
>
> I'm fine with either. Boqun, what do you think?
>
> The reason I didn't put i8/i16 next to i32/i64 is that I assume that
> i8/i16 won't support all the methods supported by i32/i64. I thought
> keeping them separate would make that distinction clearer.

The `AtomicImpl` blocks are the same, it is the macro-implemented blocks
that differ and these can come later. But having all the types and their
basic implementations at the same place helps understanding the basics
of what this module provides IMHO.

>
>>> +macro_rules! impl_atomic_only_load_and_store_ops {
>>> +    ($($ty:ty),* $(,)?) =3D> {
>>> +        $(
>>> +            impl AtomicBasicOps for $ty {
>>> +                paste! {
>>> +                    #[inline(always)]
>>> +                    fn atomic_read(a: &AtomicRepr<Self>) -> Self {
>>> +                        // SAFETY: `a.as_ptr()` is valid and properly =
aligned.
>>> +                        unsafe { bindings::[< atomic_ $ty _load >](a.a=
s_ptr().cast()) }
>>> +                    }
>>> +
>>> +                    #[inline(always)]
>>> +                    fn atomic_read_acquire(a: &AtomicRepr<Self>) -> Se=
lf {
>>> +                        // SAFETY: `a.as_ptr()` is valid and properly =
aligned.
>>> +                        unsafe { bindings::[< atomic_ $ty _load_acquir=
e >](a.as_ptr().cast()) }
>>> +                    }
>>> +
>>> +                    // Generate atomic_set and atomic_set_release
>>> +                    #[inline(always)]
>>> +                    fn atomic_set(a: &AtomicRepr<Self>, v: Self) {
>>> +                        // SAFETY: `a.as_ptr()` is valid and properly =
aligned.
>>> +                        unsafe { bindings::[< atomic_ $ty _store >](a.=
as_ptr().cast(), v) }
>>> +                    }
>>> +
>>> +                    #[inline(always)]
>>> +                    fn atomic_set_release(a: &AtomicRepr<Self>, v: Sel=
f) {
>>> +                        // SAFETY: `a.as_ptr()` is valid and properly =
aligned.
>>> +                        unsafe { bindings::[< atomic_ $ty _store_relea=
se >](a.as_ptr().cast(), v) }
>>> +                    }
>>> +                }
>>> +            }
>>> +        )*
>>> +    };
>>> +}
>>=20
>> Can you document this macro a bit, in particular the motivations for not
>> leveraging the existing ones (I guess this has to be with the new
>> helpers, but following the code through is a bit difficult without
>> comments).
>
> // Since i8 and i16 are not expected to support the full feature set
> // of i32 and i64, using the current declare_and_impl_atomic_methods!
> // would require refactoring it to handle specific types or splitting
> // the definitions. Furthermore, supporting Atomic<bool> will require
> // even more significant structural changes.
> //
> // To avoid premature refactoring, a separate macro for i8 and i16 is
> // used for now, leaving the existing macros untouched until the overall
> // design requirements are settled.
>
> makes sense?

Absolutely, thanks! Maybe also give a short explanation for *why* i8 and
i16 won't support the same feature set as i32 and i64.
