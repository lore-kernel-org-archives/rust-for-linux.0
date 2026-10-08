Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021110.outbound.protection.outlook.com [52.101.95.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6D450391D;
	Thu,  8 Oct 2026 19:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487650; cv=fail; b=i9+skTzgkujlvWwxJ4AqfhXxBzNlfziUb4j23RwfbKe5aI2zwDqHhuLDms7G4UC9svhDErNJFsoxnKJa8OPblN2KYGFIjl2ul9psL+A4CDFEr8AON3YCfr9T7nOamFml7jIlwu1Cl+de5FEWviAsq9yYm7LvRwQIOSlaJwirKms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487650; c=relaxed/simple;
	bh=mSfCBEUbhiL9DamnrwSrpbL/23UVWGkND0tuKdU1E7U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Onr3OQ2p4K4OZOnIuHx1tI4IKEYadxySZ3kBMsa6P3T4SoNBCW8gpVN3r37Rfe5jDRFGm86E+TQLtacqke4G87TTA6pUaQEZvv9apveOb6A2kgmAvrHFQTumcdbIsPR9xW3TCWSw+8rUMG1BYAyDD8ig4Ier9FXPzYF23DOyh0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=S0GyAyYy; arc=fail smtp.client-ip=52.101.95.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="S0GyAyYy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGn7Ku4MWlvxE+zgC8YgaUtSG24lQLfSNzPPkYOqaYsmS8fK4utvZGoOhid3oYYqCcyd09DPYE2Y8PIYFrcEaZkR0jkUxWfAWMdiW/JX/Ffe8Ir8nNWZvPRttw7sTDiNCo7iTxNGnFGWEYAizw6uyoRIYZlU5+hfapigF3Mx3hzXuM3i+3UopG0FD2eodMfv1OUJaXEnDzWo5oyz9eIe+c7zDHg+5AVYPdQg0h1iimRsBbWQUSOvAjq6QK2RFeALXOJ4WirExHbmCr6682rJ3EDc/UnKVyOU9n/PrWHJdSFjvXZSFR+zzE1Dqzsb2Eb9hJyCUFiI0nX4FXI8nZyikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3gSAR40Y3mo9kZ7J5OHl7cJ05fF5P6Jw70JpRoTL44=;
 b=a3xTEOmYUj3COhUxT6z0v+qFwLC42rm9qrv9MaIuxKvgF0+oMjwpVm2ILIiGE/lsojhRQO7T8X53H8zwH7/wSs+HPLMnIab7ix4VbaFg5bcYF1d4TXCumgYdZAhhVoWUMHad2ora6rSh1FT9Xtc9HXjWfiJZ6F4Q1Hl0zGfDXc9xPwPlY8OXCHJWEUVHPsk4skDt/hsUXqZvqRd4fIthvfYXDAL1YKixA+vzoXVu28ktMAXKvl8giDHh8P7KwyXXVA7/KsIs7SZGxtEl6YKJ2tv1n161cxV63Ym04s58oODt7u0zSfW/BoFbPyhy0BhDQRtpBbhkM6cDGQJ7vZ+Sng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3gSAR40Y3mo9kZ7J5OHl7cJ05fF5P6Jw70JpRoTL44=;
 b=S0GyAyYyVw0PO+7Q/YUXRwEiSPghDv3dhb3RvbhoTJtMfxRcO+4HYUkjbT9WnAuuHoUAEhd+/rHSJgq5ImQUm/5xDzKVJvZ9FE7HEMBER1odFhEi9nUQI2Muxz5uRPqjKjiNXTwZmoL0qu8yrTTS+b2ilnFean55bjKHBLbfzTk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:48 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:48 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:40 +0100
Subject: [PATCH v2 16/20] rust: pin-init: internal: pin_data: make field
 lifetime invariance imply type invariance
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-16-e280b3c8fba5@garyguo.net>
References: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15320; i=gary@garyguo.net;
 h=from:subject:message-id; bh=mSfCBEUbhiL9DamnrwSrpbL/23UVWGkND0tuKdU1E7U=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffFf6yfhM1uZlr29UCw477faose57ETDl+8Bnng
 Wizg/cO3YnqKGVhEONikBVTZPHoZkzbxDhb9rJW+UuYOaxMIEMYuDgFYCIr2xn+qd3sC1+gLFpk
 J9r9+aXepZeCy9+uiajK/HriwLaPz+pOdDP8Yso8e2mu/92jFfw/Nvs11SqnNXjEz5XvvV1cEa6
 R+mAKBwA8C04Q
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d9e14a-2857-480f-710a-08df257218c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|6133799003|18002099003|10067099003|22082099003|3023799007|921020|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	F5lSwAhjEbiK2u1GrdxneXn7ldufHAlwGPsIEc0DYdxeHWJbYq750mTZ6i1IhvRNLga1nVtJPdNpRBrKTX5oMmt4DEmcWw1Auogcz0uH6PiHdkVkDuW/tqy+VVljlBPW9ghipKzfNZBN+8gW9a8sQbwired+AMLQbCtoFm0kci/7XPLLrtz+G6UPkxdYA9LdNAKlZqgQVyf+q1fqu+LDMuqlm8iNATRhMQ7txWzL4eGnZMyVEmv/b9nlIdmikgbXzuiB6AQkgB1D/PwOOEhRxc7ab76+tSq8YLbZtszjneMaXxtSCHzkOZEn6iMV3QYKxdPbLM0XxA7nNxAP/99ntQHCbGGbrjL5R5r0OydhrBggFT58DsJr5DcWvC3cznohqnfU+ghZS+oKQQG0fRn5yjXCTkh9JdPfX0kdPCmKai5HrCkqQAX5iriVbIU9HzgbVN95lfiymwAtKSAKW/IvcaVDgFoUHD5etAPlYEQgWra7uiI9RxwA3inJIo6Ilfoep4bBjZeYG4Lq9U365g9kPxFiiqbkEHriODQ1Fwean0yuQ/3BF7hHGiISyWyI0MHZDFmh9H7nvvYA8w0tyjkx6Bbo/g4zMpUT/h7W4IVFH07i82agaKT17w4vFQLOsqxvp1HNCuBWpxJaiPucP53H1IDHMruIeNGN0ynVr8yuRripvNqGR06X1kbS3PzCtbYyCa7DRPmCuUoxvirPy3XmuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(6133799003)(18002099003)(10067099003)(22082099003)(3023799007)(921020)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djlSR1dycmhVT1Z6MmZGYW03bCtWNE5DOVRHTnBBQkt2ZlAvem5NN2haTWgx?=
 =?utf-8?B?aEJoMlh6LzZQdVM4N1NzYlA1N3FaTmEvaGN2OXc4aDByYzMxcHlMZ1ZQS1ZC?=
 =?utf-8?B?N0J6VE9SUWQvMHV4UU5pRXRsaGdXUlhoMDNEUVZLOS96ZzVGV0ZiVDRnV0ww?=
 =?utf-8?B?NmhEZ2NzS2dvUnVOMkVOUzArVXR6Q2xlYnVCWGVnVk95ZEpXenc4dmU4OVJK?=
 =?utf-8?B?Q1VJRFhNVHh3TjlKczhoU0R4Q3RJa1lxS1B0NXd4ZU12UFBOdGQ1WDlzRGlh?=
 =?utf-8?B?OUs0RjZkK2xQclhaUWQxNk9nQ2crMk8wSVl0VjJRd0hxbk01Um9zOHhtaUt4?=
 =?utf-8?B?Qmx6c3FzWG1HMGcwUkNscU9VV3cyZ00rcnBSZzVBeWpRdHNGOExoR0pxckZS?=
 =?utf-8?B?bFQ3bU1ERnlhNEp1eTBuWUhRSDhUbjd6RnhSZjc1TWdIb3JseTl2ZS91Mmxy?=
 =?utf-8?B?czd3NWJvUzgxNFNQRFZUeFZvRHFaNTZJMElRL1l6V2ZCcXdwRUVQUDd0c0pn?=
 =?utf-8?B?eTl4VnZtd2lqdXJFbXloaFU3a1FqRnkyUjd3STdoSm96V3BCVzNJOWJrR3VO?=
 =?utf-8?B?ZHQ5R2lrbi9jN0R5eTRpa3dFZmtyMUg1SGExcExmeVFPeURJM1RrQ2xZTW9C?=
 =?utf-8?B?enpPWm1SZTgvZGRjUVBPN3dNQmZYUXkza2hKbERNR3pnRzg1elNCS2ZtK0JT?=
 =?utf-8?B?VzlDTjVVbncrY3Fnd0NtcVNrZEVkTmlRaE9haVJ1VnBQNlJPUHhpZk5iN2JS?=
 =?utf-8?B?dklmM1VwSFcyRTczaE1PS3lXRmltUW5OMC8wWHJsN1psQ3FsUUZTTDRNQjhD?=
 =?utf-8?B?Sms0UkJlRUdKTVJNQXF0MVFCRjc5Nm0zOWk4MGpmak1wWHY2VURVRjVGYW5F?=
 =?utf-8?B?OGdRRGx5YkgrL0VDN1BFM00xYjBtMWxqaHdlbVhOSlM3aDNkN3d0V3F0SEp2?=
 =?utf-8?B?ekVWSk9nQjhySjdXd0YzSzB3WHhGSVBBVHlCWVRoMVY1MzV0eHBOOVFmTG95?=
 =?utf-8?B?K2tWSHVzUW9JVDhmRzNZZEI4clNMY1psUm9pK0pHNHlPRmtnYmtndURCaFh3?=
 =?utf-8?B?bUxyeGhtaERQUWltWHh2WlBqY1QvSzl4QzNrcXc0SGZIa0Frc2pkQjkwVnBa?=
 =?utf-8?B?dk90dlJGdmszQmxDdEJGdUlKVXFYdWVhVWFXcTZUZVZxYUI4dXprUVZudG5D?=
 =?utf-8?B?bUx1Z3NIS0t6N2FjQWlTSzdxU1Y2VTJ4VFlWMXFsM05ka3ZQRGZBajNSaHBQ?=
 =?utf-8?B?SUVmRk0yaU1EWW9QeU1QNnZPL2s0NFdjeTlKNDFTMXBUYnBMYk1Qa1FHUkdm?=
 =?utf-8?B?Mm1rRXowWTlkQ1lSSGxKZFoxTG9ScktrSGtEYmg1Q3l4WGd0b01peEF5Qllo?=
 =?utf-8?B?N1pCczc2SktGU2FzWUozSzVQd2psbXNKWWZRc1lBODJyMkltQlkxVWwyeXQ3?=
 =?utf-8?B?WE9TckhzeEVHb3BTeWlFcDA4NFNHTTAyNWN3TzViV3ZYWk9uc3BhYTkyOTNU?=
 =?utf-8?B?THJiNkM5cDhUMmZYUzlhdzNFOVNoNTN2WkNETUJtUEZ2WHp5SE1TeVBrdm1X?=
 =?utf-8?B?SjVTTm1YQ1ZybEwxMks3SC9yQzF1dUFIdE5lbDdyMDV4eWkyUUYrVDNnYldK?=
 =?utf-8?B?dTltRXRnd2JQZmNoTmYyeEpxanJpRlBtcVlyKzVYN3ZPTHIzWndRb2FHQXRO?=
 =?utf-8?B?Y2dWL201OUxlQnlVeDhFUWREbktTRG0zaDJGWUhFK3BHSXdDNWFqanVuK21l?=
 =?utf-8?B?QmVGbmFDUEtiRmdQMmFDVnJMUHI4TE1JUW9VWTFHSXQxaHhMUVRJdWFQbFBD?=
 =?utf-8?B?YWx3RERYVVJhR3g5MHFwdk1SYVUxNnY4SUoySmJjKysxTnRVZG9Pc1YrQVcw?=
 =?utf-8?B?MzlYZC9JYVNaQUp6cWxVWlNSbHBUTlhsbkVXcEpHbC9BRXJCN0xwQjFMdDZx?=
 =?utf-8?B?eHgzUEp0N2lqZEhpQTlXRW5paWxWR2tDRXMvWEh4NnpyMEF1R1M1ZVBzNWRL?=
 =?utf-8?B?QVZUMW9ZalhwaUFsdGFPRWlGU1F2TnZkNHFmRURBVmI0UjQ2bjdTZ3U1cjM4?=
 =?utf-8?B?NUErQnVSK0lNZmJidlAxaFdONDh5bVpQUVVyWEtDNVNEclF0SmFjTHFCUld6?=
 =?utf-8?B?UWh1UzlXaFlwYXpldEtsd2czLzdiQk1yQ2VzZ1lrc21taFh5ZzMyVEEreEtx?=
 =?utf-8?B?RnV4REtPakx4VEtHMnNMaW1kT2xXVjZ2czdWQm9QK2ZWbHBETGxFRHppd0F1?=
 =?utf-8?B?d2lQQlduVDRIL2gwcE5KZUNIaEttUkFjeGVsWU9wSlg4V0VtbVZ4cXBheUZz?=
 =?utf-8?B?Q0dDSjFTbFZGaFNkK2pORzZjSWVrRFp3SUVNSVA1VlZsOWdtVmxGUVJMZE9X?=
 =?utf-8?Q?XzD0MNynXd7rexZY4uDkxmM/O8J9DxehCrpuU2qvKFuDZ?=
X-MS-Exchange-AntiSpam-MessageData-1: P4ipdxdCNdziYQ==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d9e14a-2857-480f-710a-08df257218c9
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:48.2872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tSHJaAC1gJ+biejpRGAeAWgeFn7x80CSLCVeDDzfSQLtP1AUQOmOPIJkysCvjk5h/vjCzkfHSIvoVOZXhAQDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

If invariant field captures a field lifetime, then we also need to make
sure that field is also invariant. Imagine this struct:

    #[pin_data]
    struct SelfRef<'a> {
        #[uses('outer: invariant)]
        part: Mutex<&'outer str>,
        outer: &'a String,
    }

    fn new<'a>(str: &'a String) -> impl PinInit<SelfRef<'a>, Infallible> {
        pin_init!(SelfRef {
            outer: str,
            part: Mutex::new(*outer),
        })
    }

If we make this struct covariant over `'a`, then we can have the following
case:

    let mut long = "hello world".to_owned();
    let s = Box::pin_init(new(&long)).unwrap();
    {
        let mut short = "hello world".to_owned();
        // If `s` is covariant, this would be okay, because we shorten from
        // `SelfRef<'long>` to `SelfRef<'short>`.
        s.with_project_ref(|p| {
            *p.part.lock().unwrap() = &short;
        });
    }

Conceptually, a field's type must outlive the field's lifetime, so if we
have a covariant `'a`, we can have a shortened `SelfRef<'short_a>` where
`'outer` outlives `'short_a`. But the wellformedness requirement of the
field will imply `'short_a: 'outer`, which enables the `&'short_a` to
`'outer` coercion, effectively making the field lifetime `'f` behave
covariantly, too, breaking the requirement that it is invariant.

Therefore, compute an invariant closure and use an additional generics on
`Borrowed` to allow capturing things invariantly. Note that we do capture
all parameters explicitly rather than capture the field type invariantly,
because if type aliases are involved, we might be syntactically determining
that the field uses a type parameter but actually not, causing the
invariance enforcement to be missed.

Outlive bounds between field lifetimes can also cause the same issue (an
invariant field lifetime cannot be a lower bound of a covariant field
lifetime). Since we cannot deduce whether any implied bounds from type
wellformness would create such outlive relationships, prevent such bounds
from happening by using a split outlive chain.

Note that this is not a soundness hole in itself in absence of
`with_project_ref`, because with single field accessors only, the field
lifetimes of the fields are not connected; in methods like `with_project`
lifetimes are invariant so shortening cannot happen. However, such method
is likely desirable, so include the variance rule before it has been
heavily relied upon.

Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 175 ++++++++++++++++++++++++++++++++-
 rust/pin-init/src/__internal.rs        |   8 +-
 2 files changed, 174 insertions(+), 9 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 5f9f4f3ac39a..ffebba98526d 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -92,6 +92,8 @@ struct BorrowedInfo {
     kind: BorrowedKind,
     /// Field lifetime for this field.
     lifetime: Lifetime,
+    // Variance of the field lifetime, as captured by other fields.
+    lt_variance: Variance,
 }
 
 #[derive(Clone, Copy, Default, PartialEq, Eq)]
@@ -238,8 +240,11 @@ struct StructInfo {
     field_idx_map: BTreeMap<Ident, usize>,
     is_tuple_struct: bool,
     self_referential: bool,
-    /// Field lifetime generics with outlive chain.
+    /// Field lifetime genercis with outlive chain.
     field_lts_outlive_chain: Generics,
+    /// Field lifetime genercis with outlive chain, with one chain for covariant fields and one
+    /// chain for invariant fields.
+    field_lts_split_variance_outlive_chain: Generics,
 }
 
 pub(crate) fn expand_with_cfg(
@@ -431,7 +436,7 @@ fn expand(
                     return None;
                 }
 
-                Some(BorrowedInfo { kind, lifetime })
+                Some(BorrowedInfo { kind, lifetime, lt_variance: Variance::default() })
             });
 
             FieldInfo {
@@ -455,6 +460,7 @@ fn expand(
                 kind: BorrowedKind::Shared,
                 // Obtaining from `field` instead of `field_name` for the correct span.
                 lifetime: Lifetime::from_ident(&field.member.as_ident()),
+                lt_variance: Variance::Covariant,
             });
         }
     }
@@ -474,8 +480,63 @@ fn expand(
     })
     .visit_generics(&struct_.generics);
 
+    // Obtain an closure of invariant fields.
+    //
+    // If a field lifetime is used invariantly, we also need to make sure that
+    // for each generic parameter `T: 'field` bound, `T` is also captured
+    // invariantly (same is true for lifetime parameters). For example, say we
+    // have a struct `SelfRef<'a>` and a field `f: &'a ()`. For wellformedness,
+    // we would have `'a: 'f`. If we have a covariant `'a`, we can observe a
+    // shortened `SelfRef<'short_a>` where `'f` outlives `'short_a`, conflicting
+    // with the wellformedness bound `'short_a: 'f`. This will enable the
+    // `&'short_a ()` to `&'f ()` coercion, which effectively shortens `'f` too,
+    // so we shortened the field lifetime despite it being invariant.
+    let mut invariant_field_idx = BTreeSet::new();
+    let mut worklist = Vec::new();
+    for field in fields.iter() {
+        for borrow in field.captures.iter() {
+            if let Variance::Invariant = borrow.variance {
+                let Some(borrow_idx) = fields
+                    .iter()
+                    .position(|f| f.member.as_ident() == borrow.lifetime.ident)
+                else {
+                    continue;
+                };
+                if invariant_field_idx.insert(borrow_idx) {
+                    worklist.push(&fields[borrow_idx]);
+                }
+            }
+        }
+    }
+    while let Some(field) = worklist.pop() {
+        for borrow in field.captures.iter() {
+            let Some(borrow_idx) = fields
+                .iter()
+                .position(|f| f.member.as_ident() == borrow.lifetime.ident)
+            else {
+                continue;
+            };
+            let borrow = &fields[borrow_idx];
+            if invariant_field_idx.insert(borrow_idx) {
+                worklist.push(borrow);
+            }
+        }
+    }
+    for idx in invariant_field_idx {
+        fields[idx].borrowed.as_mut().unwrap().lt_variance = Variance::Invariant;
+    }
+
     // Create a lifetime parameter for each field.
     let borrowed_fields: Vec<_> = fields.iter().filter_map(|f| f.borrowed.as_ref()).collect();
+    let borrowed_covariant_fields: Vec<_> = borrowed_fields
+        .iter()
+        .filter(|f| f.lt_variance == Variance::Covariant)
+        .collect();
+    let borrowed_invariant_fields: Vec<_> = borrowed_fields
+        .iter()
+        .filter(|f| f.lt_variance == Variance::Invariant)
+        .collect();
+
     let mut field_lts_outlive_chain = Generics {
         lt_token: None,
         params: borrowed_fields
@@ -520,6 +581,96 @@ fn expand(
         }
     }
 
+    let mut field_lts_split_variance_outlive_chain = Generics {
+        lt_token: Some(Default::default()),
+        params: borrowed_covariant_fields
+            .iter()
+            .zip(std::iter::once(None).chain(borrowed_covariant_fields.iter().map(Some)))
+            .map(|(borrowed, prev)| {
+                GenericParam::Lifetime(LifetimeParam {
+                    attrs: Vec::new(),
+                    lifetime: borrowed.lifetime.clone(),
+                    colon_token: None,
+                    bounds: prev
+                        .iter()
+                        .map(|borrowed| borrowed.lifetime.clone())
+                        .collect(),
+                })
+            })
+            .chain(
+                borrowed_invariant_fields
+                    .iter()
+                    .zip(std::iter::once(None).chain(borrowed_invariant_fields.iter().map(Some)))
+                    .map(|(borrowed, prev)| {
+                        GenericParam::Lifetime(LifetimeParam {
+                            attrs: Vec::new(),
+                            lifetime: borrowed.lifetime.clone(),
+                            colon_token: None,
+                            bounds: prev
+                                .iter()
+                                .map(|borrowed| borrowed.lifetime.clone())
+                                .collect(),
+                        })
+                    }),
+            )
+            .collect(),
+        gt_token: Some(Default::default()),
+        where_clause: None,
+    };
+
+    // For `field_lts_split_variance_outlive_chain`, we may need to insert some additional bounds
+    // for types to be WF.
+    for field in fields.iter() {
+        let Some(borrowed) = &field.borrowed else {
+            continue;
+        };
+        let field_lt = &borrowed.lifetime;
+
+        // For each borrowed field that references a generic, we also need to insert their outlive
+        // bounds so they can refer to generics.
+        for lt in field.generic_lt_captures.iter() {
+            field_lts_split_variance_outlive_chain
+                .make_where_clause()
+                .predicates
+                .push(parse_quote!(#lt: #field_lt));
+        }
+
+        for ty in field.generic_ty_captures.iter() {
+            field_lts_split_variance_outlive_chain
+                .make_where_clause()
+                .predicates
+                .push(parse_quote!(#ty: #field_lt));
+        }
+
+        // If a field is invariant, then the invariance closure rule will make all borrowed fields
+        // to be invariant, so they're already captured in `field_lts_split_variance_outlive_chain`.
+        if borrowed.lt_variance != Variance::Covariant {
+            continue;
+        }
+
+        for capture in field.captures.iter() {
+            let Some(&idx) = field_idx_map.get(&capture.lifetime.ident) else {
+                continue;
+            };
+
+            let prev_borrowed = fields[idx].borrowed.as_ref().unwrap();
+
+            // If borrowed field is covariant, it's already captured in
+            // `field_lts_split_variance_outlive_chain`.
+            if prev_borrowed.lt_variance == Variance::Invariant {
+                // Covariant field borrowing an invariant field. This is not captured in the chain
+                // so we need to add additional bound. This bound is okay, as the invariant lifetime
+                // is the longer living one, so arbitrary shortening of the covariant one does not
+                // violate their relation.
+                let param = field_lts_split_variance_outlive_chain
+                    .lifetimes_mut()
+                    .find(|l| l.lifetime == prev_borrowed.lifetime)
+                    .unwrap();
+                param.bounds.push(borrowed.lifetime.clone());
+            }
+        }
+    }
+
     struct_.fields = Fields::Unit;
     let info = StructInfo {
         self_referential: fields
@@ -531,6 +682,7 @@ fn expand(
         field_idx_map,
         is_tuple_struct,
         field_lts_outlive_chain,
+        field_lts_split_variance_outlive_chain,
     };
 
     for field in &info.fields {
@@ -639,8 +791,18 @@ fn generate_struct_def(info: &StructInfo) -> TokenStream {
             ty = quote!(::pin_init::__internal::Erase<#ty>);
         };
 
-        if field.borrowed.is_some() {
-            ty = quote!(::pin_init::__internal::Borrowed<#ty>);
+        if let Some(borrowed) = &field.borrowed {
+            let mut invariance_capture = Vec::new();
+            if borrowed.lt_variance == Variance::Invariant {
+                for lt in &field.generic_lt_captures {
+                    invariance_capture.push(quote!(&#lt ()));
+                }
+
+                for ty in &field.generic_ty_captures {
+                    invariance_capture.push(quote!(::core::marker::PhantomData<#ty>));
+                }
+            }
+            ty = quote!(::pin_init::__internal::Borrowed<#ty, (#(#invariance_capture,)*)>);
         }
 
         quote! {
@@ -836,7 +998,8 @@ fn generate_drop_order_check(dcx: &mut DiagCtxt, info: &StructInfo) -> TokenStre
     // with known lifetime bounds as bounds on the function, and asks Rust to *prove* that the types
     // are wellformed, given the bounds that we understand.
 
-    let generics_with_field_lt = CombinedGenerics(vec![&info.field_lts_outlive_chain, generics]);
+    let generics_with_field_lt =
+        CombinedGenerics(vec![&info.field_lts_split_variance_outlive_chain, generics]);
 
     let (_, ty_generics, _) = generics.split_for_impl();
     let (impl_generics_with_field_lt, _, whr_with_field_lt) =
@@ -1400,6 +1563,7 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
                 Some(BorrowedInfo {
                     kind: BorrowedKind::Shared,
                     lifetime,
+                    ..
                 }) => (
                     // For borrowed fields, create a `SelfRefSlot`, which after initialization
                     // turns into a `SelfRefDropGuard` instead of `DropGuard`.
@@ -1419,6 +1583,7 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
                 Some(BorrowedInfo {
                     kind: BorrowedKind::Mutable,
                     lifetime,
+                    ..
                 }) => (
                     // For borrowed fields, create a `SelfRefSlot`, which after initialization
                     // turns into a `SelfRefDropGuard` instead of `DropGuard`.
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 56ea6d927c9e..516dd893746e 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -676,7 +676,7 @@ unsafe impl<F: EraseLt> Sync for Erase<F>
 /// This should be switched to `UnsafePinned` when it is stable.
 /// NOTE: This type needs to be covariant; Rust's 1.89+'s `UnsafePinned` is invariant.
 #[repr(transparent)]
-pub struct Borrowed<T: ?Sized>(PhantomPinned, T);
+pub struct Borrowed<T: ?Sized, P>(PhantomInvariant<P>, PhantomPinned, T);
 
 // Lifetimes not needed by drop glue are considered by Rust's drop check to be considered
 // `#[may_dangle]`. In case for a self-referential struct, we may have fields which need lifetime of
@@ -702,17 +702,17 @@ unsafe impl<F: EraseLt> Sync for Erase<F>
 // outlive the struct. And this can be done by a simple `Drop` impl that does nothing. Without a
 // dropck eye patch, presence of `Drop` impl, albeit empty, tells the drop check that the strict
 // outlive relation is needed.
-impl<T: ?Sized> Drop for Borrowed<T> {
+impl<T: ?Sized, P> Drop for Borrowed<T, P> {
     #[inline(always)]
     fn drop(&mut self) {}
 }
 
-impl<T: ?Sized> Deref for Borrowed<T> {
+impl<T: ?Sized, P> Deref for Borrowed<T, P> {
     type Target = T;
 
     #[inline(always)]
     fn deref(&self) -> &T {
-        &self.1
+        &self.2
     }
 }
 

-- 
2.54.0

