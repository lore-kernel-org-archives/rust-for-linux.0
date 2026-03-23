Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC87337C90E;
	Mon, 23 Mar 2026 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271993; cv=fail; b=OmI7CqGCNLjc20lFL8OGjXZm+kUv+sMiWbmoxakS190zVxZHPUQUVRVa/ljdRSafQCOGQryYmRbB1dmGpibtrMy6b1VlWeeSrQbN3o6smKh145IKRr0Crja0XI/OMyqXrnQG2bGhVAaV8YqEb+9CX90dDeCXX5PzrxQkctBSIqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271993; c=relaxed/simple;
	bh=IBzyMQ/XCg+3Phm4L9fk8otq4ZrNe1onjkk9JlB2a5k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YF3d3jw6twXqWtIMQgghsHkY6SQ9gj2MlnXzC6ugpiUgTPN5r4MmCZwtdB+3DjjmstUGAgO+KRf+ywvcGuwsQS8JhGLTkMsN7ceA/7UynYZGDSU89ZVq7nW4NIke6qzBvYvQp4nIqdVHIY3hrwutsmbou7Hv4aSAkiahj1Ti4j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Fcz8XSxK; arc=fail smtp.client-ip=52.101.46.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fcz8XSxK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hrla8TYn9p7xlgwU1PImqPh/+yiXsGk5kohTRVedYdmMmSuciEGW0uYJpuC4zOhXTNzfKNEDI9Vb7BhJC6S9D3F+t+n/wMOOhGkRKlLLFt4TlAXDVWK7T+Qt1WlfTTlEArip1guuoK6UC8FmQDlowmyDMGiXA2wBGPmUTWeErI7f5voxJ/Kz5WDiIYVUM1Q0ewNexH8Pddjej8mAFfzWDaMZ+XoHNIwW2001ybJFo+qz9vGT05+6g71owYiaDfTX8/3Bz9E+K7Ixrp2LiMqqICRgJJeMBpweWtZE2B3tbXiJFx78DkoJwTC8maeg0VuZd5KVZJEFGF3NSeJ3W/I/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TdHdBd2bGGfC/rJ0Ab2HTIbdNkYcVf8vp4R1RoJTkU=;
 b=Y2pdHHZnuBNw+KAQo7Pc2CEabVRd1ivbewGXpfngitYuu/ed1zVSmnFylZOM5wyJJy1SMMLWek6ubOqUuX9dIfh4cF/fPDgfzLw2IBofELuqAPfzKpOwXcN5Ikqmf0XKJWWdYF5IfAbT29qwJLrLJYCLGzAlYR8L9ISB68NmoKUdqzAObkGUwLxarb3McHvN9+1VIgc+IHV1V/+H+O0uNHhSgWCG8VJvi2DLc/lyxPDA2HFkzp7cbJ/Q2XK6R0/mjUQZzvt/NTN65PUUtx+qSnCUmXvc8hmOJHTTzvIRZs/koMOP/fyYFGFaVSY0ZMr1u8wvVPD7A9QQ/i0ng6us+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TdHdBd2bGGfC/rJ0Ab2HTIbdNkYcVf8vp4R1RoJTkU=;
 b=Fcz8XSxKd1+SaADpIW0Jcwo8INeLVkPb2PP7jQSDI+CgdV0QDN1bKum4DT8nNHKUGE+0JuSRzWZN0H/oMi5rLVf4lEqMZl6qIkSdjXRJA6ZjtFl6JxDdTtD+toJ6oGJ46Zq3BvomNsQEBRJ+VoRJOuSMVSuhw4O76PdhVZAAL0EqxK8epsPk5MUJ10lSZFJw3NW6TjujlXdtragD6nevLPHY5bF+JmlCEzD1jqzSK0kC/ogyGp1gq7xCftQ23diM7nQMJRToQW1OsColPDl/czpyNv0AQ8YwPKms/HvSMcHvI5eCNC9aUF0HXUbJ50EqlZK2vjmMr3idTTWpWK/uHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 13:19:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 13:19:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 22:19:43 +0900
Message-Id: <DHA6XCMN83HZ.35I7YETBZUV7B@nvidia.com>
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
Subject: Re: [PATCH v7 07/31] gpu: nova-core: move firmware image parsing
 code to firmware.rs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-8-jhubbard@nvidia.com>
In-Reply-To: <20260317225355.549853-8-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4374:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6d2985-03df-4ee5-6184-08de88deda3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1KadPtA6SZ+7HBg47Fg11zcjreV4GSxBPTOlcxQEx+RvoQsn4LRotJjchBTHuI+5d8xaBI9G4lXAcPnTU/Gk6W52UAjiW2a66c+WCgExY/3EeE8nPyVMaRPsTTFxPmeGBo7wAM2fwBVc3S7heues2N3Sv+UuHCM8RYtIrRCDq4NpipJLK0CpfbDYUA4YU8fLJ1DNPA4TuLr2UImRvTHUAPWk38peuKPf5ZiACpRIH+j8gEqvVyxj0+7RtOK06BWcXmBxtH9GC69TqMSokcbcdVpvG3dVApDJLFBJ1R5B/m0xPMlT5oKic8f/k5+Ey8/h26mlkJccUoJK600mEVC/90WxfqqXweeC4GOQOBII4a2lFLjfGpjUlsbkgphoIzRkjQjl8U9pewfofQ4Q7nJMKKL3EdceI8a38kFq66fnATGFXJFhOEAlnMHBNNCv2DLUkpl//2lrMA+y6inSqgKyBvOiJC38vzrd3Bb2+dJWYcxna6jKO8YYcHjQTPBy3lgX3/E31HtnHAStPJ0oYHNpWrQ/vwhGroG98miDZv7i+OLQeKeUJCqDZ0NxxSQtiOlDe8L+2jSPrY3gkoCRg8JYPKA3j5cmupNQsAnnjRsVwPPhrCDVFrAxUXGR0tFjGZ1kHYfA5ubnRVGXrFIIldDF9ET9Ye/xyXh7R7B+Q0zvAoGUvOPb4Q30gMGuXlzA4TkG2vpItU4qIoG+XxNXGUXTA1hcrBYIRlJm/vIF4Eg+FtC54SDlt5Zr47HSXcyncMTf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDRPYjRkK1R6dDFmVnhLY2ZKYnhQY21qTHFObThDSGN0K21oUGVVdC9OZWJ4?=
 =?utf-8?B?b0NSMHNHVGJXayszdHhZaWNzd0l2NmkxeVdjQ0U5M2h2b1pxcFFpdHFIcUh2?=
 =?utf-8?B?eGN0OEwyRXRBL092VmxSZFFibnhoNFVUNnRVRTRsY1BuTXVscmFUdHdvb2Q1?=
 =?utf-8?B?T0xzUnJvSUI4S2d1aU9UVlYyZWxxYzNVTDJmL3J4Q1o5ZUk1dU1pRGdxREI3?=
 =?utf-8?B?UDVjRjNjdjNIZk5iK01oZ2ZybXJYQkR6MEpuQXlnNmZBRitGeDh3WjBiUGVY?=
 =?utf-8?B?RHM5OXJ4TmduMm9LcjZKL1htOHZzRVlEY29KK1d6QmtWQ01yUkhSL080MmpC?=
 =?utf-8?B?SVpqTnd4M1ZqWXVBMnRPUnR1cWdaYmN3MlhlOE0rVlp5SmZDZ3NEZDZOZjhk?=
 =?utf-8?B?Y1I5VGpvbVFzMFJvVVg5c2daWXlMb0hRMEpXQTAwQ3JhUm5LNkhXaTA5U2N0?=
 =?utf-8?B?dlJFS3MrckRVZWhpdDlFeFgwRURkbk81TU14akVwQlcxT0w0aEYyNGhRdGZZ?=
 =?utf-8?B?WkNYRXZjOWdJczFna01kWkpZc05WOFFZUHFBTmJkVWZJYkZlNlkwOGZxelB5?=
 =?utf-8?B?R0Jpb1VtUzJiSHJIemk1ZUFDZHNpSjNKOWVscFpsOXVjWTk1WjVXQ0JTeHBF?=
 =?utf-8?B?eXJ1QkxiQkZXS3JPS0JoVndZb0FEb0I1cXBac05zWU1QWFNmVXQzUGR5c0NJ?=
 =?utf-8?B?U25kNHprTER4eThmUWxodS9XSThPTk5qYThyNitpeW1MOVBtNWFRQ3A2Zndu?=
 =?utf-8?B?bzJxNjlhVC80Q0ZWVXczZDJEL1Zub1ZKKys5b2VFVmFNWVVpOHpaVmlHV1FV?=
 =?utf-8?B?bTJHczNLUXgrNlNCQ1hzKzlYRjhpNFJraVl1YnQzVmZJS0FoRVVjS1dQb0cv?=
 =?utf-8?B?U1AwOXlTZkFwUjZYZzJvd25EbnlSSzFFaTBScXRhYld1N1QraFhmc2QvQjcv?=
 =?utf-8?B?ZHBGNkhvOHYvTHY5MG9mck9YM2R0dGxWQXZxNWYwVmlWQVZ0T3RTU0FwY2NU?=
 =?utf-8?B?cmhtRisyeGNJUmY5UEcyck1VWFRZcWtweUhjcDFFY29GVnNoNldrQWdQNUhh?=
 =?utf-8?B?L3hrRW9hWmgwU1pGTjdIUFN3bitEY2RoTlViejZxZjhOZ1N3aVZFbW9ia2V6?=
 =?utf-8?B?OHRTOHFwQ1g4cmx6TXVGcGJTL0FzRFR6R21qM1pOcjNodXBkWmt5bE5JeHFM?=
 =?utf-8?B?RUxhdEVFZlJLVjhpalFnbHZuc0ttZVlRZTNHdklqWThhZ1NSMmdZUFdFN0FS?=
 =?utf-8?B?K0pjMDJBV2JlR2hhN2ptMjczTlNOVzZ6Rit4aGdiK242YlpMcHhPdmVQazJN?=
 =?utf-8?B?OGFBblM5R1ZvNnZsektBSndXd1BMankzTU9BektTVHJCZUxKb0wwMjU3aTJ0?=
 =?utf-8?B?VU0yaWNtaTJyZ1RxMG5DRUkyVnVWSEJ0SnErbld2MXBUTzlUVG4xT09TMS9X?=
 =?utf-8?B?OVNyWjE2YlRjVU9TZ3VOTnZIeEg1SGViWVhyNUhucVYvM2plcVBGUERKOWc3?=
 =?utf-8?B?S2ZKUDE2MUhISFBCYnBLU2JTRlFwcEEvYndsZm5mZWhyNUhWZnEwNnE5bDcz?=
 =?utf-8?B?eGdnK1h6R0NkRWJVUWhYNUVTYVdIRTh0bVdEd3djTUhUL05JOVhMSkZuM0xS?=
 =?utf-8?B?amxpdUVzcytOSng4MUs3cVVlcC93dzZJTnZ3dHZEOW5WY3hsSEtUS1I5V2J6?=
 =?utf-8?B?MFE5WDNHNWRiSGlRVDhVOURCQ3pWRUZRaU9CZkM1ZTVOaEZkUkluaUh1T2VC?=
 =?utf-8?B?US9jQUpXOWlGYTNuOHVua2lIYzdUNTBlY3hIdGdNSHJ0ay9KT1BoMFV2dlNI?=
 =?utf-8?B?SVlXcmJCWk12R2xDcS8xS29XY25OaUF3a3dtZTVJTmRqRWxaQXhpdVpQOXJH?=
 =?utf-8?B?aDVoM0JmaG5XTTZERzZ0T1FFKzI3eHFsWkg2TU53bGpqVmk5RkFPQzRhWUtv?=
 =?utf-8?B?SXZYdlNvaXFsZ1RKUVB3NjcxSFk2ckNYaTFybUJtRm45S01UK2VFTnJ6dW9k?=
 =?utf-8?B?NXFVc3JrQnJ2Szd3YitGbUhYS1JtdHBPQWVpNFZEVVJ2ODhsbmtIbzZCMm9K?=
 =?utf-8?B?OFNZb1BJc294RkhmNlBUczJOSTFCVG10OFJLZWg4ZkhWd1BQdEtFT0NCejR6?=
 =?utf-8?B?WWd2aTJ0b3ZEbnR6cGRzNnlZWU5iRzhWYTdFR2ljQVJBUDU2bXhEMlJEZkV4?=
 =?utf-8?B?UmZuL0k5OHQ2UGVjbTJwemJReE1pcWs1RmhMTTdSYkZLb2lnR0pMYWh6dHpw?=
 =?utf-8?B?Mkl0R3Y5cXhZZFkxWGpnSW1SSmhCT1Vvc2h6NkJkbTkzRU45citTT2J0ZE5h?=
 =?utf-8?B?YVhjTEtRYjU3SFdPeHZORDBMcHpyclVBc3J5alRzRlVHY2Mxd1ZYU04zdkpQ?=
 =?utf-8?Q?aA1A+/PJGb2bs6+uTLtoRaeAddkexMI/MeaSN+f8a/1lX?=
X-MS-Exchange-AntiSpam-MessageData-1: fiapz6AdTmLgGQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6d2985-03df-4ee5-6184-08de88deda3e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 13:19:46.0609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xRHly5kiFV+Z9cS5emW0NQxpB1jduzfueP9zMDUcZk/ZNWzT6rElHg02G2EXbGmlY9HeSXO4hqDeTM9cQ5v5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374

On Wed Mar 18, 2026 at 7:53 AM JST, John Hubbard wrote:
> Up until now, only the GSP required parsing of its firmware headers.
> However, upcoming support for Hopper/Blackwell+ adds another firmware
> image (FMC), along with another format (ELF32).
>
> Therefore, the current ELF64 section parsing support needs to be moved
> up a level, so that both of the above can use it.
>
> There are no functional changes. This is pure code movement.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs     | 88 +++++++++++++++++++++++++
>  drivers/gpu/nova-core/firmware/gsp.rs | 93 ++-------------------------
>  2 files changed, 94 insertions(+), 87 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 2bb20081befd..177b8ede151c 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -457,3 +457,91 @@ pub(crate) const fn create(
>          this.0
>      }
>  }
> +
> +/// Ad-hoc and temporary module to extract sections from ELF images.
> +///
> +/// Some firmware images are currently packaged as ELF files, where sect=
ions names are used as keys
> +/// to specific and related bits of data. Future firmware versions are s=
cheduled to move away from
> +/// that scheme before nova-core becomes stable, which means this module=
 will eventually be
> +/// removed.
> +mod elf {
> +    use core::mem::size_of;

This import is not needed, `size_of` is already in the prelude.

> +
> +    use kernel::{
> +        bindings,
> +        str::CStr,
> +        transmute::FromBytes, //
> +    };
> +
> +    /// Newtype to provide a [`FromBytes`] implementation.
> +    #[repr(transparent)]
> +    struct Elf64Hdr(bindings::elf64_hdr);
> +    // SAFETY: all bit patterns are valid for this type, and it doesn't =
use interior mutability.
> +    unsafe impl FromBytes for Elf64Hdr {}
> +
> +    #[repr(transparent)]
> +    struct Elf64SHdr(bindings::elf64_shdr);
> +    // SAFETY: all bit patterns are valid for this type, and it doesn't =
use interior mutability.
> +    unsafe impl FromBytes for Elf64SHdr {}
> +
> +    /// Tries to extract section with name `name` from the ELF64 image `=
elf`, and returns it.
> +    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) ->=
 Option<&'a [u8]> {
> +        let hdr =3D &elf
> +            .get(0..size_of::<bindings::elf64_hdr>())
> +            .and_then(Elf64Hdr::from_bytes)?
> +            .0;
> +
> +        // Get all the section headers.
> +        let mut shdr =3D {
> +            let shdr_num =3D usize::from(hdr.e_shnum);
> +            let shdr_start =3D usize::try_from(hdr.e_shoff).ok()?;
> +            let shdr_end =3D shdr_num
> +                .checked_mul(size_of::<Elf64SHdr>())
> +                .and_then(|v| v.checked_add(shdr_start))?;
> +
> +            elf.get(shdr_start..shdr_end)
> +                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))=
?
> +        };
> +
> +        // Get the strings table.
> +        let strhdr =3D shdr
> +            .clone()
> +            .nth(usize::from(hdr.e_shstrndx))
> +            .and_then(Elf64SHdr::from_bytes)?;
> +
> +        // Find the section which name matches `name` and return it.
> +        shdr.find(|&sh| {
> +            let Some(hdr) =3D Elf64SHdr::from_bytes(sh) else {
> +                return false;
> +            };
> +
> +            let Some(name_idx) =3D strhdr
> +                .0
> +                .sh_offset
> +                .checked_add(u64::from(hdr.0.sh_name))
> +                .and_then(|idx| usize::try_from(idx).ok())
> +            else {
> +                return false;
> +            };
> +
> +            // Get the start of the name.
> +            elf.get(name_idx..)
> +                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
> +                // Convert into str.
> +                .and_then(|c_str| c_str.to_str().ok())
> +                // Check that the name matches.
> +                .map(|str| str =3D=3D name)
> +                .unwrap_or(false)
> +        })
> +        // Return the slice containing the section.
> +        .and_then(|sh| {
> +            let hdr =3D Elf64SHdr::from_bytes(sh)?;
> +            let start =3D usize::try_from(hdr.0.sh_offset).ok()?;
> +            let end =3D usize::try_from(hdr.0.sh_size)
> +                .ok()
> +                .and_then(|sh_size| start.checked_add(sh_size))?;
> +
> +            elf.get(start..end)
> +        })
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 8bbc3809c640..c6e71339b28e 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> +use core::mem::size_of_val;

And this one is unneeded as well. Actually I mentioned that in my v6
review [1].

[1] https://lore.kernel.org/all/DGZ150DHI878.2YXL15FY7W0GG@nvidia.com/

