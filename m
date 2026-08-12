Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020074.outbound.protection.outlook.com [52.101.195.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19A140B108
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 11:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535739; cv=fail; b=b+9NTtQD21F4d44VSbKd+0dv7ex2jcDKBBhOL2A0QnVkDVu3CJI7rWn0Fi21JzoB6xdUMqEwjAeIupxoY7tENYHAIkmKpqZdKuj/QoiFmzvLTDBC/h5CwWW/FECFKaybgu5RoZUT42qnKsehufLzGiTGIU/ZqfWeo92zt6geXn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535739; c=relaxed/simple;
	bh=mpIWVX/JpmwDbYeY8So86MSlzbaQgD7FNPUhlpf1xhc=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=nxw/TxPKhrI7tg9dUqpSTdMBLgkDIMBE7JmU9Zl/ZQJFwdKfKioba4x/rt3Uw6id/BXk1VWgXKj2gbYTuGlmLPTIShri0061J7rilLIeDBVZORAn0FWliHjqpCKqn+IKBiSLC+TdhvYWCvId9XqcXG5A2cMg29CNFK42TKIQsxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ryR8xYlg; arc=fail smtp.client-ip=52.101.195.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ryR8xYlg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBh3HV22IfQEJjhWP/8vFmyw2nGZouGrj/rvrobUqNdID2RekFtJ3ETDIZptTOmxmVvSEd1ESkkd0f63yuN6CyzI1hU0z5EZQXgQBkDCzomCabQZ1WXTuMSoOJKKwA5GhZk9imQ6G+k/GctblC8G4WBnNljbOTfuHMzzNtHnj/VjEO40+UMd7Z9JGnGhTpgg97XrAMsOHtliy0XjStPiZJFvc7ZGar3YHbGaFEPzvdOigoscvmfnV+0wV2uuvR3JiZO0BfB+dKOc0oDkhSZBB3RZectxSLC4ZDwpqua3Onix620BtAeYp7tT1+Aqua+E5hVW5hlHIZLJiMoleUtj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpIWVX/JpmwDbYeY8So86MSlzbaQgD7FNPUhlpf1xhc=;
 b=oQmfUKdVDzCiYBCtpADNdfUnUCGB+zurcn8CHKpEX0uWVNUx6NhTMshHP7VLPc6TaXPMs4Rpv6GUkywEmt5cuetKAdW4fFqqz18sac2gV/GmUXggzETU9H+yeMXHc49Ax1APj+lhj261uvtlx75oObUoZ9lrprUqKppzZeKLztPsf77eXLrLyzangwtETO+LLC/lHgdBW5jGjNHNC9CgXM6iWD6ZdZ/hbVkhQ870H9FTXKTeaKu3Njb4huWlxhJllIyK+ggyyjAl1JC7K5TDPbRs6xw+OXiZSwrAynEokBv62rNN6Bq2FLotuZwyXZr/SI/FecWbcM7Z+YJHNq3R1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpIWVX/JpmwDbYeY8So86MSlzbaQgD7FNPUhlpf1xhc=;
 b=ryR8xYlgEwUx3ex6QPJVBRT2+smK8LDmwzWrtIU3/5KPb6T5oArb2YIP6ovwfdr2hDQgL/8+hiBe0WZP3F8n4oGkyw0lLvH+9ra2iFKCf0lFj77Yyo3REJmI9XTLETiiuXAltUymSre83/q9iVwColTCeZGxr5Ab2bk3/Mx+OZg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB3162.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:15b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 11:55:33 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 11:55:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Aug 2026 12:55:31 +0100
Message-Id: <DKMY28V6EP5D.3UNFLW6GOE0EN@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "FUJITA Tomonori"
 <tomo@flapping.org>
Cc: <gary@garyguo.net>, <ojeda@kernel.org>, <a.hindborg@kernel.org>,
 <acourbot@nvidia.com>, <aliceryhl@google.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
X-Mailer: aerc 0.21.0
References: <20260811150147.1360102-1-tomo@flapping.org>
 <20260811150147.1360102-3-tomo@flapping.org>
 <DKM9KW3ARL1K.1JFJOBOB5EDKF@garyguo.net>
 <20260812.090516.1638662871785456326.tomo@flapping.org>
 <CANiq72kuOa-EKj7MHUwzjn4WiZ9f9mWJbuYsfe+PcrWgN2PgfQ@mail.gmail.com>
In-Reply-To: <CANiq72kuOa-EKj7MHUwzjn4WiZ9f9mWJbuYsfe+PcrWgN2PgfQ@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0540.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::6) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB3162:EE_
X-MS-Office365-Filtering-Correlation-Id: cfcb96a0-dcf0-40f1-0bf7-08def8689cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|23010399003|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	x1m+3UXjWSzJ+jJ8qR1yquohl2VKsA8cAFL9ZFqZ5A2Y971gv3GgGtIkmHY8/euBP+ObKuNJXKiH/8uT9PB7Vnfgc7dZifh7sB0WuWD+r+Ktqc2SoEVTy2PBKvtXBxueUKev1eO3fObiq1Rc1WMSXiWwDkjl6YbnP8bbcix5RZhKicNGFJDRa/EJQ2/6DdXbdeucYBBSus+h1i8Fk6cHv0peO/y/4bwy4bGHpOOokVRVOP8PjtfgHm/iJMIsahcH852YsZZlmgdLuuYlBjVPXoIqWFT+ubMljI2dj9ntU7aof0wGtd5CuxjT7fqq3fBKOeCzYRkHGJv7K1GQdKXxZYfPp72mML2NQODGHSegSh+CusOvE7zmrG9cxZZ5M74Que3HIp8hTMyn9gdsmilhW5jFwieDF2NAKqyqQDDRE83gxw40YQf/cBLbcMaHu9ZG2BJRZisARCexgRgXt+EjOm7oK2t1pLe8ruz0ESk/oXTs9ZcORq/UEpezGllyPWvEVRlCp0fBVmSBtWhMzpm2e7kUZkQKdhEnUzMYG5DD/v17bPZDP6W8ff2e67ofccjmUtF8nXQs2RxdPcUQk4uf2ClVSI8rEiNtLmdOt6+T8io285F2JmgH5kq9zl92zCG8Mn3/qkbnQrMTTXzsjHpG0j3RIXJIHNHubhXEJGSlGG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(23010399003)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXZxTHdHd0djMHVZVWY0eUVQOU0zOWE5bHFOSmhUdXJwL1liei9DbkNtbmFB?=
 =?utf-8?B?a01LcTNxbEFobG9QLzVvM2pCQy9KRGZ5MW0xQ2RqVlNKNGdpNFNoMlZQdGlZ?=
 =?utf-8?B?a3JRNlM0N21WUkVzd25kelF0cTBxMTcyeVBTSjRwNFBJbGduNnBML1lhV3A4?=
 =?utf-8?B?VGd2K3I4bG50ekErMGRCVHlteVJ5dzZ3L1VWWEpyM3ZsNEt4K0RjN1lvL3NJ?=
 =?utf-8?B?SWNncXUxQzBlbmVtSkxDdlVvam8vQWE0TFdUOURlcXNvUlhQQkY3bHRFV2hZ?=
 =?utf-8?B?dnBnd0pDc0oraWREUmNsVm1KWktHUkU5aUl0V3FGOE1mczltdjJKS2NBbjkv?=
 =?utf-8?B?V0JOakpmN1p0SnJWeXgzSkdHb04rR0RVZVBhUnZ5ZFdjYiswR1ZBWUxmcFlV?=
 =?utf-8?B?ZWR3QmhPWVF6a1lwbW1XaFE4RjY5M0dESXVOQ0VPZDJpUHhJQXIveVFkZUxL?=
 =?utf-8?B?VWxqRVArc1dFZGUwU2VtdDBPNkRjSFU2cFhkSklNZlQrRnVZZU5jUzZTaWVB?=
 =?utf-8?B?V0dtTGVya1Z3UkdpbURwMno1d1YzZjZOZnhsa1AxR2JVYitLbWFjTzZkMHAz?=
 =?utf-8?B?VXRLWlp5bW5WZC9jNUVBVUZLQ1I2U1ZaQ1YreDFTeWxKK2pJNU9QVFZNUFpo?=
 =?utf-8?B?ajlsRjVnakUrY2hmM1JzWUxJWk50UTF5K095RWZ3aDQ2NmFLRGU4OW1rS2t6?=
 =?utf-8?B?RWszYUNXQU5RbHpKVUZWN0J2aldxenkvdFM5TFFTb25yeFY3YnZpUFRMSnho?=
 =?utf-8?B?R0hMUkNZSExQUTFxaVNLMGROUEJQd0Mya01EazgrV0pzL2NTQS9RQjdWOEpo?=
 =?utf-8?B?MUpSWWlaenp0TkR2QXAxRmo4WXk5NXk0ZmFIMlF1YjJsQ04yYlVaajJ4VTlq?=
 =?utf-8?B?Y0NxcDVSSyswN2ZPdXROeGtpU2s3YksveUtHRytPY05nejNrK0NnR3lucytv?=
 =?utf-8?B?UjNRUHdYOU83OVF1LzJjMlpqOHFUOVRNdlJCbU1tVWtrNm5mUlBXYWQ2ZEhv?=
 =?utf-8?B?cE9iZWl4dUs3eFRqVmtRMXE0dnViaGtTMER1UGpJcUN1bFZMTzVBV1VEeXEr?=
 =?utf-8?B?eE1zY21BdkUzRy81bUM3Y1JNWlYwTitWQ2tNNUY0eEFydmo1K1E0ZGpCT2NS?=
 =?utf-8?B?NHRHb0xxd0k0WkhVbUpkcUV1TUh6c1pzemE1WUI1amF6cFczS3ZaMG52QnRD?=
 =?utf-8?B?THh5UkVIYmQyZGVHLzBlMzhDb1ROMm5UYmZ6TGN4aWFNekNIQmkvNmFyKzZV?=
 =?utf-8?B?a3Rlc2dOZGVneERVQnlyUmRGczdMSXVvSFdsbVlYSXRJSFBieEMrNFk2S2dZ?=
 =?utf-8?B?UTRNSmtGclZPRWErcHhvbjJYcEJ3a1lsdlJwdmFOczFPOUNFSG5SZU9KdzVR?=
 =?utf-8?B?WE52a211b2xkR1g2VlNFTGdmNTZxakRUSlkwZHdOeUVldnNibTd1UGNSaWFq?=
 =?utf-8?B?b0h5SUh4T1RXVkttb01MWTllN3N1RFVmaXJDOHFHMkFNU1h6VWtDSWhxV2J1?=
 =?utf-8?B?VFU4TWRqeXRBaUlDMHBGZWFmZkNkN2lsTkJBeTkwOWNMY0FLalRONkZWZWxt?=
 =?utf-8?B?Nld1cFB5QVpEN2szMXlyNk54K0xZMWRFNWJQT0NBSXV2SVM4ZHpJSVJDbm1U?=
 =?utf-8?B?cFVJcysvai9SYTkydjVaWWxKa0w1RWZNMDJkVDVJV3pUZjlNaE85SXU3b1cr?=
 =?utf-8?B?dGpqazdKMWNVVFhLVE40dXlUTS94VERQN2RGaytqUllJVnpzbi9jeCtOdmJV?=
 =?utf-8?B?NEsvQ0wxT1NnL2NqQ2VscDhtcEh6V0taQWw3OHVxUXc3WjF1UTBMdSt1NFdO?=
 =?utf-8?B?SzVlOWE0ZlJHZDVTQ05rR2NGQm45c0djN0RrdlBONHg2bVNaQ1dTWFFNR2xa?=
 =?utf-8?B?QWxncmlLWjlrOW1pd3FpWGxsQ0JvVHFhNnBTUmQ4YUhvM1RSQ3BLR2JoNGRZ?=
 =?utf-8?B?R3p4TDBRU01DbnIyMldzTUtya2E2R3V4NlpuTy9GRThLZXZvcjVQTU81cDh3?=
 =?utf-8?B?U0lFS1F1Z1Voenh2TVBsTUk1eEwxY0hOWHhzZS95Y3hiTVlrT0RSTzV6Y2hI?=
 =?utf-8?B?T0lSK2ZlbDJJN1pPMXZwc0UzWlFRK252NUNGSyswbVQ4eHdyMk1adTlnODFK?=
 =?utf-8?B?VldCeFZZSVREQ0xpcG5UVDIxNzRwQ3R6bytRN1JKTlZrMllYK3hPQzJiVGlP?=
 =?utf-8?B?MWgweU5IMkhhbTR4c3dDTG5kT0Z4cndXcHdrWVZFaFh6Nld3ZHRVZ1NYWDBT?=
 =?utf-8?B?V3YyY2lDSldOSUsyQ1NnbEV5bS9MZnRLRkt0MzlDSk1UNFRBdUpqUUhIM0Jn?=
 =?utf-8?B?L3NSSFJ3czBpU050b0czc1lWdUp3aFFqOHo4UGVKOTkzTVFJOTFuUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cfcb96a0-dcf0-40f1-0bf7-08def8689cc8
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 11:55:32.6341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Dlev35yJiNJafG4me8idRujXcF8YkohUuwzfmXkBRBr6nvvWVLm2NzZXuJEuWVGTOiJbVo+pV6lGZDdg3dTBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3162

On Wed Aug 12, 2026 at 7:06 AM BST, Miguel Ojeda wrote:
> On Wed, Aug 12, 2026 at 2:05=E2=80=AFAM FUJITA Tomonori <tomo@flapping.or=
g> wrote:
>>
>> Miguel, you suggested landing the minimum set, e.g. the first 2 or
>> first 4 patches. Patches 1-3 are already in, so that leaves patch
>> 4. Would you like to take this version, which clamps the result and
>> has a KUnit test that fails on arm with HZ=3D1000 without the clamp,
>> or should I hold it for early next cycle? Either is fine with me.
>
> Up to timekeeping, but it is very late and I think Andreas was already
> on the fence of deferring everything even before this version.
>
> But I appreciate that you reworked this very quickly as soon as I
> found that issue -- thanks Tomo.
>
> I am happy to give a tag or similar if needed next cycle for Gary's
> use case etc., so it is not a problem.

Yeah, I don't think we should rush. I suggest taking the first few patches =
for
the last series just so that we have the new types for jiffies to prevent m=
ore
users being added relying on the integer typedefs.

The APIs themselves wouldn't need to conversions (they'll just take
`Delta<Jiffy>`). The conversion functions can be added at a different pace =
and
we should definitely carefully review the boundary conditions.

Best,
Gary

>
> If we were to actually take it, then I think that, generally speaking,
> any version that works in all cases is to be strongly favored even if
> it can be optimized/improved later, i.e. what I think matters the most
> is agreeing on the documented contract, i.e. to agree on what we want
> the function to actually do. Function bodies can always be improved
> later.
>
> Cheers,
> Miguel


