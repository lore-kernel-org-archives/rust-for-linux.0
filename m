Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022131.outbound.protection.outlook.com [52.101.101.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6548C2836E;
	Mon,  5 Jan 2026 02:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767579635; cv=fail; b=qnRb+GJiCj/MnFtbkhxD4wEnva0URxGD1jSZMMeT3rjM3rvOCnhAfqAVNvASxcNeO9Et6SAz/9NeUd3JpthBS8wjsokMPVYi+nzFd8/RTWnTokZCvlmicXxm9iJ6DDid1uHY9XYupq3uE4YKwzXrXAyFYAK5osnY3lpkvqkZepU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767579635; c=relaxed/simple;
	bh=XrTLpxXETPwgj9GxXZkrWjdT3X4ZC2LW5O65e33sJmY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h0yb42MN4HxaUun7vcHi49mYl9ACc+E9tFs1tnYyqGwMKb0Kse8VWEwTJVt8432o+dt8Kpr4fMXfF6zc8t0tQ74rk9YyZz+a3/u3UCop3T+b+BB62n1S0eTpvURR9+vpyAhxIG6wJSe/mNjNMMdCHn3KNtWLd5ZByxzP4ER/Qwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=OZ/TszsJ; arc=fail smtp.client-ip=52.101.101.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="OZ/TszsJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/0o6NFRsUMnizpm8D788Y6pf5sP9gfHT693dMMregxT0g6kgLQScchB4p7yBmGGzzY5rhKBENbaZRmCuXlJFlNTwGoYOh5SY6fs7cH3/Ahntw3sbg6IR0vI3mFL2p2+3DubkPUjwjOQke/koye9XE7r/P1CXWlcISGT/igelHGKO7kKriSIgHPuUuEJtGqpc8L3C+aWVF9TIDVfZjL0/Q1bsa7wEXexEzrFJqslweMyLxQ4JRvK3jRN402zeF8yXLoRo4Krxist4Im1LIpaLVi6WtU/7f1+nvTy3VooWr92ZoWdhVwu2TlZvIHTPBhGr/ctSiUgAuw7hv1svZde5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hW0Th9m8qCTuro4qsZZZWkEDH8pogNeqkQwt+Wwj8I=;
 b=df/foMXRWL3ASeXn/hf5IyofDNyG9Os1u158YxxsZ8InhXQtL+uLrkIhQqXkKkfA2fnWGWQJRBVDptuLe4MJuzLm5vnHS2VYniEcHRpm8/0l+OrZK0vqsXLjdcC1tAzTyj+glGsrsBvzpBPhlOZd2YhfXcOPmWwQcfqvYEQWBfn1waJRdGLaC8mVqndeg26hg8e3dkxhI5KNl1u7NpMlD2gkDXoVjuHyY6ES6eK3y+sB5YUy4tjuVGR3e3kJbMcYFEoLDUk6G+FPYIIvHhRhRFEWq7dXLUwoPwa9zI8ajdCatnAVNm0mdoNQTDiozUdMk3ZL5OF0aHm+DT6QeM6ecw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hW0Th9m8qCTuro4qsZZZWkEDH8pogNeqkQwt+Wwj8I=;
 b=OZ/TszsJZPx4/vsspfYCzMx/vpZzJGTxVBd9YY6Gc8P7ul0ajpC96jk16qGILnAohOApiBpkDWivJN6EP2DUfhaz7yFQt/wQcXgz3ejpFx3BYKrUrrk5GOApRUSSAsrtkpapbCYLT4v01lWXOYcKQi6L90ysOuhp8VimU8ZAyM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7647.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 02:20:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 02:20:31 +0000
Date: Mon, 5 Jan 2026 02:20:29 +0000
From: Gary Guo <gary@garyguo.net>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Patrick Miller
 <paddymills@proton.me>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Guilherme Giacomo Simoes
 <trintaeoitogc@gmail.com>, rust-for-linux@vger.kernel.org, Igor Korotin
 <igor.korotin.linux@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] rust: macros: use `syn` to parse `module!` macro
Message-ID: <20260105022029.5226137c.gary@garyguo.net>
In-Reply-To: <CAJ-ks9=t2rrwgXDwVtqhZz+K02E-2jNprfu-Zy5bb14b0bNhSw@mail.gmail.com>
References: <20251211185805.2835633-1-gary@kernel.org>
	<20251211185805.2835633-5-gary@kernel.org>
	<CAJ-ks9=t2rrwgXDwVtqhZz+K02E-2jNprfu-Zy5bb14b0bNhSw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0433.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: e78c1ea8-17bd-4c05-2534-08de4c00fffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3FFOGwrTGROVUEwQThidG5TMDFNbEl3T1JTU2ZQU1c4Z3BzQ0k2bmxobVBC?=
 =?utf-8?B?dlZ5cDNFZWNxYzM3U1QycHQyMmhSM2JFU2VtY1RCQVZpMTN6TlFNaHRDSGpH?=
 =?utf-8?B?cmorSnVLb1ZRS3dMUXd6Vkc1ejhRK2dKYmJDS0pPSFpCTzVhb0Y1SmpMejdP?=
 =?utf-8?B?MWNNZjNpbnJtZnk0TnJ1dHRGNDNCeXVEd3prOXNlMnlIT2hxS1VSVExiRm0v?=
 =?utf-8?B?Z2xidUp5dWNoenpZUXZqcmJ5czE5UkM0azN6VHpkSjJreEJHU0pzWU9IWG1G?=
 =?utf-8?B?VHI5WUN0U0o5UGFDcnF4R2sydzBjVm5OamJsTFhUY1J3MTIwbGU4UWprakRK?=
 =?utf-8?B?R1V3UnJ1Yk1RMnB1VEJidEIwRXF0czd4Zi91WCt5VnZBUy9jTy9IZnVwMENN?=
 =?utf-8?B?UU5ISFJPbXpRZjFuQjFETXJySmFXNGh5MnR2eXpxZTk5b2o0K0VzMlgyZ2pD?=
 =?utf-8?B?TU5MbG9YdE1IeWVFeXNJRnlWQVMvOUZMTWFqVEt3ekdUd29raVhKWXk3cWEx?=
 =?utf-8?B?cTlXMGRIWmQ0K1V5blZqVitrS2hpNjNJV3p0bjFqbVVUeWwvdVhUNzQxY29Z?=
 =?utf-8?B?aTd4SmVOUVBQUlRZY1pBZk1GUVNhYjQrMWJrUWd0YjQrejEyNFNRaG15M3A1?=
 =?utf-8?B?VnFCL1A2Nm1SRXV6OFRrb0lEZlE2RXpyaGRSRm9MY0hzY3REVnh6YjFZR1Jy?=
 =?utf-8?B?Wm5YYWM1SGl1cUpCT2dMaUxxSThBTFcvOEJQUENKeXltZnR5VEhtYjFDRFJC?=
 =?utf-8?B?UCsvTGQ1Tm9rNEdEcitnRHZWRjdwWncxRXRMbHkrRXU5OG5uK0lIV0ZqaC9J?=
 =?utf-8?B?dEFicWxaOEp0cWhnUi9Eb0RCZ016eVVCU0J6OHlEQjhpTytmVk9DOERMWlpT?=
 =?utf-8?B?a1YxNXRlakNuRmRGRm5VaUk5Qld6Wjc5RXdZWmNhTDYxK25FNHJ5enVab2hX?=
 =?utf-8?B?Y0k5ZHVkcTF0VzZ3K0wxVnhGaXhsWllxc0JGcnk1enBhRWVlL3JyS3llRU1X?=
 =?utf-8?B?dDRyNTFYakIzYVRkVHE3U2hoM0hNanAyMFhKazNFakhhSkNMOFZQWmhoeW5u?=
 =?utf-8?B?VU1SMnlIN2p0S2k4aDVsdFFYcUxaSTZsM2tjOTJsTDhPRTl0aGp6N3IxQnFX?=
 =?utf-8?B?S0xjNG4zTnRNWEYxWmVEMFA5WTNjblhGQWZiQ0FKc0ZCQzNtVGIwMFU5b0NZ?=
 =?utf-8?B?Slk3MTZOWi84aXlCcFBXNTErUXpRdjEwWFo2UHhIbkkrRWtaakRnaWNSZjR1?=
 =?utf-8?B?YXIxYlJiOStnSlFNN3BSQzdTQVVSby9iMWVjc1JMTkg0NC90V2VzeUEyWmUz?=
 =?utf-8?B?aENieEpBM1JET3Fud1ptLzJicnJrR2RCSlNtZHBjUHZaYmRaOVBYdWlCdDZa?=
 =?utf-8?B?ZXkxdW11bFdsNkk3Nnk1b1lzeGVoZkZUSWJXOVdXdHB4TVkrdUhydUFMbHYz?=
 =?utf-8?B?UDIyUXpRbWtUcWgwK3lxMlZMNmJQR09jd2ozMmZaOTYrMjdEbHZQMk00ZXdU?=
 =?utf-8?B?eXN4OXJuWVVmdHg0K1hyUElJR0owMlBqbHoyRnRjL0MvTW4vQkl3SVpTMU5U?=
 =?utf-8?B?czVLUHVTUlN0dVFLRjZwUHVudm8xd2dLOFFOWUQrSjNUQ1k5elV4NWRwRDVE?=
 =?utf-8?B?cC9DM0dBS0pzUy83d3RreEdKeklZNHBHN2VicGI3K05vb0lTZ1VMN015cE85?=
 =?utf-8?B?NlhGT3BHRkVSQWJlbURkQXZpVlRjOEdEVnd1RVVtTlc5Wm84YjV3OUYxUDUx?=
 =?utf-8?B?S2ljdEtNOEU0SThhVVVOZ3hlVncrQ0FKRm5VeEg1aGt4L2RHaCs1SnQ1VVpH?=
 =?utf-8?B?eEg2LzNXUFBHZTF3aE54eUdEczRoT3Jad1lvUWU3N0NvbzhwamYzQWtubzRC?=
 =?utf-8?B?NFZtWVB6QWdTYnhJMGhob3huN1c4SVc1ejg3SWY4TzF3c2xiV0Jjb3Y0Wjd2?=
 =?utf-8?Q?hdhBOs7hJf9sZgajGTwKYjfdcQj2T859?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czBqbzJlTlFvQlNJc2VUeU1WbmQ0bnpSaW1sUjQ3OEpYczIyT2p6TDBFOTM5?=
 =?utf-8?B?ZDZrV2xNQ2g4b3RKTVZFVGFGM21NaDV2MlVYN3JzQmpxMDFvOVB4a1dMd0dZ?=
 =?utf-8?B?ZTNIZGt3ZFc3SnF1SXhiQ0hRUU1VU3B3U21lS1p1endnKzUyd2VzRkpsQits?=
 =?utf-8?B?cmFQRjhmMTBvZWpwcGczdjBoeGUvcEhoZTQ0MkQvNEQrNkliTGordUZuVEZ4?=
 =?utf-8?B?cUt4Wko1Lzh4bkJFVkIwenMyWlhiVWNLL3g1c1RvaEpoRngyb1VlMDJJcGNK?=
 =?utf-8?B?T21BNWVaeWIyQWZPdmV3Syt4cmVPcG1xa2VMWXY3NFFia2VRcGhaUjBvQ1Fy?=
 =?utf-8?B?Y0tWcjNVWXZKVjI0T25IalhjTTZ2MmpBMjZ5czBUY2FwY2Q4Sis0dWZxNG0w?=
 =?utf-8?B?TkhFbzlnM0drY1AvWXozQ0QyUnRCTjlvUnNqb3lnQ2w0WHU0Sjl0aVQza0kr?=
 =?utf-8?B?c0g3dk1CcFNUNDI1WEJveFhjTFZYWTFjN2Uwa2hYaHIyMDhFL1VkVStLV01E?=
 =?utf-8?B?SWpVeTJGNEswYzVLQVNORE9MVFgvY3UwSFdZL25LcTlTeC9EbVYvdVNQWVV3?=
 =?utf-8?B?Y1JXYW5yeDhFbDRWR1pIRVZ1YXZyT0NHTEhMaFo4R1hld2RJT3djNmNpUm5G?=
 =?utf-8?B?eGtzVVJ0OVVYZ2E2ZlVMUTZvRUl4MlZaenhpUlVGS3lQcWFOdkNkczB2ZE93?=
 =?utf-8?B?aEM2SzZWdVN6ZFpnUm9odGdQQStuYUJaTE1SNHVaSmNxRStqdWJKN0U3TjNw?=
 =?utf-8?B?eUJ1dllnTDdTNW5OZlBQcStkK1FSV2tVT3MxZzQ1UkYyNGxNNWVWMGZnYllC?=
 =?utf-8?B?ZVVQeVZWUWNRMkRJdFNUSTEwTnNFcWNvaUFlb0RhL1ZQTmlVTzZTZ1d0K01S?=
 =?utf-8?B?TGxWc25PbnRsbk5DeDBoRnAzb2dQdGQxZjlMcHBDek5jYzd0cHl2NVF2UXl0?=
 =?utf-8?B?dVRyOG0xOXNmZ2hZbUVnYzY5QjdVQTZZNjJHMXd0ZlBaK0Y5ZlpVMXY1UGhS?=
 =?utf-8?B?YlB1a21oWjZvanNqNEh0cE9qNTlwQlp3SkthVzRsSWtibVE5Q29YK25GMXJI?=
 =?utf-8?B?bHRDWCs4amZKTE04QXEyVmxDQTY4c0ZkZVhKaHowYmFlS0dIWXFzQXZ1THZG?=
 =?utf-8?B?SUlHRk81Z0pRbDkxc01sWmJsRG1qOGlJT2JZcWRRYmRNYXJvRnVuSjdFUTVJ?=
 =?utf-8?B?M21hb3ZDOG5lMFpKZ0Q2M2hCZURSelp3U3ByWEtJWXZtbVlDL29xd2hidXFY?=
 =?utf-8?B?YmMwcG82dTkxRTVlZFpOWVVGb1BlS0hhSFlmRTZUQ1FwSzJScFRQWm9FUFFv?=
 =?utf-8?B?UFpNR2ZPakZvV05ISmlZc09hMGpqNW9CS25yZzdMNTUzOUFqZnJTUmlPZXdt?=
 =?utf-8?B?SlZ6WHdGQWs0bzIrODVoeHlNY0U0c1BtdGZpNHdPeVB4MFdaWU1hb21hNUgv?=
 =?utf-8?B?L2VpVWUwR3M4SkQwVFRrSitvSTJjd2lnaVJBSkx1TE54OXFSNnRyRzRja1JX?=
 =?utf-8?B?VmxDVmJNcnluZndjSFdJRitZbkNZdUUwRWhOZExUOHNJdjFxRVJJWlZRRm43?=
 =?utf-8?B?d0V0TmNQclRLRW8wMW9zd0ZlN05nY0xLVUU1cEhFZTF5QmZhK2xhN3BEREM1?=
 =?utf-8?B?N0ZqRTBvekk1VkphMDU0Q28ydWxCbXpLMFVxdy9GQlJhT29iSGh6NFJhVVg4?=
 =?utf-8?B?bWxhWXdZUy8xVC9OckluU3J3ZHl4NDhTUUhoblY4NVZYVm1jd2pDSGFCOXZO?=
 =?utf-8?B?RnZyZWZtVm1TbUoyU0w4RE9WaENnT2FPK3BJY2dPa3dkcGNYVzV1QndMTEp2?=
 =?utf-8?B?WnNoSDJOUkJPOVBrVEZSMGM0L050VThCYmVVVE9XcXlKbTliUVdSNno1RCtJ?=
 =?utf-8?B?aEtCbTNueXVsekE1emVMS3g0MEFNbVp2M0p6MmlaU0lnUEUrb3o2dkNGblFY?=
 =?utf-8?B?emFkY2VIME1ZYUcvY2V0aUhKZTBSTFRINVZVYzBUbnlocW9nN3RmSjFSdmRi?=
 =?utf-8?B?T0ZCRkhjMkJmWmtkVC9qRkpNZXMyVElzcDJBMmgvK01jNUdWMWlJdGpTWmFX?=
 =?utf-8?B?MkpXNTFabWQ5NGQydkRrTFZabzNxdWZ3RXRLcndLWWhOUGhadUZvbWZJVnZk?=
 =?utf-8?B?Qk41d2ZTRlJnbDF2ZWtkallPd04ydXlMYnp1TU4xRTRiU1BZZGNSK3k5L1Z1?=
 =?utf-8?B?dlZyMFdrOG1DZ0k3b3dZZjRBL0pKalFxVnZDeTNPbEt4R0N3bHg4eHhUWWRQ?=
 =?utf-8?B?QVM3ZzkxY0Y5bkJKZE0zazBXNkZqSWZvT3M1QkMrQno4d3JyU1FXdXdoSDl4?=
 =?utf-8?B?SlN3NG1BU1RodzVvdTlmamVqUkdlVGNlY2dkbEh0V2J2WnhPWXB4OEUwQXVP?=
 =?utf-8?Q?0ZJRCZMqBKLERuffjmst9lF8rf0+svCXOxikc?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e78c1ea8-17bd-4c05-2534-08de4c00fffa
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 02:20:31.2323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vS2GMfzECarmlZz681xvzCby2L9dlsifkH5ml6OzMBqBqYEpDmo5B3thCO09f7zDduSbkJ9O88LFCEfGPlJH2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7647

On Sun, 4 Jan 2026 17:53:04 -0500
Tamir Duberstein <tamird@gmail.com> wrote:

> On Thu, Dec 11, 2025 at 2:29=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
> >
> > From: Gary Guo <gary@garyguo.net>
> >=20
> > +enum ModInfoField {
> > +    Type(Token![type], Token![:], Ident),
> > +    Name(kw::name, Token![:], AsciiLitStr),
> > +    Authors(
> > +        kw::authors,
> > +        Token![:],
> > +        Bracket,
> > +        Punctuated<LitStr, Token![,]>,
> > +    ), =20
>=20
> Per the documentation on macros::module, authors must be ASCII.

Ah, I am mislead by the helper name, thinking that the current impl
supports Unicode. To be fair, author names should support unicode (we
previously use ASCII mostly because we don't want to do many parsing
and escaping).

However I'll leave it to a future patch and keep things ASCII for this
series in the new version.

>=20
> > +    Description(kw::description, Token![:], LitStr),
> > +    License(kw::license, Token![:], AsciiLitStr),
> > +    Alias(
> > +        kw::authors, =20
>=20
> This should be kw::alias

Good catch.

Best,
Gary

>=20
> > +        Token![:],
> > +        Bracket,
> > +        Punctuated<LitStr, Token![,]>,
> > +    ), =20
>=20
> Per the documentation on macros::module, alias must be ASCII.
>=20
> > +    Firmware(
> > +        kw::firmware,
> > +        Token![:],
> > +        Bracket,
> > +        Punctuated<LitStr, Token![,]>,
> > +    ), =20
>=20
> Must be ASCII.
>=20
