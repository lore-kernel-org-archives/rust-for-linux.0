Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012009.outbound.protection.outlook.com [40.107.209.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A1C5158B9;
	Thu, 15 Oct 2026 13:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069608; cv=fail; b=TOBfZZWKsl3ClRLWiQKBDC+zMw2oiY8maR1TSzR1AIdZKcbZvemnx4CeB7jtRwBc6o1F51RbWIW5Hs+nYQmrxQD8XnvxbwOaqxYbQKJkiBW3S6u4Bub97bUP0Q0pZeYwdWB9ksBnjhp+Yudt9F0r+9xywstUL4yI55ue773GprQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069608; c=relaxed/simple;
	bh=3s1ugyj+sxcxlvb+BG/iN17ArwpXy3ud41aeXOVc/fY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=O4t+U9CG/qtstNxRQ1X2RuySKtiquoBOtjcKolVJUbtiujfXLqD9/3CVHSctNDL8+BVGc7Lzg50uC645BCkBMi0Mcwknk4hPNlSiAZnnPljp74KwGffIstr/KQwpfQP9psOO1ZpvKiJOWRlg2oPflJI03aeL90H2XpJHwnr6of8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SZZgrTrn; arc=fail smtp.client-ip=40.107.209.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SZZgrTrn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy5nKcYCwyG3HjQUmsFdwLNKVNKj9CPTSoSX+LFTkzvd3Oq6aatykiy+jUDnpPABkWrRJ7FltGOsCbJoD4yS0sJUrN7uXvz7i1JZNrnVm7SjOo0ZoU/T/Laqcrc7lupmzpvrcKRsIm4oJhubLAA+bOu8rcx+lM3YD3ZwlyMGUIte7w9g+UKoJGiwvmWYH6H1gqBsqnUKI4T+EQjgx7Y3ayOiPYa866lengfiTqdB12u9tiP6NMpsiXNz04xqsr1jN+CGazVYrkXaj38fL6/CTuHwJcP2LRZ+ZCGWUvatnPdKlYdTRDLZRZK8q/IA2Emm9/17mbaHJUry78Eu9sK03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnEvN2ZLFHGLpjLk46wq9nlWYAZzAV6gDIf4uOPgVBw=;
 b=NuFDZ94oZFoe0l02lMrEfl5k3mSlkCyeBdNxndPT6CPS2SkkM8NcnNhPbbFSGpr5HrKisSHfVMmPNTzc6LBSanZM3Pp7we1JsY6U15NwZGUe1MMmIAiaV6NJL27aBmaaQ2vhyeD4TIO8ZL7x7QiS4tGIV5td9sUosHqILkQ4qO8gph1v+CHk5DLMKk5kn1XQxI/yvaTs+ZjMAsBn9ei94j1gz3JK7zoyjldRm1pvcVbMWnZppTip3ALFS0LW43oTpYKUO0uGKTMBzOEY8lAezhUwVTXVEmPBpw4DyHgdK1AObZspICHWqjDedG5pTZ78JXoJzuIDOEoCh/1jsGPMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnEvN2ZLFHGLpjLk46wq9nlWYAZzAV6gDIf4uOPgVBw=;
 b=SZZgrTrn6mO1FmGM8u0K3KytkN+jMmXjAg1OyRJUQTSZxx1/kGA/uZLPbO7aT/aQK2uJ6pPL7t8dBT71qAKPPapkv3FVgbx8+EjJ+WXzFqbD2tHwwCgbX/92fw+f9PJyKRUeqg6Etes66HPQlTMpHaaNq2AicoadAfpe1GcskXGJjmhwsaKpuKkVwHjy7v5HNKhHSw0fCNBradRNoZUi5xvIHaAV0efX+d9mDp4NABA05WZsIWq7BXM9bYODPEgU9+GH0Oh6BRgvSf+EIE7zJtI3fjHpASTho2KgnD+SRn3zHgfdF6OObztSZ1cJoWo3dEH75ior3GOOKG9oNqNWjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LV3PR12MB9166.namprd12.prod.outlook.com (2603:10b6:408:19c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 13:06:36 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 13:06:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 22:06:32 +0900
Message-Id: <DM5FNHG3HA25.LXCECF3U879T@nvidia.com>
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
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lorenzo Delgado" <lnsdev@proton.me>
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <20261013-nonempty-slice-v3-2-4463cc0338f8@proton.me>
In-Reply-To: <20261013-nonempty-slice-v3-2-4463cc0338f8@proton.me>
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LV3PR12MB9166:EE_
X-MS-Office365-Filtering-Correlation-Id: 9941cc2d-6288-4e71-3449-08df2abd2433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|10070799003|1800799024|366016|18002099003|10067099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	AGbPceycfNTYbx3KfmNMYZZ5/mADnsu9WnpJZDrCeHy512xZUtuBwcepo66XLRD0QYbkkMZKwayNWxsuFqNTMxRPtawA5Mi0iOUOs6ynXXkrHchi0NNG3dpfWImsMT6VEml5nc8DlWWw5Jh4iCZWpgDpxh3+Lm2tdY+WKRGlf0b0GUubLqLh4O4OzbssKeJVWBZ0ysiRSiV4vKS2LURWMqbR8XBNY/9FOZYf8amcWV8AUW5LoGhSy1dA7+J07mAabKMzkCqOD1N49ParoK9mXAF4pKP0N/kE5AzghccVE92RMlJH6wh3dzPShZuQe5Dsmav2nQZWHZbzG3c3GuXsAB6FhOGrq7kjdX7LpijiGB/jU90HnhHW7mq71r+odJtTCCkdi69+TJDGvWnhbvR674d4akQ0/vSrWeoPqmN05kuYN4SzvKuUG8ffgHaSli7bCaW040GAR2H7WD/hdhAtoi4bXLvK2eAJXvMWrEc5OGHJOemuMP9rWBLdvTQ3pgEEdm3XHSqTZei6TyvSCbLubrzSxrrBcbUnrPsKG5aRg3hmhNWKFj7nitSaK0aK6lnJkvSJ+287ol/K2PwqxjmWgTNkI7CFtGev/53u84/AzcLhYdtjmcYlk0RxQXQAC+YzXobB68hPRj43kGtNe1fVxr0MzFN2dJTDJWnYSgI6aMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(10070799003)(1800799024)(366016)(18002099003)(10067099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDI3RGxIdEg5NitSSU11TUZqTGMwOUlCVVVPWjFKMFd5bVNkcWlpL05zakU2?=
 =?utf-8?B?WWVCT2cyQmYzOVJEazNvK3N1UXd1NFhqVHBJdXFWOE5XNUdhZ2hPZUVjMDhL?=
 =?utf-8?B?K21UN3hNL1hqdWlFTTRycDJ4dm9qUTBFbVlWa21TUXQxK29BRUhkcm9DTmQx?=
 =?utf-8?B?dm5rNWdib0RXL0ZyUEJCaXc4cWFwYzhCWktOS0NTRGZKM1pIY0dQazV6MEhX?=
 =?utf-8?B?c2lqTEc5cVcraDkzVG5QaFFXWGdwekJZK2ovVStwODYwdGgxWlF3aThJWHR1?=
 =?utf-8?B?dDNuVTNQZlZKTW9zQlF2aHU4SVgyTTVMR25YWVJtZmhDS0VsbGF3RkpScE8z?=
 =?utf-8?B?OUtHc3lqUkVQMUQ3QkR6b2kzd0lxeFBXMDExSklUalhYWWxvdDNEamQrNGRH?=
 =?utf-8?B?QnN6L2RJQVRvUkdLNkRNYmM3dDdsenVDQnZLZm9QWGhsZlB1aWhRVVVNRkdt?=
 =?utf-8?B?M1pma2hvN2xZTGVjWDhwL1hLQm8vK3M1NDZGR0lWYzZBOHBEZnY4T0JiTGp4?=
 =?utf-8?B?RG9mQVBFZFkva2hUTTdkK1JYTG94Wm1MZ2Vic2NvQk83ZFZZSC9EOGN2dTNX?=
 =?utf-8?B?d3hGbEZmN054ZjZGd3FoTnlzWk5TOEkwZ2hoZWJoa3ZTRzlnK1JZR1FvK0RS?=
 =?utf-8?B?V1JBanduV3ErTHlaNlNkZkh5RHFtSGVtckUwbUdWdld4UnYrMmZDNmJydU5R?=
 =?utf-8?B?TUFBWG1BQnlQdFZzOEM4WS9YT3p3LzRCTXpVN1BHTmdENytHSWVTM2Q1R1Zs?=
 =?utf-8?B?ZkJpRjE3VTBnbHVkb2xDWGlhdGZsMGlNUHRobFBjbXpBeVZ6Qjhwck1TV2lr?=
 =?utf-8?B?S0xERDFBR21IMVEvQ3E3dW80TjkvdlRPWk1uVnE0L3NCK2dQSVJUd2JMUnQw?=
 =?utf-8?B?a2VEV2hCRGQxV3l4ZzY0UzdpRFpBOVhiZkRieC9Bc1dMaUJOSy8xYTRSTE5K?=
 =?utf-8?B?QU5DV1d4OVZVZ2FRV1pLQm01anZIcmU0VHlHTTFNQ2ptcVFzRkZwWFhTcFRx?=
 =?utf-8?B?TkZjN1R4bzBmOW9DOEtTeE43dThBVlBIMGJ3ZlRQMWxxcGhiMElISXIvZkhh?=
 =?utf-8?B?NVZQdUtZdXdNMDlWUmtUM0dIWmZCUHVvaXFiOTh4Z1pXRFpjYmVFYjl5QjhB?=
 =?utf-8?B?S1NDV2pYeVpIVXhIYTUxU1o4YjVQRW15bmdZbEZBby8wVWVlV3Y4K2Jodlc2?=
 =?utf-8?B?eSt6RHpMWG95ZnZWQzFzVVE1bUhKTURxOEgyemlPakRhUlJMRWJ1Z2dVOFlP?=
 =?utf-8?B?UFduQ0F0end0Q3J6NHZmZmFlZGx4VjM4MWhGVHF0T2dXNHVjV2hScUJtSDNK?=
 =?utf-8?B?bGRodlZ2OGFrU0NiOUk1QmZlcnZYTFM2NTJGQ1hxdi9EN2t6VlQ3bUNGY3ZZ?=
 =?utf-8?B?YTlKM3UreGtCRVlYL05lNEpIQWZQODB2Y0o0NWNucDBjOEtkMEZKSTdaQ2Q0?=
 =?utf-8?B?YnlKWGVsaWZmU2l2VlhDd3RyQm83WTlWY3NHV3VMdWkyN2Era3F4RXZPa0pI?=
 =?utf-8?B?NENVMDdHTHZwZnozN1UxR3p6RnB0bnhRSXRyaHBSdDVHd29SeEVqZEdqQUd5?=
 =?utf-8?B?dkNxcmJ4T25CWnZDNHNNL2p0ZmZkY3pBYzZpMHRTSW9KdVVTVlpGOU5ZemMx?=
 =?utf-8?B?RzFpRVNJcDhIMFcvanpuYkhTdHJWcTBrSTU4aWtHZGhUY0plRjh4VjZ6TGdU?=
 =?utf-8?B?RlhySVAxNllRdUtKTmQ4cTVNcndJQ0tOTm5vMzgyOVkrcFFlMnlGMGNUTHdB?=
 =?utf-8?B?dmM4clhnSm9SRWZSejZ4N0R5S0hSYzJEcW92djV3OTUrdkJoQ3pNSFZ6dWh1?=
 =?utf-8?B?UUlKVXhwcllwTXJMM0hzc2ZURUFoNUxDL3hDWDUxWGVDYWowUWM2TnYraDFr?=
 =?utf-8?B?YnhocWZoNXYzNDluaTZGVTVGOCtnMm83YjFxZ1RqYW5HS0h4WTVhYWdHN1pW?=
 =?utf-8?B?bkxuSkJsSWtjVjF0TGEyMDZvb00wYmxQdUg0cThFcTdIa0JpMmpDWVF4N1h4?=
 =?utf-8?B?ODhWMGRKUlpIVU1kTGdYUGsvdWRBYTF5TzBDNXp4cEtxV0VreXRMcys4ZTQy?=
 =?utf-8?B?bGh4UzdoalNtcGgvODVaVzk1M2dqZktMV2hSMTI4TzFHQng4djh6TURTVC9D?=
 =?utf-8?B?eTNFRUh1RllTQmN4YjZjQVdFVkRWUU5Ycis0Z3FDc3FIcnkxSTFuOHg2WnlM?=
 =?utf-8?B?S3VjYkE3di9ZNHVIcFRWdCtuZTQxeGMwS2VNblhkWU8veHNUNXNtbXhRVXZu?=
 =?utf-8?B?RzRXbTAzTjlFc2U4czljOVRrdjFvYm9vZExkMHdaekx6cFliL2IzSitCWngy?=
 =?utf-8?B?TXF4NE56UmpqWWY5QzBRTlkvWmIzbkJPZWxJT3lyaURIM3hrZE5xeGgzUkxL?=
 =?utf-8?Q?UDpFQCOVPW5w3wJ/aCbHNuZevAmR4YCBRQbr04WFRdSDG?=
X-MS-Exchange-AntiSpam-MessageData-1: DuMmHOQoCUiDAg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9941cc2d-6288-4e71-3449-08df2abd2433
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 13:06:35.7020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48N9O6041zT4PWln3K/JuN+V96l6IcaqWd20JITMr1x1BjSXguLx6SXpAM97/1ISe6LFDaCgvbFks3+FtOMZLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9166

On Wed Oct 14, 2026 at 5:30 PM JST, Lorenzo Delgado wrote:
<...>
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 5f6c4d7a1a51..1cc5c7580d3a 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -11,6 +11,7 @@
>      error::Result,
>      ffi::{c_char, c_void},
>      fs::file,
> +    non_empty::NonEmpty,
>      prelude::*,
>      ptr::KnownSize,
>      transmute::{AsBytes, FromBytes},
> @@ -383,20 +384,16 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut V=
ec<u8, A>, flags: Flags) -> R
>      /// Read a NUL-terminated string from userspace and return it.
>      ///
>      /// The string is read into `buf` and a NUL-terminator is added if t=
he end of `buf` is reached.
> -    /// Since there must be space to add a NUL-terminator, the buffer mu=
st not be empty. The
> +    /// Since there must be space to add a NUL-terminator, `buf` is a [`=
NonEmpty`] slice. The
>      /// returned `&CStr` points into `buf`.
>      ///
>      /// Fails with [`EFAULT`] if the read happens on a bad address (some=
 data may have been
>      /// copied).
>      #[doc(alias =3D "strncpy_from_user")]
> -    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&'=
buf CStr> {
> -        if buf.is_empty() {
> -            return Err(EINVAL);
> -        }
> -
> +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut NonEmpty<[u8]>) ->=
 Result<&'buf CStr> {

I understand this was done per the v1 feedback, but won't it make it
more tedious for users to call this method? (hard to tell as there are
no users at the moment :))

We could still benefit from `NonEmpty` if we replace the `buf.is_empty`
by an attempt to build it and return `EINVAL` if that fails (what v1 did
basically) and calling `last_mut` on it to remove the
`unwrap_unchecked`.

Of course if callers are expected to already work with a `NonEmpty` then
that's fine, but otherwise my concern is that every one of them would
have to manually build one to perform a check that this method can
easily do.
