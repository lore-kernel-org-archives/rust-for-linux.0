Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021131.outbound.protection.outlook.com [52.101.95.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1535B4071CA;
	Mon,  8 Jun 2026 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916733; cv=fail; b=BtZ03uL9YI866Op7m3lUqeqInwHWD+m+lHAAjCiKcGdmJOcUlmw47Q2nqDgJLFkmG5CHmsSMcrI7vqTJ/DaTW2aigXpvX+wA2SSoenjzudM4+EEhSs0uB8J2+joLuZY8fVT2sRRDzctcPJ8tDBLbUi+hc9/InbSJ7czBk/+u9rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916733; c=relaxed/simple;
	bh=5HfoCCSIsXACU0+6KM8zl9pRpQJsFIQ4iVn0vknOho8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TQktWkfkOiJgJn5JAM9Sk6CDLwQ4Tmpp+KJScI3HDJGxdoEACpL/ZNtfKNHSGsrXSEtRCiYmbHA7Gb/w1SB+2Xy8weendMIUZJCB785oGTKTOg9zYPqMUvc4eTfWf+Em3O2mYgwBrnWAS6CYcdSUbjnzcjyXHNZPqNJct73694Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=oZCAORIv; arc=fail smtp.client-ip=52.101.95.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="oZCAORIv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciKAnPzjpFMGXanKOv6YJ7Jtnd2qogoF6fg1kCM24SnLXTqslm9s7vUko8MsWSyEeVMxGk2LjzFpiL2yGrDMM9cebTc+AmlHUYUEPa+ECIXRb/5EuZZzSFg17TbDLZJpvW7UiaD2XH9j6S88ou9DcrIMXlWmcPIhlXgbdTWus0aFrRM2bXQ4d5ebSDOtye2AMMUdD21f+QOn4OOAnx7h4vY/+P5fPPbGkkZjCVsb5DuKhIFFCs/FUTJkbeApljfcXVkFIZWtNLD9FbPmztO+iWVJxmZm9UVEks0eHMhLTwwGXrsv0wzAuNta2S3jJsiiBlmyhmOYcVCm7f2C7uMVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Thf9eDNOE0DmvaR1roeZyvlHIzdwaSGy+blaN8iBjE=;
 b=O9GhcVTcpQ2qYU3QU9nsplykh551JUk7+rFDHedgE1AS/Hkdxf6ur1cO4w2Kft3iOEmaaTnHM5r/aXH764mYpcPx2yBjAM9JxenXIjDjt7nbMUKWkmRohnhUmAetc6130UesbE7gsGMpuxm4VRpzmCrPmFgIrxB80yz/U4AgAVb4mzaRYleJLQPGioyzjsQcrqPNCWSO5NjY0jthrCAhoa4yz/JTNvhBSJXNwqVGyxcPgjYIjr7ZXArZ8LtUXmEkata2yGfrXlEFxDJW299gsJIF/OkUAYrH8krNZ+cks8HQUHXhADR5bjWxpqeAhQNZEleQ+yBoJMEeEXs/9geOdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Thf9eDNOE0DmvaR1roeZyvlHIzdwaSGy+blaN8iBjE=;
 b=oZCAORIvayPUD9H0HTiWmLQsjIoxjjr/VHvUnQYexcM58VsbmFlaFYXNmLL7SMxIT7OzHDC+HcXVvy8+KpiLg7GQVmMQXVWo1kgzq+6Bk1ZzxYfqsCZfxgRbOcJWTh1iKXtIhw9eR2YICUDZAUhFn3YBgQDlg1tTrPoN1xG8nHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7455.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 11:05:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:05:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 12:05:27 +0100
Message-Id: <DJ3MAHWC1974.1MKBKAXGMNAJG@garyguo.net>
Cc: "Dirk Behme" <dirk.behme@de.bosch.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] rust: add a wrapper for the `nr_online_nodes` C
 function
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>
X-Mailer: aerc 0.21.0
References: <20260605-cpu-helpers-v2-0-0ad227f0d91b@kernel.org>
 <20260605-cpu-helpers-v2-2-0ad227f0d91b@kernel.org>
In-Reply-To: <20260605-cpu-helpers-v2-2-0ad227f0d91b@kernel.org>
X-ClientProxiedBy: LO4P123CA0230.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: f1108679-c505-4b5d-a590-08dec54dd91f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|6133799003|22082099003|18002099003|921020|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	hV2fWMbYG1Bpn//qSQ634tWlBpc55A7VQl4sTBgsNgu5CjC10M5ZKAKxVt47K4DfJzdprYYeaihe1etkkWVNnwIcGuHsmQBzjuV4s1UhXowg86vYQGCqh527gZIGAKQW3N0djw7hV0BdzTyjB/noR9owRjbz2Diq1fMGL6rQyBcNwmYgRM7vT94bVGRxKj3q9RoAMFR+jMwLcW8xQs0VYJ1I/2A6VTtdG2mkPt3YdDPJcDGMaFcwsd+/koiufFYSEzRUsnUSkiJqKlD8IQr+KYZwUrtYn0LHJbI/AOyNHz9behGTX3D4lO3gOmfcUmbtvFE9Ls9SH0DWoKUMUTSEfRQDbSgeubeI6dQscSwX0004//3WXju3meQGrCjWQYbiJPfX1pikWDdhJ9tx7WPIctccYxxopHtaTKajcnhGjXnVgelGltbL6Pn4div6peyNC53+FffbSq5OmqiGfpsioECHDGjiYTplkiKZPZSsmCmdURtV2gH1MS4Wk34QqUGywljrtOqMPZAe8vwfEXdT0hV2io3mBr7WbtmrDmCNbt7ewOtUlvkN1Kn1f1ia4z2zwaScR3uHZDaaqbu3KYgjuz/v1RBZ9FZcU28XrUyKIo8IFJV5qYyhuplLEbfJUamQ2B46+l/klSXNCW9brKR9iMD0x5pG99X8QovNc2C7qeMyVatS1z+Mav1eOTmOQxeNpAjYnr47rJo+ZM1H3GshJ8meAHntSivLFGWyVNU57UI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(6133799003)(22082099003)(18002099003)(921020)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGVrVG9RMVFtUklIVTVxdWhPOWNOczk4dThpOFNGNFN5bEQzNEFQV1FseU9Y?=
 =?utf-8?B?djFKNEZWbWs5N09lSTkyVUMwdzBaTldiV1I3ZGw1N3FlRXR1NDF5WHRHRVpK?=
 =?utf-8?B?OGZhMWJRQm1kbnZyWmVkTTVEek1ubnRoT2ZXVUxrTjlVa2tuRkdKek8zdXU4?=
 =?utf-8?B?dXVVcDVweTlvR2VpLzdZSjFSaDNrTzB1RzRBUUVRQlQ0WU9pdUFCclhqbFVO?=
 =?utf-8?B?aXdsb01EQVhjVGQ0ZjNJc2VvNDdDZW40UVVjZXNOMlY5d01qb2JCZU92cTU1?=
 =?utf-8?B?WG5KT0FKc09kcS9XbDQwTEVkTFFxN0pEUEdmM2F0VHJxWG13YlNmVFNlREpX?=
 =?utf-8?B?UzB0SnlSODFlSmRXTnBnTXk1SzJIbERNKytsd2lhb2RiczNPUW1oTzhreFRI?=
 =?utf-8?B?MVdzZ1Y2aGRDQWltd2tFODJvaUduOE4xU21MbTB3dzA5aVVuWFhObFFzU25P?=
 =?utf-8?B?ZURrTlZtWnZXYUxpSmsyNWVrVXhHYkRHKzhGbnlpc3NxeHhPaXV5K3RLNG5L?=
 =?utf-8?B?c0VaNWRBTVdUTGJ1TzhIU3JnNktETEVEM042UEhmeWpYSFI5R3FFamtmZW90?=
 =?utf-8?B?R0ZTNkp4NFBQMXgxbUxqR3ZjbHNNRG44ME56VmZjL3dxQ2lnQ3NNUEwxWXlv?=
 =?utf-8?B?WUVTcUNZMHZVRHcwRVZMWVRKc1ExZXBqNi9CRkxEbmprMkQ1bjlvNS93WnRI?=
 =?utf-8?B?aW9SWlkrWWQ1bktmT2M4bHBvNFphZFhMbmdOanBFTngwNWcyMDZ2K3FoWmxo?=
 =?utf-8?B?Z1FDZXk1d1NRUjIzSjgxKzJFQnZ1NXg2bS9uOERXSU1lT1FTRG9reG85UXFu?=
 =?utf-8?B?Zis4Qnl1MWdKbjJaSDRLa1NtUUtUOGNiQURSOEU3dlU1T3l3WjNaZ3hCS2pE?=
 =?utf-8?B?bGdBMHRKZ0drR2JQNnlYUFBJZ1FWUi9LaW8rZlhZc2ZNejY4R3l5blgzakJP?=
 =?utf-8?B?UWNiWXd4bjBCK01MbTFLdnlXOHhxeGFka3RCYkZCTWdTS04rWGZCQ2xNRTZL?=
 =?utf-8?B?K21zOGtHTFgxbHlkWFpGT3Zkakl2cWEvQ1JjNDY1Mm4vNm9BOFkrVVpNRXNz?=
 =?utf-8?B?V1FkZDZZQzdJUjlJbTMvWlJKU01KWC9taUJXR0t4K1hHbkRYbjZQam80aU16?=
 =?utf-8?B?M0t3MktYM1dOUXF4N0Qwb3I0d0tCUnFpUThwSmxMMWs1dWNGRTdsdEFPUlpt?=
 =?utf-8?B?SVlSdkd2OXlqRS9mL2U2Nk1MRTgvaUplVUtVZm5Ic2hkdWFsTll2dVQyaW5N?=
 =?utf-8?B?Nk1HbGMrOWoyWFJZSEtWZ2RLdWRTM1BiT3hPK0V4RGFJQWVLSGZOQ3NReHhk?=
 =?utf-8?B?bW1ERHgwa3ZHVlVCWHNkMk45M0EvRjB5YUJLdFR5V29OVmlKMmRWMk1Nb1Va?=
 =?utf-8?B?Szl0V0RMK0Q1M1JTZEtxNXVFYk5ESmh0QSs4UDZBSHhPQkFuMk9iQS8wUzNQ?=
 =?utf-8?B?NlQwbEZWeEt1L1habE5PVzBLSjV1QVJaVTMxQWZaYklFQ1Q1NGo5cEY3MFFz?=
 =?utf-8?B?YThSNzlmRlovNi93bHJYTWREZG1NNFB1bVk2Q1ppWkF6dHd0TEJJeHdmN2JE?=
 =?utf-8?B?b2NDSzcxYU8rbURGWGNtTTdVZWc2Z1N6VUhsTGd0U1RCNEs2SFNaOEVDYWpu?=
 =?utf-8?B?R0h1SUNVV2pRZjlJb2xoVStRTUdyNm1MY3FSenZJYkJwK0tIVHliYklLSHFr?=
 =?utf-8?B?REFCNVh3Rzk1TXI5QUNvdlRBeWVJbHJDZ0NvOFo1MkNxMzZLZUl0ekQyYkRX?=
 =?utf-8?B?Z2QrY29XaFNuZGlSbFY4SFZ2cW5sUXgzV3VuSlFlUVpaUTkvMVh3dXdtTEJX?=
 =?utf-8?B?V1lsd2drd3dGS1NJc1hDV28vNGhmMEZpNFIxZ2MvRTYvZnRIWFRmZnIzWk5l?=
 =?utf-8?B?NHdESk11eGFSdmI2Zm4wemtxRHI5RDMzZjhrNlkxenJjRnA4MGhZWHErL254?=
 =?utf-8?B?SUJHZWk2dlpLS0Z0aTh5Q2pXZzdJdlN1WFUzdy9MMUpkN3ZQR0ZERXdrc1RO?=
 =?utf-8?B?UUl6Nnp5cE55YkxtMDJXRUNLUXgxem44MnN5aExzbFJtelVqanQ2WTlzb1pE?=
 =?utf-8?B?bUE2Qks3bnN4ZGlWWmhFNWdSNWNiTlBNMFBoaWtyZkh5NWJwZVN4TGNhNnBu?=
 =?utf-8?B?anQvd1dRRzNGaUFJTU1TL2RPTWs2TXBaeFZkSVRLUHExSGdqYTJzQlpHQ1Nn?=
 =?utf-8?B?WnZLM09sRFJpQ1lySlYzQTR4ZUhSbUFEYWl2ei9HVG5xWTBJS0lSRy9QRG9W?=
 =?utf-8?B?R1ByZDY0ZHh3bWpiVmg3V2RiU2Rjb0tZN2FvdTY3VFdSNmZqWTVQOG8yQVhv?=
 =?utf-8?B?OHdtWHcyYUhhOWVrRm1RN014UXlTNVBBaUdsVHlTQlJSb2ViQVFVQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f1108679-c505-4b5d-a590-08dec54dd91f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 11:05:28.0621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AsjzWkl5u2bxfqsYE6bRJqzMukDagT1p/wEG5Ctf+wKmC9v0CvdC9pf+gG16YODEHC1U3+IpJloF5nrW4k3CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7455

On Fri Jun 5, 2026 at 1:54 PM BST, Andreas Hindborg wrote:
> This function returns the number of online NUMA nodes.
>
> The wrapper is needed by the Rust null block driver.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/lib.rs  |  1 +
>  rust/kernel/numa.rs | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index b72b2fbe046d..00713b2adcac 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -97,6 +97,7 @@
>  #[cfg(CONFIG_NET)]
>  pub mod net;
>  pub mod num;
> +pub mod numa;
>  pub mod of;
>  #[cfg(CONFIG_PM_OPP)]
>  pub mod opp;
> diff --git a/rust/kernel/numa.rs b/rust/kernel/numa.rs
> new file mode 100644
> index 000000000000..760db072a6c1
> --- /dev/null
> +++ b/rust/kernel/numa.rs
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! NUMA topology utilities.
> +//!
> +//! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemas=
k.h)
> +
> +use crate::bindings;
> +
> +/// Returns the number of online NUMA nodes.
> +#[inline]
> +pub fn num_online_nodes() -> u32 {
> +    // NOTE: In some configurations, we can read this variable without a=
n unsafe block.
> +    // SAFETY: When NUMA is enabled, this is a global mutable static. We=
 do as C and just read it,
> +    // even though it might race.

Can we do better and do a relaxed load instead?

Best,
Gary

> +    #[allow(unused_unsafe)]
> +    unsafe {
> +        bindings::nr_online_nodes
> +    }
> +}


