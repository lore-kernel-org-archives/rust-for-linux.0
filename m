Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022118.outbound.protection.outlook.com [52.101.101.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4513D9DAA;
	Fri,  3 Jul 2026 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086461; cv=fail; b=cMXb50mw1lNgOirJRSAFcGG9vu1i8EFGm/prZqnH0ApZJomWXjdWcY1VGtPpIjwc3mCDOINaI4XTUNgCHjJVcXOK3FazVDCbN6zkMpipOPgp7ZnsXJgCeEtUD3q61SBR4tdjO3unsgFJwixINLCL5nEoRjDXFJ/2pWwsWPGaUVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086461; c=relaxed/simple;
	bh=ZUr4enDM5KgchETYP/zGpV5nXF/ZKOl0w/pYAT/rbco=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=pRKjK+nDKjmjRiwKF3SSbQtCeFzjhte6hHvjG2J5zWBqytUU/GWPNdbqOwfgOsD5rw8lLeN0HLMn3OSn3jYs8Nt1LNYYwLRtvqDinaL0oDHF3vlYhbjl2K5M6qLolqIBnuFgFKppaKSBK5zi2iyxdbLNnxqwKJbBPxrREvX5GgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xd6LGvHH; arc=fail smtp.client-ip=52.101.101.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xd6LGvHH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raY9p9wctrf5Ndda4i7xtUWCXf3j4pkUMSUhp+s7VvlYdyOWBCoyu27cMympAOH5UZt2oxmPLKF2XAeT4r8w+98ifiPIbTWudiDHP7j2E139mkGy/Vlw3N3EFQGOqmMNAoWRijb0zo4Vhpz0tJKT9FeuMVuwt72ViaUSKX8s20ibZOMLA6Uqfcaf7uCBV5XQrIZ8PEifnHhYtzlIMneKnYQhPCBEIdL9A1E7A+3ueRSika5Y+vc9Oi5WlgXfc9UI00qZRku2v3rmEtSIbyd3c+pOBul0krPl2qgzlvC+3qE9CN0t/34twm9nCcqBHdCJcq3CaRkHKoFpm9GiHS+i2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlW6tJqj0Ab+iavpt8ZhyMpHwbB5L85iwJIfln7vcUw=;
 b=xLaIpkIL00cQwJ7JyGv1aN3IVyK6zBi1iv9nJVYqInyIUzl8wRao+2iDlCyCXK+VcTZKzhfNxZJ3DmImHaNQs6xd/VLc7eTTRKFVdVJfQEQ+hFwOzy333GIjo44jjPXkEzPJASzwWYvemqH8C4fVxLNV8gSOLOdDChrnQ2WJVfUqetzOFbgTAgJytbpvB4yasgS7qhq3Ii+N0yrwviIlyt5v53uJefuB3hwbw8CSFyzSfhE77yiikOERULgKEPAVB27gsrE6JODnxip1Z2YRsmVmM160hvCHlO2Bt9SpCKsYzJp1YiRYHezCgR7jytwa0oLL2TF7W+rvI6A8dq27uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlW6tJqj0Ab+iavpt8ZhyMpHwbB5L85iwJIfln7vcUw=;
 b=xd6LGvHH8woN4cNq5HLStXJ70wFTY+vXjRe7MyaraXKUJw3ZAgo5a6x1CNaRCYh5Xyq2qktd7CRfU3WOZ5d086lAE6VpegaaLaqHlVxfdtR7I+e5YHB4ntySUf3+2dK3ojK0MxuFHVeIDG7Pf5HKypzFFktePiKS+SoIyWy6osI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7305.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:341::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 13:47:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 13:47:31 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH RFC 0/2] rust: sync: create lock class using
 `#[track_caller]`
Date: Fri, 03 Jul 2026 14:47:25 +0100
Message-Id: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG29R2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwMj3aLS4pL4nPzk7JTUAl0zIyODxDSzRLOkREsloJaCotS0zAqwcdF
 KQW7OSrEQweLSpKzU5BKQQUq1tQAu0kmBdQAAAA==
X-Change-ID: 20260702-rust_lockdep-6220af6a6ba9
To: Boqun Feng <boqun@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Lyude Paul <lyude@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783086451; l=1915;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=ZUr4enDM5KgchETYP/zGpV5nXF/ZKOl0w/pYAT/rbco=;
 b=jgjttYhcRpISWlJgVKU9ncCkQqCNfY+7CvKcygQL/WbkuvB03ZfBArnfuR6LLxi2PNp24z2Ha
 Y7mJ/CfO71oAfWXVKLujl8I9YlUbjPVW44PF+CXh16hv5Q0gZcgDgr6
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0502.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3aff57-e99d-4e2e-fe03-08ded909a140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|7416014|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	D++zUYoPyWF/2rGIJtK2r7Q3fdaowBeCfOVg3japqt8Eb9/Xi3daKLPmAykv45Z4ZZcbJOm2nBoS4cu1PqruP6HReJKRyeurpr11z12l69dx6QqwsJQKbRZiOi/JcjETduui6SBhqwG/DoPoRIlFiZQw5LgDOCUN3ih+1orqxDizUUkkDX1krH6qJ5ns5kiVkaAhsgMc6yYH23ATJSzOWWelUldChIM8U2bEXyDNGaqn8Te1JDcUdZ6vx6hub1rLvvr+s1Ck4EkbRz8+MuArGSc10ulzhGscniLg2E4c1r3IpQCWae58wwSBz5S9/8Up9P4uAikeFvtwrz1JM2qEvgXdV2su3WCVvwxq1R3ting/sEcNc3TNA/JkoolXlBJmSWlESqSVs/UzkCJJmdrr4POUhduLuHOmoFylyK1gHTndqHB/LCz+8El9tS1ayAjuaqORVC0t5n9C1Es7gjSDVZlSHX/GY2PxeEPvgzcKakJEUKc8i6HHOrye2ZTrsd+G2r9ixGF5FWKTiSoXKqGxhc2dPpOFi5c6L++0ocnEcP9LSV4jYt5U3RJNeKSgDcpD6NfHI8UjdeE5WaU3xHjNjbHTTPka6vrwAjeYIsU5zQz8lD/2FVFB5Z5JmJu5LTx/kgZ0cBppgALXuCtg1Uul9ibx72oxKEVSTMboxI2H0K5wy5il/V93P+Sy5GZ0ZUs3m3zLMNVj83V7pGtQeTSS3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(7416014)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFcrOTdhN2MrazF2Z2JGN2JSdEhpdjZxNXllS05lZ0tHeDhqOURzSTBVTTVC?=
 =?utf-8?B?U2lYQWNTUVhobFB4Mk1WM2FON054NGQydFh5Mmc4QnlBUFlCMXQ4bkIyWEZO?=
 =?utf-8?B?Q0Y0SnVBd2E2dkJ1YStxd3ZQKzBYZWk4U0FBakFZWG5VcFhWZFVEa0dOSG4r?=
 =?utf-8?B?RzUyQk1DV0NoUFhlOEphR2ZaWmdpaG5jS0lITUdIdFhHMWNrMUR5ekVtekRy?=
 =?utf-8?B?eEx0cEcrQUoxY2pXMHJzdEt3N09JUDNJN1ZPWDlKaXJQNWZsMVFrWXpFQUY4?=
 =?utf-8?B?MVZ2bnU2SjhtZDRJYTNqWmNIcnZVZm5sSHZoK21xejZiSUwrcGRQUk45VURj?=
 =?utf-8?B?TU9uTmNKaWRzSVQzRHltR0RXVDduSVRvRHFENEZRZXRSMXo5YzRDOHVNcVU2?=
 =?utf-8?B?VlFOTWFrV2hsb2ZwMi8xd1NHNXY0R296TlM1UDVZZ2szbmt4UThOU05rUEE2?=
 =?utf-8?B?RnhaeCtFNDdZei85V1Z5OXZabEhhVkdwV0k3TUhFd1RiTG5xcHVhU0RVaXNp?=
 =?utf-8?B?RE5yZDdLNHpNQm5Mbm9LSDBZVDlxZ1VCYjNsQWJaMDA0c3ZGZCtQemFmanZN?=
 =?utf-8?B?azcwOVo2dEhOSnZtVFQ0OHRFSFV6b0kvOWd5MXczVEZuMkE0UnIwQzlvWVU1?=
 =?utf-8?B?MnNtUFE4KzNKd2ZGNi95RE9DRHBLRkdVMEs1aDhseEJyVjJRZDFUZkc0U29V?=
 =?utf-8?B?Q0pWc2lZRGlxMWRSSmU3SFVDVGhEM1hZUkw3S2M2Sk9La25sTFpmVG9TckhK?=
 =?utf-8?B?RHMzQ2tvTlZzYjFQR0JVSkdkUE1OdzhENkhKbTJTM2x6aEQyQTZjMC80MzAz?=
 =?utf-8?B?YWNvMnBCV2dlRlk5OHpvMU1TdStyejkvMmVweDFhMHB6cWw1Z25ndUZOMDZk?=
 =?utf-8?B?STRMcFhObFFzR3NnNERoWENxbGtzUVhNeHl5cEQ0WmJNM3VsZkorTnR6UmFM?=
 =?utf-8?B?VDRucmpMY1dFNjFxUWg2N20vMU42VmxTZktrZHJNRGV0NXM4SjBkMzBqb0x6?=
 =?utf-8?B?OHlMbEs5Y05mekF1YWdtUWNKa1RJNnV2bWZCR0U4VzZ3bThMaDNnakh4dEpZ?=
 =?utf-8?B?bVdFeVp1SmFqQnFiS05lTzR2QlpiYWUycUtWQ0EvTXp2ZUw3c1BNL0owcG9h?=
 =?utf-8?B?SE12WEpvWlFGdTh3UWVFdzFzdVRyejB1SktNTFBlc1prUHhGeUw0T2luVHp1?=
 =?utf-8?B?NEprMzNYdGdJQ05LQ0J1M1ppc1ZuOXJrOWc3S2Zkdm5mdWJabDByZlhiS2Jm?=
 =?utf-8?B?Z2lUbUZYRHR0YTFFbFlnRHFkYlFhM1p4cnZQUWxpbWVMSTJrMnFHR0VkU2cr?=
 =?utf-8?B?YnBncHJBL1N5YmhBUkdzRHV5VkprNjF0Z0tJUG5WTHRoTWt5U2U2NmdPV2tK?=
 =?utf-8?B?ZGkraUxxY3pOa3NhaEc1NEI3MWVoL01mTG9pbC81Mkg0THFkdnU0RDYvMGZq?=
 =?utf-8?B?eFZ5NytDQjk2SnppMk1vbnVyMkFtODVUM0l6eCs0QVhwbUxhOTVrc0l6OWpM?=
 =?utf-8?B?dXM2a1BINWZMNkF5VkY4c1VsVVlDYlZvQm1WQyt3MERMRi9HWU9JNlJTanFs?=
 =?utf-8?B?UWdGZWc2YTRncHFXQ0dHQWVWZ1doRmZpRTVISXVtSXFxMlh1MllmSUxqT0tt?=
 =?utf-8?B?c3k0OVNrazZDVXgySXBuUEpuV0t1c2h6YytsNEF5Q1VkV1ZSMmNwdUt5b2tI?=
 =?utf-8?B?T014MEp6bks4OHE3eFhHKzJ4QWhWNE9LTUlVUXN4M2VqT0hsQ28yak0zZVlB?=
 =?utf-8?B?K05DWHhNTUVuRkNrK2kzMGEwSWh0NEFxdUlFdCtyOEVHNWNwUFQycjREcWdE?=
 =?utf-8?B?SG9rUVJvc09FSVFKRUlnenZReURBUU9XN001dzZaN2xKdTlmYmxWenJKOThO?=
 =?utf-8?B?ZTVaQllhWjBpSE10cUk5QlA3SlExZVlrVWFwOFcwZzh0MWFUbThDYnM5SExT?=
 =?utf-8?B?bzJyazI2WWF6aVYrMGh0L2NvYnhyTSs3WDhURGpTQ3NYTzNUQk8zRGlGbG1u?=
 =?utf-8?B?ZXFrVFdqbENhaEtFZ2FsZXk4cEVCeHNoU1Bsd1VWM1ZHMDVMNS9KQ3ZST2ky?=
 =?utf-8?B?TkI2NExjTlRLemxRWVliTmlSTVk4SS9vQUQ3aFIyL1dmUFJ3YkhzVlgza3ZI?=
 =?utf-8?B?Yis0eWV2MnRMU05BOXVNZTlDSnVSdXVTeEFSVCt0Z0dYY2I0WXJrcUpYUDQr?=
 =?utf-8?B?SVRLRDZXc2hTZUVQdXI5S1FQWjV2SmhBQXk1TVlkVGk5UmI5clN1d05wc0lZ?=
 =?utf-8?B?Uk5aeWxTTGZVV3RVandNRVM4NitUaWRwOUs1WE9yK2VlNnAxQUpMeGY5NmYw?=
 =?utf-8?B?bzZNSkFXMjEyRmdaQ1RvYitnWUFnVno0WU1RMnU0UkRPNDFrVXh6dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3aff57-e99d-4e2e-fe03-08ded909a140
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 13:47:31.7656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3/OTDxeN/y3dc3BDjDQn8Vk5lUQQsxuvZEQdqQZZdb9QiAZ0HkLKKBTA/SoAnI8p2HqpdtmDCG4rxGu+BYAXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7305

Currently we're adding more and more macros so that lock classes can be
created. The only purpose served by these macros are to create names and
static lock classes so they can be tracked by lockdep.

I've come up with an approach that uses `Location::caller` and Rust's
`#[track_caller]` feature for this purpose instead. `Location::caller()`
will return a `&'static Location<'static>` that lives in `.rodata`. As
only addresses matter for static objects, the address of the `Location`
themselves could be used for lock classes. The `Location` is of 2 * usize +
8 bytes, so they could host 2 lock class keys, so `DelayedWork` which needs
two lock classes can also use this mechanism.

The `Location::caller` could also be used to provide the name; currently,
`optional_name` just uses `file_name:line_number` as the name, and this
information is available in `Location`. However, `Location` encodes them
using file name as a C string plus two `u32`'s for line and column number,
so it cannot provide a single name. I came up with an alternative method,
which is to use a special string, which lockdep can recognize and delegate
back to Rust to print it.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (2):
      rust: sync: introduce a way to create lock class from caller
      lockdep: delegate Rust lock class printing to Rust code

 kernel/locking/lockdep.c           |  7 ++++-
 kernel/locking/lockdep_internals.h |  3 ++
 rust/kernel/sync.rs                | 61 +++++++++++++++++++++++++++++++++++---
 rust/kernel/sync/lock.rs           | 21 +++++++++++--
 rust/kernel/sync/lock/mutex.rs     | 11 ++++---
 rust/kernel/sync/lock/spinlock.rs  | 11 ++++---
 6 files changed, 95 insertions(+), 19 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260702-rust_lockdep-6220af6a6ba9

Best regards,
--  
Gary Guo <gary@garyguo.net>

