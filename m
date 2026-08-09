Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021125.outbound.protection.outlook.com [52.101.100.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8861A6838;
	Sun,  9 Aug 2026 11:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786276216; cv=fail; b=H4fCB9obBKkgZTnvAeYlHy7VLn+3RZ56i4X1NafNQqe7YxSzS0EQv0MzZYT3yeaxh6rckq8cQBrzztJtK7EZZJ+lmiB0T76eBUFW5JPyGIDkEhbrDOyuiMABoX2PugGsEGRTAfkopYzDAhqW2R7ASuNlBXukgihS1RrvxnyNatA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786276216; c=relaxed/simple;
	bh=Fiv+bls/mt4Z9fUH8sioCgP5aN+JaWOP/mPQZ+bcEw0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=SlxvHRiGClM2/dc+QbYl+AU+FCk7GkzKTJ6mQK+BqTqOsQ2m6Upu+5hcyr+VEcTZ0gN9xokJnmU+1ukyPm7gybLU/ODd6HkctQpJITFAwQCrYmgW0bDxS0MUq9BPYkXOCH7KDoaa1QCy3fe3/pebkroyQRLLIIBVyZJSWr9fyps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qh4mfxyx; arc=fail smtp.client-ip=52.101.100.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qh4mfxyx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eo+5iRQA2bBkzwLo1IEoz1d6Xoq5FRi49PmJ5PHjFNDNFx0rgRuVDIiSy/NoKF4wVgTuq3/A7CJIGbjw+/QW51EiGHBtX0ud+oJxbW3Jqo/y90os0TF0Ii+r/moNneMg2ZqFuAyMdawxQvX2c0x0XxMQQ+XVugRa+szZXiTUEFNULJoH5r8cBCHgviMJTsHNTTDjk6v8aCtaKObyk/Sx5qUCRiCJ7RFzuoBhJL+dc2wBtL0p5+5WbU1lnWl3yMeodssvWMgceh5RtadKWXJVoDKij6dvDUWssm7YdMFblltAwU8KJ5Ju1z7yiJJVuThy0uJKWJFmK4MRDkQhRPYzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LtLVagzv9iPt5Mjb7Ielg2Gx10JmhN4R5IJ6KBzISs=;
 b=Rd/rkaZ2vOfeodtv0xWnPoNQfPuiQqMO/u5is74wVjIXOc4jGXlxkVEyAXXeOLWxmPdnlaKSkVPbcXPF96uijiCvawGVvlQJnw9k6iEwG3AaMxoCBiyfP81S+hlOBI7skYJmNMk4jJvTM9B8ZKu6F8Qad62NcR/dUo5sNDq3jk2kbskcQpnMl7lj6nA29o9OhHvWKp9jDoOe3ybUnpnLf9jvQqCoEdU4GT8zpRKqO3DnGroGPRzLcGtHxq9mEvdfuxdg49yrW4/pJHe+mLRn3k/XKG2Z89HVQ0boxb3VsoOIHSM+8TU9Y1TEnxWMuwXyGT+cRSX/8dcO89RGl3cssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LtLVagzv9iPt5Mjb7Ielg2Gx10JmhN4R5IJ6KBzISs=;
 b=qh4mfxyxPKbFL3tknw63Hw3zmCusamFLjk5E6hIKp/xhyh2K1jyAL2+5B2PCBRxFm4bcK7C5aw/bf5Lzzp+QHc+96uQWMerDbG5eot2z2oS6+GgXhylkJLNCsB2At2mmBwCWaSesSonZxnA09+5CfYx7JhaMTZLHkOZX9ELZ/CA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOAP265MB9237.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:494::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 11:50:11 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 11:50:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 12:50:10 +0100
Message-Id: <DKKE2IOMZRB6.1B62D7V37SK7Q@garyguo.net>
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: miscdevice: add registration data to MiscDevice
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260807-miscdevice-data-v1-1-43c4233e0b03@google.com>
 <DKISHUP2OL6U.1NEMCW4S0Z9FR@garyguo.net>
 <CAH5fLggVkEYB0_SXcSGVBgs2hDejSU8P_y-5BvbyNhEvBPY1eQ@mail.gmail.com>
 <DKITW7C1POAV.QX2CZS7JQ6BM@garyguo.net> <anc0zESlTrEoBv8I@google.com>
In-Reply-To: <anc0zESlTrEoBv8I@google.com>
X-ClientProxiedBy: LO4P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::20) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOAP265MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe5e2cf-fdb3-4ff2-8dc8-08def60c5e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|10070799003|22082099003|18002099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	JWIhXVwbaIyGAvM+ZVagNRv1DHQNitMnlPW7VcZWEnajq6h5xgCxHNWDNRL3fm+ocTAWU5rkz+HR24tD+pQjGiqXNFnkR4FtBL5uRT/Nqx0bjKl8T6bV7Lgc+OmLcVzbm/BgHfM41/JI9+Mq5nObkVJJmokE8nV10chAUqJdC5hY/9sQhx1hqpk04HsEXykB0AygddLxsInuGM1eEKn3y7TBVGrKzA+y1i7/etyB5PagCDYQC14LY8xwS4X7jMPhxgsRj6IfHPvf6mMW4rZFewGIDmue2gjjtfO94UfgFVduix03HhqmKBuTxXigT5NZJ5B7pEmaD91MHMLU+lvgDa5+m0VhBm4tEZcKmRLCuOszxhv1YfI64NL6s6aotOx/jPjPDbuWR8qwQ3HytI+E7gaFt9DDrOvqWa8x9tFxvbQzBzQD8cacw7F7HT/XCFlz3BH9GuubFk+qV77mFPdO/3SdijBy3+SMeGqUQbBQu99Dto1ouLjScx4zBEGyK+EBL9dxW3ZlzofQjIxZyxwS1dJstX4+HfukW7oVtQ9rd3nGatF/EF4fAuSeW18KLur0KmRxSG9km7E+KGoQaOPa3JmVCn2Tw51AsAVnrhEl0mdB5i0ZwpHH6PVqF4VzlpLqFF+tAafIbUfBcmZeX/TdHa3CvOXApg1Bl4vYK+QusR8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(10070799003)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWtjTmVrbUtadzJxY3hsN2cva2drN2UxYkdaSCtMS3FFWk51RElVZjVDSFVE?=
 =?utf-8?B?eDIreE1tL1Q3dk1neFk1Z1ozdWxXb3pQYThFWFB1Smh3QTE2SVFMNU1GUXN0?=
 =?utf-8?B?ZnoyYm85R1NNTm8rRGhDc01peWVNbUVBbG4xbFdvSjFtWVY0NUJCeHY1UkZT?=
 =?utf-8?B?TFFNN2svNjdCazVMZ1dnTlMzZ2c2QW9yV0grdWg0RUh4OXl5SHpROWJTaDBI?=
 =?utf-8?B?Um1WZmxMZlFkSWwzVFY5b0J1ODVISzVSWndPSWNSL3lMdXNuNFQ0K1lOeWsr?=
 =?utf-8?B?U0JFNUZYeElaeGNhZnNPbk1mczJQSWp1NFRXbjBna3Q0ek9meFNCWFp5Z2lT?=
 =?utf-8?B?TS9EL09zeFNsdWlJemM5OXRlNnc3OVFyQk1HanhSY3ovanFhLzNpSHdCZDNO?=
 =?utf-8?B?aVpWeHlScFgybWNlTXhJNXlsaGVINjdUSmJVT0tjWnJHc2MzZ2h0enRUZ0E1?=
 =?utf-8?B?VlhJQW83MkYvQTFYQm5IcGZnVlVscy92Q1hzQ05DSGhwTmhSQmh4d3JTaDU3?=
 =?utf-8?B?dG4zalpmZnhmSk9ldkNoWVBTZ01mRTdHMmlndUVnNG8yQ3lGL1EwL3E0OUpp?=
 =?utf-8?B?RGN4am9zQ2tabHM3TkkyMVovdW56clpIZThtdDBJM3JJbGVReXpnZjc4OCtU?=
 =?utf-8?B?UGQ4MXRadlBxRFlpV1JCQXJHR0c2MU5DM0hWcDZHWE1ndjFpNElscTlWU2x1?=
 =?utf-8?B?QWFGRkgyQVQ0SE02WVQvQmdsL2RzTC9vUEhYYWk1aUlQRTMrNFQ1QUc0a1Iy?=
 =?utf-8?B?bGxjeHFWSEE4TFJWNjZxai9uUWNadlN5YlZmYUJIZEJRa28zR01TeFI3Tm5i?=
 =?utf-8?B?UEM5elhUTHNFeVpzYlozNFNvVTB2Z1dpNVdMSUFZd0NCNjJWSHgzVC80SnR6?=
 =?utf-8?B?ajBGMENzc3NmdDlCUTkzT0FTWFU2aWlMZWoxU3c5V1JmcEFQWmVidVJKZWVJ?=
 =?utf-8?B?N3NpNHJlY0V0MzlzYUxLUEMxOWsxK0NFdEJSMlFKWkpRRFowWmJvNW5vQ3FX?=
 =?utf-8?B?UGpneUJKMDB2NW5DR3ByR05hWWVOY1ROajUvL0FjbkV3bldhMXcrcHlqdDF5?=
 =?utf-8?B?cXlwRkNUT3hoSjV1RHFjMW05cEZLY3plRkRaZG9xRklFSkVCeWRBdm9xY2tO?=
 =?utf-8?B?WGlldzlGYmV3RmhZTmYxeW9yNktWMjlDd3R5Zyt2YVpTZ2p3U0czSjJyVlVO?=
 =?utf-8?B?QWpKVkE3bEc2aXVXWDMxcUFwdjJRMXc1dmFvTm9VQ2M0dTRydXpoT2VoN1Rk?=
 =?utf-8?B?cXR2SXpxTTF1ZWZvT3h2VVM3VWlpcFphK0VZSXZtSkluN2FIK25JaXhMd2wx?=
 =?utf-8?B?MnFBZkMvcVJ1UEVDV0hyRExjREtDTXJRdTZ0SDJDNWs5M0pCMWxEcktHZ3lp?=
 =?utf-8?B?NGpxOUhVcVpXenorZGk4RVhlQkRnQktZSHB6SlY0ZVFjd3FQY1lHUk1mVUYv?=
 =?utf-8?B?bWZyZXgyMzRCZ2VwQjlpQ1NnakhuOG1PbGV2ZGZqdEZodGgxSkxXREltWnJC?=
 =?utf-8?B?bWZFWnVzQW1PbXdMc1dQM0ZqU3B2eU5nQUgyTkcxV1c3MGpNQ2gxSjBvY1Zo?=
 =?utf-8?B?SitXR0RFdTB1MkNlc1NhdzdoVm1oWjZkc25ZNEdIbjhxYU4zZG9xeTVSOHl0?=
 =?utf-8?B?Y1hiekFSRDIyM3pPYXc3Snk0ZVFFRVJEamtvcG4zM2ozeEZCSTFkMzJxbkNj?=
 =?utf-8?B?L2h5OEk1T3RXSnFZN3Q1N0tlNy9vbEQ2cmxGcjY2aXJoeXJWU3hjNmpzOE53?=
 =?utf-8?B?cW1pZTJpN01hWm1EcTN4UWdoTFM0ZHFuVlhtTUFGRE9iOEFPZGNPT3ZZSGZI?=
 =?utf-8?B?NUZrYkdFNzVoTnBucmkyUkh1a2Z1L2JNQXVVdUNSZlh4eDlJTWt6T3BKOTQ4?=
 =?utf-8?B?OG43K01hdldRYW1MbFZKcnp3ZHZPUjV6Ull5SGJ6YmtENFJqUnJpMERCK0No?=
 =?utf-8?B?ajNBR0dNY3h5UVkwMitvRHRPSlVVajMwb1N3WjlZK25MTU1PRXcvSmtyQWhE?=
 =?utf-8?B?NVpaM3NobVFhYjdQeWlITGpKWStpdlZzbjZhaW1JbkltTXVQMm4wV0RJdmlY?=
 =?utf-8?B?bzlNS21xcjkrVDBuSXRxVWVJYUNmTFpEN0t1aDhsaWlFS0FaVXg5NmpkdzZm?=
 =?utf-8?B?T0dUZER1ZERVVWVLc056KzBoUlRDN3BHUHhkZ1hjYUpIUlF0djR5Y24xNTIz?=
 =?utf-8?B?OThadW5RQkVQaHFkQnFWaHoza1hsRFgwbUYzeEx5Z2ZuMUFpeXZCcUNRTHhV?=
 =?utf-8?B?M3pQbnJtaFgrUmJsaVpRT0hsalc0ck1TMmFHenF4eTNpM3ltYTRHY01OcXhO?=
 =?utf-8?B?cCtMOTNnb0N0OElYVk1JTVZIdjdjQ1FxLy81bjJKY2JwNUhKSjJ0QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe5e2cf-fdb3-4ff2-8dc8-08def60c5e31
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 11:50:11.4456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2CM7MbS+fQ6jKRJC/h/utT+AFKdHCAZxXBE5qbVF+JhQxSNJvDSp7rH5w3geiKU7rvPQAsq5aewOzlRGIdwrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9237

On Sat Aug 8, 2026 at 2:53 PM BST, Alice Ryhl wrote:
> On Fri, Aug 07, 2026 at 04:48:53PM +0100, Gary Guo wrote:
>> On Fri Aug 7, 2026 at 4:44 PM BST, Alice Ryhl wrote:
>> > On Fri, Aug 7, 2026 at 4:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wro=
te:
>> >>
>> >> On Fri Aug 7, 2026 at 3:22 PM BST, Alice Ryhl wrote:
>> >> >  impl<T: MiscDevice> MiscDeviceRegistration<T> {
>> >> >      /// Register a misc device.
>> >> > -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self,=
 Error> {
>> >> > +    pub fn register(
>> >> > +        opts: MiscDeviceOptions,
>> >> > +        data: impl PinInit<T::RegistrationData, Error>,
>> >>
>> >> We can just skip the `RegistrationData` and use `T`?
>> >
>> > `T` is the type of the data stored per-fd. We do not separate types
>> > for those two concepts.
>>=20
>> This is getting backwards though, and won't work when we need to introdu=
ce
>> lifetimes.
>>=20
>> Per-fd data needs to be able to reference whatever lifetime is available=
 on
>> per-reg data, so it should be assoc type of the per-reg data type. The w=
ay
>> around you current have causes `T::RegistrationData` to be able to refer=
ence
>> lifetimes on `T` which is not okay and would only work with `'static` da=
ta.
>
> Unfortunately the fds can outlive the registration, so we can't have
> such lifetimes to begin with.
>
> I know that miscdevice isn't currently built to work with the new device
> model. We should fix that, but it is out of scope for this patch. Until
> then, I think the current solution in this patch is sufficient.

For course material we should try to teach the new device model. Yes withou=
t a
proper revocation mechanism the fd data cannot have lifetimes, but we can
workaround that by having `type Data: 'static` for now.

Best,
Gary
