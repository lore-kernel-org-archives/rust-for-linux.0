Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022089.outbound.protection.outlook.com [52.101.101.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22813ACEE9
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 14:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772115374; cv=fail; b=chBoxytOlJMjBFdHjtGXn12esiKtSprwsrmWGKjb7kj05ikrjhruu/KAxUIbMWJWBtONikRbz6WoJUPX+cS4Htku5v9frAjFerxVqAvFPi3bW0e0OkfyLZO6a2MYxTYKBWMRw6JrUDIzWe18Yly82ZHpdVdFlk1+DWJvXUJhscI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772115374; c=relaxed/simple;
	bh=JZ80RSCFIP9vdI5CVbdqNMrwMPtrXtUzZjTkvyFZQ6U=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Cvjybp6vUPWloM4iQCLNDvUg0EunP9ou7ViNEKk472ATRZ9/WSKlsBSCFUOrrJr1utd+4SBW0uplasMgSKkV7S1BFWweZBB69KtNY9jLnq2lg9sfAHcW+4ogfGzqCRmYroitM80hWH5qracdT1MNVu2jrkpcCwlRe3uVz/0226A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=KjZoCcnB; arc=fail smtp.client-ip=52.101.101.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="KjZoCcnB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD4xhb1m1nboOlOs7hZM1Ytz4psFQ8QBOypEo9dNzlWZ1hp+KRe0NY675v3XeTWYHzIELwhNd4LiFuOfGsLjlHXRORXKHGz2ntgIpo3G/QJtsT+1iNoZF1d1ohcrsemzZOS+o8NLzl2vMfURUqjwdo/5rpE04Jz4wgO7yZm56Nya2PZUUVLjvE3gL5VTssNROaaCSqCe/8Zg+0nc0VCp9jnGnb0mLuBoSFBoP4MG682pe9yZ2qq0cwSwZbhvVCSUQl7vchfpCcgS5yevdD+3ET/QqhEq2LfbOqRbDkI0MD9NUshQylDsUMJt83WolSroW/RnsjKXNlHj3WxQHqHBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0FfA9iWRJk7jQR/UZQD9abYi5nGxx/QIAytQmVBxPA=;
 b=O/H4+JOwjGRD1BgcDPlRKXrBAYchvB4AagmixRCo0Xgbwj+My2d1iRgGSCGHpoLH6VuOpJblCv1bFRPNfRz1QVceN/DUr7OII4IWg0POHTpo4F7FctMO5ZZnHSsENgiPg8poRuW7Q5vE5jbwUzSTX8plG1VpzZcWD8hy52a6mMLwj7htzEk5uLLtt3O6FBWQyUmGuvUpVdGalaanEegreYJs6mX2XzWXEyS4TYWAALlEyplB6v6PfHSZkVniQePQVpEgax/KxAE7UwOSiDCEIVTaD/Qe4ETaCIe58WJVv6lwvYMKxk9Cl8VzEf61BgMemU2SrPeFfYHNFoVs5yBT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0FfA9iWRJk7jQR/UZQD9abYi5nGxx/QIAytQmVBxPA=;
 b=KjZoCcnBkse1iB3n8hBn4W/wca7IjUTkufD4xb8yWLC5w+C3aUbyNN9sho8j7GjBzYzAHYp2Tc90Wneh3R6QKz3vNG++0xngCFaAs+tPmQQ7GyvDnxMT2aZ3bKr0tL7/Awnrs9/RYXDLHp9A13FPxSDLisUXPlWekoO+ICv8Wzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2687.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 14:16:09 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 14:16:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 14:16:08 +0000
Message-Id: <DGOYGXQ1JWJ2.7F00MTVQPUKA@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "FUJITA Tomonori"
 <tomo@aliasing.net>, <gary@garyguo.net>
Cc: <ojeda@kernel.org>, <dirk.behme@de.bosch.com>, <aliceryhl@google.com>,
 <anna-maria@linutronix.de>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <frederic@kernel.org>, <jstultz@google.com>,
 <lossin@kernel.org>, <lyude@redhat.com>, <sboyd@kernel.org>,
 <tglx@kernel.org>, <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2] rust: hrtimer: Restrict expires() to safe contexts
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260226.215052.2040587083248816676.fujita@bee>
 <1772111941.36504110-faee-4088-a465-c0faad81a43b@kernel.org>
In-Reply-To: <1772111941.36504110-faee-4088-a465-c0faad81a43b@kernel.org>
X-ClientProxiedBy: LO4P123CA0611.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2687:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9180c8-018b-4a47-560a-08de754196ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	GNWw+PrQjG7+ONlGfWsDH+O3JcP03NZ5xlLLm0ntMegkOGkUVbJ1iJyv2Olfvvk92kxxcCbpyIO5nDdwW4Mh2TQwW1SAmKwlcch1ODIUyscGoVUojnzCr9+xmDVOhIC7ixyKo/KjTGi2/h3EJiEaaHFlzEixYYHp1hEzCzyET+SE0Tl7eeHEZK3vZvKza9QP65WDgursG7cmwl/z/jMWSGzUx6wRDwgCQ1qtROjSWd/tX+xTXdaUUCrmWD6QcVNM1iqWW9u1/H34EdR3VmBSya2Gxsy50Y20wI5XjllXH2R94n7V7SpVfacj3/pUUyvRF3sDx2Yg+xUsNJPbssM19Q28oeic/hVCPr9EgDJhro+0mdLHKqlCwpfVC7vCFko2Kaw129nLE+AosLLtljxyy9m8lGFAaLbTye1Lh2/yOyr1K7EjaRLzo3cnAeu5GQm4gbFIM9tKBSx/Iju1t6dYLu+dBmOiitJVctIogr4eELADA4JUgf+kx1JlIIFUjWNWd5H7Qx+CTyrwp/9oDyOWGQkaQm5kFmDVJP2eoG2aWUezy9s/WGG2EJtkwUTeoOD+r5Bmpds2cyvrDYjPOoQCQMmWM01UZRUlt+liI7+Bbiesclb2xeoQHq6VqRzriCVyQDkSXDf5DlXAQ1iTNiG4QlQzhv7ORMCB6bxU1x7WP5enTQ8IdVbkQK877zInhVPnf+OU5fExGXUrtva3G9SpRdLrMUgk1+972hJIg4i0HVc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm52emNuU1FKeWd3b216bzh4SVZiMjlTdjJibTBCRU5VNVFocFJLT05GTVBr?=
 =?utf-8?B?WlhxTC9LY1VFSXhlK1NSTlNGNy93NGZqdmI0bk1Ja1F5cTM1cHU3VW00cWNz?=
 =?utf-8?B?b0RtNnJYUDdndVA1ZTNvNVpPUk0rdnR2QytlNkRRQkxpYnVOWGczTy9qRFpx?=
 =?utf-8?B?NDhLcWVBK2dOb1ZwalJGbnpBditqVFQydG1zb2FiU2ZpZjhtcm9mNEVHd0xj?=
 =?utf-8?B?Z0V4N3JscmdWTG1mQnE4ZFJDOFpyT2dtUVRJMTlyYmkxZTIvbzVMZXh2bVYy?=
 =?utf-8?B?alRGV3ZDK1Z0Mlk2SmpROGhZYUptbkdCWll5ZzhpbFE5M2FtckVXL2VDM01l?=
 =?utf-8?B?TXZTcS9KRG5CYVdURm1TQUptWjZDQVE3U0RBZ2ZRYXUrcll6Z3NXMEpmNXVN?=
 =?utf-8?B?aWpxcFBoSXU0ZmQ0RVFNTVhFTmU1U0pYOC9qbEJnWUFKT21UYThFS1hjZkgy?=
 =?utf-8?B?N3ZvaWxrUmFTK1ExQ2wwSnlNNHk4Y2NRRm1McFgyb0k1MTNSTkNmVTlMVmZv?=
 =?utf-8?B?Q1l1UjVZbVdqcnZzZURja1orS3VFb3h4MlQwTGVjaGNMUHBQZmxGOUZ0U2RP?=
 =?utf-8?B?aG1wK05iZFFjbHE3Tzk5ZjI3MkU5MjJrYVlkOEs1dWdQNFhPblZqR1VhWC9v?=
 =?utf-8?B?QkswdTl0YTU1alNqb3d5dXRCUHA1ZWZhZzVMRjNGeVh0a1YrRnFZd3IydzlK?=
 =?utf-8?B?eWtYZVZmenp6N3ZXSm52ZFNzUkh6VlFEcUwrQXlNQWhMMVlwbW1pQ2d2MCty?=
 =?utf-8?B?ZFNwWnQzeWZtT2crT0FUM2E0NllFVkJNWXJBN2VDZkJrbGpXd1lCMXA3aGlX?=
 =?utf-8?B?b0xhdEw3UzU4dzlOUjdPOUc5NXU3Mytja1g3alNVaTVUbmJ2K2pDSzJiMjlj?=
 =?utf-8?B?WW9rbUdZVStJYXJ2MEp3K2lTYnIvYVNnY3Y0SW9ncHhGbzlmRGNVSVBnWGZ1?=
 =?utf-8?B?VmMybHVLa0RJb1JwSmpDYWxYVHNKOEZJL1JQNEV5MlFJem1TZitqa0NDeklF?=
 =?utf-8?B?dEF6Z081OVlnS2tWTDIrR09EYWg4RGhLOUdQN0kxSUhlOC9XZ1Vidlg1ZWpu?=
 =?utf-8?B?Y2tBT003eHdWVU52bVFVSlNEY2djb1RUTWd5SDFDZHJwdC9JUTJrMnQvZHY1?=
 =?utf-8?B?SHB1NE5QVFhTZmhJU3N0cTQ2QnhKRHcxTXg4RGRHc3FHbkhFM1ZMQm1CdFFI?=
 =?utf-8?B?dlZybHZCNzBiUnROVDNZdXI1M25BQ08wWktqb3VUWmRhUGVJOWU4RHhPQ3VF?=
 =?utf-8?B?cThRWDdvUlVaK0c4a0pDeDJHTEZWR2xocE5jUHV2Z21wNjhBeTEzN1NNR1NF?=
 =?utf-8?B?TjFFUzlBR1JBa2dWZ2wxTXhWNzYwdU9mU2NlRzZBaDZjSkIxZUEvZnZvOGh1?=
 =?utf-8?B?a1ZFRW53SVh3c2hES3BhRWcyNzd1YmkrUk5IUGs3MGJxaTVzNzAzMkg0L1VC?=
 =?utf-8?B?YjlTYlY4bHVVcDRhOUlkeUZUZnVvMlNPWHBFajBTdHdKaEhOdDVWUnQ2YVdJ?=
 =?utf-8?B?d1ZRaU02SHBCckkrL0NwOUllYjdLMlNZRE40dmVUbjBrOUQxS2lkQW41RzJn?=
 =?utf-8?B?aEQ1djFBOWwwblBoSDMvTE5JRmZReGVMM1hhUXRLZlovQ3AyVXE4Ym9BMTBC?=
 =?utf-8?B?N2dIY3R3UGNqOG9XYytyYUtYbTQ2V1VMKy82STI3clAyWkJPZ09xdjQ3MGJR?=
 =?utf-8?B?b0JIY3FVWUErVFNaR2tVNmJYeHpod0k5V0hSZCs4T05kZXRyVkIxNjA4OFdp?=
 =?utf-8?B?QWgxOTNZOEVEKzZEazlnazM1YnZWTS9wMDRadjJOdE5la0NpR0k2MnBnYmJv?=
 =?utf-8?B?T2o0SkZ1L3RnbTg2QWxxMnI1QXRpa0M3aUlxMkxaaCtSeHRrclJEN1o5UWF4?=
 =?utf-8?B?dWppbWhoSkcxcDlFb2swSFptQUd1TG1GQmludjhpdGNSSDE3V0JBNSsreHhW?=
 =?utf-8?B?N0FGK1hUaFdYTmdkbi9QY2ROMWtueCtHYjJOcXExVlpCQ0hwQlRjSFgrM2lu?=
 =?utf-8?B?OThiT0huTlRUN1h2Tm9mUGZ2dzhJV2JCV1dRMWhYYU96c1pDTi9NZEpvUkVh?=
 =?utf-8?B?ODAxWXpMTVcwYjIzeVQ5aitJb2NockczNTVRYWhQcjRVaEtzK2ZBdld6MHJu?=
 =?utf-8?B?cXFVcVlSamxCUHNBWUsvVk9veDRWdTdBRnhqNXFnRWdPZnNQYVlrdS9VMzF1?=
 =?utf-8?B?dnhpNWhheW15ZUJzNHRQS2N2RzZ0eFJCbUdRdk1UTUsyaEo2eUQwUFhqZy8y?=
 =?utf-8?B?MXFSa3NsZERhWjlJQVRJL1hKREVjZEtDN05tMGVRenFWL2QzU2pVV1hRU2lB?=
 =?utf-8?B?YUZWeHhBa045cFlRN01BcEdIcFVHdUdPWC9KTWo4U3FPVkJhakNhdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9180c8-018b-4a47-560a-08de754196ac
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 14:16:09.5146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYl+xlAg9h2RVXNeH54iQicjdc0wfMgWVaf8saX/1X3uWlGWIFwWyP1ciAX49ftUsB8dlzFPgzBGR0yenf09rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2687

On Thu Feb 26, 2026 at 1:19 PM GMT, Andreas Hindborg wrote:
> FUJITA Tomonori <tomo@aliasing.net> writes:
>
>> On Thu, 26 Feb 2026 11:42:39 +0000
>> "Gary Guo" <gary@garyguo.net> wrote:
>>=20
>> >> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.r=
s
>> >> index 856d2d929a00..78e2343fd016 100644
>> >> --- a/rust/kernel/time/hrtimer.rs
>> >> +++ b/rust/kernel/time/hrtimer.rs
>> >> @@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, interv=
al: Delta) -> u64
>> >>          self.forward(HrTimerInstant::<T>::now(), interval)
>> >>      }
>> >> =20
>> >> +    /// Return the time expiry for this [`HrTimer`].
>> >> +    ///
>> >> +    /// # Safety
>> >> +    ///
>> >> +    /// - `self_ptr` must point to a valid `Self`.
>> >> +    /// - The caller must either have exclusive access to the data p=
ointed to by `self_ptr`, or be
>> >> +    ///   within the context of the timer callback.
>> >> +    #[inline]
>> >> +    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant<T=
>
>> >=20
>> > I guess the signature of this can also be
>> >=20
>> > `unsafe fn raw_expires(&self) -> HrTimerInstant<T>`? Then you can remo=
ve the
>> > first safety requirement.
>>=20
>> Thanks, I've updated the signature to use &self.
>>=20
>> Andreas, this breaks the consistency with raw_forward. Is this
>> acceptable?
>
> If we do this, we get to argue that the NonNull we have in the callback c=
ontext
> is convertible to a reference. Either way is fine with me.
>
> If you change this to a reference, then I think we should rename the func=
tion to
> `expires_unchecked`. The `raw` usually refers to operations on pointers r=
ather
> than references.

Does it make sense to simply have `HrTimerCallback<'a, T: ...>(&'a HrTimer<=
T>)`?

Best,
Gary

>
> Best regards,
> Andreas

