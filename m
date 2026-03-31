Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013036.outbound.protection.outlook.com [40.107.201.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B9A19D074;
	Tue, 31 Mar 2026 02:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774923691; cv=fail; b=kBIOYbcRvhiWg/rDv2Uv+9ICOj8R29XM1iaADfp/fc+iKCW5rH4XGqBbCW4eTqcHSRI/6VRGcrnfnNpJb3O0L5pxc5GkyYQwd+o0o4cozzt+781XC3EGq6gMDFSabAE/GUN7J6px95dbjcXeDbas0sDApjy6Y4cSnFHmc1iCxRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774923691; c=relaxed/simple;
	bh=IN3XKTL3S+95JLBB0e7mQRUYlrUqYSK3Ng/12EUEmk4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=ViVppowAfERzyQKL05u8NeqXYTSEtHQYtcgSMZZ7W96Le+NfjzqP+R70bmRQFtAxZh4MNihiSVmmANarMQjGam4NSqTrExVtYV+FmmWc64QuxoSepzN5BBEZ+1v3xDaIF7RKnQCpOeSdrO4ScY/33oQRm4L5snm8svZ2UlvPQRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LZYAJTow; arc=fail smtp.client-ip=40.107.201.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LZYAJTow"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMF29ioN+YaO6aqANRjEqoM2/kYnnQLbxSPrrBPNLEs9yOT/3eSLy6uKvGmyHqfxtlH5CpCHQpgBimQhKPiXOBJQ0oTno741zkxItwx6bCvYi1dn/2eqNZ1VlIZLQj3dlqdOOMIAdtRIrxj9JSXj0XwOgmBM7RPkF2kFNBOtBmrpV3ltAEPRCxZMV21x94NCDPKB/y3R0rrQ17amOve7WcdzUKHq9Qnl4vKD+UYHyIdg6akrmgygB+DyHeblqfl5c/LmWCpzYH6n84VJrn0b2pMXDIiO7lBurVQcJN3V5t3/7oxHuxPgGT0WsqP+RTHkpV8gLgUkYhtqwNcjBN9gAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxS/Fob6t3yqeWx6Hk6ZC7zbmQlvaqIXbguGezVsaas=;
 b=dW+B2fVheAr4pZmrJsG2udcJdEKZnxuHkDYsC6XdKMTiPRaI5Os4KQ/38UsCXX8GVAnbWOZ+/DGUMvVgwYDyoEKK0MM6aTNEGfqGxFmq0RNRbqw3szmG3vFKudIp1NGhY8eNmnjEyUzMplsMf1HUk5ZpgO8OSejh+YVrxLr2OvvhgxQCV1Ur3jfNC12HtHghcYV/V6mod9c6N5GZLpzDy/decc27/6VrZgWtSA7Fs6l/TII82Ahni1gJNdgbkuy0XbhZCwb4G6sM6V06vMxcFRI1kuhLKoD3LDfw5EADie/teon4Uxamwk7Axy1MpNn4h47fUzfQO3fWjR8/CSqPSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxS/Fob6t3yqeWx6Hk6ZC7zbmQlvaqIXbguGezVsaas=;
 b=LZYAJTow17/8NTV3d9VyhFDX8ldOZpJiRTF+8Y3DIXOhkX4enk6c6kKhV9dZKvTBfL2HV6wcgTTS3om6gO/pLSYCnjHjRE+u013dGM7pM9mCg3YptDEFWweIu48bETAxlTONL4ZaFxL5/xUZ0bcasKqCFJKIAalvo4RqYxoIs5vNrFyqxhi9M89G+VQEofT9oAEkrMiKieM2ROD7D3O7NxJ2OdoZgtrhMXE2ojN/PoOn9vyayCZaJ4PPuS9kthOQbYpTV1KNaypVxKbVaGo0+dAvCyXgW939vLo7ArTclDnJl8B14i24usFL9NhB1ppQ6UmDHknZR8qKEnyslTY20A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 02:21:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 02:21:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 11:21:17 +0900
Message-Id: <DHGLXL0DVBAJ.2M58T9RSK5OO7@nvidia.com>
Subject: Re: [PATCH v9 16/31] rust: ptr: add const_align_up()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-17-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-17-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: a0794dec-3b32-4a9d-fa1d-08de8ecc3303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	N67DUC5SYepgx4VNOE4qMBLg6V4WS7+KYntc1cG+tdFYxfxL2z/Nb4ynlYxkRVygkJZwQnJMKIMsU354ppaAcgMDERcqQjf/nbENMl+EbFsfJ3ckDqwXzmRcKGK6+tSEtWWMMtgM/fm0OT3wv1a9SUpIri2vYg/yM8ofiAJtZlitBja86YULv5fg82qk3XwyVdHTHtEFZZiHKQOTE+/dnzDmiRYt24RPJl1ehOmKkOEPNBgKYWx1SaeRevmi7B3cc00AG6QcuHZf3FEmemzdUyTk3+xbNlnAdyOTZfDs1iWwdPP5sikn9aIq57eNys/7YGNvnMtREQWVNOSqV3ZFQlKRy4Su0gB9JU6cBuDqhoCew+6Hf4d5Sl71z2utardSKZv3L/2UQQQfFZMxe6NEsZ7+bOqSiqMRvA6qRh7C7ufZCSim3Y4cSKymTRoplOmRF+O8MtwXUfeOlJzAQUq5Axk33zn8x3KddaxFg6sE1fBg8T0v0v3mGixqt3RT8duKNCFlCiGJD9TXtLqvvq4yolOleklQRDnCjs7q06Au6AkSeMgAEK+iW9bs+YNbf+UDk73wIsEJDF6XoguUVH1onORhA3sFFL20hZOsLfj0bgmcEx+uJK2oTAv9gPsD9LNN9lOoh04ntGLbga05GcDThlu82A7+7y6kBFdqn7CkHu/4lDq60VAn+m3yboxhmRerA1lJl/3qmoEkJy1WhZjB+evDpN5rMcJgk/878x0ndAw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S01pOUFCeHJQMEVCRFpHanBWa1NkU3BEdWhmamNSMENqYUpWZndWRWxYZTdu?=
 =?utf-8?B?QlpsRnhscVFFUTFEWU9rdDZ2S25DTE80N2hhR1hMNVk1Skd4aGJNUDRyM3B1?=
 =?utf-8?B?UTFmVTNhNTBNWVg4Nk9yeHlTVHNEMUpQeEZxbXVNN3hiNDU2SUNpdzJaaXF6?=
 =?utf-8?B?M2svZ1F3Q0wvZ05FK2JzdGJoZTVYRER1NlRTSWYreVFKdzlMQzVKVHJMazV0?=
 =?utf-8?B?L2JXWU5JdDdzNnFvcHZaTjBXbitWSFBBS25CQzI1SnZ2U1FIT0pDS1NuaTBG?=
 =?utf-8?B?R3c1UmpJRmVyL1lHaEVZTS9CVVBxVjRyTjlQb0JlZDVQTnZEbms4S1llOE5M?=
 =?utf-8?B?bWF4VGtvRVIrOGRqZjNDYlVackgzWEk2aEwxcUwzNFZ2bmorYjRqVCtMMDU0?=
 =?utf-8?B?c1p1NHVKWWNHSHAzaWtkbmVwVlR6aFlheC95ZWRpUngyYTZENnppVS9DU2Y1?=
 =?utf-8?B?ZGFFYWlDRDRjVDhDcmVCMkI3c2dKVjNlUTdkK0FZV1B4QUtPNHUrQkFqZkxX?=
 =?utf-8?B?eE9CYzNTQVNpRXFzUWxuZGEramdQeGM1UnlLZTIwdlJKSzRPZnNrNFVYK0t3?=
 =?utf-8?B?UlFDSG9XWVBFQ0hRMFBZMVR4d1hzcU9YRksxd3k1OXJkR1ljZzFiWFBjRjQ2?=
 =?utf-8?B?a1QwT0VoRlozNXNlWEF4RVZES2c4MDlvdWdZVGZSRTdMd1BScTk2eVFXOUZo?=
 =?utf-8?B?c3V6T0V5M3hqcUNsYytFVlpEUVBJM1VqUjJjQzJkeDdGZ0VucmNHaXdDKzlC?=
 =?utf-8?B?OGpCRFd2amkzYzhQMHF3Mm9Ya3JWYmg5TUxLaThPVVdScmExM2VPQ0pjVmhp?=
 =?utf-8?B?eGVTQWhPUCtPMkNDN3dKcmlOaXFiRno4cXc1WXo4RjhtL1QvQ0lMREZ2L0Fm?=
 =?utf-8?B?eEZ5bW4zKzNFeUlxZ1pZNlRGU2NyZXBlc0R3VC9nOVhveCtBbnptRWZOc1g2?=
 =?utf-8?B?Q2tKMmRsMU1hMGZ3R2x6ak1rRGF4dE9IRGpjZktDOEpTenZ2N1VMeUxNeDJa?=
 =?utf-8?B?K0hINGdMNkQ4TnpWNDJaZkVGUDA3Q3VWdUZHQ0ZldTkrVGtkdWVxSVk5clpV?=
 =?utf-8?B?OHhWZlcwYmlNWTRwVFF3LzBSQzRFT2l2RzIzOW8raTRFSytucDFrNDVreXVY?=
 =?utf-8?B?TThySjdkbnE5b0Nhd05icU5hQ3hnblJrWE9FenVJcnFRYUdDaVFwbzBkL0kz?=
 =?utf-8?B?VUQzYXZsZWZrWndmZzgrRlcrMFo3SFEya1dxWTJqYjg4TmVXdXRQd2Q5OXlj?=
 =?utf-8?B?RjAyTTVjUEh1THJrZHEvblR5OFhMSVZMandVdHV2ZEdTaTVNQ3lIdlZXOWVI?=
 =?utf-8?B?UjBQSnZiRjBqN2lHVVBncUtLTTlIU0VGaXR0aWlsZVkzejhYVEU1Q2FmZXRK?=
 =?utf-8?B?UjBLQmRoRmF1N0cwTlRYeFRFSkhhemNsUXFML2d3VENlRFJKRmU2eEFaOFE4?=
 =?utf-8?B?V0xGVGdUdER4dElFSjBQZTJMWEtMandjUU05ZVJyZEZzaWh2Q0JsY1BnRWxl?=
 =?utf-8?B?YUo5dkx1WUU1UmU5ZjFacUNJSThJOWE4SGwvdnlJT0I4ajk4WENZVTl5ekdH?=
 =?utf-8?B?azErUVpxNS82SHdHT1lZWDVjZGVuM2pnK3E3TENJZVdORHNjYlVFbDNaSXBQ?=
 =?utf-8?B?dWZLYkxJSHdqdUZyZ1JVVU02d1FnYk1HdE83RkpNd0FxanNmRk90WTVINU1C?=
 =?utf-8?B?ZGYxWm5DSHhqYStYd0Z6bk9PSXEySHVwMEN1MmxPOC9uWkdRc0VjMmpkNExI?=
 =?utf-8?B?YjEyek9xblJWcm5hNFc5NGk1d3dXT3JDS3gvdDFwL01hM1UyZ3VJSDlLQW9r?=
 =?utf-8?B?MVduUGxUbU1GdEp5dXdnQmdPNi9Qd1RXQWttZVJScEJBK0RCTmc5WWI3L1RF?=
 =?utf-8?B?WFlQUnZXYjdBN2EydndocEJjKzhNam9tSHlWWXVUN1RwZXlDK2pSRFEyTmR0?=
 =?utf-8?B?dnlaL3RDQjBaNWFpSXU5R1NOTkJTMDFtRkpFeWlpSVg1STR4TWJ3MGV3VzBs?=
 =?utf-8?B?UXp6dyszT1VNOVNLOUhUd2FuR2dEL2wrcFFycXk0R0U0RGFTak9HaUg4STVn?=
 =?utf-8?B?MkllaUpYT0o4YjAxYTJNUDhFMDJ1T1hBdXJrSnBjeG5tVDYra2VJUWh4V0s0?=
 =?utf-8?B?TzlMRFFseTNlOG1FTHVkbXBrc1lhWFVHZ0NJSm5LZ0tIQW0xQjNJNStxazI4?=
 =?utf-8?B?Z004aHVNQXc1c2RyVnBQL0hJbmpJUzU4aERSMTZaRHhBWmVTWUg3Sm43bmpr?=
 =?utf-8?B?eG81Z3lNbTBkd2drUHNRYWtVU3o2aFZOdENoM1RKMlhPYWtsd2hxTXVzV251?=
 =?utf-8?B?eW9wck9NRURIbUZwOGZRRE84WDhReW0xWU0wU2xqTE9kZ2dIZ1poa2lkMkRi?=
 =?utf-8?Q?3CK1kR9guJLdzl2TBxUeNzuZqMnmDPJTnNvyZXk2DBOol?=
X-MS-Exchange-AntiSpam-MessageData-1: Cd4moVecqhH7OA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0794dec-3b32-4a9d-fa1d-08de8ecc3303
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 02:21:21.5804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmOL+xpsqMR8QBnPeROqoMmKvV3MZGOgE71cl2gCdoVsjGzHuiWPhlVeLMBbELkr4VL0UAlcCHQ2G7f0Oegj5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711

On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
> Add const_align_up() to kernel::ptr as the const-compatible equivalent
> of Alignable::align_up().
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  rust/kernel/ptr.rs | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index bdc2d79ff669..7e99f129543b 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -253,3 +253,27 @@ fn size(p: *const Self) -> usize {
>          p.len() * size_of::<T>()
>      }
>  }
> +
> +/// Aligns `value` up to `align`.
> +///
> +/// This is the const-compatible equivalent of [`Alignable::align_up`].
> +///
> +/// Returns [`None`] on overflow.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::ptr::{const_align_up, Alignment};

IIUC we use the one-import-per-line style (minus the unneeded `//`) in
examples as well (I suppose this can be fixed when applying).

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
