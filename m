Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021137.outbound.protection.outlook.com [52.101.95.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B365B30BBBF;
	Thu, 15 Oct 2026 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073046; cv=fail; b=aE3P+w9a6LtynNh8NchZRQ3HrYBJPEtJM8RIEp7gGlfs5NOW87g++YL1iGNyONeER4u7cKM7q70XaTxxpEGGyHkLKEhtLmw53X+y+WiKpbr1GWz4f6/0kEDHGQ6q6OT9esl9Eax+ccBegvYwg/kejiPYi4ro8tTSRBkKbs7auwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073046; c=relaxed/simple;
	bh=e4A2E2HzUVAB+EVCtRJtgDtKzQ+8MH0HDtbvZmg2IvM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=gVvO3MZzTkyx0yVMTEWk5N+hKJ7uJZKXWpVoW1LE6GD3cHKOFoDdLPMvO0tpqOCyVYFeIMUuJSB4OVfhVTpSZZS/pBysoQYPWvjIkHsguhRqBPqAmRim15vRPuH2HgNflB7nICGpA5Ulj6vmgtwtjbEhdKHueiI/Mokm/pcKHwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=VSwK5/H6; arc=fail smtp.client-ip=52.101.95.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="VSwK5/H6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebjoQILX4kBj/vEG8bUtahNfukZenWUD6N/MVlQHGTbf2GqE6VXaLID6W8TQwfR6+31WBl0bF5LY3Y95aAuo/D1TQjdTpqteGd8iWaRchGYGinWLAicUic/xBfSjUztcTXRoYrLZC0tRWHiFTO4t2q77nQxExU5FtrJHBXXCJglhTa54JotyOiSo3AeMpM4jI70SgVG/R1LuRJXiuSvp3j8zdGgN4CBrv7/gd55RDU++dTdJ84c23c7LpC47hBTcsqjXxk/Ixnu5ozYhL2kKcbViwwCefgOyrIMJz0a2G40A9aaHSy18qDQL6HKFn9nz1+1H/RYEf7N9yiFI1f1iDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yi7+6Pq5mjOwfy/+AlZQCLssj1tYFNuJiRItpAZxb6o=;
 b=Nby7NxzS+em5LMw/UvCGSIuwoXXNzxvDBRFrvf62fYwCrxf61rDMkISfkMITdPplPEtX+ZQD6P3EVheBU6c7WVo3nk9wp+o78iVv5fmubpRITu4Hr/AkVdMdd71FFr3zKT+9if8pSGF1VzyJrtH70L2wbrxQkjrYvYirOowWaSER/YCPtBqK7X85VMdJ7HW2OJ1hxtvursRZf0MbGH28AMwDb/TpbGTI1AGVXrN8oSKWbKMI+5p/o3j9vMpF9YMskl4V6JoaVebzrtuA+fT/45eS+9TVlfvEpJ0snqvs9TigTsXSJbNaTsNnOpHjmzpYgLniGAhx5UjQtDfzTs80eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yi7+6Pq5mjOwfy/+AlZQCLssj1tYFNuJiRItpAZxb6o=;
 b=VSwK5/H6VlfJbrn7J2D0eSIma3KM9vMY9S19HX5eb7yw+RxWVqAI/oSDFYVIKdQywrd+nzhnCNOyeT5o9ou0Hf+sq1KvwFCuJiYwWBreVmYEB1C3keOkph/m5CvLFrRv2O8XswH2Zi1Jx+2j9QoCoqwr7HbhI6rVG52frKFOF+s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6168.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:182::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:04:01 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 14:04:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 15:04:00 +0100
Message-Id: <DM5GVHEF9QJJ.3OZP69ZE63RH5@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Thorsten
 Blum" <blum@kernel.org>, "Francis Laniel" <laniel_francis@npnm.eu>
Subject: Re: [PATCH v3 2/2] rust: uaccess: use NonEmpty in strcpy_into_buf()
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Lorenzo Delgado"
 <lnsdev@proton.me>
X-Mailer: aerc 0.22.0
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <20261013-nonempty-slice-v3-2-4463cc0338f8@proton.me>
 <DM5FNHG3HA25.LXCECF3U879T@nvidia.com>
In-Reply-To: <DM5FNHG3HA25.LXCECF3U879T@nvidia.com>
X-ClientProxiedBy: LO4P123CA0635.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::12) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: cf42fe7f-b3cc-49f2-b96f-08df2ac529d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|10070799003|6133799003|10067099003|18002099003|22082099003|4143699003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	mD+rigHf0BZPy+QTNN0VT+T31kHolPzDlt4hoofWw0KneokdYZCEp1m6aeV0jcP6Z+tvO1DpOa0Zj/XZNEgWJQkiRlMyGyNhN0VdppFVv5Uhkr+OlUSPmmwncw3+zE0NTqDC45fxJAZCVqFkXf3kJdoPczFq+rqEK0gsXa1wYsT67SvEwDbbNZaA3KKvKuxuM6iYt/sUGhfdn4+/dl9KlvoFjpivJzrhXCclX4N+Xj9YwkRqYoAuhJ4va2Y35CnkJ9+Y4kIyKOM9Au1DJTFpwWpPX/XXtk0PhEpy3JTyt1uNCR233mFA5+Cb5W60p5M1LlbXtPX1N6OtJ0bYiztlmJ+cFHl2hEy22ezhQo9plnbVpMsy+bTDPqhHkll4WyB7bmZbQFuhX2iL4/ivEXRJujVbjBM1lvqvwnndTH3wX11vviukBtLQoixP2NvzmT8qjQQXmAoNs5aICknirZPM/HNKrlxu5EVwXZ+RUdKghSWFIeYPbr8JFQeOd8ylvvL9oiTMumGVNMfIhEAKSZkwxCRGhs2J1BQmsRv1iU2Z2L7nfrm91UugSbNNgSbDt1SyLFgw47aZJGHtmTMaAHSEZ0VkiRJz2zOS0EsWRcpDmfdaU2SBdjmPAMof1L0HWn7waJIPGf1fn1r7uy0BQmuNQm+cIGvrMDDaOgTvBcmmsUw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(10070799003)(6133799003)(10067099003)(18002099003)(22082099003)(4143699003)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUVJdVVWdVAweUhlSFQ4QWZKUnBYNXBIbmwremw4SjdCYUZMd3Q1N1IrL0d0?=
 =?utf-8?B?UGJabjN3VVlmaVNXV0E4aTVObkRwOXI5blhDczVzcWlobC9KUitFNnZLVndK?=
 =?utf-8?B?ZkhhektmTnlTSklEWXpURzRrNGxvV2lqL296bVI2MVpHcC9sTlNCdXJ5Vkxz?=
 =?utf-8?B?SzkvczVld1A3Z3l4YzRIWUdFNGU3WVUrNzR6bm5FWFZwd3NuY0EyWkdDMDdU?=
 =?utf-8?B?aFZNWEF6OWNxaWV4OHgzcC9HYk42NzlqVTZUalhCSW9iR3dTWEMxQWdiU0Nl?=
 =?utf-8?B?QnRlbVhhTkhxdXB0dTd5VFBBQUIrTHNTWmc5akhPYWJkUnRtdnI3VWw5anpr?=
 =?utf-8?B?RGxBS0lOZ29rMXQzWHNRczdCTE1ORlZ3UkxPeWtqVmN3ZHgxdzNMN1pFOEt5?=
 =?utf-8?B?N0dmN1duaHk2Y1VpQ2kvUG85OFRFY05mL2IyKzNoS1ovdjhkcHkrbkRBU1dK?=
 =?utf-8?B?WkNkazNLNHRtbEN3N0ZXTGlWQkQ3UTJHdWN3c1ZqamhVQXpOMVp5NVBnbE1W?=
 =?utf-8?B?RFJKdWc0OVBqbjlGYXhxSkM2Z3Q1Q2NXOGZ0cVplbkw5bXd2QzBwbER0U0Zj?=
 =?utf-8?B?TGxpYTlVeFppR3VFLzBXOVRHWVpFOEpUTFZjcWUzbkk0T0c0cDlhTHZFZEpB?=
 =?utf-8?B?NmdFZUcvWWRHZ0pUMmdsbGxEYXpZSXltcXdyNEk3NjBjRWFadnpQQ3pObnN0?=
 =?utf-8?B?YkVHa0xCNWVSdzhqcndKWDlqU2RwTVhFVHdNMFk0c0k1RnphZzVGMjNJUC9t?=
 =?utf-8?B?aFIwWDBJcXV6cEhzdG5UOVJtbWlvRWtVVUMwc3JIZk9vSnNVb2xFOHFEZXo1?=
 =?utf-8?B?dGxvY2x6YTBCOEtuaS8rWGlBY0dzOHJyS0tiQ3F0WXdNL2xyL0NpY3ZYWjdO?=
 =?utf-8?B?NFpyVWp0UUxyYjM2b3JJV3dwOXdBNjk0dE1mckZVVisrQm53ZHQ2RjB2VE5Y?=
 =?utf-8?B?RmJZVDBmZ2o5T2w0MC9nbWs3UCtsZEJpVzBuSzVxUWgzOTRhMzFZdU5DMkNI?=
 =?utf-8?B?SS9KbHNXUEdDSDhVRWdBdWVYNEpkNUw2Tyt0N2g0eGZObngvbXNqZlZxemQ1?=
 =?utf-8?B?ZVVrcXMrTEQyU3hNeGUweFl2VEVubkdSZ09Xa21mUm5BdWJ5MCtTVFU3amRv?=
 =?utf-8?B?eWx4SGdQN3FZYk1nSVlqUDhQaWFmZUkvSm1UM2ExWk9PZEorNm5DY3JyOTI4?=
 =?utf-8?B?a1JGN0M1Qm9OLy9HZDY2TU54OVEwZ3hFNkxsYTJZNGx5bVgrYUFJTEhSK0lx?=
 =?utf-8?B?TVVVMENwSXVDZWRTTkVLNnhTekgvTndGNCtWN3o4Vkw1WWU2ZGRxV1c0NVVJ?=
 =?utf-8?B?ankwaDNucUJCc2Zicm5jU1hsVDFpTmcwcWUxclNzNzJieFh2M1d5TW0wbnJL?=
 =?utf-8?B?YzRKZXdBUUZ0MHhqMWVrZEo1TlZKcnhRa2V4OVZmSS9kZGc1Sjh6OEcxL290?=
 =?utf-8?B?dW1WU2NROEVTc2Z4QUdRKzBLNUlSZE9acnoxWGpRd1dXN05lTllkZmFNYlRr?=
 =?utf-8?B?T2gzR2xQTU5OK1VVblVCSXQ3Rmk5YzVycEkxUFl4UElDZ2FRMlJFMXFxRWJW?=
 =?utf-8?B?RjV2bUFWZFVKbVd0U0o5Ni93S3hSVlpUUU5wTlZ0SlFIQ0EveEJabGgxVkU2?=
 =?utf-8?B?a3lTU0h6VzFPUUlsWWZnc0lvbGo3L0R1bFN2SituWXhraDh4Snc1U2pMVktm?=
 =?utf-8?B?NUlhbENzQUxUc0ljdjZVeWNuR2VRQXpqbCtHU0wyUWpJNjRqUUxRcmgreXBB?=
 =?utf-8?B?Uk45RXpZZDFDOXdzb3RaUkdiOHFzekEyQi9UbVR3QjdobElsWG9SUlJKaDZZ?=
 =?utf-8?B?UzlydmJPVklDenFXZ2dQNFV1NEZVUXVRbVdIOFV2THRuc0M1NWRiRG5Xb3ln?=
 =?utf-8?B?N1lVMm5Vcjk5eVpxYjVod1VId3U5UVZuTGdnUmFBMGxzOFdQYjlQNk5wZm85?=
 =?utf-8?B?czZtaXVic1ZIb1hRenkzMWo5aUFCb0N6NkZEaGJQalFKRHFnYWx5MzN1V1Jx?=
 =?utf-8?B?MFN1WlBIOS9LMWNyZGY5YVAxM1ZSSlg3SVNrWXZDUHBPcGR2VlEyL3VWQUM3?=
 =?utf-8?B?L3FNQklhYyt4cEpMMUF4QWpIU3VDVm50NndMWUo3bXJrM1lQaDBwL042VWR6?=
 =?utf-8?B?ZFVxZW93Z08rbVlSa2ZuR0Fvd0VHNHFTUmNsWGgxQlUvSUQ5TGJ3emdHK1la?=
 =?utf-8?B?dmJTWDB0TU4vYnZyRFh5Z2tNWEg4QVB3TVVVOVlMQkpEa2lYK201U3RKOWlr?=
 =?utf-8?B?Z1pqTnIyZG51UXYvc2NZZVh6THhnT0liN0cvMVRJa1M4UGh6N0R6UUtsUnRM?=
 =?utf-8?B?TFY0T004MWxOaFZQTEs1Q1NLSE9zMlBWMjVNaVphMUtBbXJHTGNwdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cf42fe7f-b3cc-49f2-b96f-08df2ac529d2
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:04:00.9263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LMTInJZe2lmM+ZSdjrmw0Zwp9vG6JtQ00jUj2gx2kOBTMV459ey6/yl/6HkruZ1ylwpQseD8x8SSp8ctD+LXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6168

On Thu Oct 15, 2026 at 2:06 PM BST, Alexandre Courbot wrote:
> On Wed Oct 14, 2026 at 5:30 PM JST, Lorenzo Delgado wrote:
> <...>
>> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>> index 5f6c4d7a1a51..1cc5c7580d3a 100644
>> --- a/rust/kernel/uaccess.rs
>> +++ b/rust/kernel/uaccess.rs
>> @@ -11,6 +11,7 @@
>>      error::Result,
>>      ffi::{c_char, c_void},
>>      fs::file,
>> +    non_empty::NonEmpty,
>>      prelude::*,
>>      ptr::KnownSize,
>>      transmute::{AsBytes, FromBytes},
>> @@ -383,20 +384,16 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut =
Vec<u8, A>, flags: Flags) -> R
>>      /// Read a NUL-terminated string from userspace and return it.
>>      ///
>>      /// The string is read into `buf` and a NUL-terminator is added if =
the end of `buf` is reached.
>> -    /// Since there must be space to add a NUL-terminator, the buffer m=
ust not be empty. The
>> +    /// Since there must be space to add a NUL-terminator, `buf` is a [=
`NonEmpty`] slice. The
>>      /// returned `&CStr` points into `buf`.
>>      ///
>>      /// Fails with [`EFAULT`] if the read happens on a bad address (som=
e data may have been
>>      /// copied).
>>      #[doc(alias =3D "strncpy_from_user")]
>> -    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&=
'buf CStr> {
>> -        if buf.is_empty() {
>> -            return Err(EINVAL);
>> -        }
>> -
>> +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut NonEmpty<[u8]>) -=
> Result<&'buf CStr> {
>
> I understand this was done per the v1 feedback, but won't it make it
> more tedious for users to call this method? (hard to tell as there are
> no users at the moment :))
>
> We could still benefit from `NonEmpty` if we replace the `buf.is_empty`
> by an attempt to build it and return `EINVAL` if that fails (what v1 did
> basically) and calling `last_mut` on it to remove the
> `unwrap_unchecked`.
>
> Of course if callers are expected to already work with a `NonEmpty` then
> that's fine, but otherwise my concern is that every one of them would
> have to manually build one to perform a check that this method can
> easily do.

I think it might also be reasonable to invoke errorenous behaviour here, by=
 do a
`WARN` and just return c""?

Best,
Gary

