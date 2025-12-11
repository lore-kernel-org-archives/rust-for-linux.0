Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012060.outbound.protection.outlook.com [52.101.43.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4234D313E14
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 16:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471750; cv=fail; b=AiRMVeQt90mZOoBqeLIAZt2HO0CAOCOBUEVmp+qcHI5N2Bqbuwm0qLGMXfBzALXxmUMOaCz3hHSuysbuqXxLRKycNQl68SRe0CeqTjv7EF1iFFXYzpuwGiB/OxKnHtYgqoBGWvODqemJiOXu4ElLtXEFTDbUG1ECLJOYI8HM64w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471750; c=relaxed/simple;
	bh=dQ6/w2W76kAayKC1eDBrTagLuGL10Slk+OGrsxfoCy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mhOxnPzIk3FtA6GUa9Tx0yNrim6vVE/brNNJiMEWqq7rH5zKZM6ujv7H326xf+nFee5tIlz819Ix6LHqlJxHHNIbA9vqqG7yK1Nfv5ypsVLNOpMcbG4Qg79+G2xNFuqKs7OmkyNXDZJo6bpDbRuqbf0yQQDb7Q7KoxGtyWvUkhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cntKXqom; arc=fail smtp.client-ip=52.101.43.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cntKXqom"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKhJThmqKd0JR77FZx8zJb4ifMoAGmeNMunC5FPsk34xjA8AmaP4isAjQmpmyLNVTcIefbJoBMPCM61Wdue5+nFPsD1KxN+UlURZUfqqqe2TImhABtkHeXg1y9ZY2+rutS/LmSjVbEAUfDLDJzugK0c/JeuxrVHSKmeMUnJeZbtWvpi7lXr6RjCfgUWNhJ802m3+CGRGM5yt6l8t37VTLD1cNSyFLRV1UtLz0kY25Iu9+YSIFXri/rpa4VH26K0ivzlFEQztRLBMV8j1NNJ6TiFw2qFPp+40QulfIZtnIosEkYLJdQ9tlRv7bbiqhaNWSho9/XG3yCrl2OpHJ4SbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0mhpr75cyW1LylkLUWvNa711FKTdvpupKd/qDOq0BU=;
 b=EfiX5zVlcOJ18kcD+wdYdxk9pU/fCm25iq+O0fhSHiT7HQJSzhg/lGN/3AAGJmvz11dK7BquYVAMbflqTG3Z69JxC8mawRgoSOiN6tb/cd7B3B+LmV+dRAuNFhUwFOFLSpg3xLGIq7ctZATMKPMlkyX07Qr2AaVyp12uFKRr85MHznIOoUoow2ED1UQEg7xUUmqCWUkN2JPnqev6qkMiNXBUAMX6If87rpBKmYtZxzr3SoSA9mn3VxUN35K72dBx4QtGV2TZfopQ8WUQ3awzk3WZc5thdRpcQzPmNOXY6BEd2Uxq3iB94jLBVBYdOwr+WpwGop/rgS2GSMwYGBpUgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0mhpr75cyW1LylkLUWvNa711FKTdvpupKd/qDOq0BU=;
 b=cntKXqomH/wgzy1eFtA8/fubStxwI+S/jywigSnqI6m+dDRSCiIRqw+vM6nTaVJVM/SHVt9I6IsM53CtSyJWgmLigrvju4DmRDkKId2NUufOY4pbX+0zmrjjZFGhkr/nljDd6b8yayTcq4AlC3nT42HLY35Kebvf5ujZocAU1uLPzc2ctQ74Mys1X4vUMoyxfiiCf+qCuQN7OB4RwK+sfx9qCjqunA2BTZWAOWFgWSFToGCiw7z4pzvt9mJRzTy0l6q3agw7SBXJljYkoJ8O8s8RvK66YKzA/Fin9Tfy/8wbjhZwkSicWEfdsEE1YOCuOT0amz+SQqlWUh701JJ4rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV2PR12MB999096.namprd12.prod.outlook.com (2603:10b6:408:353::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 16:49:06 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 16:49:06 +0000
Date: Thu, 11 Dec 2025 11:49:04 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, ojeda@kernel.org, peterz@infradead.org,
	will@kernel.org, acourbot@nvidia.com, a.hindborg@kernel.org,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com,
	tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/4] rust: Add i8 and i16 atomic support
Message-ID: <20251211164904.GA3380881@joelbox2>
References: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
X-ClientProxiedBy: MN2PR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:208:23d::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|LV2PR12MB999096:EE_
X-MS-Office365-Filtering-Correlation-Id: e70d1d04-d7fe-489b-7db5-08de38d532d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DnGzLkLiItniOh0/c8WhXjf55J4mPQly9UkKEVEMwzOV2wxUqhNOi1PWqLsH?=
 =?us-ascii?Q?tDtj5TntFzED+CiPhfi/JxWZeLd0FBT6cATcOPsmYb2+rHvhRqfAGbFKCYXs?=
 =?us-ascii?Q?C5rX/W3VIWa1pmFYOqjWwLPh0NPqGG1XTnY8J2T+g/74f00do/zT0xa/MeRR?=
 =?us-ascii?Q?tCwzJ9c7L1FFDLo3uzbbdaTrkswj9D1VWFv8G5+wn5fW5/T+xCYQUaIUa2wK?=
 =?us-ascii?Q?sLtf34sPEuI8HgOhMs+eaOcIiCAErZUK7gbq9x5RxiVOvf0wzwTdVRCPtkVH?=
 =?us-ascii?Q?BpTVzQyybsjCgDE9/W7Q1SYfPyF9u3qAJyPhu31djOsOi/fDQqDtOphrA7eP?=
 =?us-ascii?Q?Qgwn9lp8BbHOkV0zamThTV4ZwbuLaMxyZgZMPaFVuZjRM4aOmI1/3u77Hwjj?=
 =?us-ascii?Q?+J68p4FdrU7ow7k4dT+k3T8t2+KTajz8Z0BaMYtvAxw5rtTmJqU6jn13DyXf?=
 =?us-ascii?Q?WOzWKdnvpwVdgKOUbY0AnRRJGtMcnj9Rxn+g+5LWK1qhHilWQaW5axhNyP+O?=
 =?us-ascii?Q?v8CI7wUPmpFE1D+z/0cKlHmW9rQrz0qR62v33/s/IYex1SR6o2TSXF/kG4P3?=
 =?us-ascii?Q?iGwxbH/A+qdOZXwyFOZivXySReV9Frg790ZoN6TO1UNdb2ocwlxyNIQb7h/I?=
 =?us-ascii?Q?hYAU20KePwCGc9Ab0LIgabiXqI3FY3tTJLT/e6Q8OYM4BBI++Spk05/DtKyW?=
 =?us-ascii?Q?RgkaCin4GgKnWDgl7DXjx/M+wFFKuG75GpTPnjB7d5AN6oVp5J8cM4QXS47a?=
 =?us-ascii?Q?ymupHUtMcJPubLUOzhi1U2quiCl8DWhCIk/e5E+uUPFgQKao3yOu/QCz8MKH?=
 =?us-ascii?Q?YYm4OgxXpkpuKXyIEthKCiwh8uMwSyrIqxlGAomjl5hikaD5fEv4XjJFk9M+?=
 =?us-ascii?Q?brDO0RHb3TUJ+z1ex9TKB/5VwDKiOYv3zq+MQMN6erPhorqOoQ0k+9lM5XkG?=
 =?us-ascii?Q?Is9OzE7evqpUfcg1LWiIrndJ097CiRWMK4mnOU2mRFy74Wtw3LkAMvJprtLY?=
 =?us-ascii?Q?txOkd0IqyS3FZrp/Ziy1dU5YJDlv1WcuBS0fUtPsdr4gA3Dl21Xi/G8xie28?=
 =?us-ascii?Q?RCBOANvWxD99pGcXeZqqh7OHg3uRZFElbcmkbT7eOQI2JtTD39e0uLs5NVWm?=
 =?us-ascii?Q?nCRsCyAXZHhJ6LzCyAgUhg8A9eeDreWEDd8XVsHhCEQn9ognrL8VIJqvxZ9h?=
 =?us-ascii?Q?YntJ6W4PgIttDcgB4nr70cIlTWq2cdHjMvlNhW7Wp4N+1OgbKf7yy6jNR+Hn?=
 =?us-ascii?Q?mHhzWrCcCohu7FkqWmDjiQARkmJaqwFNZYwDud5oM6cm+MPNFA88mol5J/4M?=
 =?us-ascii?Q?i6u9/bnYJ9MYcmTxPoat70rdW55WEIwhDgmtdwoQWRVDVu7ScGXpha9sdBao?=
 =?us-ascii?Q?72coRpC+6ZKdKV3fc5WXXsJsG+BrGO3UrzthV0ES5pzc0ryBYfYWy1DW8N0u?=
 =?us-ascii?Q?gXs8GvPPkBMGAP35FCvTv+hk4nUwnI5Lwpn85Q5FFWWfkIY/85zgZw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D1LbQYvP1IDIbnKYjJ9QXwIWaY9z5W3iAZBmK4maEHHWPJWbnzRWkAQFKu/H?=
 =?us-ascii?Q?FW66qJhZrYnw5i7UousJsSq+BzIblaxbmOEZWW9T9Gwue+Ba2mE7cELibP3h?=
 =?us-ascii?Q?tFbTnuNN8TOBVt0mvK7CD16JXk1rTVH1OpPSVLMXBJWySZEFT2ba6i6aEA8U?=
 =?us-ascii?Q?a57+eRkdEvEnbsb0d5xwpMznSYFaTfXK2GSdqO5tJQ9RC6g7Ew2i5l+EyQ8G?=
 =?us-ascii?Q?q4o6aOSRuaL5pftyncaLxs7HZE9iasArGKIP2jE5aOsRvgn+kdD4DCWkA5HD?=
 =?us-ascii?Q?DyInZa3YmtWjxKdGjZj35RX6NoYIL0mw6Sq1GmT+AMosTlrlFiWami1xflnW?=
 =?us-ascii?Q?d4ZLAvbdCKfzgh86MFodV+444tZKM9uX3ZnuVYXFUqFp/NSZc/X9ocJWDdj7?=
 =?us-ascii?Q?HL6E6nLf9DxWby3fMrZjeN64adyx54wroXdfpKzkGbE+qULAOQ8GU9XlVdt7?=
 =?us-ascii?Q?KcsbLSVHiaCHfHszgwJ5CdzrFEzJtIZ9JrYwwNKiogGKKCrB1r1CrW1nfv0N?=
 =?us-ascii?Q?aw+/nohdvakBo2n9s7QIPGhp0F3AOsConkCxZxfCU41Tfl5SeRe2sNQtm69+?=
 =?us-ascii?Q?AycYf/DGkV8J/6eqWiqcO6L8jlO0/ekkJtpeVrHga1Jp26svxi+EyTeMXpNT?=
 =?us-ascii?Q?8sRj0H8KgQlH99l5p8ElBlr4gxP21571HVsRsatHIYCMll+oUVGH9Uvwv2Iz?=
 =?us-ascii?Q?lJRCjeCqWHGW4pNMZjIPM890pkRl9KqQA/THvDfyjt4GnWr4hXSETPt6mWVR?=
 =?us-ascii?Q?3jfRfdSH8XcCAGvuJYI/CKmn6QJj4jcvEsZErycIYzBzUmSyN3w9IskgJoMs?=
 =?us-ascii?Q?RaiW+ieokezdyi5waSiVVFS3FpimOtyXwX6aciPQI73oKjTN6s1uEdhs0Jmd?=
 =?us-ascii?Q?htmp+LVZh46DDIheP1A9rkYD8450sw88GrXhaI109lHuv7YZzQg3erw6Qlew?=
 =?us-ascii?Q?+YJYb/9yw3ywMBS2MVRHL9a0tT1zAYBYPSAbWBV/HmcDBnFsaAXqzjgSbXN2?=
 =?us-ascii?Q?Le/dOJ8MqitB2rO29TQeElusyYcrCfRc72QHBxl5f5LynDPVJN3lPyTApzcf?=
 =?us-ascii?Q?4xYZQEGGm+knQC1khkwY5kdhobc1waJGgVx/Iq+nAGVwWW9ucSjscv/I/2Dt?=
 =?us-ascii?Q?mtGCONp98i+6qR+FrngYdKuscR6wQI7Kz/XTlPH0eHU9hSJ3csJXSyKU2YdS?=
 =?us-ascii?Q?TbZmEnbtkATUDPX+v0OMxuqn5Zi7bdP8y2IcggUAEAeEMLUCvvYCBRaeJmLv?=
 =?us-ascii?Q?+VPVAvtZ/tjHQwggKaCHJQoyuTAFNau/Hqe4y9ECOiMjJ+xD23008DsLk6nd?=
 =?us-ascii?Q?qs7gmrgy1AdUajjiG81sU/FmZkDMnjF97qxxy7OEjNFINsjdk2MZrCYpshxl?=
 =?us-ascii?Q?kufgsoGiHHTtW3gDIpMbpNYRCTsR2KXCtWZlAaq9n+HtccOHOulCUIAFVn5x?=
 =?us-ascii?Q?s0sep/6J2i1nEBU3mnvAyXA73xJ2hIKjFGTuH4HvUZcs736APpqf26r7QzmB?=
 =?us-ascii?Q?b8titxQdkdYlY8A5LsT0ts5e+O9BxMl163xfPJc9iF0V11JXONWr7oUjtfs3?=
 =?us-ascii?Q?JySUyjnGj3wh0/rkHbxrk7WlWYmRbEb1d+FAzOOD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70d1d04-d7fe-489b-7db5-08de38d532d8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 16:49:06.6536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaGQ+9MtSRA6zUwGwr87D3BZ3PCzEmDf6MK2MGKSrTp+KACO5kisOgu+Dzgkc7xI059QUpXZ3EaIkw8g4xaptQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999096

On Thu, Dec 11, 2025 at 08:38:22PM +0900, FUJITA Tomonori wrote:
> This adds Atomic<i8> and Atomic<i16> support; including
> load/store(Relaxed) and load(Acquire)/store(Release) operations.
> 
> Relaxed operations are implemented in C's READ_ONCE() and
> WRITE_ONCE() macros.
> 
> load(Acquire)/store(Release) use C's smp_load_acquire() and
> smp_store_release() macros. They internally use the appropriate
> architecture-specific instructions.
> 
> v3:
> - Move i8/i16 AtomicImp next to i32/i64 with the comments updated
> - Add a comment about leaving the existing macros untouched
> - Add __rust_helper for helpers
> - Update commit messages about atomic_ext.c instead of atomic.c
> v2: https://lore.kernel.org/rust-for-linux/20251117001035.4068507-1-fujita.tomonori@gmail.com/
> - Implement relaxed operations by using C's READ_ONCE/WRITE_ONCE
> - Rename smp_load_acquire() and smp_store_release() helpers
> - Simplify the macro to generate atomic methods
> v1: https://lore.kernel.org/rust-for-linux/20251115050305.3872412-1-fujita.tomonori@gmail.com/
> 
> FUJITA Tomonori (4):
>   rust: sync: Add i8/i16 atomic_load_acquire/atomic_store_release
>     helpers
>   rust: helpers: Add i8/i16 relaxed atomic helpers
>   rust: sync: atomic: Add i8/i16 load and store support
>   rust: sync: atomic: Add store_release/load_acquire tests

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

thanks,

 - Joel



> 
>  rust/helpers/atomic_ext.c            | 44 ++++++++++++++++++
>  rust/helpers/helpers.c               |  1 +
>  rust/kernel/sync/atomic/internal.rs  | 69 ++++++++++++++++++++++++++--
>  rust/kernel/sync/atomic/predefine.rs | 24 +++++++++-
>  4 files changed, 132 insertions(+), 6 deletions(-)
>  create mode 100644 rust/helpers/atomic_ext.c
> 
> 
> base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
> -- 
> 2.43.0
> 
