Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020137.outbound.protection.outlook.com [52.101.196.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0AD329C6D;
	Mon, 20 Apr 2026 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701223; cv=fail; b=YX1E0z0wkbSlif3Rc5A6jtM3/C+jjHrHnC+0wAUNW4f/SJszdwNL3mRU0Ax0RzljnlpwXBHPgxehzQvBp4QdX8VRP4dfCJHT9PVoWrPdsK/am8yaZRDfzuON13klztAGCqTCJb/cvXgpzikPhhYVQyJ6Ga/jgQ7WhHeES0Sn5rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701223; c=relaxed/simple;
	bh=/OLu1atAoSR8x3+XH9zfBy8yvVkwr4QuaTxe96y1qB4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YuXNjNeIIOPfFfmfaJWbD9mJ0APAcRGMfVk3RSzWdK0EXkEKe9NCGJVvf3ZyEt8DC3kBWRVg4KbH0bHixOeIqnOdXmMmlnqYmjcM3OZb1uXUdB6Sfgzes7mUaGRB+fLkLqAy8IR9DgbUJFIkdPFjTutmiU6zo7xW6aOmGGEd4xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=0VUBierr; arc=fail smtp.client-ip=52.101.196.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="0VUBierr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAa6Kh3h0guh/l/4iV4n7ON31vWc3yNSxO59P0OPt1Flf3uQuOP82S9zVayjvsnpr0UsWDmpZOsb8moWTuO+Tw7i8cZwLMj6KlgPSA8r/w6g/EAAVzRecD49k7dsJq/R+1BosWgoq/gLshuEsF6xSCXndRe2e1BeihrQ5SoYgT9ukdXZ1IworozFZCwebVR8gqRdfEFZRjPNniAbMUihc3S3GaP6mwv0sNA9pn9X6vCvveag1fDE+HyzCM2F4xFpSdknS8YTtzzeG4bnOuIzzmVNHtYet1PHtZzISgs1sRiDE+I+RznoIgzl2KWZtSQ+OPdqBFD1YKFrMT49QdRfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wArJnsCLpjHpV35GN5qOud3b6mHYL7EaYehTvYFNY6w=;
 b=MuSurDHlcfXMoZX5sIh2OvdqfwAjUb87D0sUnVO68aPEO8yNheIRSSWaIQa47woyxbKaKekOp4Wwgt7UgZdo024Q+zEoiwIW7DiXMppo4cZ++Tau28lRMTTzLFw1Qjmi4iBJr+06gEusAwSEqm7MHbMQGWDlBOP54RR/3EMIDgn1FJHLKKuLMo8NgeE2KXdETIjPFzaqUZ2Fd4cUoCLLVTAJxq8fGgCaL89splNxj9k1unKcTUMqdqLNoUrtDmvDC7x+RlDGrWgUPgegdAu+bmLxoVKcN7b/XdLZ24Gna0BPLsYDHLSzZeR92jaFmx2GQlFR2UIyz7oZY0z8UjZdFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wArJnsCLpjHpV35GN5qOud3b6mHYL7EaYehTvYFNY6w=;
 b=0VUBierrlOAus8UYo3ITYHuQjaBJMswUU0sqZta3o25NrqkzWARs3G15ZQZb9/NoerEQkOePPZiqIuFuNRAXsnKQsjfte96XBjsz/iicM6F7msOLX44mVsM/2vy7gDXQHOsPbOOye3a9Pfttnl8CQfQ54U/koZx3FD5tjr9Wpxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7407.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:21b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 16:06:55 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 16:06:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 17:06:54 +0100
Message-Id: <DHY40M3S3DVO.1Z5TSG0Z1A1Y5@garyguo.net>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 02/28] gpu: nova-core: use GPU Architecture to
 simplify HAL selections
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-3-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-3-jhubbard@nvidia.com>
X-ClientProxiedBy: LO2P265CA0118.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::34) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 08859c45-f0cb-4331-0093-08de9ef6d7a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ijp5mNpdLygyUy1daHX/CfA3Ef10kjhlfXUi0YGFoZwD5BLxBSZrudE7AM/efKP2GDTmNRtRVKYA4QZFccG/t7WpHnDuE8Ro4jZMfz3hiF0kGUMU0Rk6ht//tj+LWKgQv25n/+3qNZZaqnhLcG4EY653JlWoT6iHx1dbfsse22KIfqoyGDISibmusNtu6PRSahnoSipDITXAcVi1ep9sQ4irrmv7j1dYI++0eomt7Rbl+MWw2AUZGNCMN9H9WCC6B7qt0AtDRYkAG5F7IRQJj3KzrzCCByXLmK2GXN7Lp9cjt4fSS5Co/I3QPfdtB1bLY6wNODFEznFJnT0EmA/4Fh4ZEH3fGsQoMlyKERnLjTTWt8ZmugyEKud8Wl+yziloAvFBhHqDfV6V3Fkhb7WMndXFwF9uBOP/KY6RPQtvlmLu9MmYkb6ZE4sXbD5mVMBfxhcuQcJU4/9R91cFsLc9ujWwYdXyz3v2f5ooLpFnHaKPnq4aVy0BRjRI/ohAE1zODRW2t90Ig1XWp5hEDMM/qg/4W0vRm5O3EqDmCpFsYExuiwYnuNVwV5yE1jjbiOEwdPvrPkh6eg36lkgVgTRTcHnlPbaI9MaW6lTja4XAC6o2UamDxnserFcPT5//8A/oQECTIWX5/BasYALk9VLLN96AycvssjGNm0tDUUDc2WqnZj1wYNzqRNg7HXBi6Qw5GbIM5WPg6lEDdH2WJXrrtuXxExNoRieqNukd2W4Mnbs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXZuYTBRMGU5c1I4S0luOHpSdXFpNnZrRm1KYzlXVGt6VGJDaEtXc1FFbGlC?=
 =?utf-8?B?ZWJZVm12MnAxZFk1UlU2d2pKTUpITmE4T0JxL2U5cXNoalN6eXMrYVJvWjVy?=
 =?utf-8?B?VTI4TWlSR21XTmQxMlF0WDhLK1haREpwaGd5U1FpQ1ZQL0trdHNKT2JiSklF?=
 =?utf-8?B?TTdQME1hU0N4UlB0eDJ3NWtvclBwVEs5WjIzRXZjRHFKbEdJWkRyMmU0cVZL?=
 =?utf-8?B?YTFDcWIvQXpnS0VESC9LL2ZEUlVhQzRHWnMvelZyeHFwZ081Y0VySlJLL3Q4?=
 =?utf-8?B?WXFEZ0hLUld1RkFLSkg3TUZDeVpoZWhKWGdnQjdIZVJ6VWd3ejV4T3RhV2tY?=
 =?utf-8?B?V1JmVlYzNnNqcXB1MXJ4U2taVm9SellEbUFtUWtxR1ZXZTZVd3prRjBOT1g5?=
 =?utf-8?B?dXFTRTExOURNeEU5amtDbklNWnNRWGZhNDR1bVpkSGdsMUF6RkZiN045NW1B?=
 =?utf-8?B?emU3L3ZFUktaNHBvMGRYZVF6ZDBEdXIvOUtDbWpBK0R0RnVzQlFJSXAvancx?=
 =?utf-8?B?VVRmUW5qVUtxVTUwNXJqa21PL3lpa1NxWEVmTEhvQWl1bE8wVVoySDhXenpG?=
 =?utf-8?B?UFQ0N09DVC9VSk00SUZQdFhPbXF1RE0zQTB5cWJ5M05JZXluSjJhZTc5K2JI?=
 =?utf-8?B?YTFUNlYxcFFoSnFJeXZvWWNId1dNd0kxZzd0dkZUbG1iSlUrSzBTbU5CZElS?=
 =?utf-8?B?S3pJM1FjQjdGSG0zSlVTSXMyOTBFK09zOGlCWmliaEMxSk4xLzFjT2xOUUZB?=
 =?utf-8?B?Njl6OEdQUEFVRTlPV1dDQys3NzlPRnA4amJxZnVUR3hpYVFrS2dPZjJoTHZP?=
 =?utf-8?B?OEdhRmpkaHpTenNERHFWOG5PVDBHNWJtM282TFBER1JOM2xXcUJFRGh3RWV6?=
 =?utf-8?B?M2hoU3VYUmdzSVNFaElFV2w1empaYjloMWthb2wwRkhDcG83b2NCektZSHZW?=
 =?utf-8?B?cHNBaTg2U0ZVZUFpUExCNGJZODFjYTF3bEhMeGw2VnhKNWNjb3RVcXFSU2Fl?=
 =?utf-8?B?TjlhQkRKYlY0TFJaT3B5dHEyOXFUS3o2MnkzZmlvSlVEOXVkb25xREVjYlJq?=
 =?utf-8?B?SHdnYXErOXhVQ0JON3d4QjFIeHl5S1UwaHRIZlZ0anNUdXcvYzdpUStOVjJ1?=
 =?utf-8?B?VkxRVzlVS1pOVjlGUXI2SWwrYVlLZ0ltaXBXSjBTN3lZdlVVY1NJczVYVXBC?=
 =?utf-8?B?c2RHSlVvUXFoQ1ZGUzRuUG5wZU83dHNHWmtXSzdna3RPWDB3cjRFZSt2Nm42?=
 =?utf-8?B?bWNMRlJSajNQV2ZYTnRNdTQwVjJXNm0wY1I0VzIxcUgyZ0ZURlhwS3JrcTdD?=
 =?utf-8?B?bXJmQTl6RVd0K0hwZDJBajF5MnJhTnVFZVFpNHMvLy93alprMERIbHd3YWV2?=
 =?utf-8?B?Y0dSQUhscEwzOStITTEwVXQ4M3FneHBIOHdocitQQXVLbW50UmtMaldvbitn?=
 =?utf-8?B?MmNoTytXZ09tK2dDU3Mva3l4eXpqWU5OSXVFOW0yUDRCQ1JBRGNDL2hqQ3Bi?=
 =?utf-8?B?dERjZ1l3c29qWnFZR3JOMlBJZ1p6VVNVU1BMRkhBOGQxS2VtSkVpaVZCZERt?=
 =?utf-8?B?Z3lWMFlheStjakk1R0ROQ24yZExGZFZFaGcyVmhDZFhsT1BZZTZEN0hDcStB?=
 =?utf-8?B?eFllNzhTSzFTUzhXRHcwTVNMWmlRenQ1VWdmTjhDemp4cnkyZmpIRmxQS0RQ?=
 =?utf-8?B?RXFOVDVza2ZaQkY5aEpoU0tkSDJTMjhtamlhZEVUcjFkMTFsMzd5a2U2U2E3?=
 =?utf-8?B?RXppalJWRnBFZk5EOTVHYWJMQ0VyQkp4UGJUbmlPL1hCb0FTdWZ0M0tSa3d0?=
 =?utf-8?B?enRBdmNwZi9GWXZLZnFFbWFpUWVLdDNtcFV5WmpLbUlUY1VBaFRocjg1dG55?=
 =?utf-8?B?MkViNHI0R3RQMWkwWk94ODh2QlRseFF6dm5hd2hKYkswQ0Znb0ZxK3Y2aHhp?=
 =?utf-8?B?R1c3MFlURUhpVlZmR05BVmlUcjhMUkdyQ3MvZjdGSFdPVUo1K2dmZHhGNEd0?=
 =?utf-8?B?RFF1a09DaXBXZXBxcUlRYldJblBsT0xNQVhlOTI0ZHN5WU8wQWJUMVpZazU0?=
 =?utf-8?B?V3hJdlVrVnNIWFV3UGZya3lSMXpkVTJBUDRuTElheUhuUFMxaElqMW5ueFR6?=
 =?utf-8?B?cW95RGNtVkozR09jWTlJc0dMOHFMbUduNEh1dkxqUG1iazJTbDdzWmRFcktz?=
 =?utf-8?B?YW1hN1gyUW85TEdxbHpoOHNLVU9vN3FFYVRmYkhrOHh0Mzc5OUlrUlRPTVRj?=
 =?utf-8?B?anA3djdiSk1UMjl1VWlTcWtsU2RGVHFHSXJvT3FDaVo3bGtGRmhMTXlHWFhK?=
 =?utf-8?B?dnplY3VUWkIvNUJ6QkRpelVWN2tNMk9iSUhUWXJ1UzZjVzc5VGMrQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 08859c45-f0cb-4331-0093-08de9ef6d7a8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 16:06:55.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3xngV5lgnvmDgS/LJX+uyqhBsUlaEhojJLeEIztBhML1J8mvh2vWFGY5CeujCoh+EcMZgNRqsBMRdobGS7JAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7407

On Sat Apr 11, 2026 at 3:49 AM BST, John Hubbard wrote:
> Replace per-chipset match arms with Architecture-based matching in the
> falcon and FB HAL selection functions. This reduces the number of match
> arms that need updating when new chipsets are added within an existing
> architecture.
>=20
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/falcon/hal.rs | 17 ++++++++++-------
>  drivers/gpu/nova-core/fb/hal.rs     | 18 +++++++++---------
>  2 files changed, 19 insertions(+), 16 deletions(-)

