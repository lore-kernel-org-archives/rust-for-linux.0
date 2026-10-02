Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021117.outbound.protection.outlook.com [52.101.100.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5103B3C19;
	Fri,  2 Oct 2026 20:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973471; cv=fail; b=r5q5uGbPMPJ4GkyVXKdCQESk42NBUTPia9TVR/xQWoN418bI8XlhSa0j+Sgjf5Yu1ww1b9mjUvsdu7JoyYDxUdqj9Kl0jHa+d1uD/xM9xSx2l0+9WiOJ0UnBPC6lqMWbo+w7TxA/FKtZuCRhvZ+lT9MLhNP5SIAZFaI66MlYKAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973471; c=relaxed/simple;
	bh=1hnA71UOoTcnRyHAX7pUIb4INlDuT07NmVj+rn8X/Yc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qrIMdHGkS0BruEjnqpvBwOBj/mLjeaS2Oz8V+worqsPTvim/PIwXbU/eMu9vJeZ9YIy7mVfrhxXlo7gEzNLEqn0JYmAjnWJJbqIaw6a+fjYXRoawYif3F4YOpKqEFWjwY5PMEyCTvNo3OfgoGgrGXfG6BPE5fi2QL94IOvszqb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=AOD1ywpf; arc=fail smtp.client-ip=52.101.100.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="AOD1ywpf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAPxwGXuHq2X0ONZ6wdeg35RSPB2cJuE4izLNBJNXR2UM/hJ7jTalsiHIOj1u9Dz69VB8PuUvYSO42uUYSRzJthpGVw24uEVHTs6ftj3PNXbFNLV1HWz/2xAXz0OWyPkCH+h+c+9np6r01tnyVt9uaCmhhlB5W62UbA670CpocCnQp/5gauvyLIRyT1AYkSyQxNTSh55B/dNbaf8gEOfDWtvDOmaT2bFolw2BPvcoWDf1RUe8TaotQH5m1kY2x2q0Httgc4peg90neZQrkVskup7KjKw3cGf7IaYAaDzpzGov3qSFXIbkLyENF9kiBium4OTJfErweQuZYg4WaloKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjTuK18ejRmBvqjVuafASSrqMm/pWl4udA+xXYifxtQ=;
 b=uLpJv+1b2dPVAUX/mYa6b2R4PdMWys583XgiQwP4QxofBQSoDeNZrWuiyXeWr3Qp1rmPhAg1gITt7gUhisVZJrj3w+VjtuS3NCpB7OTveG26Wrt4p53O7IToy3jNMKGBJLNV5aOpM9qNBxnDNv1sPeD8IFaBjS5iJxkwJ6JYo9NSDMod6OL9m/fwG7Tp7XuZBrTkklr9EGqwjuO8fxrmvBx0JnpypenB8oE0ootBI8uv7FAC9kyb0thEWRNa9dG7OH6Pxz+X6NjpE/LoYC/oVfK/4/+51oBsvMb7uLsSLzSepcSod60GmeY/1HLuvIFeH30TyciklWINXN5+N9LFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjTuK18ejRmBvqjVuafASSrqMm/pWl4udA+xXYifxtQ=;
 b=AOD1ywpfjtIjt0evL5UpCnZ+PbkOO9rP8MAegFqdTTXCm3jBpCVxeTH8ibOKnJnXdPe8aDW52zDzM4yazOSaKqPkXO5ToHWFcqdvXI+x/ef+H5Lond1LcQmV8LWJKEsjDoP82CL7qeOMNDQnCpPVS9FR+L/ikiX+4yiIT+KG2ZI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB2651.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:148::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 20:37:45 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 20:37:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 21:37:44 +0100
Message-Id: <DLUN3V3VNRZC.1PML6OCVBP2TN@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Arnd Bergmann" <arnd@arndb.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] rust: macros: vtable: add `#[optional]` attribute
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net>
 <CANiq72neqitKHftQ9UVJaKLkcUdX8uAWLtoE08-G784mqX+H9w@mail.gmail.com>
In-Reply-To: <CANiq72neqitKHftQ9UVJaKLkcUdX8uAWLtoE08-G784mqX+H9w@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::21) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB2651:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c7bb25-dd81-4c32-3974-08df20c50355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|10070799003|1800799024|366016|4143699003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	aRto9khppb9agvexqswxtItegQwR87Wv8/koAvSjYuAZWYyYAJOS+l4GbzZZy1hPOnk828KWaovMz9RjFVmkWWLXvsnbhyiC7oMzg0pTVa9TfwRZtCMReAEXY7LnVQ9H/llL6tymH48ENvugLejSwh/QsDAgh23JtHyTeQmwuHtAYLsLgudkWJLyxporaApg+0RVNQNtQMYSBO0Z0QvMvx+CsEROUFLS/F9SpYtRiPEel3Hfxkiu4ZM/C1TzVs0RpOXnW0K0ZusehusJZZtjKGJ8z7ZOvxu4AMXjqHwFOc4t6dCgs2cuc7369wJMm1zOPsMogkhX514EQ9VFUOj8ItNgd2x4ZOsj6fX5k56Vkj+5IPaD4dO5F8shMxtQ3mxYYRei6rbUP3XKKhib3HB4hojagP6scRgWUCL7o1GYzIBYfIY9jr/ce0+2WwySqSEIHF60zDtlSXlJvOeRzgsTxWsuJYTFnsiizZiRzVutRYTB3zXWQJGt3jPGYVJ6GRiXA3+dpES5nkzi/TCRdhz3kPdVob1Z5eWRqmmd1O1Ik6M0lP6L2D09VxSXF/xDvuSJAhSFIwIFBtzbeZbjZki6zVuMmLNLJ6nujbwFMLvbUWMZuXh0Mh1Bj/R4Rd/InUaFc1g1Br+i3SpCsKwNpqvar+hvqIfTl/W3+rysbRcnOyA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(10070799003)(1800799024)(366016)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEFhY0Z0T2tIVWV1YVVyWmo4RFhOaFFNUVcza2pzalE2cjd2SXdjejBPbTE1?=
 =?utf-8?B?WmZKM2RxMnIwRmxxNTFNU1VVWXpXazJlaFV4WlRGWDV6OEpMcHNBZHZHRXZM?=
 =?utf-8?B?OFgxcDNZblI0QXdWQjBDSEdwb013OWxOMFptallBa0RWeVB2UmdIcEVScEd3?=
 =?utf-8?B?akFvSSsrOU1HbXY5NE1YVVZrOThUWmZ5N21jSnlaeGhSRHdIUmRvSVJIRlQ1?=
 =?utf-8?B?QTBQU08xS0JDQnhLUk1uVVFaKzA0dytXN3MvS0RuMEhEOGpxZ21CNkw5WWhD?=
 =?utf-8?B?ai93SDhmUFdpVWlGdzcyVE1uY2lTT2crS1NFSlR2NXova0N4OXJTZC9xUnEy?=
 =?utf-8?B?ZVlpMzNoT2RWQmQ0SFl0dmVGVHh5NktISVl6aHg0Q1M2bm01RmVzb0diQ2Jl?=
 =?utf-8?B?ZkhuSHU1bm1jR2l3eU9mZWNYN244ZTdLK3dmaThHL1FEUmxvZTZjdGxSQWhr?=
 =?utf-8?B?QnZFWFc5SGJaVUJjd0xYSHhXYjV0RzVZY0diZE9KM3hwcWRXNkJ6OTJUb0tQ?=
 =?utf-8?B?dnZ2WVFucWIzMGFzK0Y5ZEJNZjRWSXYzU20rNGR5WTFkVkd2ZjZpcHJYNm5G?=
 =?utf-8?B?SHRpNDVvdzJrRzJrd1g1eEkyTjBlSkdiQkpTS0d2SzZGa0dneE44YlYvbEpy?=
 =?utf-8?B?ZlpLdnZqRFVITzdBSzcwUXB0RzVSamhQT1REV1YxY0UrUmtXdTUxZmZEWVgw?=
 =?utf-8?B?aElPbjZseS96ekkzeGpabXNwbGlIZDZhMlpERHNoeXV0ZXRyK3MySDh6eG1l?=
 =?utf-8?B?QjZNTzYvQkdjWDduSnM5TS9veUpDTkVpQi9NUHFDdVVGdSs5MzdQaUhTcU0y?=
 =?utf-8?B?QW1MQ3JGY24vNkNvTjNFWlhZWE0rR29uSzkzdFUrdkc3Q3pNSWpmWFl1NWEz?=
 =?utf-8?B?NWxVSXpLVmVoQTlxeW1peWxBSlNUcjhrWmtSWW9sTWxPaThrMjI5cE1aNWxl?=
 =?utf-8?B?U1hTbFcwbGJUelQzWHNwdWFEdFdQQzR5VVlUVEQ5QW9QL3FQQUJWT05qVTJX?=
 =?utf-8?B?RnJjQVpFSzFiamNmRzVTaDRkbjBkUE02TnRaRWVGOUxjQU84WnVOdlBQV0pN?=
 =?utf-8?B?VVBsZktXN0l4aDhLR0N5Q1FVVUVkeG1GTDdPTGRZT3ZIYXpSRm1xb2ZmNS90?=
 =?utf-8?B?b3d1b1doMUwydXpEUTJLb25XT0ZpY29XNmpzejhLU0R6S0M1aG0xcVdMM0Qy?=
 =?utf-8?B?ZmFqQk5aN2lGdjUrTjk2dllONzI4czZha2tDd0owZ2tYOXU3YXRPaXA5dFhC?=
 =?utf-8?B?M1dKV0RWSS9zRVAzREl3cHF1aHRBc2kyekZubzZnTC96N2h4cCtvL1pSKzRY?=
 =?utf-8?B?R2dBZG1qSzExL1E4VEFlS1RuejA0OEZ2eTRPZ3ZzUUJPNnZoZFYyci9lalNI?=
 =?utf-8?B?ZlIvNEtaT0JyVVRUb2k3MkQ2alk1TlN5eUd0SDFWVndYZkJvaFVzdFlyNmE4?=
 =?utf-8?B?bENxajJiSk1OMnAxbzBkSlBZYlBsTncxcUVoV3lQTzlNMEJqU0pNbStRRTI2?=
 =?utf-8?B?enFHbW15d1dFaWd5dmdQS0ZUZ1V1SWd5YWJKMWNEaEZBV3VSWU81VWxHY0Jh?=
 =?utf-8?B?Qnc0eFczeWVmckNYTHdGTnMxbzBSRnRtOGI2UmFaTFhoK29yWkVQOEVlRU9F?=
 =?utf-8?B?UjdXUWV4WWRMdTZlN25ZV2NzUFVOY0oxV3luWk5CbGhXSkdhSm13Ty9CNFhq?=
 =?utf-8?B?QXVGeGtSbXZiRlc0WHo0TFlFT3JMd2tQaEFyY0ZHK0pKRE1OVnlncnViYm5W?=
 =?utf-8?B?Uk9RL2JWRENnTkhqS1ZTcUd3bXRGLzZKV0xlUHNCdnhtaHpZZDBEb0F3R1da?=
 =?utf-8?B?YmlIZDdUNXVOblBYRE05Y3czcWUzWDc3K1pwYjJEVGYyajRqamVtNEszSzVy?=
 =?utf-8?B?aVpWOVpIdFVuM1dZdjRwQTBnUGg0ZDhhQS8xeGZZSlAvZldiNzF4YVpNWjMy?=
 =?utf-8?B?NUQrK1ZmcWRhblRqZko2ZGpXVmQ4aGc0VURzeHNHRWw3dm1YOFdHOVB5cjJM?=
 =?utf-8?B?MTd6N3hpRTA0Yk1SZ284Z1FidnVHb2s3NnBISitMa1drd0RyOExscUI3VU1W?=
 =?utf-8?B?THZqNjlTVnY4TGs0UzRDUTdFV1VuK056Z1Z5Zzc0T1hySTBwVzhCc2Z4Umdt?=
 =?utf-8?B?d0F4RVdSYlB2V0graVRqVnU2TFVPR1hDS1ptenRWSURndGd4bmVtODJsRlJB?=
 =?utf-8?B?VVZtV3pNSitOUGNZL0N4Nk5iV3VkUkQ5TDIzc2M3VzJZNnNLV29wN0JzNVRD?=
 =?utf-8?B?ZzFyUVppKzZid2VKRUpzSkt6Z2JhQ29jbXlzZXd3S294aDVtMXRwWUxiZzNT?=
 =?utf-8?B?UHJUdHJYN3hPR2x4MTVzLzhSTGF6dXdNTGRkUHhrQy9SWHRVM21PQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c7bb25-dd81-4c32-3974-08df20c50355
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 20:37:44.7586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vAFDFCbISFRqEGWUPT+FBqtj/UnqIFROi9AkMptzJJMk6cJmu6FEpWmg86x3Djf4fCsDTqosSIkdWAZqouiDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2651

On Fri Oct 2, 2026 at 8:10 PM BST, Miguel Ojeda wrote:
> On Tue, Aug 11, 2026 at 3:56=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
>>
>> Currently there are a lot of boilerplate with the
>> `build_error!(VTABLE_DEFAULT_ERROR)` because Rust want a default
>> implementation but we insert `NULL` into C vtable and never call the
>> Rust-side method if it is not overridden.
>>
>> Add an `#[optional]` attribute that injects the same default
>> implementation to avoid duplicating this everywhere. As an example, the
>> misc device vtable trait is converted.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Applied to `rust-next` -- thanks everyone!
>
>     [ Reworded for typo. - Miguel ]
>
>     [ Rewrapped docs. Reworded message, comment and error for typos. Reba=
sed.
>         - Miguel ]
>
>     [ Reworded title for prefix. - Miguel ]
>
> I was tempted to replace the hardcoded message with the
> `VTABLE_DEFAULT_ERROR` constant, but I assume you did it so that we
> can just remove the constant later when everyone is migrated.

Correct.

>
> By the way, did you consider allowing `unused_variables`? It could be
> nice to not have to use `_` in the signatures.

I didn't because existing users are all _ prefixed already. But it does mak=
e
sense to add that to avoid having to prefix them, just like mandatory metho=
ds.

Best,
Gary

