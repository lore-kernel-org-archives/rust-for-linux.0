Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021097.outbound.protection.outlook.com [52.101.95.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE1F32AAC2
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 17:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765474669; cv=fail; b=c5zKAbjw/o6TBvyqdN5W/syk2ydYVEsUA7F4+qT/LL4P8YrmtZ+NOhBCQ/HhZLVHmun8PWP+FpNyPZLv0jZ73l0DpRLFNCZJ0W6bst7pJ1zUqf8IX+ww1RBS5qQAqjNU301xWL3OwO6PSdTnnkDSiMKHXQRpJZ3j80GUqTBZFO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765474669; c=relaxed/simple;
	bh=6bcYpPdfMAehjeQqIva07qA06VPXb3Q6ibMf0y1Co7s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oe2E1yHtYW0bCL8kQ6o/VDtMEg1MQ3Walwycbk1w0c7xpCXnBSCa9VEtmvMsB4H6RZKhUur8butGmvVoeIXw3A4n2vzAX4zy/B2q5ChKV0TOt0HX8CfISlKt9zacuuhejucY+TFxktlcXaD6O62hxfaDIJgVI3KWwmT/oIkI04o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=wa35JbpJ; arc=fail smtp.client-ip=52.101.95.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="wa35JbpJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doUAG8XK2Z5TGdSVVrFQKOuZLKEUlT6PMpoZ4zyhtaI9K5juNVrcS07yihwnVa/7oDYNqrhdf/5iPiMdJBiMH7qLB36Ry8WUUBA2yE9hXJDe36Cns1LhcmHRfbBwdUMz19tTE0qNqPWvFvpqF093IBYeZGe8nIkYuxfUzZ54XMDAud76kReb0ulHTUEWAJ9tu6RyGiNAov24/Tu34gexu1vCyZljslAfAn0tgwg+FJYoO5i7yuRz8mb5S2OvZPRsjzrLl6r71Ykns+i2bkQaK3JmHEtilbgXfCyCBwp2kvqK/KrgLfhk/qc9ragVmWoB8Tzz8kIAukQt+fs9+jPkFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0CdHzuqZcuvbI4gqXJb/5bh2YtyhUDNTxk3iHtPmnw=;
 b=lIagioLsEMRuhTp93+HLlxcxr71ccAuw1Z2fr57U9l40oFr7NgVxUiulyUAUocLXWn2mY1dlCUyz3AShym4/4Vmn6vhsfkjPyzQZuMKL+XVDXMnMY8LrxGc8EkKvTiia4hmpTN0xaK/aly94vZNs6GK+HVFMOzpXgyX6LdwVz1D6knUMMg+S84Bji4weaBOEqmPCJYyDoYyqTNSLKQNvI6Aawpp66cz5FmYFtDyuqDXjNbQoUtfcNjTr0uVQfABFCO9jbGnFpN2p9VGFciJ3JTrvSxNrZHlV+dmLF8zeiDjD3y8auWX1yh18Q+OMvjdR7L/4T7yFbqBQhL3MvGRVQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0CdHzuqZcuvbI4gqXJb/5bh2YtyhUDNTxk3iHtPmnw=;
 b=wa35JbpJK42olxfH6YLhjAjdi3oKyT1WOq9yD6+rjij8LJDNyJnQz9MiSbh0l6p/3GsiYPvF5GnKjpD17TeZfiu0IkA/Y/tskTNdFaphJHLzyRoZ/XDF/uR9RcDVepeM9Nk4kWJMG3QcV8xMCo5jmenFQw+6IoHAx6QS9zE9NBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO2P265MB2783.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 17:37:44 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 17:37:44 +0000
Date: Thu, 11 Dec 2025 17:37:42 +0000
From: Gary Guo <gary@garyguo.net>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, ojeda@kernel.org, peterz@infradead.org,
 will@kernel.org, acourbot@nvidia.com, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/4] rust: Add i8 and i16 atomic support
Message-ID: <20251211173742.199ace36.gary@garyguo.net>
In-Reply-To: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
References: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::29) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO2P265MB2783:EE_
X-MS-Office365-Filtering-Correlation-Id: d73fb4b6-11e8-4f6f-8358-08de38dbfdf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YEIonFMTHIeky3LwSaXnW9TfRQImU0JjZLtdVv7HXm622rhOPIxceOZOdkxh?=
 =?us-ascii?Q?X3LVQ8nYpRbevQ8WB77ShO09kL2Z4Rf24Ibja91Ih8U48lA/3WcqeTtFi9rR?=
 =?us-ascii?Q?ubdmCZQFRyqTCdAqzqJ3eRRAkBHRQxohilSofweJ+CCVg+/fJeO62ZcUQbSH?=
 =?us-ascii?Q?cmiHx2KMhwlN6up2Yq9trgeQQGbTCMssfv+rOuTRX90WKObzdx9ba87+PNcR?=
 =?us-ascii?Q?ikNDiwhyXqOyY7BcXld7cjrX3nVgNDX/x78wY7UEfw+XwGOxXBeSuVzPunOP?=
 =?us-ascii?Q?pEXRXCYEGOqjBf/fDfXZn5MCym4VMxDP8zAXKZvzyeXa19XKCQXKo8uktnFg?=
 =?us-ascii?Q?6xVcnH8ErxqBJI+j9+uSiywa9s5Gqkat0sKyJwRZ6EZ/8VfCHoG8jvcPIhWy?=
 =?us-ascii?Q?EiumX2cHXs/3r2DYOP6jJO04AiggSZcV0/vPtsDkKR9WaJoZZM/T8SKLSpey?=
 =?us-ascii?Q?KV167GlYn7t12mowUjT8R4owEmLzWn0RdQlXU/oPIso0i1En16OFi1NHSM3U?=
 =?us-ascii?Q?9axhSnyH05ZlJ66Qmw517OcGlPl4zusWrArC0Isb1j7REsOeI8LptgrmEnho?=
 =?us-ascii?Q?nvZfcgNeNWfoLo2UizKJD7jY1Ajv89f8VeySxw5ygt0gYc1eFcXYi3Nrx51E?=
 =?us-ascii?Q?DqxYCbfYqy6+0Gy4NyX1sfQaTEtK9FV5gSDU+1PuVW8ZUUW17tccNsCsZBfF?=
 =?us-ascii?Q?3ucXGDqX7522CyA5Atu6KEb11Sm0zCLa869+y+Zac2/waOPx1/r8Q5k0LCT+?=
 =?us-ascii?Q?yGHId+dDluhXMmM6L5BE7GpV6LExGXMh0j83jATg9E/xJ8/3vxCaFpFaOQny?=
 =?us-ascii?Q?aosNZWmW+FdFZ79KuWXehufd8Wye1u0OPa2c3Hy7whKLXuUUUZkD2s1VEBkS?=
 =?us-ascii?Q?d5/aMsUlMkD72prNi4ax76frsD3L2rG+Lh0qyoT4GEE7qUEiCW672tlWmXeb?=
 =?us-ascii?Q?OLfylbByVi8qFkoypyUfrGwUIuhO6CrLP1jv23rL5KSF88bWekaEWClo7kU/?=
 =?us-ascii?Q?59FU+eqBQFh4qO55BtGyxaS5wvOHeop0AgEzGnH/o8/rnAH1QaBOGf/LA7ko?=
 =?us-ascii?Q?BK4ICH5bxUMlq8zCRlLtlsvxUn9TVbFmiQ3klgiLgeeJrLB8aWjmsaXrTxNt?=
 =?us-ascii?Q?r6E2Jldta8tMAXwpjPpJVdBCYnZVVAh4gBPstHOnAlL8su4L6PuswmshiKL+?=
 =?us-ascii?Q?phj9ixyrxij8Q/6ADeBs/BLKyOIU4+j3GsuY0bmy/vUySCVJJXzttuACOGla?=
 =?us-ascii?Q?ZW0KGKo4YaIYOKP8Q0eEyhtek5w7dD8i1Ab+jIJ1cu/dlAe4569X5VnCCBfz?=
 =?us-ascii?Q?MqFQIXm4m8q4zaihQWY+YqPfNB+HZQB3oI6+/+e0nrb2j25ILLYUlK5ragDb?=
 =?us-ascii?Q?ieXMhlXhszzh9eJcU8gKAbPmSWXl39a0a56aRy6c/vFCXkRRIF2N/W3IyiKi?=
 =?us-ascii?Q?u84f0ae4/3ZrkYb5zRzmffLHa5JkZgr63+EKd7vQOdY0ZAyWdG6T2w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JVjr0zKl0IDMztGO0706duXKcAl0NMpjCB/AKbdo44QqN8o6J77gvDOPHZyv?=
 =?us-ascii?Q?DPagJVzNBZcbuVT78q3jucUvbdp5JbJHm4TYySJERftYC/LPZ/fjTk/LSOVs?=
 =?us-ascii?Q?hVYy/pWHvkM303x0a6tbm+xi41Xki0LAVQld4hYdpADy5vVKBzVXdNDaBiyn?=
 =?us-ascii?Q?Xfix8oHnL2TCQ5uMkS7qWM97iedyYLkFePKNLCM13myO5AbbeXgyFs87lmTW?=
 =?us-ascii?Q?tRElFZaY9tTF8O8e7wVm3kDf4hHv0Vb8wrTcB3ddZSLW+MiZv/TrBnrFGb7U?=
 =?us-ascii?Q?j8hx9WS98f5aWFUSbmvNjUBwphv5Lj/oRX3xzBP/BrR2Oj471sXuDspFzFvh?=
 =?us-ascii?Q?KG1WcdbDawYYqLxHJMSmw9UvVbhbvH/xdK2vH+5w4Fuj60a9frSMunmdAtEY?=
 =?us-ascii?Q?mkt9qep+R5dBcfA/oH4azRY4N/OnpUDiBF3aohzmQwA8HhqO7mH43CBz89Q+?=
 =?us-ascii?Q?eOO5kuAGc/E3LfwUhzY17V3BOG+G9VgnXFmkgZiXjSFdCivt8ya1ZLMbW6tZ?=
 =?us-ascii?Q?wRVPsxO/08eY9WsXnNZ/R5/yNnRz3GbpToV13ixOL2RP0du4aEZioYJrzVfr?=
 =?us-ascii?Q?IuEmDv2FSFibZuWPqdOq2N3StdFHfqi0KnrrYn/nIhGHJeG1jH/c3MaTt8OL?=
 =?us-ascii?Q?DrtBQSe1ZlA5WGW6Dlf7GeEFzoDoBSDd5BI5MrUS2DYtoZNmbMV5ScbRQuDq?=
 =?us-ascii?Q?8oSHr4SbXBUYIujGgm4T4OUzCPdjRe1pso8xs6FEFCkWIeIS+TSGxB4ZgI4c?=
 =?us-ascii?Q?vN3l9NrcYmxjxPdULRh5JzwgmWiaUsvsOUjwTsYuHBRuKnb1JHST6UOnc7NR?=
 =?us-ascii?Q?L10kj/5Zz1XRzusv7IkzZtDiB3ts44LL6/Pr3xwP1LQRLcJ8F/MXCcherl8K?=
 =?us-ascii?Q?SO9sRrO5oPTdWVBSiK2j/w0FAXGP+H2aemTycNCqIJVNnCXrcG1ph1OPxzid?=
 =?us-ascii?Q?K7JluFokfPSl93CZO4HEm2Z479UYmkvQzyOunK6RKRpECfoZ+S/RrvN3+1SH?=
 =?us-ascii?Q?SOvJwQq/LpD4s1+mT2xKBDWNoH0pd6Qq0xqzko/mUvB7KuzNJ7dleWDcg6JY?=
 =?us-ascii?Q?8fK33KfH4c+bhrSEWa4e+vwlxj9ykwR8adgjGx2uY2kRXQSdxHmjWS6TF9Nr?=
 =?us-ascii?Q?CvpStNbyouiJ9PG5FwGFtcAbvUD4ybOX1VrmU7g2xvKSmYkNaLf8cK29oUu0?=
 =?us-ascii?Q?ml5FKOVrVjaURrheWm+KvlqRb6or62htthIQCahyx6EptBFt5lTVrLutOIV0?=
 =?us-ascii?Q?6rpaVYq1DuiAYFe5HPyz3RRQ7Qal8KTIWfT/yGygsah5ke51EGpz8Ju4oO51?=
 =?us-ascii?Q?bRF1HCUJ1znXhiLVNFTJDmoVtg3EdWdEg344S1tcyuSWkhPHB05GMqdoD94b?=
 =?us-ascii?Q?2/AxrKLKfhCXyE7+F9hQarro6wUKDJLrzYQiKV75yyhiAZY3US1L91I3mrd2?=
 =?us-ascii?Q?XLHr/pZgespZLKwz/lNl6GVYuJYQBUaLKX4do9GddKlpJB1FzEfNFyKOcp4o?=
 =?us-ascii?Q?H7RhDjqNgJLoCR9tA8or+1losUvP7WSxiMtmkrvx6+xp+JijYnn+ca1UCsqj?=
 =?us-ascii?Q?OSfmZC90NeMIeZpKzy/6dQaHCMY+iG0EJrvVmYtw?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d73fb4b6-11e8-4f6f-8358-08de38dbfdf4
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 17:37:44.4304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AljX7GjrrgGud5Urhd3pVdi6oZCmWNM9iKCT1glJclt4YbCJCYYYEav5Ci2pDVDWstUaZDTti9KVtnkcO6k/tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2783

On Thu, 11 Dec 2025 20:38:22 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

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

Thanks for the work. I discussed with Boqun off-list about whether the
RAED_ONCE/WRITE_ONCE should be helpers and he convinced me that we
should start with helpers to begin with. So the series LGTM.

Reviewed-by: Gary Guo <gary@garyguo.net>

> 
> FUJITA Tomonori (4):
>   rust: sync: Add i8/i16 atomic_load_acquire/atomic_store_release
>     helpers
>   rust: helpers: Add i8/i16 relaxed atomic helpers
>   rust: sync: atomic: Add i8/i16 load and store support
>   rust: sync: atomic: Add store_release/load_acquire tests
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

