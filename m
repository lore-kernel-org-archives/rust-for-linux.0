Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021103.outbound.protection.outlook.com [52.101.95.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFACC38D014;
	Mon, 16 Mar 2026 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658273; cv=fail; b=r9IvUri/wa05OvdwX+ggiuyv0ha7yUnRw+Fw/fQM5Ntf6iWSfzmjCfHOBZPvNac3ZMpCyKNrRisM38dTz0YDecjLi51szgpZZRGD53HrKT7ZFiylxSpGH7bqYz/IqcrxazXh7q4z7ONdL1P1r1j3L7l9sYycsaiffrr86DXXKWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658273; c=relaxed/simple;
	bh=6hKh96PUCuV/PC1pCb2pIwnN1lr3jigF846M1ThxbgM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=IP8LjrYS8Mql7SPeBjvVpkFL817WQafP7EBQbEq+WFEaWFC/tsjU6Ewjmw9cnPqb4bIMWDHn39MKgRSBS8X7DXsfUnfeooV+eyfMdOieHK/wFAtxSSPhcE0bDBLAxVgzzrEe8UUonG97oqbdrRwtufg8WYCiTD6k5I8fFpWFJS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=SiHJ7c/V; arc=fail smtp.client-ip=52.101.95.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="SiHJ7c/V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJ9AeaphBbcRABNN+/xsbTtAr+BPZyaB/HU+GO4a7PrTJ8OQAEaT39dEvqFAj6Fpz9C93cThilFlYVNJI2aY1mwQVnDot+g3vwx3ktkoFnmz3SMJLTYnas7FlZZONe2oV5uOk0zbAXBU6sz6Q9XTQqnIdtfOntsg0M9dYmc6xf+AdPHv3fMGPnfcNgru8CfFlTcUi3VWCJLpyoHCh16iCXtHeWh3ftE0L0948tcx52xAwuzRkBJlbkMkC9n+xK1Tp84RrNjRueXoyNZs3flUOIvrdbGRX0fK6bIAH08T+kP+QHQ9lUxDknwBuNY/aouWjqNuNM24HyeLtiYNEYrgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEIbTqWI/jujH+B1CUle8ZR6tZVaotMDx8rJPhq5Lbc=;
 b=G9z+pwTiz7fPNhyLJ6Ys7eZ+wE+Xssu36R+2FRVWhBIfpfStN9kl86cDbXMwtdkVJGDXkrjgg0A8ohJIcxxUEHfBpOYtpu/M373hgZPTTSgnUHQmvSv1Zhl4dASJ8vegn9nV0eHR7EO4YipHyDjr73Q662dWJIRZTH6fTiM1b715qtAUBmi9oe+sfxjAJd0O9tAkQaJBWDpBqGLQVK90NgwdLWmwFEMj95r+k0AUku7jk6G85wJ0lZJuOnpEXCdjN86rkC3l1YCqVO47vizRgzqbcLDCCWTxRkYW91pbXFtjVg3eD4yrgtHiejLCTfbbzoa/Bjk/5mDteNDZJ7oLIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEIbTqWI/jujH+B1CUle8ZR6tZVaotMDx8rJPhq5Lbc=;
 b=SiHJ7c/VC0INgNXEFMWW6lu/VnZESBfsS2ZZEur5CeGQ6DCy0ew0eJt7diKlcNJQeu+XMi1zs9KoGnOKXoT75SToksUyk+3NlbulsAWc0KSDkdvZhxCTMYIusaJudbrCYD/1JzVO8aklxxTzMe0jmvenvLBuEgyXMqwVKkU3oRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7924.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:410::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 10:51:06 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 10:51:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 10:51:05 +0000
Message-Id: <DH45DQFO909K.1JK6IKMX51ZAV@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Fabricio Parra" <a@alice0.com>
Subject: Re: [PATCH] rust: sync: completion: mark inline complete_all and
 wait_for_completion
From: "Gary Guo" <gary@garyguo.net>
To: "Fabricio Parra" <a@alice0.com>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260316082111.398170-1-a@alice0.com>
In-Reply-To: <20260316082111.398170-1-a@alice0.com>
X-ClientProxiedBy: LO4P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 553324cd-b12c-4474-14ab-08de8349ec82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|56012099003|18002099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	iDpFWcQfvFkIXSwMSsqKq2p/avkbPW90hrzKnL0BaHVKV6rhfKvXuP+Zpi9rqv5nlgbj8uWLKHs54eiJEwTsE+7346zxuBjWC9LMA0Vv/ii9k6f5sfQp3GLdpW5Vz5QGInmvZv/MSTnvf5C5Ehl+vE73gd07/udmdDLVVqM2ur0NdAEUykL1IgFAV9sOT8cQ7E4j4tKKXOzUa9wffjch2+Om4cflj+S3pxmtK66DwtJqGtPRey6YQFWuR9QOLeq+5W5CqKaFk7W7aFFjbtlZuLQa5odAaO68OPymwsrwpZQakFhwt1YVGaMaes+5zVFCqSJqzZTA/+mHEjt7Hko3JjykAGUShE37i22Pv4vUduAd+8GBXSUSdKb7mblRoytQqnmi7XCu2+eBGGlJa/hw6xHil8K8QJEPCpALiVrY7TGibCWq3HiTLjbnnJQjfxu/1sANQDbZL0OC5jXrtyGSoMHsotcodd+DAI7mUcuhPavY/CeU5dFdLpnPkZLoXXE9nhUOZLhTEYZy7gff4WnA3GXq7LotcF12/4veE80yTYraXN5jL2xyabbjgdbMHZHNhOK6f3N/y+NZ0xcPwGKJx+SgzMsf6ex/ryE2KDNZIwC7qsx1oDNi4PJpj1xLEBsIhPsi3c6iX/UUEMn5Pp9ieOrqLVR9ErNyZT5H0nhkrHknbidzDAyNGjzVmz0fF7FPSYHJFSK/dlwa4Z1CTBvpSSPWgS7GVlb/XSS+w4hC1sQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003)(22082099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG4yUmxyUDJzcVlHK0tBSDRxOGduWk9BTExOU2ZVeXVkOURvSUdEMCs4dWQr?=
 =?utf-8?B?eFBLZ1BCYlg0a1NyVmhNMlhYL1pmYSt5S1MzaDVHVmcwS002NEZxUHBrVmox?=
 =?utf-8?B?NENoRDNiWHkxWlhlT1JaWG50ZTRUZjhWZC9DbE1jVXNYZ3JsWnZ5OGFUQm9F?=
 =?utf-8?B?YmxTMlVnekJnbXdrY2I0TlZQZE5RUnhER2RIQjI1b1BWR2daUW94a1UwYjdQ?=
 =?utf-8?B?bDBtS3lPLyswWENVZ3UzYU5CS3V1cDFXN1J6WjN3aE5VVDdHQWtET2RhaWZO?=
 =?utf-8?B?UmsxWTdnOExhL1IwSnMzeTVMNlFGdFpDT0trMDBoaFRRSno4ZkZZcDdjbmRa?=
 =?utf-8?B?KzgrRG40aHpJSmZkNEZlK1VROHFVY055WVVHb3lSMmpaamUrT3FNZE0vVGM5?=
 =?utf-8?B?bkQwRTNUc3NjNTZzdFpkSEprVzk2cmRob2R6U3o4Mjc0UlRueVJwTXFyb1E3?=
 =?utf-8?B?SFA0QjUwck5jU1YzbjFJT214WGNKbS9xeGVjaFVIc21rRmVTZlBhRGRCekFM?=
 =?utf-8?B?bk52RnhvN1VheG1wd1JremszaHJJRWhMUnh1b1haU2QzOUczT3lEQmVGQmRP?=
 =?utf-8?B?MDlnaDZCT2FyMjkyWHhaZmZMSkk3OWVPM04xN1VMNktSWHpaYlhvb1RrWXht?=
 =?utf-8?B?K2o1N0VFZHUyb2gxUXZOSVhPSzA3L3NmZ2Z3aFlUY1BXS2E3YnRiazJGaEJn?=
 =?utf-8?B?VlI1K0N5YjRQM29NdXVCUXpvUk02OFVBQXUwNWdLTmdOc3ozSFA5ZnlJc3or?=
 =?utf-8?B?UEs0ME1iaStHUVRoL3VHcHQzWDVrUFhPbmNNV25jOHY2MUliSDhYQUlDaHQr?=
 =?utf-8?B?blRoQlhtNEplZ2V2aDNyeVpsNjZjU0hGbmhyZ3llVW96bUV6M0EySDJuMU5T?=
 =?utf-8?B?WHNxRk4vK1ArRjJ5TW15Z05hVjRRaXMyZTNJQVJzSUpwMklQSHNvVlh4Qkg4?=
 =?utf-8?B?SjBZNXNrTE5vNEFIclo2dEN6ZWJKaHFpalphTUFRQlhFc2NRUjhYWEE4SUQy?=
 =?utf-8?B?MDNNenJzWGNDZGlaemkxd05mUkNiSlVlczYwdHBVRngrcEZoOHhkTmZkQ0p3?=
 =?utf-8?B?dmo5TlovZ0hOb0hML3NqMmtXYnRHVXVKa1pzK2Ewdm1oSS9tWU14Mk42RHIw?=
 =?utf-8?B?cjczZWtPMFhLOUZ1QVZJaUFSSW1EeTR0bHhKY2Q2SEcvRC9ncEdvR3JieGpv?=
 =?utf-8?B?VWNsai9sUFQva0JjTElaeE5MYnJNUUNjcnVIMnZQMTBUZWpTc3dnTGd6Nlp3?=
 =?utf-8?B?TjVwS2ZmOEcvbUdXMHdOMTVFK1hRUk5pVjNDNCtvNDZnV2hYRXlyR2pHNmw5?=
 =?utf-8?B?Z0tCYVEvUW1zQkFZd1IzYkt5dUo2TENOMjJ5Y2NMeUR4akdvYjNKVEVRaHI4?=
 =?utf-8?B?T0N0cGVKK3VTMHk3S2Jjd1BxU2I5ODdhS21EZ3JsNjZoK2kyL2lxODR6b2Nq?=
 =?utf-8?B?WGszTFg2QjdwMkRIRk9nWFR3OUhMeHpTZ0RiK2NpeVE4amsya0U5YU42Q2hZ?=
 =?utf-8?B?NEpCMFNUcXZldXJhM2hIc3dwbmV4T2NvRDFLdng5NFAxOGJPazNFZjRhdkhG?=
 =?utf-8?B?aUJ5RWJJSmhEUUdueVBZRXJTZVB1S1NqNFNpdldGZXRETFo0MGF4RkFVT2x2?=
 =?utf-8?B?eW9mZ3NGYk5uL2YrZWkrNG5vRlVESlpMSVVlRGJmekludUdWcW8wRXlIKzZN?=
 =?utf-8?B?ZWEvSU5tUUhIeXpsaDNvKzU3TlRnQlZxK0Rmd0RoendtWWoxR3ZNZzV2RXVt?=
 =?utf-8?B?RDFwNmRZZXpwQS8wM3pITUN4aC85a01sMTl4QmtCenN5OXJpRGVUOGlzQmgr?=
 =?utf-8?B?b1hHcGdodHJSRG9oeHU2L2RjYm10cVRMUng3V1BkSENrVXNHeWVma3l6ajZT?=
 =?utf-8?B?TzRyTWNnOFd1d2lXK3U5SkordzRSNmVROGtBblBzY1UzaWxqZTI0ZmhKWEVo?=
 =?utf-8?B?QWtEZHVEVW42bS9qOTIrR3F2T1VqN3lhS3oxbkJQWFd4WGFldVpUWWVmcXdV?=
 =?utf-8?B?cHVvTFAxUC9RSzJib3RPMmhMM2Rrck5oNTE1YnFHSUVPTFN5M2FSUTFRcGh4?=
 =?utf-8?B?OU1pK3pNR2MvOEorSlpvcFNtT2VLRjJmUUcxaCtlVExEZHY0djV5TXh4bXRJ?=
 =?utf-8?B?T055bzM5b0tReW1JTkRJYlVVOEh1UlV4T0NHYS9aT0tJUjI4M09ZSElHQ0N6?=
 =?utf-8?B?SjFaNEFJMThlNjR1WjVKWU9EcWwvRjlreGRXWW5HcE1wN1hDanFJclhFSjZO?=
 =?utf-8?B?UTRmcURLdjJRckFRcmNiUlhOb2laM291UGNkbUN5a29zWDlOSkZGYS85Y1NG?=
 =?utf-8?B?dGlHem1aTkw2Z1d6SzJuMEhsQUQwUk0vVjRSUGtMTm1wOVc5V3c1Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 553324cd-b12c-4474-14ab-08de8349ec82
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 10:51:05.7746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXEbLtzqlBVOQlFb1S5qnsNhoHEwS7b+EIqY9w2oiPbJS32PbNJ11wofzDzMHy0ObheTPg/jr9Cg9hy7PQONcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7924

On Mon Mar 16, 2026 at 8:21 AM GMT,  wrote:
> From: Fabricio Parra <a@alice0.com>

Your email header is malformed. It has "Fabricio Parra a@alice0.com" in the=
 from
line instead of expected RFC 5322 format. People won't be able to just repl=
y to
this email and get it delivered to your inbox.

Please check and fix your git or email configuration.

Best,
Gary

>
> When building the kernel using the llvm-22.1.0-rust-1.93.1-x86_64
> toolchain provided by kernel.org with ARCH=3Dx86_64, the following symbol=
s
> are generated:
>
> $ nm vmlinux | grep ' _R'.*Completion | rustfilt
> ffffffff81827930 T <kernel::sync::completion::Completion>::complete_all
> ffffffff81827950 T <kernel::sync::completion::Completion>::wait_for_compl=
etion
>
> These Rust methods are thin wrappers around the C completion helpers
> `complete_all` and `wait_for_completion`. Mark them `#[inline]` to keep
> the wrapper pattern consistent with other small Rust helper methods.
>
> After applying this patch, the above command will produce no output.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Fabricio Parra <a@alice0.com>
> ---
>  rust/kernel/sync/completion.rs | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion=
.rs
> index c50012a940a3..35ff049ff078 100644
> --- a/rust/kernel/sync/completion.rs
> +++ b/rust/kernel/sync/completion.rs
> @@ -94,6 +94,7 @@ fn as_raw(&self) -> *mut bindings::completion {
>      ///
>      /// This method wakes up all tasks waiting on this completion; after=
 this operation the
>      /// completion is permanently done, i.e. signals all current and fut=
ure waiters.
> +    #[inline]
>      pub fn complete_all(&self) {
>          // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.
>          unsafe { bindings::complete_all(self.as_raw()) };
> @@ -105,6 +106,7 @@ pub fn complete_all(&self) {
>      /// timeout.
>      ///
>      /// See also [`Completion::complete_all`].
> +    #[inline]
>      pub fn wait_for_completion(&self) {
>          // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.
>          unsafe { bindings::wait_for_completion(self.as_raw()) };
>
> base-commit: 79e25710e7227228902d672417b552dd1d7e5d3b

