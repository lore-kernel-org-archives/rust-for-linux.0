Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022094.outbound.protection.outlook.com [52.101.101.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105652EFDBA;
	Thu, 22 Jan 2026 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093335; cv=fail; b=Ceo6f6qqYLSLYdR6/fawWTVZcTDi6ovs2rkyT/cLHCEU4Oi99UHISXMYHb9Qe5d1z4IFa/9oGZT7/ZZZP6eXqFE5BydpDVlJYZY5vxQzfckA0JTVk6uGyy89sBTFo066zs7ZRfrbz3XqFrjaru+9GHwDB9sQjThNj1bLwPTGtAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093335; c=relaxed/simple;
	bh=UN7q7dBqLe5AqwNchICN/VrRt+sYJqLnpsGhejwOICs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=tcKrVjvMrWGDeLkaSqxBZshavVagMYrrMEahVOFS2nRD/9klB+8u76gS5voFDE0ti3ekOl/UQaBO9ALhSAH7YWr/QsGGLByfvktOUlsTttyoOgGq8tbuOXXVHz0IX1rwkD0a2ZFfSQp3VxL7q5eotyF+9spCbBpQwCIbvbtXbJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=a10x9rAU; arc=fail smtp.client-ip=52.101.101.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="a10x9rAU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZwnDQbo7iMfSowGYc0lS2jzlVXJ5X6mgH5uVJtV9ReTIewkum8NGLwRUYmLLvafxMjS5dDtHW6lVaOsEcZ9jrn6zyClWVs7+3qmy2NWRUGaXDPNGdcfKvCQiqQgX7uJAJxTJwZpUrP/0JeBD5099cVPRmjxjJ+haHN7yVDpTOaTDIwdMWk2OjuRgqIc04GhCd0Ja9MUsqg2Hl/DexR6BNFyBSybFKUllInUohVoQX8hGbP3xugVq6CI6aMUMVUjdGSyY8K6Ad4elMwaKfRUHX2u39naFfNu1X+vb47suJ0yUA1cF47s6NNa+93T3/CHvC/UwrzQMEiPZG4OPjZt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuLENSaeU+dXSF+r3vcu5JbRL57IlUQIsyQVMK3OKqw=;
 b=FMMlgG/jSFKvxqyWYJyjso4HISkExwOQhqUB37stAqV4AqK1wDg+SYgh7DxMmWhknCFPdYqjqi1wV+tevQp8xmmwOiH4PsLO4AqEZTZjvm05joPacFlQlQqskcJvyyNBUXRIkD1570qs45PBi8fb2W0jWcHn2s0TXB8IuWY4rbWwXaftJx7GXtIGKnjiKE4rliH22whFzFTdt3IWNV4q/cF7A7oxKolok4EMCMoKiabfiIdE/1F0LBHmtDBZzt1Kcc8Nuc254H8N8J5JEx9GVOPyBpE6p2Ar7MJcJ8ywl0TVhs1FZ1cOPjkUtZ5Jin9QxKAfgu60P9da0Ewp7w2IkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuLENSaeU+dXSF+r3vcu5JbRL57IlUQIsyQVMK3OKqw=;
 b=a10x9rAUcKOC9PTGFMPCGTNtGyDcDp52bO/IyAkQ7Indl5JZYGvEOe6F39KZ93Ae5utG21bw1uEwDITGAG4NQVXUupnsym/19bAwzKvdEPrk8foveR+DUSGARCFy8TGIUeFr4HWqOUTK1bqWuqksO5fePOs+VFPahQcf+8pviF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2238.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:123::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 14:48:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 14:48:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 14:48:49 +0000
Message-Id: <DFV78VWVSJXY.2RW8FAP4JS8DM@garyguo.net>
Cc: "kernel test robot" <lkp@intel.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: task: use `as_char_ptr` instead of
 `as_ptr().cast()`
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Panagiotis Foliadis" <pfoliadis@posteo.net>, "Shankari Anand"
 <shankari.ak0208@gmail.com>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260122144444.265412-1-gary@kernel.org>
In-Reply-To: <20260122144444.265412-1-gary@kernel.org>
X-ClientProxiedBy: LO4P123CA0373.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2238:EE_
X-MS-Office365-Filtering-Correlation-Id: aab4f4c7-7753-4f39-d841-08de59c55aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnJ3N1hNNzZuZDJTdDJhUW9zVnZJQWYyQ0JubDVxRC8rZU5WRjFDSjNhMUQ2?=
 =?utf-8?B?RXBoMlBGQ3NpeXlLaXFUKzRvS0Q1RnFBTUhGWk42VDJPVVc1M2F2bzNSdzNK?=
 =?utf-8?B?aVJVQjlENGFObm9WViswVTJ2cU9WU3QvMklGbzNIQkpQcEJ2UFZoRUZBcjRO?=
 =?utf-8?B?eVVwSmZYT2hhYmU0SFNQRFdoT2ZNOUsvczB2V1VBY3NsZXRQSVpGODlyOHN5?=
 =?utf-8?B?SnM4REhwMXdkQ0ZaVlpGUm5PSVg1b3VFaUd6U21KMlRqdUNxeFJnUy85cUlE?=
 =?utf-8?B?U1JuMURhblZPRXlrdHJ6NWdIYVdXbWE3UHM1MWFkZFdTcWUzdFViWmdza1Z1?=
 =?utf-8?B?TGlFMEZoZXRJN3lSeXBTN0w0WlhkNzBnM0Fpc3hqU28zL0xLU0RiT0hQSVRj?=
 =?utf-8?B?enNRYTI2OXZvZHZURHdHeURQTitnTUsrUzJzbG9neEkwQkQ3eVhYWUZKZEF3?=
 =?utf-8?B?TmxjWWY0MGQwa2ZZNDlHV2dWemVhdTh2ek5HOXlIVE9WUU15QkplN1c0U1RI?=
 =?utf-8?B?VWJvSmRSM0dFY0RlKzRKTXlJa1VkdkRSbiszVXBsSEFXemlZeS9NelpmMlIz?=
 =?utf-8?B?ejlQODdxTHNDb2h0ZVM5S0xkNENBSUZ1L3lVOER1N0hkdm1NNVJxNGJuUWZw?=
 =?utf-8?B?VjA4UHFIL1RJNmFBNXUyZnB2VGt4UHE2WXdqQ0dwdFZPNXEwM00zekg3K0xM?=
 =?utf-8?B?c0U0UDFnbXh2bC9KLzNhS0NKa0kvRzBDM0lyQnBpSG9UdDBhTWR0TlU2VmRi?=
 =?utf-8?B?NExLQ2NzM3Uxa2dXMUcyUEFCU3VWYzg3clhKakpZVEJjdU1DT0F6cUlFdC9n?=
 =?utf-8?B?UW9VTVc1WC82QXMxNzU0TFBWRGlWbHM5UldnU2Ntdm1JbjdTMUgvQ0VrOUtJ?=
 =?utf-8?B?UCtjYnQ5bFJodUJlVE9UWWY0TmN0RGQyQTE4SHJwenlxcmZXTnM3TUEvWFZ3?=
 =?utf-8?B?VkpzWjlndEx4dUVmbnc1d1g1RTlLRmRDNW12aDlaeU1BSVBKZUo3cmN2OWNO?=
 =?utf-8?B?ektIRk5LVmhIU2wwc2NZUUJlQWNVbFhxdDNlakJyZmsrQ0l1WnA4WjNuNXps?=
 =?utf-8?B?WVZyMU9jTmd6dElXK0lEdkhERHBFd1NRRUdTSnlvWFBKYzg0SW92ZnR5Wjgw?=
 =?utf-8?B?cUQ4SWNPMGdsQkNTc2E5OFp1TURIRVYyU2dKSkVTa3JmSWlKNjhYMmN4UThq?=
 =?utf-8?B?elptNzJEOHFSV3RWeFBWdGFhSVhIUkhhOUJsZXdCRk5kNlYxOXZTa1gwY3hW?=
 =?utf-8?B?cmdycndmbnpGamd6d0x2djArUzc2V1dOSlhxd0RqWXFkMWRrbE1ZYjh4SjJ0?=
 =?utf-8?B?djJjbitzTS9kN1dtQ25pR1VObXlSdlh1S3NDTStOUXRubytGRk1mcW4zSFB2?=
 =?utf-8?B?b20wUUcwamtSUG81OXNrTHl4Q1BTcWh5WkM4WFhsZG5ONjBVN3lCbDU5aDkz?=
 =?utf-8?B?VEtCV3QzbWxpNEdDSXBHSGsrb3NURFpjbFZXd0phanZMSGpuYVhIbXVlaFg3?=
 =?utf-8?B?U3h6bUh1SWF4ZDcxNkpHanRrOXhtK3lzUTFWamJqMFgvbFdIektFUm5xM0lC?=
 =?utf-8?B?RkNPUXlQb0NnMWQyTU0vOWVIWXhGemFYZXphQnNacGNhdGcwRmphVXFxT1By?=
 =?utf-8?B?ZnFmWktOcys3K1NZeUZaeVVCaUhkOTlzaWFINllobmVQMERqdnpTaVdtdm1r?=
 =?utf-8?B?VWpVNFNHSDZ0UlZzaEkveEZVUmlFTnp6dGhxczNRS01zQWt6SG5qbFJKK1pQ?=
 =?utf-8?B?WUZWaVMyaEF4c1BhamJhV29zQUJmU0dWNis4OE9yT0NTbEdmYmY2NFU3OGZj?=
 =?utf-8?B?QkdqS1M5OTJudHd4ZHhJemp3ZjVpc1NKd1ZMY1crQURGRFBHcTFONDR0Sm9L?=
 =?utf-8?B?Y3ptMHRvWUNleHY2LzhiMEJ3OGdZamZXSG54TklnS3dCTzFsUXJDM0xpelRS?=
 =?utf-8?B?dm00RHBEOUdyeldJYVAzWjdiWFZFZk5JUFh6VlJXcmZZQzVJTzNranY1LzFO?=
 =?utf-8?B?eUFTK1JBTmk1cURLUkhtRmI5eFNvOG55STdsaHJqTzg0MjN5VHZ6dnB2bDFB?=
 =?utf-8?B?Wm5HZkZFSWVHMm5ldzJZK29icWpKRjlnU2FuQklPZlIydnRYbHkwRVYxci9z?=
 =?utf-8?B?Y1ZGcjgzZzB4b2R1T3dwOXRwc1VpdTBUREk5T0x5ZWRDV3lmU3o4d3lKNnN4?=
 =?utf-8?Q?sElUR4ydugxL+f/byFh2lDE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2ljeWc2NVpNN3EwTlRVeGFFQzIyM1ltRW94Mm1seEtTWEh5TVdXRXZNeC9T?=
 =?utf-8?B?eGNVN0xKaEF3YSt0b1Q4VnYrOXJhWGR0dW5QTTNNV3lLbk1OTFBBRWVTcGhR?=
 =?utf-8?B?QzFWdXNSYi8vdWFBdXVXd2x5VkprZjJNSEZYYVk2NzM4WEdhZEUrWTVrM2Vp?=
 =?utf-8?B?Y2FBRXZ2WHVTejFJSGxzbkwvWDRqdXZjK1Iwci9ZTXZZZVpoNi92ZFF1aThh?=
 =?utf-8?B?NEVtRWIwS2h3SndXZnFGZmRHMFNud0plaGMra2x3THlaemVhVVNxbldQZG5h?=
 =?utf-8?B?M1h1NXE2aktyMjhGZHlzT3Q4aUhNOUlJR0hMTDRSZndmaGVQRTJ1L1llVFM0?=
 =?utf-8?B?UTdtazJWQjVtQ05lQTVHeFFzSmpISEJTRExJUUlxM1lVRjE0by9GUjhLUkRI?=
 =?utf-8?B?enJ0RkNiSUpncmo3SlgxbkZaMVhRU29xNk9ndXZJQU9udDdlbnQ2Z3piSjFn?=
 =?utf-8?B?WE9pbVZVaXdHSEhDcnZaZHllQWprbnRleGVTbGxFRVJvWlFCaVlIWnBocVlE?=
 =?utf-8?B?SFhZc1gveDYzanZQdjZQM0Z5WmZDZlBNaGNiUnJ6WEtCcmVuUzFzTG9XWkwv?=
 =?utf-8?B?OTl1NTlURXU2dFJ3eWVnQkEzQStKbS9TaGUrTit6dTVNY3ZJWk9uR2xIbksv?=
 =?utf-8?B?WU1Db296T1lUcnZtVVlTT09QallSRVlTVVQxaHNFTFJ0a0szbGswcUxDQmdp?=
 =?utf-8?B?RTkyNXBkeVQ2QWxzRUtabTFPeGd6dWZNSE8ybXNtS0tXZGF6S295S2VuSW05?=
 =?utf-8?B?dEZnazhpOUcxd2xFNTd1REpWWmc5dEl2Q1prTGcxN0tKQjBMcmxvdGE2WDZD?=
 =?utf-8?B?SVhLdVo2WnhiQ3ZnakIyV3FCU0cxQWIrMXRTWGIrelBaTlRERDBkUW1iUGhv?=
 =?utf-8?B?SWhoeUhmVzRaYVlySkdvdmlRZzRUNXBVVjNhUTYrN095alBpM3QrQzFrNWxh?=
 =?utf-8?B?d1Q5WWZqY1kwOHhBVjZNVWFMaEt5RGYwaXBnWTEwN29hUzZ4ZXBRZW0wdkt0?=
 =?utf-8?B?aXppY2VEZmNlQnl2UkczUEQ5d1dmMzg3S3R6SDNxNlBveWVLNVozbFNPTnVs?=
 =?utf-8?B?WFFTNWhmMlBFN0Y4aHdSakFVRU1JUSttM3NIc25HSlVOcEUxTytjWlhTTjdq?=
 =?utf-8?B?RzUwTWo4aTlaSGNvM29scWdwamVUaHhzaHVCckEyc1poSlZEQWl6eWNTclo3?=
 =?utf-8?B?Ujczb2NoTjlhemZ3RHZ0cUVndHh6akFjaHNtTHhFWTRZSUJIekpYQUo4TTZv?=
 =?utf-8?B?VjFidlU0dHRPbis1d1krMldJYUZzcE1URThFdGxqb1VZb3c3RFF0YWlJY0Q0?=
 =?utf-8?B?dG1WVTFKQ1ljc1pVbWJIOHJjcU1VWG03eEx1cDV6S0Jqc3JyYzliUDFuWml4?=
 =?utf-8?B?LzhBZU9hdEZEb1dtWnNpa09Vc05ndHVoTUxlaS9oNmdzWTIxWCtMQjZRMGVu?=
 =?utf-8?B?TVhEWHVMbkhWQ05zNVhSb1kwbjNPUGNzZnF4bW9BcVFOTHFSKzFZdXRET1B1?=
 =?utf-8?B?WHRpN2IrR2xMZHlPOTY5SnhyNUMyZk4xeU16aHNjcHRhMnBFMEt1N2xQTXRP?=
 =?utf-8?B?VlhSOXlCV0R4aTc0N3BvUWRySkxNWXdIWDIyUHRXYTQ1NE9PWW0vME9IK0xD?=
 =?utf-8?B?N0REcVp4b3MxU2s0UVlQV21tdy9hRmMrRURLTnRSdHZWVEZjRnQ1emdSQ0hQ?=
 =?utf-8?B?RkJKZnQ5NVlwcGdEVXJadlZJWnNzTXpiT2tLRXoyWG8rQUF4VEViS2wxaUF5?=
 =?utf-8?B?Z3cxdUdDQnI3QnJZS3BZclNqTVh3aHhnNjJoaFBZQUxsS3U1T1dqS2NnTDIw?=
 =?utf-8?B?THBqQWxSZEE5WEVNeHhqNTJJTnJOSERxeHNka1VyYTgxdFBjVzdCc1NTN0lH?=
 =?utf-8?B?Wm1UcDdsdEhvOGJXWUNlT2F4YnAwQjJubkQwNHZ2VlJBSjd0d2RCZTNsendh?=
 =?utf-8?B?VnZ1eGFEclJ0a0E0Zi81dzhVZWh3TUU3Vkl3RytiaGVkUjRoNTQyRkVkL0l6?=
 =?utf-8?B?UHNwbzV4MjBDbnB0SFZVZ2dYTjU3MHhRT25sblp3aE5qSmZaNVNRdEQ3YTV0?=
 =?utf-8?B?d2xUZjJHeUQ5MjMwNjZBSTJnbnduUzhjMzMyNDRZVHdMYnFQV0d5TjdaOEFl?=
 =?utf-8?B?WUdLRUd0YnpIdCtrT0xnU2puTkdmczAwc1FuaEJvYUluQkJJb1g4Slg2UEdC?=
 =?utf-8?B?YTVNL0hhS1FmekRKQll4cDVIKzVwVGNHY1gvVHJ2YXNDUDNZdzNpYUVlN0Qv?=
 =?utf-8?B?WURBa0hXV054S2N0c3ArTXhDZGVhZ3BEMGRoUjlJRmFqVFlUT2hkbzRLR0hM?=
 =?utf-8?B?cjZRL3FLSmo1dkRtZDFsU0h2T25GaXVVa1NMMXllVzBHTEc4b1gzdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: aab4f4c7-7753-4f39-d841-08de59c55aaa
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:48:49.8474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTT/Uke8X/7eWuJ+8mXLpn5Xe2J006Ob9Izy9+KFaKOV7f7sdgbWYQkaH93LOi7bDvRd8MtmiFoRIN0pPpaDAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2238

On Thu Jan 22, 2026 at 2:44 PM GMT, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> `as_char_ptr` would provide the correct (unsigned char) type without
> needing to convert to an intermediate type and cast the pointer.
>
> The `as_ptr()` function is going to be disallowed by clippy warning, so f=
ix
> this usage.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601221157.89t3Sqbl-lkp@i=
ntel.com/
> Signed-off-by: Gary Guo <gary@garyguo.net>

Oops, I am trying out new workflow of using "git notes" for changelog, but =
I
forget to put set format.notes to true...

Here's the change log:

v1 -> v2:
- fix one existing usage of `as_ptr()` (kernel test robot)
- styling of message (Tamir)
- Link to v1: https://lore.kernel.org/rust-for-linux/202601221157.89t3Sqbl-=
lkp@intel.com/T/#m8ca5da7e22ff7ac6caff83326f4b81e0e9e3536f

> ---
>  rust/kernel/task.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index cc907fb531bc..7ccb20a8f813 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -9,6 +9,7 @@
>      ffi::{c_int, c_long, c_uint},
>      mm::MmWithUser,
>      pid_namespace::PidNamespace,
> +    str::CStrExt,
>      sync::aref::ARef,
>      types::{NotThreadSafe, Opaque},
>  };
> @@ -419,7 +420,7 @@ pub fn might_sleep() {
>          let file =3D kernel::file_from_location(loc);
> =20
>          // SAFETY: `file.as_ptr()` is valid for reading and guaranteed t=
o be nul-terminated.
> -        unsafe { crate::bindings::__might_sleep(file.as_ptr().cast(), lo=
c.line() as i32) }
> +        unsafe { crate::bindings::__might_sleep(file.as_char_ptr(), loc.=
line() as i32) }
>      }
> =20
>      // SAFETY: Always safe to call.
>
> base-commit: 053966c344dbd346e71305f530e91ea77916189f

