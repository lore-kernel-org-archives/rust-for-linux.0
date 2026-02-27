Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022079.outbound.protection.outlook.com [52.101.101.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED644B66D;
	Fri, 27 Feb 2026 16:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208059; cv=fail; b=s3ljM/IXqfnbkFyy0ORfsgRnCnvXahq5seeeJiwVRs7wu+uvY4q5eJwfPMZmgBWO3+BXwF2qbiIuuz5vVxGSKpDZ1TN/NlHYNig3Wr+AMlmaTS5NQucUgzF10BtknVxMg50N3Ui7JXm+GiySms9EJQiGWExzj6++7c/Ub/5mjLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208059; c=relaxed/simple;
	bh=1N4n/AY8LzlO/aI2qaKi3Xi/HEW21+wp5+V5Fr1CI3w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iwFp5yq7Np3eIGuxlV1ntkTcLrz8QvNbBS3m+FPD/w2r3tRoSwvIJ0J7Qdtu/v3WB/BtrZKvCXmk6blcQ278C6hnUVtA9J171aRrv7FWOo98t8yw5YiqkEJmyRWYrzI3O/dYoOGwt8eBjALnaOVeQxuAK+KnD3liNk5AfF8n8Tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=JqkMGXVW; arc=fail smtp.client-ip=52.101.101.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="JqkMGXVW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUI11YRJc34Sq9GTjoYuRtSDYNsDb4iBmOESY+iVyZefweie9kWeI8l4YcF1oh3jzHTjx9bcdoRo23zvvVfT1tDM6mvfKpIsef/Y1o8mYpCMwZaHnGprUNrTWo6LKFIiGywJbualNMH7IZvAmflU+TdDQNk+T3ApR+IvULjYtJYFTtro9u39kYbOdRv2feM1vVhqtEOcFNljAisB2Iwk95BH94DD4g52KpG317hSOK0IZVoXpBzN6QK2TSIvm/0R6H4rccjNto2zeMUIvXDlKueuU7fPVN2XHC0ORaiuF/8pYu9MNmRFYnpFMvo0LhUmtTmna/RN8krRkOz9BORVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClLhfUqvhOjGgBPkoGUu9fG1mPBXrT9BdfF8/y/ELGI=;
 b=J6sJyDrdkcNG0kpwS2yQY1CZd2HjV5CVUK8769AjQUVkCMAeuXkfWa0xZZ/kmzXI90J6Og1L3HbgFgLj3eiGV49KbgzD6QQk7I9VgAnjMDzeoiUvvSuS6skm3urFY2r3BFoVsJIHkzKt41S3JnVyqZ09eN0TDiJNBPARP9CzGlIsj1PXb9/ik1Y8418oOWmz81Nh5nighPEVbel+wsylLZDxOALNelXJjXm2I/hDAkiTkPaRYtQVxlF2AiIclmjiof7w8ho0PpHfhnCpylTUfy1f6F/DUrgoyfeXOmEoggs90A34B+7Stxc883lc/sunG0TGZfN1DvFKYgR5dfS/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClLhfUqvhOjGgBPkoGUu9fG1mPBXrT9BdfF8/y/ELGI=;
 b=JqkMGXVW2TPyswfW67CGlCq60bx662FFxDGrZZay/1lvuVonsU02c7Ui4MCttZU+iRiwNpDybTpu2NA+/OvGNplmmPTICS95sOlU24Nl0daTHeJHurr6z29Chf6+uFhJ65BR98Q4SB3/iwH8CtQynKZ2c1THyuHH6v/WYl3HoFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5766.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 16:00:52 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:00:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 16:00:48 +0000
Message-Id: <DGPVBM93AJXE.35EXIFCRRT9FU@garyguo.net>
Cc: "Tejun Heo" <tj@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Benno Lossin" <lossin@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>
Subject: Re: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-2-87de133f7849@google.com>
 <DGPUOSG5I4GM.1N5AWMP5ZFY4M@kernel.org>
In-Reply-To: <DGPUOSG5I4GM.1N5AWMP5ZFY4M@kernel.org>
X-ClientProxiedBy: LO4P123CA0466.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 4139c6c3-d5a0-4f71-a0c1-08de761961ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	uEsURIp7rrHQDtGYlFX/EN4nmxdHf+FMfDzeLYbiTAS+Ke6H8OOuYz8o/LKrGFzDETKlJwnymjlTJfXrZMl14TrfhZJ1Xd1bBs0u8jeN9mYRtYFPiuXeElnT5vSSjaFU2UT6RTdQ4/6QUWa6avLrrSMwLMuHlwaAitUcdN8JPXHhdXZ+RujKNeJ35MzmkHbSaYwQ8FLUeNz2hQl7YeaYetFeYRYgFM6lDmyBTjPnOtWdew3rdUe9wzrrbrug/9e42o0QMSyT1paSG/u0FOKd0vl5/0ebFcfeMT+h+tpeJZ5de3gWzjT6rZ8PJST4MXQNQEhSU5+CZ2vjdVJ1aHeyLxCAkLl/BmjHqVcEyVeIBlu+yIAmpnai9gecrw4Hbu8jQVFTo3Kt3rLriV75a5ZMwDxJEw89n8O6D5YFlxGQUDj55iMkdz93T0/AZRB/HuOjrm+Fjl/bItRxtwyasfYm+pw5ENoI+SlhPBsL6KF2CLhKPoc8FRZLpbiSb0fQvyUwL2T5GkqJ5Ma3t70MDQM4IJ/yHl3bDjRt2BsSzTmUb6KAX6A22z8zcjQBhg4+601Ahi/w7AOgHqx5h6sAm89hQnqN5vumGM+csYT6kKpNjOas08a8awQOAaSR2qCRZLQ7HZs1iOuKihMeBf/ET1xep2ZIcbKRhihOwbsi7pbWy/ztXnRbGTSCfc1GIWrPy79BPSKq8n0SmJNo9JjPIawO91cPHtmJJR1ZLNbb/UfXvYc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTA5TTJXelUvZmhBcDdqME9UZFVFcWswNmltQUphUEx1QllMOTh3NUFIdzhN?=
 =?utf-8?B?aUtyU0RYanV1a2twaGI4WC9iN0NBNXhjUkNnTkVZYjZzNTFKY1NHd3pQS1FQ?=
 =?utf-8?B?U2JySWVrNkp6dU12MVk3cmYzZ2FROEE4NXhobzN4bnBQTWJFYzh5TlZ5R2lw?=
 =?utf-8?B?akRldHY1enJvNmxSdXJPSjBmVHBQUWxCdkMzdWtLNXh4cU5ld3BTUE5oQUpp?=
 =?utf-8?B?SzNvVG9TSzdFRDdBTUtVQ21GNEc1dzU5SmZ2eS9MMXRMTkRubS8vVmZBVVhP?=
 =?utf-8?B?KzRseUxMeEVqK1dCS3J4VHhsQ0U1N1cwWks0TnMyOTJnVEE0dU45YStHN2Vn?=
 =?utf-8?B?NkxFejNCbjdNVkgxVVpUWmVodzY3b29ab2NBVTFyaUFQVXpENVFJWEJVRWw0?=
 =?utf-8?B?MmdxcmtHdHVEcDNsdjBjQmVxRGphR3N3a2RXMSttVEdJbloraS9wT0piZjdV?=
 =?utf-8?B?Y1JZWFhocm14TCtDcTN6MytIdlhpckxlVmsrd3NtV2VMdE5PdnY2dmlTNVFs?=
 =?utf-8?B?VWhxd1UxbUxqOXJQdXRoMkpzMzFtUzdkcHBjZEs3U3ZXS3lDV0YzdVcvM1p4?=
 =?utf-8?B?NVBXWEZxQ1ZuQXlRUkNJZDM4d25ua3BlT3hvWXF6UFZVRmVERkxabVZnbHE5?=
 =?utf-8?B?Y0NkN1NkMnY2V3NJanA3L21rVG9URlE5YzZKNVBPcVMyQW1CZmQzZG91d3Y4?=
 =?utf-8?B?ajF1RlZrZkFGaEhFMFFPNVVzNUZCL0w0aXBZQ2hLdVFCeWxSZG43UHZzeGJP?=
 =?utf-8?B?UW1LWlhybUFxUmxPZzBzN1V6eERacDBnZ1NlT25jRU5jQkZ4SGVTbUJ5U1NH?=
 =?utf-8?B?M2tPZmZkTlZHTTl6MWtVRXRGUUpkNUtFbG5HellIemxSNzRtVFU3VklCdGxX?=
 =?utf-8?B?cXBrSjZldlUxR0prZ2hHVWNDdy9hWDExcEk3UC80NGltNnhlTzBjNUVrb1BG?=
 =?utf-8?B?Wk9EL2lWZGJtK3BDY2lwUjNNcDdteDBYUUdwcmN4aHRkbG8yTFppR2hzNUp6?=
 =?utf-8?B?QzNacHM1c2NKdW1vQURZZU83Q3dMZXdQOU5pN28rYzEydGtpTENLb1JUc2Rr?=
 =?utf-8?B?WDdoWGMwY1p6blczSlpCM2RNN3duNlZiQmhLZnhuSlFCaS9rTS85ZXd6ZG12?=
 =?utf-8?B?cE91MkxuMFRmV21GdTVYcGxkb1cyK3hYNzRJUHJWaUE0MllyckhLKzVmSGNO?=
 =?utf-8?B?VnZXVmdKUFMvYXYzRTl0S3d0eEZFWFY2elFZTUZOZU9pNU8xNlFESU9wTm1v?=
 =?utf-8?B?MEF2WDVzMmk4V1FQVnF4aXZWcG83TktBTkx1ZTZGdjhEV0VkaVd5dzdnaVpT?=
 =?utf-8?B?eWtXTS9rYVVjM2ZsejFiNVpuaVZ1UXJWRzZCcGw0UkErbXEvRlpuNzBvU3lN?=
 =?utf-8?B?VlArNVFqR2NzcGVWd1FDdjViRFIwZEJoSmtIclEwaTZNK0NlNWNES2JvTW04?=
 =?utf-8?B?aENyUHV2UWZjRGx0bERpSEpLWGRSUmJvd0NOY1Bya3REYzR2RC9aUlBwczRQ?=
 =?utf-8?B?NDh1RXl6a2dyem0ydG5NVEhuK1MxTmRRSmppRnNsWmx3NDhHZ3UzZ0dncEI2?=
 =?utf-8?B?WmpEY1hYRllzRjZIY0hvQjlJL00zWFcyRkJoNHZYQVloMDVJeC9TUkx3VlFz?=
 =?utf-8?B?OFNBemNUYTg3eXNBM3RzQkhGTTJSdlBtYVErcHMrT2tFK1piUEVKT0FZYlNT?=
 =?utf-8?B?L0Vvc3J0YnRkNFVYVGw3UkRMM05UR05oUW9Ob1dZb0pHbTF5YmJxKyttTndP?=
 =?utf-8?B?MzUvTUhpZWxhckFnRDROMXl0SnpkWjVoeTFjZjk5MGlqeG5OVWVwQ2IzNWF3?=
 =?utf-8?B?bk1VN3FBKzEvYzljV0hWOG9nV1NVYjIrRkUzM2VwMDBiRVdZMkhmZ1RHbkxJ?=
 =?utf-8?B?WW1UOWh1aGVnSU1ZcU05a01lalAxZkI1MTVTSFBsSmx0ZDMzY1F6cjdmZm1S?=
 =?utf-8?B?Q3V3eFlYZXZ3cDVTSklTWVk4NUNRZ3NTYUNSTXFtOXRGdlJvRXJlYkIrK2xH?=
 =?utf-8?B?cjVhRURya2YxS1loY1grOFlBYy9xSHdTcHZIRXVHNlcwY0ptNHRJZ251OFdh?=
 =?utf-8?B?N20xbWROV0R2R1NFVzNmMnpYbVZaQTRUeFdXR1lkeTl2QUtsRUxiQWZtM0NH?=
 =?utf-8?B?RTBmZ2lLYjE4VlhoWHRNUmVpN1RIcXV3U2NNRVlOcXA5N3AyTkp0eCswNWlG?=
 =?utf-8?B?dGEzc2V5cmp0cW9XS0NXbnNhZnVsengzTXNTbnJSbDVuYzZhSFRUYXJncWdO?=
 =?utf-8?B?VzJpQ3g5NUhIV254UHd6NmgzaWp2RWlUTEtHemJZaHovME1YRjAwQzZWeHNs?=
 =?utf-8?B?MGpWM2RkaUttZi9BVGFxVzNJSDA3V1RBTytsY3hJMVliZjFET2xsUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4139c6c3-d5a0-4f71-a0c1-08de761961ba
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:00:51.9990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yEKFBI8DHN0PuAEwYqfheGRoKOlupoOSA2jJCy5c9Cv9PreZ6ofxhiWOqhGXqNBByQu/wAl9M9N8wYTYjhK0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5766

On Fri Feb 27, 2026 at 3:30 PM GMT, Danilo Krummrich wrote:
> On Fri Feb 27, 2026 at 3:53 PM CET, Alice Ryhl wrote:
>> +    /// Set the maximum number of active cpus.
>> +    ///
>> +    /// If not set, a reasonable default value is used. The maximum val=
ue is `WQ_MAX_ACTIVE`.
>
> Should we just mention the default value?
>
>> +    #[inline]
>> +    pub fn max_active(mut self, max_active: u32) -> Builder {
>> +        self.max_active =3D i32::try_from(max_active).unwrap_or(i32::MA=
X);
>
> The workqueue code prints a warning for max_active >  WQ_MAX_ACTIVE. Mayb=
e use
> debug_assert()?
>
> It's also a bit unfortunate that alloc_ordered_workqueue() becomes
> .max_active(1).

I think ordered workqueue still to have __WQ_ORDERED flag, too?

>
> At the same time having a separate ordered() method competes with max_act=
ive().

I don't think its too bad to have both, and before constructing checks that=
 it's
used correctly:

    warn_on!(self.flags & __WQ_ORDERED !=3D 0 && self.max_active !=3D 1);

but type state works, too.

Best,
Gary

>
> Mybe a type state, i.e. Builder<Ordered> that doesn't have max_active()?
>
>> +        self
>> +    }

