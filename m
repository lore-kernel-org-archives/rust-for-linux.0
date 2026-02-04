Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022137.outbound.protection.outlook.com [52.101.101.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D084E3D3311;
	Wed,  4 Feb 2026 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208370; cv=fail; b=FWNfh1EkHkxb9loyZdDORiVYBre6VTZBBvp7JAtpOm5Ly7AYOSj6F73q0wC/ccLqaxiJfczHU9P7K2jRVf9zLXQvfVxh1bO7+pL+uy9zcJjC+o1DYo9G3Z8CUrSDywIATIN1Wu/gF3TlUXjTzVN27pj7um+u+3Z9ZD0ep7O6EQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208370; c=relaxed/simple;
	bh=IN51gUPRwTuqdbTJAhcJ4VAf0ieYCcJOj2TQBtC/J48=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=RDKvdlUn1dZ77fJFuPxgynKyGWqhSERbGb9qF3o9YATspAOoCzs9kXsQJ5taVh1WHTxkUgVq4RkRQEsiVRSktUEiU0QM6BHz0ZKQt5BYPrNQ6Y/eLpTgL316b1JtJTITg6pWxgmRsuDEoUxnyCpIr9YOYyIp3Iltuu0T7Z/WxGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DUFo/n+p; arc=fail smtp.client-ip=52.101.101.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DUFo/n+p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyb+KYK9Q176kmae7Ew1ATFkjQdQL/f3yNKqZTiAKl6t85VQhZWi8mdo9D7JTyA/O24jRNBIfhcJeax1c0IIWCh9AX2ULl4E1XPxPjkxbDcd6YFZQVnNX7vEwE0XBPPIE9p9aJ/f4C7FLTzhqHTeOMo8opzOmlMTV3FhVlpJWdRen+UZ6ExVuvXo4EWaF3IHqOxHHeYh/Kjliclag82x9v460B28Fxd8NmBvN3uLECqXBJGLK2ESGDZ1CNeqv+hr/uV35PmlNlfyusS+NNs+DQix7MuBANaQyOygGYMvvp6zvlgPZfs2ugUZDgzhSqzP+ZJV4FqdBMkKL+Gm+heQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmp7f/+1foeAcCOCwjoK5QZT0BOOZQ8HA8+AbR8Z00w=;
 b=RJZjkRMkWOdrujUenVKGeE4D7jOSda3nHHyjk4Fa3gV5HWj4JbNkB4/muj+a2twS5NgQcezoSFESEKIRJHYRriW6HL4LwfAsjI/5/L6TAjyb0dUlHiQjiLAwZ4Uyme++0VCqMtcwCYZT2PyXNyk/oqpwMRJ+w9Eauldel/QrroyHGz3hROoFokVTwS4J1xFiUupmrwlwdPHVELh6Wbcgep7tZmhfyKgoew3CbeuM43ktfcpr7WCTm43KnUj50aJrRvKcxCLbm3JeDoiuGLxT7Lqs+dikprCWLDkgTG7GqG790WbdSPv+bT0jm8hIM2pQNPt0Ve8cbpT6E7k6pEo2TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmp7f/+1foeAcCOCwjoK5QZT0BOOZQ8HA8+AbR8Z00w=;
 b=DUFo/n+pnP03lZsIrNNAjWUw6lPj7A1gklcSHKJQs9KyrnG5VsY/ii8Z9qzdPZ1C1CApfsWCjX9e2YdTr5yINWHY8vq1Gi0qN+54xSJnlwuVl/uejpm+pD+2EApf5swj/b2rvDwoREf7nx9B+uQE86AVPb7oHi6KTYyiDc5g+wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2947.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:d2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 12:32:46 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 12:32:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 12:32:45 +0000
Message-Id: <DG66HSCEA3XP.36DNV6A9HRNOK@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Waiman Long"
 <longman@redhat.com>, "Joel Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate
 per-CPU counter
From: "Gary Guo" <gary@garyguo.net>
To: "Peter Zijlstra" <peterz@infradead.org>, "Lyude Paul" <lyude@redhat.com>
X-Mailer: aerc 0.21.0
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
 <20260203121520.GN1282955@noisy.programming.kicks-ass.net>
 <20260204111234.GA3031506@noisy.programming.kicks-ass.net>
In-Reply-To: <20260204111234.GA3031506@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: LO2P123CA0041.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::29)
 To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2947:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eef4f65-de48-480d-a0f1-08de63e97ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWlHUlp3WjUzcW9wNWtSVVBRNElXaDVmbTlROFdTcjY4SVNueGY1THQzdW80?=
 =?utf-8?B?bmhhekxzbUN5WGFsQ3F0U3BCbWg5RS9vZ1NLemxNSlZSRThVQTkwdjBjWFF0?=
 =?utf-8?B?R2pCcFlTdnFuSnBZancwWUZTOStPeldpeXFTNHRjMW80VGxQbW4wK0k1d0hs?=
 =?utf-8?B?UU9QZXAyZkVWTFRtTnVHcFVnYy9qanUyZS95TC83UW84bGZIL3YrNE10RFZ3?=
 =?utf-8?B?MzlManNFQlpwaGFBNmNLbmlzZWUzSlhYRWdNdU1LdG4vWVBDemJPODlvNE1D?=
 =?utf-8?B?OUlFN2JtNmk2Ry9oM29yKzY2MGhKVFpDYUFLTDhiZTJLWC9wclYzbWlMNDgx?=
 =?utf-8?B?ay9uc0I0dVl4YmREQUZzQVBOcFlxYU52YzJlcVR5MWJsNTJrbjhuUjYrdFlI?=
 =?utf-8?B?UlNNSTFxanF6M0VRa28zY2dFeFEvT3FVNVR6dnh1dWRYNmpYeUxkcFpyTjB5?=
 =?utf-8?B?OUJaOUZLK1d3bWN2c3JOZ0JEcldLNWN4dmE3Z1FacjA4VnRCcFp1dU00ZFdR?=
 =?utf-8?B?UHNWYzhEaTY1bENwNVdBMzM2UGhxemF1bnl2TEt6ZmRMbmdsZ1VxVDNrUmRK?=
 =?utf-8?B?ektBRENBR3JHaDhtYmlPSTNWWHY5LzN4UXAwZWhpcW1FTjJFN3cweFc0QUM4?=
 =?utf-8?B?WGNqYkN0YnJEaGRybzRUaHZDdWdSQ3pYbENIMEt3QW9pRHBmeGEwRFh6Nngr?=
 =?utf-8?B?T05YTlJNWjBVRG9SblNXd3B5cFo1ZzFqektRUWRQU2tsdnB1RGVMY1BENE1Q?=
 =?utf-8?B?a0hMUlZUaThQb1J1YWhWT0NCOUtWbS94elMxTm1ja21kbjRHUk5td29GdFdT?=
 =?utf-8?B?KzFWZDZKaEZEZ04vRFJ3QjFXS2oySFBSK2dmc0M4Q3k5VjdpRk9IVG5vTmNr?=
 =?utf-8?B?cUxGVnBoNmNadm9qQXR6a0lvdmFjekJHOERjWjhDMUhuakgrVjFVTVlobGo4?=
 =?utf-8?B?bXJsMHZQcndmb0IzUTZXS3RjSmVUT0xMbVV2aUNpTmN6VjNJbnhybnNIeFM4?=
 =?utf-8?B?STBYTWpGM0FEc0VwQVloWkpSb1RTdmk4UEtmSHFlblhyY2E4RnJCbXZyME0y?=
 =?utf-8?B?d2NYQmk0WFp3cGxuYVpDNWpabTZ5WnJYbVpkVm90YUswcmVvaU44M3NMSGtx?=
 =?utf-8?B?ak9FTy9VTnBNb1VKdTN2eUFLY1ZxSFlZaGpQTWl2OWVrRGVndVp1cGJybHBH?=
 =?utf-8?B?SGZPTVN6R2t4dnlFdyt6UTRnMlBCVWNmbFI5MWxHN0pnL3dpWnpPOWVEbDlS?=
 =?utf-8?B?NTNsVGM5RUFmNzJZSnIxVEoyaFdFKzV6eE5ZRVBidXA2ZmI5M2xaS3ZGSTlr?=
 =?utf-8?B?Zjg3dDhOZExFeVZPZVJ0SmNtSjBKYWwveWFVaEtwbklKSUxqbEFQWk9ieUpF?=
 =?utf-8?B?QlFNaW9OOHNobGkxUkZYVHhWK0xEZTYzM25QZkU2TUdrbElWUDdoK3NPQ0Yv?=
 =?utf-8?B?NlhsRmN1YzlGM0ZwM3hPNVVaQi8vMWFlMlBQZThMNVlMV1VBRVE4MkJMOEJK?=
 =?utf-8?B?Yndkbm1XajJxbFVzTjJqVkdXUS8vTUVqbzJLcmZrTStyVEQrKzNJTWFTbHQ4?=
 =?utf-8?B?eUVoZVJqd083c3ZQMGk1NHk3TzE0cDJqaThqeHE2OHk1QXNrbHBKR2hmazh3?=
 =?utf-8?B?UDBDdU5pemg1OURKMDBXajRjaFJqNWowUFlIV2xlYVJiUHkza3l1QVUxUm9o?=
 =?utf-8?B?L1l1M3crMjAvL1UzZEw5azNodmExRTJWQTBVL2FidUVFYkhveXNoWmhMeU1j?=
 =?utf-8?B?dExib3VjOFJtTG1yTVJ2MDRJNDVMU016dE9YRy9UenNDZGNZOXp3RERjd0Zt?=
 =?utf-8?B?UEsra0x1V0t4dHZ0aDNnMjcwUXhkcXdlc2pqbFk3UitYNnFTNm1ac3RxRy9K?=
 =?utf-8?B?RkhncUhzcW1ZWEkvWGowS0cwTEhTTEluSndKblhBbnBmY1RTTkdhSkc1Q3Rt?=
 =?utf-8?B?WW84bWl1RkZaTFpOUVVFUzA4MFFkZWlqZW4zTEZrOXJoODJpZTRySjN0b2xp?=
 =?utf-8?B?eFFscFdEU2I2bWlzeFdES0ZrNll4MGdScWRQYndLb2Z3QkFpeUhKbkU5Wm5V?=
 =?utf-8?B?S3BZR1pqK3lmYUVrVU5pbUlBSzNDNWtmNlNFcWw5M2ZaVVpWOWYrUUY5K2R0?=
 =?utf-8?Q?dUMw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDBJaElER21DRTg4d1p0MVdmNFpYUk4vT1B3WWpiekl0ZEd3L2E1bS9qSVpU?=
 =?utf-8?B?azJTaXZPRVNJdTNrZTBhY2FaK3RpM0tnQmNsMGRPcVBLTWFoYlR4MWRhRUwy?=
 =?utf-8?B?QkQxVGl4dWZPcEhjNjJVZ3V1MDZIUlM5OEJtV2JEelAvL0VvMGYwREtHUVNY?=
 =?utf-8?B?UEhoemhLc05CNWg4VWkvaE5SdHFlV2svRS9kam5SZ00zU01kckhwWFFTNnIy?=
 =?utf-8?B?Tjl2dkVkM3RQZ2FoRjZ3UDVqazU3eTZSSWlZUjdvRGdQU3B2a0cydmROWUND?=
 =?utf-8?B?NFp0cVJzYnFIcVp3ZEV3c1R0Z05mbE43cU13dnlVbkRQd1puaHdXSjAvRGZJ?=
 =?utf-8?B?TkZxSmJGVW1qQ3cyeWRnbzNLd3J1SUlzTDNPYkRTVWlFOTYwb3BjcVF1LzNu?=
 =?utf-8?B?STU2Vis0KzFROWNOTi93SVZ3VGF2alhuTjVGNEY3RHpZZFU4c3hGR00xSm41?=
 =?utf-8?B?TkMxczcvVXBQSEZLM2w1ckdoOGxKMmtxTVhjZHdnWklLeXU2eDkraU5LYXRM?=
 =?utf-8?B?TWVLK0JsNXFMalpicmRSV1M5dmsrdEZsdnlRejFFNnUvRnZvcjZJb0ZvZnpK?=
 =?utf-8?B?NFBmekhNY1J6Q0VSMGtWaVZhdkpTZm1BZGpwOTFxcUFicU13dEpKQndKRWtY?=
 =?utf-8?B?eDlvTUxuMnRUVWZjOUFRR1dIRlVLODhKL2ErcTY2eG1TVCsvc21HTEN5Yytz?=
 =?utf-8?B?Y29JOWxoUkZtdTREZmVQQjJxV01aSkp1cmhhbUpQWnNCc0VYeGxHTWlOaVN3?=
 =?utf-8?B?ZjhTbGl6U0Z5SUNPYXU0TTVyR1Frb2lUaFk0eVkvNmxvMFptZlE4U3M3aUxM?=
 =?utf-8?B?OHZtMld5RWFQdmE3blFrMGRVcUd1SFhmUS84RHhJWGNnWGo0R2gyaDNpUXk2?=
 =?utf-8?B?Y2JjbWhmWFJPMEVoYi92ZklpbXJlZSthODR4aXFGWkNIT293TFZRRUV1WFZz?=
 =?utf-8?B?MDBQZk9HdE1RMFllckphQ3RXaS9TUitxanBnZC9zWElvQlMwNzkzRWZtek9X?=
 =?utf-8?B?c1RPQUV1RXNkUW9DNXZ6Q0FQcXNieElsWGtZa1FmY0k4UWhTdVNhdHgyQWgv?=
 =?utf-8?B?bDNDMC9XeExJTHRwZ250WlRqcE5ieUVZUEw2MlZlajBXdEhXZnR0VThmR00r?=
 =?utf-8?B?Q09RSGpKQ2h3ckt2eStTVHFJbE03a2VLLzFiWGxwVmdJSUZ4d3A2VldETTU4?=
 =?utf-8?B?S1NFUStPWDlVcThESEUxWWx3TlE5QW9NQVlkQmtCKzIreHVXcWFXb1FRYmcw?=
 =?utf-8?B?OXh4Yy9ja0EwRzJyYzk4bWk1eTB4TnNaNmtoa2paZnNTdTd1QTVkMmNaUno1?=
 =?utf-8?B?T3dWaFYvNjAwV0kyMkdmYi92ZEQwcVdPbHpJaDlQSGZ1NU5iWDRRQkVQd2V4?=
 =?utf-8?B?T0JiUU9KNDhoTkpERnNPNlAyaC9zS3NUWC9JTzVycTBSVncxcGhrcTVqUStm?=
 =?utf-8?B?MkIzRk4wbHM3OTh3MXFpOElYOURNNmRlWUhRRmNYOWNGYnlUWURZbnVVSy9z?=
 =?utf-8?B?VS9WWmF0SnJ1UHI1V3locWhFL2tGWE1IeDRFUXp3eDVudFJHUFUyS1MvTlQ1?=
 =?utf-8?B?cVdRTkhxblFvME4yL2ZRTmhYUGp2VjN6RmtEWHlxNkJzOWIvWWozSTIvcFNR?=
 =?utf-8?B?bUR5Szl4MzgyRSt4ZG9WN0FRajlVUExZQmpFT1BSSkRqNkNKRVZDd3FteEY2?=
 =?utf-8?B?aWprekdKdHZJMWkyeUhEcTBnL1NOUHd5UVgzVERjc0FmY2U2aEp1dVRLMTJY?=
 =?utf-8?B?WkIxeWROOW9HNDBQTEZqYVBQNnZMY1kzSzZSL05nSExIZkhXM0tKVzY1aVky?=
 =?utf-8?B?UVZpZkdEclFXbTNwMnIySG9OZFliWGg3QzA3NTdHV05uR0VxZThnZWpzM1Ru?=
 =?utf-8?B?dkFWcGxmZnA1MmsvRW53TWhSaWtPUVNvU3lFSW91QWZYYWNJWlpFbDVKK1F0?=
 =?utf-8?B?Z0hMRkNNQkQ1OVhtMFNTMVJOR3NNTUErdytseW96eXNNNlNLRFIvV09wNVVB?=
 =?utf-8?B?dWdLc2IxZTBNTXdRVVllWXdsbTJhOS9GN0hna3h3bytWbGxrUHF1WUtOQ1NL?=
 =?utf-8?B?K2xYQ0NEWDZtK3FrVkgwTjl1VW9Ld0hXemNSMFlqQldISU1QRFFka1VsR3hM?=
 =?utf-8?B?Wlo0OSt3Z0dOb0Eycy9vSHNwckhWQ2hoWk1Yd2pzV0JQMm1ZSFpCbEV0NFJv?=
 =?utf-8?B?SXMrZ3gyL09OQmZDZktGVlErMkdqZkE1WTB5am9oQ0l0Qyt2RGFOYzNFREth?=
 =?utf-8?B?Z3VuUmMxU0s3b3loaTNlakJqN1dXeXp1alFqcE9xb3dDSUl5ZmpZUXp2dDA2?=
 =?utf-8?B?ZDVnaUw2K0tvbkxkR3NrL0xueVV5dFRJMmtkWTNOYzU2d0F2UG5pUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eef4f65-de48-480d-a0f1-08de63e97ff6
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:32:45.9580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRav/tY3YQmxDUVdUcR2TvvI2ebHsN2cWLUihwtC7FO2zOb8hkiT8VcGEciAy3TDMEIawnZGPgES6SmnSrFGgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2947

On Wed Feb 4, 2026 at 11:12 AM GMT, Peter Zijlstra wrote:
> On Tue, Feb 03, 2026 at 01:15:21PM +0100, Peter Zijlstra wrote:
>> But I'm really somewhat sad that 64bit can't do better than this.
>
> Here, the below builds and boots (albeit with warnings because printf
> format crap sucks).

Hi Peter,

I am not sure if it's worth the complexity to do this for the NMI code path=
.
I don't think NMI code path is hot enough that this is necessary?

Best,
Gary

>
> ---
>  arch/x86/Kconfig               |  1 +
>  arch/x86/include/asm/preempt.h | 53 ++++++++++++++++++++++++++++++------=
------
>  arch/x86/kernel/cpu/common.c   |  2 +-
>  include/linux/hardirq.h        |  7 +++---
>  include/linux/preempt.h        | 52 ++++++++++++++++++++++++++++++++++--=
-----
>  init/main.c                    |  2 +-
>  kernel/Kconfig.preempt         |  4 ++++
>  kernel/sched/core.c            |  8 +++----
>  kernel/softirq.c               | 10 +++++++-
>  kernel/time/timer.c            |  2 +-
>  lib/locking-selftest.c         |  2 +-
>  11 files changed, 106 insertions(+), 37 deletions(-)
