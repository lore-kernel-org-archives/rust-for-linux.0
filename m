Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021131.outbound.protection.outlook.com [52.101.100.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB29247ECD6
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071126; cv=fail; b=TEcVPuu4OufWaa5vZNkIeShD9yRmw51R9NTZRkHLrDK7xGZD67Z34P8jNvOdX1ZBI44LAoUp/sYgjjGFjC3CumQOECJoEDhFOT1MBaAmx22ZuXKhqBE2fwRyobE0FQBnyyyWRBkNS3Fk10Rg74wCyMHMTKYkElhMoWdWxmwvby8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071126; c=relaxed/simple;
	bh=/qz2RwG4cyiYAOuHMRwGqvtSryLHfNxp3eYoL6nxXKg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ZNaQ2TaP5Jxu8x32zaNKnOBZd5jLHK9l/DRf/xirViG9j6FisAfniMBGrUnQzqJHnfTR7U+plC8004wxPoNorKXUgoPcO7Ysfza6vg+eoETJtBmGLtV54nVsF/o47e/erm3WL2z+8DrSCm3flnX0GgSzb5oOLkskbLrqHwQfhHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Sh2sEolZ; arc=fail smtp.client-ip=52.101.100.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Sh2sEolZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lcue8IhxAlWhPGoMd60vLuszBOHq2ApF26M8xQQaap1X55UwcJRjx1ADSI5505ol6M5I5/TQvqEHqK3y1jD4ssZrao71VArL7pPSOt61vuLdjYHDLQ1DGsiQMLLlp0JBklfVJ5Y71eIh/XwXo2N+YKtDK4cPFET1xjLV4308df0VxrPh0MUXWDFpJHu2v0xucZZKvpjhCGwXpJS7EdA0czAKLwCQ/psoRr3ZEErV7tEhcr2ZhdHhAnEUwhpTArI7nOxooY3WWfo2psl9yU2fgf9g0CM5w/HG4COxrFiLsKqMVzQ4ToXuDCfHXfrpGTXS3Zher42p4YmbVdoMH9EuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qz2RwG4cyiYAOuHMRwGqvtSryLHfNxp3eYoL6nxXKg=;
 b=tBWgQiH3mDSfdESpqxQvJ1lvxct7EEQhQH5n0kApJrvq0oEmoZxlSIhiEnZd8Urp8aNCVbGzixUb0sYUyTHLXTUOx9Vj1JJNrpIolbHJKWfcKO2FeQwi13gS97BHYrdIjpRhpOrFzuOlr2uI+RWm9BxrrZQzMLGDSCJT4rrnGbk3KC9rjDfc4XL6Di/1eI19Kk/qsIFkT0D1FtoqYCe3snF0d7GBsToOeF7ljwPpBun76YZUFvYe+h1bE7gG6CQ7MGAaC9zW50rnjwA5XKfyo/AtfppTtSUiwg9iCEH+H63D5YO8iAfMWLA3s6WPcmcUZwhgVkUVqMeIUXkNrbMWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qz2RwG4cyiYAOuHMRwGqvtSryLHfNxp3eYoL6nxXKg=;
 b=Sh2sEolZ/HQzUE+rB4snnnnwIWchBuEZw+sSqnM9cF7V1z8TC4ytCaM0znG8XvwnLNINxuVpqgxjsFgtLjaRlBTd2JULwRw3rfGhaXYkKPd+EObEFNoFppGdvZEAAjUnPn9E7EVx61P+wDJaDTcRhwIym200TpWgdA6dMt+o/Ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB6454.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 16:38:38 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 16:38:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 17:38:37 +0100
Message-Id: <DKS7U9UHY6XR.2JC0EBIPCI06Z@garyguo.net>
Cc: "Josh Poimboeuf" <jpoimboe@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "Ke Sun" <sunke@kylinos.cn>
Subject: Re: [PATCH] objtool/rust: add one more `noreturn` Rust function
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>
X-Mailer: aerc 0.22.0
References: <20260805144524.233362-1-ojeda@kernel.org>
 <CANiq72kBrbV827gHUXd4R3AJrMTAVwxA=vGvzJ_AuOcNjVfVtg@mail.gmail.com>
In-Reply-To: <CANiq72kBrbV827gHUXd4R3AJrMTAVwxA=vGvzJ_AuOcNjVfVtg@mail.gmail.com>
X-ClientProxiedBy: LO6P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: cd284aca-6965-42ff-ff73-08defd4727b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|23010399003|4133799003|4143699003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	LpX/JEpxjYXLZ2iP3tIxJ+uT87Q3ZWNyB+q97iqkcFJKHmaXTAtO+Xo2BmaYVTBJvSL7v9pJD4yj64ODkz6i3KAtpMD9LepWnsetuuYfsWDws5pZtOPfAYmacTqF2vrNidaC/il86WDpF6Bdg2CuVGq9iKRxr08xSbIunbPbi0cYCyNIK/EtDZe9dJV9/addc3qXBOXKlKCZiNHqNN5RWoRIHTlouiBUgIZy8zHxi2u0YPq5ayXvM1UnwAJFtUUGRR0B8869p5RkBCDWx0ptse6Oyz+fAIPAG1JngobOZUmswzLElcTqG2sCCjndDAUqzn6iezMIO1QPb1OjgqKvOrcEx7xGdJLmPIsNM9SJLkjNzp1m4Iuiqc9/3LZ4T/CgYATXV2dBkWD1mY5yMmDOJOaI00LKDQDh60JbBF0G0qG/uLcQuQLQCptBKQ6vnW1Y7sF04KVQ/9yZOe93gIN+Nf2KWmxWW3n6fX5KxqmvVny/bL3qnxLdxuawDq3qa7FS+4qKg/WBBUCuqNrwG1fy2CvZ9tnDmBzDBjSCgmL/8x+jZTxierDIyL/Qe/OfHKWBPrjM097SKgh52uZWfgGlDRnOF5aGCkb5EjToGhFgI+HvOZeFSZ/zm3FbFNtEhPoqSI3Rc9x1QCJzoGPohW9VQ8hLJUsILTW4zukgVdwz7A4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(23010399003)(4133799003)(4143699003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THk2SElHSElHend6cXV6bDdUQjI1aEg2ZmRhN2E4enFLZWgxV0w1QWgzZDQv?=
 =?utf-8?B?QU8vdlNzS1FxTzJDcTZzSXo4VlYrRUFZaUxxcTd2WUNnUFRaeWJuUmdoLzJo?=
 =?utf-8?B?ZS9qUFpyTndzWU0ySkhneGxUYmZJeGJmaHM2aVQ3TUxXVTM5UDhtWldMbW5u?=
 =?utf-8?B?WEpkSUZ2NFNJQkc2aXJsR3RkUTJzM2ZIVFc1UzV5b1VXc3dHTmx3ZWduVElR?=
 =?utf-8?B?UDExekZsZXd5MUJGWlRZK2ZnRUhpMWQweWFVU1lxRFRIYWFNZXlzeEdnNnBN?=
 =?utf-8?B?c3VwMm01YUpUS00zVW5IYlhzZHVxQ1N3cXQ4MGVzUnVJY2RISHJ2SVJ2bjJ5?=
 =?utf-8?B?QlV6disrMTREbzdmZWt1S3ByRTE3RERjN1RTYjRjZ3ZnRHZpdnVRTXA5M3Ro?=
 =?utf-8?B?Mm5YaVlnOUVBa25QYkF6a2Vtanl2cHpPT1ZXc0dabkNSdW4xMFdVUWVNUWJE?=
 =?utf-8?B?NkxHVDl1eFpSUUF5ZlhLU2ZFaXZwb2lhb1R1b1FNWnUrTFZTem51SWZ3Nmla?=
 =?utf-8?B?eEx2R3dzTmNrTmxwVEk2Y0U0UDBJdlZjeVZyK3ROWm5NNURhcm9XRjFTN0Fq?=
 =?utf-8?B?by9wS3RlcnFkeUxCcENLV3RKbVZIbG1iYS80dVlFN1FHZVB6ZWNKWGlmNmNO?=
 =?utf-8?B?b2tYcERKMEUreVhQMkJqa1BzelV2cHAxZmgybTZhMmlkczBGWjB4WFFwRW9u?=
 =?utf-8?B?SjVCK1NENmV0NklWdFRFN0lNdXVsRTRLbVhSK3hjdHpTTnMwOFNoSjV2ZWFX?=
 =?utf-8?B?RjVZZWprMkZVMVFVNzBEcndrbXRod21TTWZmL3Urb0huZk12YjIzS3grTmxY?=
 =?utf-8?B?YnFydDAzNzdLR293YWZqeHFYTWMxalNZOUtoT25NbVRpMkd2b3dYakdLRTda?=
 =?utf-8?B?bnJwUVNIWHdmN3F6V21kYzdkRWtyWGY2UndGMkdyeVdmTzZvQVBOTGZqcDRK?=
 =?utf-8?B?Q0c2enFCakplUkhyNHYxQlp3MXpyaXdRUVZBQWM4dk41T3ZkeHRpNkxCY3dK?=
 =?utf-8?B?QXlQOUJTWUNDMTgxd08xa21LWGhsUDJpN3pxTWozZmVNWFY4YjdjU053UHBw?=
 =?utf-8?B?RUdpVFBSYjlZRW5UVXU2SktBamthUTZVZy9wWGh2NE1VVWR4S0dRUWM3ZDZH?=
 =?utf-8?B?Z0Q2Y1ZDWk1Xd2lUTWVCYlh3ODN4QUw4OTRiYzdFY3BDUmN1N2NaSG1NNHBI?=
 =?utf-8?B?aDNia2tqU0pQMWJjVTd1dzdYNHVDeU5EdDhVMWhuNTVuTnk1UXdaSmlkQU1r?=
 =?utf-8?B?Z2YvaFl3cWRTYUw2Tjkvcmt3aTZTUTBYWDErMTZMOTBLN1VtWFRCdVc2WkM2?=
 =?utf-8?B?enJXMVVCZXIrcndjRDBlbTd5ajV1SGRrZzZuK1lBOStRaFBtWlF6T3NaRVVq?=
 =?utf-8?B?Vm03ZmFMdmI0TlYxY3ZIc3BDTlNwWVkwdElKMFN0WXp5Z241UERwbVk0OVlh?=
 =?utf-8?B?S3F4aHRtaDBWRnQ0NFJzcG1VL2lhSEUxa25kbUIxbWRqUVE5QzhJcy8xWGYx?=
 =?utf-8?B?TXZ4SjI4N0EzN2dxSUtjNm9uZytBbFVaMnFiMFdUd0Uvd2ZWSjkzVnRocEkw?=
 =?utf-8?B?TFJ5QlhoZHVjbVYwVWhPTXMxZVM3Z2lFaUFZcHpmYmYvZkMvbFBYVWNmS2M2?=
 =?utf-8?B?S3FPWWFtaENmSjNGK3dEUmhpUmEyMFZ4M1ozS2o4Uy9nWnRrbWYzZ29mV01O?=
 =?utf-8?B?V2NSZk9IUDdWU2d2Q2NxMEhjaGwzYTl3TWZBS2lyK1dDTWNpV2FWMndCeXVy?=
 =?utf-8?B?TXBIQ3dRTnlNdy9NOWxyWnY3RFZDdTRPdTNabWUvOVpsVUhWMkExOVd0ekFm?=
 =?utf-8?B?VTBmN1VPOFRzUjl0MU1VN1FDQkN0cHJDTUNMY0lhd3E3dVVsWERBRzBMNjJ6?=
 =?utf-8?B?NTZyZUc0bDZBdGRkUkVDY2o5OUtGTkMxRXhxczBXeGFMRml6eVQwdTJLZHF6?=
 =?utf-8?B?cmdkNEZOK2lUSkpNV2JkRUhiV3NzZ1YxRElRcWRsSjRoK0l6dXQ1OXBodGVB?=
 =?utf-8?B?bG16WWNTR1dMamoxN2xjOFR0N29SMEp5STRvalNoZjliV2ZsbmdmZHhIVlhJ?=
 =?utf-8?B?dGFaTXBOSkxBT21COExFVUNzdm0xdWphU1BEMzhCT2taTFdNZTdiOUtoNGpj?=
 =?utf-8?B?RnI2OE8yTGNkM0FYOVVvUnB0VXNldWg1aE01b3pFWThDSkdvczBSUEVMQi9m?=
 =?utf-8?B?VlpYb051S1F4TGt0OVNnYlA1WFBnbmdQSFRUNjVqY1Vocmh3QXhWVWVSRm1v?=
 =?utf-8?B?b0RjR1BWSm1kMzR6QW9HbS96aWEzYnFDZkpOYWh3RkVTTUpvZXpRbVVzQUtI?=
 =?utf-8?B?V3RaQVJLTy81NElzd0tnNzhScmhZQ09zTG1CdjFwTDNKN3hxR0I3Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cd284aca-6965-42ff-ff73-08defd4727b1
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 16:38:38.5548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVBYQlW8WqOE3zQBmxwPDow/gBnaUJ8KY+92bXOK5ByfjvI3zK6lxlF54oIk1Wjr4HYis3dR+eBMLGniQShUCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6454

On Sat Aug 15, 2026 at 3:55 PM BST, Miguel Ojeda wrote:
> On Wed, Aug 5, 2026 at 4:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>>
>> When the pointer formatting series [1] is applied and KUnit tests
>> are enabled, `objtool` would report an error with any of our
>> supported Rust versions. For instance, with Rust 1.97.1:
>
> With the version that I applied of that series, this was not strictly
> needed anymore.

I am seeing this function causing issue on my 1.85.1 -Os build, although th=
e
error message is different this time:

rust/kernel.o: warning: objtool: _RNvXs2_NtNtCsaNryh1j6xD7_4core3str6traits=
eINtNtNtB9_3ops5index5IndexINtNtBJ_5range9RangeFromjEE5indexCsldbe0TGTmNx_6=
kernel+0x1d: stack state mismatch: cfa1=3D4+8 cfa2=3D4+16

Disassembly shows that the function call before the warning location is a c=
all
to _4core3str16slice_error_fail, and objtool thought it can return (which w=
ill
end up with a unbalanced stack if it does return).

Applying the patch fixes the issue.

Best,
Gary
