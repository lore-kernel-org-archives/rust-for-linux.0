Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1799D368940;
	Sat, 28 Feb 2026 05:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772256726; cv=fail; b=l+HvfpCsStHD2ggPbs+t4sTG6fHPMr9FilDpeOwmuu2rg3hwhnrEPXAfW1+JUbR6xq7/d/V6dneDvHPYrFmPDBoJeLNNWon3o7m2ddSwWyu3WmsivjiE3ZAaWXXIFAvRXv/8UDew+1BlDRIfDjjBXQm3v62c2BHEF7BjJ+D/H0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772256726; c=relaxed/simple;
	bh=YCKt9SSnITMR9//HnHFeZnMYh0vz93VOzn17GYLSezE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=u+IusRoVbkFPTfw54jR/EJtzRn0IuuJpkYLn51G6BwCR2pd5NHcVd5UfCVvMxjbC5YD28jy96Dj0UqOBzg1SNiqpl7tnEEe5X7r2/Ak5i0hZvWHB4rf5577fgscHXqOIlzuwWJiJUqSZRJU9s9uON8CycVYtWEgNI0WeW20geZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AURA3Vcv; arc=fail smtp.client-ip=40.107.208.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AURA3Vcv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoP6uSv/b33Lb6+AGa2DWzHx3I3ZGla+Czr6B/MBSKq+r6R2obf7l5zLZ6tpl2j8/CfGWQf5vcKd8/u9lU+GaKXlxtK0We0NRzVKr7srTeuiWeS4Hvz5WAex+22mzRVYhBX+V9PjLB+5DX+2zYNNGHtTTJOviES7jCRXMZmHpXk6veweWEynBnDCRE1X6DWKtp3M13S+/Ba0J68kNQECMGW9LLV2r6hbmDIDCyj/Nb4LaGEgTTvkj0hGjY2JGYHjqS5F/bYBpnZkaA18U7Gsf6NCB4zpuCKY2Q0dZwkE0SSW7+RUo8jzCvHFnADqbfqFdRT/q3e0X+kwB5E0TAS0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLAJ9K1YEBjTda8xxQN2WIAkSn06wmy+uqVyKm4kits=;
 b=mXkx8WUWvqhCe5b8ibWJZj7Na10eMwkb6AlDSHZQN2i/fovCsSyz19l3eQytkAxNWzqPdXnOIe6fWd4E9wc6ph9UeW8x6DgrhDmZnOkM96pT03OePzrZqN6k2bT1px4yVTOeCdQr6NjfLKfoCI7j0d0PisyEfXNUNfFH8i5j9nFmwgi1FrY2skSvSUZqmBLnuyY/GAzucSgiPlcyubQ0M0HHwOWAMmLlQMcw+iZldYBtrrqlAN7ubs5pEHewHyBxkd1VAvNcht/5bklUhyOONgtovccqtsHfbeBd3XEsifBXjenGe6mjWmOFW/aQRHgn070uf0ILg5GLcE0y03ituQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLAJ9K1YEBjTda8xxQN2WIAkSn06wmy+uqVyKm4kits=;
 b=AURA3VcvxUDa4WYCjXWDJvWVzAOCmMa42Q+EEFwuB7n2/3ogpmdU1hibqE6eT8aqvz2MDeeNY3e+y+BNaUhWlH1Ij3PYiHphv6VIuF3qYw2QlDPppxOGZddvMszRSXPQq5DbiedCc6/s/2JPRbFDavtAY9TnMYs+dDemAtrWq/DtYo8s/lerSzKsjqfHsMPkLK1yJ4hWYxAqmApehm8yhjA9pciS1aibq3mJ8P4fEWF3Ub+Pp+CBqw1hsKeXklJ3PJ46m+Bdm7xfYICGp2FWyksLEne/UmvPRAKWeBpK/52a/flWgpxXs4MWTqyezLxXQxFfUon6XFlKV870ojaWjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9195.namprd12.prod.outlook.com (2603:10b6:610:1a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 05:31:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 05:31:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 14:31:51 +0900
Message-Id: <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>
Cc: <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Jesung Yang via B4 Relay" <devnull+y.j3ms.n.gmail.com@kernel.org>
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
In-Reply-To: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
X-ClientProxiedBy: TYCP286CA0075.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: 01fcfece-1459-467f-686b-08de768ab08a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	oaHO7PNG255Pe04MnwgMUrd/BmKWGJsbrLfNSqKnlGyeakQvlXrfLoqBgg36PZQP/rZq+5vPZIa7v31e7MjUhQfAruDniufyvTszrHG8Q5TR+cNvCBgZDIVRBNXosH1Zgh3pnPjDsw3t0VU0SOyKTzfduxYcIJ+gIhdzxGEHJgeTInYN/66gVSLowCBWxnfgOp7jIr7j13d3VNh075eoQJd0uE34aKcgfJiHRvKpuIcwYqDCgU0k7H3mWSBxbhm/QHoTjjqekwP4AYEngInVPfJVU/HPIF9T5WrgxWDwBk13tB+VDa5O2jDKiFgQmXdmIeZmernBQYO4ucPTI+6CvUhTL3kICIuJovO21AMODCXma7tqaUluacwJFGqZNGWSU5BxQsblqATWwfYrYgqRyp9l7FfJ3ydh3g9mdcmsPF/7R8vhT0V/lO2YB8mJZW02hodgr2I1ohfB+VHEfbSjYYCPz0vuidCKtyGH3QTcfztV2c0osNJcRuFa+BfKI4whHkFs2Lk9gDvukpORPuAMAkC/2rMA0yIQZggvxXdAcyJTBVUrJt5rrO76nQpWAVPXfQbha6GAcanlWVaOth5fnUOpUpoXZE7bMse/niq/Y5Q3LatcmAIIjZKmF4Vq/na4AkJOTN5TykKErSBgr/VWvvvPZubh4+VPmUE6ruyBEoJ4hK3yfwBGv38DEre0T2rOhol2y2ML8iQZqtpacesU0CbTeaYbeGreAf/mO3vKmp8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzlheHM3K1ZDbU5kRWtRMlYzNmQyZ21tVkVNVmZYY1NGRUZIQzB1UEh0c2s0?=
 =?utf-8?B?c2VPdlVpOUpZcTc5MldNZGhjZ2NlTDhjVHNHOHJxOStIOEhyeFJWUEtXVXg3?=
 =?utf-8?B?NkUyOUQ0bnFJR0dYaVdsQ0JYWTRGY2NnNHdDZnR5N0tWaDNCanZVQmgrZ2s2?=
 =?utf-8?B?QWlicHZzQ0REU2QxejBaVFhMRXc5NUJDQXZYL0xxRWgrYTNZazhiWk5Zeld5?=
 =?utf-8?B?eUJ2TjhQcVlaYlZqOXlpa3hEYVhPalMxaVFzZHE3NTZLZHVDdUcwc3p6NkVL?=
 =?utf-8?B?VEFhaFRnM3ZFWUxSbmwxTmNQT0U3TTVHZWRkL3VNcUxpTHgzdG5ZVlh2VFBK?=
 =?utf-8?B?cFRRZVFiU2l5Tis3enhJQTM2WHBRR3FtTWhxSWFpeXRqdXdOZFFkOGdkSUdX?=
 =?utf-8?B?eUt6K2VjRDVjc1hnY0ltdlFpYkRzYkh3OU1iWjdyU2RISmJCK1lqaFNKbW9y?=
 =?utf-8?B?N28xdU5zMlpGWHdITWxsNzJVSWgyZ0JWUVN1NjRLZzN5ZGRGdW5BODFTT3Bl?=
 =?utf-8?B?RXgrRUxEeTVxMlFaZTIveXBkK0RvNVdvcXArWExrRXFFVVhLNGlsTXFsNWpn?=
 =?utf-8?B?UndtS0JBVTBFZ21zOGE4QXo5Y21DMkdxbXVnOVJVcmtuRkQvWGcyeUJ0V1o4?=
 =?utf-8?B?dVMyVW1xTSt2Z2V1WWpDblFpckVSMjU3c1RGQVdlc1lSVGpUajFYMEpQRUoy?=
 =?utf-8?B?Ukl3M1l1VkdNYWRJSlY4MTl3b1dnY3gvQW5Vc1ZLUE1VZ1pWeDF5WHVwUjR0?=
 =?utf-8?B?WUZ3dTNLKzhMQk1rUVFmM0dhRU9UTHBJR0hBaEFIVkdVeFhHMzlVTFgrNlpX?=
 =?utf-8?B?SjB6YnRHL0hDcVNicS9EYVBUMnIyM1VWa2phN1pIT004SjRIVWNOS3F0S0VD?=
 =?utf-8?B?bWVuSkxmeit3bmZmWmNWOHRadjB2a1dzYVZqWitqUHFNT0VkZmRBbkVaLzBv?=
 =?utf-8?B?VVRFUDV4L2VXUDBmY0JOY3MvTklTNGdhUkxPSDZqYjB5MUFqWFl6Y0tnQy8r?=
 =?utf-8?B?UDg5VlJPK3VFM3M5N2dCMk12dnlEdVplNW5Wajd3REpiVmtyQXk5cERjZ3Ju?=
 =?utf-8?B?TWhZV0FoZXM3WkwycGpGTWloZTFiNHdFSmIwcU1KOXhNa3ZnelRmYmVoRmV3?=
 =?utf-8?B?aU9LclJrU2Jya0hjb2l3TzQxeWxXL2NKdmZTd1I4Y0pIazZ0YVNOYm9LQ0Zu?=
 =?utf-8?B?SUVnTTVWalh0VlBpTW1rdzRkNk8ybjBhdkM2QTR2MkNpOUFPMmdmUXlxRFAx?=
 =?utf-8?B?N2xQbThac2w3WTRadW5PNzBqZ0p5UCtZRGVrSHFwQW56elZjSWZlclBRTzJD?=
 =?utf-8?B?L2Z4SG96cFo4UElwM0lNc203SldyNUhPYWlGZ0hETDBHUG93YVU5MWdXdWY4?=
 =?utf-8?B?ODRBNkZCU1lwN0RlVEkxc2tqVUhIYUNZQ1A3UGVTSENKdVhPZVIwR0hpSXl3?=
 =?utf-8?B?QlJ2WkhxUWR6bHBBYjlGV21TdkpNelcyNzhldVJwTnpndmFtdzcybWJkcjhE?=
 =?utf-8?B?L1lWZktIdEk1Mlg3K0RmNmdVNlVabDJERzVNR0tCWG9pTnltdGF6WkxxZkg3?=
 =?utf-8?B?WmtrZm9lakFwTHV4a1ZjdWRzL1FBaWVqOWFLMUZ3dk1lcSt5NmhNSHpnZkVP?=
 =?utf-8?B?YXpMeXkyR2JwUEc1M3pIMDdjc2kvT0FSR1p6K1pDYkdQUm0rdytjRlRmalJo?=
 =?utf-8?B?dWNFMVZocDFaNi9lbkcwUDZwSWxPYkdIWDViL3IzSUJReWE5R09HQ2VqbUUx?=
 =?utf-8?B?VVNway9hVHVGUS9XMXVsbVF2UnpMeHB5TUg1YmUzUHVNOGErdGlmSEFKVVZk?=
 =?utf-8?B?ZXZKODhnRlpnVzNrQWdTcmlxN3lCNjVpV0NId2IvaVJYelNzY0FURUxaM043?=
 =?utf-8?B?MGw4c0d1bnB2R3BnVmdyckRuUHd4ZFdKTkdabk5ic0VKUUJZc0NjSXNaeTlO?=
 =?utf-8?B?aE9YYi9RMzNya0NjRXJlTlljcEN1SUxTVll6T1pFTVNoYW5HaUFGUmhubThG?=
 =?utf-8?B?cXNPYjM5NjNlaWNtc2Q3Mm5CbDJxNFEzZGRMR0czS2c5SFgzMUIzQnMvTHVy?=
 =?utf-8?B?NHR0L3RlRUxNckkzdHo3Z0kwVktGcDhJQnByeEtKOXFITkp4SXc1ZnZWTE0v?=
 =?utf-8?B?T2RpRmNtd2lSRDhYaGpNR2tJZUJ0aGVac2IzL0Y2bGpUUEJhamtEZnBvblhq?=
 =?utf-8?B?cnNUTGpIVmg4Y1g2dDQ5b3pWbStmSFB3NE9DSTgzNUlmazlBYmFFYW9VcVpq?=
 =?utf-8?B?THIyUk5kMHlPK21wclRwaVovZFBjeGY4bDcwNzNXUUJJS0Q0MXphRXlXSXRl?=
 =?utf-8?B?REhsbGpFa2dtTGxtWWhjSXhFWUZTdXNsTkhKY29iM1dEMUNiV29Xci9UNURz?=
 =?utf-8?Q?co6n8/OCk69SVtPLJ4SkSi7jtCZ0c98HjKY9Jsrw4fDCM?=
X-MS-Exchange-AntiSpam-MessageData-1: 5LrSh7oKtSC/JA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fcfece-1459-467f-686b-08de768ab08a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 05:31:57.7568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PRR5ZiuwxvNeeiKCffPBV2iueey5FuMkhhRadeewNpiZ91YOTbHDWJla4SOpx0jnDthd5hkAXo4gJHNwG7www==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9195

On Thu Jan 29, 2026 at 11:32 PM JST, Jesung Yang via B4 Relay wrote:
> This patch series introduces derive macros for the `TryFrom` and `Into`
> traits.

FWIW I have converted nova-core to use this, and this results in -200LoC
delta. Obviously I like this very much. :)

A few pieces of feedback for things I noticed while doing the
conversion:

- Very often we need to convert a type from and into the same primitive.
  Not having to repeat the same thing in `#[try_from(foo)]` and
  `#[into(foo)]` for these cases would be nice.
- In some rare cases, we want to convert an enum with 4 variants into
  e.g. a `Bounded<u8, 2>`. This can be done using a `From`
  implementation, and that's what the register macro expects. These
  cases are not covered by the current macro (they are few however).
- When converting from/into boundeds, the number of used bits is the
  only thing that counts - the backing type (u8, u32, ...) is
  irrelevant. I thought it would be cool to be able to have a generic
  TryFrom/Into implementation that works irrespective of the backing
  type, but as far as I can tell this would be difficult to achieve.
  Just throwing the idea in case others are more inspired than I am. :)

<snip>
> One last point: the current `Into` implementation relies on
> `Bounded::from_expr()`, which utilizes `build_assert!()`. So the
> expanded result looks roughly like this:
>
>   impl From<Enum> for Bounded<u8, 4> {
>       fn from(value: Enum) -> Bounded<u8, 4> {
>           // Compile-time assertions to guarantee `value` fits within
>           // `u8` (Omitted)
>
>           Bounded::<u8, 4>::from_expr(value as u8)
>       }
>   }
>
> After some experimentation, it appears that the compiler correctly
> optimizes out the assertion if (and only if) the `Bounded` type covers
> all enum discriminants, though I'm not 100% certain of this behavior in
> all cases. Can we approach this better?

I think you should also be able to have a match arm for all variants and
call the `Bounded::new` const method - hopefully the compiler will
optimize that as well. That or rely on unsafe code and a (hypothetical)
`new_unchecked` constructor for Bounded, since the macro can infer that
its invariants are respected.
