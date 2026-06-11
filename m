Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6934034E75C
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 22:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781217817; cv=fail; b=pmIA6DDimqueBaaNvIMfMTeyszyeNWU6+RV2N41IkoOI4evYSmrMahsaDTJk5fo6fcT2BbD2oa8IXbvtcWDif1T1pqYxPgnySnQLTTExoWjHfBvwqG24agoZxXvbmE+xRE39kX6EGwmrxhZZa5hhevSB6Bs+mXRFIEX2dQNkIpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781217817; c=relaxed/simple;
	bh=uPl/Uwapn9l5IwK1vYgGZWcWNXLsPywPYZlwGUZcMQM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ZCECoJOawLFAIWKxCIoI1HenfSogQIekBctFUBy7f1HUy9Te3NvXGI/2vghNnU6ZG9scYM3hzAW3O7nhGoAHWJmeCC3J3NrNKdx1lFTtd6GWjiIum+HeP2Oo3IJ2GK3Pn3F29TKWBqJmwjiOsCkC8OrgRn0HDiJZGBJ64JxY8mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QWDiCr5x; arc=fail smtp.client-ip=52.101.61.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QWDiCr5x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pv3yXN5Wy6UNSPR0HYSrfTpDB0iUp8chEYTuTNIi3cGdmRIxhmadVyhA7G9MxfTvIoBlLhO+4jkW8RHTQoiuqPIiJL7XCXo55aZG0QnMMEOvl3IEgKBS7ZP46whyA5Und9bUQPDw0HL1Y4rAWaUGLlQd766odGFDgW8LxI1sr2FBDXfdxjHHPR7etcDIMmER5hwK2COhLARj9wHgpBLdHh+yMcrlf/YhC+gM2la8RhfpD3EjnJqLxfs2yu23ob4jkCTDlOz1hy/PWGfALSexp+GqW1p0nPnLF7hMewDr1tN3+OZMJMJo50AZA5CS2g1ywEKjpjqAIDXgUxC5zXL33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPl/Uwapn9l5IwK1vYgGZWcWNXLsPywPYZlwGUZcMQM=;
 b=Vp/Tv/ebMlYo860lybu7H96jdWrHI5D5nhsUbhH1IZTJvfbnLVaAkIITAd6ZLlBQA0jZkJVRasQsWtHq5Xqu19vPapmFk+eO9PBFY3F3eSndoamfO+HHKQOd/dF4t6LzACEcfsVMm8MwHMBkHZJzGeVZOd6NC0DpidGeesDreOqVB2SVvPRercABqCGnANPwoO/3cwRE90lzQm8GbqcBmvosb9asEXeeOnqoxcYxL3fzy4vgD1dTwQEHQudkPPVGvYK6smQeHgi0y1x4dLVbdyvTs+UbXPYH+RcSZb2TSP6f5uaHVz/gKlvFmYuDa+Weh2tnb71VKCEKc3B3wq6hQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPl/Uwapn9l5IwK1vYgGZWcWNXLsPywPYZlwGUZcMQM=;
 b=QWDiCr5xlajB21oLnSzr4A3HQqQ6ikVejYEbAExCm+kZoMKDDqxgQ+HFHC6KWkdx5z7V7w/mxhHkLU0fl5Pek3+mBlRPJf7+WR1ZG8o/Qj434K0amMygV0dbvha37EYyylAKKsxD3lzlNn7G6Uw4nq2PbnxMlhvPE4NuPHlNrAo53u1ikkgAzcJ0QpTMjW0KEc2BslhjB2rSBPxlLtn0nfPBALYJ+5RJv1Dxr0/RBF1inagxkgB67xtaQJQYQfzeVZ5IP04QMT+haASLF3MHoIuVtjxNJ04Uo1tXMCcvWAgus4fQezgXihTvwMMh+hTv5YnUi/8SP+gkXzPGadwHTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB9055.namprd12.prod.outlook.com (2603:10b6:930:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 22:43:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 22:43:31 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 07:43:26 +0900
Message-Id: <DJ6L0K01VI4J.1X1J16POP4JSY@nvidia.com>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/4] MAINTAINERS: add Alexandre Courbot as Rust reviewer
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <ojeda@kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260611055538.61425-1-ojeda@kernel.org>
 <20260611055538.61425-3-ojeda@kernel.org>
In-Reply-To: <20260611055538.61425-3-ojeda@kernel.org>
X-ClientProxiedBy: TY6P301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae3760a-07cb-4ee5-800a-08dec80adcef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|366016|376014|7416014|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Xj60kHaF3tbJ6W3JvkVLl5Uz7Rv8f9hNhqt84ZYnPvb2a5eOObNNzbpeoj3bbhaxNHPuF9MI/60BGyqcxht0+sZD0dD1sjlEAzRoY1wn4/hm31s+BuIxilojbuVdc6mxveE9MTLjGTAkfMsr5hp2OT6FUt2RmHaGhSFFfxemQKmrY9Dfovyo0qYUXilTi47iTN26oC8urIbIi2Kf66xJgSld/LgchpyMW+TsfYA4o7R234LEKHnc7iWQHPncYT+axGzmVCJazrqk3SjZFSEHc0WTQKQPJfnGFD2aI0xRxe/nvp7t7vqL/cm/aCpcYOmEwhhrdiEiqOvzJtsdMsAyP8ZMf+eA67r2QJwoDGjwbLzt+kpY20gs5SdNjx5fG3F+rlQrGQn7WVL7Er/5g6zQH94a8b+eCq+uH+MRWYSPMGCkgrYHeoR/QV0MwBRuBRQYSBqAsRrCQ8hjjOxFvRQkV2Wa05Xvv98Czpmehi6xujn+cMM/JwQXNc6pJXDrpQQPDqWk+eT1fHxgESgtyJU1OgGWG+AJqTuszrc7mHM19ucDh6tdMrEue0254HawBH2DYhqiZecLl/qL2fyjX8N92/RIRsoUYq8EggMsc52kgZCMqe8dZpbR85bRSnCkS0UKOKepd5hVHF7igUjEVlUKwtgR51EJV781h406LfeahGDqmPBJdPEhGGK6/8ey8G18
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(366016)(376014)(7416014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alFjQlU5aVhVYSs5UHE0TG82OXhXYWVrbTlNRGNmc29QQzNPUlY4Y2dLQXgz?=
 =?utf-8?B?SytTYW9NZUNkK29PWFo2NDJZbnJDWE9UTHAwNDBYV1lnK283WWxLZ1hMdVJB?=
 =?utf-8?B?NU9XdWtOd0Y2TytSbHREYWxGdjFwaTB2WW85bXhGU0RDZk5ZSDZrTTdwaDIy?=
 =?utf-8?B?T2lJV3NESEJLNjQ1MWpKWklUcFFLMjlkT2svRDcrS0ZEWE53ZXl3alI5ZHEw?=
 =?utf-8?B?dDYvVWF2OEVObUptU0xnSjdZMWlUUkU1YjR6eXdGZVNadFNLY3hSTHl2RUND?=
 =?utf-8?B?bHlXQUVsZEhiWFJacE0wVDZtU3dFaHovUWV5NGhsaGx2aURtODBXZFhlNGhU?=
 =?utf-8?B?eWZiOFE4RFpvUTBMRDdwKzEwOWVWblF4UjBJMElOTGJsb3hIWHhjbU5BWW1J?=
 =?utf-8?B?M0JNdEtJZmZnbjFpbnlpNmZvZEZzOThSNXpzMlkvUDVoeXQ1Nm9Sd253ZW9K?=
 =?utf-8?B?MFRwVU8yNFU5bVpWelR2cjFwcXJPQWdpeXdRVW4xRHc4TE9tbmtLejJaKzF0?=
 =?utf-8?B?c1luOHNRS1JrZnNyMWFBZ1BmMWZYUmxMeW9rR0tRQjFMZ3FlYVJNWGRlaEVP?=
 =?utf-8?B?eXh3YURmSmZOTjNZWHZ6NFFXb2FsWXRGSWwveTdrUTd0UkhLSUZ6clFMeUlS?=
 =?utf-8?B?bHF0anVJSjRMbVF2cFpVVUF2aDIzSXBsb2VjVDRxdHhucWVETjJieERCQmJj?=
 =?utf-8?B?SldIRTVzUEJiY3FVblhieTVZZlc1K1JnRlowUDB1QzZiN25nOGhXaDZvME1q?=
 =?utf-8?B?ZEd5TWNMdEtwa1Z1Q2w5eHNnV1BYU0J3aTNYVWdZYUtQMHJSR1laSjlyblRU?=
 =?utf-8?B?eFZDVVErMmk0NmtNOEtkVnVKK1ZQN0VGSEE3WXcyM2JaMFdCdUZBRk5jcEEw?=
 =?utf-8?B?NERvN0FveGM5MXRsZTF0eU5wRnZId2VwODBwc3hMZWRsK2Y0clRDZGlvVEdH?=
 =?utf-8?B?bHFEM3kzRzF1ZVlkQUptOEZNTXlLUVZUL21YOG0rQnpjbkxnUUdFYnhmeFNZ?=
 =?utf-8?B?UytHUXZwQ0hnc2xmZ1ZFVzg4NjZhdkR4Q2NXZEhNU0xKb0szL0RTbUI2SmJP?=
 =?utf-8?B?bm9wem9aYjBmM3daOWYxSnd1Zi9ydUgzcVFLVDVtVTBmbTQ1My9qUDlvV0Zm?=
 =?utf-8?B?aVBueGlXb3JhRWs4OFRNZ2RmY1dDZ2UzbzhyK1JnTWtLQWJodnhnVWJUY1p6?=
 =?utf-8?B?ZWVXc0dEQ1BnTDlvMVRiSFpTZU9ZcWk4QXNXMU15dm5sQjNmc24yaWhvbVhW?=
 =?utf-8?B?aUUyRTNEcUY1akVDcTYreXBDRzdMSWFRMUVXUy81RjVuMTIyVkVtT3k2eVpx?=
 =?utf-8?B?d0hLSnZ0Q0l4b2lianhaNWtPN3c0NnQ0N0hTVkJHRzZFVllzbTV0Q3A1eHlE?=
 =?utf-8?B?bEU2MkVrSmE5L3h5bHRld1g2emE1OVU1RmlLSHB5RHNNdEdOL2dxaXZQK2I2?=
 =?utf-8?B?YUU1c0Q3ZlhabHpaWXpsOWwrQlBOTkhSOEVoQms3b1lzdW51d3VaRXg5NWJo?=
 =?utf-8?B?MDVxTFdCc0c1WUQzbDB4bDcreUZtdkZsTi83bE5EKzlPUDM5dXprV2FWTXlw?=
 =?utf-8?B?dkJkV0pCdU16TVBxK2VDWnFsRDRWalhYRVdYcGpXS1BqVFhKVXlLalZjcm04?=
 =?utf-8?B?UDQwVEJPdjlLaWczMHhIbTdXQXpjUFJFUWRKancrSGRKSHE1SkZGYUdxVHkx?=
 =?utf-8?B?UkJLYVpRVTJZVkRSeUE3TlBYVjFzYmp2RTRFQWo5cDZIcXIxd1BRNFBFb2NR?=
 =?utf-8?B?czVvcFd0TnZoWGp2UGRoMURkR0o1NjdILzlIeUpjNUZTeXM5UjJEZU5pZld0?=
 =?utf-8?B?bU5JTFd3MUMxWGlLY3IwUVFyY0tMR0l3VG96Q3NzSlBPbzQ3bjFRdUgwRUlr?=
 =?utf-8?B?MmpQMFVJRDcyUmoyUG90MnIzSkhlYjdld2FOZUZkMCtRSVptNGRaQ3I1MUhW?=
 =?utf-8?B?bytYR2NDSjdoMTQxcFVNRFpqa3lNd1R5cGhhYkp2ZVdIY2Y1cTZ4c0s2OW1W?=
 =?utf-8?B?L2N6M0I3NGxmZlpUMnA2WTYvbmpvU0ZPMVJDd1M4a1M3eTdGTGMveW9aTmJ1?=
 =?utf-8?B?MVY3OXdVeXB6MzY4V1NyWVlnL3RwN3k3cktXNG1pcm9iWFBkTG5HU1lTRUNY?=
 =?utf-8?B?QURrczNqMmNFMnEwWFR6VXJjblQrSWNab0dWOTBNSWNTcHlteFhSeXJoVlZP?=
 =?utf-8?B?ZGV5dFNhdE11UG1tM2hvZnNIOFRUZHBhUXdyOGJ2Y2hmSkU3Wk9WWEtxUVhs?=
 =?utf-8?B?T05nMktFZTZ1eWFjd1pPVWdXYVZmUitrTHROZWRMcFErKzduVW12RTJNcVBB?=
 =?utf-8?B?WGFzcStqNi9SR280c3ZwTmhRMkVtQzBzSUM1cHEwZ1MrdUJoYldSaStuM1BS?=
 =?utf-8?Q?3HWBw2bTPUWcVu9sFINXyFyaWghZQE5FTzKpbJzoJzLcA?=
X-MS-Exchange-AntiSpam-MessageData-1: ptaiJ7cU3rkH/Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae3760a-07cb-4ee5-800a-08dec80adcef
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 22:43:31.8106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ne2ZTY7VnHYwzJVs0xdt7NNyxRd2TbTHinyxhBHq8QSvNimQyyeDuDWhLk2Rd0/gF41TYFZ8VP6TQVlykLz+ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9055

On Thu Jun 11, 2026 at 2:55 PM JST, Miguel Ojeda wrote:
> Alexandre has been involved with the Rust for Linux project for more
> than a year now. He is one of the main contributors to Nova [1], the
> Rust driver for NVIDIA GPUs, and has authored core Rust infrastructure
> motivated by that work, such as the `num` module with the `Bounded`
> integer type, the `register!` and `bitfield!` macros, as well as
> improvements to abstractions like DMA.
>
> He maintains the nova-core driver, as well as the `RUST [NUM]`, `RUST
> [BITFIELD]` and `RUST [INTEROP]` entries. In addition, he has been very
> active reviewing Rust code in the mailing list.
>
> He also proposed and implemented the `int_lowest_highest_one` feature
> in the Rust standard library [2], which we should eventually use in
> the kernel.
>
> His experience maintaining a major Rust GPU driver and the abstractions
> it needs will be very useful to have around in the future. Thus add him
> to the `RUST` entry as reviewer.
>
> Link: https://rust-for-linux.com/nova-gpu-driver [1]
> Link: https://github.com/rust-lang/rust/issues/145203 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Being part of this community has been a formative experience, and a
genuine pleasure. Thank you Miguel for your role in building it!

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
