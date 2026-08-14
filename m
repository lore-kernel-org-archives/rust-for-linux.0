Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022074.outbound.protection.outlook.com [52.101.101.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791BB3B0ADE;
	Fri, 14 Aug 2026 23:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786749915; cv=fail; b=tENtv4s+osSbW/HJVazXNQgPpaW1gHx5YqMvoNVeifFEFNiQ0bDeKmc2LxBiOQbFb+cIn8nY1FuzuibskD18B5mx88lKjjaFa0KLF2w0Nn+SlRaJXh+IkwcLrg9MBgHx1JAdg53/E+3lgpXlx5H7Brm/fECqeYqxOKMwv1N8rOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786749915; c=relaxed/simple;
	bh=cq9CBCrfZ4QjCgYIZtbpGCWuGrTaRU+gALOj4pbOOAU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=E+hFveGxKdB5sXJL7crEWQ2jUQXexvQajyv9nEjbiLz5MGKwdt5S0lbLOi8x88D3aTkDqmjlaWoLCcVi2DZ/+zX/j7CkBliFtrM27Ox5N/jIax7addUvWv+oZEJkGlVNb6CMku2CMC1qYsBl+47CKjyqt+ciFrfToYKMnfU7vHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=eDQ7PKUq; arc=fail smtp.client-ip=52.101.101.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eDQ7PKUq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqbPBfWeba1Ybn2fuojNhSMx3TZj+Ibk74WeXv+2RKVAO4EBt2KTbIrXXK1DMX7J5GffMIh8aYzrymBwPeuUpMak1mYyntq7hMkx8xLwSQa6CuLx0wHu0oxpve+UgTxm8r8ol5l6wZjtPWBe5ZpQbHEfijFzmzkwbxOE33JkP2bjAds/bCzcqFV/W16qk0dJHe1NwiFlXCDKE15qKPLQCmSeaoHg+50Hj8rjnBiJiH3Yepr0mToYMdFW7KIYZXiYmJt2z/IEM8nvNH1HCaVLDo7Lp5eBDY+HF4mqjDvpNzgLu8qWU5vOzaHRBKr44qxKbsDPgB9iW0x8hlAtIDUP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWs8hvzWLD159LMWX0jrq45LaYXObwiETaqLZ+sA/v4=;
 b=kv1xKTcuqb5xZmWs8zCuHlHwy42EVwwYFbfzHopg2KYSXPOCJAUpYbtGpaI6h3SafhNelgIdttqbY4y7ugtMKw80lClEHP736hoEDs7G1r0nWJNQrvCdILBUXpcEpif58bNji6EBrHTyu6KG5xgbU318OA1NMDtEzVlk8oTKfi0h7Yj7VQHntC41rQDOj71N2j+3Uc33WHO3C09sKUuir9q+tHrreruU+J1shTU0+KTmyNfKHuDG8OwB3UWhclaiDiy0zplNRAHxGz22gp9wFz67NtIBpUYEvBUn4SlsMYFs03h+z5bLaX/k4rxT8/z5Xr3sjKZz97OZ4j9J+BEoKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWs8hvzWLD159LMWX0jrq45LaYXObwiETaqLZ+sA/v4=;
 b=eDQ7PKUq4pV3No5xcukZJI0ZTmGknXLyyGp/s3UOpogg3VoUIUcwbwqYXGfkH83MHSoB88KFz8NsdggtGPH2Moa28NTmeOcJod8k1rCEjTEGSleCS+WGRj6i/9PuHo42bLYiSmFuRk3LzAYvasBJTRPmOszu4PbLZpylT+OuVU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB7370.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:33e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 23:25:01 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 23:25:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Aug 2026 00:25:00 +0100
Message-Id: <DKP1Z8PZZX83.GZ924NDYZYPB@garyguo.net>
Cc: <dakr@kernel.org>, <jgg@nvidia.com>, <dave.jiang@intel.com>,
 <saeedm@nvidia.com>, <jic23@kernel.org>, <gary@garyguo.net>,
 <joelagnelf@nvidia.com>, <aliceryhl@google.com>, <kwilczynski@kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
 <acourbot@nvidia.com>, <jhubbard@nvidia.com>, <zhiwang@kernel.org>,
 <daniel.almeida@collabora.com>
Subject: Re: [PATCH v8 1/1] rust: introduce abstractions for fwctl
From: "Gary Guo" <gary@garyguo.net>
To: "Zhi Wang" <zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260813152312.1311142-1-zhiw@nvidia.com>
 <20260813152312.1311142-2-zhiw@nvidia.com>
In-Reply-To: <20260813152312.1311142-2-zhiw@nvidia.com>
X-ClientProxiedBy: LO4P123CA0311.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::10) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: b2010374-23b8-41ca-0588-08defa5b4360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10070799003|56012099006|10067099003|6133799003|3023799007|18002099003|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ti1T6HzL45bHAXOlHbqqKZr0/unPggIGI6TKN61Mj3YGwqdlVc1YpRk0h8P5EI5og4aOGfMvJxLlq9j1g9fLRIFUTW8vee+Ip0pqVNx9Njb54HewVXscmYfvflRzGKZN+uRca+7VKcLYlZxqRuK/cJTeMwky5SlynOodkfBuXEGCVlh1Aj5eXvCIiTRwtOn8cnzSQGxdTdH4Vj6/dqGYMRM0Db4ONIERm8V3GaOga6krmR8DNnjwaihrJVUO6UE4MlfbmX8qCDElnvlpa5fhUfqms6AICTqqrA9J6JnB3pt5QweHrs9PtFHtkXCb3SLkW/sRwuud84WyId7kusTkix0dI5IYaSKKS0VPZ+FR18EN0aobRivkfrRSSIj8WlMYUA+4+pqdvPqTMgD9Kym30qCP8XZVDX5Jy6ea770fTtCCEemaF7UuiMNZDeGZzNVZleOcBnnkUVDmBZSQzAncLdxvjkDxXVuhca7ATyVXdP8kz/vgGJb7luhTzjbmettgoZLc2ttD0AUnJbmnXVfjSPXludGlet9TMo3xJruhkqv9SNwUPD6tLr6wEKRIcsvma9XPOmEMIg4YwpxefeD+WMkxVhT27q1zdVUC/aiaVlSn7YWg0bEPKr03011sXyUt/lUiMln4bgjMOM9v1IMR3a3ep08IOeYVhmeePmsUMSE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10070799003)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(4143699003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWRqaUE0VDVYYWhyOGNpZngxRjV6NDlvVVRTV0Rtb0V2TVNFWVBNN2FOOXNC?=
 =?utf-8?B?SmNBd3RFU2ZvTjJOdDVtOG9hMUFmcnZxcUE2dURkNmpXU3dOSVNyNS9JLzVq?=
 =?utf-8?B?YnhqK1gwVzJkSFZXZS9LMzJ3WE1mSkU3UjNFWHV2cVpvcC9tVlNrV1UzVm1i?=
 =?utf-8?B?REN0emdFS01TMmlHdCtNSlZoUGFwanRtcGZKY0UzSzlMblA3bGREaU9wc2hu?=
 =?utf-8?B?bCtzeWRzbWNiU3RWUEtNQVc0WmlKRFMyNUdTY3k3U1Q3bDhya3MwRkVEUHRS?=
 =?utf-8?B?bnpFejBvZFh2M3pEcFM2MGVmQVMzdzZ2WmlSQzJwOVh4eFNnRWxCZjh5bEdF?=
 =?utf-8?B?R0NtNVdhbFFuM3B2Q2V0bFdtNHEwckdmUkp5ODJ0RDFVeC9yOEoybzVDelZY?=
 =?utf-8?B?TWowcXlJTW92cDd0bWZxajZaa2xGR1p4ZU43elRlY0xQbXY5RFhuQkt2K1BY?=
 =?utf-8?B?c2ZCRU0yTDJZSlRXMEJZbCsyYnExdVRTN0JraHdrRmJnUlg3aStzbGp5SXNK?=
 =?utf-8?B?dERoS2hLNFlrY0g1NWRYNGl3M3UrRDZXYVMwdDdIZUVOVHlLT1lQUE81Y3NR?=
 =?utf-8?B?NmhoakhFSmdDZ0hWdC92UkI2V0xnbjFIMTZyRnd4NTEwK0VLY2NZUi9WMVEy?=
 =?utf-8?B?TUVSOGRLY2wwN1NrWmhRUnRkUnZhMGVDY1o2NWxyc01RZXZwdWx3bFRKTkVK?=
 =?utf-8?B?SHlhL0laQ3dOeXYwQUtFWFNpNHNDcUdXRHJEMU0xbytKVk0yQ1Nmak51QkZZ?=
 =?utf-8?B?OEFRSVZEN1l0aVJKbUtTYnV5REphaVFlWERjL0ZzUXpWQzFWUzBGc0lpMnBn?=
 =?utf-8?B?STVUSTFsaU5NZGRrSFRETFU1Y3lPYStXTkp6Q0plU3ZJTlVQSFhrNWxxdDR0?=
 =?utf-8?B?THorbEF1eVpobTFzZmhwY0RGclNrQUNOa3d2d1MzWU1GaXJuL0dGenh5R0Z0?=
 =?utf-8?B?czRMald1cVM5bTE5UmltQUhMVFVJeEx5QVBrR3FVOVVVd2hSdDlTZmUyNUpN?=
 =?utf-8?B?MVVyZG1POUlYSEFWQUZQaGdKYTIyTUpmeGJ5bVJvUEtSS3R2OVBHaFJ6dW0r?=
 =?utf-8?B?RnljNHhHRlNiMGpwQ0M1QllCZC9acTlpMDE2ZHdmQ3Y3ZFJvQk5heDVaY0VY?=
 =?utf-8?B?TlRNU1NMeGJJcVNKYjcxKzFpRnJyWlEwM09qdkdhb3dzU3dEV094RC9nMncr?=
 =?utf-8?B?S2lrTFJpdHYzbXBobjFVRmNaMC9uTmxwVnZTTmJSbDd2SGRUS3hFYjNlZCth?=
 =?utf-8?B?dFFXTENBUTZyeUZ0UHRCQ1ZyUlFYVVl0UXZPQWgwdzhlQVBiU1ZJbnBZZFdI?=
 =?utf-8?B?ajlWeWtjdW1kTEZWTVprNEE3N0M5Z1NuSnZrQ1JmUFpoNXVvNmYvWVBFM1Fs?=
 =?utf-8?B?TkhIRmgzNlNEcUw4aTB4VW5YbGplUGR1cExjcFIrM0JueTNLWlIrVWprMVBl?=
 =?utf-8?B?RTdSenZkcUpSeGlIQVBQSjA2bG9UMm5CdmRYcmk4b3U5UVcxU3dGY2I3Q3Va?=
 =?utf-8?B?K2RHV2VUSUVCQWlLY2lxTGxDZjI0WGQ1Y0J1RE5TMFA5Y1picWdzNXhHZ2pO?=
 =?utf-8?B?VWdZWmZ2b1BIbEZUemF5eGp0Y3ZydUJmYXRnSktjb3FtWDEyeGc3aFRkb2g2?=
 =?utf-8?B?Uk40T1VVaEJpY3EyOUljRU9nQ1htZGhNVkMyU3BGdUEwaVpWYkU4eHRnUE9N?=
 =?utf-8?B?alY5eUg2bDZHT1REUnI4RW5MQVF6SzJyVlpXbkpmU21HSllUY3BEaE9ZcVI5?=
 =?utf-8?B?UmlUbVo4WmVrNVNNSXZrall1S3N2K0FqaURrUlQwN1E1SnBXWTdmeUtUUWxy?=
 =?utf-8?B?WDRMZWNNbFhqK3dGWTMvMG1Oc1F3dXl0QjkzTTFkU2dTWUl1SWdNbndRSXVD?=
 =?utf-8?B?a1JNbmdzQkpaME5WYk5DRXExUWtuL2huOCtWMS9hb2RUL3lQM3oxVzFnK2JJ?=
 =?utf-8?B?ZUxEY1ZXVVJrWDZFNVQ3ZzBpa0xWNVUwZFM0aFh3Z3JhaFU1N2I0enV4RUhL?=
 =?utf-8?B?akxCYkpvVmZDT0YwUDZXUzF5V0xSeHlCNDVrY1dxL05oeGE1dWJrY2Rtclo4?=
 =?utf-8?B?V1lHeWZqODdBQXdMTVlyTkxVbjFneW5wS0twMjV4N3RKeTQ2bGYreTk4bFdh?=
 =?utf-8?B?TTZvQ0lXWExiNlJYM0pVRkJLYXFPb3g5c3FLQUNNVEEyeUNLWGVaOXJ6d2dm?=
 =?utf-8?B?cHFPeTZyZzhaY1NMdktkcVhQU3JrbmU3SEloV0x4elBOM0dMOTNpTTFUSVpL?=
 =?utf-8?B?d3ZnUk9WR1lacTJiY1ZyWm9tNTNUeXdDTHF3T1pGdm8rNUlVVUVJV1F3cFhp?=
 =?utf-8?B?c0IzNForUE83L0wvTFFxK21uYmJiRElBUTVMMTdFeU1KNmFBdFdPUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b2010374-23b8-41ca-0588-08defa5b4360
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 23:25:01.3508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6tG9FYFmm6dijXV0yeTLdCk0gem0km44XRylI/vflRmVa8nhelzMc95qRD5YVeLW8Z360GP+sJXHEVoXiFGzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB7370

On Thu Aug 13, 2026 at 4:23 PM BST, Zhi Wang wrote:
> Introduce safe Rust wrappers around struct fwctl_device and
> struct fwctl_uctx. This lets Rust drivers register fwctl devices and
> implement firmware RPC callbacks through a typed trait interface.
>
> The abstraction keeps lifetime and reference-count handling inside the
> wrapper, exposes pinned per-FD user contexts to drivers, and validates th=
e
> layout assumptions required by the C fwctl allocation model. Allocation
> sizes are padded so the kmalloc-backed C allocations also satisfy Rust
> alignment requirements.
>
> Registration owns driver private data with a lifetime tied to the bound
> parent device and verifies the parent identity before registration.
> Callbacks access that data through a higher-ranked closure, preventing it=
s
> erased lifetime from escaping, while Device remains only the refcounted
> fwctl object. This avoids requiring Rust drop glue from the fwctl_device
> release path after unregister or module teardown.
>
> RPC callbacks receive typed scope information, a mutable request/response
> buffer, and the userspace output-buffer size. Response pointer conversion=
,
> length validation, and raw output-length handling remain inside the
> abstraction.
>
> Add the Rust sources to the FWCTL MAINTAINERS entry and add myself as the
> maintainer for the Rust abstractions.
>
> Co-developed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://lore.kernel.org/r/DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  MAINTAINERS                     |   3 +
>  drivers/fwctl/Kconfig           |  12 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/fwctl.c            |  17 +
>  rust/helpers/helpers.c          |   3 +-
>  rust/kernel/fwctl.rs            | 593 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  7 files changed, 630 insertions(+), 1 deletion(-)
>  create mode 100644 rust/helpers/fwctl.c
>  create mode 100644 rust/kernel/fwctl.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5114e6db7307..bf487b8b8e9a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10737,12 +10737,15 @@ FWCTL SUBSYSTEM
>  M:	Dave Jiang <dave.jiang@intel.com>
>  M:	Jason Gunthorpe <jgg@nvidia.com>
>  M:	Saeed Mahameed <saeedm@nvidia.com>
> +M:	Zhi Wang <zhiw@nvidia.com> (RUST)
>  R:	Jonathan Cameron <jic23@kernel.org>
>  S:	Maintained
>  F:	Documentation/userspace-api/fwctl/
>  F:	drivers/fwctl/
>  F:	include/linux/fwctl.h
>  F:	include/uapi/fwctl/
> +F:	rust/helpers/fwctl.c
> +F:	rust/kernel/fwctl.rs
> =20
>  FWCTL BNXT DRIVER
>  M:	Pavan Chebbi <pavan.chebbi@broadcom.com>
> diff --git a/drivers/fwctl/Kconfig b/drivers/fwctl/Kconfig
> index d1b1925bdaec..cac38cf79f30 100644
> --- a/drivers/fwctl/Kconfig
> +++ b/drivers/fwctl/Kconfig
> @@ -9,6 +9,18 @@ menuconfig FWCTL
>  	  fit neatly into an existing subsystem.
> =20
>  if FWCTL
> +
> +config RUST_FWCTL_ABSTRACTIONS
> +	bool "Rust fwctl abstractions"
> +	depends on RUST && FWCTL=3Dy
> +	help
> +	  This enables the Rust abstractions for the fwctl device firmware
> +	  access framework. It provides safe wrappers around struct fwctl_devic=
e
> +	  and struct fwctl_uctx, allowing Rust drivers to register fwctl device=
s
> +	  and implement their control and RPC logic in safe Rust.
> +
> +	  If unsure, say N.
> +
>  config FWCTL_BNXT
>  	tristate "bnxt control fwctl driver"
>  	depends on BNXT
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 1124785e210b..3d0511e4ab4f 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -60,6 +60,7 @@
>  #include <linux/fdtable.h>
>  #include <linux/file.h>
>  #include <linux/firmware.h>
> +#include <linux/fwctl.h>
>  #include <linux/fs.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> diff --git a/rust/helpers/fwctl.c b/rust/helpers/fwctl.c
> new file mode 100644
> index 000000000000..c7eecd4336a7
> --- /dev/null
> +++ b/rust/helpers/fwctl.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/fwctl.h>
> +
> +#if IS_ENABLED(CONFIG_RUST_FWCTL_ABSTRACTIONS)
> +
> +__rust_helper struct fwctl_device *rust_helper_fwctl_get(struct fwctl_de=
vice *fwctl)
> +{
> +	return fwctl_get(fwctl);
> +}
> +
> +__rust_helper void rust_helper_fwctl_put(struct fwctl_device *fwctl)
> +{
> +	fwctl_put(fwctl);
> +}
> +
> +#endif
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 998e31052e66..b7d9512da9a6 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -62,10 +62,11 @@
>  #include "drm.c"
>  #include "drm_gpuvm.c"
>  #include "err.c"
> -#include "irq.c"
>  #include "fs.c"
> +#include "fwctl.c"
>  #include "gpu.c"
>  #include "io.c"
> +#include "irq.c"
>  #include "jump_label.c"
>  #include "kunit.c"
>  #include "list.c"
> diff --git a/rust/kernel/fwctl.rs b/rust/kernel/fwctl.rs
> new file mode 100644
> index 000000000000..e6a8513a47d0
> --- /dev/null
> +++ b/rust/kernel/fwctl.rs
> @@ -0,0 +1,593 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +//! Abstractions for the fwctl subsystem.
> +//!
> +//! C header: `include/linux/fwctl.h`
> +
> +use crate::{
> +    bindings,
> +    container_of,
> +    device,
> +    prelude::*,
> +    sync::aref::{
> +        ARef,
> +        AlwaysRefCounted, //
> +    },
> +    types::Opaque, //
> +};
> +use core::{
> +    alloc::Layout,
> +    cell::UnsafeCell,
> +    marker::PhantomData,
> +    ptr::NonNull,
> +    slice, //
> +};
> +
> +/// Returns a kmalloc-compatible allocation size for `T`.
> +const fn kmalloc_aligned_size<T>() -> usize {
> +    Layout::new::<T>().pad_to_align().size()

What's this function doing?  This is just identical to `size_of::<T>()`.

The layout from a specific type is already padded to its alignment. You onl=
y
need to call `pad_to_align()`, say, if you are computing a layout or increa=
sing
the alignment of layout.

Best,
Gary

> +}
> +
> +/// Represents a fwctl device type.
> +///
> +/// Corresponds to the C `enum fwctl_device_type`. All non-error UAPI va=
lues are represented so
> +/// Rust drivers can select a device type without passing an untyped int=
eger, while
> +/// `FWCTL_DEVICE_TYPE_ERROR` remains unrepresentable.
> +#[repr(u32)]
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum DeviceType {
> +    /// Mellanox ConnectX (mlx5) device.
> +    Mlx5 =3D bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_MLX5,
> +    /// CXL (Compute Express Link) device.
> +    Cxl =3D bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_CXL,
> +    /// AMD/Pensando PDS device.
> +    Pds =3D bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_PDS,
> +    /// Broadcom NetXtreme (bnxt) device.
> +    Bnxt =3D bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_BNXT,
> +}

