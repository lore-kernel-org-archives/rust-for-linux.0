Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022117.outbound.protection.outlook.com [52.101.96.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453F135A94C
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522067; cv=fail; b=XppM0JxX3bQlw2S+itgOozeaYvmuuaNr5MWxVb0ULIDxS+KMwpJzS+9Eu1q+O53ICjmN4UI8mh8Cj2SRkpbzXHM4TpZpry535Py15F1dm62u6ywi+EIi9hiCgNEL1FZ1xrsLoCP9QDBKMKvrnvrul2FHtVowv0XbNYW7hnGWn9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522067; c=relaxed/simple;
	bh=ghTNUghHfKHi3wS3ZxkD1Y5Bg6zTo2JXJX3LS5oqIlo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=G4sV7I/+bEB/JnGUPGV2Xf6D3ecMgaD9tmzV3npwk1am03Q6Ps+J72wcaAcS/1HCiJIjghncFV8d7NL+toBHt3JfYq9fucjUDiL25iWdS4P6OTo7Qm44jDuifXREClIZYvPZ6vTYi42dyiKyehrMXpUHwDFfyCC33uzEZskdXWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=yi6M2iL4; arc=fail smtp.client-ip=52.101.96.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="yi6M2iL4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRoJV93gnM4HHDqFs+MMc5rHlpal5somP7QBcD3LM8Nz4znVf71J6+HcMsyHGAbKbPDvFGbDYbePqRlvZbpoM+J9H/D5tUTdABQwKhD4CwrKb0nn+HL/7vtzgBLximgitWOiqb+tNf6EeNKYs6aWV9QSQskCIKwjamrgEruYcHI8HiFEFrc3RkonTX4SEEkVf05zlpJepSO1aXNBfJE90jZF3fZYDHEnGuVeYcnCI2EFmWQym37vi13lYv0mzpmn5PGjpt9CI4jRb6v7lSo7Xt6RQqmEAGU3QWzO+5klksfu9bG/4LpKCH/3Dv+K/2/+yJ+3SRNBmTyPy2BLmlwTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzqjaSGGHiU5qhMX8LtcxhsDBE/Px4FlHYaSEJ91la0=;
 b=yeMB4/EF7DS/m4t1+nk2rhsBmRlO2BRn/dTxbcmpE/k+V5hWet6G52oO1pkG8cIs4CIjgsaeJqtKAxUwhMqUUaa9aNe7pV3PFG6Tgv8kMXQuyKsGvgsKGrOttp9eZNs33Rz8OGyN7EgekYOn2tlbd0oS6y1iLP/RTYZXAlITNbOGuS9Wt+xnhYWgz5j9W7weNn+OVmUpnutl7zC5DWZrJLtK4rhGvij0QfUyOiqgE4YftQ3Izwfp4fVWOjOSOSIoNvtUCNgz3ZTicx+tspr8VWLn1Tq0soTdUglA6qd08JKYiMgKUvwiVWQIqnp0Y5ghVgGnbpn8eL1QEj90LD0qcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzqjaSGGHiU5qhMX8LtcxhsDBE/Px4FlHYaSEJ91la0=;
 b=yi6M2iL4evnCCNC/rxJAMuGHySGABp+MaPSyZ+JcDKQEK00OUoRhegiqbQeFgParOWjmiTAoiyHeRNdqSTyMWBflMoY4T0toTQaGF2437f9OCsUoTpoD4w7Ub14ADxNPbMR+SoKMaqNODjo70M8F6kICbBZmDiY5J26SGcewgSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO0P265MB6326.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 13:54:20 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 13:54:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 13:54:20 +0000
Message-Id: <DFZF7W3TP2GK.2QM2H7EPYMGRY@garyguo.net>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 2/2] rust: list: Use AtomicFlag in AtomicTracker
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@aliasing.net>, <boqun.feng@gmail.com>,
 <ojeda@kernel.org>, <peterz@infradead.org>, <will@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260127125300.3656544-1-tomo@aliasing.net>
 <20260127125300.3656544-3-tomo@aliasing.net>
In-Reply-To: <20260127125300.3656544-3-tomo@aliasing.net>
X-ClientProxiedBy: LO4P265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::21) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO0P265MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c71c945-6eba-4ca1-988e-08de5dab9231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm5VRm9JeXkyU09qWHBNMmwwWTNZUXR2aXNQcDF0WDFoSW5BWERUTzduZVhW?=
 =?utf-8?B?T0V6Y25ZZ0paZlB0c3JIdURHVVp3K2VqY3Jzb0xiQXRoaVdkYnZUcjBtUXk1?=
 =?utf-8?B?VXV0YnVRT0E5R05PNWtsbW1RWEJ0aS9tNU5EWUVQTXduYitkSTZ3cjlic3NY?=
 =?utf-8?B?dUF2eDk0SC9jbVZPVmJyVFpXZlM2NE56ZDUzR2w2aVgyUlIvZVhtSFM2ZEI2?=
 =?utf-8?B?WVRSYm1nbThjenlkaEdleDRQeERUbXQvYkt3bjk4Z2FvSktWVmJkWmxRQUZw?=
 =?utf-8?B?Zm8vbVJLcEdxYnJKbExKVTZqRWpQVlFCdGVFVkJJVkU5d3MrTUI0T2lTVDNx?=
 =?utf-8?B?UmVuUG1mL2M1YkIwb1RRdkF0NkhaUVM1a2U3NGtwL0tuRXhyWm5WSXduNVMr?=
 =?utf-8?B?U0w5U3l6ZkpUMnVxY3ZpM2xJdVJxYks5dFpZcEZBaUc4Uk1qczNLbDQxeXp3?=
 =?utf-8?B?UXgzWDRBd2hFQ3E4d2tsTFdFb0dwdzg0QmlHa3F1NnVYY0FVRG5qY1p1LzF6?=
 =?utf-8?B?b0pvbjJaSlB5UGN1dGNSZ1NBZzVxa3VkOUdBdDVGY054T3YwNC9MRWYvMWR2?=
 =?utf-8?B?Lzl5dTRIbi82YzByVUtVbkJyL0hhUnNYVEpsSUk3VHRoV2h5Q2Q3Vm95eVJo?=
 =?utf-8?B?cmVxQmZJOWRuRUlsd2JvYjM0ZE5TUml6TStjU294V0FLckh2Q1NGZFVweFZZ?=
 =?utf-8?B?WEE4dXIvbDdNRGNySWZrWVR4R2g1KzVCMDBQU3lXK2hzSlBpNVltazFlbXZ6?=
 =?utf-8?B?Y28zYUR4d3QwNXBLS3FHd0tSelRrZEE0V1lLZk1TcW5NTTNvbEZnT2xnb2Jm?=
 =?utf-8?B?aDA3cFdka1A2aWc1UjRkeFZsZWJHWStXc3dvU2hUeUtlOUpnNEtNWXBRVFFC?=
 =?utf-8?B?ZEQzNDdtUjJVQ2VLNURIWndtVW94eUptWmkwd3l2aWNOSmFyVm00eTNzMlVG?=
 =?utf-8?B?M1NQRlh1NHNsUzhIV0VxWXlWNnljR01IUHl2Tmg2UTdZRG9NVFFoYWdodDZE?=
 =?utf-8?B?MWRzQk1zalVUb1NFZFRmckpZcDgxaUprM1JDc0lHWTdoeG5MdndkbUdVU1Nk?=
 =?utf-8?B?SGYvNlIxZElNTFAvR2Y2cTR0ODhIdlZibnYzY2licHVYd2VLWng2MzlEZHJr?=
 =?utf-8?B?RndEcXgwOWY1RkdFc3VUSHlMK3lncXJpTFIzY2FrTWxJaXZCd2VJc0VueGJk?=
 =?utf-8?B?aGtOK3JvMmpxRkxOQmxIMHlUVzR5V2RDRGRKQ3J1dVh2N0R1bFpvWlowN2JB?=
 =?utf-8?B?dXE0TDJ6MFVoTUJ4cldrNFVTaFdZZWVoVlZMdFhUdzNPMnk4RkJRMHJpL2ts?=
 =?utf-8?B?eUhZOEZVNTRSZ1JTbFlnRk0vcE9PdXdOZ3RQbWJDWVV6bHNtSUtyUUdERU9x?=
 =?utf-8?B?QVZ2ZlozbG5sWHFJVmxCWXh5ODM4OWl0NEtXaml1THlXc21jUFFqdXorcVpB?=
 =?utf-8?B?ejdiU21FZUZjM1FkMUdZR2xocjJJN29LM3VETDFNTE5zMG9sRWJQckF2akRk?=
 =?utf-8?B?M1orUHFKeGFHb2dpd0MvaXAwZ1lzMVdNV2pJdUprbTFEWU1pZGZOZ01nSTFo?=
 =?utf-8?B?NEJ5TGhDa0hocFpsbk9aVDlYT0I1NjhDRStCdXRQZjQxVlBrTVhOcDBNOE9w?=
 =?utf-8?B?UmlWa1g4c0VTTUtiY2UvRnR2VE5Pei9IcTNlNkMyc1lQOXNRNnpQem9aeW56?=
 =?utf-8?B?OGRuUVRGL1BSaU9HYk1vMGpwYjhMT0ZWL0RlTTJ3ZVpwVlR5MjZqbkdRbDhY?=
 =?utf-8?B?aUp0Ny94WkVxMCtsS1dxTXFGL0NXNGtkeEtVcVNPMXVYNWNXOXRNYk9tazB3?=
 =?utf-8?B?a0d0RUV1cy9UOTNaMzVwcm00amdEN2tzbERMTkIrR1VSRTFBUE5LajFWazEv?=
 =?utf-8?B?bm9ia1pCeVZsQzJwRWRIdTFqTTdkc0hrM0VpOG44ZnRrWUxQbkJ0TUswV1Fr?=
 =?utf-8?B?MFZHZW9ZbmhpekpEUFo3M0tEdFBRa29OZkx1a2FZY1JBVFF5elBweEhNYnVG?=
 =?utf-8?B?c0tldmFkS3Z0SE5NMjY2eEEwS1JVZysrZFFWb2N3b2U1WXJsa2xlWTRTcnpG?=
 =?utf-8?B?cDhEOWhLMVhucHdHZ1JVdzRVKy9kOFpZWnV3bnNtd3YvNisxU3c0cmw4V1l5?=
 =?utf-8?Q?fmM8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1hjTVdMZXdhbEZLWmo4cStvdjFjTmZDRlQ3OERKSklqcEZFZ1lzK01TNUlp?=
 =?utf-8?B?UjUrcTlZWE9wZlNCWkEycTBYKytkUkFsdm4wRnVEQTlMUW44aHBVWGNZTDlq?=
 =?utf-8?B?ak1ZdmJRZEtQNzlxZ1VBUVR4eFB4NVdJZkE5ODhHVEZQZ29DWkxzbWFYaVJl?=
 =?utf-8?B?TDhnOWpsTjR4bDJDeHo3L3dyeGVTNGxXVUc0UEJHcFRYM0JBNGRzcTBCcDNW?=
 =?utf-8?B?VnJOSE1zSG5SU3pIZXNmSUpSaEpNOVFlODJlQUNtZ2pWMUl5WUFwTitKbDkr?=
 =?utf-8?B?SlNHRERXMUZnUlgxN3ZlaXdDRk5meWk4ODBZLyt0VU13clZldzJ3UmZrR1BT?=
 =?utf-8?B?MzcwT0ppRDZMOXRYNnNJNmYvcFo3Um5kTjZPbE9CR2NBVEJBNS83Y29IT2Z2?=
 =?utf-8?B?R3JuenNkL1JmOUhiUTZ2UnlJSWd6S2grWVpQU0NxUmFaM3BOdCsyVEpOMVIz?=
 =?utf-8?B?MW94V1Y1ZzlhMm8ySmlML096cEpxaHFEaWJLK21kTU5tVTRHTWxUQld1b1RD?=
 =?utf-8?B?WDA0RTYrbUhDYnEvODNFa1EwUTlzcWRkb2IrVU5aRG4wWHNra1RXOFd2VE1j?=
 =?utf-8?B?cmhVVFZNUXBXN2x4U215TDUwVG9hWmJneUhwWGRFazZoak5VQm9xRmNkQjJn?=
 =?utf-8?B?MmxESEdkNUkwcGNWZlpmNTlTOSswQjFoK00vLzY4SUpKa01hTitLaXJHWDc4?=
 =?utf-8?B?SXdNQ05CWDVxaWpveGlPOFVhdmpySWhHMmUycHdtbkh4cGdxRWhWTTUyWkdo?=
 =?utf-8?B?OXJCRkhKV3dYVCs3VUk5SStuQzVLTHAxZjVJd0lRMUZoMGJZTlA4NXlQeW8v?=
 =?utf-8?B?TStrWEpYR0YveEdIZzROMWtYVHlNcjg0KzJOakFOZ3VuZkNKZmM2eDJ3eUV0?=
 =?utf-8?B?S3N3T0IvcGorZllPOFh5VHJmL0ZKeGlIZ2FCNWlqTlcwUyt6Q2I4dVRtQktR?=
 =?utf-8?B?ZWJsWFFlREVNL1VEQlk2V0hpOXFRRmRIZytNUG8vRkhnL1duRjIxbGV4K3Rw?=
 =?utf-8?B?d2QwOGRsbVA5MjJhK1dUckU1L2lxSXltVUZIalMwbC9JcWxxNDIwaWFEbG8r?=
 =?utf-8?B?dnpZeEpsejFVTFEra2RQcGVEUzVaQkZvelJOay9udGlQeUUrQ0JjNGd0VGFn?=
 =?utf-8?B?OHdMTTM1eS9KM2NtbWI5NFdSenFXellDMnUwUTRzajRVU1NZUmhDQXByKzlo?=
 =?utf-8?B?dnAvd1lBTG5kem5tOG1kNm11LzAzeGVBN1ExSVE3aWdzcW1sYm5Ia3IrSzBs?=
 =?utf-8?B?MmJBVm9OZHcrRVM5YnBVczVOMUZtY1ZJZE9BdDNKeldmRXM0cU95WDQzbnUy?=
 =?utf-8?B?QjBaTEFEcG9oVWRwS3c2S1RUT3JxUDBzY0NHZHVucGhqTUNNZmhjOVdKM0pP?=
 =?utf-8?B?ZnpZN052enBlMjhKaU1FWUdybTNTZEo5eVk3aEx0eHg3U0Y5VWtHY2h3ZjRU?=
 =?utf-8?B?Mkgza080c3dWTktFbnF6SU8yQmQwQ1BGNXhYcWQrWFQwSVBGZ2VUUHoyZlVk?=
 =?utf-8?B?d3hQMHFrblh6YWJTb3pHRXV5M3ZyWlk0S2NSNkVmMFhXZm5KNS8wZ2FySXhG?=
 =?utf-8?B?c1MwYWR3RmxnbjlyNm9wM0VReVU1SGkxc1JPRHdBamtFUDY5SHJqTXdGbTRU?=
 =?utf-8?B?UllSbDhPUVRkR1FnZkNuSllHMU5wcFdvMi9vbGxML2s4R0JiVURscGwzZy85?=
 =?utf-8?B?clhSMnFsMEEzOTVxSFBqTHd0eFFxMHhKdi9JeldLMms4U0dwYkJKY3RLbVEv?=
 =?utf-8?B?L2kvUHdmVTc1bTZrOGUxenY1eVluYnNKbFRtK1JkS3J6S2VrUXdRSlZuQTFl?=
 =?utf-8?B?cXByS0d6OVdjcUFWbTFFN3BSOVR6MzhwT0FyOTBWTC85NFd2WkxrUGoxMThY?=
 =?utf-8?B?c1UzNWxDcmdlNThsOXNLMGRNcTdYelhIZ3FLYy9vdnhzQjhZTFc2cWtGazA4?=
 =?utf-8?B?NTJQNzNKTzZvQktVbWJlL2M5UHlSYU1meEhJS1FKclVOV0Q3SFE2elhOdHdk?=
 =?utf-8?B?MEdSQ1cyVzZUS20wRlgvdEtJWkZWQ2pOZzhOTC9rNk5xYlk4MEo2WkZLTGRO?=
 =?utf-8?B?R1BZMllGaG1RR0xLd1ZwL1VZd1R5QUVpVk44MEJvTU9WYTFzcnh3QkxqUFVv?=
 =?utf-8?B?STd2ajQ5ZnlraloydWZUMDZSUnlwT1dnQzJKZFpEWlVyQzZCZjlJVlRNZmFk?=
 =?utf-8?B?WFRvaEpub0xqbFdXL3RSd0NHYnE1MEtzbFkweUIwVERwRU5WdENFTFhXcEw3?=
 =?utf-8?B?Q2JVSFlHejUrMnRHV3hvcXJJMGh5TnBkQnU5VnZNVFlueGV2NHBhTEpDell4?=
 =?utf-8?Q?tcj4/Om3obeb2LrUuZ?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c71c945-6eba-4ca1-988e-08de5dab9231
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:54:20.7712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTF85qCjIfj1u8MR6f197E15nf8KKY/qUqBC521GhnkPQBCaCf7b3YOSZ/Ym7oFlX7CeEVV2mTGUFyS3t/wfYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6326

On Tue Jan 27, 2026 at 12:53 PM GMT, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>=20
> Make AtomicTracker use AtomicFlag instead of Atomic<bool> to avoid
> slow byte-sized RMWs on architectures that don't support them.
>=20
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

The diff is neat!

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/list/arc.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

