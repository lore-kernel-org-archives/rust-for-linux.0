Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020098.outbound.protection.outlook.com [52.101.195.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1AA25CC79;
	Thu, 29 Jan 2026 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769697233; cv=fail; b=q65i8k7Busmp9cROxgl7AzsBgs2QrEKfkuMVaihuQi5nXgNb+f2tGJ3EodC+IJl90SLa1fdWlwQqik5dBInZJCq7zK6meLGDk8Ww4Awhwn2So6PBPzav8KxOWShO5HsFGIPhdRsZ+UDFdmozGGl1+KL2x7p7Kjh3T7bZcnBNPrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769697233; c=relaxed/simple;
	bh=RRTRkak5rqvS7jLf0pY2eanOSAXGUxYmN66WAez69SU=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=MO8db10eU1eNAmYPlbu+nIvhkojRDpMZYbD1VG3mDs47e+L1UGOx1soyldrr8H6pdrxly18SX/XL8xQdOfj/IChT5VsNx713Sqm9bqcFQseC3VXLmgP0+QTNin7Zlf0844A4KzpAvKK/2x7TDgrtR3UXjSWbbvfZFbtYRj89TJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=lpvj8WXd; arc=fail smtp.client-ip=52.101.195.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="lpvj8WXd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rq5oBSGJyL83bTl9zf9xQD0xZ2Zk8upNEW6jdxk/afT2KSCB8dlV25E+22b9KS+4yWn/EGDjj4WQtP1vXJUPjIgNYJSTDvzBxoP+aMJp8Q8YLLQfRiXcYwQ7uTYTpH+CIKveCryMYQAeI1sikNAZI4EOtmce7FuwENVNiS2UB5myFivPGvDLXUA3v7hNEAv3c6gFUQf9LlobMImTHvZcikO23bRFav0TJznZe8CUMaG+xkMPKiHFliBA8GS8cY4LjbtWpR/Ua6vpt9cy12WccNzb69JzcukNqCukcuz9Mpe9n6WjOgkti4okmbSu8+Jz0mEQxosZ7y4Eor0QvsdEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJJopbBd2swFegdBUX0KeT3lXgxYhet+jSs3oHK1xaI=;
 b=aGcGdnldPtLyVQg4EMk8VqUss+KrgX5H1JToi02vo5CCOGTtJA9ZXcHsd8hcZzBfNvPMPEBmu2UkXm85DGwk+prHc02WoZ9kAwZYPvLAbqvQpuip++x6vQ9zEIGq5WHOg5NREnBWRpm9Ekux/4jJ+cdl1g4+/wjEkMK1kqXuP+THofOLSg+IdLAhqREVjB2tfJOPo/okZVxZ0+f7q/JI8COFr4BbLz+GtWvoEPxWFjjTa2h1vmphRJ4+31GQslDtNKSyU6tGKViG4aUexcg9bigWrlfggGEo1/qOQJ+82OekI8Dblwp9dke4z98r7IjGWMVV3JqCP1xlsIZ1YSXR+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJJopbBd2swFegdBUX0KeT3lXgxYhet+jSs3oHK1xaI=;
 b=lpvj8WXdDR1ijIGqUSkvfZ7iGNnQYFVz65ywCYCAwyr9iJCEyF+bcNEBC3ovnAtGftTVdbD9UCjpsDdfWCogVCVFpPJ5q0dIq8RXfj0nJGMv0fYoIpNMS6exaG0zS0t+LJdXGnnIP59lUwoQURg1Xroaz/fuLvf2YXdGdpV7SX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6499.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 14:33:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 14:33:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 14:33:48 +0000
Message-Id: <DG15B78C8IK4.ITL5HKRZ1QKP@garyguo.net>
To: <jongan.kim@lge.com>, <aliceryhl@google.com>, <arve@android.com>,
 <brauner@kernel.org>, <cmllamas@google.com>, <gregkh@linuxfoundation.org>,
 <tkjos@android.com>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <yury.norov@gmail.com>, <vitaly.wool@konsulko.se>, <tamird@gmail.com>,
 <viresh.kumar@linaro.org>, <daniel.almeida@collabora.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <heesu0025.kim@lge.com>, <ht.hong@lge.com>, <jungsu.hwang@lge.com>,
 <kernel-team@android.com>, <sanghun.lee@lge.com>, <seulgi.lee@lge.com>,
 <sunghoon.kim@lge.com>
Subject: Re: [PATCH v2 2/3] rust: pid: add Pid abstraction and init_pid_ns
 helper
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260129084119.32994-1-jongan.kim@lge.com>
 <20260129084119.32994-3-jongan.kim@lge.com>
In-Reply-To: <20260129084119.32994-3-jongan.kim@lge.com>
X-ClientProxiedBy: LO4P123CA0576.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: 221cb89b-b07b-452e-8e2e-08de5f436a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmhMMExKblNVTFN3M3B6SVhzS2REc2JVczRGd3RtTHljVXVIZ1NHTlUwaVNq?=
 =?utf-8?B?c29EQkhmdVVNWm14RCtUK0Z6NUR5QlRURVF3QnorNzNZMVNXRUhNbDlyRmQy?=
 =?utf-8?B?Ym1nT2VTNHhqajlrei9tU2dxeEl5T0JLQWFhc2cySWlRTEhBK3pjTWVDRkFm?=
 =?utf-8?B?V2pNM3EvRk85N3R5Wk1obmxYMzRUaGtDWlc5ODFvaGM3ZnFpVHdMM0UyMVVm?=
 =?utf-8?B?cUVkZzBEY1hubWxPR0FuU3ZaOHlualFtSFZNQ0pwM0c5blJvZGd6Sm0zdVIx?=
 =?utf-8?B?OUVPYnZNU215Q1YzNXRTdmlkYTl5TFpHSlZsZTR2OEt1V1BOMUpaOHc4K3Vt?=
 =?utf-8?B?aHJqTE9zMmpTWjBBeXlibDNrdEgrNGlFbFBUOUpnZjljWHY1ZnpzaWRzRURF?=
 =?utf-8?B?ejhnUkxBdS9FdzVLcElsMmNxbVU4N3ZWODJkU0Zka0l4UHk5TlJ0eDYwT0Rw?=
 =?utf-8?B?UlMySjRoQ0lieHhDZG00YUdab042YjhxZ2pSeWh0VVMycFZrYXR5UFZLZDlp?=
 =?utf-8?B?MTN0MEFnOVg5VTNrc3p4TWxOWlMrdmJGNXN4K3UwVVVZMm9objk3YmJ3WVRC?=
 =?utf-8?B?Z3dvK29CVjIvcWw0ZGs5TU9hclQ4UzVmVllXWUVNWllDUkxteW1scmN6OXNZ?=
 =?utf-8?B?MVpUN2I0aG5LZGFTTnkxSGNSZ0Ewa2FuN1crckppTjFYR1o4cmdCaUhnVGli?=
 =?utf-8?B?SlpiZnNFYTZZUUNMeW5kekJ5SXhSM2hwb2h1NjBNVm96V0NTOE9uN092dFJR?=
 =?utf-8?B?bzFGR09qdXk4bGxvUlVlV1VnNk8zLzJBVEp3a0wvZjNGMEhuMzZiUERQQUNx?=
 =?utf-8?B?eGlyOStRVjh5dXNsamtPQ2JsVG0vVElRSWg2TnJucVllclloN2ZNSmI2aTZ1?=
 =?utf-8?B?RnZ2SG5iSmJ5SUNNQXpyN2FPR0UxeElWUzlRNXltRG4yQ3FKUjA5SmNtL1I4?=
 =?utf-8?B?YXdCVCtXWG9hdmR3TDJOaVZBbytHK0orNjdteXc3NmNIUzdCVUhydU9Wem9R?=
 =?utf-8?B?bGNMQU9oRGtiWWVnazkwckxmSGNuOVNJaTNwS1FPL0FWQjZOZlNkK1BpUXA5?=
 =?utf-8?B?ZHI5L2ZTMHdoK2syT01GTUZmVWFOZ2FjaElNcUlMM1RGRDFHTVo2SVhlWkxv?=
 =?utf-8?B?dFZLL1lINy93N2c5T2JSejVEZnQxQmFUU1Vpb01kYjBvZW1RZmdrdENmYlZH?=
 =?utf-8?B?dEJuLzVOZVgwNzF3Q1ZNU25kSUhGb24zVkVpb3ZsWEVCbjlDRGV5bFNzY0Qz?=
 =?utf-8?B?a2tzUldhSmZNOHg3VWdRdEpUWnoyUk9ONzFvaEJYVm50dWRzQ1JXUzVjNEhO?=
 =?utf-8?B?cVJydE5PbXhsTU8vVGtRd0NlTDVJZHExNmQ5UHVIREhjcG5WWVd5a3d0QTc2?=
 =?utf-8?B?bUJRZlFsVmFxKzV2YldaUC9mS2J5UnJHUHNyYnQ4VWpGRmEvbkZxanZZaGdE?=
 =?utf-8?B?TDJtdXJ2dzIxV2VrN0F6K0p2UFpoUnFUbVllVWk1dTNJNi82cHVsSUhmSGV1?=
 =?utf-8?B?eHZFOVpsbU52Q0tzVkwwRkliMlBvWXBNRVVSOHdOcUVycUVySUxYdW0yYTlh?=
 =?utf-8?B?dmw1NFJSRm5Rd3NMdXg1U09vRklQY2lsWE5RL3lLc2IxM3FUYlVRamFRT2R6?=
 =?utf-8?B?YWw2ZFZ3dHJsZjI2cTFiY1ZGakkxOXFmSkp5YTFIeWkyRG5UanBWaFpJRjBZ?=
 =?utf-8?B?a2ZDODAxaGF2RzdXMmcrYWJlditwWUZoOUxVUk44S0pjUCtDTkpxSTJZVExu?=
 =?utf-8?B?VzBiS1RDRmFRVzFGd1RXTVdWMGtDS3ZnRWJwcUgxZ29VbzFZLzQwNVcxekJG?=
 =?utf-8?B?ck4wN3c5TmZvRThRY0h5YTMwUkkzTTQyTnhrUEExMXRRMEFnekg3clVVbVo2?=
 =?utf-8?B?aVRVMjJXbjRvQ3lIS2lMUGJtejRvOG16aFZ2bDZKOWtIYzVHVk4wMzQybWhS?=
 =?utf-8?B?RGxQZCtyaGt1V1NCL3UyaE9QbHAxUXMwa05NNkllaDVjZHJRSlBCWU85ZFRj?=
 =?utf-8?B?Y3g2RlEvMTNZR2pBbHk1V25LK0NPMFl4NzJPK1JaSC8wVDZWM0hFRmpIRFgx?=
 =?utf-8?B?dTNnYlNiUkhyalNhcWdoc2tzWC91TloremwveGFaMGh6UzlqWHo1TGx0VmJr?=
 =?utf-8?B?R2p1R004RnYydlc2MDRKT1ZsdUxvWG93ZjZoTFdpbXlob1dBa1AxeUlyK1hX?=
 =?utf-8?B?QWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFo0Z0tKYzkrc3dqb3lIRWFaOEt0bys1SE5wYkVCL0JaU1NlQm1QRUZKUHBQ?=
 =?utf-8?B?Z29QM2hLSnl5SEtHbmVRQkZ4R25ZRlVkdFUyYkk2RksxSlk1eGRwRnRXVkxW?=
 =?utf-8?B?bjhnQ01vOHJvc3hLQXRuMk5aVzI2NGkxVU5CTXJxSmh2Y3Q1bmw0UU9obFp0?=
 =?utf-8?B?UGhFeHdsY3hxV0c1TjhrSDZLTDlaN2gvSHVHWG5LOWU4T0MrZTVQL1UxQXVy?=
 =?utf-8?B?Y2lZMVlVS3JRZGdWbjJLK0QxdWxZM3lhcmZ2MzFpcEUrUW54QnBraEZ1K0tx?=
 =?utf-8?B?VlB0TFUva1dzb3JzNVV4dWllTUpselV1bHBCbHpOdm4zcE9ZckVyaXczVWJZ?=
 =?utf-8?B?RksvOTVvQ3I4RXZCV1k3MVViUGR6bmNUQkVxanhvZDNlWFRuaGQySXl2WlZH?=
 =?utf-8?B?VVdnTEZDb01HNlBhQmVYUlFzeFpRRTJTSFFvNHdXNjVheHZsdHVYMWo5UXNo?=
 =?utf-8?B?bmdxbElOVlVJeUZIVHppWS9pcUp3emp4RjdTaW4wckNWNlIvcy9pU3NkTDF3?=
 =?utf-8?B?QWI2VVBhU0c2ZmRnaUpxL2JEeXlCZDZTN3UwWEtnT0RDdFJBZU5uMHk1QVZw?=
 =?utf-8?B?czZySTNOaXdSajlEQStMSVdpUTBqUG9Odk9xN25HQXhoWnhEYUtJWHN6UUpJ?=
 =?utf-8?B?M1hVQ3BqTUZQeHlOUlJTQlRjSGZwbjlmTHBvMGRLdWNlQU13OFcxQkJDeVVn?=
 =?utf-8?B?cHllNlh5YTVodnRSL2FzVXN4ZENrNmNGTllxck9yRi9qdTJuakxYdmZrUEdH?=
 =?utf-8?B?OEh6NmRSWGtPZUZDSFJ4V05JRXpXazhqQUI3UUNpOCtQTTIraVhSNm40MEVM?=
 =?utf-8?B?a1ZiR3JNMXRJWndiRWpPTzBKWE1qRkdWZHlwOU1zdVcwVUFjRDRhdktOT0w5?=
 =?utf-8?B?UVd1MGF0ZUlhb0tBZnRKem91bGRVVUxPV1pzaWFnd2ltNy9xY09UN3h5YVgr?=
 =?utf-8?B?OVVZYlh5NTFGbzZ3U0JGMDltSDNpWXV2NDh2djlRMUpTOGNyQVNoTmZ4eEx0?=
 =?utf-8?B?bTVqNG1LZmk0eXM3NzNYZXR0NDdBM2wwREowUVJhR044dUl2Njd2WDM2WkRm?=
 =?utf-8?B?N05sV0pqbzd4ZElNdjgwVC9HN2Q5aXJvakw0dlFYQjArNDRGeFlINzAzT21Z?=
 =?utf-8?B?RURmRjl1TzdVaDg3Skkvd21odHhXMFpTeUNNbGlOenRDM3lWVXRiWUtTVk1l?=
 =?utf-8?B?QzNLYkhUR1RLTDBmdVdPZ0NlTklvTEFZeHhIZFhvNUJjS1Vra2p5UC9QaTF1?=
 =?utf-8?B?TGpPMG9udVQreGtsbUFhaDRJbXRaaS92YWV3ZFpuTWVSY2trbXN2R2krTE1K?=
 =?utf-8?B?TEtHZFV4bmdPQy9iaWFvMWZBUytLdWVvYnRqTlZTcUhmY0lsVzc3UUk1dWZq?=
 =?utf-8?B?YWs3UW9xdXByNzdVOCtsL1RCTjdQdDBFMkJlajY5MTNrc25BQjdJSWFkQW8z?=
 =?utf-8?B?alZGdjdCRWRvd3Y0Mk8yUXZGSVo4ekw5ZDc1NUsybVFkWTBJZGh5Y0pQUndW?=
 =?utf-8?B?blYvaE0wVVl2NVpRVzVxV3N3VDEvWkZ1dm5Ca1ptMHdGMWE5SkFZbmxIcUhH?=
 =?utf-8?B?U3VaZFB3QXhIbE9qaTVWLzE1U2RReGk2VUxHTlhqK0ZBZDhkcVRadUREalE5?=
 =?utf-8?B?aHJ5ZnRiM1FGa3QrUzNXT28zd002THJ3bG83K2xoK0NzVTdIdHhmNmZRb0tF?=
 =?utf-8?B?V01aOFZrdExGaURoRkZDbitTdlRFTHVVWnJMb2R6V3dER2lYczJyTGtqOVl1?=
 =?utf-8?B?RXRJbUY0K3pjOFRZREpEaG5pUzZ4N05DWk94b25TcDExZmpHOFEzR2FpUlVl?=
 =?utf-8?B?Nm5hazA3dTQ1cGJCdnZlbXByK1NSMTFlc0k3Y2Q1Tjhwakd5RGRBWG01Y3ZV?=
 =?utf-8?B?aDdlSUFGNVNrNGloSGxGOE9aeit2WTZoUlVMVTZEWUROUFFQVGVlREFJZHdq?=
 =?utf-8?B?WkNqQysvS1EwL2k1bVJPZm5WMW1sdmFZalhwV2ZhQzY1ck9sUGdEZkRrZWkw?=
 =?utf-8?B?UlNOeE1oQzFsaUlVY3FXK0tZaDZmK3JsdTA1eGJoWFdFaUhjcHA3VjlxaGla?=
 =?utf-8?B?aE1vQWNZQzZib0FtYStEK0pjVWdnOHNsUXFYUVZ2ZFhMWitXcWtHQThIMGc4?=
 =?utf-8?B?MVJEemE1bkl0RHRhUlFVTWJ4UHJ0dGdOdERyZVF0aTA1SWpMQUZhdVZQREk4?=
 =?utf-8?B?RkZNdmtBYk5HakV6ZXV5VFh3QzNuYTVaQkZzSWMxMUdVWjJEUm0vaFd3dGEy?=
 =?utf-8?B?RTlwbEszMEhnVEduTHR2bDlXMllpZEQwaUg2azZtNzVvRWZTQlFDNHQyejh2?=
 =?utf-8?B?TVdzMUxlak5HZjBsekh2L0F0REVmWGVVMEJuRWZ3U0pKUlMwekF6UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 221cb89b-b07b-452e-8e2e-08de5f436a7f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 14:33:48.8263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8vul8e8XdhKZf2Bw7dW/XL4+sh8qnwat/eqclQCW7yguHw8O3eOOuusMu3fSALt19fcg7/54YbPZrx8SYWiWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6499

On Thu Jan 29, 2026 at 8:41 AM GMT, jongan.kim wrote:
> From: HeeSu Kim <heesu0025.kim@lge.com>
>
> Add a new Pid abstraction in rust/kernel/pid.rs that wraps the
> kernel's struct pid and provides safe Rust interfaces for:
> - find_vpid_with_guard: Find a pid by number under RCU protection
> - pid_task_with_guard: Get the task associated with a pid under RCU
>   protection
>
> Also add init_pid_ns() helper function to pid_namespace.rs to get
> a reference to the init PID namespace.
>
> These abstractions use lifetime-bounded references tied to RCU guards
> to ensure memory safety when accessing RCU-protected data structures.
>
> Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
> ---
>  rust/kernel/lib.rs           |   1 +
>  rust/kernel/pid.rs           | 100 +++++++++++++++++++++++++++++++++++
>  rust/kernel/pid_namespace.rs |   9 ++++
>  3 files changed, 110 insertions(+)
>  create mode 100644 rust/kernel/pid.rs
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf120042..60a518d65d0e 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -122,6 +122,7 @@
>  pub mod page;
>  #[cfg(CONFIG_PCI)]
>  pub mod pci;
> +pub mod pid;
>  pub mod pid_namespace;
>  pub mod platform;
>  pub mod prelude;
> diff --git a/rust/kernel/pid.rs b/rust/kernel/pid.rs
> new file mode 100644
> index 000000000000..00989b953c23
> --- /dev/null
> +++ b/rust/kernel/pid.rs
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Process identifiers (PIDs).
> +//!
> +//! C header: [`include/linux/pid.h`](srctree/include/linux/pid.h)
> +
> +use crate::{bindings, ffi::c_int, sync::rcu, task::Task, types::Opaque};
> +
> +/// Wraps the kernel's `struct pid`.
> +///
> +/// This structure represents the Rust abstraction for a C `struct pid`.
> +/// A `Pid` represents a process identifier that can be looked up in dif=
ferent
> +/// PID namespaces.
> +#[repr(transparent)]
> +pub struct Pid {
> +    inner: Opaque<bindings::pid>,
> +}
> +
> +impl Pid {
> +    /// Returns a raw pointer to the inner C struct.
> +    #[inline]
> +    pub fn as_ptr(&self) -> *mut bindings::pid {
> +        self.inner.get()
> +    }
> +
> +    /// Finds a `struct pid` by its pid number within the current task's=
 PID namespace.
> +    ///
> +    /// Returns `None` if no such pid exists.
> +    ///
> +    /// The returned reference is only valid for the duration of the RCU=
 read-side
> +    /// critical section represented by the `rcu::Guard`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::pid::Pid;
> +    /// use kernel::sync::rcu;
> +    ///
> +    /// let guard =3D rcu::read_lock();
> +    /// if let Some(pid) =3D Pid::find_vpid_with_guard(1, &guard) {
> +    ///     pr_info!("Found pid 1\n");
> +    /// }
> +    /// ```
> +    ///
> +    /// Returns `None` for non-existent PIDs:
> +    ///
> +    /// ```
> +    /// use kernel::pid::Pid;
> +    /// use kernel::sync::rcu;
> +    ///
> +    /// let guard =3D rcu::read_lock();
> +    /// // PID 0 (swapper/idle) is not visible via find_vpid.
> +    /// assert!(Pid::find_vpid_with_guard(0, &guard).is_none());
> +    /// ```
> +    #[inline]
> +    pub fn find_vpid_with_guard<'a>(nr: i32, _rcu_guard: &'a rcu::Guard)=
 -> Option<&'a Self> {
> +        // SAFETY: Called under RCU protection as guaranteed by the Guar=
d reference.
> +        let ptr =3D unsafe { bindings::find_vpid(nr as c_int) };

This `as c_int` part is not needed.

> +        if ptr.is_null() {
> +            None
> +        } else {
> +            // SAFETY: `find_vpid` returns a valid pointer under RCU pro=
tection,
> +            // and `Pid` is `#[repr(transparent)]` over `bindings::pid`.
> +            Some(unsafe { &*(ptr as *const Self) })
> +        }
> +    }
> +
> +    /// Gets the task associated with this PID.
> +    ///
> +    /// Returns `None` if no task is associated with this PID.
> +    ///
> +    /// The returned reference is only valid for the duration of the RCU=
 read-side
> +    /// critical section represented by the `rcu::Guard`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::pid::Pid;
> +    /// use kernel::sync::rcu;
> +    ///
> +    /// let guard =3D rcu::read_lock();
> +    /// if let Some(pid) =3D Pid::find_vpid_with_guard(1, &guard) {
> +    ///     if let Some(task) =3D pid.pid_task_with_guard(&guard) {
> +    ///         pr_info!("Found task for pid 1\n");
> +    ///     }
> +    /// }
> +    /// ```
> +    #[inline]
> +    pub fn pid_task_with_guard<'a>(&'a self, _rcu_guard: &'a rcu::Guard)=
 -> Option<&'a Task> {
> +        // SAFETY: Called under RCU protection as guaranteed by the Guar=
d reference.
> +        let task_ptr =3D unsafe { bindings::pid_task(self.as_ptr(), bind=
ings::pid_type_PIDTYPE_PID) };
> +        if task_ptr.is_null() {
> +            None
> +        } else {
> +            // SAFETY: `pid_task` returns a valid pointer under RCU prot=
ection,
> +            // and `Task` is `#[repr(transparent)]` over `bindings::task=
_struct`.
> +            Some(unsafe { &*task_ptr.cast() })
> +        }
> +    }
> +}
> diff --git a/rust/kernel/pid_namespace.rs b/rust/kernel/pid_namespace.rs
> index 979a9718f153..6029e3e120d0 100644
> --- a/rust/kernel/pid_namespace.rs
> +++ b/rust/kernel/pid_namespace.rs
> @@ -63,3 +63,12 @@ unsafe impl Send for PidNamespace {}
>  // SAFETY: It's OK to access `PidNamespace` through shared references fr=
om other threads because
>  // we're either accessing properties that don't change or that are prope=
rly synchronised by C code.
>  unsafe impl Sync for PidNamespace {}
> +
> +/// Returns a reference to the init PID namespace.
> +///
> +/// This is the root PID namespace that exists throughout the lifetime o=
f the kernel.
> +#[inline]
> +pub fn init_pid_ns() -> &'static PidNamespace {
> +    // SAFETY: `init_pid_ns` is a global static that is valid for the li=
fetime of the kernel.
> +    unsafe { PidNamespace::from_ptr(core::ptr::addr_of!(bindings::init_p=
id_ns)) }
> +}

I would probably put this as assoc fn, so you write `PidNamespace::init_ns(=
)`
instead of `kernel::pid_namespace::init_pid_ns()`.

Best,
Gary
